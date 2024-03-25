module AST where

type Id = String

data Expr
  = ExprLit Int
  | ExprBlock [Var] [Expr]
  | ExprIf Pred Expr Expr
  | ExprFor Id Expr Expr Expr
  | ExprAssign LVal Expr
  | ExprCall Id [Expr]
  | ExprMethodCall Id Id [Expr]
  | ExprMatch Expr [Case]
  | ExprUnOp UnOp Expr
  | ExprBinOp BinOp Expr Expr
  | ExprVar Id
  | ExprArrIndex Expr Expr
  deriving (Show)

data LVal
  = LValId Id
  | LValArrIndex Id Expr
  deriving (Show)

type Case = (Pattern, Expr)

data Pattern
  = PatWildcard
  | PatLit Int
  | PatData Id [Pattern]
  deriving (Show)

data Var =
  Var Id Type Expr
  deriving (Show)

data UnOp
  = UnOpTransmute
  | UnOpShrink
  | UnOpExtend
  | UnOpSignExtend
  | UnOpDisplay
  deriving (Show)

data BinOp
  = BinOpAdd
  | BinOpSub
  | BinOpMult
  | BinOpDiv
  | BinOpMod
  | BinOpLShift
  | BinOpRShift
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
  = TypeArray Type Word
  | TypeSprite Id
  | TypeBits Word
  | TypeRange Int Int
  | TypeData Id
  | TypeVoid
  deriving (Show)
