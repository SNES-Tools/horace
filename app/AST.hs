module AST where

type Id = String

data Expr
  = ExprLit Int
  | ExprBlock [Var] [Expr]
  | ExprIf Pred Expr Expr
  | ExprFor Id Expr Expr Expr   -- not planned to be supported yet
  | ExprAssign LVal Expr
  | ExprCall Id [Expr]          -- not planned to be supported yet
  | ExprMethodCall Id Id [Expr] -- not planned to be supported yet
  | ExprMatch Expr [Case]       -- not planned to be supported yet
  | ExprUnOp UnOp Expr
  | ExprBinOp BinOp Expr Expr
  | ExprVar Id
  | ExprArrIndex Expr Expr      -- not planned to be supported yet
  deriving (Show)

data LVal
  = LValId Id
  | LValArrIndex Id Expr        -- not implemented
  deriving (Show)

type Case = (Pattern, Expr)     -- not implemented

data Pattern
  = PatWildcard                 -- not implemented
  | PatLit Int                  -- not implemented
  | PatData Id [Pattern]        -- not implemented
  deriving (Show)

data Var =
  Var Id Type Expr
  deriving (Show)

data UnOp
  = UnOpTransmute
  | UnOpShrink
  | UnOpExtend
  | UnOpSignExtend
  | UnOpDisplay                 -- not implemented
  deriving (Show)

data BinOp
  = BinOpAdd
  | BinOpSub
  | BinOpMult   -- not yet supported
  | BinOpDiv    -- not yet supported
  | BinOpMod    -- not yet supported
  | BinOpLShift -- not yet supported
  | BinOpRShift -- not yet supported
  | BinOpBitAnd
  | BinOpBitOr
  | BinOpBitEor
  deriving (Show)

data Pred
  = PredLit Bool
  | PredUnOp PredUnOp Pred
  | PredBinOp PredBinOp Pred Pred
  | PredComp CompOp Expr Expr
  deriving (Show)

data PredUnOp =
  PredNot
  deriving (Show)

data PredBinOp
  = PredAnd
  | PredOr
  deriving (Show)

data CompOp
  = CompEq
  | CompNeq
  | CompLe
  | CompLeq
  | CompGe
  | CompGeq
  | CompLeS
  | CompLeqS
  | CompGeS
  | CompGeqS
  deriving (Show)

data Type
  = TypeArray Type Word   -- not implemented
  | TypeSprite Id         -- not implemented
  | TypeBits Word
  | TypeRange Int Int
  | TypeData Id
  | TypeVoid              -- not implemented
  deriving (Show)
