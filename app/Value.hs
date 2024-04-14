module Value where

import Data.List

data Value
  = ValBits Word Word -- width, value
  -- in invariant we will maintain is that all bits beyond the width in value
  -- are all zero
  | ValRange Int
  | ValUser String [Value]
  | ValVoid

instance Show Value where
  show (ValBits _ v) = show v
  show (ValRange i) = show i
  show (ValUser s vs) = s ++ "(" ++ intercalate "," (map show vs) ++ ")"
  show ValVoid = "void"
