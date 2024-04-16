module Unique where

import Control.Monad.State

type Unique a = State Word a

gensym :: Unique String
gensym = do
  x <- get
  put $ x + 1
  return $ "label" ++ (show x)

genstr :: String -> Unique String
genstr s = do
  x <- get
  put $ x + 1
  return $ s ++ (show x)
