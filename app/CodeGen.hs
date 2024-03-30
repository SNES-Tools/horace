module CodeGen where

import Data.Unique

import AST
import Instructions

type Context = [(Id, Type)]

codeGen :: Prog -> IO [Instruction]
codeGen = codeGenExpr []

codeGenExpr :: Context -> Expr -> IO [Instruction]
codeGenExpr ctx (ExprLit num) = return [LDA $ Imm16 (fromIntegral num)
codeGenExpr ctx (ExprBlock vs es) =

codeGenVars :: Context -> [var] -> IO (Context, [Instruction])
codeGenVars ctx vars

newLabel :: IO String
newLabel = do
  x <- newUnique
  return $ "label" ++ (show $ hashUnique x)

newLabel' :: String -> IO String
newLabel' s = do
  x <- newUnique
  return $ s ++ (show $ hashUnique x)
