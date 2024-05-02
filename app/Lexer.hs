module Lexer where

import Data.Char

import Token

lexer :: String -> [Token]
lexer [] = []
lexer ('-':'>':cs) = TokenRArrow : lexer cs
lexer ('-':c:cs)
  | isDigit c =
    case lexNum (c : cs) of
      (TokenInt i):ts -> (TokenInt (-i)) : ts
  | otherwise = TokenMinus : lexer cs
lexer (c:cs)
  | isSpace c = lexer cs
  | isAlpha c = lexVar (c : cs)
  | isDigit c = lexNum (c : cs)
lexer ('{':cs) = TokenLBrace : lexer cs
lexer ('}':cs) = TokenRBrace : lexer cs
lexer ('=':cs) = TokenEq : lexer cs
lexer ('/':'=':cs) = TokenNeq : lexer cs
lexer ('<':'-':cs) = TokenLArrow : lexer cs
lexer ('<':'<':cs) = TokenLShift : lexer cs
lexer ('>':'>':cs) = TokenRShift : lexer cs
lexer ('<':'=':'$':cs) = TokenLeqS : lexer cs
lexer ('<':'$':cs) = TokenLeS : lexer cs
lexer ('>':'=':'$':cs) = TokenGeqS : lexer cs
lexer ('>':'$':cs) = TokenGeS : lexer cs
lexer ('<':'=':cs) = TokenLeq : lexer cs
lexer ('<':cs) = TokenLe : lexer cs
lexer ('>':'=':cs) = TokenGeq : lexer cs
lexer ('>':cs) = TokenGe : lexer cs
lexer ('(':cs) = TokenLParen : lexer cs
lexer (')':cs) = TokenRParen : lexer cs
lexer ('[':cs) = TokenLBracket : lexer cs
lexer (']':cs) = TokenRBracket : lexer cs
lexer ('_':cs) = TokenUnderscore : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('*':cs) = TokenMult : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('%':cs) = TokenMod : lexer cs
lexer ('&':cs) = TokenAmphersand : lexer cs
lexer ('|':cs) = TokenPipe : lexer cs
lexer ('^':cs) = TokenCaret : lexer cs
lexer ('.':cs) = TokenDot : lexer cs
lexer ('"':cs) = TokenString string : lexer (tail rest)
  where
    (string, rest) = span ((/=) '"') cs

lexNum cs = TokenInt (read num) : lexer rest
  where
    (num, rest) = span isDigit cs

lexVar cs =
  case span isAlpha cs of
    ("if", rest) -> TokenIf : lexer rest
    ("then", rest) -> TokenThen : lexer rest
    ("else", rest) -> TokenElse : lexer rest
    ("for", rest) -> TokenFor : lexer rest
    ("to", rest) -> TokenTo : lexer rest
    ("do", rest) -> TokenDo : lexer rest
    ("match", rest) -> TokenMatch : lexer rest
    ("with", rest) -> TokenWith : lexer rest
    ("transmute", rest) -> TokenTransmute : lexer rest
    ("shrink", rest) -> TokenShrink : lexer rest
    ("extend", rest) -> TokenExtend : lexer rest
    ("sign", '-':'e':'x':'t':'e':'n':'d':rest) -> TokenSignExtend : lexer rest
    ("display", rest) -> TokenDisplay : lexer rest
    ("bits", rest) -> TokenBits : lexer rest
    ("range", rest) -> TokenRange : lexer rest
    ("data", rest) -> TokenData : lexer rest
    ("void", rest) -> TokenVoid : lexer rest
    ("var", rest) -> TokenVar : lexer rest
    ("true", rest) -> TokenTrue : lexer rest
    ("false", rest) -> TokenFalse : lexer rest
    ("and", rest) -> TokenAnd : lexer rest
    ("or", rest) -> TokenOr : lexer rest
    ("not", rest) -> TokenNot : lexer rest
    ("main", rest) -> TokenMain : lexer rest
    ("state", rest) -> TokenState : lexer rest
    ("mode", rest) -> TokenMode : lexer rest
    ("functions", rest) -> TokenFunctions : lexer rest
    ("types", rest) -> TokenTypes : lexer rest
    -- controller feature
    ("pressed", rest) -> TokenPressed : lexer rest
    ("holding", rest) -> TokenHolding : lexer rest
    ("A", rest)       -> TokenButtonA : lexer rest
    ("X", rest)       -> TokenButtonX : lexer rest
    ("L", rest)       -> TokenButtonL : lexer rest
    ("R", rest)       -> TokenButtonR : lexer rest
    ("B", rest)       -> TokenButtonB : lexer rest
    ("Y", rest)       -> TokenButtonY : lexer rest
    ("SELECT", rest)  -> TokenButtonSELECT : lexer rest
    ("START", rest)   -> TokenButtonSTART : lexer rest
    ("UP", rest)      -> TokenButtonUP : lexer rest
    ("DOWN", rest)    -> TokenButtonDOWN : lexer rest
    ("LEFT", rest)    -> TokenButtonLEFT : lexer rest
    ("RIGHT", rest)   -> TokenButtonRIGHT : lexer rest
    -- palettes
    ("graphics", rest) -> TokenGraphics : lexer rest
    ("palettes", rest) -> TokenPalettes : lexer rest
    ("sprite", rest)   -> TokenSprite : lexer rest
    -- literals
    ("r", '-':rest) -> TokenRInt (-(read num)) : lexer rest'
      where (num, rest') = span isDigit rest
    ("r", rest) -> TokenRInt (read num) : lexer rest'
      where (num, rest') = span isDigit rest
    (id, rest) ->
      if isUpper $ head id
        then case rest of
               '(':rest -> TokenCapIdC id : lexer rest
               _ -> TokenCapId id : lexer rest
        else case rest of
               '(':rest -> TokenIdC id : lexer rest
               _ -> TokenId id : lexer rest
