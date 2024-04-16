module CodeGen where

import Control.Monad
import Control.Monad.State

import AST
import Context
import Instructions
import Type
import Unique

codeGen :: Mode -> [Instruction]
codeGen mode = evalState (codeGenExpr emptyContext (modeMain mode)) 0

codeGenExpr :: CodeContext -> Expr -> Unique [Instruction]
codeGenExpr ctx (ExprLit num) = return [LDA $ Imm16 (fromIntegral num)]
codeGenExpr ctx (ExprBlock vars exprs) = do
  vars' <- codeGenVars ctx vars
  let (ctx', varsCode) = vars'
  exprsCode <-
    foldM
      (\code expr -> do
         code' <- codeGenExpr ctx' expr
         return $ code ++ code')
      []
      exprs
  -- potential danger: may clobber processor status flags
  let pullCode = replicate (length vars) PLX
  return $ varsCode ++ exprsCode ++ pullCode
codeGenExpr ctx (ExprVar id) = do
  let off = lookupOffset id ctx
  -- assume its on the stack
  if off >= 256
    -- error here to preempt an assembler error, but why?
    then error "stack offset of variable out of bounds"
    else return [LDA $ Stack (fromIntegral off)]
codeGenExpr ctx (ExprAssign (LValId id) expr) = do
  code <- codeGenExpr ctx expr
  let off = lookupOffset id ctx
  if off >= 256
    then error "stack offset of variable out of bounds"
    else return $ code ++ [STA $ Stack (fromIntegral off)]
codeGenExpr ctx (ExprIf pred exprT exprF) = do
  labelT <- genstr "if_true"
  labelF <- genstr "if_false"
  labelEnd <- genstr "if_end"
  codePred <- codeGenPred ctx pred labelT labelF
  codeT <- codeGenExpr ctx exprT
  codeF <- codeGenExpr ctx exprF
  return $
    codePred ++
    [Label labelT] ++
    codeT ++ [BRA (Label8 labelEnd), Label labelF] ++ codeF ++ [Label labelEnd]

codeGenPred :: CodeContext -> Pred -> String -> String -> Unique [Instruction]
codeGenPred ctx (PredLit True) true _ = return [BRA (Label8 true)]
codeGenPred ctx (PredLit False) _ false = return [BRA (Label8 false)]
codeGenPred ctx (PredUnOp PredNot pred) true false =
  codeGenPred ctx pred false true
codeGenPred ctx (PredBinOp PredAnd pred1 pred2) true false = do
  skip <- genstr "pred_and"
  code1 <- codeGenPred ctx pred1 skip false
  code2 <- codeGenPred ctx pred2 true false
  return $ code1 ++ [Label skip] ++ code2
codeGenPred ctx (PredBinOp PredOr pred1 pred2) true false = do
  skip <- genstr "pred_or"
  code1 <- codeGenPred ctx pred1 true skip
  code2 <- codeGenPred ctx pred2 true false
  return $ code1 ++ [Label skip] ++ code2
{-
  Adapted from http://www.6502.org/tutorials/compare_instructions.html

  there is some better logic available for working on the stack, and in the
  case where evaluation order of the expressions do not matter (see snazzym)
-}
codeGenPred ctx (PredComp op expr1 expr2) true false = do
  code1 <- codeGenExpr ctx expr1
  code2 <- codeGenExpr (extendLocal ("", TypeBits 0) ctx) expr2
  -- this is a placeholder for the type. we need an enhanced AST version where
  -- the types are fully annotated (could also call typeof, but could be iffy
  -- due to type ifnerence
  -- this will need to be done if (when) we have differently sized types
  let compare =
        case op of
          CompEq -> [BEQ (Label8 true)]
          CompNeq -> [BNE (Label8 true)]
          CompLe -> [BCC (Label8 true)]
          CompLeq -> [BCC (Label8 true), BEQ (Label8 true)]
          CompGe -> [BEQ (Label8 false), BCS (Label8 true)]
          CompGeq -> [BCS (Label8 true)]
          CompLeS -> [BMI (Label8 true)]
          CompLeqS -> [BMI (Label8 true), BEQ (Label8 true)]
          CompGeS -> [BEQ (Label8 false), BPL (Label8 true)]
          CompGeqS -> [BPL (Label8 true)]
  return $
    code1 ++
    [PHA] ++
    code2 ++
    [STA (Dir 0x00)] ++
    [PLA] ++ [CMP (Dir 0x00)] ++ compare ++ [BRA (Label8 false)]

codeGenVars :: CodeContext -> [Var] -> Unique (CodeContext, [Instruction])
codeGenVars ctx = foldM codeGenVar (ctx, [])

codeGenVar ::
     (CodeContext, [Instruction]) -> Var -> Unique (CodeContext, [Instruction])
codeGenVar (ctx, ins) (Var id typ expr) = do
  code <- codeGenExpr ctx expr
  let code' = code ++ [PHA] -- push should depend on type
  let ctx' = extendLocal (id, typ) ctx
  return (ctx', ins ++ code')

lookupOffset :: Id -> CodeContext -> Word
lookupOffset id ctx = lookupOffset' 1 id (lvarDict ctx)
  where
    lookupOffset' off key ((id, t):ctx) =
      if key == id
        then off
        else lookupOffset' (off + offset t) key ctx

-- Big TODO!
offset :: Type -> Word
offset TypeVoid = 0
offset _ = 2

codeBlockSize :: [Instruction] -> Word
codeBlockSize = sum . map sizeof
