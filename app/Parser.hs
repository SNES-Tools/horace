{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,290) ([0,18695,33248,2,0,16,0,0,0,0,0,0,0,0,0,992,0,0,0,0,1024,0,0,0,2176,0,1792,57417,641,0,28672,29840,10270,0,0,2,0,0,0,36976,7684,40,0,1792,57417,641,0,28672,1168,10270,0,0,18695,33248,2,0,36976,7684,40,0,1792,57417,641,0,32768,0,0,0,0,18695,33248,2,0,128,0,0,0,512,0,0,0,0,0,5088,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,15872,0,0,0,0,4,0,0,0,62,2040,0,32800,1,0,0,0,0,0,0,0,0,0,0,1792,59209,641,0,0,0,992,4,0,0,0,1,0,36976,7684,40,0,1024,0,0,0,28672,1168,10270,0,0,18695,33248,2,0,36976,7684,40,0,1792,57417,641,0,28672,1168,10270,0,0,18695,33248,2,0,0,0,1,0,0,0,0,0,0,0,768,0,0,0,14336,0,0,0,32768,3,0,0,0,0,0,28672,1168,10270,0,0,0,15872,16,0,0,0,0,0,1792,57417,641,0,0,32768,1,0,0,18695,33248,2,0,36976,7796,40,0,1792,59209,641,0,28672,1168,10270,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18695,33248,2,0,0,0,32,0,0,0,0,0,0,0,0,2,0,0,0,0,0,36976,65028,43,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,3840,0,0,0,768,0,0,1,0,256,992,0,0,0,15872,0,0,0,0,0,0,0,4096,0,0,0,64,992,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,18695,33248,2,0,36976,7684,40,0,0,0,1024,0,12288,0,0,16,0,0,0,512,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,16384,0,0,0,0,128,0,0,0,2048,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,4096,0,0,0,0,18695,33248,2,0,48,0,4096,0,1792,57417,641,0,0,0,0,0,0,0,0,0,0,0,57346,3,0,0,0,62,0,28672,1168,10270,0,0,0,15872,0,0,0,0,1024,0,0,0,256,0,0,0,992,0,0,0,0,16,0,0,0,1024,0,256,0,0,0,0,0,0,0,0,0,0,0,0,48,0,4096,0,0,0,62,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_reg","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 68
        bit_end = (st Prelude.+ 1) Prelude.* 68
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..67]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_2
action_0 (18) = happyShift action_5
action_0 (19) = happyShift action_6
action_0 (25) = happyShift action_7
action_0 (28) = happyShift action_8
action_0 (31) = happyShift action_9
action_0 (38) = happyShift action_10
action_0 (39) = happyShift action_11
action_0 (40) = happyShift action_12
action_0 (41) = happyShift action_13
action_0 (48) = happyShift action_14
action_0 (50) = happyShift action_15
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (42) = happyShift action_36
action_3 (43) = happyShift action_37
action_3 (44) = happyShift action_38
action_3 (45) = happyShift action_39
action_3 (46) = happyShift action_40
action_3 (68) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (59) = happyShift action_35
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (52) = happyShift action_33
action_5 (56) = happyShift action_34
action_5 (59) = happyReduce_20
action_5 _ = happyReduce_18

action_6 (17) = happyShift action_2
action_6 (18) = happyShift action_5
action_6 (19) = happyShift action_6
action_6 (25) = happyShift action_7
action_6 (28) = happyShift action_8
action_6 (31) = happyShift action_9
action_6 (38) = happyShift action_10
action_6 (39) = happyShift action_11
action_6 (40) = happyShift action_12
action_6 (41) = happyShift action_13
action_6 (48) = happyShift action_14
action_6 (50) = happyShift action_15
action_6 (4) = happyGoto action_31
action_6 (5) = happyGoto action_4
action_6 (9) = happyGoto action_32
action_6 _ = happyReduce_27

action_7 (17) = happyShift action_2
action_7 (18) = happyShift action_5
action_7 (19) = happyShift action_6
action_7 (25) = happyShift action_7
action_7 (28) = happyShift action_8
action_7 (31) = happyShift action_9
action_7 (33) = happyShift action_28
action_7 (34) = happyShift action_29
action_7 (35) = happyShift action_30
action_7 (38) = happyShift action_10
action_7 (39) = happyShift action_11
action_7 (40) = happyShift action_12
action_7 (41) = happyShift action_13
action_7 (48) = happyShift action_14
action_7 (50) = happyShift action_15
action_7 (4) = happyGoto action_26
action_7 (5) = happyGoto action_4
action_7 (14) = happyGoto action_27
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (18) = happyShift action_25
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (17) = happyShift action_2
action_9 (18) = happyShift action_5
action_9 (19) = happyShift action_6
action_9 (25) = happyShift action_7
action_9 (28) = happyShift action_8
action_9 (31) = happyShift action_9
action_9 (38) = happyShift action_10
action_9 (39) = happyShift action_11
action_9 (40) = happyShift action_12
action_9 (41) = happyShift action_13
action_9 (48) = happyShift action_14
action_9 (50) = happyShift action_15
action_9 (4) = happyGoto action_24
action_9 (5) = happyGoto action_4
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (17) = happyShift action_2
action_10 (18) = happyShift action_5
action_10 (19) = happyShift action_6
action_10 (25) = happyShift action_7
action_10 (28) = happyShift action_8
action_10 (31) = happyShift action_9
action_10 (38) = happyShift action_10
action_10 (39) = happyShift action_11
action_10 (40) = happyShift action_12
action_10 (41) = happyShift action_13
action_10 (48) = happyShift action_14
action_10 (50) = happyShift action_15
action_10 (4) = happyGoto action_23
action_10 (5) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (17) = happyShift action_2
action_11 (18) = happyShift action_5
action_11 (19) = happyShift action_6
action_11 (25) = happyShift action_7
action_11 (28) = happyShift action_8
action_11 (31) = happyShift action_9
action_11 (38) = happyShift action_10
action_11 (39) = happyShift action_11
action_11 (40) = happyShift action_12
action_11 (41) = happyShift action_13
action_11 (48) = happyShift action_14
action_11 (50) = happyShift action_15
action_11 (4) = happyGoto action_22
action_11 (5) = happyGoto action_4
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (17) = happyShift action_2
action_12 (18) = happyShift action_5
action_12 (19) = happyShift action_6
action_12 (25) = happyShift action_7
action_12 (28) = happyShift action_8
action_12 (31) = happyShift action_9
action_12 (38) = happyShift action_10
action_12 (39) = happyShift action_11
action_12 (40) = happyShift action_12
action_12 (41) = happyShift action_13
action_12 (48) = happyShift action_14
action_12 (50) = happyShift action_15
action_12 (4) = happyGoto action_21
action_12 (5) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (17) = happyShift action_2
action_13 (18) = happyShift action_5
action_13 (19) = happyShift action_6
action_13 (25) = happyShift action_7
action_13 (28) = happyShift action_8
action_13 (31) = happyShift action_9
action_13 (38) = happyShift action_10
action_13 (39) = happyShift action_11
action_13 (40) = happyShift action_12
action_13 (41) = happyShift action_13
action_13 (48) = happyShift action_14
action_13 (50) = happyShift action_15
action_13 (4) = happyGoto action_20
action_13 (5) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_2
action_14 (18) = happyShift action_5
action_14 (19) = happyShift action_6
action_14 (25) = happyShift action_7
action_14 (28) = happyShift action_8
action_14 (31) = happyShift action_9
action_14 (38) = happyShift action_10
action_14 (39) = happyShift action_11
action_14 (40) = happyShift action_12
action_14 (41) = happyShift action_13
action_14 (48) = happyShift action_14
action_14 (50) = happyShift action_15
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (20) = happyShift action_18
action_15 (7) = happyGoto action_16
action_15 (8) = happyGoto action_17
action_15 _ = happyReduce_24

action_16 (17) = happyShift action_2
action_16 (18) = happyShift action_5
action_16 (19) = happyShift action_6
action_16 (25) = happyShift action_7
action_16 (28) = happyShift action_8
action_16 (31) = happyShift action_9
action_16 (38) = happyShift action_10
action_16 (39) = happyShift action_11
action_16 (40) = happyShift action_12
action_16 (41) = happyShift action_13
action_16 (48) = happyShift action_14
action_16 (50) = happyShift action_15
action_16 (4) = happyGoto action_69
action_16 (5) = happyGoto action_4
action_16 (6) = happyGoto action_70
action_16 _ = happyReduce_22

action_17 (20) = happyShift action_18
action_17 (7) = happyGoto action_68
action_17 (8) = happyGoto action_17
action_17 _ = happyReduce_24

action_18 (18) = happyShift action_67
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (42) = happyShift action_36
action_19 (43) = happyShift action_37
action_19 (44) = happyShift action_38
action_19 (45) = happyShift action_39
action_19 (46) = happyShift action_40
action_19 (49) = happyShift action_66
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_11

action_21 _ = happyReduce_10

action_22 _ = happyReduce_12

action_23 _ = happyReduce_9

action_24 (32) = happyShift action_65
action_24 (42) = happyShift action_36
action_24 (43) = happyShift action_37
action_24 (44) = happyShift action_38
action_24 (45) = happyShift action_39
action_24 (46) = happyShift action_40
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (47) = happyShift action_64
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (42) = happyShift action_36
action_26 (43) = happyShift action_37
action_26 (44) = happyShift action_38
action_26 (45) = happyShift action_39
action_26 (46) = happyShift action_40
action_26 (60) = happyShift action_56
action_26 (61) = happyShift action_57
action_26 (62) = happyShift action_58
action_26 (63) = happyShift action_59
action_26 (64) = happyShift action_60
action_26 (65) = happyShift action_61
action_26 (66) = happyShift action_62
action_26 (67) = happyShift action_63
action_26 (15) = happyGoto action_55
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (26) = happyShift action_52
action_27 (36) = happyShift action_53
action_27 (37) = happyShift action_54
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_39

action_29 _ = happyReduce_40

action_30 (17) = happyShift action_2
action_30 (18) = happyShift action_5
action_30 (19) = happyShift action_6
action_30 (25) = happyShift action_7
action_30 (28) = happyShift action_8
action_30 (31) = happyShift action_9
action_30 (33) = happyShift action_28
action_30 (34) = happyShift action_29
action_30 (35) = happyShift action_30
action_30 (38) = happyShift action_10
action_30 (39) = happyShift action_11
action_30 (40) = happyShift action_12
action_30 (41) = happyShift action_13
action_30 (48) = happyShift action_14
action_30 (50) = happyShift action_15
action_30 (4) = happyGoto action_26
action_30 (5) = happyGoto action_4
action_30 (14) = happyGoto action_51
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (42) = happyShift action_36
action_31 (43) = happyShift action_37
action_31 (44) = happyShift action_38
action_31 (45) = happyShift action_39
action_31 (46) = happyShift action_40
action_31 (55) = happyShift action_50
action_31 _ = happyReduce_28

action_32 (49) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (17) = happyShift action_2
action_33 (18) = happyShift action_5
action_33 (19) = happyShift action_6
action_33 (25) = happyShift action_7
action_33 (28) = happyShift action_8
action_33 (31) = happyShift action_9
action_33 (38) = happyShift action_10
action_33 (39) = happyShift action_11
action_33 (40) = happyShift action_12
action_33 (41) = happyShift action_13
action_33 (48) = happyShift action_14
action_33 (50) = happyShift action_15
action_33 (4) = happyGoto action_48
action_33 (5) = happyGoto action_4
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_47
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (17) = happyShift action_2
action_35 (18) = happyShift action_5
action_35 (19) = happyShift action_6
action_35 (25) = happyShift action_7
action_35 (28) = happyShift action_8
action_35 (31) = happyShift action_9
action_35 (38) = happyShift action_10
action_35 (39) = happyShift action_11
action_35 (40) = happyShift action_12
action_35 (41) = happyShift action_13
action_35 (48) = happyShift action_14
action_35 (50) = happyShift action_15
action_35 (4) = happyGoto action_46
action_35 (5) = happyGoto action_4
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_2
action_36 (18) = happyShift action_5
action_36 (19) = happyShift action_6
action_36 (25) = happyShift action_7
action_36 (28) = happyShift action_8
action_36 (31) = happyShift action_9
action_36 (38) = happyShift action_10
action_36 (39) = happyShift action_11
action_36 (40) = happyShift action_12
action_36 (41) = happyShift action_13
action_36 (48) = happyShift action_14
action_36 (50) = happyShift action_15
action_36 (4) = happyGoto action_45
action_36 (5) = happyGoto action_4
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (17) = happyShift action_2
action_37 (18) = happyShift action_5
action_37 (19) = happyShift action_6
action_37 (25) = happyShift action_7
action_37 (28) = happyShift action_8
action_37 (31) = happyShift action_9
action_37 (38) = happyShift action_10
action_37 (39) = happyShift action_11
action_37 (40) = happyShift action_12
action_37 (41) = happyShift action_13
action_37 (48) = happyShift action_14
action_37 (50) = happyShift action_15
action_37 (4) = happyGoto action_44
action_37 (5) = happyGoto action_4
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (17) = happyShift action_2
action_38 (18) = happyShift action_5
action_38 (19) = happyShift action_6
action_38 (25) = happyShift action_7
action_38 (28) = happyShift action_8
action_38 (31) = happyShift action_9
action_38 (38) = happyShift action_10
action_38 (39) = happyShift action_11
action_38 (40) = happyShift action_12
action_38 (41) = happyShift action_13
action_38 (48) = happyShift action_14
action_38 (50) = happyShift action_15
action_38 (4) = happyGoto action_43
action_38 (5) = happyGoto action_4
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (17) = happyShift action_2
action_39 (18) = happyShift action_5
action_39 (19) = happyShift action_6
action_39 (25) = happyShift action_7
action_39 (28) = happyShift action_8
action_39 (31) = happyShift action_9
action_39 (38) = happyShift action_10
action_39 (39) = happyShift action_11
action_39 (40) = happyShift action_12
action_39 (41) = happyShift action_13
action_39 (48) = happyShift action_14
action_39 (50) = happyShift action_15
action_39 (4) = happyGoto action_42
action_39 (5) = happyGoto action_4
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (17) = happyShift action_2
action_40 (18) = happyShift action_5
action_40 (19) = happyShift action_6
action_40 (25) = happyShift action_7
action_40 (28) = happyShift action_8
action_40 (31) = happyShift action_9
action_40 (38) = happyShift action_10
action_40 (39) = happyShift action_11
action_40 (40) = happyShift action_12
action_40 (41) = happyShift action_13
action_40 (48) = happyShift action_14
action_40 (50) = happyShift action_15
action_40 (4) = happyGoto action_41
action_40 (5) = happyGoto action_4
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (45) = happyShift action_39
action_41 _ = happyReduce_16

action_42 _ = happyReduce_17

action_43 (45) = happyShift action_39
action_43 (46) = happyShift action_40
action_43 _ = happyReduce_15

action_44 (44) = happyShift action_38
action_44 (45) = happyShift action_39
action_44 (46) = happyShift action_40
action_44 _ = happyReduce_14

action_45 (44) = happyShift action_38
action_45 (45) = happyShift action_39
action_45 (46) = happyShift action_40
action_45 _ = happyReduce_13

action_46 _ = happyReduce_5

action_47 (17) = happyShift action_2
action_47 (18) = happyShift action_5
action_47 (19) = happyShift action_6
action_47 (25) = happyShift action_7
action_47 (28) = happyShift action_8
action_47 (31) = happyShift action_9
action_47 (38) = happyShift action_10
action_47 (39) = happyShift action_11
action_47 (40) = happyShift action_12
action_47 (41) = happyShift action_13
action_47 (48) = happyShift action_14
action_47 (50) = happyShift action_15
action_47 (4) = happyGoto action_31
action_47 (5) = happyGoto action_4
action_47 (9) = happyGoto action_82
action_47 _ = happyReduce_27

action_48 (42) = happyShift action_36
action_48 (43) = happyShift action_37
action_48 (44) = happyShift action_38
action_48 (45) = happyShift action_39
action_48 (46) = happyShift action_40
action_48 (53) = happyShift action_81
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_6

action_50 (17) = happyShift action_2
action_50 (18) = happyShift action_5
action_50 (19) = happyShift action_6
action_50 (25) = happyShift action_7
action_50 (28) = happyShift action_8
action_50 (31) = happyShift action_9
action_50 (38) = happyShift action_10
action_50 (39) = happyShift action_11
action_50 (40) = happyShift action_12
action_50 (41) = happyShift action_13
action_50 (48) = happyShift action_14
action_50 (50) = happyShift action_15
action_50 (4) = happyGoto action_31
action_50 (5) = happyGoto action_4
action_50 (9) = happyGoto action_80
action_50 _ = happyReduce_27

action_51 (36) = happyShift action_53
action_51 (37) = happyShift action_54
action_51 _ = happyReduce_41

action_52 (17) = happyShift action_2
action_52 (18) = happyShift action_5
action_52 (19) = happyShift action_6
action_52 (25) = happyShift action_7
action_52 (28) = happyShift action_8
action_52 (31) = happyShift action_9
action_52 (38) = happyShift action_10
action_52 (39) = happyShift action_11
action_52 (40) = happyShift action_12
action_52 (41) = happyShift action_13
action_52 (48) = happyShift action_14
action_52 (50) = happyShift action_15
action_52 (4) = happyGoto action_79
action_52 (5) = happyGoto action_4
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_2
action_53 (18) = happyShift action_5
action_53 (19) = happyShift action_6
action_53 (25) = happyShift action_7
action_53 (28) = happyShift action_8
action_53 (31) = happyShift action_9
action_53 (33) = happyShift action_28
action_53 (34) = happyShift action_29
action_53 (35) = happyShift action_30
action_53 (38) = happyShift action_10
action_53 (39) = happyShift action_11
action_53 (40) = happyShift action_12
action_53 (41) = happyShift action_13
action_53 (48) = happyShift action_14
action_53 (50) = happyShift action_15
action_53 (4) = happyGoto action_26
action_53 (5) = happyGoto action_4
action_53 (14) = happyGoto action_78
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_2
action_54 (18) = happyShift action_5
action_54 (19) = happyShift action_6
action_54 (25) = happyShift action_7
action_54 (28) = happyShift action_8
action_54 (31) = happyShift action_9
action_54 (33) = happyShift action_28
action_54 (34) = happyShift action_29
action_54 (35) = happyShift action_30
action_54 (38) = happyShift action_10
action_54 (39) = happyShift action_11
action_54 (40) = happyShift action_12
action_54 (41) = happyShift action_13
action_54 (48) = happyShift action_14
action_54 (50) = happyShift action_15
action_54 (4) = happyGoto action_26
action_54 (5) = happyGoto action_4
action_54 (14) = happyGoto action_77
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (17) = happyShift action_2
action_55 (18) = happyShift action_5
action_55 (19) = happyShift action_6
action_55 (25) = happyShift action_7
action_55 (28) = happyShift action_8
action_55 (31) = happyShift action_9
action_55 (38) = happyShift action_10
action_55 (39) = happyShift action_11
action_55 (40) = happyShift action_12
action_55 (41) = happyShift action_13
action_55 (48) = happyShift action_14
action_55 (50) = happyShift action_15
action_55 (4) = happyGoto action_76
action_55 (5) = happyGoto action_4
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_45

action_57 _ = happyReduce_46

action_58 _ = happyReduce_47

action_59 _ = happyReduce_48

action_60 _ = happyReduce_49

action_61 _ = happyReduce_51

action_62 _ = happyReduce_50

action_63 _ = happyReduce_52

action_64 (17) = happyShift action_2
action_64 (18) = happyShift action_5
action_64 (19) = happyShift action_6
action_64 (25) = happyShift action_7
action_64 (28) = happyShift action_8
action_64 (31) = happyShift action_9
action_64 (38) = happyShift action_10
action_64 (39) = happyShift action_11
action_64 (40) = happyShift action_12
action_64 (41) = happyShift action_13
action_64 (48) = happyShift action_14
action_64 (50) = happyShift action_15
action_64 (4) = happyGoto action_75
action_64 (5) = happyGoto action_4
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (50) = happyShift action_74
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_19

action_67 (54) = happyShift action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_25

action_69 (17) = happyShift action_2
action_69 (18) = happyShift action_5
action_69 (19) = happyShift action_6
action_69 (25) = happyShift action_7
action_69 (28) = happyShift action_8
action_69 (31) = happyShift action_9
action_69 (38) = happyShift action_10
action_69 (39) = happyShift action_11
action_69 (40) = happyShift action_12
action_69 (41) = happyShift action_13
action_69 (42) = happyShift action_36
action_69 (43) = happyShift action_37
action_69 (44) = happyShift action_38
action_69 (45) = happyShift action_39
action_69 (46) = happyShift action_40
action_69 (48) = happyShift action_14
action_69 (50) = happyShift action_15
action_69 (4) = happyGoto action_69
action_69 (5) = happyGoto action_4
action_69 (6) = happyGoto action_72
action_69 _ = happyReduce_22

action_70 (51) = happyShift action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_2

action_72 _ = happyReduce_23

action_73 (21) = happyShift action_93
action_73 (22) = happyShift action_94
action_73 (23) = happyShift action_95
action_73 (24) = happyShift action_96
action_73 (16) = happyGoto action_92
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (17) = happyShift action_89
action_74 (18) = happyShift action_90
action_74 (57) = happyShift action_91
action_74 (10) = happyGoto action_86
action_74 (11) = happyGoto action_87
action_74 (12) = happyGoto action_88
action_74 _ = happyReduce_30

action_75 (29) = happyShift action_85
action_75 (42) = happyShift action_36
action_75 (43) = happyShift action_37
action_75 (44) = happyShift action_38
action_75 (45) = happyShift action_39
action_75 (46) = happyShift action_40
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (42) = happyShift action_36
action_76 (43) = happyShift action_37
action_76 (44) = happyShift action_38
action_76 (45) = happyShift action_39
action_76 (46) = happyShift action_40
action_76 _ = happyReduce_44

action_77 _ = happyReduce_43

action_78 (37) = happyShift action_54
action_78 _ = happyReduce_42

action_79 (27) = happyShift action_84
action_79 (42) = happyShift action_36
action_79 (43) = happyShift action_37
action_79 (44) = happyShift action_38
action_79 (45) = happyShift action_39
action_79 (46) = happyShift action_40
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_29

action_81 _ = happyReduce_21

action_82 (49) = happyShift action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_7

action_84 (17) = happyShift action_2
action_84 (18) = happyShift action_5
action_84 (19) = happyShift action_6
action_84 (25) = happyShift action_7
action_84 (28) = happyShift action_8
action_84 (31) = happyShift action_9
action_84 (38) = happyShift action_10
action_84 (39) = happyShift action_11
action_84 (40) = happyShift action_12
action_84 (41) = happyShift action_13
action_84 (48) = happyShift action_14
action_84 (50) = happyShift action_15
action_84 (4) = happyGoto action_106
action_84 (5) = happyGoto action_4
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (17) = happyShift action_2
action_85 (18) = happyShift action_5
action_85 (19) = happyShift action_6
action_85 (25) = happyShift action_7
action_85 (28) = happyShift action_8
action_85 (31) = happyShift action_9
action_85 (38) = happyShift action_10
action_85 (39) = happyShift action_11
action_85 (40) = happyShift action_12
action_85 (41) = happyShift action_13
action_85 (48) = happyShift action_14
action_85 (50) = happyShift action_15
action_85 (4) = happyGoto action_105
action_85 (5) = happyGoto action_4
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (51) = happyShift action_104
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (17) = happyShift action_89
action_87 (18) = happyShift action_90
action_87 (57) = happyShift action_91
action_87 (10) = happyGoto action_103
action_87 (11) = happyGoto action_87
action_87 (12) = happyGoto action_88
action_87 _ = happyReduce_30

action_88 (58) = happyShift action_102
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_34

action_90 (48) = happyShift action_101
action_90 _ = happyReduce_35

action_91 _ = happyReduce_33

action_92 (47) = happyShift action_100
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (52) = happyShift action_99
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (52) = happyShift action_98
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (18) = happyShift action_97
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_56

action_97 _ = happyReduce_55

action_98 (17) = happyShift action_113
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (17) = happyShift action_112
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (17) = happyShift action_2
action_100 (18) = happyShift action_5
action_100 (19) = happyShift action_6
action_100 (25) = happyShift action_7
action_100 (28) = happyShift action_8
action_100 (31) = happyShift action_9
action_100 (38) = happyShift action_10
action_100 (39) = happyShift action_11
action_100 (40) = happyShift action_12
action_100 (41) = happyShift action_13
action_100 (48) = happyShift action_14
action_100 (50) = happyShift action_15
action_100 (4) = happyGoto action_111
action_100 (5) = happyGoto action_4
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (17) = happyShift action_89
action_101 (18) = happyShift action_90
action_101 (57) = happyShift action_91
action_101 (12) = happyGoto action_109
action_101 (13) = happyGoto action_110
action_101 _ = happyReduce_37

action_102 (17) = happyShift action_2
action_102 (18) = happyShift action_5
action_102 (19) = happyShift action_6
action_102 (25) = happyShift action_7
action_102 (28) = happyShift action_8
action_102 (31) = happyShift action_9
action_102 (38) = happyShift action_10
action_102 (39) = happyShift action_11
action_102 (40) = happyShift action_12
action_102 (41) = happyShift action_13
action_102 (48) = happyShift action_14
action_102 (50) = happyShift action_15
action_102 (4) = happyGoto action_108
action_102 (5) = happyGoto action_4
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_31

action_104 _ = happyReduce_8

action_105 (30) = happyShift action_107
action_105 (42) = happyShift action_36
action_105 (43) = happyShift action_37
action_105 (44) = happyShift action_38
action_105 (45) = happyShift action_39
action_105 (46) = happyShift action_40
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (42) = happyShift action_36
action_106 (43) = happyShift action_37
action_106 (44) = happyShift action_38
action_106 (45) = happyShift action_39
action_106 (46) = happyShift action_40
action_106 _ = happyReduce_3

action_107 (17) = happyShift action_2
action_107 (18) = happyShift action_5
action_107 (19) = happyShift action_6
action_107 (25) = happyShift action_7
action_107 (28) = happyShift action_8
action_107 (31) = happyShift action_9
action_107 (38) = happyShift action_10
action_107 (39) = happyShift action_11
action_107 (40) = happyShift action_12
action_107 (41) = happyShift action_13
action_107 (48) = happyShift action_14
action_107 (50) = happyShift action_15
action_107 (4) = happyGoto action_118
action_107 (5) = happyGoto action_4
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (42) = happyShift action_36
action_108 (43) = happyShift action_37
action_108 (44) = happyShift action_38
action_108 (45) = happyShift action_39
action_108 (46) = happyShift action_40
action_108 _ = happyReduce_32

action_109 (55) = happyShift action_117
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (49) = happyShift action_116
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (42) = happyShift action_36
action_111 (43) = happyShift action_37
action_111 (44) = happyShift action_38
action_111 (45) = happyShift action_39
action_111 (46) = happyShift action_40
action_111 _ = happyReduce_26

action_112 (53) = happyShift action_115
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (55) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (17) = happyShift action_120
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_53

action_116 _ = happyReduce_36

action_117 (17) = happyShift action_89
action_117 (18) = happyShift action_90
action_117 (57) = happyShift action_91
action_117 (12) = happyGoto action_109
action_117 (13) = happyGoto action_119
action_117 _ = happyReduce_37

action_118 (42) = happyShift action_36
action_118 (43) = happyShift action_37
action_118 (44) = happyShift action_38
action_118 (45) = happyShift action_39
action_118 (46) = happyShift action_40
action_118 _ = happyReduce_4

action_119 _ = happyReduce_38

action_120 (53) = happyShift action_121
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_54

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (ExprLit happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 6 4 happyReduction_3
happyReduction_3 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 8 4 happyReduction_4
happyReduction_4 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprFor happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn9  happy_var_2)
	(HappyTerminal (TokenIdC happy_var_1))
	 =  HappyAbsSyn4
		 (ExprCall happy_var_1 happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 5 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 6 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_2  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ExprUnOp UnOpTransmute happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ExprUnOp UnOpExtend happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ExprUnOp UnOpSignExtend happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (ExprUnOp UnOpShrink happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  4 happyReduction_18
happyReduction_18 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (ExprVar happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  5 happyReduction_20
happyReduction_20 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn5
		 (LValId happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 5 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_0  6 happyReduction_22
happyReduction_22  =  HappyAbsSyn6
		 ([]
	)

happyReduce_23 = happySpecReduce_2  6 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  7 happyReduction_24
happyReduction_24  =  HappyAbsSyn7
		 ([]
	)

happyReduce_25 = happySpecReduce_2  7 happyReduction_25
happyReduction_25 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 6 8 happyReduction_26
happyReduction_26 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_0  9 happyReduction_27
happyReduction_27  =  HappyAbsSyn9
		 ([]
	)

happyReduce_28 = happySpecReduce_1  9 happyReduction_28
happyReduction_28 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  9 happyReduction_29
happyReduction_29 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_0  10 happyReduction_30
happyReduction_30  =  HappyAbsSyn10
		 ([]
	)

happyReduce_31 = happySpecReduce_2  10 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_3)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  12 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn12
		 (PatWildcard
	)

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (PatLit happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn12
		 (PatData happy_var_1 []
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 12 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_0  13 happyReduction_37
happyReduction_37  =  HappyAbsSyn13
		 ([]
	)

happyReduce_38 = happySpecReduce_3  13 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  14 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn14
		 (PredLit True
	)

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (PredLit False
	)

happyReduce_41 = happySpecReduce_2  14 happyReduction_41
happyReduction_41 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  14 happyReduction_42
happyReduction_42 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  14 happyReduction_44
happyReduction_44 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn14
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (CompLe
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (CompGe
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn15
		 (CompLeq
	)

happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn15
		 (CompGeq
	)

happyReduce_49 = happySpecReduce_1  15 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn15
		 (CompLeS
	)

happyReduce_50 = happySpecReduce_1  15 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn15
		 (CompGeS
	)

happyReduce_51 = happySpecReduce_1  15 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn15
		 (CompLeqS
	)

happyReduce_52 = happySpecReduce_1  15 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn15
		 (CompGeqS
	)

happyReduce_53 = happyReduce 4 16 happyReduction_53
happyReduction_53 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 6 16 happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_2  16 happyReduction_55
happyReduction_55 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn16
		 (TypeData happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  16 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn16
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 68 68 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 17;
	TokenId happy_dollar_dollar -> cont 18;
	TokenIdC happy_dollar_dollar -> cont 19;
	TokenVar -> cont 20;
	TokenBits -> cont 21;
	TokenRange -> cont 22;
	TokenData -> cont 23;
	TokenVoid -> cont 24;
	TokenIf -> cont 25;
	TokenThen -> cont 26;
	TokenElse -> cont 27;
	TokenFor -> cont 28;
	TokenTo -> cont 29;
	TokenDo -> cont 30;
	TokenMatch -> cont 31;
	TokenWith -> cont 32;
	TokenTrue -> cont 33;
	TokenFalse -> cont 34;
	TokenNot -> cont 35;
	TokenAnd -> cont 36;
	TokenOr -> cont 37;
	TokenTransmute -> cont 38;
	TokenShrink -> cont 39;
	TokenExtend -> cont 40;
	TokenSignExtend -> cont 41;
	TokenPlus -> cont 42;
	TokenMinus -> cont 43;
	TokenAmphersand -> cont 44;
	TokenPipe -> cont 45;
	TokenCaret -> cont 46;
	TokenEq -> cont 47;
	TokenLParen -> cont 48;
	TokenRParen -> cont 49;
	TokenLBrace -> cont 50;
	TokenRBrace -> cont 51;
	TokenLBracket -> cont 52;
	TokenRBracket -> cont 53;
	TokenColon -> cont 54;
	TokenComma -> cont 55;
	TokenDot -> cont 56;
	TokenUnderscore -> cont 57;
	TokenRArrow -> cont 58;
	TokenLArrow -> cont 59;
	TokenLe -> cont 60;
	TokenGe -> cont 61;
	TokenLeq -> cont 62;
	TokenGeq -> cont 63;
	TokenLeS -> cont 64;
	TokenLeqS -> cont 65;
	TokenGeS -> cont 66;
	TokenGeqS -> cont 67;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 68 tk tks = happyError' (tks, explist)
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
