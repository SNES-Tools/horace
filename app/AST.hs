module AST where

type Id = String

type Pred = () -- placeholder

data Expr
  = ExprLit Int
  | ExprBlock [Var] [Expr]
  | ExprIf Pred Expr Expr
  | ExprFor Id Expr Expr Expr
  | ExprAssign LVal Expr
  | ExprCall Id [Expr]
  | ExprMethodCall Expr Id [Expr]
  | ExprUnOp UnOp Expr
  | ExprBinOp BinOp Expr Expr
  | ExprVar Id
  | ExprArrIndex Expr Expr
  deriving (Show)

--        | ExprMatch Expr [Case]       -- omitted
data LVal
  = LValId Id
  | LValArrIndex Id Expr
  deriving (Show)

data Var =
  Var Id Type Expr
  deriving (Show)

data UnOp
  = UnOpClamp
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

data Type
  = TypeArray Type Word
  | TypeSprite Id
  | TypeBits Word
  | TypeRange Int Int
  | TypeData Id
  | TypeVoid
  deriving (Show)
