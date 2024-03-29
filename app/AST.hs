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
  | ExprVoid
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

{-
  Use of Maybe type allows for either intentionally specifying the target or
  leaving to be inferred (although the typechecker will not do any inference so
  those cases don't work at the moment).
-}
data UnOp
  = UnOpTransmute (Maybe Int) (Maybe Int)
  | UnOpShrink (Maybe Word)
  | UnOpExtend (Maybe Word)
  | UnOpSignExtend (Maybe Word)
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
  | TypeLit Word Int      -- for the type checker, not really part of the AST?
  | TypeData Id
  | TypeVoid              -- not implemented

instance Show Type where
  show (TypeBits n) = "bits[" ++ show n ++ "]"
  show (TypeRange l u) = "range[" ++ show l ++ "," ++ show u ++ "]"
  show (TypeLit b r) =
    "bits[" ++ show b ++ "] or range[" ++ show r ++ "," ++ show r ++ "]"
  show TypeVoid = "void"
