module Context where

import AST
import Type
import Value

-- context stuff
type Dict a = [(Id, a)]

type TypeDict = Dict Type

type FuncTypeDict = Dict ([Type], Type)

data Context a f =
  Context
    { funcDict :: (Dict f)
    , typeDict :: (Dict f)
    , mstateDict :: (Dict a)
    , localDict :: (Dict a)
    }
  deriving (Show)

type TypeContext = Context Type ([Type], Type)

type Env = Context Value ([Id], Expr)

stateToDict :: [MState] -> TypeDict
stateToDict = map (\(MState id t _) -> (id, t))

funcsToDict :: [Func] -> FuncTypeDict
funcsToDict = map funcToPair

funcToPair :: Func -> (Id, ([Type], Type))
funcToPair (Func id ps t _) = (id, (map (\(Param _ t) -> t) ps, t))

stateContext :: [MState] -> TypeContext
stateContext ms =
  Context
    {funcDict = [], typeDict = [], mstateDict = stateToDict ms, localDict = []}

funcStateContext :: [Func] -> [MState] -> TypeContext
funcStateContext fs ms =
  Context
    { funcDict = funcsToDict fs
    , typeDict = []
    , mstateDict = stateToDict ms
    , localDict = []
    }

emptyContext :: Context a f
emptyContext =
  Context {funcDict = [], typeDict = [], mstateDict = [], localDict = []}

-- type context operators
setLocalContext :: [Param] -> TypeContext -> TypeContext
setLocalContext ps (Context fs ts ms _) = Context fs ts ms ls
  where
    ls = map pair ps
    pair (Param id t) = (id, t)

extendFuncContext :: Func -> TypeContext -> TypeContext
extendFuncContext f (Context fs ts ms ls) = Context fs' ts ms ls
  where
    fs' = (funcToPair f) : fs

-- extends the context with a local variable
extendContext :: Id -> a -> Context a f -> Context a f
extendContext id x (Context fs ts ms ls) = Context fs ts ((id, x) : ms) ls

{-
  If we assert that there are no duplicate keys in the three dictionaries, then
  it doesn't matter what order we check them.
-}
lookupContext :: Id -> Context a f -> Either String a
lookupContext id (Context _ _ ms ls) =
  case lookup id ms of
    Just x -> Right x
    Nothing ->
      case lookup id ls of
        Just x -> Right x
        Nothing -> Left $ "Lookup failed: " ++ show id

lookupContext' :: Id -> Context a f -> a
lookupContext' id ctx =
  case lookupContext id ctx of
    Left _ -> error "Lookup failed. This should have been caught earlier."
    Right v -> v

lookupFuncContext :: Id -> Context a f -> Either String f
lookupFuncContext id (Context fs _ _ _) =
  case lookup id fs of
    Just x -> Right x
    Nothing -> Left $ "Lookup failed on function: " ++ show id

lookupFuncContext' :: Id -> Context a f -> f
lookupFuncContext' id (Context fs _ _ _) =
  case lookup id fs of
    Just f -> f
    Nothing ->
      error "Lookup of function failed. This should have been caught earlier."

replaceContext :: Id -> a -> Context a f -> Context a f
replaceContext id x (Context fs ts ms ls) =
  case replace id x ms of
    Just ms' -> Context fs ts ms' ls
    Nothing ->
      case replace id x ls of
        Just ls' -> Context fs ts ms ls'
        Nothing ->
          error "Replacement failed. This should have been caught earlier."

replace :: (Eq a) => a -> b -> [(a, b)] -> Maybe [(a, b)]
replace a b (x@(a', _):xs) = do
  if a == a'
    then return $ (a', b) : xs
    else do
      xs' <- replace a b xs
      return $ x : xs'
replace _ _ [] = Nothing
