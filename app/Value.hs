module Value where

data Value
  = ValBits Word Word -- width, value
  -- in invariant we will maintain is that all bits beyond the width in value
  -- are all zero
  | ValRange Int
  | ValVoid
  deriving (Show)
