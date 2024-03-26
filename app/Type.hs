module Type where

import AST

{-
  Arrays must have 1-32 elements. (Upper bound is completely arbitrary.)
-}
minLength :: Word
minLength = 0

maxLength :: Word
maxLength = 32

{-
  The minimum width of a bit type is 1, and the maximum is 8.
-}
minBits :: Word
minBits = 1

maxBits :: Word
maxBits = 16

{-
  All ranges must be a subset of [-32_768, 32_767] (the signed 16-bit integer
  range). This is a strange decision and should be changed in the far future.
-}
minRange :: Int
minRange = -32768

maxRange :: Int
maxRange = 32767

maximalRange :: (Int, Int)
maximalRange = (minRange, maxRange)

{-
  A syntactically-valid program may have illegal type declarations based on the
  parameters set above.
-}
verifyType :: Type -> Bool
verifyType (TypeArray t l) =
  if verifyType t
    then l <| (minLength, maxLength)
    else False -- some idiomatic way to do this
verifyType (TypeSprite _) = True
verifyType (TypeBits b) = b <| (minBits, maxBits)
verifyType (TypeRange l u) = (l, u) <: maximalRange
verifyType (TypeData _) = True
verifyType TypeVoid = True

-- type possibility
data TypePos
  = PosBits Word Word
  | PosRange Int Int
  | PosLit Word Int -- only case is for int literals (bits, value)
  deriving (Eq)

instance Show TypePos where
  show (PosBits m n)
    | m == n = "bits[" ++ show n ++ "]"
    | otherwise = "bits[n] where " ++ show m ++ "<=n<=" ++ show n
  show (PosRange l u) = "range[" ++ show l ++ "," ++ show u ++ "]"
  show (PosLit b r) =
    "bits[" ++ show b ++ "] or range[" ++ show r ++ "," ++ show r ++ "]"

type Context = [(Id, TypePos)]

newContext :: Context
newContext = []

ext :: Context -> Id -> TypePos -> Context
ext c id t = (id, t) : c

typeof :: Expr -> TypePos
typeof e =
  case typeofExpr newContext e of
    Left t -> t
    Right s -> error $ "Type error: " ++ s

typeofExpr :: Context -> Expr -> Either TypePos String
typeofExpr _ (ExprLit i)
  | i > 0 =
    let bits = ceiling $ logBase 2 $ (fromIntegral i) + 1
     in constant bits
  | i == 0 = constant minBits
  | i < 0 =
    let bits = ceiling $ logBase 2 $ (abs $ fromIntegral i)
     in constant bits
  where
    constant x =
      let x' = max x minBits
       in Left $ PosLit x' i
typeofExpr c (ExprIf p e1 e2) =
  case typeofPred c p of
    Left _ ->
      case (typeofExpr c e1, typeofExpr c e2) of
        (Right e, _) -> Right e
        (_, Right e) -> Right e
        (Left t1, Left t2) ->
          if t1 == t2
            then Left t1
            else Right "types in the if expression do not match"
          -- think: must they match exactly?
    Right e -> Right e
typeofExpr c (ExprUnOp UnOpTransmute e) =
  case typeofExpr c e of
    r@(Right _) -> r
    Left (PosRange _ _) -> Left $ PosRange minRange maxRange
    Left (PosLit _ _) -> Left $ PosRange minRange maxRange
    _ -> Right "transmute used on a non-range type"
typeofExpr c (ExprUnOp UnOpShrink e) =
  case typeofExpr c e of
    r@(Right _) -> r
    Left (PosBits _ u) -> Left $ PosBits minBits u
    Left (PosLit b _) -> Left $ PosBits minBits b
    _ -> Right "shrink used on a non-bits type"
typeofExpr c (ExprUnOp UnOpExtend e) =
  case typeofExpr c e of
    r@(Right _) -> r
    Left (PosBits l _) -> Left $ PosBits l maxBits
    Left (PosLit b _) -> Left $ PosBits b maxBits
    _ -> Right "extend used on a non-bits type"
typeofExpr c (ExprUnOp UnOpSignExtend e) =
  case typeofExpr c e of
    r@(Right _) -> r
    Left (PosBits l _) -> Left $ PosBits l maxBits
    Left (PosLit b _) -> Left $ PosBits b maxBits
    _ -> Right "sign-extend used on a non-bits type"
typeofExpr c (ExprBinOp BinOpBitAnd e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Right e, _) -> Right e
    (_, Right e) -> Right e
    (Left t1, Left t2) -> intersectBits t1 t2
typeofExpr c (ExprBinOp BinOpBitOr e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Right e, _) -> Right e
    (_, Right e) -> Right e
    (Left t1, Left t2) -> intersectBits t1 t2
typeofExpr c (ExprBinOp BinOpBitEor e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Right e, _) -> Right e
    (_, Right e) -> Right e
    (Left t1, Left t2) -> intersectBits t1 t2
typeofExpr _ _ = undefined

-- predicates have no type, but is just a type-checker
typeofPred :: Context -> Pred -> Either () String
typeofPred _ (PredLit _) = Left ()
typeofPred c (PredUnOp _ p) =
  case typeofPred c p of
    l@(Left _) -> l
    r@(Right e) -> r
typeofPred c (PredBinOp _ p1 p2) =
  case (typeofPred c p1, typeofPred c p2) of
    (Right e, _) -> Right e
    (_, Right e) -> Right e
    (Left _, Left _) -> Left ()
typeofPred c (PredComp _ e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Right e, _) -> Right e
    (_, Right e) -> Right e
    (Left _, Left _) -> Left ()

isBits :: TypePos -> Bool
isBits (PosBits _ _) = True
isBits (PosLit _ _) = True
isBits _ = False

isRange :: TypePos -> Bool
isRange (PosRange _ _) = True
isRange (PosLit _ _) = True
isRange _ = False

intersectBits :: TypePos -> TypePos -> Either TypePos String
intersectBits (PosBits l1 u1) (PosBits l2 u2) =
  case (l1, u1) /\ (l2, u2) of
    Nothing -> Right "bit types are disjoint"
    Just (l, u) -> Left $ PosBits l u
intersectBits (PosBits l u) (PosLit b _) =
  case (l, u) /\ (b, b) of
    Nothing -> Right "bit types are disjoint"
    Just (l, u) -> Left $ PosBits l u
intersectBits (PosLit b _) (PosBits l u) =
  case (l, u) /\ (b, b) of
    Nothing -> Right "bit types are disjoint"
    Just (l, u) -> Left $ PosBits l u
intersectBits (PosLit b1 _) (PosLit b2 _) =
  case (b1, b1) /\ (b2, b2) of
    Nothing -> Right "bit types are disjoint"
    Just (l, u) -> Left $ PosBits l u
intersectBits _ _ = Right "operands of bitwise operators are not bit types"

(/\) :: (Integral a) => (a, a) -> (a, a) -> Maybe (a, a)
(l1, u1) /\ (l2, u2) =
  if l2 > u1 || l1 > u2
    then Nothing
    else Just (max l1 l2, min u1 u2)

(<:) :: (Integral a) => (a, a) -> (a, a) -> Bool
(m1, n1) <: (m2, n2) = m1 >= m2 && n1 <= n2

(<|) :: (Integral a) => a -> (a, a) -> Bool
n <| (l, u) = n >= l && n <= u
