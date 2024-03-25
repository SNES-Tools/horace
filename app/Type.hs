module Type where

import AST

{-
  Arrays must have 1-32 elements. (Upper bound is completely arbitrary.)
-}
minLength :: Word
minLength = 0

maxLength :: Word
maxLength = 32

{-
  The minimum width of a bit type is 1, and the maximum is 8.
-}
minBits :: Word
minBits = 1

maxBits :: Word
maxBits = 16

{-
  All ranges must be a subset of [-32_768, 32_767] (the signed 16-bit integer
  range). This is a strange decision and should be changed in the far future.
-}
minRange :: Int
minRange = -32768

maxRange :: Int
maxRange = 32767

maximalRange :: (Int, Int)
maximalRange = (minRange, maxRange)

{-
  A syntactically-valid program may have illegal type declarations based on the
  parameters set above.
-}
verifyType :: Type -> Bool
verifyType (TypeArray t l) =
  if verifyType t
    then l <| (minLength, maxLength)
    else False -- some idiomatic way to do this
verifyType (TypeSprite _) = True
verifyType (TypeBits b) = b <| (minBits, maxBits)
verifyType (TypeRange l u) = (l, u) <: maximalRange
verifyType (TypeData _) = True
verifyType TypeVoid = True

-- type possibility
data TypePos
  = PosBits Word Word
  | PosUnion TypePos TypePos  -- only case is for int literals

instance Show TypePos where
  show (PosBits m n)
    | m == n = "bits[n" ++ show n ++ "]"
    | otherwise = "bits[n] where " ++ show m ++ "<=n<=" ++ show n
  show (PosUnion t1 t2) = show t1 ++ " or " ++ show t2

type Context = [(Id, TypePos)]

newContext :: Context
newContext = []

ext :: Context -> Id -> TypePos -> Context
ext c id t = (id, t) : c

typeof :: Expr -> Type
typeof = typeof' newContext

typeof' :: Context -> Expr -> Type
typeof' = undefined

(<:) :: (Integral a) => (a, a) -> (a, a) -> Bool
(m1, n1) <: (m2, n2) = m1 >= m2 && n1 <= n2

(<|) :: (Integral a) => a -> (a, a) -> Bool
n <| (l, u) = n >= l && n <= u
