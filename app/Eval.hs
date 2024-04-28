module Eval where

import AST
import Context
import Type
import Value

import Data.Bits
import Data.Maybe
import Data.Ord

import Control.Monad
import Control.Monad.State

type Eval a = State EvalContext a

evalN :: Int -> Mode -> [Value]
evalN num mode =
  let ctx =
        execState
          (evalMVars $ modeVars mode)
          (funcContext $
           map
             (\f -> (funcName f, (map paramName (funcParams f), funcBody f)))
             (modeFuncs mode))
   in evalState (replicateM num $ evalExpr (modeMain mode)) ctx

eval :: Mode -> Value
eval = head . evalN 1

evalMVars :: [MVar] -> Eval ()
evalMVars = foldM (const evalMVar) ()

evalMVar :: MVar -> Eval ()
evalMVar (MVar id _ expr) = do
  v <- evalExpr expr
  modify $ extendMVar (id, v)

evalExpr :: Expr -> Eval Value
evalExpr (ExprLit num) = return $ val
  where
    val
      | num > 0 =
        ValBits
          (ceiling $ logBase 2 $ (fromIntegral num) + 1)
          (fromIntegral num)
      | num == 0 = ValBits 1 0
      | num < 0 = ValBits width ((fromIntegral num) `mod` (2 ^ width))
    width = bitWidth num
evalExpr (ExprRLit num) = return $ ValRange num
evalExpr (ExprBlock vars exprs) = do
  evalVars vars
  foldM (const evalExpr) ValVoid exprs
evalExpr (ExprVar id) = do
  ctx <- get
  let Just v = lookupVar id ctx
  return v
-- type checker ensures variable lookup will always succeed
evalExpr (ExprAssign (LValId id) expr) = do
  val <- evalExpr expr
  modify $ replaceVar id val
  return val
-- do not match array index
evalExpr (ExprIf pred expr1 expr2) = do
  bool <- evalPred pred
  if bool
    then evalExpr expr1
    else evalExpr expr2
evalExpr (ExprUnOp (UnOpTransmute (Just l) (Just u)) expr) = do
  val <- evalExpr expr
  let ValRange i = val
  return $ ValRange $ clamp (l, u) i
evalExpr (ExprUnOp (UnOpShrink (Just width')) expr) = do
  val <- evalExpr expr
  -- can't pattern match in monadic assignment?
  case val of
    ValBits width num -> return $ ValBits width' ((2 ^ width' - 1) .&. num)
-- not handling case of width' = Nothing
evalExpr (ExprUnOp (UnOpExtend (Just width')) expr) = do
  val <- evalExpr expr
  -- can't pattern match in monadic assignment?
  case val of
    ValBits width num -> return $ ValBits width' num
-- not handling case of width' = Nothing
evalExpr (ExprUnOp (UnOpSignExtend (Just width')) expr) = do
  val <- evalExpr expr
  case val of
    ValBits width num ->
      if testBit num ((fromIntegral width) - 1)
      {-
        subtraction should be fine, since an invariant we maintain is that
        the width of all values least 1 (so we can get at least the 0th bit)
      -}
        then return $
             ValBits width' $
             foldr
               (.|.)
               num
               [bit (fromIntegral i) | i <- [width .. (width' - 1)]]
        else return $ ValBits width' num
evalExpr (ExprBinOp op expr1 expr2) = do
  val1 <- evalExpr expr1
  val2 <- evalExpr expr2
  case (val1, val2) of
    (ValBits width num1, ValBits _ num2) ->
      return $ ValBits width $ mod (op' num1 num2) (2 ^ width)
      where op' =
              case op of
                BinOpAdd -> (+)
                BinOpSub -> (-)
                BinOpBitAnd -> (.&.)
                BinOpBitOr -> (.|.)
                BinOpBitEor -> xor
    (ValRange num1, ValRange num2) -> return $ ValRange $ op' num1 num2
      where op' =
              case op of
                BinOpAdd -> (+)
                BinOpSub -> (-)
evalExpr ExprVoid = return ValVoid
evalExpr (ExprCall f args) = do
  argv <- mapM evalExpr args
  ctx <- get
  let Just (params, expr) = lookupFunc f ctx
  let locals = zip params argv
  let ctx' = setLocals locals ctx
  let (v, ctx'') = runState (evalExpr expr) ctx'
  put $ setLocals (lvarDict ctx) ctx''
  return v
evalExpr (ExprConstruct id args) = do
  argv <- mapM evalExpr args
  return $ ValUser id argv
evalExpr (ExprMatch expr cases) = do
  val <- evalExpr expr
  -- evaluate guard
  let ValUser id vals = val
  -- find the correct case
  let Just (xs, expr') =
        lookup id (map (\(PatData id' xs, exp) -> (id', (xs, exp))) cases)
  -- want to use flip
  forM (zip xs vals) (\(id, val) -> modify $ extendLocal (id, val))
  evalExpr expr'
evalExpr _ = undefined

evalVars :: [Var] -> Eval ()
evalVars = foldM (const evalVar) ()

evalVar :: Var -> Eval ()
evalVar (Var id _ expr) = do
  val <- evalExpr expr
  modify $ extendMVar (id, val)

evalPred :: Pred -> Eval Bool
evalPred (PredLit bool) = return bool
evalPred (PredUnOp PredNot pred) = do
  bool <- evalPred pred
  return $ not bool
evalPred (PredBinOp op p1 p2) = do
  bool1 <- evalPred p1
  bool2 <- evalPred p2
  return $ op' bool1 bool2
  where
    op' =
      case op of
        PredAnd -> (&&)
        PredOr -> (||)
evalPred (PredComp op e1 e2) = do
  val1 <- evalExpr e1
  val2 <- evalExpr e2
  case (val1, val2) of
    (b1@(ValBits _ v1), b2@(ValBits _ v2)) ->
      if isSignedComp op
        then return $ op' (bitsToSigned b1) (bitsToSigned b2)
        else return $ op' (fromIntegral v1) (fromIntegral v2)
    (ValRange i1, ValRange i2) -> return $ op' i1 i2
  where
    op' =
      case op of
        CompEq -> (==)
        CompNeq -> (/=)
        CompLe -> (<)
        CompLeq -> (<=)
        CompGe -> (>)
        CompGeq -> (>=)
        CompLeS -> (<)
        CompLeqS -> (<=)
        CompGeS -> (>)
        CompGeqS -> (>=)
evalPred (PredPressed _ _) = return False
evalPred (PredHolding _ _) = return False

isSignedComp :: CompOp -> Bool
isSignedComp CompLeS = True
isSignedComp CompLeqS = True
isSignedComp CompGeS = True
isSignedComp CompGeqS = True
isSignedComp _ = False

bitsToSigned :: Value -> Int
bitsToSigned (ValBits num val) =
  if testBit (fromIntegral val :: Int) ((fromIntegral num) - 1)
    then -2 ^ (num - 1) + (clearBit (fromIntegral val) (fromIntegral num - 1))
    else fromIntegral val

bitWidth :: Int -> Word
bitWidth i
  | i > 0 =
    let bits = ceiling $ logBase 2 $ (fromIntegral i) + 1
     in constant bits
  | i == 0 = constant minBits
  | i < 0 =
    let bits = ceiling $ logBase 2 $ (abs $ fromIntegral i) + 1
     in constant bits
  where
    constant x = max x minBits
