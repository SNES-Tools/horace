module CodeGen where

import Control.Monad
import Control.Monad.State

import Data.Bits

import AST
import Context
import Instructions
import Type
import Typechecker
import Unique

codeGen :: Mode -> [Instruction]
codeGen mode = evalState (codeGenMode mode) 0

codeGenMode :: Mode -> Unique [Instruction]
codeGenMode mode = do
  let ctx =
        Context
          { funcDict = [] -- not okay but okay since no one actually looks stuff up here yet
          , consDict = []
          , gvarDict = []
          , mvarDict = map (\(MState id t _) -> (id, t)) (modeVars mode)
          , lvarDict = []
          }
  init <- codeGenMVars ctx (modeVars mode)
  funcs <- codeGenFuncs ctx (modeFuncs mode)
  main <- codeGenExpr ctx (modeMain mode)
  return
    $ concat
        [ funcs
        , [Label "main"]
        , main
        , [RTL]
        , [Label "init"]
        , init
        , [RTL]
        , [Label "vblank", RTL]
        ]

codeGenFuncs :: CodeContext -> [Func] -> Unique [Instruction]
codeGenFuncs ctx = foldM (codeGenFunc ctx) []

{-
  Calling conventions for parameters:
   - all arguments are passed on the stack
   - arguments should be pushed left to right
   - the return address (3 bytes) is above all arguments
  So a call of f(1, 2, 3) would have stack
   | rtl addr
   | 3
   | 2
   | 1
-}
codeGenFunc :: CodeContext -> [Instruction] -> Func -> Unique [Instruction]
codeGenFunc ctx ins (Func name ps _ expr) = do
  let ctx' =
        setLocals
          (("", TypeLongPtr) : (reverse $ map (\(Param n t) -> (n, t)) ps))
          ctx
  body <- codeGenExpr ctx' expr
  return $ concat [ins, [Label name], body, [RTL]]

codeGenExpr :: CodeContext -> Expr -> Unique [Instruction]
codeGenExpr ctx (ExprLit num) = return [LDA $ Imm16 (fromIntegral num)]
codeGenExpr ctx (ExprRLit num) = return [LDA $ Imm16 (fromIntegral num)]
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
codeGenExpr ctx (ExprVar id) =
  case lookupCG id ctx of
    Absolute addr -> return [LDA $ Abs (fromIntegral addr)]
    Local off -> return [LDA $ Stack (fromIntegral off)]
{-
  when storing, also get rid of extra stuff. I don't think we always have to do
  this. would need to make sure precisely when there must be extra stuff in the
  bits. (would also not be needed if using properly compact storage)
-}
codeGenExpr ctx (ExprAssign (LValId id) expr) = do
  code <- codeGenExpr ctx expr
  let Just t = lookupVar id ctx
  let clean =
        case t of
          TypeBits b ->
            [AND (Imm16 $ foldl setBit 0 [0 .. (fromIntegral $ b - 1)])]
          _ -> []
  -- check to store in static area or stack
  case lookupCG id ctx of
    Absolute addr -> return $ code ++ clean ++ [STA $ Abs (fromIntegral addr)]
    Local off -> return $ code ++ clean ++ [STA $ Stack (fromIntegral off)]
codeGenExpr ctx (ExprUnOp (UnOpTransmute (Just l) (Just u)) expr) = do
  code <- codeGenExpr ctx expr
  clampTop <- genstr "clamp_top"
  clampBot <- genstr "clamp_bot"
  end <- genstr "transmute_end"
  return
    $ concat
        [ code
        , [CMP (Imm16 $ fromIntegral u + 1)]
        , [BPL (Label8 clampTop)]
        , [CMP (Imm16 $ fromIntegral l)]
        , [BMI (Label8 clampBot)]
        , [BRA (Label8 end)]
        , [Label clampTop, LDA (Imm16 $ fromIntegral u), BRA (Label8 end)]
        , [Label clampBot, LDA (Imm16 $ fromIntegral l)]
        , [Label end]
        ]
codeGenExpr ctx (ExprUnOp (UnOpShrink (Just b)) expr) = do
  code <- codeGenExpr ctx expr
  let mask = foldl setBit 0 [0 .. (fromIntegral $ b - 1)]
  return $ concat [code, [AND (Imm16 mask)]]
codeGenExpr ctx (ExprUnOp (UnOpExtend _) expr) = do
  code <- codeGenExpr ctx expr
  let Right (TypeBits b) = typeofExpr ctx expr
  let mask = foldl setBit 0 [0 .. (fromIntegral $ b - 1)]
  return $ concat [code, [AND (Imm16 mask)]]
codeGenExpr ctx (ExprUnOp (UnOpSignExtend (Just b')) expr) = do
  code <- codeGenExpr ctx expr
  let Right (TypeBits b) = typeofExpr ctx expr
  let testMask = bit $ fromIntegral $ b - 1
  let trueMask = foldl setBit 0 [fromIntegral b .. (fromIntegral $ b' - 1)]
  end <- genstr "sign_extend"
  return
    $ concat
        [ code
        , [BIT (Imm16 testMask)]
        , [BEQ (Label8 end)]
        , [ORA (Imm16 trueMask)]
        , [Label end]
        ]
codeGenExpr ctx (ExprBinOp op expr1 expr2) = do
  code1 <- codeGenExpr ctx expr1
  code2 <- codeGenExpr (extendLocal ("", TypeBits 0) ctx) expr2
    -- processor flags should reflect result of computation?
  let opCode =
        case op of
          BinOpAdd -> [CLC, ADC (Stack 1), PLX]
          BinOpSub -> [STA (Dir 0), PLA, SEC, SBC (Dir 0)]
          BinOpBitAnd -> [AND (Stack 1), PLX]
          BinOpBitOr -> [ORA (Stack 1), PLX]
          BinOpBitEor -> [EOR (Stack 1), PLX]
  return $ concat [code1, [PHA], code2, opCode]
codeGenExpr ctx (ExprIf pred exprT exprF) = do
  labelT <- genstr "if_true"
  labelF <- genstr "if_false"
  labelEnd <- genstr "if_end"
  codePred <- codeGenPred ctx pred labelT labelF
  codeT <- codeGenExpr ctx exprT
  codeF <- codeGenExpr ctx exprF
  return
    $ concat
        [ codePred
        , [Label labelT]
        , codeT
        , [BRA (Label8 labelEnd)]
        , [Label labelF]
        , codeF
        , [Label labelEnd]
        ]
codeGenExpr ctx (ExprCall f exprs) = do
  args <- codeGenArgs ctx exprs
  return
    $ concat
        [ args
        , [JSL (Label24 f)]
        , replicate (length exprs) PLX -- clobbers P
        ]
codeGenExpr _ ExprVoid = return []
codeGenExpr _ e = error $ show e

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
  return
    $ concat
        [ code1
        , [PHA]
        , code2
        , [STA (Dir 0x00)]
        , [PLA]
        , [CMP (Dir 0x00)]
        , compare
        , [BRA (Label8 false)]
        ]

codeGenMVars :: CodeContext -> [MState] -> Unique [Instruction]
codeGenMVars ctx = foldM (codeGenMVar ctx) []

codeGenMVar :: CodeContext -> [Instruction] -> MState -> Unique [Instruction]
codeGenMVar ctx ins (MState id t e) = do
  {-
    we can have the whole context available to us, because valid uses were
    already type checked

    type info is also ignored, should not be that way!
  -}
  code <- codeGenExpr ctx e
  let Absolute x = lookupCG id ctx
  return $ concat [ins, code, [STA (Abs $ fromIntegral x)]]

codeGenVars :: CodeContext -> [Var] -> Unique (CodeContext, [Instruction])
codeGenVars ctx = foldM codeGenVar (ctx, [])

codeGenVar ::
     (CodeContext, [Instruction]) -> Var -> Unique (CodeContext, [Instruction])
codeGenVar (ctx, ins) (Var id typ expr) = do
  code <- codeGenExpr ctx expr
  let code' = code ++ [PHA] -- push should depend on type
  let ctx' = extendLocal (id, typ) ctx
  return (ctx', ins ++ code')

codeGenArgs :: CodeContext -> [Expr] -> Unique [Instruction]
codeGenArgs ctx exprs = do
  res <- foldM codeGenArg (ctx, []) exprs
  return $ snd res

-- similar, except pushed args are not in scope for evaluating later args
codeGenArg ::
     (CodeContext, [Instruction]) -> Expr -> Unique (CodeContext, [Instruction])
codeGenArg (ctx, ins) expr = do
  code <- codeGenExpr ctx expr
  {-
    proper pushing depends what the type of the parameter is. however we assume
    it's all 2 at the moment. if we were to have the types available, we would
    need to first do a function lookup to get the types of the arguments
  -}
  let code' = code ++ [PHA]
  let ctx' = extendLocal ("", TypeDummy) ctx
  return (ctx', ins ++ code')

codeBlockSize :: [Instruction] -> Word
codeBlockSize = sum . map sizeof
