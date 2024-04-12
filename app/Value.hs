module Value where

data Value
  = ValBits Word Word -- width, value
  -- in invariant we will maintain is that all bits beyond the width in value
  -- are all zero
  | ValRange Int
  | ValVoid

instance Show Value where
  show (ValBits _ v) = show v
  show (ValRange i) = show i
  show ValVoid = "void"
