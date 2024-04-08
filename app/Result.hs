module Result where

type ErrorMessage = String

type Result a = Either ErrorMessage a

-- type error
typeError :: [String] -> Result a
typeError = Left . unwords
