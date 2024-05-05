module Type where

import Control.Monad

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

data Type
  = TypeArray Type Word   -- not implemented
  | TypeSprite String     -- not implemented
  | TypeBits Word
  | TypeRange Int Int
  | TypeUser String       -- name of string
  | TypeVoid
  -- for palettes/graphics
  | TypePalette  -- no fields, we are using offset into dictionary as index
  | TypeGraphics Word -- number of tiles defined in file (?)
  | TypeAnimation
  -- internal to code generator:
  | TypeLongPtr
  | TypeVariant Word      -- ID for variant tag
  | TypeDummy             -- dummy
  deriving Show

data PalType = PalSprite deriving Show

data GfxType = GfxSprite deriving Show

--instance Show Type where
--  show (TypeBits n)    = "bits[" ++ show n ++ "]"
--  show (TypeRange l u) = "range[" ++ show l ++ "," ++ show u ++ "]"
--  show (TypeUser s)    = "data " ++ s
--  show TypeVoid        = "void"

{-
  A syntactically-valid program may have illegal type declarations based on the
  parameters set above.
-}
isValidStateType :: Type -> Bool
isValidStateType (TypeArray t l) = isValidLocalType t && l <? (minLength, maxLength)
isValidStateType (TypeSprite _)  = True
isValidStateType (TypeBits b)    = b <? (minBits, maxBits)
isValidStateType (TypeRange l u) = (l, u) <:? maximalRange
isValidStateType (TypeUser _)    = True
isValidStateType _               = False

isValidLocalType :: Type -> Bool
isValidLocalType (TypeBits b)    = b <? (minBits, maxBits)
isValidLocalType (TypeRange l u) = (l, u) <:? maximalRange
isValidLocalType (TypeUser _)    = True
isValidLocalType _               = False

-- type possibility
instance Eq Type where
  (TypeArray t w) == (TypeArray t' w') = t == t' && w == w'
  (TypeSprite id) == (TypeSprite id')  = id == id'
  (TypeBits w)    == (TypeBits w')     = w == w'
  (TypeRange l u) == (TypeRange l' u') = l == l' && u == u'
  (TypeUser id)   == (TypeUser id')    = id == id'
  TypeVoid        == TypeVoid          = True
  _ == _ = False

-- Big TODO!
sizeofType :: Type -> Word
sizeofType TypeVoid = 0
sizeofType TypeLongPtr = 3
sizeofType _ = 2

(<?) :: (Integral a) => a -> (a, a) -> Bool
n <? (l, u) = n >= l && n <= u

(<:?) :: (Integral a) => (a, a) -> (a, a) -> Bool
(m1, n1) <:? (m2, n2) = m1 >= m2 && n1 <= n2
