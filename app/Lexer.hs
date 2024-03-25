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
    ("sign-extend", rest) -> TokenSignExtend : lexer rest
    ("display", rest) -> TokenDisplay : lexer rest
    ("bits", rest) -> TokenBits : lexer rest
    ("range", rest) -> TokenRange : lexer rest
    ("data", rest) -> TokenData : lexer rest
    ("void", rest) -> TokenVoid : lexer rest
    ("var", rest) -> TokenVar : lexer rest
    ("true", rest) -> TokenTrue : lexer rest
    ("false", rest) -> TokenFalse : lexer rest
    (id, rest) ->
      case rest of
        '(':rest -> TokenIdC id : lexer rest
        _ -> TokenId id : lexer rest
