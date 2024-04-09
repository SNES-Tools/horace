module Eval where

import AST
import Context
import Type
import Value

import Data.Bits
import Data.Maybe

import Control.Monad
import Control.Monad.State

type Eval a = State Env a

evalN :: Int -> Mode -> [Value]
evalN num (Mode _ ms e fs) =
  let ctx = Context (funcDict fs) (mstateDict ms) []
   in evalState (replicateM num $ evalExpr e) ctx

eval :: Mode -> Value
eval = head . evalN 1

-- states
mstateDict :: [MState] -> [(Id, Value)]
mstateDict ms = zip (map mstateId ms) vs
  where
    vs = map evalMState ms
    mstateId (MState id _ _) = id

funcDict :: [Func] -> [(Id, ([Id], Expr))]
funcDict = map (\(Func id params _ expr) -> (id, (map idOfParam params, expr)))
  where
    idOfParam (Param id _) = id

{-
  evaluation of state initializers is in the empty context, i.e. state bindings
  don't see the results of other bindings. (because it should be constantly
  foldable)

  that is why it is a pure computation
-}
evalMState :: MState -> Value
evalMState (MState id _ expr) = evalState (evalExpr expr) emptyContext

-- could be inlined with call?
--evalFunc :: Func -> Eval Value
--evalFunc (Func id ps _ expr)
-- expressions
evalExpr :: Expr -> Eval Value
evalExpr expr@(ExprLit num) = return $ val
  where
    val
      | num > 0 =
        ValBits
          (ceiling $ logBase 2 $ (fromIntegral num) + 1)
          (fromIntegral num)
      | num == 0 = ValBits 1 0
      | num < 0 = ValBits width ((fromIntegral num) `mod` (2 ^ width))
    width = bitWidth num
evalExpr (ExprBlock vars exprs) = do
  evalVars vars
  foldM (const evalExpr) ValVoid exprs
evalExpr (ExprVar id) = gets $ lookupContext' id
-- type checker ensures variable lookup will always succeed
evalExpr (ExprAssign (LValId id) expr) = do
  val <- evalExpr expr
  modify $ replaceContext id val
  return val
-- do not match array index
evalExpr (ExprIf pred expr1 expr2) = do
  bool <- evalPred pred
  if bool
    then evalExpr expr1
    else evalExpr expr2
evalExpr (ExprUnOp (UnOpTransmute _ _) expr) = evalExpr expr
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
  -- pure computation of function!
  ctx <- get
  let func = lookupFuncContext' f ctx
  case func of
    (params, expr) -> do
      let locals = zip params argv
      let ctx' = Context [] [] locals
      return $ evalState (evalExpr expr) ctx'
evalExpr _ = undefined

evalVars :: [Var] -> Eval ()
evalVars = foldM (const evalVar) ()

evalVar :: Var -> Eval ()
evalVar (Var id _ expr) = do
  val <- evalExpr expr
  modify $ extendContext id val

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
