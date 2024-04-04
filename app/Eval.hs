module Eval where

import AST
import Type

import Data.Bits
import Data.Maybe

import Control.Monad
import Control.Monad.State

data Value
  = ValBits Word Word -- width, value
  -- in invariant we will maintain is that all bits beyond the width in value
  -- are all zero
  | ValRange Int
  | ValVoid
  deriving (Show)

type Env = [(Id, Value)]

type Eval a = State Env a

newEnv :: Env
newEnv = []

replace :: (Eq a) => a -> b -> [(a, b)] -> [(a, b)]
replace a b (x@(a', _):xs) =
  if a == a'
    then (a', b) : xs
    else x : (replace a b xs)
replace _ _ [] = undefined

eval :: Expr -> Value
eval expr = evalState (evalExpr expr) newEnv

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
    Right (TypeLit width _) = typeofExpr emptyContext expr
evalExpr (ExprBlock vars exprs) = do
  evalVars vars
  foldM (const evalExpr) ValVoid exprs
evalExpr (ExprVar id) = gets $ (fromJust . lookup id)
-- type checker ensures variable lookup will always succeed
evalExpr (ExprAssign (LValId id) expr) = do
  val <- evalExpr expr
  modify $ replace id val
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
evalExpr _ = undefined

evalVars :: [Var] -> Eval ()
evalVars = foldM (const evalVar) ()

evalVar :: Var -> Eval ()
evalVar (Var id _ expr) = do
  val <- evalExpr expr
  modify $ (:) (id, val)

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
