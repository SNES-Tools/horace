module Token where

data Token
  = TokenInt Int
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
  | TokenVar String
  | TokenColon
  | TokenClamp
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
  -- REG_TYPE
  | TokenBits
  | TokenRange
  | TokenData
  | TokenVoid
  deriving (Show)
