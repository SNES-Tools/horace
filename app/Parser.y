{

module Parser where

import AST
import Token

}

%name parse
%tokentype { Token }
%error { parseError }

%token
  int   { TokenInt $$ }
  '+'   { TokenPlus }
  '*'   { TokenMult }
  '('   { TokenLParen }
  ')'   { TokenRParen }

%left '+'
%left '*'

%%

expr  : int             { ExprLit $1 }
      | expr '+' expr   { ExprBinOp BinOpAdd $1 $3 }
      | expr '*' expr   { ExprBinOp BinOpMult $1 $3 }
      | '(' expr ')'    { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
}
