module Typechecker where

import Control.Monad
import Data.List

import AST
import Context
import Result
import Type

-- type checker stuff
typeCheck :: Mode -> Maybe String
typeCheck mode =
  case typeCheckMode mode of
    Left s -> Just s
    Right _ -> Nothing

-- type checker of mode
typeCheckMode :: Mode -> Result ()
typeCheckMode mode
  -- type check mode variables
 = do
  let ctx = consContext consDict
  ctx <- foldM typeCheckPalette ctx (modePals mode)
  ctx <- foldM typeCheckState ctx (modeVars mode)
  -- type check functions
  ctx <- foldM typeCheckFunc ctx (modeFuncs mode)
  ctx <- foldM typeCheckSprite ctx (modeSprites mode)
  _ <- typeofExpr ctx (modeMain mode)
  return ()
  where
    consDict =
      concatMap
        (\utype ->
           map
             (\cons ->
                (consName cons, (consFields cons, TypeUser $ utypeName utype)))
             (utypeCons utype))
        (modeTypes mode)

typeCheckGraphics :: TypeContext -> Graphics -> Result TypeContext
typeCheckGraphics ctx (Graphics name typ _) = return $ extendGfx (name, typ) ctx

typeCheckPalette :: TypeContext -> Palette -> Result TypeContext
typeCheckPalette ctx (Palette name TypePalette colors) =
  if length colors /= 16
    then typeError ["incorrect number of colors for sprite palette"]
    else do
      foldM
        (\_ (r, g, b) ->
           if validColor r && validColor g && validColor b
             then return ()
             else typeError ["invalid color specified for color"])
        ()
        colors
      return $ extendPal (name, TypePalette) ctx
  where
    validColor n = 0 <= n && n < 32

typeCheckState :: TypeContext -> MVar -> Result TypeContext
typeCheckState ctx mvar = do
  let id = mvarName mvar
  let e = mvarInit mvar
  let t = mvarType mvar
  t' <- typeofExpr ctx e
  if isValidStateType t
    then if t == t'
           then return $ extendMVar (id, t) ctx
           else typeError
                  [ "types not equal for assignment to variable"
                  , id
                  , ": expected"
                  , show t
                  , " but got "
                  , show t'
                  ]
    else typeError ["not valid type for state"]

typeCheckFunc :: TypeContext -> Func -> Result TypeContext
typeCheckFunc ctx f = do
  let id = funcName f
  let ps = funcParams f
  let t = funcType f
  let e = funcBody f
  t' <- typeofExpr (setLocals (zip (map paramName ps) (map paramType ps)) ctx) e
  if t == t'
    then return $ extendFunc (id, (map paramType ps, t)) ctx
    else typeError ["function", show id, "return type does not match"]

typeCheckSprite :: TypeContext -> Sprite -> Result TypeContext
typeCheckSprite ctx (Sprite name insts anims state meths) = do
  -- sprites should not have access to other sprite instances
  -- but maybe they do?
  ctx' <- foldM typeCheckSVar ctx state
  ctx' <- foldM typeCheckAnim ctx' anims
  ctx' <- foldM (typeCheckMeth name) ctx' meths
  return $ foldr extendSprite ctx [(inst, TypeSprite name) | inst <- insts]

typeCheckAnim :: TypeContext -> Animation -> Result TypeContext
typeCheckAnim ctx (Animation name _) =
  return $ extendAnim (name, TypeAnimation) ctx

typeCheckSVar :: TypeContext -> MVar -> Result TypeContext
typeCheckSVar ctx mvar = do
  let id = mvarName mvar
  let e = mvarInit mvar
  let t = mvarType mvar
  t' <- typeofExpr ctx e
  if isValidStateType t
    then if t == t'
           then return $ extendSVar (id, t) ctx
           else typeError
                  [ "types not equal for assignment to variable"
                  , id
                  , ": expected"
                  , show t
                  , " but got "
                  , show t'
                  ]
    else typeError ["not valid type for state"]

typeCheckMeth :: Id -> TypeContext -> Func -> Result TypeContext
typeCheckMeth name ctx (Func id ps t e) = do
  t' <-
    typeofExpr
      (setLocals
         ((zip (map paramName ps) (map paramType ps))
            ++ [("self", TypeSprite name)])
         ctx)
      e
  if t == t'
    then return $ extendFunc (id, (map paramType ps, t)) ctx -- think extendFunc
    else typeError ["method", show id, "return type does not match"]

-- type checker for the core expression
-- it is well-typed if we can find a type for it I think
typeofExpr :: TypeContext -> Expr -> Result Type
typeofExpr _ (ExprLit i) = return $ constantType i
typeofExpr _ (ExprRLit i) = return $ TypeRange i i
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
    -- bit cases
    (TypeBits _, TypeBits _) -> bitwiseOpType c e1 e2
    -- range cases
    (TypeRange l1 u1, TypeRange l2 u2) -> return $ TypeRange (l1 + l2) (u1 + u2)
    _ -> typeError ["addition of incompatible types"]
typeofExpr c (ExprBinOp BinOpSub e1 e2) = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2) of
    -- bit cases
    (TypeBits _, TypeBits _) -> bitwiseOpType c e1 e2
    -- range cases
    (TypeRange l1 u1, TypeRange l2 u2) -> return $ TypeRange (l1 - u2) (u1 - l2)
    _ -> typeError ["subtraction of incompatible types"]
{-
  for typeofExpr, we expect it to be that the bindings in `vs` are done
  sequentially, i.e. declarations are able to see the previous binding
-}
typeofExpr c (ExprBlock vs es) = do
  c' <- typeofVars c vs
  t <- foldM (const $ typeofExpr c') TypeVoid es
  return t
typeofExpr c (ExprVar id) =
  case lookupVar id c of
    Just t -> return t
    Nothing -> typeError ["variable not found: ", id]
typeofExpr c (ExprAssign (LValId id) e) = do
  t <-
    case lookupVar id c of
      Just t -> return t
      Nothing -> typeError ["variable not found: ", id]
  t' <- typeofExpr c e
  if t == t'
    then return t
    else typeError
           [ "types not equal for assignment to variable"
           , id
           , ": expected"
           , show t
           , " but got "
           , show t'
           ]
typeofExpr c (ExprCall id args) = do
  ts <- mapM (typeofExpr c) args
  -- first, check type of args is okay
  f <-
    case lookupFunc id c of
      Just t -> return t
      Nothing -> typeError ["function not found: ", id]
  case f of
    (ps, t) ->
      if ts == ps
        then return t -- return type of function
        else typeError ["function arguments do not match"]
        -- may not match either in arity or mismatch in arg type
typeofExpr ctx (ExprConstruct id es) = do
  case lookupCons id ctx of
    Just (ps, t) -> do
      ts <- mapM (typeofExpr ctx) es
      if ts == ps
        then return t
        else typeError ["constructor fields not matching"]
    Nothing -> typeError ["constructor not found: ", id]
-- need to check pattern does not declare duplicate variable names!
typeofExpr ctx (ExprMatch expr cases) = do
  t <- typeofExpr ctx expr -- case guard
  ts <- mapM (typeofCase ctx t) cases
  if null ts
    then return TypeVoid
    else if and $ map (== head ts) (tail ts)
           then return $ ts !! 0
           else typeError ["nonmatching result type of cases"]
typeofExpr _ _ = Left "feature is undefined"

{-
  All cases must look like:
    Just(x, y)
      |  |
      |  |-- all these must be variables
      |----- this must be the name of a constructor
-}
typeofCase :: TypeContext -> Type -> Case -> Result Type
typeofCase ctx t ((PatData id fs), expr) = do
  case lookupCons id ctx of
    Just (ts, t') ->
      if t == t'
        then let ctx' = foldr extendLocal ctx (zip fs ts)
              in typeofExpr ctx' expr
        else typeError ["not a constructor of user type: ", id]
    -- ts = type of fields
    -- t' = actual user type
             -- now need to add locals for the fields
    Nothing -> typeError ["constructor not found: ", id]

typeofVars :: TypeContext -> [Var] -> Result TypeContext
typeofVars = foldM typeofVar

typeofVar :: TypeContext -> Var -> Result TypeContext
typeofVar c (Var id t e) = do
  t' <- typeofExpr c e
  if isValidLocalType t
    then case lookupVar id c of
           Just _ -> typeError ["variable already in scope: ", id]
           Nothing ->
             if t == t'
               then return $ extendLocal (id, t) c
               else typeError ["types not equal for assignment"]
    else typeError ["not a valid type for local variable"]

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
    -- bit cases
    (TypeBits b1, TypeBits b2) ->
      if b1 == b2
        then return ()
        else typeError ["comparison of bits that are not equal"]
    -- range cases (comparisons of any ranges are okay?)
    (TypeRange _ _, TypeRange _ _) -> return ()
    _ -> typeError ["comparison of incompatible types"]
typeofPred _ (PredPressed n _) =
  if n == 1 || n == 2
    then return ()
    else typeError ["controller number out of bounds"]
typeofPred _ (PredHolding n _) =
  if n == 1 || n == 2
    then return ()
    else typeError ["controller number out of bounds"]

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
       in TypeBits x'

bitwiseOpType :: TypeContext -> Expr -> Expr -> Result Type
bitwiseOpType c e1 e2 = do
  t1 <- typeofExpr c e1
  t2 <- typeofExpr c e2
  case (t1, t2) of
    (TypeBits n1, TypeBits n2) -> checkEqual n1 n2
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
