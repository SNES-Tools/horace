module Token where

data Token
  = TokenInt Int
  | TokenId String
  | TokenIdC String
  | TokenCapId String
  | TokenCapIdC String
  | TokenLBrace
  | TokenRBrace
  | TokenIf
  | TokenThen
  | TokenElse
  | TokenFor
  | TokenEq
  | TokenTo
  | TokenDo
  | TokenLArrow
  | TokenRArrow
  | TokenLParen
  | TokenRParen
  | TokenPeriod
  | TokenMatch
  | TokenWith
  | TokenLBracket
  | TokenRBracket
  | TokenUnderscore
  | TokenComma
  | TokenVar
  | TokenColon
  | TokenTransmute
  | TokenShrink
  | TokenExtend
  | TokenSignExtend
  | TokenDisplay
  | TokenPlus
  | TokenMinus
  | TokenMult
  | TokenDiv
  | TokenMod
  | TokenLShift
  | TokenRShift
  | TokenAmphersand
  | TokenPipe
  | TokenCaret
  | TokenDot
  -- predicate stuff
  | TokenTrue
  | TokenFalse
  | TokenAnd
  | TokenOr
  | TokenNot
  | TokenNeq
  | TokenLe
  | TokenLeS
  | TokenLeq
  | TokenLeqS
  | TokenGe
  | TokenGeS
  | TokenGeq
  | TokenGeqS
  -- REG_TYPE
  | TokenBits
  | TokenRange
  | TokenData
  | TokenVoid
  -- mode stuff
  | TokenMode
  | TokenState
  | TokenMain
  | TokenFunctions
  | TokenTypes
  deriving (Show)
