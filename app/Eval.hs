module Eval where

import AST
import Data.Bits

data Value
  = ValBits Word Word -- width, value
  | ValRange Int
  deriving (Show)

type Env = [(Id, Value)]

newEnv :: Env
newEnv = []

eval :: Expr -> Value
eval = evalExpr newEnv

evalExpr :: Env -> Expr -> Value
evalExpr _ (ExprLit n)
  | n > 0 =
    ValBits (ceiling $ logBase 2 $ (fromIntegral n) + 1) (fromIntegral n)
  | n == 0 = ValBits 1 0
  | n < 0 = ValBits w ((fromIntegral n) `mod` (2 ^ w))
  where
    w = max 1 $ ceiling $ logBase 2 $ fromIntegral $ abs n
evalExpr env (ExprIf p e1 e2) =
  if evalPred env p
    then evalExpr env e1
    else evalExpr env e2
evalExpr env (ExprUnOp UnOpTransmute e) = evalExpr env e
evalExpr _ _ = undefined

evalPred :: Env -> Pred -> Bool
evalPred _ (PredLit bool) = bool
evalPred env (PredUnOp PredNot pred) = not $ evalPred env pred
evalPred env (PredBinOp op p1 p2) = op' (evalPred env p1) (evalPred env p2)
  where
    op' =
      case op of
        PredAnd -> (&&)
        PredOr -> (||)
evalPred env (PredComp op e1 e2) =
  case (evalExpr env e1, evalExpr env e2) of
    (b1@(ValBits _ v1), b2@(ValBits _ v2)) ->
      if isSignedComp op
        then op' (bitsToSigned b1) (bitsToSigned b2)
        else op' (fromIntegral v1) (fromIntegral v2)
    (ValRange i1, ValRange i2) -> op' i1 i2
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
bitsToSigned (ValBits n v) =
  if testBit (fromIntegral v :: Int) ((fromIntegral n) - 1)
    then -2 ^ (n - 1) + (clearBit (fromIntegral v) (fromIntegral n - 1))
    else fromIntegral v
