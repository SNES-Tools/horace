module Context where

import AST
import Type
import Value

-- Basic Context stuff
type Dict a = [(Id, a)]

data Context a f = Context
  { funcDict :: Dict f
  , gfxDict :: Dict a
  , palsDict :: Dict a
  , animDict :: Dict a
  , consDict :: Dict f
  , gvarDict :: Dict a
  , mvarDict :: Dict a
  , lvarDict :: Dict a
  } deriving (Show)

-- Types for our use cases
type TypeContext = Context Type ([Type], Type)

type EvalContext = Context Value ([Id], Expr)

type CodeContext = Context Type ([Type], Type) -- temporary

emptyContext :: Context a f
emptyContext =
  Context
    { funcDict = []
    , gfxDict = []
    , palsDict = []
    , animDict = []
    , consDict = []
    , gvarDict = []
    , mvarDict = []
    , lvarDict = []
    }

funcContext :: [(Id, f)] -> Context a f
funcContext fs =
  Context
    { funcDict = fs
    , gfxDict = []
    , palsDict = []
    , animDict = []
    , consDict = []
    , gvarDict = []
    , mvarDict = []
    , lvarDict = []
    }

mvarContext :: [(Id, a)] -> Context a f
mvarContext mvars =
  Context
    { funcDict = []
    , gfxDict = []
    , palsDict = []
    , animDict = []
    , consDict = []
    , gvarDict = []
    , mvarDict = mvars
    , lvarDict = []
    }

consContext :: [(Id, f)] -> Context a f
consContext cons =
  Context
    { funcDict = []
    , gfxDict = []
    , palsDict = []
    , animDict = []
    , consDict = cons
    , gvarDict = [] -- `g` now means sprite, not global lol
    , mvarDict = []
    , lvarDict = []
    }

-- Context operators
lookupCons :: Id -> Context a f -> Maybe f
lookupCons id (Context {consDict = cs}) = lookup id cs

lookupVar :: Id -> Context a f -> Maybe a
lookupVar id (Context _ _ _ _ _ gs ms ls) = lookup id (ls ++ ms ++ gs)

lookupFunc :: Id -> Context a f -> Maybe f
lookupFunc id (Context fs _ _ _ cs _ _ _) = lookup id (fs ++ cs)

extendFunc :: (Id, f) -> Context a f -> Context a f
extendFunc f (Context fs gs ps as cs ts ms ls) =
  Context (f : fs) gs ps as cs ts ms ls

extendGfx :: (Id, a) -> Context a f -> Context a f
extendGfx g (Context fs gs ps as cs ts ms ls) =
  Context fs (g : gs) ps as cs ts ms ls

extendPal :: (Id, a) -> Context a f -> Context a f
extendPal p (Context fs gs ps as cs ts ms ls) =
  Context fs gs (p : ps) as cs ts ms ls

extendCons :: (Id, f) -> Context a f -> Context a f
extendCons c (Context fs gs ps as cs ts ms ls) =
  Context fs gs ps as (c : cs) ts ms ls

extendMVar :: (Id, a) -> Context a f -> Context a f
extendMVar m (Context fs gs ps as cs ts ms ls) =
  Context fs gs ps as cs ts (m : ms) ls

extendLocal :: (Id, a) -> Context a f -> Context a f
extendLocal l (Context fs gs ps as cs ts ms ls) =
  Context fs gs ps as cs ts ms (l : ls)

setLocals :: [(Id, a)] -> Context a f -> Context a f
setLocals ls (Context fs gs ps as cs ts ms _) = Context fs gs ps as cs ts ms ls

replaceVar :: Id -> a -> Context a f -> Context a f
replaceVar id x (Context fs gs ps as cs ts ms ls) =
  case replace id x ms of
    Just ms' -> Context fs gs ps as cs ts ms' ls
    Nothing ->
      case replace id x ls of
        Just ls' -> Context fs gs ps as cs ts ms ls'
        Nothing -> error "Replacement failed"

data LookupCG
  = Absolute Word
  | Local Word
  deriving (Show)

-- lookupCodeGen
lookupCG :: Id -> CodeContext -> LookupCG
lookupCG id ctx =
  case lookupOff 1 id (lvarDict ctx) of
    Just off -> Local off
    Nothing ->
      case lookupOff 0x1A id (mvarDict ctx) of
      -- magic number (changes depending on extra global variables...)
        Just addr -> Absolute addr
        Nothing -> error $ "lookupCG failed on " ++ id
  where
    lookupOff off key ((id, t):rest) =
      if key == id
        then Just off
        else lookupOff (off + sizeofType t) key rest
    lookupOff _ _ [] = Nothing

replace :: (Eq a) => a -> b -> [(a, b)] -> Maybe [(a, b)]
replace a b (x@(a', _):xs) = do
  if a == a'
    then return $ (a', b) : xs
    else do
      xs' <- replace a b xs
      return $ x : xs'
replace _ _ [] = Nothing
