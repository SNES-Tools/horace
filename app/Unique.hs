module Unique where

import Control.Monad.State

type Unique a = State Word a

fresh :: Unique Word
fresh = state (\s -> (s, s + 1))

gensym :: Unique String
gensym = do
  x <- fresh
  return $ "label" ++ (show x)

genstr :: String -> Unique String
genstr s = do
  x <- fresh
  return $ s ++ (show x)
