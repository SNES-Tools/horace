module Type where

import Control.Monad

import AST

type ErrorMessage = [String]

type Result a = Either ErrorMessage a

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

lookupContext :: Context -> Id -> Result Type
lookupContext c id =
  case lookup id c of
    Just t -> Right t
    Nothing -> Left $ ["Lookup failed: ", show id]

typeof :: Expr -> Either String Type
typeof e =
  case typeofExpr newContext e of
    Left s -> Left $ "Type error: " ++ unwords s
    Right t -> Right t

typeError :: [String] -> Either [String] a
typeError = Left

--typeError = Left . unwords
typeofExpr :: Context -> Expr -> Result Type
typeofExpr _ (ExprLit i) = Right $ constantType i
typeofExpr _ ExprVoid = Right TypeVoid
typeofExpr c (ExprIf p e1 e2) = do
  _ <- typeofPred c p
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  if t1 == t2
    then return t1
    else typeError ["types in the if expression do not match"]
-- note: no Nothing variants are handled
typeofExpr c (ExprUnOp (UnOpTransmute (Just l') (Just u')) e) = do
  t <- typeofExpr c e
  case t of
    TypeRange l u -> tryTransmute (l, u)
    TypeLit _ v -> tryTransmute (v, v)
    _ -> typeError ["transmute used on a non-range type"]
  where
    tryTransmute (l, u) =
      case (l, u) /\ (l', u') of
        Just _ -> return $ TypeRange l' u'
        Nothing -> typeError ["transmute used between disjoint ranges"]
typeofExpr c (ExprUnOp (UnOpShrink (Just n')) e) = do
  t <- typeofExpr c e
  case t of
    TypeBits n -> tryShrink n
    TypeLit n _ -> tryShrink n
    _ -> typeError ["shrink used on a non-bits type"]
  where
    tryShrink n =
      if n' < n
        then return $ TypeBits n'
        else typeError ["trying to shrink bits to equal or larger width"]
typeofExpr c (ExprUnOp (UnOpExtend (Just n')) e) = do
  t <- typeofExpr c e
  case t of
    TypeBits n -> tryExtend n
    TypeLit n _ -> tryExtend n
    _ -> typeError ["extend used on a non-bits type"]
  where
    tryExtend n =
      if n' > n
        then return $ TypeBits n'
        else typeError ["trying to extend bits to equal or smaller width"]
typeofExpr c (ExprUnOp (UnOpSignExtend (Just n')) e) = do
  t <- typeofExpr c e
  case t of
    TypeBits n -> trySignExtend n
    TypeLit n _ -> trySignExtend n
    _ -> typeError ["sign-extend used on a non-bits type"]
  where
    trySignExtend n =
      if n' > n
        then return $ TypeBits n'
        else typeError ["trying to sign-extend bits to equal or smaller width"]
typeofExpr c (ExprBinOp BinOpBitAnd e1 e2) = bitwiseOpType c e1 e2
typeofExpr c (ExprBinOp BinOpBitOr e1 e2) = bitwiseOpType c e1 e2
typeofExpr c (ExprBinOp BinOpBitEor e1 e2) = bitwiseOpType c e1 e2
typeofExpr c (ExprBinOp BinOpAdd e1 e2) = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2)
    -- no handling of constant addition which is outside usual bounds!!
        of
    (TypeLit _ i1, TypeLit _ i2) -> return $ constantType $ i1 + i2
    -- bit cases
    (TypeBits _, TypeBits _) -> bitwiseOpType c e1 e2
    (TypeLit _ _, TypeBits _) -> bitwiseOpType c e1 e2
    (TypeBits _, TypeLit _ _) -> bitwiseOpType c e1 e2
    -- range cases
    (TypeRange l1 u1, TypeRange l2 u2) -> return $ TypeRange (l1 + l2) (u1 + u2)
    (TypeLit _ v, TypeRange l2 u2) -> return $ TypeRange (v + l2) (v + u2)
    (TypeRange l1 u1, TypeLit _ v) -> return $ TypeRange (l1 + v) (u1 + v)
    _ -> typeError ["addition of incompatible types"]
typeofExpr c (ExprBinOp BinOpSub e1 e2) = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2)
    -- no handling of constant addition which is outside usual bounds!!
        of
    (TypeLit _ i1, TypeLit _ i2) -> return $ constantType $ i1 - i2
    -- bit cases
    (TypeBits _, TypeBits _) -> bitwiseOpType c e1 e2
    (TypeLit _ _, TypeBits _) -> bitwiseOpType c e1 e2
    (TypeBits _, TypeLit _ _) -> bitwiseOpType c e1 e2
    -- range cases
    (TypeRange l1 u1, TypeRange l2 u2) -> return $ TypeRange (l1 - u2) (u1 - l2)
    (TypeLit _ v, TypeRange l2 u2) -> return $ TypeRange (v - u2) (v - l2)
    (TypeRange l1 u1, TypeLit _ v) -> return $ TypeRange (l1 - v) (u1 - v)
    _ -> typeError ["subtraction of incompatible types"]
{-
  for typeofExpr, we expect it to be that the bindings in `vs` are done
  sequentially, i.e. declarations are able to see the previous binding
-}
typeofExpr c (ExprBlock vs es) = do
  c' <- typeofVars c vs
  t <- foldM (const $ typeofExpr c') TypeVoid es
  return t
typeofExpr c (ExprVar id) = do
  t <- lookupContext c id
  return t
typeofExpr c (ExprAssign (LValId id) e) = do
  t <- lookupContext c id
  t' <- typeofExpr c e
  if t == t'
    then return t
    else typeError ["types not equal for assignment"]
typeofExpr _ _ = Left ["feature is undefined"]

-- this does not verify if the written type declaration is legal!
typeofVars :: Context -> [Var] -> Result Context
typeofVars = foldM typeofVar

typeofVar :: Context -> Var -> Result Context
typeofVar c (Var id t e) = do
  t' <- typeofExpr c e
  case lookupContext c id of
    Left _ ->
      if t == t'
        then return $ extendContext c id t
        else typeError ["types not equal for assignment"]
    Right _ -> typeError ["variable already in scope: ", id]

-- predicates have no type, but is just a type-checker
typeofPred :: Context -> Pred -> Result ()
typeofPred _ (PredLit _) = Right ()
typeofPred c (PredUnOp _ p) = do
  _ <- typeofPred c p
  return ()
typeofPred c (PredBinOp _ p1 p2) = do
  _ <- typeofPred c p1
  _ <- typeofPred c p2
  return ()
typeofPred c (PredComp _ e1 e2) = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2)
    -- comparisons of all integer literals is allowed? because it's obvious?
        of
    (TypeLit _ i1, TypeLit _ i2) -> return ()
    -- bit cases
    (TypeBits b1, TypeBits b2) ->
      if b1 == b2
        then return ()
        else typeError ["comparison of bits that are not equal"]
    (TypeLit b1 _, TypeBits b2) ->
      if b1 == b2
        then return ()
        else typeError ["comparison of bits that are not equal"]
    (TypeBits b1, TypeLit b2 _) ->
      if b1 == b2
        then return ()
        else typeError ["comparison of bits that are not equal"]
    -- range cases (comparisons of any ranges are okay?)
    (TypeRange _ _, TypeRange _ _) -> return ()
    (TypeLit _ _, TypeRange _ _) -> return ()
    (TypeRange _ _, TypeLit _ _) -> return ()
    _ -> typeError ["comparison of incompatible types"]

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

bitwiseOpType :: Context -> Expr -> Expr -> Result Type
bitwiseOpType c e1 e2 = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2) of
    (TypeBits n1, TypeBits n2) -> checkEqual n1 n2
    (TypeLit n1 _, TypeBits n2) -> checkEqual n1 n2
    (TypeBits n1, TypeLit n2 _) -> checkEqual n1 n2
    (TypeLit n1 _, TypeLit n2 _) -> checkEqual n1 n2
    _ -> typeError ["operands of bitwise operators are not bit types"]
  where
    checkEqual n1 n2 =
      if n1 == n2
        then return $ TypeBits n1
        else typeError ["bit widths are not equal"]

(/\) :: (Integral a) => (a, a) -> (a, a) -> Maybe (a, a)
(l1, u1) /\ (l2, u2) =
  if l2 > u1 || l1 > u2
    then Nothing
    else Just (max l1 l2, min u1 u2)

(<:?) :: (Integral a) => (a, a) -> (a, a) -> Bool
(m1, n1) <:? (m2, n2) = m1 >= m2 && n1 <= n2

(<?) :: (Integral a) => a -> (a, a) -> Bool
n <? (l, u) = n >= l && n <= u
