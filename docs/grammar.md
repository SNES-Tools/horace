## Declarations

### Mode declaration
```
MODE_DECL ::= mode ID { GFX_DECL
                        PAL_DECL
                        TYPES_DECL
                        STATE_DECL
                        INIT_DECL
                        MAIN_DECL
                        SPRITE_DECL
                        FUNC_DECL }
```

### Graphics declaration
```
GFX_DECL ::= graphics { GFX_LIST }

GFX_LIST ::= ""
           | GFX_FILE
           | GFX_FILE GFX_LIST

GFX_FILE ::= in FILE as BIT_DEPTH, SIZE { GFX_ITEM_LIST }

FILE ::= STRING

BIT_DEPTH ::= 2bpp
            | 4bpp
            | 8bpp

SIZE ::= 8x8
       | 16x16

GFX_ITEM_LIST ::= ""
                | GFX_ITEM 
                | GFX_ITEM GFX_ITEM_LIST

GFX_ITEM ::= ID
           | ID[NAT]
```

### Palette declaration
```
PAL_DECL ::= ID: BIT_DEPTH, PAL_USAGE = [PAL_LIST]

PAL_USAGE ::= background
            | objects

PAL_LIST ::= PAL_ENTRY
           | PAL_ENTRY PAL_LIST

PAL_ENTRY ::= rgb(INT, INT, INT)
```

### Algebraic data type declarations
```
TYPES_DECL ::= types { TYPE_DECL_LIST }

TYPE_DECL_LIST ::= ""
                 | TYPE_DECL
                 | TYPE_DECL TYLE_DECL_LIST

TYPE_DECL ::= ID { TYPE_CASES }
            | ID [TYPE_VARS] { TYPE_CASES }

TYPE_VARS ::= ID
            | ID, TYPE_VARS

TYPE_CASES ::= TYPE_CASE
             | TYPE_CASE, TYPE_CASES

TYPE_CASES ::= ID
             | ID(TYPE_VARS)
```

### State declarations

```
STATE_DECL ::= state { STATE_VARS }

STATE_VARS ::= ""
             | STATE_VAR
             | STATE_VAR STATE_VARS

STATE_VAR ::= ID: STATE_TYPE = EXPR
```

### Expression declarations
```
INIT_DECL ::= init EXPR

MAIN_DECL ::= main EXPR
```

### Sprite declarations
```
SPRITE_DECL ::= sprites { SPRITE_LIST }

SPRITE_LIST ::= ""
              | SPRITE
              | SPRITE SPRITE_LIST

SPRITE ::= ID { ANIMATION_DECL
                SPRITE_STATE_DECL
                SPRITE_INIT_DECL
                METHODS_DECL }
```

#### Animation declarations
```
ANIMATION_DECL ::= animations { ANIMATION_LIST }

ANIMATION_LIST ::= ""
                 | ANIMATION
                 | ANIMATION ANIMATION_LIST

ANIMATION ::= ID { ANIM_GRAPHIC_LIST }

ANIM_GRAPHIC_LIST ::= ""
                    | ANIM_GRAPHIC
                    | ANIM_GRAPHIC ANIM_GRAPHIC_LIST

ANIM_GRAPHIC ::= at offset(INT, INT): ID in ID
```
#### Sprite state declarations
```
SPRITE_STATE_DECL ::= state { SPRITE_STATE_VARS }

SPRITE_STATE_VARS ::= ""
                    | SPRITE_STATE_VAR
                    | SPRITE_STATE_VAR SPRITE_STATE_VARS

SPRITE_STATE_VAR ::= ID: REG_TYPE
```

#### Sprite initialization declaration
```
SPRITE_INIT_DECL ::= init(PARAM) EXPR
```

#### Method declarations
```
METHODS_DECL ::= methods { METHOD_LIST }

METHOD_LIST ::= ""
              | METHOD
              | METHOD METHOD_LIST

METHOD ::= ID(PARAM_LIST): REG_TYPE EXPR
```

### Function declarations
```
FUNC_DECL ::= functions { FUNC_LIST }

FUNC_LIST ::= ""
            | FUNC
            | FUNC FUNC_LIST

FUNC ::= ID(PARAM_LIST): REG_TYPE EXPR
```

#### Parameters
```
PARAM_LIST ::= ""
             | PARAM
             | PARAM, PARAM_LIST

PARAM ::= ID: REG_TYPE
```

## Expressions

```
EXPR ::= INT
       | { VAR_LIST EXPR_LIST }    -- block
       | if PRED then EXPR else EXPR
       | for ID = EXPR to EXPR do EXPR
       | LVAL <- EXPR
       | ID(EXPR_ARGS)      -- comma separated
       | EXPR.ID(EXPR_ARGS)   -- method call
       | match EXPR with MATCH_CASES
       | UNOP EXPR
       | EXPR BINOP EXPR
       | ID
       | EXPR[EXPR]

LVAL ::= ID
       | ID[EXPR]

MATCH_CASES ::= ""
              | MATCH_CASE
              | MATCH_CASE MATCH_CASES

MATCH_CASE ::= PATTERN -> EXPR

PATTERN ::= ID
          | _
          | ID(PATTERN_LIST)

PATTERN_LIST ::= PATTERN
               | PATTERN, PATTERN_LIST

VAR_LIST ::= ""
           | VAR VAR_LIST

VAR ::= var ID: REG_TYPE = EXPR

EXPR_LIST ::= EXPR
            | EXPR EXPR_LIST

EXPR_ARGS ::= ""
            | EXPR
            | EXPR, EXPR_ARGS

UNOP ::= transmute
       | shrink n
       | extend n
       | sign-extend n
       | display

-- precedence rules between binary operations should be as usual
-- i.e. just look up what it is in C
BINOP ::= +
        | -
        | *
        | /
        | %
        | <<
        | >>
        | &
        | |
        | ^
```

## Predicates

```
PRED ::= BOOL
       | PRED_UNOP PRED
       | PRED PRED_BINOP PRED
       | PRED INT_COMP PRED

BOOL ::= true
       | false

PRED_UNOP ::= not

PRED_BINOP ::= and
             | or

INT_COMP ::= =
           | /=
           | <
           | <=
           | >
           | >=
           | <$
           | <=$
           | >$
           | >=$
```

## Types

```
STATE_TYPE ::= array[REG_TYPE,NAT]
             | sprite ID
             | REG_TYPE

REG_TYPE ::= bits[NAT]
           | range[INT,INT]
           | data ID
           | void
```

## Precedence order

1. `*`, `/`, `%`
1. `+`, `-`
1. `<<`, `>>`
1. `<`, `<=`, `<$`, `<=$`, `>`, `>=`, `>$`, `>=$`
1. `=`, `/=`
1. `&`
1. `^`
1. `|`
1. `and`
1. `or`
1. `<-`
