module CodeGen where

import Control.Monad
import Data.Unique

import AST
import Instructions

type Context = [(Id, Type)]

codeGen :: Prog -> IO [Instruction]
codeGen = codeGenExpr []

codeGenExpr :: Context -> Expr -> IO [Instruction]
codeGenExpr ctx (ExprLit num) = return [LDA $ Imm16 (fromIntegral num)]
codeGenExpr ctx (ExprBlock vars exprs) = do
  vars <- codeGenVars ctx vars
  case vars of
    (ctx', code) ->
      foldM
        (\code expr -> do
           code' <- codeGenExpr ctx' expr
           return $ code ++ code')
        code
        exprs
codeGenExpr ctx (ExprVar id) =
  let off = lookupOffset id ctx
   in return [LDA $ Stack (fromIntegral off)]

codeGenVars :: Context -> [Var] -> IO (Context, [Instruction])
codeGenVars ctx =
  foldM
    (\(ctx, code) var -> do
       x <- codeGenVar ctx var
       case x of
         (ctx', code') -> return (ctx', code ++ code'))
    (ctx, [])

codeGenVar :: Context -> Var -> IO (Context, [Instruction])
codeGenVar ctx (Var id typ expr) = do
  code <- codeGenExpr ctx expr
  let code' = code ++ [PHA]
  return ((id, typ) : ctx, code')

lookupOffset :: Id -> Context -> Word
lookupOffset = lookupOffset' 0
  where
    lookupOffset' off id ((id', typ):ctx) =
      if id == id'
        then off
        else lookupOffset' (off + offset typ) id ctx

offset :: Type -> Word
offset = const 2

codeBlockSize :: [Instruction] -> Word
codeBlockSize = sum . map sizeof

newLabel :: IO String
newLabel = do
  x <- newUnique
  return $ "label" ++ (show $ hashUnique x)

newLabel' :: String -> IO String
newLabel' s = do
  x <- newUnique
  return $ s ++ (show $ hashUnique x)
