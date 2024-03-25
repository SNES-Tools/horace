{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

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
happyExpList = Happy_Data_Array.listArray (0,245) ([0,18695,20960,0,0,2,0,0,0,0,0,0,0,0,12288,0,0,0,0,2048,0,0,0,544,0,16832,30738,20,0,33664,62372,40,0,512,0,0,0,3584,49298,163,0,7168,33060,327,0,14336,584,655,0,28672,1168,1310,0,57344,2336,2620,0,49152,4673,5240,0,0,4,0,0,0,18695,20960,0,0,16,0,0,0,8,0,0,0,0,12288,1,0,0,24576,0,0,0,49152,0,0,0,32768,1,0,0,0,3,0,0,128,6,0,0,0,16,0,0,0,24,1020,0,49168,0,0,0,0,0,0,0,0,0,0,49152,53825,5241,0,0,0,768,4,0,0,8192,0,0,37390,41920,0,0,16,0,0,0,18488,36610,2,0,36976,7684,5,0,8416,15369,10,0,0,0,0,0,0,0,2,0,0,0,0,0,3584,49298,163,0,0,0,2072,0,0,0,0,0,28672,1168,1310,0,0,0,3,0,49152,4673,5240,0,32768,42115,10483,0,0,18695,20967,0,0,37390,41920,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7168,33060,327,0,0,0,512,0,0,0,0,0,0,0,32768,0,0,0,0,0,32768,9347,11248,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,1920,0,0,0,48,0,512,0,0,49154,0,0,0,32768,1,0,0,0,0,0,0,4096,0,0,0,8,12,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,49152,4673,5240,0,32768,9347,10480,0,0,0,32768,0,0,6,0,64,0,0,0,256,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,2,0,0,0,128,0,0,0,256,0,1024,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,8192,0,0,0,49152,4673,5240,0,32768,1,0,16,0,18695,20960,0,0,0,0,0,0,0,0,0,0,0,12289,0,0,0,24576,0,0,8416,15369,10,0,0,32768,1,0,0,0,1024,0,0,0,32,0,0,0,12,0,0,0,2048,0,0,0,16384,0,4096,0,0,0,0,0,0,0,0,0,0,0,32768,1,0,16,0,0,1536,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_reg","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'*'","'='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 65
        bit_end = (st Prelude.+ 1) Prelude.* 65
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..64]
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
action_0 (45) = happyShift action_14
action_0 (47) = happyShift action_15
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (42) = happyShift action_36
action_3 (43) = happyShift action_37
action_3 (65) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (56) = happyShift action_35
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (49) = happyShift action_33
action_5 (53) = happyShift action_34
action_5 (56) = happyReduce_17
action_5 _ = happyReduce_15

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
action_6 (45) = happyShift action_14
action_6 (47) = happyShift action_15
action_6 (4) = happyGoto action_31
action_6 (5) = happyGoto action_4
action_6 (9) = happyGoto action_32
action_6 _ = happyReduce_24

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
action_7 (45) = happyShift action_14
action_7 (47) = happyShift action_15
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
action_9 (45) = happyShift action_14
action_9 (47) = happyShift action_15
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
action_10 (45) = happyShift action_14
action_10 (47) = happyShift action_15
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
action_11 (45) = happyShift action_14
action_11 (47) = happyShift action_15
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
action_12 (45) = happyShift action_14
action_12 (47) = happyShift action_15
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
action_13 (45) = happyShift action_14
action_13 (47) = happyShift action_15
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
action_14 (45) = happyShift action_14
action_14 (47) = happyShift action_15
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (20) = happyShift action_18
action_15 (7) = happyGoto action_16
action_15 (8) = happyGoto action_17
action_15 _ = happyReduce_21

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
action_16 (45) = happyShift action_14
action_16 (47) = happyShift action_15
action_16 (4) = happyGoto action_63
action_16 (5) = happyGoto action_4
action_16 (6) = happyGoto action_64
action_16 _ = happyReduce_19

action_17 (20) = happyShift action_18
action_17 (7) = happyGoto action_62
action_17 (8) = happyGoto action_17
action_17 _ = happyReduce_21

action_18 (18) = happyShift action_61
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (42) = happyShift action_36
action_19 (43) = happyShift action_37
action_19 (46) = happyShift action_60
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (42) = happyShift action_36
action_20 (43) = happyShift action_37
action_20 _ = happyReduce_11

action_21 (42) = happyShift action_36
action_21 (43) = happyShift action_37
action_21 _ = happyReduce_10

action_22 (42) = happyShift action_36
action_22 (43) = happyShift action_37
action_22 _ = happyReduce_12

action_23 (42) = happyShift action_36
action_23 (43) = happyShift action_37
action_23 _ = happyReduce_9

action_24 (32) = happyShift action_59
action_24 (42) = happyShift action_36
action_24 (43) = happyShift action_37
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (44) = happyShift action_58
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (42) = happyShift action_36
action_26 (43) = happyShift action_37
action_26 (57) = happyShift action_50
action_26 (58) = happyShift action_51
action_26 (59) = happyShift action_52
action_26 (60) = happyShift action_53
action_26 (61) = happyShift action_54
action_26 (62) = happyShift action_55
action_26 (63) = happyShift action_56
action_26 (64) = happyShift action_57
action_26 (15) = happyGoto action_49
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (26) = happyShift action_46
action_27 (36) = happyShift action_47
action_27 (37) = happyShift action_48
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_36

action_29 _ = happyReduce_37

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
action_30 (45) = happyShift action_14
action_30 (47) = happyShift action_15
action_30 (4) = happyGoto action_26
action_30 (5) = happyGoto action_4
action_30 (14) = happyGoto action_45
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (42) = happyShift action_36
action_31 (43) = happyShift action_37
action_31 (52) = happyShift action_44
action_31 _ = happyReduce_25

action_32 (46) = happyShift action_43
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
action_33 (45) = happyShift action_14
action_33 (47) = happyShift action_15
action_33 (4) = happyGoto action_42
action_33 (5) = happyGoto action_4
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_41
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
action_35 (45) = happyShift action_14
action_35 (47) = happyShift action_15
action_35 (4) = happyGoto action_40
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
action_36 (45) = happyShift action_14
action_36 (47) = happyShift action_15
action_36 (4) = happyGoto action_39
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
action_37 (45) = happyShift action_14
action_37 (47) = happyShift action_15
action_37 (4) = happyGoto action_38
action_37 (5) = happyGoto action_4
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_14

action_39 (43) = happyShift action_37
action_39 _ = happyReduce_13

action_40 _ = happyReduce_5

action_41 (17) = happyShift action_2
action_41 (18) = happyShift action_5
action_41 (19) = happyShift action_6
action_41 (25) = happyShift action_7
action_41 (28) = happyShift action_8
action_41 (31) = happyShift action_9
action_41 (38) = happyShift action_10
action_41 (39) = happyShift action_11
action_41 (40) = happyShift action_12
action_41 (41) = happyShift action_13
action_41 (45) = happyShift action_14
action_41 (47) = happyShift action_15
action_41 (4) = happyGoto action_31
action_41 (5) = happyGoto action_4
action_41 (9) = happyGoto action_76
action_41 _ = happyReduce_24

action_42 (42) = happyShift action_36
action_42 (43) = happyShift action_37
action_42 (50) = happyShift action_75
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_6

action_44 (17) = happyShift action_2
action_44 (18) = happyShift action_5
action_44 (19) = happyShift action_6
action_44 (25) = happyShift action_7
action_44 (28) = happyShift action_8
action_44 (31) = happyShift action_9
action_44 (38) = happyShift action_10
action_44 (39) = happyShift action_11
action_44 (40) = happyShift action_12
action_44 (41) = happyShift action_13
action_44 (45) = happyShift action_14
action_44 (47) = happyShift action_15
action_44 (4) = happyGoto action_31
action_44 (5) = happyGoto action_4
action_44 (9) = happyGoto action_74
action_44 _ = happyReduce_24

action_45 (36) = happyShift action_47
action_45 (37) = happyShift action_48
action_45 _ = happyReduce_38

action_46 (17) = happyShift action_2
action_46 (18) = happyShift action_5
action_46 (19) = happyShift action_6
action_46 (25) = happyShift action_7
action_46 (28) = happyShift action_8
action_46 (31) = happyShift action_9
action_46 (38) = happyShift action_10
action_46 (39) = happyShift action_11
action_46 (40) = happyShift action_12
action_46 (41) = happyShift action_13
action_46 (45) = happyShift action_14
action_46 (47) = happyShift action_15
action_46 (4) = happyGoto action_73
action_46 (5) = happyGoto action_4
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (17) = happyShift action_2
action_47 (18) = happyShift action_5
action_47 (19) = happyShift action_6
action_47 (25) = happyShift action_7
action_47 (28) = happyShift action_8
action_47 (31) = happyShift action_9
action_47 (33) = happyShift action_28
action_47 (34) = happyShift action_29
action_47 (35) = happyShift action_30
action_47 (38) = happyShift action_10
action_47 (39) = happyShift action_11
action_47 (40) = happyShift action_12
action_47 (41) = happyShift action_13
action_47 (45) = happyShift action_14
action_47 (47) = happyShift action_15
action_47 (4) = happyGoto action_26
action_47 (5) = happyGoto action_4
action_47 (14) = happyGoto action_72
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (17) = happyShift action_2
action_48 (18) = happyShift action_5
action_48 (19) = happyShift action_6
action_48 (25) = happyShift action_7
action_48 (28) = happyShift action_8
action_48 (31) = happyShift action_9
action_48 (33) = happyShift action_28
action_48 (34) = happyShift action_29
action_48 (35) = happyShift action_30
action_48 (38) = happyShift action_10
action_48 (39) = happyShift action_11
action_48 (40) = happyShift action_12
action_48 (41) = happyShift action_13
action_48 (45) = happyShift action_14
action_48 (47) = happyShift action_15
action_48 (4) = happyGoto action_26
action_48 (5) = happyGoto action_4
action_48 (14) = happyGoto action_71
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (17) = happyShift action_2
action_49 (18) = happyShift action_5
action_49 (19) = happyShift action_6
action_49 (25) = happyShift action_7
action_49 (28) = happyShift action_8
action_49 (31) = happyShift action_9
action_49 (38) = happyShift action_10
action_49 (39) = happyShift action_11
action_49 (40) = happyShift action_12
action_49 (41) = happyShift action_13
action_49 (45) = happyShift action_14
action_49 (47) = happyShift action_15
action_49 (4) = happyGoto action_70
action_49 (5) = happyGoto action_4
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_42

action_51 _ = happyReduce_43

action_52 _ = happyReduce_44

action_53 _ = happyReduce_45

action_54 _ = happyReduce_46

action_55 _ = happyReduce_48

action_56 _ = happyReduce_47

action_57 _ = happyReduce_49

action_58 (17) = happyShift action_2
action_58 (18) = happyShift action_5
action_58 (19) = happyShift action_6
action_58 (25) = happyShift action_7
action_58 (28) = happyShift action_8
action_58 (31) = happyShift action_9
action_58 (38) = happyShift action_10
action_58 (39) = happyShift action_11
action_58 (40) = happyShift action_12
action_58 (41) = happyShift action_13
action_58 (45) = happyShift action_14
action_58 (47) = happyShift action_15
action_58 (4) = happyGoto action_69
action_58 (5) = happyGoto action_4
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (47) = happyShift action_68
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_16

action_61 (51) = happyShift action_67
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_22

action_63 (17) = happyShift action_2
action_63 (18) = happyShift action_5
action_63 (19) = happyShift action_6
action_63 (25) = happyShift action_7
action_63 (28) = happyShift action_8
action_63 (31) = happyShift action_9
action_63 (38) = happyShift action_10
action_63 (39) = happyShift action_11
action_63 (40) = happyShift action_12
action_63 (41) = happyShift action_13
action_63 (42) = happyShift action_36
action_63 (43) = happyShift action_37
action_63 (45) = happyShift action_14
action_63 (47) = happyShift action_15
action_63 (4) = happyGoto action_63
action_63 (5) = happyGoto action_4
action_63 (6) = happyGoto action_66
action_63 _ = happyReduce_19

action_64 (48) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_2

action_66 _ = happyReduce_20

action_67 (21) = happyShift action_87
action_67 (22) = happyShift action_88
action_67 (23) = happyShift action_89
action_67 (24) = happyShift action_90
action_67 (16) = happyGoto action_86
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (17) = happyShift action_83
action_68 (18) = happyShift action_84
action_68 (54) = happyShift action_85
action_68 (10) = happyGoto action_80
action_68 (11) = happyGoto action_81
action_68 (12) = happyGoto action_82
action_68 _ = happyReduce_27

action_69 (29) = happyShift action_79
action_69 (42) = happyShift action_36
action_69 (43) = happyShift action_37
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (42) = happyShift action_36
action_70 (43) = happyShift action_37
action_70 _ = happyReduce_41

action_71 _ = happyReduce_40

action_72 (37) = happyShift action_48
action_72 _ = happyReduce_39

action_73 (27) = happyShift action_78
action_73 (42) = happyShift action_36
action_73 (43) = happyShift action_37
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_26

action_75 _ = happyReduce_18

action_76 (46) = happyShift action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_7

action_78 (17) = happyShift action_2
action_78 (18) = happyShift action_5
action_78 (19) = happyShift action_6
action_78 (25) = happyShift action_7
action_78 (28) = happyShift action_8
action_78 (31) = happyShift action_9
action_78 (38) = happyShift action_10
action_78 (39) = happyShift action_11
action_78 (40) = happyShift action_12
action_78 (41) = happyShift action_13
action_78 (45) = happyShift action_14
action_78 (47) = happyShift action_15
action_78 (4) = happyGoto action_100
action_78 (5) = happyGoto action_4
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (17) = happyShift action_2
action_79 (18) = happyShift action_5
action_79 (19) = happyShift action_6
action_79 (25) = happyShift action_7
action_79 (28) = happyShift action_8
action_79 (31) = happyShift action_9
action_79 (38) = happyShift action_10
action_79 (39) = happyShift action_11
action_79 (40) = happyShift action_12
action_79 (41) = happyShift action_13
action_79 (45) = happyShift action_14
action_79 (47) = happyShift action_15
action_79 (4) = happyGoto action_99
action_79 (5) = happyGoto action_4
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (48) = happyShift action_98
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (17) = happyShift action_83
action_81 (18) = happyShift action_84
action_81 (54) = happyShift action_85
action_81 (10) = happyGoto action_97
action_81 (11) = happyGoto action_81
action_81 (12) = happyGoto action_82
action_81 _ = happyReduce_27

action_82 (55) = happyShift action_96
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_31

action_84 (45) = happyShift action_95
action_84 _ = happyReduce_32

action_85 _ = happyReduce_30

action_86 (44) = happyShift action_94
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (49) = happyShift action_93
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (49) = happyShift action_92
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (18) = happyShift action_91
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_53

action_91 _ = happyReduce_52

action_92 (17) = happyShift action_107
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (17) = happyShift action_106
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (17) = happyShift action_2
action_94 (18) = happyShift action_5
action_94 (19) = happyShift action_6
action_94 (25) = happyShift action_7
action_94 (28) = happyShift action_8
action_94 (31) = happyShift action_9
action_94 (38) = happyShift action_10
action_94 (39) = happyShift action_11
action_94 (40) = happyShift action_12
action_94 (41) = happyShift action_13
action_94 (45) = happyShift action_14
action_94 (47) = happyShift action_15
action_94 (4) = happyGoto action_105
action_94 (5) = happyGoto action_4
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (17) = happyShift action_83
action_95 (18) = happyShift action_84
action_95 (54) = happyShift action_85
action_95 (12) = happyGoto action_103
action_95 (13) = happyGoto action_104
action_95 _ = happyReduce_34

action_96 (17) = happyShift action_2
action_96 (18) = happyShift action_5
action_96 (19) = happyShift action_6
action_96 (25) = happyShift action_7
action_96 (28) = happyShift action_8
action_96 (31) = happyShift action_9
action_96 (38) = happyShift action_10
action_96 (39) = happyShift action_11
action_96 (40) = happyShift action_12
action_96 (41) = happyShift action_13
action_96 (45) = happyShift action_14
action_96 (47) = happyShift action_15
action_96 (4) = happyGoto action_102
action_96 (5) = happyGoto action_4
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_28

action_98 _ = happyReduce_8

action_99 (30) = happyShift action_101
action_99 (42) = happyShift action_36
action_99 (43) = happyShift action_37
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (42) = happyShift action_36
action_100 (43) = happyShift action_37
action_100 _ = happyReduce_3

action_101 (17) = happyShift action_2
action_101 (18) = happyShift action_5
action_101 (19) = happyShift action_6
action_101 (25) = happyShift action_7
action_101 (28) = happyShift action_8
action_101 (31) = happyShift action_9
action_101 (38) = happyShift action_10
action_101 (39) = happyShift action_11
action_101 (40) = happyShift action_12
action_101 (41) = happyShift action_13
action_101 (45) = happyShift action_14
action_101 (47) = happyShift action_15
action_101 (4) = happyGoto action_112
action_101 (5) = happyGoto action_4
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (42) = happyShift action_36
action_102 (43) = happyShift action_37
action_102 _ = happyReduce_29

action_103 (52) = happyShift action_111
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (46) = happyShift action_110
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (42) = happyShift action_36
action_105 (43) = happyShift action_37
action_105 _ = happyReduce_23

action_106 (50) = happyShift action_109
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (52) = happyShift action_108
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (17) = happyShift action_114
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_50

action_110 _ = happyReduce_33

action_111 (17) = happyShift action_83
action_111 (18) = happyShift action_84
action_111 (54) = happyShift action_85
action_111 (12) = happyGoto action_103
action_111 (13) = happyGoto action_113
action_111 _ = happyReduce_34

action_112 (42) = happyShift action_36
action_112 (43) = happyShift action_37
action_112 _ = happyReduce_4

action_113 _ = happyReduce_35

action_114 (50) = happyShift action_115
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_51

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
		 (ExprBinOp BinOpMult happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  4 happyReduction_15
happyReduction_15 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (ExprVar happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  5 happyReduction_17
happyReduction_17 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn5
		 (LValId happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 5 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_0  6 happyReduction_19
happyReduction_19  =  HappyAbsSyn6
		 ([]
	)

happyReduce_20 = happySpecReduce_2  6 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_0  7 happyReduction_21
happyReduction_21  =  HappyAbsSyn7
		 ([]
	)

happyReduce_22 = happySpecReduce_2  7 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 6 8 happyReduction_23
happyReduction_23 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_0  9 happyReduction_24
happyReduction_24  =  HappyAbsSyn9
		 ([]
	)

happyReduce_25 = happySpecReduce_1  9 happyReduction_25
happyReduction_25 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  9 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_0  10 happyReduction_27
happyReduction_27  =  HappyAbsSyn10
		 ([]
	)

happyReduce_28 = happySpecReduce_2  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_3)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (PatWildcard
	)

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (PatLit happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn12
		 (PatData happy_var_1 []
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 12 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_0  13 happyReduction_34
happyReduction_34  =  HappyAbsSyn13
		 ([]
	)

happyReduce_35 = happySpecReduce_3  13 happyReduction_35
happyReduction_35 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn14
		 (PredLit True
	)

happyReduce_37 = happySpecReduce_1  14 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn14
		 (PredLit False
	)

happyReduce_38 = happySpecReduce_2  14 happyReduction_38
happyReduction_38 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  14 happyReduction_39
happyReduction_39 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  14 happyReduction_40
happyReduction_40 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  14 happyReduction_41
happyReduction_41 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn14
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn15
		 (CompLe
	)

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn15
		 (CompGe
	)

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn15
		 (CompLeq
	)

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (CompGeq
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (CompLeS
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn15
		 (CompGeS
	)

happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn15
		 (CompLeqS
	)

happyReduce_49 = happySpecReduce_1  15 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn15
		 (CompGeqS
	)

happyReduce_50 = happyReduce 4 16 happyReduction_50
happyReduction_50 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 6 16 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_2  16 happyReduction_52
happyReduction_52 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn16
		 (TypeData happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  16 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn16
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 65 65 notHappyAtAll (HappyState action) sts stk []

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
	TokenMult -> cont 43;
	TokenEq -> cont 44;
	TokenLParen -> cont 45;
	TokenRParen -> cont 46;
	TokenLBrace -> cont 47;
	TokenRBrace -> cont 48;
	TokenLBracket -> cont 49;
	TokenRBracket -> cont 50;
	TokenColon -> cont 51;
	TokenComma -> cont 52;
	TokenDot -> cont 53;
	TokenUnderscore -> cont 54;
	TokenRArrow -> cont 55;
	TokenLArrow -> cont 56;
	TokenLe -> cont 57;
	TokenGe -> cont 58;
	TokenLeq -> cont 59;
	TokenGeq -> cont 60;
	TokenLeS -> cont 61;
	TokenLeqS -> cont 62;
	TokenGeS -> cont 63;
	TokenGeqS -> cont 64;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 65 tk tks = happyError' (tks, explist)
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
