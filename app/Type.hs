module Type where

import Control.Monad

import AST

type ErrorMessage = [String]

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
    then l <? (minLength, maxLength)
    else False -- some idiomatic way to do this
verifyType (TypeSprite _) = True
verifyType (TypeBits b) = b <? (minBits, maxBits)
verifyType (TypeRange l u) = (l, u) <:? maximalRange
verifyType (TypeData _) = True
verifyType TypeVoid = True

-- type possibility
instance Eq Type where
  (TypeArray t w) == (TypeArray t' w') = t == t' && w == w'
  (TypeSprite id) == (TypeSprite id') = id == id'
  (TypeBits w) == (TypeBits w') = w == w'
  (TypeBits w) == (TypeLit w' _) = w == w'
  (TypeLit w _) == (TypeBits w') = w == w'
  (TypeRange l u) == (TypeRange l' u') = l == l' && u == u'
  (TypeRange l u) == (TypeLit _ v) = l == v && u == v
  (TypeLit _ v) == (TypeRange l u) = l == v && u == v
  (TypeLit _ v) == (TypeLit _ v') = v == v'
  (TypeData id) == (TypeData id') = id == id'
  TypeVoid == TypeVoid = True
  _ == _ = False

type Context = [(Id, Type)]

newContext :: Context
newContext = []

extendContext :: Context -> Id -> Type -> Context
extendContext c id t = (id, t) : c

lookupContext :: Context -> Id -> Maybe Type
lookupContext = flip lookup

typeof :: Expr -> Either String Type
typeof e =
  case typeofExpr newContext e of
    Left s -> Left $ "Type error: " ++ unwords s
    Right t -> Right t

typeofExpr :: Context -> Expr -> Either ErrorMessage Type
typeofExpr _ (ExprLit i) = Right $ constantType i
typeofExpr _ ExprVoid = Right TypeVoid
typeofExpr c (ExprIf p e1 e2) =
  case typeofPred c p of
    Right _ ->
      case (typeofExpr c e1, typeofExpr c e2) of
        (Left e, _) -> Left e
        (_, Left e) -> Left e
        (Right t1, Right t2) ->
          if t1 == t2
            then Right t1
            else Left ["types in the if expression do not match"]
    Left e -> Left e
-- note: no Nothing variants are handled
typeofExpr c (ExprUnOp (UnOpTransmute (Just l') (Just u')) e) =
  case typeofExpr c e of
    r@(Left _) -> r
    Right (TypeRange l u) -> tryTransmute (l, u)
    Right (TypeLit _ v) -> tryTransmute (v, v)
    _ -> Left ["transmute used on a non-range type"]
  where
    tryTransmute (l, u) =
      case (l, u) /\ (l', u') of
        Just _ -> Right $ TypeRange l' u'
        Nothing -> Left ["transmute used between disjoint ranges"]
typeofExpr c (ExprUnOp (UnOpShrink (Just n')) e) =
  case typeofExpr c e of
    r@(Left _) -> r
    Right (TypeBits n) -> tryShrink n
    Right (TypeLit n _) -> tryShrink n
    _ -> Left ["shrink used on a non-bits type"]
  where
    tryShrink n =
      if n' < n
        then Right $ TypeBits n'
        else Left ["trying to shrink bits to equal or larger width"]
typeofExpr c (ExprUnOp (UnOpExtend (Just n')) e) =
  case typeofExpr c e of
    r@(Left _) -> r
    Right (TypeBits n) -> tryExtend n
    Right (TypeLit n _) -> tryExtend n
    _ -> Left ["extend used on a non-bits type"]
  where
    tryExtend n =
      if n' > n
        then Right $ TypeBits n'
        else Left ["trying to extend bits to equal or larger width"]
typeofExpr c (ExprUnOp (UnOpSignExtend (Just n')) e) =
  case typeofExpr c e of
    r@(Left _) -> r
    Right (TypeBits n) -> trySignExtend n
    Right (TypeLit n _) -> trySignExtend n
    _ -> Left ["sign-extend used on a non-bits type"]
  where
    trySignExtend n =
      if n' > n
        then Right $ TypeBits n'
        else Left ["trying to sign-extend bits to equal or larger width"]
typeofExpr c (ExprBinOp BinOpBitAnd e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    (Right t1, Right t2) -> bitwiseOpType t1 t2
typeofExpr c (ExprBinOp BinOpBitOr e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    (Right t1, Right t2) -> bitwiseOpType t1 t2
typeofExpr c (ExprBinOp BinOpBitEor e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    (Right t1, Right t2) -> bitwiseOpType t1 t2
typeofExpr c (ExprBinOp BinOpAdd e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    -- no handling of constant addition which is outside usual bounds!!
    (Right (TypeLit _ i1), Right (TypeLit _ i2)) ->
      Right $ constantType $ i1 + i2
    -- bit cases
    (Right b1@(TypeBits _), Right b2@(TypeBits _)) -> bitwiseOpType b1 b2
    (Right (TypeLit b _), Right b2@(TypeBits _)) ->
      bitwiseOpType (TypeBits b) b2
    (Right b1@(TypeBits _), Right (TypeLit b _)) ->
      bitwiseOpType b1 (TypeBits b)
    -- range cases
    (Right (TypeRange l1 u1), Right (TypeRange l2 u2)) ->
      Right $ TypeRange (l1 + l2) (u1 + u2)
    (Right (TypeLit _ v), Right (TypeRange l2 u2)) ->
      Right $ TypeRange (v + l2) (v + u2)
    (Right (TypeRange l1 u1), Right (TypeLit _ v)) ->
      Right $ TypeRange (l1 + v) (u1 + v)
    _ -> Left ["addition of incompatible types"]
typeofExpr c (ExprBinOp BinOpSub e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    -- no handling of constant addition which is outside usual bounds!!
    (Right (TypeLit _ i1), Right (TypeLit _ i2)) ->
      Right $ constantType $ i1 - i2
    -- bit cases
    (Right b1@(TypeBits _), Right b2@(TypeBits _)) -> bitwiseOpType b1 b2
    (Right (TypeLit b _), Right b2@(TypeBits _)) ->
      bitwiseOpType (TypeBits b) b2
    (Right b1@(TypeBits _), Right (TypeLit b _)) ->
      bitwiseOpType b1 (TypeBits b)
    -- range cases
    (Right (TypeRange l1 u1), Right (TypeRange l2 u2)) ->
      Right $ TypeRange (l1 - u2) (u1 - l2)
    (Right (TypeLit _ v), Right (TypeRange l2 u2)) ->
      Right $ TypeRange (v - u2) (v - l2)
    (Right (TypeRange l1 u1), Right (TypeLit _ v)) ->
      Right $ TypeRange (l1 - v) (u1 - v)
    _ -> Left ["subtraction of incompatible types"]
{-
  for typeofExpr, we expect it to be that the bindings in `vs` are done
  sequentially, i.e. declarations are able to see the previous binding
-}
typeofExpr c (ExprBlock vs es) = do
  c' <- typeofVars c vs
  t <- foldM (const $ typeofExpr c') TypeVoid es
  return t
typeofExpr c (ExprVar id) =
  case lookupContext c id of
    Just (TypeBits b) -> Right $ TypeBits b
    Just (TypeRange l u) -> Right $ TypeRange l u
    Nothing -> Left ["variable not in scope:", id]
typeofExpr c (ExprAssign (LValId id) e) =
  case lookupContext c id of
    Just t ->
      case typeofExpr c e of
        r@(Left _) -> r
        Right t' ->
          if t' == t
            then Right t'
            else Left ["types not equal for assignment"]
    Nothing -> Left ["variable not in scope:", id]
typeofExpr _ _ = Left ["feature is undefined"]

-- this does not verify if the written type declaration is legal!
typeofVars :: Context -> [Var] -> Either ErrorMessage Context
typeofVars c = foldl foo (Right c)
  where
    foo r@(Left _) _ = r
    foo (Right c) (Var id t e) =
      case typeofExpr c e of
        Left e -> Left e
        Right t' ->
          if t' == t
            then case lookupContext c id of
                   Just _ -> Left ["variable already in scope: ", id]
                   Nothing -> Right $ extendContext c id t
            else Left
                   [ "types not equal for assignment. Variable"
                   , id
                   , "is of type"
                   , show t
                   , "while expression is type"
                   , show t'
                   ]

-- predicates have no type, but is just a type-checker
typeofPred :: Context -> Pred -> Either ErrorMessage ()
typeofPred _ (PredLit _) = Right ()
typeofPred c (PredUnOp _ p) =
  case typeofPred c p of
    l@(Right _) -> l
    r@(Left e) -> r
typeofPred c (PredBinOp _ p1 p2) =
  case (typeofPred c p1, typeofPred c p2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    (Right _, Right _) -> Right ()
typeofPred c (PredComp _ e1 e2) =
  case (typeofExpr c e1, typeofExpr c e2) of
    (Left e, _) -> Left e
    (_, Left e) -> Left e
    (Right _, Right _) -> Right ()

isBits :: Type -> Bool
isBits (TypeBits _) = True
isBits (TypeLit _ _) = True
isBits _ = False

isRange :: Type -> Bool
isRange (TypeRange _ _) = True
isRange (TypeLit _ _) = True
isRange _ = False

constantType :: Int -> Type
constantType i
  | i > 0 =
    let bits = ceiling $ logBase 2 $ (fromIntegral i) + 1
     in constant bits
  | i == 0 = constant minBits
  | i < 0 =
    let bits = ceiling $ logBase 2 $ (abs $ fromIntegral i) + 1
     in constant bits
  where
    constant x =
      let x' = max x minBits
       in TypeLit x' i

bitwiseOpType :: Type -> Type -> Either ErrorMessage Type
bitwiseOpType (TypeBits m) (TypeBits n) =
  if m == n
    then Right $ TypeBits m
    else Left ["bit widths are not equal"]
bitwiseOpType (TypeBits n) (TypeLit m _) =
  if m == n
    then Right $ TypeBits m
    else Left ["bit widths are not equal"]
bitwiseOpType (TypeLit m _) (TypeBits n) =
  if m == n
    then Right $ TypeBits m
    else Left ["bit widths are not equal"]
bitwiseOpType (TypeLit n _) (TypeLit m _) =
  if m == n
    then Right $ TypeBits m
    else Left ["bit widths are not equal"]
bitwiseOpType _ _ = Left ["operands of bitwise operators are not bit types"]

(/\) :: (Integral a) => (a, a) -> (a, a) -> Maybe (a, a)
(l1, u1) /\ (l2, u2) =
  if l2 > u1 || l1 > u2
    then Nothing
    else Just (max l1 l2, min u1 u2)

(<:?) :: (Integral a) => (a, a) -> (a, a) -> Bool
(m1, n1) <:? (m2, n2) = m1 >= m2 && n1 <= n2

(<?) :: (Integral a) => a -> (a, a) -> Bool
n <? (l, u) = n >= l && n <= u
