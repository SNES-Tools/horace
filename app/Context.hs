module Context where

import AST
import Type
import Value

-- Basic Context stuff
type Dict a = [(Id, a)]

data Context a f = Context
  { funcDict :: Dict f
  , consDict :: Dict f
  , gvarDict :: Dict a
  , mvarDict :: Dict a
  , lvarDict :: Dict a
  } deriving (Show)

-- Types for our use cases
type TypeContext = Context Type ([Type], Type)

type EvalContext = Context Value ([Id], Expr)

type CodeContext = Context Type ([Type], Type)  -- temporary

emptyContext :: Context a f
emptyContext =
  Context
    {funcDict = [], consDict = [], gvarDict = [], mvarDict = [], lvarDict = []}

funcContext :: [(Id, f)] -> Context a f
funcContext fs =
  Context
    {funcDict = fs, consDict = [], gvarDict = [], mvarDict = [], lvarDict = []}

mvarContext :: [(Id, a)] -> Context a f
mvarContext mvars =
  Context
    { funcDict = []
    , consDict = []
    , gvarDict = []
    , mvarDict = mvars
    , lvarDict = []
    }

consContext :: [(Id, f)] -> Context a f
consContext cons =
  Context
    { funcDict = []
    , consDict = cons
    , gvarDict = []
    , mvarDict = []
    , lvarDict = []
    }

-- type context operators
{-
setLocalContext :: [Param] -> TypeContext -> TypeContext
setLocalContext ps (Context fs ts ms _) = Context fs ts ms ls
  where
    ls = map pair ps
    pair (Param id t) = (id, t)
-}
-- Context operators
lookupCons :: Id -> Context a f -> Maybe f
lookupCons id (Context {consDict = cs}) = lookup id cs

lookupVar :: Id -> Context a f -> Maybe a
lookupVar id (Context _ _ gs ms ls) = lookup id (ls ++ ms ++ gs)

lookupFunc :: Id -> Context a f -> Maybe f
lookupFunc id (Context fs cs _ _ _) = lookup id (fs ++ cs)

extendFunc :: (Id, f) -> Context a f -> Context a f
extendFunc f (Context fs cs ts ms ls) = Context (f : fs) cs ts ms ls

extendCons :: (Id, f) -> Context a f -> Context a f
extendCons c (Context fs cs ts ms ls) = Context fs (c : cs) ts ms ls

extendMVar :: (Id, a) -> Context a f -> Context a f
extendMVar m (Context fs cs ts ms ls) = Context fs cs ts (m : ms) ls

extendLocal :: (Id, a) -> Context a f -> Context a f
extendLocal l (Context fs cs ts ms ls) = Context fs cs ts ms (l : ls)

setLocals :: [(Id, a)] -> Context a f -> Context a f
setLocals ls (Context fs cs ts ms _) = Context fs cs ts ms ls

replaceVar :: Id -> a -> Context a f -> Context a f
replaceVar id x (Context fs cs ts ms ls) =
  case replace id x ms of
    Just ms' -> Context fs cs ts ms' ls
    Nothing ->
      case replace id x ls of
        Just ls' -> Context fs cs ts ms ls'
        Nothing -> error "Replacement failed"

replace :: (Eq a) => a -> b -> [(a, b)] -> Maybe [(a, b)]
replace a b (x@(a', _):xs) = do
  if a == a'
    then return $ (a', b) : xs
    else do
      xs' <- replace a b xs
      return $ x : xs'
replace _ _ [] = Nothing
