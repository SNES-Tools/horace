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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,348) ([0,32,0,0,0,0,4,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,16384,0,0,128,0,0,0,0,32,0,0,0,0,0,0,32,0,0,2,0,0,0,0,0,0,1,0,7168,33062,5127,0,0,0,0,31,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,68,0,14336,588,10255,0,0,0,0,0,0,0,12512,15593,160,0,0,8,0,0,0,32768,9411,33008,2,0,0,0,0,1,0,0,0,8192,0,0,0,0,1024,0,0,0,0,128,0,0,18823,480,5,0,0,1,0,0,0,0,0,0,0,0,0,0,1024,0,0,32,0,0,0,0,0,0,128,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,12512,15369,160,0,0,32,0,0,0,0,1,0,0,0,0,0,9184,0,0,512,0,0,0,0,64,0,0,0,0,8,0,0,0,0,1,0,0,0,0,4096,1984,0,0,0,0,256,0,0,0,0,127,2040,0,8192,384,0,0,0,0,0,0,0,0,0,0,0,0,14336,14924,10255,0,0,0,0,32830,0,0,0,0,64,0,0,9756,1921,20,0,0,2,0,0,0,28672,1176,20510,0,0,3584,49299,2563,0,0,25024,30738,320,0,0,19512,3842,40,0,0,18823,480,5,0,57344,2352,41020,0,0,0,0,64,0,0,0,0,0,0,0,0,0,3,0,0,0,28672,0,0,0,0,3584,0,0,0,0,0,0,0,34560,57417,1281,0,0,0,49152,1031,0,0,0,0,0,0,32768,9411,33008,2,0,0,32768,1,0,0,3584,49299,2563,0,0,25024,31186,320,0,0,19512,3898,40,0,0,18823,480,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,9411,33008,2,0,0,0,16384,0,0,0,0,0,1,0,0,0,2048,0,0,0,0,256,0,0,0,0,32,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,39024,65028,83,0,0,0,0,16,0,0,0,4096,0,0,0,0,32768,0,0,0,0,4096,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,512,0,0,0,0,25024,30738,320,0,0,0,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,1024,0,0,0,0,128,0,0,0,0,16,0,0,2,0,0,0,49152,0,0,128,0,0,128,496,0,0,0,0,62,0,0,0,0,0,0,0,0,64,0,0,0,512,7936,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,18823,480,5,0,57344,2352,41020,0,0,0,0,8192,0,0,384,0,0,1,0,0,0,16384,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,8192,0,0,12512,15369,160,0,0,9756,1921,20,0,32768,9411,33008,2,0,0,0,1024,0,0,0,0,124,0,0,0,0,2048,0,0,0,0,1024,0,0,1,0,0,0,0,0,0,0,0,7168,33062,5127,0,0,0,0,287,0,0,0,57344,35,0,0,0,31744,4,0,0,0,16384,0,0,6144,0,0,16,0,34560,57417,1281,0,0,0,0,0,0,0,0,0,0,0,0,4096,7936,0,0,0,0,992,0,0,3584,49299,2563,0,0,0,32768,15,0,0,0,0,1024,0,0,0,0,2,0,57344,2352,41020,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,0,0,8,0,0,0,0,0,0,0,0,574,0,0,0,0,0,0,0,12,0,2048,0,0,0,7936,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","state_decl","state_vars","state_var","main_decl","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_reg","mode","state","main","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 77
        bit_end = (st Prelude.+ 1) Prelude.* 77
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..76]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (22) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (77) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (59) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (23) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (24) = happyShift action_10
action_6 (8) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (59) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (26) = happyShift action_29
action_8 (6) = happyGoto action_27
action_8 (7) = happyGoto action_28
action_8 _ = happyReduce_3

action_9 (60) = happyShift action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (25) = happyShift action_13
action_10 (26) = happyShift action_14
action_10 (27) = happyShift action_15
action_10 (32) = happyShift action_16
action_10 (33) = happyShift action_17
action_10 (36) = happyShift action_18
action_10 (39) = happyShift action_19
action_10 (46) = happyShift action_20
action_10 (47) = happyShift action_21
action_10 (48) = happyShift action_22
action_10 (49) = happyShift action_23
action_10 (57) = happyShift action_24
action_10 (59) = happyShift action_25
action_10 (9) = happyGoto action_11
action_10 (10) = happyGoto action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (50) = happyShift action_53
action_11 (51) = happyShift action_54
action_11 (52) = happyShift action_55
action_11 (53) = happyShift action_56
action_11 (54) = happyShift action_57
action_11 _ = happyReduce_6

action_12 (68) = happyShift action_52
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_7

action_14 (61) = happyShift action_50
action_14 (65) = happyShift action_51
action_14 (68) = happyReduce_27
action_14 _ = happyReduce_24

action_15 (25) = happyShift action_13
action_15 (26) = happyShift action_14
action_15 (27) = happyShift action_15
action_15 (32) = happyShift action_16
action_15 (33) = happyShift action_17
action_15 (36) = happyShift action_18
action_15 (39) = happyShift action_19
action_15 (46) = happyShift action_20
action_15 (47) = happyShift action_21
action_15 (48) = happyShift action_22
action_15 (49) = happyShift action_23
action_15 (57) = happyShift action_24
action_15 (59) = happyShift action_25
action_15 (9) = happyGoto action_48
action_15 (10) = happyGoto action_12
action_15 (14) = happyGoto action_49
action_15 _ = happyReduce_34

action_16 _ = happyReduce_26

action_17 (25) = happyShift action_13
action_17 (26) = happyShift action_14
action_17 (27) = happyShift action_15
action_17 (32) = happyShift action_16
action_17 (33) = happyShift action_17
action_17 (36) = happyShift action_18
action_17 (39) = happyShift action_19
action_17 (41) = happyShift action_45
action_17 (42) = happyShift action_46
action_17 (43) = happyShift action_47
action_17 (46) = happyShift action_20
action_17 (47) = happyShift action_21
action_17 (48) = happyShift action_22
action_17 (49) = happyShift action_23
action_17 (57) = happyShift action_24
action_17 (59) = happyShift action_25
action_17 (9) = happyGoto action_43
action_17 (10) = happyGoto action_12
action_17 (19) = happyGoto action_44
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (26) = happyShift action_42
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (25) = happyShift action_13
action_19 (26) = happyShift action_14
action_19 (27) = happyShift action_15
action_19 (32) = happyShift action_16
action_19 (33) = happyShift action_17
action_19 (36) = happyShift action_18
action_19 (39) = happyShift action_19
action_19 (46) = happyShift action_20
action_19 (47) = happyShift action_21
action_19 (48) = happyShift action_22
action_19 (49) = happyShift action_23
action_19 (57) = happyShift action_24
action_19 (59) = happyShift action_25
action_19 (9) = happyGoto action_41
action_19 (10) = happyGoto action_12
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (61) = happyShift action_40
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (61) = happyShift action_39
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (61) = happyShift action_38
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (61) = happyShift action_37
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (25) = happyShift action_13
action_24 (26) = happyShift action_14
action_24 (27) = happyShift action_15
action_24 (32) = happyShift action_16
action_24 (33) = happyShift action_17
action_24 (36) = happyShift action_18
action_24 (39) = happyShift action_19
action_24 (46) = happyShift action_20
action_24 (47) = happyShift action_21
action_24 (48) = happyShift action_22
action_24 (49) = happyShift action_23
action_24 (57) = happyShift action_24
action_24 (59) = happyShift action_25
action_24 (9) = happyGoto action_36
action_24 (10) = happyGoto action_12
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (28) = happyShift action_35
action_25 (12) = happyGoto action_33
action_25 (13) = happyGoto action_34
action_25 _ = happyReduce_31

action_26 _ = happyReduce_1

action_27 (60) = happyShift action_32
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (26) = happyShift action_29
action_28 (6) = happyGoto action_31
action_28 (7) = happyGoto action_28
action_28 _ = happyReduce_3

action_29 (63) = happyShift action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (29) = happyShift action_95
action_30 (30) = happyShift action_96
action_30 (31) = happyShift action_97
action_30 (32) = happyShift action_98
action_30 (21) = happyGoto action_94
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_4

action_32 _ = happyReduce_2

action_33 (25) = happyShift action_13
action_33 (26) = happyShift action_14
action_33 (27) = happyShift action_15
action_33 (32) = happyShift action_16
action_33 (33) = happyShift action_17
action_33 (36) = happyShift action_18
action_33 (39) = happyShift action_19
action_33 (46) = happyShift action_20
action_33 (47) = happyShift action_21
action_33 (48) = happyShift action_22
action_33 (49) = happyShift action_23
action_33 (57) = happyShift action_24
action_33 (59) = happyShift action_25
action_33 (9) = happyGoto action_92
action_33 (10) = happyGoto action_12
action_33 (11) = happyGoto action_93
action_33 _ = happyReduce_29

action_34 (28) = happyShift action_35
action_34 (12) = happyGoto action_91
action_34 (13) = happyGoto action_34
action_34 _ = happyReduce_31

action_35 (26) = happyShift action_90
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (50) = happyShift action_53
action_36 (51) = happyShift action_54
action_36 (52) = happyShift action_55
action_36 (53) = happyShift action_56
action_36 (54) = happyShift action_57
action_36 (58) = happyShift action_89
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (25) = happyShift action_88
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (25) = happyShift action_87
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (25) = happyShift action_86
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (25) = happyShift action_85
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (40) = happyShift action_84
action_41 (50) = happyShift action_53
action_41 (51) = happyShift action_54
action_41 (52) = happyShift action_55
action_41 (53) = happyShift action_56
action_41 (54) = happyShift action_57
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (55) = happyShift action_83
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (50) = happyShift action_53
action_43 (51) = happyShift action_54
action_43 (52) = happyShift action_55
action_43 (53) = happyShift action_56
action_43 (54) = happyShift action_57
action_43 (55) = happyShift action_73
action_43 (56) = happyShift action_74
action_43 (69) = happyShift action_75
action_43 (70) = happyShift action_76
action_43 (71) = happyShift action_77
action_43 (72) = happyShift action_78
action_43 (73) = happyShift action_79
action_43 (74) = happyShift action_80
action_43 (75) = happyShift action_81
action_43 (76) = happyShift action_82
action_43 (20) = happyGoto action_72
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (34) = happyShift action_69
action_44 (44) = happyShift action_70
action_44 (45) = happyShift action_71
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_46

action_46 _ = happyReduce_47

action_47 (25) = happyShift action_13
action_47 (26) = happyShift action_14
action_47 (27) = happyShift action_15
action_47 (32) = happyShift action_16
action_47 (33) = happyShift action_17
action_47 (36) = happyShift action_18
action_47 (39) = happyShift action_19
action_47 (41) = happyShift action_45
action_47 (42) = happyShift action_46
action_47 (43) = happyShift action_47
action_47 (46) = happyShift action_20
action_47 (47) = happyShift action_21
action_47 (48) = happyShift action_22
action_47 (49) = happyShift action_23
action_47 (57) = happyShift action_24
action_47 (59) = happyShift action_25
action_47 (9) = happyGoto action_43
action_47 (10) = happyGoto action_12
action_47 (19) = happyGoto action_68
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (50) = happyShift action_53
action_48 (51) = happyShift action_54
action_48 (52) = happyShift action_55
action_48 (53) = happyShift action_56
action_48 (54) = happyShift action_57
action_48 (64) = happyShift action_67
action_48 _ = happyReduce_35

action_49 (58) = happyShift action_66
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (25) = happyShift action_13
action_50 (26) = happyShift action_14
action_50 (27) = happyShift action_15
action_50 (32) = happyShift action_16
action_50 (33) = happyShift action_17
action_50 (36) = happyShift action_18
action_50 (39) = happyShift action_19
action_50 (46) = happyShift action_20
action_50 (47) = happyShift action_21
action_50 (48) = happyShift action_22
action_50 (49) = happyShift action_23
action_50 (57) = happyShift action_24
action_50 (59) = happyShift action_25
action_50 (9) = happyGoto action_65
action_50 (10) = happyGoto action_12
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (27) = happyShift action_64
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_13
action_52 (26) = happyShift action_14
action_52 (27) = happyShift action_15
action_52 (32) = happyShift action_16
action_52 (33) = happyShift action_17
action_52 (36) = happyShift action_18
action_52 (39) = happyShift action_19
action_52 (46) = happyShift action_20
action_52 (47) = happyShift action_21
action_52 (48) = happyShift action_22
action_52 (49) = happyShift action_23
action_52 (57) = happyShift action_24
action_52 (59) = happyShift action_25
action_52 (9) = happyGoto action_63
action_52 (10) = happyGoto action_12
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (25) = happyShift action_13
action_53 (26) = happyShift action_14
action_53 (27) = happyShift action_15
action_53 (32) = happyShift action_16
action_53 (33) = happyShift action_17
action_53 (36) = happyShift action_18
action_53 (39) = happyShift action_19
action_53 (46) = happyShift action_20
action_53 (47) = happyShift action_21
action_53 (48) = happyShift action_22
action_53 (49) = happyShift action_23
action_53 (57) = happyShift action_24
action_53 (59) = happyShift action_25
action_53 (9) = happyGoto action_62
action_53 (10) = happyGoto action_12
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (25) = happyShift action_13
action_54 (26) = happyShift action_14
action_54 (27) = happyShift action_15
action_54 (32) = happyShift action_16
action_54 (33) = happyShift action_17
action_54 (36) = happyShift action_18
action_54 (39) = happyShift action_19
action_54 (46) = happyShift action_20
action_54 (47) = happyShift action_21
action_54 (48) = happyShift action_22
action_54 (49) = happyShift action_23
action_54 (57) = happyShift action_24
action_54 (59) = happyShift action_25
action_54 (9) = happyGoto action_61
action_54 (10) = happyGoto action_12
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (25) = happyShift action_13
action_55 (26) = happyShift action_14
action_55 (27) = happyShift action_15
action_55 (32) = happyShift action_16
action_55 (33) = happyShift action_17
action_55 (36) = happyShift action_18
action_55 (39) = happyShift action_19
action_55 (46) = happyShift action_20
action_55 (47) = happyShift action_21
action_55 (48) = happyShift action_22
action_55 (49) = happyShift action_23
action_55 (57) = happyShift action_24
action_55 (59) = happyShift action_25
action_55 (9) = happyGoto action_60
action_55 (10) = happyGoto action_12
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (25) = happyShift action_13
action_56 (26) = happyShift action_14
action_56 (27) = happyShift action_15
action_56 (32) = happyShift action_16
action_56 (33) = happyShift action_17
action_56 (36) = happyShift action_18
action_56 (39) = happyShift action_19
action_56 (46) = happyShift action_20
action_56 (47) = happyShift action_21
action_56 (48) = happyShift action_22
action_56 (49) = happyShift action_23
action_56 (57) = happyShift action_24
action_56 (59) = happyShift action_25
action_56 (9) = happyGoto action_59
action_56 (10) = happyGoto action_12
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (25) = happyShift action_13
action_57 (26) = happyShift action_14
action_57 (27) = happyShift action_15
action_57 (32) = happyShift action_16
action_57 (33) = happyShift action_17
action_57 (36) = happyShift action_18
action_57 (39) = happyShift action_19
action_57 (46) = happyShift action_20
action_57 (47) = happyShift action_21
action_57 (48) = happyShift action_22
action_57 (49) = happyShift action_23
action_57 (57) = happyShift action_24
action_57 (59) = happyShift action_25
action_57 (9) = happyGoto action_58
action_57 (10) = happyGoto action_12
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (53) = happyShift action_56
action_58 _ = happyReduce_22

action_59 _ = happyReduce_23

action_60 (53) = happyShift action_56
action_60 (54) = happyShift action_57
action_60 _ = happyReduce_21

action_61 (52) = happyShift action_55
action_61 (53) = happyShift action_56
action_61 (54) = happyShift action_57
action_61 _ = happyReduce_20

action_62 (52) = happyShift action_55
action_62 (53) = happyShift action_56
action_62 (54) = happyShift action_57
action_62 _ = happyReduce_19

action_63 _ = happyReduce_11

action_64 (25) = happyShift action_13
action_64 (26) = happyShift action_14
action_64 (27) = happyShift action_15
action_64 (32) = happyShift action_16
action_64 (33) = happyShift action_17
action_64 (36) = happyShift action_18
action_64 (39) = happyShift action_19
action_64 (46) = happyShift action_20
action_64 (47) = happyShift action_21
action_64 (48) = happyShift action_22
action_64 (49) = happyShift action_23
action_64 (57) = happyShift action_24
action_64 (59) = happyShift action_25
action_64 (9) = happyGoto action_48
action_64 (10) = happyGoto action_12
action_64 (14) = happyGoto action_118
action_64 _ = happyReduce_34

action_65 (50) = happyShift action_53
action_65 (51) = happyShift action_54
action_65 (52) = happyShift action_55
action_65 (53) = happyShift action_56
action_65 (54) = happyShift action_57
action_65 (62) = happyShift action_117
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_12

action_67 (25) = happyShift action_13
action_67 (26) = happyShift action_14
action_67 (27) = happyShift action_15
action_67 (32) = happyShift action_16
action_67 (33) = happyShift action_17
action_67 (36) = happyShift action_18
action_67 (39) = happyShift action_19
action_67 (46) = happyShift action_20
action_67 (47) = happyShift action_21
action_67 (48) = happyShift action_22
action_67 (49) = happyShift action_23
action_67 (57) = happyShift action_24
action_67 (59) = happyShift action_25
action_67 (9) = happyGoto action_48
action_67 (10) = happyGoto action_12
action_67 (14) = happyGoto action_116
action_67 _ = happyReduce_34

action_68 (44) = happyShift action_70
action_68 (45) = happyShift action_71
action_68 _ = happyReduce_48

action_69 (25) = happyShift action_13
action_69 (26) = happyShift action_14
action_69 (27) = happyShift action_15
action_69 (32) = happyShift action_16
action_69 (33) = happyShift action_17
action_69 (36) = happyShift action_18
action_69 (39) = happyShift action_19
action_69 (46) = happyShift action_20
action_69 (47) = happyShift action_21
action_69 (48) = happyShift action_22
action_69 (49) = happyShift action_23
action_69 (57) = happyShift action_24
action_69 (59) = happyShift action_25
action_69 (9) = happyGoto action_115
action_69 (10) = happyGoto action_12
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (25) = happyShift action_13
action_70 (26) = happyShift action_14
action_70 (27) = happyShift action_15
action_70 (32) = happyShift action_16
action_70 (33) = happyShift action_17
action_70 (36) = happyShift action_18
action_70 (39) = happyShift action_19
action_70 (41) = happyShift action_45
action_70 (42) = happyShift action_46
action_70 (43) = happyShift action_47
action_70 (46) = happyShift action_20
action_70 (47) = happyShift action_21
action_70 (48) = happyShift action_22
action_70 (49) = happyShift action_23
action_70 (57) = happyShift action_24
action_70 (59) = happyShift action_25
action_70 (9) = happyGoto action_43
action_70 (10) = happyGoto action_12
action_70 (19) = happyGoto action_114
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (25) = happyShift action_13
action_71 (26) = happyShift action_14
action_71 (27) = happyShift action_15
action_71 (32) = happyShift action_16
action_71 (33) = happyShift action_17
action_71 (36) = happyShift action_18
action_71 (39) = happyShift action_19
action_71 (41) = happyShift action_45
action_71 (42) = happyShift action_46
action_71 (43) = happyShift action_47
action_71 (46) = happyShift action_20
action_71 (47) = happyShift action_21
action_71 (48) = happyShift action_22
action_71 (49) = happyShift action_23
action_71 (57) = happyShift action_24
action_71 (59) = happyShift action_25
action_71 (9) = happyGoto action_43
action_71 (10) = happyGoto action_12
action_71 (19) = happyGoto action_113
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (25) = happyShift action_13
action_72 (26) = happyShift action_14
action_72 (27) = happyShift action_15
action_72 (32) = happyShift action_16
action_72 (33) = happyShift action_17
action_72 (36) = happyShift action_18
action_72 (39) = happyShift action_19
action_72 (46) = happyShift action_20
action_72 (47) = happyShift action_21
action_72 (48) = happyShift action_22
action_72 (49) = happyShift action_23
action_72 (57) = happyShift action_24
action_72 (59) = happyShift action_25
action_72 (9) = happyGoto action_112
action_72 (10) = happyGoto action_12
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_52

action_74 _ = happyReduce_53

action_75 _ = happyReduce_54

action_76 _ = happyReduce_55

action_77 _ = happyReduce_56

action_78 _ = happyReduce_57

action_79 _ = happyReduce_58

action_80 _ = happyReduce_60

action_81 _ = happyReduce_59

action_82 _ = happyReduce_61

action_83 (25) = happyShift action_13
action_83 (26) = happyShift action_14
action_83 (27) = happyShift action_15
action_83 (32) = happyShift action_16
action_83 (33) = happyShift action_17
action_83 (36) = happyShift action_18
action_83 (39) = happyShift action_19
action_83 (46) = happyShift action_20
action_83 (47) = happyShift action_21
action_83 (48) = happyShift action_22
action_83 (49) = happyShift action_23
action_83 (57) = happyShift action_24
action_83 (59) = happyShift action_25
action_83 (9) = happyGoto action_111
action_83 (10) = happyGoto action_12
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (59) = happyShift action_110
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (64) = happyShift action_109
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (62) = happyShift action_108
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (62) = happyShift action_107
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (62) = happyShift action_106
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_25

action_90 (63) = happyShift action_105
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_32

action_92 (25) = happyShift action_13
action_92 (26) = happyShift action_14
action_92 (27) = happyShift action_15
action_92 (32) = happyShift action_16
action_92 (33) = happyShift action_17
action_92 (36) = happyShift action_18
action_92 (39) = happyShift action_19
action_92 (46) = happyShift action_20
action_92 (47) = happyShift action_21
action_92 (48) = happyShift action_22
action_92 (49) = happyShift action_23
action_92 (50) = happyShift action_53
action_92 (51) = happyShift action_54
action_92 (52) = happyShift action_55
action_92 (53) = happyShift action_56
action_92 (54) = happyShift action_57
action_92 (57) = happyShift action_24
action_92 (59) = happyShift action_25
action_92 (9) = happyGoto action_92
action_92 (10) = happyGoto action_12
action_92 (11) = happyGoto action_104
action_92 _ = happyReduce_29

action_93 (60) = happyShift action_103
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (55) = happyShift action_102
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (61) = happyShift action_101
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (61) = happyShift action_100
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (26) = happyShift action_99
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_65

action_99 _ = happyReduce_64

action_100 (25) = happyShift action_135
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (25) = happyShift action_134
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (25) = happyShift action_13
action_102 (26) = happyShift action_14
action_102 (27) = happyShift action_15
action_102 (32) = happyShift action_16
action_102 (33) = happyShift action_17
action_102 (36) = happyShift action_18
action_102 (39) = happyShift action_19
action_102 (46) = happyShift action_20
action_102 (47) = happyShift action_21
action_102 (48) = happyShift action_22
action_102 (49) = happyShift action_23
action_102 (57) = happyShift action_24
action_102 (59) = happyShift action_25
action_102 (9) = happyGoto action_133
action_102 (10) = happyGoto action_12
action_102 _ = happyFail (happyExpListPerState 102)

action_103 _ = happyReduce_8

action_104 _ = happyReduce_30

action_105 (29) = happyShift action_95
action_105 (30) = happyShift action_96
action_105 (31) = happyShift action_97
action_105 (32) = happyShift action_98
action_105 (21) = happyGoto action_132
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (57) = happyShift action_131
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (57) = happyShift action_130
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (57) = happyShift action_129
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (25) = happyShift action_128
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (25) = happyShift action_125
action_110 (26) = happyShift action_126
action_110 (66) = happyShift action_127
action_110 (15) = happyGoto action_122
action_110 (16) = happyGoto action_123
action_110 (17) = happyGoto action_124
action_110 _ = happyReduce_37

action_111 (37) = happyShift action_121
action_111 (50) = happyShift action_53
action_111 (51) = happyShift action_54
action_111 (52) = happyShift action_55
action_111 (53) = happyShift action_56
action_111 (54) = happyShift action_57
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (50) = happyShift action_53
action_112 (51) = happyShift action_54
action_112 (52) = happyShift action_55
action_112 (53) = happyShift action_56
action_112 (54) = happyShift action_57
action_112 _ = happyReduce_51

action_113 _ = happyReduce_50

action_114 (45) = happyShift action_71
action_114 _ = happyReduce_49

action_115 (35) = happyShift action_120
action_115 (50) = happyShift action_53
action_115 (51) = happyShift action_54
action_115 (52) = happyShift action_55
action_115 (53) = happyShift action_56
action_115 (54) = happyShift action_57
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_36

action_117 _ = happyReduce_28

action_118 (58) = happyShift action_119
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_13

action_120 (25) = happyShift action_13
action_120 (26) = happyShift action_14
action_120 (27) = happyShift action_15
action_120 (32) = happyShift action_16
action_120 (33) = happyShift action_17
action_120 (36) = happyShift action_18
action_120 (39) = happyShift action_19
action_120 (46) = happyShift action_20
action_120 (47) = happyShift action_21
action_120 (48) = happyShift action_22
action_120 (49) = happyShift action_23
action_120 (57) = happyShift action_24
action_120 (59) = happyShift action_25
action_120 (9) = happyGoto action_148
action_120 (10) = happyGoto action_12
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (25) = happyShift action_13
action_121 (26) = happyShift action_14
action_121 (27) = happyShift action_15
action_121 (32) = happyShift action_16
action_121 (33) = happyShift action_17
action_121 (36) = happyShift action_18
action_121 (39) = happyShift action_19
action_121 (46) = happyShift action_20
action_121 (47) = happyShift action_21
action_121 (48) = happyShift action_22
action_121 (49) = happyShift action_23
action_121 (57) = happyShift action_24
action_121 (59) = happyShift action_25
action_121 (9) = happyGoto action_147
action_121 (10) = happyGoto action_12
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (60) = happyShift action_146
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (25) = happyShift action_125
action_123 (26) = happyShift action_126
action_123 (66) = happyShift action_127
action_123 (15) = happyGoto action_145
action_123 (16) = happyGoto action_123
action_123 (17) = happyGoto action_124
action_123 _ = happyReduce_37

action_124 (67) = happyShift action_144
action_124 _ = happyFail (happyExpListPerState 124)

action_125 _ = happyReduce_41

action_126 (57) = happyShift action_143
action_126 _ = happyReduce_42

action_127 _ = happyReduce_40

action_128 (62) = happyShift action_142
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (25) = happyShift action_13
action_129 (26) = happyShift action_14
action_129 (27) = happyShift action_15
action_129 (32) = happyShift action_16
action_129 (33) = happyShift action_17
action_129 (36) = happyShift action_18
action_129 (39) = happyShift action_19
action_129 (46) = happyShift action_20
action_129 (47) = happyShift action_21
action_129 (48) = happyShift action_22
action_129 (49) = happyShift action_23
action_129 (57) = happyShift action_24
action_129 (59) = happyShift action_25
action_129 (9) = happyGoto action_141
action_129 (10) = happyGoto action_12
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (25) = happyShift action_13
action_130 (26) = happyShift action_14
action_130 (27) = happyShift action_15
action_130 (32) = happyShift action_16
action_130 (33) = happyShift action_17
action_130 (36) = happyShift action_18
action_130 (39) = happyShift action_19
action_130 (46) = happyShift action_20
action_130 (47) = happyShift action_21
action_130 (48) = happyShift action_22
action_130 (49) = happyShift action_23
action_130 (57) = happyShift action_24
action_130 (59) = happyShift action_25
action_130 (9) = happyGoto action_140
action_130 (10) = happyGoto action_12
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (25) = happyShift action_13
action_131 (26) = happyShift action_14
action_131 (27) = happyShift action_15
action_131 (32) = happyShift action_16
action_131 (33) = happyShift action_17
action_131 (36) = happyShift action_18
action_131 (39) = happyShift action_19
action_131 (46) = happyShift action_20
action_131 (47) = happyShift action_21
action_131 (48) = happyShift action_22
action_131 (49) = happyShift action_23
action_131 (57) = happyShift action_24
action_131 (59) = happyShift action_25
action_131 (9) = happyGoto action_139
action_131 (10) = happyGoto action_12
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (55) = happyShift action_138
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (50) = happyShift action_53
action_133 (51) = happyShift action_54
action_133 (52) = happyShift action_55
action_133 (53) = happyShift action_56
action_133 (54) = happyShift action_57
action_133 _ = happyReduce_5

action_134 (62) = happyShift action_137
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (64) = happyShift action_136
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (25) = happyShift action_158
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_62

action_138 (25) = happyShift action_13
action_138 (26) = happyShift action_14
action_138 (27) = happyShift action_15
action_138 (32) = happyShift action_16
action_138 (33) = happyShift action_17
action_138 (36) = happyShift action_18
action_138 (39) = happyShift action_19
action_138 (46) = happyShift action_20
action_138 (47) = happyShift action_21
action_138 (48) = happyShift action_22
action_138 (49) = happyShift action_23
action_138 (57) = happyShift action_24
action_138 (59) = happyShift action_25
action_138 (9) = happyGoto action_157
action_138 (10) = happyGoto action_12
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (50) = happyShift action_53
action_139 (51) = happyShift action_54
action_139 (52) = happyShift action_55
action_139 (53) = happyShift action_56
action_139 (54) = happyShift action_57
action_139 (58) = happyShift action_156
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (50) = happyShift action_53
action_140 (51) = happyShift action_54
action_140 (52) = happyShift action_55
action_140 (53) = happyShift action_56
action_140 (54) = happyShift action_57
action_140 (58) = happyShift action_155
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (50) = happyShift action_53
action_141 (51) = happyShift action_54
action_141 (52) = happyShift action_55
action_141 (53) = happyShift action_56
action_141 (54) = happyShift action_57
action_141 (58) = happyShift action_154
action_141 _ = happyFail (happyExpListPerState 141)

action_142 (57) = happyShift action_153
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (25) = happyShift action_125
action_143 (26) = happyShift action_126
action_143 (66) = happyShift action_127
action_143 (17) = happyGoto action_151
action_143 (18) = happyGoto action_152
action_143 _ = happyReduce_44

action_144 (25) = happyShift action_13
action_144 (26) = happyShift action_14
action_144 (27) = happyShift action_15
action_144 (32) = happyShift action_16
action_144 (33) = happyShift action_17
action_144 (36) = happyShift action_18
action_144 (39) = happyShift action_19
action_144 (46) = happyShift action_20
action_144 (47) = happyShift action_21
action_144 (48) = happyShift action_22
action_144 (49) = happyShift action_23
action_144 (57) = happyShift action_24
action_144 (59) = happyShift action_25
action_144 (9) = happyGoto action_150
action_144 (10) = happyGoto action_12
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_38

action_146 _ = happyReduce_14

action_147 (38) = happyShift action_149
action_147 (50) = happyShift action_53
action_147 (51) = happyShift action_54
action_147 (52) = happyShift action_55
action_147 (53) = happyShift action_56
action_147 (54) = happyShift action_57
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (50) = happyShift action_53
action_148 (51) = happyShift action_54
action_148 (52) = happyShift action_55
action_148 (53) = happyShift action_56
action_148 (54) = happyShift action_57
action_148 _ = happyReduce_9

action_149 (25) = happyShift action_13
action_149 (26) = happyShift action_14
action_149 (27) = happyShift action_15
action_149 (32) = happyShift action_16
action_149 (33) = happyShift action_17
action_149 (36) = happyShift action_18
action_149 (39) = happyShift action_19
action_149 (46) = happyShift action_20
action_149 (47) = happyShift action_21
action_149 (48) = happyShift action_22
action_149 (49) = happyShift action_23
action_149 (57) = happyShift action_24
action_149 (59) = happyShift action_25
action_149 (9) = happyGoto action_163
action_149 (10) = happyGoto action_12
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (50) = happyShift action_53
action_150 (51) = happyShift action_54
action_150 (52) = happyShift action_55
action_150 (53) = happyShift action_56
action_150 (54) = happyShift action_57
action_150 _ = happyReduce_39

action_151 (64) = happyShift action_162
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (58) = happyShift action_161
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (25) = happyShift action_13
action_153 (26) = happyShift action_14
action_153 (27) = happyShift action_15
action_153 (32) = happyShift action_16
action_153 (33) = happyShift action_17
action_153 (36) = happyShift action_18
action_153 (39) = happyShift action_19
action_153 (46) = happyShift action_20
action_153 (47) = happyShift action_21
action_153 (48) = happyShift action_22
action_153 (49) = happyShift action_23
action_153 (57) = happyShift action_24
action_153 (59) = happyShift action_25
action_153 (9) = happyGoto action_160
action_153 (10) = happyGoto action_12
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_18

action_155 _ = happyReduce_16

action_156 _ = happyReduce_17

action_157 (50) = happyShift action_53
action_157 (51) = happyShift action_54
action_157 (52) = happyShift action_55
action_157 (53) = happyShift action_56
action_157 (54) = happyShift action_57
action_157 _ = happyReduce_33

action_158 (62) = happyShift action_159
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_63

action_160 (50) = happyShift action_53
action_160 (51) = happyShift action_54
action_160 (52) = happyShift action_55
action_160 (53) = happyShift action_56
action_160 (54) = happyShift action_57
action_160 (58) = happyShift action_165
action_160 _ = happyFail (happyExpListPerState 160)

action_161 _ = happyReduce_43

action_162 (25) = happyShift action_125
action_162 (26) = happyShift action_126
action_162 (66) = happyShift action_127
action_162 (17) = happyGoto action_151
action_162 (18) = happyGoto action_164
action_162 _ = happyReduce_44

action_163 (50) = happyShift action_53
action_163 (51) = happyShift action_54
action_163 (52) = happyShift action_55
action_163 (53) = happyShift action_56
action_163 (54) = happyShift action_57
action_163 _ = happyReduce_10

action_164 _ = happyReduce_45

action_165 _ = happyReduce_15

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mode happy_var_2 happy_var_4 happy_var_5 []
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
happyReduction_5 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (MState happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  8 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  9 happyReduction_7
happyReduction_7 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn9
		 (ExprLit happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 9 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 6 9 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 8 9 happyReduction_10
happyReduction_10 ((HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprFor happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  9 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn14  happy_var_2)
	(HappyTerminal (TokenIdC happy_var_1))
	 =  HappyAbsSyn9
		 (ExprCall happy_var_1 happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 6 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 9 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprUnOp (UnOpTransmute (Just (fromIntegral happy_var_3)) (Just (fromIntegral happy_var_5))) happy_var_8
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 7 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 7 9 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ExprUnOp (UnOpShrink (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  9 happyReduction_24
happyReduction_24 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn9
		 (ExprVar happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  9 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn9
		 (ExprVoid
	)

happyReduce_27 = happySpecReduce_1  10 happyReduction_27
happyReduction_27 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn10
		 (LValId happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 10 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_0  11 happyReduction_29
happyReduction_29  =  HappyAbsSyn11
		 ([]
	)

happyReduce_30 = happySpecReduce_2  11 happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  12 happyReduction_31
happyReduction_31  =  HappyAbsSyn12
		 ([]
	)

happyReduce_32 = happySpecReduce_2  12 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 6 13 happyReduction_33
happyReduction_33 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_0  14 happyReduction_34
happyReduction_34  =  HappyAbsSyn14
		 ([]
	)

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_0  15 happyReduction_37
happyReduction_37  =  HappyAbsSyn15
		 ([]
	)

happyReduce_38 = happySpecReduce_2  15 happyReduction_38
happyReduction_38 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  16 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ((happy_var_1, happy_var_3)
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn17
		 (PatWildcard
	)

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn17
		 (PatLit happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn17
		 (PatData happy_var_1 []
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 17 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_0  18 happyReduction_44
happyReduction_44  =  HappyAbsSyn18
		 ([]
	)

happyReduce_45 = happySpecReduce_3  18 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  19 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn19
		 (PredLit True
	)

happyReduce_47 = happySpecReduce_1  19 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn19
		 (PredLit False
	)

happyReduce_48 = happySpecReduce_2  19 happyReduction_48
happyReduction_48 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  19 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  19 happyReduction_50
happyReduction_50 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  19 happyReduction_51
happyReduction_51 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn19
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 (CompEq
	)

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn20
		 (CompNeq
	)

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn20
		 (CompLe
	)

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn20
		 (CompGe
	)

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn20
		 (CompLeq
	)

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn20
		 (CompGeq
	)

happyReduce_58 = happySpecReduce_1  20 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn20
		 (CompLeS
	)

happyReduce_59 = happySpecReduce_1  20 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn20
		 (CompGeS
	)

happyReduce_60 = happySpecReduce_1  20 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn20
		 (CompLeqS
	)

happyReduce_61 = happySpecReduce_1  20 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn20
		 (CompGeqS
	)

happyReduce_62 = happyReduce 4 21 happyReduction_62
happyReduction_62 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_63 = happyReduce 6 21 happyReduction_63
happyReduction_63 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_64 = happySpecReduce_2  21 happyReduction_64
happyReduction_64 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn21
		 (TypeData happy_var_2
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  21 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn21
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 77 77 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenMode -> cont 22;
	TokenState -> cont 23;
	TokenMain -> cont 24;
	TokenInt happy_dollar_dollar -> cont 25;
	TokenId happy_dollar_dollar -> cont 26;
	TokenIdC happy_dollar_dollar -> cont 27;
	TokenVar -> cont 28;
	TokenBits -> cont 29;
	TokenRange -> cont 30;
	TokenData -> cont 31;
	TokenVoid -> cont 32;
	TokenIf -> cont 33;
	TokenThen -> cont 34;
	TokenElse -> cont 35;
	TokenFor -> cont 36;
	TokenTo -> cont 37;
	TokenDo -> cont 38;
	TokenMatch -> cont 39;
	TokenWith -> cont 40;
	TokenTrue -> cont 41;
	TokenFalse -> cont 42;
	TokenNot -> cont 43;
	TokenAnd -> cont 44;
	TokenOr -> cont 45;
	TokenTransmute -> cont 46;
	TokenShrink -> cont 47;
	TokenExtend -> cont 48;
	TokenSignExtend -> cont 49;
	TokenPlus -> cont 50;
	TokenMinus -> cont 51;
	TokenAmphersand -> cont 52;
	TokenPipe -> cont 53;
	TokenCaret -> cont 54;
	TokenEq -> cont 55;
	TokenNeq -> cont 56;
	TokenLParen -> cont 57;
	TokenRParen -> cont 58;
	TokenLBrace -> cont 59;
	TokenRBrace -> cont 60;
	TokenLBracket -> cont 61;
	TokenRBracket -> cont 62;
	TokenColon -> cont 63;
	TokenComma -> cont 64;
	TokenDot -> cont 65;
	TokenUnderscore -> cont 66;
	TokenRArrow -> cont 67;
	TokenLArrow -> cont 68;
	TokenLe -> cont 69;
	TokenGe -> cont 70;
	TokenLeq -> cont 71;
	TokenGeq -> cont 72;
	TokenLeS -> cont 73;
	TokenLeqS -> cont 74;
	TokenGeS -> cont 75;
	TokenGeqS -> cont 76;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 77 tk tks = happyError' (tks, explist)
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
