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
  rint  { TokenRInt $$ }
  id    { TokenId $$ }
  idc   { TokenIdC $$ }
  Id    { TokenCapId $$ }
  Idc   { TokenCapIdC $$ }

  str   { TokenString $$ }
  
  var   { TokenVar }
  bits  { TokenBits }
  range { TokenRange }
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

  pressed { TokenPressed }
  holding { TokenHolding }

  A       { TokenButtonA }
  X       { TokenButtonX }
  L       { TokenButtonL }
  R       { TokenButtonR }
  B       { TokenButtonB }
  Y       { TokenButtonY }
  SELECT  { TokenButtonSELECT }
  START   { TokenButtonSTART }
  UP      { TokenButtonUP }
  DOWN    { TokenButtonDOWN }
  LEFT    { TokenButtonLEFT }
  RIGHT   { TokenButtonRIGHT }

  palettes  { TokenPalettes }
  graphics  { TokenGraphics }
  
  spriteT   { TokenSprite }

  sprites   { TokenSprites }
  anims     { TokenAnimations }
  meths     { TokenMethods }
  at        { TokenAt }
  in        { TokenIn }
      
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

mode_decl : mode Id '{' gfx_decl pal_decl types_decl state_decl main_decl func_decl sprite_decl '}'    { Mode $2 $4 $5 $6 $7 $8 $9 $10 }

gfx_decl : graphics '{' gfx_list '}'    { $3 }

gfx_list :              { [] }
         | gfx gfx_list { $1 : $2 }

gfx      : Id ':' gfx_type '=' str     { Graphics $1 $3 $5 }

gfx_type : spriteT { TypeGraphics GfxSprite }

pal_decl : palettes '{' pal_list '}'    { $3 }

pal_list :                  { [] }
         | pal pal_list     { $1 : $2 }

pal      : Id ':' pal_type '=' '[' color_list ']'    { Palette $1 $3 $6 }

pal_type : spriteT { TypePalette PalSprite }

color_list  : color                { [$1] }
            | color ',' color_list { $1 : $3 }

color : '(' int ',' int ',' int ')'   { (fromIntegral $2, fromIntegral $4, fromIntegral $6) }

types_decl : types '{' type_list '}'    { $3 }

type_list  :                            { [] }
           | type type_list             { $1 : $2 }

type : Id '{' type_cases '}'            { UserType $1 $3 }

type_cases : type_case                  { [$1] }
           | type_case ',' type_cases   { $1 : $3 }

type_case  : Id                         { Variant $1 [] }
           | Idc type_vars ')'          { Variant $1 $2 }

type_vars  : type_reg                   { [$1] }
           | type_reg ',' type_vars     { $1 : $3 }

state_decl : state '{' state_vars '}'   { $3 }

state_vars :                            { [] }
           | state_var state_vars       { $1 : $2 }

state_var  : id ':' type_state '=' expr { MVar $1 $3 $5 }

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

sprite_decl : sprites '{' sprite_list '}' { $3 }

sprite_list :                           { [] }
            | sprite sprite_list        { $1 : $2 }

sprite : Id '{' anim_decl state_decl main_decl meth_decl '}'  { Sprite $1 $3 $4 $5 $6 }

anim_decl : anims '{' anim_list '}'     { $3 }

anim_list :                                 { [] }
          | anim anim_list                  { $1 : $2 }

anim : Id '{' tile_list '}'             { Animation $1 $3 }

tile_list : tile                        { [$1] }
          | tile tile_list              { $1 : $2 }

tile : at '(' int ',' int ')' ':' Id '[' int ']' in Id  { Tile (fromIntegral $3) (fromIntegral $5) $8 (fromIntegral $10) $13 }

meth_decl : meths '{' func_list '}'     { $3 }

expr  : int                             { ExprLit $1 }
      | rint                            { ExprRLit $1 }
      | '{' vars exprs '}'              { ExprBlock $2 $3 }
      | if pred then expr else expr     { ExprIf $2 $4 $6 }
      | for id '=' expr to expr do expr { ExprFor $2 $4 $6 $8 }
      | lval '<-' expr                  { ExprAssign $1 $3 }
      | idc args ')'                    { ExprCall $1 $2 }
      | Idc args ')'                    { ExprConstruct $1 $2 }
      | Id                              { ExprConstruct $1 [] }
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

pat : Id              { PatData $1 [] }
    | Idc pats ')'    { PatData $1 $2 }

pats : id          { [$1] }
     | id ',' pats { $1 : $3 }

pred : true             { PredLit True }
     | false            { PredLit False }
     | not pred         { PredUnOp PredNot $2 }
     | pred and pred    { PredBinOp PredAnd $1 $3 }
     | pred or pred     { PredBinOp PredOr $1 $3 }
     | expr comp expr   { PredComp $2 $1 $3 }
     | pressed '[' int ',' button ']'  { PredPressed $3 $5 }
     | holding '[' int ',' button ']'  { PredHolding $3 $5 }

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

button : A      { ButtonA }
       | X      { ButtonX }
       | L      { ButtonL }
       | R      { ButtonR }
       | B      { ButtonB }
       | Y      { ButtonY }
       | SELECT { ButtonSELECT }
       | START  { ButtonSTART }
       | UP     { ButtonUP }
       | DOWN   { ButtonDOWN }
       | LEFT   { ButtonLEFT }
       | RIGHT  { ButtonRIGHT }

type_state : type_reg                 { $1 }

type_reg : bits '[' int ']'           { TypeBits $ fromIntegral $3 }
         | range '[' int ',' int ']'  { TypeRange $3 $5 }
         | Id                         { TypeUser $1 }
         | void                       { TypeVoid }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
}
