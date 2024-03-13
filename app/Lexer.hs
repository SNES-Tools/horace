module Lexer where

import Data.Char

import Token

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
  | isSpace c = lexer cs
  | isAlpha c = lexVar (c : cs)
  | isDigit c = lexNum (c : cs)
lexer ('{':cs) = TokenLBrace : lexer cs
lexer ('}':cs) = TokenRBrace : lexer cs
lexer ('=':cs) = TokenEq : lexer cs
lexer ('<':'-':cs) = TokenLArrow : lexer cs
lexer ('-':'>':cs) = TokenRArrow : lexer cs
lexer ('(':cs) = TokenLParen : lexer cs
lexer (')':cs) = TokenRParen : lexer cs
lexer ('[':cs) = TokenLBracket : lexer cs
lexer (']':cs) = TokenRBracket : lexer cs
lexer ('_':cs) = TokenUnderscore : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('*':cs) = TokenMult : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('%':cs) = TokenMod : lexer cs
lexer ('<':'<':cs) = TokenLShift : lexer cs
lexer ('>':'>':cs) = TokenRShift : lexer cs
lexer ('&':cs) = TokenAmphersand : lexer cs
lexer ('|':cs) = TokenPipe : lexer cs
lexer ('^':cs) = TokenCaret : lexer cs

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
    ("clamp", rest) -> TokenClamp : lexer rest
    ("shrink", rest) -> TokenShrink : lexer rest
    ("extend", rest) -> TokenExtend : lexer rest
    ("sign-extend", rest) -> TokenSignExtend : lexer rest
    ("display", rest) -> TokenDisplay : lexer rest
    ("bits", rest) -> TokenBits : lexer rest
    ("range", rest) -> TokenRange : lexer rest
    ("data", rest) -> TokenData : lexer rest
    ("void", rest) -> TokenVoid : lexer rest
    (var, rest) -> TokenVar var : lexer rest
