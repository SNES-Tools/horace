module Typechecker where

import Control.Monad

import AST
import Context
import Type

type ErrorMessage = [String]

type Result a = Either ErrorMessage a

-- type checker stuff
typeCheck :: Mode -> Maybe String
typeCheck mode =
  case typeCheckMode mode of
    Left s -> Just $ unwords s
    Right _ -> Nothing

-- type checker of mode
typeCheckMode :: Mode -> Result ()
typeCheckMode (Mode _ states main _) = do
  _ <- typeCheckStates states
  _ <- typeofExpr (stateContext states) main
  return ()

-- type checker of states
typeCheckStates :: [MState] -> Result ()
typeCheckStates = foldM (const typeCheckState) ()

-- TODO not checking if variable is previously defined
typeCheckState :: MState -> Result ()
typeCheckState (MState id t e) = do
  t' <- typeofExpr emptyContext e -- constant context
  if t == t'
    then return ()
    else typeError ["types not equal for assignment"]

-- type checker for the core expression
-- it is well-typed if we can find a type for it I think
typeofExpr :: TypeContext -> Expr -> Result Type
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
  case (t1, t2) of
    -- no handling of constant addition which is outside usual bounds!!
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
  case (t1, t2) of
    -- no handling of constant addition which is outside usual bounds!!
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
typeofExpr c (ExprVar id) = lookupContext id c
typeofExpr c (ExprAssign (LValId id) e) = do
  t <- lookupContext id c
  t' <- typeofExpr c e
  if t == t'
    then return t
    else typeError ["types not equal for assignment"]
typeofExpr _ _ = Left ["feature is undefined"]

-- this does not verify if the written type declaration is legal!
typeofVars :: TypeContext -> [Var] -> Result TypeContext
typeofVars = foldM typeofVar

typeofVar :: TypeContext -> Var -> Result TypeContext
typeofVar c (Var id t e) = do
  t' <- typeofExpr c e
  case lookupContext id c of
    Left _ ->
      if t == t'
        then return $ extendContext id t c
        else typeError ["types not equal for assignment"]
    Right _ -> typeError ["variable already in scope: ", id]

-- predicates have no type, but is just a type-checker
typeofPred :: TypeContext -> Pred -> Result ()
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
  case (t1, t2) of
    -- comparisons of all integer literals is allowed? because it's obvious?
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

bitwiseOpType :: TypeContext -> Expr -> Expr -> Result Type
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

{-
  utilities/misc
-}
(/\) :: (Integral a) => (a, a) -> (a, a) -> Maybe (a, a)
(l1, u1) /\ (l2, u2) =
  if l2 > u1 || l1 > u2
    then Nothing
    else Just (max l1 l2, min u1 u2)

-- type error
typeError :: [String] -> Either [String] a
typeError = Left
