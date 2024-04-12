{

module Parser where

import AST
import Token
import Type

}

%name parse
%tokentype { Token }
%error { parseError }

%token
  mode  { TokenMode }
  state { TokenState }
  main  { TokenMain }
  funcs { TokenFunctions }
  types { TokenTypes }
  
  int   { TokenInt $$ }
  id    { TokenId $$ }
  idc   { TokenIdC $$ }
  var   { TokenVar }
  bits  { TokenBits }
  range { TokenRange }
  data  { TokenData }
  void  { TokenVoid }
  if    { TokenIf }
  then  { TokenThen }
  else  { TokenElse }
  for   { TokenFor }
  to    { TokenTo }
  do    { TokenDo }
  match { TokenMatch }
  with  { TokenWith }
  true  { TokenTrue }
  false { TokenFalse }
  not   { TokenNot }
  and   { TokenAnd }
  or    { TokenOr }
  trans { TokenTransmute }
  shrink{ TokenShrink }
  ext   { TokenExtend }
  sext  { TokenSignExtend }
  '+'   { TokenPlus }
  '-'   { TokenMinus }
  '&'   { TokenAmphersand }
  '|'   { TokenPipe }
  '^'   { TokenCaret }
  '='   { TokenEq }
  '/='  { TokenNeq }
  '('   { TokenLParen }
  ')'   { TokenRParen }
  '{'   { TokenLBrace }
  '}'   { TokenRBrace }
  '['   { TokenLBracket }
  ']'   { TokenRBracket }
  ':'   { TokenColon }
  ','   { TokenComma }
  '.'   { TokenDot }
  '_'   { TokenUnderscore }
  '->'  { TokenRArrow }
  '<-'  { TokenLArrow }
  '<'   { TokenLe }
  '>'   { TokenGe }
  '<='  { TokenLeq }
  '>='  { TokenGeq }
  '<$'  { TokenLeS }
  '<=$' { TokenLeqS }
  '>$'  { TokenGeS }
  '>=$' { TokenGeqS }

%right '<-'
%left or
%left and
%right not
%left '|'
%left '^'
%left '&'
%left '+' '-'
%left '.'
%right else do

%%

mode_decl : mode id '{' types_decl state_decl main_decl func_decl '}'    { Mode $2 $4 $5 $6 $7 }

types_decl : types '{' type_list '}'    { $3 }

type_list  :                            { [] }
           | type type_list             { $1 : $2 }

type : id '{' type_cases '}'            { UserType $1 $3 }

type_cases : type_case                  { [$1] }
           | type_case ',' type_cases   { $1 : $3 }

type_case  : id                         { Variant $1 [] }
           | id '(' type_vars ')'       { Variant $1 $3 }

type_vars  : type_reg                   { [$1] }
           | type_reg ',' type_vars     { $1 : $3 }

state_decl : state '{' state_vars '}'   { $3 }

state_vars :                            { [] }
           | state_var state_vars       { $1 : $2 }

state_var  : id ':' type_state '=' expr { MState $1 $3 $5 }

main_decl  : main expr                  { $2 }

func_decl : funcs '{' func_list '}'     { $3 }

func_list :                             { [] }
          | func func_list              { $1 : $2 }

func  : id '(' params ')' ':' type_reg expr { Func $1 $3 $6 $7 }
      | idc params ')' ':' type_reg expr    { Func $1 $2 $5 $6 }

params :                                { [] }
       | param                          { [$1] }
       | param ',' params               { $1 : $3 }

param : id ':' type_reg                 { Param $1 $3 }

expr  : int                             { ExprLit $1 }
      | '{' vars exprs '}'              { ExprBlock $2 $3 }
      | if pred then expr else expr     { ExprIf $2 $4 $6 }
      | for id '=' expr to expr do expr { ExprFor $2 $4 $6 $8 }
      | lval '<-' expr                  { ExprAssign $1 $3 }
      | idc args ')'                    { ExprCall $1 $2 }
      | id '.' idc args ')'             { ExprMethodCall $1 $3 $4 }
      | match expr with '{' cases '}'   { ExprMatch $2 $5 }
      | trans '[' int ',' int ']' '(' expr ')'   { ExprUnOp (UnOpTransmute (Just (fromIntegral $3)) (Just (fromIntegral $5))) $8 }
      | ext '[' int ']' '(' expr ')'    { ExprUnOp (UnOpExtend (Just (fromIntegral $3))) $6 }
      | sext '[' int ']' '(' expr ')'   { ExprUnOp (UnOpSignExtend (Just (fromIntegral $3))) $6 }
      | shrink '[' int ']' '(' expr ')' { ExprUnOp (UnOpShrink (Just (fromIntegral $3))) $6 }
      | expr '+' expr                   { ExprBinOp BinOpAdd $1 $3 }
      | expr '-' expr                   { ExprBinOp BinOpSub $1 $3 }
      | expr '&' expr                   { ExprBinOp BinOpBitAnd $1 $3 }
      | expr '^' expr                   { ExprBinOp BinOpBitEor $1 $3 }
      | expr '|' expr                   { ExprBinOp BinOpBitOr $1 $3 }
      | id                              { ExprVar $1 }
      | '(' expr ')'                    { $2 }
      | void                            { ExprVoid }

lval : id               { LValId $1 }
     | id '[' expr ']'  { LValArrIndex $1 $3 }

exprs :             { [] }
      | expr exprs  { $1 : $2 }

vars :                { [] }
     | var_decl vars  { $1 : $2 }

var_decl : var id ':' type_reg '=' expr  { Var $2 $4 $6 }

args :                { [] }
     | expr           { [$1] }
     | expr ',' args  { $1 : $3 }

cases :             { [] }
      | case cases  { $1 : $2 }

case : pat '->' expr  { ($1, $3) }

pat : '_'             { PatWildcard }
    | int             { PatLit $1 }
    | id              { PatData $1 [] }
    | id '(' pats ')' { PatData $1 $3 }

pats :              { [] }
     | pat ',' pats { $1 : $3 }

pred : true             { PredLit True }
     | false            { PredLit False }
     | not pred         { PredUnOp PredNot $2 }
     | pred and pred    { PredBinOp PredAnd $1 $3 }
     | pred or pred     { PredBinOp PredOr $1 $3 }
     | expr comp expr   { PredComp $2 $1 $3 }

comp : '='    { CompEq }
     | '/='   { CompNeq }
     | '<'    { CompLe }
     | '>'    { CompGe }
     | '<='   { CompLeq }
     | '>='   { CompGeq }
     | '<$'   { CompLeS }
     | '>$'   { CompGeS }
     | '<=$'  { CompLeqS }
     | '>=$'  { CompGeqS }

type_state : type_reg                 { $1 }

type_reg : bits '[' int ']'           { TypeBits $ fromIntegral $3 }
         | range '[' int ',' int ']'  { TypeRange $3 $5 }
         | data id                    { TypeUser $2 }
         | void                       { TypeVoid }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
}
