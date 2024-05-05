{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Token
import Type
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32
	| HappyAbsSyn33 t33
	| HappyAbsSyn34 t34
	| HappyAbsSyn35 t35
	| HappyAbsSyn36 t36
	| HappyAbsSyn37 t37
	| HappyAbsSyn38 t38
	| HappyAbsSyn39 t39
	| HappyAbsSyn40 t40
	| HappyAbsSyn41 t41
	| HappyAbsSyn42 t42
	| HappyAbsSyn43 t43
	| HappyAbsSyn44 t44
	| HappyAbsSyn45 t45
	| HappyAbsSyn46 t46
	| HappyAbsSyn47 t47
	| HappyAbsSyn48 t48
	| HappyAbsSyn49 t49
	| HappyAbsSyn50 t50
	| HappyAbsSyn51 t51
	| HappyAbsSyn52 t52
	| HappyAbsSyn53 t53

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,571) ([0,0,0,32,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,8192,0,0,0,0,16384,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,64,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,64,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,16384,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,64,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,128,0,0,0,0,4,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2176,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,64745,0,10240,0,0,0,0,4096,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,32768,0,0,0,0,64512,2352,60,0,40,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,64,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,16384,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,8192,0,0,0,0,64512,2352,60,0,40,0,0,0,0,512,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,4592,0,0,0,0,1024,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,4096,0,61440,1,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,61440,32775,127,0,0,0,16384,768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64512,59696,252,0,40,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,496,4,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,4096,0,0,0,0,64512,2352,60,0,40,0,0,0,0,32,0,0,0,0,0,0,0,64512,2352,60,0,40,0,0,0,0,12540,15369,0,10240,0,0,0,0,64512,2352,60,0,40,0,0,0,0,12540,15369,0,10240,0,0,0,0,64512,2352,60,0,40,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,7232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112,0,0,0,0,0,0,0,28672,1,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,61440,257,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,1024,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,64512,59696,252,0,40,0,0,0,0,12540,64745,0,10240,0,0,0,0,64512,2352,60,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,64512,2352,60,61440,41,0,0,0,0,0,0,0,16384,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1024,0,0,0,0,4,0,0,0,0,0,0,0,64512,2352,60,0,40,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,2,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,28,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2048,0,0,0,0,1024,0,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,512,0,61440,1,0,0,0,0,0,0,0,496,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,61440,1,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,7232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4095,0,0,0,0,0,0,0,65280,15,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,64512,2352,60,0,40,0,0,0,0,0,0,0,16384,0,0,0,0,49152,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,12540,15369,0,10240,0,0,0,0,64512,2352,60,0,40,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,7232,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,61440,1,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,16384,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,64512,2352,60,0,40,0,0,0,0,0,0,0,4592,0,0,0,0,0,0,0,61440,17,0,0,0,0,0,0,0,4592,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,1024,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,61440,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,61440,1,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,0,0,0,0,16384,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,16384,28,0,0,0,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,0,1024,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,0,0,12540,15369,0,10240,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,16384,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,61440,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,61440,1,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,2048,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,512,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,8,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","gfx_decl","gfx_list","gfx","gfx_type","pal_decl","pal_list","pal","pal_type","color_list","color","types_decl","type_list","type","type_cases","type_case","type_vars","state_decl","state_vars","state_var","main_decl","func_decl","func_list","func","params","param","sprite_decl","sprite_list","sprite","anim_decl","anim_list","anim","tile_list","tile","meth_decl","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","button","type_state","type_reg","mode","state","main","funcs","types","int","rint","id","idc","Id","Idc","str","var","bits","range","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","pressed","holding","A","X","L","R","B","Y","SELECT","START","UP","DOWN","LEFT","RIGHT","palettes","graphics","spriteT","sprites","anims","meths","at","in","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 136
        bit_end = (st Prelude.+ 1) Prelude.* 136
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..135]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (54) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (54) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (63) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (136) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (118) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (102) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (101) = happyShift action_10
action_6 (9) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (118) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (63) = happyShift action_16
action_8 (6) = happyGoto action_14
action_8 (7) = happyGoto action_15
action_8 _ = happyReduce_3

action_9 (58) = happyShift action_13
action_9 (15) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (118) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (63) = happyShift action_25
action_11 (10) = happyGoto action_23
action_11 (11) = happyGoto action_24
action_11 _ = happyReduce_8

action_12 (55) = happyShift action_22
action_12 (21) = happyGoto action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (118) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (119) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (63) = happyShift action_16
action_15 (6) = happyGoto action_18
action_15 (7) = happyGoto action_15
action_15 _ = happyReduce_3

action_16 (122) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (103) = happyShift action_36
action_17 (8) = happyGoto action_35
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_4

action_19 _ = happyReduce_2

action_20 (63) = happyShift action_34
action_20 (16) = happyGoto action_32
action_20 (17) = happyGoto action_33
action_20 _ = happyReduce_16

action_21 (56) = happyShift action_31
action_21 (24) = happyGoto action_30
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (118) = happyShift action_29
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (119) = happyShift action_28
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (63) = happyShift action_25
action_24 (10) = happyGoto action_27
action_24 (11) = happyGoto action_24
action_24 _ = happyReduce_8

action_25 (122) = happyShift action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (103) = happyShift action_66
action_26 (12) = happyGoto action_65
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_9

action_28 _ = happyReduce_7

action_29 (61) = happyShift action_64
action_29 (22) = happyGoto action_62
action_29 (23) = happyGoto action_63
action_29 _ = happyReduce_26

action_30 (57) = happyShift action_61
action_30 (25) = happyGoto action_60
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (59) = happyShift action_44
action_31 (60) = happyShift action_45
action_31 (61) = happyShift action_46
action_31 (62) = happyShift action_47
action_31 (63) = happyShift action_48
action_31 (64) = happyShift action_49
action_31 (69) = happyShift action_50
action_31 (70) = happyShift action_51
action_31 (73) = happyShift action_52
action_31 (76) = happyShift action_53
action_31 (83) = happyShift action_54
action_31 (84) = happyShift action_55
action_31 (85) = happyShift action_56
action_31 (86) = happyShift action_57
action_31 (116) = happyShift action_58
action_31 (118) = happyShift action_59
action_31 (39) = happyGoto action_42
action_31 (40) = happyGoto action_43
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (119) = happyShift action_41
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (63) = happyShift action_34
action_33 (16) = happyGoto action_40
action_33 (17) = happyGoto action_33
action_33 _ = happyReduce_16

action_34 (118) = happyShift action_39
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (114) = happyShift action_38
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (120) = happyShift action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (59) = happyShift action_107
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (65) = happyShift action_106
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (63) = happyShift action_104
action_39 (64) = happyShift action_105
action_39 (18) = happyGoto action_102
action_39 (19) = happyGoto action_103
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_17

action_41 _ = happyReduce_15

action_42 (109) = happyShift action_97
action_42 (110) = happyShift action_98
action_42 (111) = happyShift action_99
action_42 (112) = happyShift action_100
action_42 (113) = happyShift action_101
action_42 _ = happyReduce_29

action_43 (127) = happyShift action_96
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_51

action_45 _ = happyReduce_52

action_46 (120) = happyShift action_94
action_46 (124) = happyShift action_95
action_46 (127) = happyReduce_74
action_46 _ = happyReduce_71

action_47 (59) = happyShift action_44
action_47 (60) = happyShift action_45
action_47 (61) = happyShift action_46
action_47 (62) = happyShift action_47
action_47 (63) = happyShift action_48
action_47 (64) = happyShift action_49
action_47 (69) = happyShift action_50
action_47 (70) = happyShift action_51
action_47 (73) = happyShift action_52
action_47 (76) = happyShift action_53
action_47 (83) = happyShift action_54
action_47 (84) = happyShift action_55
action_47 (85) = happyShift action_56
action_47 (86) = happyShift action_57
action_47 (116) = happyShift action_58
action_47 (118) = happyShift action_59
action_47 (39) = happyGoto action_91
action_47 (40) = happyGoto action_43
action_47 (44) = happyGoto action_93
action_47 _ = happyReduce_81

action_48 _ = happyReduce_59

action_49 (59) = happyShift action_44
action_49 (60) = happyShift action_45
action_49 (61) = happyShift action_46
action_49 (62) = happyShift action_47
action_49 (63) = happyShift action_48
action_49 (64) = happyShift action_49
action_49 (69) = happyShift action_50
action_49 (70) = happyShift action_51
action_49 (73) = happyShift action_52
action_49 (76) = happyShift action_53
action_49 (83) = happyShift action_54
action_49 (84) = happyShift action_55
action_49 (85) = happyShift action_56
action_49 (86) = happyShift action_57
action_49 (116) = happyShift action_58
action_49 (118) = happyShift action_59
action_49 (39) = happyGoto action_91
action_49 (40) = happyGoto action_43
action_49 (44) = happyGoto action_92
action_49 _ = happyReduce_81

action_50 _ = happyReduce_73

action_51 (59) = happyShift action_44
action_51 (60) = happyShift action_45
action_51 (61) = happyShift action_46
action_51 (62) = happyShift action_47
action_51 (63) = happyShift action_48
action_51 (64) = happyShift action_49
action_51 (69) = happyShift action_50
action_51 (70) = happyShift action_51
action_51 (73) = happyShift action_52
action_51 (76) = happyShift action_53
action_51 (78) = happyShift action_86
action_51 (79) = happyShift action_87
action_51 (80) = happyShift action_88
action_51 (83) = happyShift action_54
action_51 (84) = happyShift action_55
action_51 (85) = happyShift action_56
action_51 (86) = happyShift action_57
action_51 (87) = happyShift action_89
action_51 (88) = happyShift action_90
action_51 (116) = happyShift action_58
action_51 (118) = happyShift action_59
action_51 (39) = happyGoto action_84
action_51 (40) = happyGoto action_43
action_51 (49) = happyGoto action_85
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (61) = happyShift action_83
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (59) = happyShift action_44
action_53 (60) = happyShift action_45
action_53 (61) = happyShift action_46
action_53 (62) = happyShift action_47
action_53 (63) = happyShift action_48
action_53 (64) = happyShift action_49
action_53 (69) = happyShift action_50
action_53 (70) = happyShift action_51
action_53 (73) = happyShift action_52
action_53 (76) = happyShift action_53
action_53 (83) = happyShift action_54
action_53 (84) = happyShift action_55
action_53 (85) = happyShift action_56
action_53 (86) = happyShift action_57
action_53 (116) = happyShift action_58
action_53 (118) = happyShift action_59
action_53 (39) = happyGoto action_82
action_53 (40) = happyGoto action_43
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (120) = happyShift action_81
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (120) = happyShift action_80
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (120) = happyShift action_79
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (120) = happyShift action_78
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (59) = happyShift action_44
action_58 (60) = happyShift action_45
action_58 (61) = happyShift action_46
action_58 (62) = happyShift action_47
action_58 (63) = happyShift action_48
action_58 (64) = happyShift action_49
action_58 (69) = happyShift action_50
action_58 (70) = happyShift action_51
action_58 (73) = happyShift action_52
action_58 (76) = happyShift action_53
action_58 (83) = happyShift action_54
action_58 (84) = happyShift action_55
action_58 (85) = happyShift action_56
action_58 (86) = happyShift action_57
action_58 (116) = happyShift action_58
action_58 (118) = happyShift action_59
action_58 (39) = happyGoto action_77
action_58 (40) = happyGoto action_43
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (66) = happyShift action_76
action_59 (42) = happyGoto action_74
action_59 (43) = happyGoto action_75
action_59 _ = happyReduce_78

action_60 (104) = happyShift action_73
action_60 (30) = happyGoto action_72
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (118) = happyShift action_71
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (119) = happyShift action_70
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (61) = happyShift action_64
action_63 (22) = happyGoto action_69
action_63 (23) = happyGoto action_63
action_63 _ = happyReduce_26

action_64 (122) = happyShift action_68
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (114) = happyShift action_67
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_11

action_67 (120) = happyShift action_164
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (63) = happyShift action_111
action_68 (67) = happyShift action_112
action_68 (68) = happyShift action_113
action_68 (69) = happyShift action_114
action_68 (52) = happyGoto action_162
action_68 (53) = happyGoto action_163
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_27

action_70 _ = happyReduce_25

action_71 (61) = happyShift action_160
action_71 (62) = happyShift action_161
action_71 (26) = happyGoto action_158
action_71 (27) = happyGoto action_159
action_71 _ = happyReduce_31

action_72 (119) = happyShift action_157
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (118) = happyShift action_156
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (59) = happyShift action_44
action_74 (60) = happyShift action_45
action_74 (61) = happyShift action_46
action_74 (62) = happyShift action_47
action_74 (63) = happyShift action_48
action_74 (64) = happyShift action_49
action_74 (69) = happyShift action_50
action_74 (70) = happyShift action_51
action_74 (73) = happyShift action_52
action_74 (76) = happyShift action_53
action_74 (83) = happyShift action_54
action_74 (84) = happyShift action_55
action_74 (85) = happyShift action_56
action_74 (86) = happyShift action_57
action_74 (116) = happyShift action_58
action_74 (118) = happyShift action_59
action_74 (39) = happyGoto action_154
action_74 (40) = happyGoto action_43
action_74 (41) = happyGoto action_155
action_74 _ = happyReduce_76

action_75 (66) = happyShift action_76
action_75 (42) = happyGoto action_153
action_75 (43) = happyGoto action_75
action_75 _ = happyReduce_78

action_76 (61) = happyShift action_152
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (109) = happyShift action_97
action_77 (110) = happyShift action_98
action_77 (111) = happyShift action_99
action_77 (112) = happyShift action_100
action_77 (113) = happyShift action_101
action_77 (117) = happyShift action_151
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (59) = happyShift action_150
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (59) = happyShift action_149
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (59) = happyShift action_148
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (59) = happyShift action_147
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (77) = happyShift action_146
action_82 (109) = happyShift action_97
action_82 (110) = happyShift action_98
action_82 (111) = happyShift action_99
action_82 (112) = happyShift action_100
action_82 (113) = happyShift action_101
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (114) = happyShift action_145
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (109) = happyShift action_97
action_84 (110) = happyShift action_98
action_84 (111) = happyShift action_99
action_84 (112) = happyShift action_100
action_84 (113) = happyShift action_101
action_84 (114) = happyShift action_135
action_84 (115) = happyShift action_136
action_84 (128) = happyShift action_137
action_84 (129) = happyShift action_138
action_84 (130) = happyShift action_139
action_84 (131) = happyShift action_140
action_84 (132) = happyShift action_141
action_84 (133) = happyShift action_142
action_84 (134) = happyShift action_143
action_84 (135) = happyShift action_144
action_84 (50) = happyGoto action_134
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (71) = happyShift action_131
action_85 (81) = happyShift action_132
action_85 (82) = happyShift action_133
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_91

action_87 _ = happyReduce_92

action_88 (59) = happyShift action_44
action_88 (60) = happyShift action_45
action_88 (61) = happyShift action_46
action_88 (62) = happyShift action_47
action_88 (63) = happyShift action_48
action_88 (64) = happyShift action_49
action_88 (69) = happyShift action_50
action_88 (70) = happyShift action_51
action_88 (73) = happyShift action_52
action_88 (76) = happyShift action_53
action_88 (78) = happyShift action_86
action_88 (79) = happyShift action_87
action_88 (80) = happyShift action_88
action_88 (83) = happyShift action_54
action_88 (84) = happyShift action_55
action_88 (85) = happyShift action_56
action_88 (86) = happyShift action_57
action_88 (87) = happyShift action_89
action_88 (88) = happyShift action_90
action_88 (116) = happyShift action_58
action_88 (118) = happyShift action_59
action_88 (39) = happyGoto action_84
action_88 (40) = happyGoto action_43
action_88 (49) = happyGoto action_130
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (120) = happyShift action_129
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (120) = happyShift action_128
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (109) = happyShift action_97
action_91 (110) = happyShift action_98
action_91 (111) = happyShift action_99
action_91 (112) = happyShift action_100
action_91 (113) = happyShift action_101
action_91 (123) = happyShift action_127
action_91 _ = happyReduce_82

action_92 (117) = happyShift action_126
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (117) = happyShift action_125
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (59) = happyShift action_44
action_94 (60) = happyShift action_45
action_94 (61) = happyShift action_46
action_94 (62) = happyShift action_47
action_94 (63) = happyShift action_48
action_94 (64) = happyShift action_49
action_94 (69) = happyShift action_50
action_94 (70) = happyShift action_51
action_94 (73) = happyShift action_52
action_94 (76) = happyShift action_53
action_94 (83) = happyShift action_54
action_94 (84) = happyShift action_55
action_94 (85) = happyShift action_56
action_94 (86) = happyShift action_57
action_94 (116) = happyShift action_58
action_94 (118) = happyShift action_59
action_94 (39) = happyGoto action_124
action_94 (40) = happyGoto action_43
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (62) = happyShift action_123
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (59) = happyShift action_44
action_96 (60) = happyShift action_45
action_96 (61) = happyShift action_46
action_96 (62) = happyShift action_47
action_96 (63) = happyShift action_48
action_96 (64) = happyShift action_49
action_96 (69) = happyShift action_50
action_96 (70) = happyShift action_51
action_96 (73) = happyShift action_52
action_96 (76) = happyShift action_53
action_96 (83) = happyShift action_54
action_96 (84) = happyShift action_55
action_96 (85) = happyShift action_56
action_96 (86) = happyShift action_57
action_96 (116) = happyShift action_58
action_96 (118) = happyShift action_59
action_96 (39) = happyGoto action_122
action_96 (40) = happyGoto action_43
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (59) = happyShift action_44
action_97 (60) = happyShift action_45
action_97 (61) = happyShift action_46
action_97 (62) = happyShift action_47
action_97 (63) = happyShift action_48
action_97 (64) = happyShift action_49
action_97 (69) = happyShift action_50
action_97 (70) = happyShift action_51
action_97 (73) = happyShift action_52
action_97 (76) = happyShift action_53
action_97 (83) = happyShift action_54
action_97 (84) = happyShift action_55
action_97 (85) = happyShift action_56
action_97 (86) = happyShift action_57
action_97 (116) = happyShift action_58
action_97 (118) = happyShift action_59
action_97 (39) = happyGoto action_121
action_97 (40) = happyGoto action_43
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (59) = happyShift action_44
action_98 (60) = happyShift action_45
action_98 (61) = happyShift action_46
action_98 (62) = happyShift action_47
action_98 (63) = happyShift action_48
action_98 (64) = happyShift action_49
action_98 (69) = happyShift action_50
action_98 (70) = happyShift action_51
action_98 (73) = happyShift action_52
action_98 (76) = happyShift action_53
action_98 (83) = happyShift action_54
action_98 (84) = happyShift action_55
action_98 (85) = happyShift action_56
action_98 (86) = happyShift action_57
action_98 (116) = happyShift action_58
action_98 (118) = happyShift action_59
action_98 (39) = happyGoto action_120
action_98 (40) = happyGoto action_43
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (59) = happyShift action_44
action_99 (60) = happyShift action_45
action_99 (61) = happyShift action_46
action_99 (62) = happyShift action_47
action_99 (63) = happyShift action_48
action_99 (64) = happyShift action_49
action_99 (69) = happyShift action_50
action_99 (70) = happyShift action_51
action_99 (73) = happyShift action_52
action_99 (76) = happyShift action_53
action_99 (83) = happyShift action_54
action_99 (84) = happyShift action_55
action_99 (85) = happyShift action_56
action_99 (86) = happyShift action_57
action_99 (116) = happyShift action_58
action_99 (118) = happyShift action_59
action_99 (39) = happyGoto action_119
action_99 (40) = happyGoto action_43
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (59) = happyShift action_44
action_100 (60) = happyShift action_45
action_100 (61) = happyShift action_46
action_100 (62) = happyShift action_47
action_100 (63) = happyShift action_48
action_100 (64) = happyShift action_49
action_100 (69) = happyShift action_50
action_100 (70) = happyShift action_51
action_100 (73) = happyShift action_52
action_100 (76) = happyShift action_53
action_100 (83) = happyShift action_54
action_100 (84) = happyShift action_55
action_100 (85) = happyShift action_56
action_100 (86) = happyShift action_57
action_100 (116) = happyShift action_58
action_100 (118) = happyShift action_59
action_100 (39) = happyGoto action_118
action_100 (40) = happyGoto action_43
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (59) = happyShift action_44
action_101 (60) = happyShift action_45
action_101 (61) = happyShift action_46
action_101 (62) = happyShift action_47
action_101 (63) = happyShift action_48
action_101 (64) = happyShift action_49
action_101 (69) = happyShift action_50
action_101 (70) = happyShift action_51
action_101 (73) = happyShift action_52
action_101 (76) = happyShift action_53
action_101 (83) = happyShift action_54
action_101 (84) = happyShift action_55
action_101 (85) = happyShift action_56
action_101 (86) = happyShift action_57
action_101 (116) = happyShift action_58
action_101 (118) = happyShift action_59
action_101 (39) = happyGoto action_117
action_101 (40) = happyGoto action_43
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (119) = happyShift action_116
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (123) = happyShift action_115
action_103 _ = happyReduce_19

action_104 _ = happyReduce_21

action_105 (63) = happyShift action_111
action_105 (67) = happyShift action_112
action_105 (68) = happyShift action_113
action_105 (69) = happyShift action_114
action_105 (20) = happyGoto action_109
action_105 (53) = happyGoto action_110
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_5

action_107 (121) = happyShift action_108
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_6

action_109 (117) = happyShift action_200
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (123) = happyShift action_199
action_110 _ = happyReduce_23

action_111 _ = happyReduce_124

action_112 (120) = happyShift action_198
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (120) = happyShift action_197
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_125

action_115 (63) = happyShift action_104
action_115 (64) = happyShift action_105
action_115 (18) = happyGoto action_196
action_115 (19) = happyGoto action_103
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_18

action_117 (109) = happyShift action_97
action_117 (110) = happyShift action_98
action_117 (111) = happyShift action_99
action_117 _ = happyReduce_69

action_118 (109) = happyShift action_97
action_118 (110) = happyShift action_98
action_118 (111) = happyShift action_99
action_118 (113) = happyShift action_101
action_118 _ = happyReduce_70

action_119 (109) = happyShift action_97
action_119 (110) = happyShift action_98
action_119 _ = happyReduce_68

action_120 _ = happyReduce_67

action_121 _ = happyReduce_66

action_122 (109) = happyShift action_97
action_122 (110) = happyShift action_98
action_122 (111) = happyShift action_99
action_122 (112) = happyShift action_100
action_122 (113) = happyShift action_101
action_122 _ = happyReduce_56

action_123 (59) = happyShift action_44
action_123 (60) = happyShift action_45
action_123 (61) = happyShift action_46
action_123 (62) = happyShift action_47
action_123 (63) = happyShift action_48
action_123 (64) = happyShift action_49
action_123 (69) = happyShift action_50
action_123 (70) = happyShift action_51
action_123 (73) = happyShift action_52
action_123 (76) = happyShift action_53
action_123 (83) = happyShift action_54
action_123 (84) = happyShift action_55
action_123 (85) = happyShift action_56
action_123 (86) = happyShift action_57
action_123 (116) = happyShift action_58
action_123 (118) = happyShift action_59
action_123 (39) = happyGoto action_91
action_123 (40) = happyGoto action_43
action_123 (44) = happyGoto action_195
action_123 _ = happyReduce_81

action_124 (109) = happyShift action_97
action_124 (110) = happyShift action_98
action_124 (111) = happyShift action_99
action_124 (112) = happyShift action_100
action_124 (113) = happyShift action_101
action_124 (121) = happyShift action_194
action_124 _ = happyFail (happyExpListPerState 124)

action_125 _ = happyReduce_57

action_126 _ = happyReduce_58

action_127 (59) = happyShift action_44
action_127 (60) = happyShift action_45
action_127 (61) = happyShift action_46
action_127 (62) = happyShift action_47
action_127 (63) = happyShift action_48
action_127 (64) = happyShift action_49
action_127 (69) = happyShift action_50
action_127 (70) = happyShift action_51
action_127 (73) = happyShift action_52
action_127 (76) = happyShift action_53
action_127 (83) = happyShift action_54
action_127 (84) = happyShift action_55
action_127 (85) = happyShift action_56
action_127 (86) = happyShift action_57
action_127 (116) = happyShift action_58
action_127 (118) = happyShift action_59
action_127 (39) = happyGoto action_91
action_127 (40) = happyGoto action_43
action_127 (44) = happyGoto action_193
action_127 _ = happyReduce_81

action_128 (59) = happyShift action_192
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (59) = happyShift action_191
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_93

action_131 (59) = happyShift action_44
action_131 (60) = happyShift action_45
action_131 (61) = happyShift action_46
action_131 (62) = happyShift action_47
action_131 (63) = happyShift action_48
action_131 (64) = happyShift action_49
action_131 (69) = happyShift action_50
action_131 (70) = happyShift action_51
action_131 (73) = happyShift action_52
action_131 (76) = happyShift action_53
action_131 (83) = happyShift action_54
action_131 (84) = happyShift action_55
action_131 (85) = happyShift action_56
action_131 (86) = happyShift action_57
action_131 (116) = happyShift action_58
action_131 (118) = happyShift action_59
action_131 (39) = happyGoto action_190
action_131 (40) = happyGoto action_43
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (59) = happyShift action_44
action_132 (60) = happyShift action_45
action_132 (61) = happyShift action_46
action_132 (62) = happyShift action_47
action_132 (63) = happyShift action_48
action_132 (64) = happyShift action_49
action_132 (69) = happyShift action_50
action_132 (70) = happyShift action_51
action_132 (73) = happyShift action_52
action_132 (76) = happyShift action_53
action_132 (78) = happyShift action_86
action_132 (79) = happyShift action_87
action_132 (80) = happyShift action_88
action_132 (83) = happyShift action_54
action_132 (84) = happyShift action_55
action_132 (85) = happyShift action_56
action_132 (86) = happyShift action_57
action_132 (87) = happyShift action_89
action_132 (88) = happyShift action_90
action_132 (116) = happyShift action_58
action_132 (118) = happyShift action_59
action_132 (39) = happyGoto action_84
action_132 (40) = happyGoto action_43
action_132 (49) = happyGoto action_189
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (59) = happyShift action_44
action_133 (60) = happyShift action_45
action_133 (61) = happyShift action_46
action_133 (62) = happyShift action_47
action_133 (63) = happyShift action_48
action_133 (64) = happyShift action_49
action_133 (69) = happyShift action_50
action_133 (70) = happyShift action_51
action_133 (73) = happyShift action_52
action_133 (76) = happyShift action_53
action_133 (78) = happyShift action_86
action_133 (79) = happyShift action_87
action_133 (80) = happyShift action_88
action_133 (83) = happyShift action_54
action_133 (84) = happyShift action_55
action_133 (85) = happyShift action_56
action_133 (86) = happyShift action_57
action_133 (87) = happyShift action_89
action_133 (88) = happyShift action_90
action_133 (116) = happyShift action_58
action_133 (118) = happyShift action_59
action_133 (39) = happyGoto action_84
action_133 (40) = happyGoto action_43
action_133 (49) = happyGoto action_188
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (59) = happyShift action_44
action_134 (60) = happyShift action_45
action_134 (61) = happyShift action_46
action_134 (62) = happyShift action_47
action_134 (63) = happyShift action_48
action_134 (64) = happyShift action_49
action_134 (69) = happyShift action_50
action_134 (70) = happyShift action_51
action_134 (73) = happyShift action_52
action_134 (76) = happyShift action_53
action_134 (83) = happyShift action_54
action_134 (84) = happyShift action_55
action_134 (85) = happyShift action_56
action_134 (86) = happyShift action_57
action_134 (116) = happyShift action_58
action_134 (118) = happyShift action_59
action_134 (39) = happyGoto action_187
action_134 (40) = happyGoto action_43
action_134 _ = happyFail (happyExpListPerState 134)

action_135 _ = happyReduce_99

action_136 _ = happyReduce_100

action_137 _ = happyReduce_101

action_138 _ = happyReduce_102

action_139 _ = happyReduce_103

action_140 _ = happyReduce_104

action_141 _ = happyReduce_105

action_142 _ = happyReduce_107

action_143 _ = happyReduce_106

action_144 _ = happyReduce_108

action_145 (59) = happyShift action_44
action_145 (60) = happyShift action_45
action_145 (61) = happyShift action_46
action_145 (62) = happyShift action_47
action_145 (63) = happyShift action_48
action_145 (64) = happyShift action_49
action_145 (69) = happyShift action_50
action_145 (70) = happyShift action_51
action_145 (73) = happyShift action_52
action_145 (76) = happyShift action_53
action_145 (83) = happyShift action_54
action_145 (84) = happyShift action_55
action_145 (85) = happyShift action_56
action_145 (86) = happyShift action_57
action_145 (116) = happyShift action_58
action_145 (118) = happyShift action_59
action_145 (39) = happyGoto action_186
action_145 (40) = happyGoto action_43
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (118) = happyShift action_185
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (123) = happyShift action_184
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (121) = happyShift action_183
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (121) = happyShift action_182
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (121) = happyShift action_181
action_150 _ = happyFail (happyExpListPerState 150)

action_151 _ = happyReduce_72

action_152 (122) = happyShift action_180
action_152 _ = happyFail (happyExpListPerState 152)

action_153 _ = happyReduce_79

action_154 (59) = happyShift action_44
action_154 (60) = happyShift action_45
action_154 (61) = happyShift action_46
action_154 (62) = happyShift action_47
action_154 (63) = happyShift action_48
action_154 (64) = happyShift action_49
action_154 (69) = happyShift action_50
action_154 (70) = happyShift action_51
action_154 (73) = happyShift action_52
action_154 (76) = happyShift action_53
action_154 (83) = happyShift action_54
action_154 (84) = happyShift action_55
action_154 (85) = happyShift action_56
action_154 (86) = happyShift action_57
action_154 (109) = happyShift action_97
action_154 (110) = happyShift action_98
action_154 (111) = happyShift action_99
action_154 (112) = happyShift action_100
action_154 (113) = happyShift action_101
action_154 (116) = happyShift action_58
action_154 (118) = happyShift action_59
action_154 (39) = happyGoto action_154
action_154 (40) = happyGoto action_43
action_154 (41) = happyGoto action_179
action_154 _ = happyReduce_76

action_155 (119) = happyShift action_178
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (63) = happyShift action_177
action_156 (31) = happyGoto action_175
action_156 (32) = happyGoto action_176
action_156 _ = happyReduce_40

action_157 _ = happyReduce_1

action_158 (119) = happyShift action_174
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (61) = happyShift action_160
action_159 (62) = happyShift action_161
action_159 (26) = happyGoto action_173
action_159 (27) = happyGoto action_159
action_159 _ = happyReduce_31

action_160 (116) = happyShift action_172
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (61) = happyShift action_171
action_161 (28) = happyGoto action_169
action_161 (29) = happyGoto action_170
action_161 _ = happyReduce_35

action_162 (114) = happyShift action_168
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_121

action_164 (116) = happyShift action_167
action_164 (13) = happyGoto action_165
action_164 (14) = happyGoto action_166
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (121) = happyShift action_229
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (123) = happyShift action_228
action_166 _ = happyReduce_12

action_167 (59) = happyShift action_227
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (59) = happyShift action_44
action_168 (60) = happyShift action_45
action_168 (61) = happyShift action_46
action_168 (62) = happyShift action_47
action_168 (63) = happyShift action_48
action_168 (64) = happyShift action_49
action_168 (69) = happyShift action_50
action_168 (70) = happyShift action_51
action_168 (73) = happyShift action_52
action_168 (76) = happyShift action_53
action_168 (83) = happyShift action_54
action_168 (84) = happyShift action_55
action_168 (85) = happyShift action_56
action_168 (86) = happyShift action_57
action_168 (116) = happyShift action_58
action_168 (118) = happyShift action_59
action_168 (39) = happyGoto action_226
action_168 (40) = happyGoto action_43
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (117) = happyShift action_225
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (123) = happyShift action_224
action_170 _ = happyReduce_36

action_171 (122) = happyShift action_223
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (61) = happyShift action_171
action_172 (28) = happyGoto action_222
action_172 (29) = happyGoto action_170
action_172 _ = happyReduce_35

action_173 _ = happyReduce_32

action_174 _ = happyReduce_30

action_175 (119) = happyShift action_221
action_175 _ = happyFail (happyExpListPerState 175)

action_176 (63) = happyShift action_177
action_176 (31) = happyGoto action_220
action_176 (32) = happyGoto action_176
action_176 _ = happyReduce_40

action_177 (118) = happyShift action_219
action_177 _ = happyFail (happyExpListPerState 177)

action_178 _ = happyReduce_53

action_179 _ = happyReduce_77

action_180 (63) = happyShift action_111
action_180 (67) = happyShift action_112
action_180 (68) = happyShift action_113
action_180 (69) = happyShift action_114
action_180 (53) = happyGoto action_218
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (116) = happyShift action_217
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (116) = happyShift action_216
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (116) = happyShift action_215
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (59) = happyShift action_214
action_184 _ = happyFail (happyExpListPerState 184)

action_185 (63) = happyShift action_212
action_185 (64) = happyShift action_213
action_185 (45) = happyGoto action_209
action_185 (46) = happyGoto action_210
action_185 (47) = happyGoto action_211
action_185 _ = happyReduce_84

action_186 (74) = happyShift action_208
action_186 (109) = happyShift action_97
action_186 (110) = happyShift action_98
action_186 (111) = happyShift action_99
action_186 (112) = happyShift action_100
action_186 (113) = happyShift action_101
action_186 _ = happyFail (happyExpListPerState 186)

action_187 (109) = happyShift action_97
action_187 (110) = happyShift action_98
action_187 (111) = happyShift action_99
action_187 (112) = happyShift action_100
action_187 (113) = happyShift action_101
action_187 _ = happyReduce_96

action_188 (81) = happyShift action_132
action_188 _ = happyReduce_95

action_189 _ = happyReduce_94

action_190 (72) = happyShift action_207
action_190 (109) = happyShift action_97
action_190 (110) = happyShift action_98
action_190 (111) = happyShift action_99
action_190 (112) = happyShift action_100
action_190 (113) = happyShift action_101
action_190 _ = happyFail (happyExpListPerState 190)

action_191 (123) = happyShift action_206
action_191 _ = happyFail (happyExpListPerState 191)

action_192 (123) = happyShift action_205
action_192 _ = happyFail (happyExpListPerState 192)

action_193 _ = happyReduce_83

action_194 _ = happyReduce_75

action_195 (117) = happyShift action_204
action_195 _ = happyFail (happyExpListPerState 195)

action_196 _ = happyReduce_20

action_197 (59) = happyShift action_203
action_197 _ = happyFail (happyExpListPerState 197)

action_198 (59) = happyShift action_202
action_198 _ = happyFail (happyExpListPerState 198)

action_199 (63) = happyShift action_111
action_199 (67) = happyShift action_112
action_199 (68) = happyShift action_113
action_199 (69) = happyShift action_114
action_199 (20) = happyGoto action_201
action_199 (53) = happyGoto action_110
action_199 _ = happyFail (happyExpListPerState 199)

action_200 _ = happyReduce_22

action_201 _ = happyReduce_24

action_202 (121) = happyShift action_265
action_202 _ = happyFail (happyExpListPerState 202)

action_203 (123) = happyShift action_264
action_203 _ = happyFail (happyExpListPerState 203)

action_204 _ = happyReduce_60

action_205 (89) = happyShift action_251
action_205 (90) = happyShift action_252
action_205 (91) = happyShift action_253
action_205 (92) = happyShift action_254
action_205 (93) = happyShift action_255
action_205 (94) = happyShift action_256
action_205 (95) = happyShift action_257
action_205 (96) = happyShift action_258
action_205 (97) = happyShift action_259
action_205 (98) = happyShift action_260
action_205 (99) = happyShift action_261
action_205 (100) = happyShift action_262
action_205 (51) = happyGoto action_263
action_205 _ = happyFail (happyExpListPerState 205)

action_206 (89) = happyShift action_251
action_206 (90) = happyShift action_252
action_206 (91) = happyShift action_253
action_206 (92) = happyShift action_254
action_206 (93) = happyShift action_255
action_206 (94) = happyShift action_256
action_206 (95) = happyShift action_257
action_206 (96) = happyShift action_258
action_206 (97) = happyShift action_259
action_206 (98) = happyShift action_260
action_206 (99) = happyShift action_261
action_206 (100) = happyShift action_262
action_206 (51) = happyGoto action_250
action_206 _ = happyFail (happyExpListPerState 206)

action_207 (59) = happyShift action_44
action_207 (60) = happyShift action_45
action_207 (61) = happyShift action_46
action_207 (62) = happyShift action_47
action_207 (63) = happyShift action_48
action_207 (64) = happyShift action_49
action_207 (69) = happyShift action_50
action_207 (70) = happyShift action_51
action_207 (73) = happyShift action_52
action_207 (76) = happyShift action_53
action_207 (83) = happyShift action_54
action_207 (84) = happyShift action_55
action_207 (85) = happyShift action_56
action_207 (86) = happyShift action_57
action_207 (116) = happyShift action_58
action_207 (118) = happyShift action_59
action_207 (39) = happyGoto action_249
action_207 (40) = happyGoto action_43
action_207 _ = happyFail (happyExpListPerState 207)

action_208 (59) = happyShift action_44
action_208 (60) = happyShift action_45
action_208 (61) = happyShift action_46
action_208 (62) = happyShift action_47
action_208 (63) = happyShift action_48
action_208 (64) = happyShift action_49
action_208 (69) = happyShift action_50
action_208 (70) = happyShift action_51
action_208 (73) = happyShift action_52
action_208 (76) = happyShift action_53
action_208 (83) = happyShift action_54
action_208 (84) = happyShift action_55
action_208 (85) = happyShift action_56
action_208 (86) = happyShift action_57
action_208 (116) = happyShift action_58
action_208 (118) = happyShift action_59
action_208 (39) = happyGoto action_248
action_208 (40) = happyGoto action_43
action_208 _ = happyFail (happyExpListPerState 208)

action_209 (119) = happyShift action_247
action_209 _ = happyFail (happyExpListPerState 209)

action_210 (63) = happyShift action_212
action_210 (64) = happyShift action_213
action_210 (45) = happyGoto action_246
action_210 (46) = happyGoto action_210
action_210 (47) = happyGoto action_211
action_210 _ = happyReduce_84

action_211 (126) = happyShift action_245
action_211 _ = happyFail (happyExpListPerState 211)

action_212 _ = happyReduce_87

action_213 (61) = happyShift action_244
action_213 (48) = happyGoto action_243
action_213 _ = happyFail (happyExpListPerState 213)

action_214 (121) = happyShift action_242
action_214 _ = happyFail (happyExpListPerState 214)

action_215 (59) = happyShift action_44
action_215 (60) = happyShift action_45
action_215 (61) = happyShift action_46
action_215 (62) = happyShift action_47
action_215 (63) = happyShift action_48
action_215 (64) = happyShift action_49
action_215 (69) = happyShift action_50
action_215 (70) = happyShift action_51
action_215 (73) = happyShift action_52
action_215 (76) = happyShift action_53
action_215 (83) = happyShift action_54
action_215 (84) = happyShift action_55
action_215 (85) = happyShift action_56
action_215 (86) = happyShift action_57
action_215 (116) = happyShift action_58
action_215 (118) = happyShift action_59
action_215 (39) = happyGoto action_241
action_215 (40) = happyGoto action_43
action_215 _ = happyFail (happyExpListPerState 215)

action_216 (59) = happyShift action_44
action_216 (60) = happyShift action_45
action_216 (61) = happyShift action_46
action_216 (62) = happyShift action_47
action_216 (63) = happyShift action_48
action_216 (64) = happyShift action_49
action_216 (69) = happyShift action_50
action_216 (70) = happyShift action_51
action_216 (73) = happyShift action_52
action_216 (76) = happyShift action_53
action_216 (83) = happyShift action_54
action_216 (84) = happyShift action_55
action_216 (85) = happyShift action_56
action_216 (86) = happyShift action_57
action_216 (116) = happyShift action_58
action_216 (118) = happyShift action_59
action_216 (39) = happyGoto action_240
action_216 (40) = happyGoto action_43
action_216 _ = happyFail (happyExpListPerState 216)

action_217 (59) = happyShift action_44
action_217 (60) = happyShift action_45
action_217 (61) = happyShift action_46
action_217 (62) = happyShift action_47
action_217 (63) = happyShift action_48
action_217 (64) = happyShift action_49
action_217 (69) = happyShift action_50
action_217 (70) = happyShift action_51
action_217 (73) = happyShift action_52
action_217 (76) = happyShift action_53
action_217 (83) = happyShift action_54
action_217 (84) = happyShift action_55
action_217 (85) = happyShift action_56
action_217 (86) = happyShift action_57
action_217 (116) = happyShift action_58
action_217 (118) = happyShift action_59
action_217 (39) = happyGoto action_239
action_217 (40) = happyGoto action_43
action_217 _ = happyFail (happyExpListPerState 217)

action_218 (114) = happyShift action_238
action_218 _ = happyFail (happyExpListPerState 218)

action_219 (105) = happyShift action_237
action_219 (33) = happyGoto action_236
action_219 _ = happyFail (happyExpListPerState 219)

action_220 _ = happyReduce_41

action_221 _ = happyReduce_39

action_222 (117) = happyShift action_235
action_222 _ = happyFail (happyExpListPerState 222)

action_223 (63) = happyShift action_111
action_223 (67) = happyShift action_112
action_223 (68) = happyShift action_113
action_223 (69) = happyShift action_114
action_223 (53) = happyGoto action_234
action_223 _ = happyFail (happyExpListPerState 223)

action_224 (61) = happyShift action_171
action_224 (28) = happyGoto action_233
action_224 (29) = happyGoto action_170
action_224 _ = happyReduce_35

action_225 (122) = happyShift action_232
action_225 _ = happyFail (happyExpListPerState 225)

action_226 (109) = happyShift action_97
action_226 (110) = happyShift action_98
action_226 (111) = happyShift action_99
action_226 (112) = happyShift action_100
action_226 (113) = happyShift action_101
action_226 _ = happyReduce_28

action_227 (123) = happyShift action_231
action_227 _ = happyFail (happyExpListPerState 227)

action_228 (116) = happyShift action_167
action_228 (13) = happyGoto action_230
action_228 (14) = happyGoto action_166
action_228 _ = happyFail (happyExpListPerState 228)

action_229 _ = happyReduce_10

action_230 _ = happyReduce_13

action_231 (59) = happyShift action_282
action_231 _ = happyFail (happyExpListPerState 231)

action_232 (63) = happyShift action_111
action_232 (67) = happyShift action_112
action_232 (68) = happyShift action_113
action_232 (69) = happyShift action_114
action_232 (53) = happyGoto action_281
action_232 _ = happyFail (happyExpListPerState 232)

action_233 _ = happyReduce_37

action_234 _ = happyReduce_38

action_235 (122) = happyShift action_280
action_235 _ = happyFail (happyExpListPerState 235)

action_236 (55) = happyShift action_22
action_236 (21) = happyGoto action_279
action_236 _ = happyFail (happyExpListPerState 236)

action_237 (118) = happyShift action_278
action_237 _ = happyFail (happyExpListPerState 237)

action_238 (59) = happyShift action_44
action_238 (60) = happyShift action_45
action_238 (61) = happyShift action_46
action_238 (62) = happyShift action_47
action_238 (63) = happyShift action_48
action_238 (64) = happyShift action_49
action_238 (69) = happyShift action_50
action_238 (70) = happyShift action_51
action_238 (73) = happyShift action_52
action_238 (76) = happyShift action_53
action_238 (83) = happyShift action_54
action_238 (84) = happyShift action_55
action_238 (85) = happyShift action_56
action_238 (86) = happyShift action_57
action_238 (116) = happyShift action_58
action_238 (118) = happyShift action_59
action_238 (39) = happyGoto action_277
action_238 (40) = happyGoto action_43
action_238 _ = happyFail (happyExpListPerState 238)

action_239 (109) = happyShift action_97
action_239 (110) = happyShift action_98
action_239 (111) = happyShift action_99
action_239 (112) = happyShift action_100
action_239 (113) = happyShift action_101
action_239 (117) = happyShift action_276
action_239 _ = happyFail (happyExpListPerState 239)

action_240 (109) = happyShift action_97
action_240 (110) = happyShift action_98
action_240 (111) = happyShift action_99
action_240 (112) = happyShift action_100
action_240 (113) = happyShift action_101
action_240 (117) = happyShift action_275
action_240 _ = happyFail (happyExpListPerState 240)

action_241 (109) = happyShift action_97
action_241 (110) = happyShift action_98
action_241 (111) = happyShift action_99
action_241 (112) = happyShift action_100
action_241 (113) = happyShift action_101
action_241 (117) = happyShift action_274
action_241 _ = happyFail (happyExpListPerState 241)

action_242 (116) = happyShift action_273
action_242 _ = happyFail (happyExpListPerState 242)

action_243 (117) = happyShift action_272
action_243 _ = happyFail (happyExpListPerState 243)

action_244 (123) = happyShift action_271
action_244 _ = happyReduce_89

action_245 (59) = happyShift action_44
action_245 (60) = happyShift action_45
action_245 (61) = happyShift action_46
action_245 (62) = happyShift action_47
action_245 (63) = happyShift action_48
action_245 (64) = happyShift action_49
action_245 (69) = happyShift action_50
action_245 (70) = happyShift action_51
action_245 (73) = happyShift action_52
action_245 (76) = happyShift action_53
action_245 (83) = happyShift action_54
action_245 (84) = happyShift action_55
action_245 (85) = happyShift action_56
action_245 (86) = happyShift action_57
action_245 (116) = happyShift action_58
action_245 (118) = happyShift action_59
action_245 (39) = happyGoto action_270
action_245 (40) = happyGoto action_43
action_245 _ = happyFail (happyExpListPerState 245)

action_246 _ = happyReduce_85

action_247 _ = happyReduce_61

action_248 (75) = happyShift action_269
action_248 (109) = happyShift action_97
action_248 (110) = happyShift action_98
action_248 (111) = happyShift action_99
action_248 (112) = happyShift action_100
action_248 (113) = happyShift action_101
action_248 _ = happyFail (happyExpListPerState 248)

action_249 _ = happyReduce_54

action_250 (121) = happyShift action_268
action_250 _ = happyFail (happyExpListPerState 250)

action_251 _ = happyReduce_109

action_252 _ = happyReduce_110

action_253 _ = happyReduce_111

action_254 _ = happyReduce_112

action_255 _ = happyReduce_113

action_256 _ = happyReduce_114

action_257 _ = happyReduce_115

action_258 _ = happyReduce_116

action_259 _ = happyReduce_117

action_260 _ = happyReduce_118

action_261 _ = happyReduce_119

action_262 _ = happyReduce_120

action_263 (121) = happyShift action_267
action_263 _ = happyFail (happyExpListPerState 263)

action_264 (59) = happyShift action_266
action_264 _ = happyFail (happyExpListPerState 264)

action_265 _ = happyReduce_122

action_266 (121) = happyShift action_293
action_266 _ = happyFail (happyExpListPerState 266)

action_267 _ = happyReduce_98

action_268 _ = happyReduce_97

action_269 (59) = happyShift action_44
action_269 (60) = happyShift action_45
action_269 (61) = happyShift action_46
action_269 (62) = happyShift action_47
action_269 (63) = happyShift action_48
action_269 (64) = happyShift action_49
action_269 (69) = happyShift action_50
action_269 (70) = happyShift action_51
action_269 (73) = happyShift action_52
action_269 (76) = happyShift action_53
action_269 (83) = happyShift action_54
action_269 (84) = happyShift action_55
action_269 (85) = happyShift action_56
action_269 (86) = happyShift action_57
action_269 (116) = happyShift action_58
action_269 (118) = happyShift action_59
action_269 (39) = happyGoto action_292
action_269 (40) = happyGoto action_43
action_269 _ = happyFail (happyExpListPerState 269)

action_270 (109) = happyShift action_97
action_270 (110) = happyShift action_98
action_270 (111) = happyShift action_99
action_270 (112) = happyShift action_100
action_270 (113) = happyShift action_101
action_270 _ = happyReduce_86

action_271 (61) = happyShift action_244
action_271 (48) = happyGoto action_291
action_271 _ = happyFail (happyExpListPerState 271)

action_272 _ = happyReduce_88

action_273 (59) = happyShift action_44
action_273 (60) = happyShift action_45
action_273 (61) = happyShift action_46
action_273 (62) = happyShift action_47
action_273 (63) = happyShift action_48
action_273 (64) = happyShift action_49
action_273 (69) = happyShift action_50
action_273 (70) = happyShift action_51
action_273 (73) = happyShift action_52
action_273 (76) = happyShift action_53
action_273 (83) = happyShift action_54
action_273 (84) = happyShift action_55
action_273 (85) = happyShift action_56
action_273 (86) = happyShift action_57
action_273 (116) = happyShift action_58
action_273 (118) = happyShift action_59
action_273 (39) = happyGoto action_290
action_273 (40) = happyGoto action_43
action_273 _ = happyFail (happyExpListPerState 273)

action_274 _ = happyReduce_65

action_275 _ = happyReduce_63

action_276 _ = happyReduce_64

action_277 (109) = happyShift action_97
action_277 (110) = happyShift action_98
action_277 (111) = happyShift action_99
action_277 (112) = happyShift action_100
action_277 (113) = happyShift action_101
action_277 _ = happyReduce_80

action_278 (63) = happyShift action_289
action_278 (34) = happyGoto action_287
action_278 (35) = happyGoto action_288
action_278 _ = happyReduce_44

action_279 (56) = happyShift action_31
action_279 (24) = happyGoto action_286
action_279 _ = happyFail (happyExpListPerState 279)

action_280 (63) = happyShift action_111
action_280 (67) = happyShift action_112
action_280 (68) = happyShift action_113
action_280 (69) = happyShift action_114
action_280 (53) = happyGoto action_285
action_280 _ = happyFail (happyExpListPerState 280)

action_281 (59) = happyShift action_44
action_281 (60) = happyShift action_45
action_281 (61) = happyShift action_46
action_281 (62) = happyShift action_47
action_281 (63) = happyShift action_48
action_281 (64) = happyShift action_49
action_281 (69) = happyShift action_50
action_281 (70) = happyShift action_51
action_281 (73) = happyShift action_52
action_281 (76) = happyShift action_53
action_281 (83) = happyShift action_54
action_281 (84) = happyShift action_55
action_281 (85) = happyShift action_56
action_281 (86) = happyShift action_57
action_281 (116) = happyShift action_58
action_281 (118) = happyShift action_59
action_281 (39) = happyGoto action_284
action_281 (40) = happyGoto action_43
action_281 _ = happyFail (happyExpListPerState 281)

action_282 (123) = happyShift action_283
action_282 _ = happyFail (happyExpListPerState 282)

action_283 (59) = happyShift action_301
action_283 _ = happyFail (happyExpListPerState 283)

action_284 (109) = happyShift action_97
action_284 (110) = happyShift action_98
action_284 (111) = happyShift action_99
action_284 (112) = happyShift action_100
action_284 (113) = happyShift action_101
action_284 _ = happyReduce_34

action_285 (59) = happyShift action_44
action_285 (60) = happyShift action_45
action_285 (61) = happyShift action_46
action_285 (62) = happyShift action_47
action_285 (63) = happyShift action_48
action_285 (64) = happyShift action_49
action_285 (69) = happyShift action_50
action_285 (70) = happyShift action_51
action_285 (73) = happyShift action_52
action_285 (76) = happyShift action_53
action_285 (83) = happyShift action_54
action_285 (84) = happyShift action_55
action_285 (85) = happyShift action_56
action_285 (86) = happyShift action_57
action_285 (116) = happyShift action_58
action_285 (118) = happyShift action_59
action_285 (39) = happyGoto action_300
action_285 (40) = happyGoto action_43
action_285 _ = happyFail (happyExpListPerState 285)

action_286 (106) = happyShift action_299
action_286 (38) = happyGoto action_298
action_286 _ = happyFail (happyExpListPerState 286)

action_287 (119) = happyShift action_297
action_287 _ = happyFail (happyExpListPerState 287)

action_288 (63) = happyShift action_289
action_288 (34) = happyGoto action_296
action_288 (35) = happyGoto action_288
action_288 _ = happyReduce_44

action_289 (118) = happyShift action_295
action_289 _ = happyFail (happyExpListPerState 289)

action_290 (109) = happyShift action_97
action_290 (110) = happyShift action_98
action_290 (111) = happyShift action_99
action_290 (112) = happyShift action_100
action_290 (113) = happyShift action_101
action_290 (117) = happyShift action_294
action_290 _ = happyFail (happyExpListPerState 290)

action_291 _ = happyReduce_90

action_292 _ = happyReduce_55

action_293 _ = happyReduce_123

action_294 _ = happyReduce_62

action_295 (107) = happyShift action_307
action_295 (36) = happyGoto action_305
action_295 (37) = happyGoto action_306
action_295 _ = happyFail (happyExpListPerState 295)

action_296 _ = happyReduce_45

action_297 _ = happyReduce_43

action_298 (119) = happyShift action_304
action_298 _ = happyFail (happyExpListPerState 298)

action_299 (118) = happyShift action_303
action_299 _ = happyFail (happyExpListPerState 299)

action_300 (109) = happyShift action_97
action_300 (110) = happyShift action_98
action_300 (111) = happyShift action_99
action_300 (112) = happyShift action_100
action_300 (113) = happyShift action_101
action_300 _ = happyReduce_33

action_301 (117) = happyShift action_302
action_301 _ = happyFail (happyExpListPerState 301)

action_302 _ = happyReduce_14

action_303 (61) = happyShift action_160
action_303 (62) = happyShift action_161
action_303 (26) = happyGoto action_311
action_303 (27) = happyGoto action_159
action_303 _ = happyReduce_31

action_304 _ = happyReduce_42

action_305 (119) = happyShift action_310
action_305 _ = happyFail (happyExpListPerState 305)

action_306 (107) = happyShift action_307
action_306 (36) = happyGoto action_309
action_306 (37) = happyGoto action_306
action_306 _ = happyReduce_47

action_307 (116) = happyShift action_308
action_307 _ = happyFail (happyExpListPerState 307)

action_308 (59) = happyShift action_313
action_308 _ = happyFail (happyExpListPerState 308)

action_309 _ = happyReduce_48

action_310 _ = happyReduce_46

action_311 (119) = happyShift action_312
action_311 _ = happyFail (happyExpListPerState 311)

action_312 _ = happyReduce_50

action_313 (123) = happyShift action_314
action_313 _ = happyFail (happyExpListPerState 313)

action_314 (59) = happyShift action_315
action_314 _ = happyFail (happyExpListPerState 314)

action_315 (117) = happyShift action_316
action_315 _ = happyFail (happyExpListPerState 315)

action_316 (122) = happyShift action_317
action_316 _ = happyFail (happyExpListPerState 316)

action_317 (63) = happyShift action_318
action_317 _ = happyFail (happyExpListPerState 317)

action_318 (120) = happyShift action_319
action_318 _ = happyFail (happyExpListPerState 318)

action_319 (59) = happyShift action_320
action_319 _ = happyFail (happyExpListPerState 319)

action_320 (121) = happyShift action_321
action_320 _ = happyFail (happyExpListPerState 320)

action_321 (108) = happyShift action_322
action_321 _ = happyFail (happyExpListPerState 321)

action_322 (63) = happyShift action_323
action_322 _ = happyFail (happyExpListPerState 322)

action_323 _ = happyReduce_49

happyReduce_1 = happyReduce 11 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn30  happy_var_10) `HappyStk`
	(HappyAbsSyn25  happy_var_9) `HappyStk`
	(HappyAbsSyn24  happy_var_8) `HappyStk`
	(HappyAbsSyn21  happy_var_7) `HappyStk`
	(HappyAbsSyn15  happy_var_6) `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mode happy_var_2 happy_var_4 happy_var_5 happy_var_6 happy_var_7 happy_var_8 happy_var_9 happy_var_10
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 4 5 happyReduction_2
happyReduction_2 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_0  6 happyReduction_3
happyReduction_3  =  HappyAbsSyn6
		 ([]
	)

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 5 7 happyReduction_5
happyReduction_5 ((HappyTerminal (TokenString happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Graphics happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 8 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (TypeGraphics (fromIntegral happy_var_3)
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 9 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_0  10 happyReduction_8
happyReduction_8  =  HappyAbsSyn10
		 ([]
	)

happyReduce_9 = happySpecReduce_2  10 happyReduction_9
happyReduction_9 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 7 11 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Palette happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  12 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn12
		 (TypePalette
	)

happyReduce_12 = happySpecReduce_1  13 happyReduction_12
happyReduction_12 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  13 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 7 14 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 ((fromIntegral happy_var_2, fromIntegral happy_var_4, fromIntegral happy_var_6)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 15 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_0  16 happyReduction_16
happyReduction_16  =  HappyAbsSyn16
		 ([]
	)

happyReduce_17 = happySpecReduce_2  16 happyReduction_17
happyReduction_17 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 17 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (UserType happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  18 happyReduction_19
happyReduction_19 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  18 happyReduction_20
happyReduction_20 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  19 happyReduction_21
happyReduction_21 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn19
		 (Variant happy_var_1 []
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  19 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn20  happy_var_2)
	(HappyTerminal (TokenCapIdC happy_var_1))
	 =  HappyAbsSyn19
		 (Variant happy_var_1 happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  20 happyReduction_23
happyReduction_23 (HappyAbsSyn53  happy_var_1)
	 =  HappyAbsSyn20
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  20 happyReduction_24
happyReduction_24 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn53  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 21 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_0  22 happyReduction_26
happyReduction_26  =  HappyAbsSyn22
		 ([]
	)

happyReduce_27 = happySpecReduce_2  22 happyReduction_27
happyReduction_27 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1 : happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 23 happyReduction_28
happyReduction_28 ((HappyAbsSyn39  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn52  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (MVar happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_2  24 happyReduction_29
happyReduction_29 (HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 4 25 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_0  26 happyReduction_31
happyReduction_31  =  HappyAbsSyn26
		 ([]
	)

happyReduce_32 = happySpecReduce_2  26 happyReduction_32
happyReduction_32 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 : happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 7 27 happyReduction_33
happyReduction_33 ((HappyAbsSyn39  happy_var_7) `HappyStk`
	(HappyAbsSyn53  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (Func happy_var_1 happy_var_3 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 6 27 happyReduction_34
happyReduction_34 ((HappyAbsSyn39  happy_var_6) `HappyStk`
	(HappyAbsSyn53  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (Func happy_var_1 happy_var_2 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_0  28 happyReduction_35
happyReduction_35  =  HappyAbsSyn28
		 ([]
	)

happyReduce_36 = happySpecReduce_1  28 happyReduction_36
happyReduction_36 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 ([happy_var_1]
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  28 happyReduction_37
happyReduction_37 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1 : happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  29 happyReduction_38
happyReduction_38 (HappyAbsSyn53  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn29
		 (Param happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 30 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn31  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_0  31 happyReduction_40
happyReduction_40  =  HappyAbsSyn31
		 ([]
	)

happyReduce_41 = happySpecReduce_2  31 happyReduction_41
happyReduction_41 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn31
		 (happy_var_1 : happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happyReduce 7 32 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn38  happy_var_6) `HappyStk`
	(HappyAbsSyn24  happy_var_5) `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	(HappyAbsSyn33  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn32
		 (Sprite happy_var_1 happy_var_3 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 4 33 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_0  34 happyReduction_44
happyReduction_44  =  HappyAbsSyn34
		 ([]
	)

happyReduce_45 = happySpecReduce_2  34 happyReduction_45
happyReduction_45 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1 : happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happyReduce 4 35 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn36  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn35
		 (Animation happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_1  36 happyReduction_47
happyReduction_47 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 ([happy_var_1]
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  36 happyReduction_48
happyReduction_48 (HappyAbsSyn36  happy_var_2)
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1 : happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happyReduce 13 37 happyReduction_49
happyReduction_49 ((HappyTerminal (TokenCapId happy_var_13)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_10)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_8)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn37
		 (Tile (fromIntegral happy_var_3) (fromIntegral happy_var_5) happy_var_8 (fromIntegral happy_var_10) happy_var_13
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 4 38 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_1  39 happyReduction_51
happyReduction_51 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn39
		 (ExprLit happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  39 happyReduction_52
happyReduction_52 (HappyTerminal (TokenRInt happy_var_1))
	 =  HappyAbsSyn39
		 (ExprRLit happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happyReduce 4 39 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyAbsSyn41  happy_var_3) `HappyStk`
	(HappyAbsSyn42  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 6 39 happyReduction_54
happyReduction_54 ((HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn49  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_55 = happyReduce 8 39 happyReduction_55
happyReduction_55 ((HappyAbsSyn39  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprFor happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_56 = happySpecReduce_3  39 happyReduction_56
happyReduction_56 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  39 happyReduction_57
happyReduction_57 _
	(HappyAbsSyn44  happy_var_2)
	(HappyTerminal (TokenIdC happy_var_1))
	 =  HappyAbsSyn39
		 (ExprCall happy_var_1 happy_var_2
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  39 happyReduction_58
happyReduction_58 _
	(HappyAbsSyn44  happy_var_2)
	(HappyTerminal (TokenCapIdC happy_var_1))
	 =  HappyAbsSyn39
		 (ExprConstruct happy_var_1 happy_var_2
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  39 happyReduction_59
happyReduction_59 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn39
		 (ExprConstruct happy_var_1 []
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happyReduce 5 39 happyReduction_60
happyReduction_60 (_ `HappyStk`
	(HappyAbsSyn44  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_61 = happyReduce 6 39 happyReduction_61
happyReduction_61 (_ `HappyStk`
	(HappyAbsSyn45  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_62 = happyReduce 9 39 happyReduction_62
happyReduction_62 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprUnOp (UnOpTransmute (Just (fromIntegral happy_var_3)) (Just (fromIntegral happy_var_5))) happy_var_8
	) `HappyStk` happyRest

happyReduce_63 = happyReduce 7 39 happyReduction_63
happyReduction_63 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_64 = happyReduce 7 39 happyReduction_64
happyReduction_64 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_65 = happyReduce 7 39 happyReduction_65
happyReduction_65 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (ExprUnOp (UnOpShrink (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_66 = happySpecReduce_3  39 happyReduction_66
happyReduction_66 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  39 happyReduction_67
happyReduction_67 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  39 happyReduction_68
happyReduction_68 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  39 happyReduction_69
happyReduction_69 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  39 happyReduction_70
happyReduction_70 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  39 happyReduction_71
happyReduction_71 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn39
		 (ExprVar happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  39 happyReduction_72
happyReduction_72 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn39
		 (happy_var_2
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_1  39 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn39
		 (ExprVoid
	)

happyReduce_74 = happySpecReduce_1  40 happyReduction_74
happyReduction_74 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn40
		 (LValId happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happyReduce 4 40 happyReduction_75
happyReduction_75 (_ `HappyStk`
	(HappyAbsSyn39  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn40
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_76 = happySpecReduce_0  41 happyReduction_76
happyReduction_76  =  HappyAbsSyn41
		 ([]
	)

happyReduce_77 = happySpecReduce_2  41 happyReduction_77
happyReduction_77 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn41
		 (happy_var_1 : happy_var_2
	)
happyReduction_77 _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_0  42 happyReduction_78
happyReduction_78  =  HappyAbsSyn42
		 ([]
	)

happyReduce_79 = happySpecReduce_2  42 happyReduction_79
happyReduction_79 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn43  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1 : happy_var_2
	)
happyReduction_79 _ _  = notHappyAtAll 

happyReduce_80 = happyReduce 6 43 happyReduction_80
happyReduction_80 ((HappyAbsSyn39  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn53  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn43
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_81 = happySpecReduce_0  44 happyReduction_81
happyReduction_81  =  HappyAbsSyn44
		 ([]
	)

happyReduce_82 = happySpecReduce_1  44 happyReduction_82
happyReduction_82 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn44
		 ([happy_var_1]
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happySpecReduce_3  44 happyReduction_83
happyReduction_83 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn44
		 (happy_var_1 : happy_var_3
	)
happyReduction_83 _ _ _  = notHappyAtAll 

happyReduce_84 = happySpecReduce_0  45 happyReduction_84
happyReduction_84  =  HappyAbsSyn45
		 ([]
	)

happyReduce_85 = happySpecReduce_2  45 happyReduction_85
happyReduction_85 (HappyAbsSyn45  happy_var_2)
	(HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn45
		 (happy_var_1 : happy_var_2
	)
happyReduction_85 _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_3  46 happyReduction_86
happyReduction_86 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn46
		 ((happy_var_1, happy_var_3)
	)
happyReduction_86 _ _ _  = notHappyAtAll 

happyReduce_87 = happySpecReduce_1  47 happyReduction_87
happyReduction_87 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn47
		 (PatData happy_var_1 []
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  47 happyReduction_88
happyReduction_88 _
	(HappyAbsSyn48  happy_var_2)
	(HappyTerminal (TokenCapIdC happy_var_1))
	 =  HappyAbsSyn47
		 (PatData happy_var_1 happy_var_2
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_1  48 happyReduction_89
happyReduction_89 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn48
		 ([happy_var_1]
	)
happyReduction_89 _  = notHappyAtAll 

happyReduce_90 = happySpecReduce_3  48 happyReduction_90
happyReduction_90 (HappyAbsSyn48  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn48
		 (happy_var_1 : happy_var_3
	)
happyReduction_90 _ _ _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_1  49 happyReduction_91
happyReduction_91 _
	 =  HappyAbsSyn49
		 (PredLit True
	)

happyReduce_92 = happySpecReduce_1  49 happyReduction_92
happyReduction_92 _
	 =  HappyAbsSyn49
		 (PredLit False
	)

happyReduce_93 = happySpecReduce_2  49 happyReduction_93
happyReduction_93 (HappyAbsSyn49  happy_var_2)
	_
	 =  HappyAbsSyn49
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_93 _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_3  49 happyReduction_94
happyReduction_94 (HappyAbsSyn49  happy_var_3)
	_
	(HappyAbsSyn49  happy_var_1)
	 =  HappyAbsSyn49
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_94 _ _ _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_3  49 happyReduction_95
happyReduction_95 (HappyAbsSyn49  happy_var_3)
	_
	(HappyAbsSyn49  happy_var_1)
	 =  HappyAbsSyn49
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_95 _ _ _  = notHappyAtAll 

happyReduce_96 = happySpecReduce_3  49 happyReduction_96
happyReduction_96 (HappyAbsSyn39  happy_var_3)
	(HappyAbsSyn50  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn49
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_96 _ _ _  = notHappyAtAll 

happyReduce_97 = happyReduce 6 49 happyReduction_97
happyReduction_97 (_ `HappyStk`
	(HappyAbsSyn51  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (PredPressed happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_98 = happyReduce 6 49 happyReduction_98
happyReduction_98 (_ `HappyStk`
	(HappyAbsSyn51  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn49
		 (PredHolding happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_99 = happySpecReduce_1  50 happyReduction_99
happyReduction_99 _
	 =  HappyAbsSyn50
		 (CompEq
	)

happyReduce_100 = happySpecReduce_1  50 happyReduction_100
happyReduction_100 _
	 =  HappyAbsSyn50
		 (CompNeq
	)

happyReduce_101 = happySpecReduce_1  50 happyReduction_101
happyReduction_101 _
	 =  HappyAbsSyn50
		 (CompLe
	)

happyReduce_102 = happySpecReduce_1  50 happyReduction_102
happyReduction_102 _
	 =  HappyAbsSyn50
		 (CompGe
	)

happyReduce_103 = happySpecReduce_1  50 happyReduction_103
happyReduction_103 _
	 =  HappyAbsSyn50
		 (CompLeq
	)

happyReduce_104 = happySpecReduce_1  50 happyReduction_104
happyReduction_104 _
	 =  HappyAbsSyn50
		 (CompGeq
	)

happyReduce_105 = happySpecReduce_1  50 happyReduction_105
happyReduction_105 _
	 =  HappyAbsSyn50
		 (CompLeS
	)

happyReduce_106 = happySpecReduce_1  50 happyReduction_106
happyReduction_106 _
	 =  HappyAbsSyn50
		 (CompGeS
	)

happyReduce_107 = happySpecReduce_1  50 happyReduction_107
happyReduction_107 _
	 =  HappyAbsSyn50
		 (CompLeqS
	)

happyReduce_108 = happySpecReduce_1  50 happyReduction_108
happyReduction_108 _
	 =  HappyAbsSyn50
		 (CompGeqS
	)

happyReduce_109 = happySpecReduce_1  51 happyReduction_109
happyReduction_109 _
	 =  HappyAbsSyn51
		 (ButtonA
	)

happyReduce_110 = happySpecReduce_1  51 happyReduction_110
happyReduction_110 _
	 =  HappyAbsSyn51
		 (ButtonX
	)

happyReduce_111 = happySpecReduce_1  51 happyReduction_111
happyReduction_111 _
	 =  HappyAbsSyn51
		 (ButtonL
	)

happyReduce_112 = happySpecReduce_1  51 happyReduction_112
happyReduction_112 _
	 =  HappyAbsSyn51
		 (ButtonR
	)

happyReduce_113 = happySpecReduce_1  51 happyReduction_113
happyReduction_113 _
	 =  HappyAbsSyn51
		 (ButtonB
	)

happyReduce_114 = happySpecReduce_1  51 happyReduction_114
happyReduction_114 _
	 =  HappyAbsSyn51
		 (ButtonY
	)

happyReduce_115 = happySpecReduce_1  51 happyReduction_115
happyReduction_115 _
	 =  HappyAbsSyn51
		 (ButtonSELECT
	)

happyReduce_116 = happySpecReduce_1  51 happyReduction_116
happyReduction_116 _
	 =  HappyAbsSyn51
		 (ButtonSTART
	)

happyReduce_117 = happySpecReduce_1  51 happyReduction_117
happyReduction_117 _
	 =  HappyAbsSyn51
		 (ButtonUP
	)

happyReduce_118 = happySpecReduce_1  51 happyReduction_118
happyReduction_118 _
	 =  HappyAbsSyn51
		 (ButtonDOWN
	)

happyReduce_119 = happySpecReduce_1  51 happyReduction_119
happyReduction_119 _
	 =  HappyAbsSyn51
		 (ButtonLEFT
	)

happyReduce_120 = happySpecReduce_1  51 happyReduction_120
happyReduction_120 _
	 =  HappyAbsSyn51
		 (ButtonRIGHT
	)

happyReduce_121 = happySpecReduce_1  52 happyReduction_121
happyReduction_121 (HappyAbsSyn53  happy_var_1)
	 =  HappyAbsSyn52
		 (happy_var_1
	)
happyReduction_121 _  = notHappyAtAll 

happyReduce_122 = happyReduce 4 53 happyReduction_122
happyReduction_122 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn53
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_123 = happyReduce 6 53 happyReduction_123
happyReduction_123 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn53
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_124 = happySpecReduce_1  53 happyReduction_124
happyReduction_124 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn53
		 (TypeUser happy_var_1
	)
happyReduction_124 _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_1  53 happyReduction_125
happyReduction_125 _
	 =  HappyAbsSyn53
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 136 136 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenMode -> cont 54;
	TokenState -> cont 55;
	TokenMain -> cont 56;
	TokenFunctions -> cont 57;
	TokenTypes -> cont 58;
	TokenInt happy_dollar_dollar -> cont 59;
	TokenRInt happy_dollar_dollar -> cont 60;
	TokenId happy_dollar_dollar -> cont 61;
	TokenIdC happy_dollar_dollar -> cont 62;
	TokenCapId happy_dollar_dollar -> cont 63;
	TokenCapIdC happy_dollar_dollar -> cont 64;
	TokenString happy_dollar_dollar -> cont 65;
	TokenVar -> cont 66;
	TokenBits -> cont 67;
	TokenRange -> cont 68;
	TokenVoid -> cont 69;
	TokenIf -> cont 70;
	TokenThen -> cont 71;
	TokenElse -> cont 72;
	TokenFor -> cont 73;
	TokenTo -> cont 74;
	TokenDo -> cont 75;
	TokenMatch -> cont 76;
	TokenWith -> cont 77;
	TokenTrue -> cont 78;
	TokenFalse -> cont 79;
	TokenNot -> cont 80;
	TokenAnd -> cont 81;
	TokenOr -> cont 82;
	TokenTransmute -> cont 83;
	TokenShrink -> cont 84;
	TokenExtend -> cont 85;
	TokenSignExtend -> cont 86;
	TokenPressed -> cont 87;
	TokenHolding -> cont 88;
	TokenButtonA -> cont 89;
	TokenButtonX -> cont 90;
	TokenButtonL -> cont 91;
	TokenButtonR -> cont 92;
	TokenButtonB -> cont 93;
	TokenButtonY -> cont 94;
	TokenButtonSELECT -> cont 95;
	TokenButtonSTART -> cont 96;
	TokenButtonUP -> cont 97;
	TokenButtonDOWN -> cont 98;
	TokenButtonLEFT -> cont 99;
	TokenButtonRIGHT -> cont 100;
	TokenPalettes -> cont 101;
	TokenGraphics -> cont 102;
	TokenSprite -> cont 103;
	TokenSprites -> cont 104;
	TokenAnimations -> cont 105;
	TokenMethods -> cont 106;
	TokenAt -> cont 107;
	TokenIn -> cont 108;
	TokenPlus -> cont 109;
	TokenMinus -> cont 110;
	TokenAmphersand -> cont 111;
	TokenPipe -> cont 112;
	TokenCaret -> cont 113;
	TokenEq -> cont 114;
	TokenNeq -> cont 115;
	TokenLParen -> cont 116;
	TokenRParen -> cont 117;
	TokenLBrace -> cont 118;
	TokenRBrace -> cont 119;
	TokenLBracket -> cont 120;
	TokenRBracket -> cont 121;
	TokenColon -> cont 122;
	TokenComma -> cont 123;
	TokenDot -> cont 124;
	TokenUnderscore -> cont 125;
	TokenRArrow -> cont 126;
	TokenLArrow -> cont 127;
	TokenLe -> cont 128;
	TokenGe -> cont 129;
	TokenLeq -> cont 130;
	TokenGeq -> cont 131;
	TokenLeS -> cont 132;
	TokenLeqS -> cont 133;
	TokenGeS -> cont 134;
	TokenGeqS -> cont 135;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 136 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
