module Context where

import AST
import Type
import Value

-- context stuff
type Dict a = [(Id, a)]

type TypeDict = Dict Type

data Context a =
  Context (Dict a) (Dict a) (Dict a) -- globals, states, locals
  deriving (Show)

type TypeContext = Context Type

type Env = Context Value

stateToDict :: [MState] -> TypeDict
stateToDict = map (\(MState id t _) -> (id, t))

stateContext :: [MState] -> TypeContext
stateContext ms = Context [] (stateToDict ms) []

emptyContext :: Context a
emptyContext = Context [] [] []

-- extends the context with a local variable
extendContext :: Id -> a -> Context a -> Context a
extendContext id x (Context gs ms ls) = Context gs ((id, x) : ms) ls

setLocalContext :: [Param] -> TypeContext -> TypeContext
setLocalContext ps (Context gs ms _) = Context gs ms ls
  where
    ls = map pair ps
    pair (Param id t) = (id, t)

{-
  If we assert that there are no duplicate keys in the three dictionaries, then
  it doesn't matter what order we check them.
-}
lookupContext :: Id -> Context a -> Either String a
lookupContext id (Context gs ms ls) =
  case lookup id gs of
    Just x -> Right x
    Nothing ->
      case lookup id ms of
        Just x -> Right x
        Nothing ->
          case lookup id ls of
            Just x -> Right x
            Nothing -> Left $ "Lookup failed: " ++ show id

lookupContext' :: Id -> Context a -> a
lookupContext' id ctx =
  case lookupContext id ctx of
    Left _ -> error "Lookup failed. This should have been caught earlier."
    Right v -> v

replaceContext :: Id -> a -> Context a -> Context a
replaceContext id x (Context gs ms ls) =
  case replace id x gs of
    Just gs' -> Context gs' ms ls
    Nothing ->
      case replace id x ms of
        Just ms' -> Context gs ms' ls
        Nothing ->
          case replace id x ls of
            Just ls' -> Context gs ms ls'
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
