module Context where

import AST
import Type
import Value

-- context stuff
type Dict a = [(Id, a)]

type TypeDict = Dict Type

type FuncTypeDict = Dict ([Type], Type)

data Context a f =
  Context (Dict f) (Dict a) (Dict a) -- FUNCTIONS, states, locals
  deriving (Show)

type TypeContext = Context Type ([Type], Type)

type Env = Context Value () -- TODO placeholder

stateToDict :: [MState] -> TypeDict
stateToDict = map (\(MState id t _) -> (id, t))

funcsToDict :: [Func] -> FuncTypeDict
funcsToDict = map (\(Func id ps t _) -> (id, (map (\(Param _ t) -> t) ps, t)))

stateContext :: [MState] -> TypeContext
stateContext ms = Context [] (stateToDict ms) []

funcStateContext :: [Func] -> [MState] -> TypeContext
funcStateContext fs ms = Context (funcsToDict fs) (stateToDict ms) []

emptyContext :: Context a f
emptyContext = Context [] [] []

-- extends the context with a local variable
extendContext :: Id -> a -> Context a f -> Context a f
extendContext id x (Context fs ms ls) = Context fs ((id, x) : ms) ls

setLocalContext :: [Param] -> TypeContext -> TypeContext
setLocalContext ps (Context fs ms _) = Context fs ms ls
  where
    ls = map pair ps
    pair (Param id t) = (id, t)

{-
  If we assert that there are no duplicate keys in the three dictionaries, then
  it doesn't matter what order we check them.
-}
lookupContext :: Id -> Context a f -> Either String a
lookupContext id (Context fs ms ls) =
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
lookupFuncContext id (Context fs _ _) =
  case lookup id fs of
    Just x -> Right x
    Nothing -> Left $ "Lookup failed on function: " ++ show id

replaceContext :: Id -> a -> Context a f -> Context a f
replaceContext id x (Context fs ms ls) =
  case replace id x ms of
    Just ms' -> Context fs ms' ls
    Nothing ->
      case replace id x ls of
        Just ls' -> Context fs ms ls'
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
