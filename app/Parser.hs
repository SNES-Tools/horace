{-# OPTIONS_GHC -w #-}
module Parser where

import AST
import Token
import Type
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,387) ([0,2048,0,0,0,0,32768,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,0,0,0,32,0,0,0,0,0,0,8192,0,0,0,1,0,0,0,0,4,0,0,0,0,50048,61476,640,0,0,0,0,496,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,34816,0,0,14336,588,10255,0,0,0,0,0,0,0,0,19512,3898,40,0,0,256,0,0,0,0,14336,588,10255,0,0,0,0,0,8,0,0,0,0,128,0,0,0,0,2048,0,0,0,0,32768,0,0,32768,9411,33008,2,0,0,64,0,0,0,0,0,0,1024,0,0,0,0,8192,0,0,0,0,0,4,0,0,16,0,0,0,0,0,0,8192,0,0,32768,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,768,0,0,0,0,0,0,0,0,0,32768,9411,33008,2,0,0,64,0,0,0,0,256,0,0,0,0,0,0,4592,0,0,32768,0,0,0,0,0,8,0,0,0,0,128,0,0,0,0,2048,0,0,0,0,0,16384,7936,0,0,0,0,0,2,0,0,0,0,127,2040,0,0,49168,0,0,0,0,0,0,0,0,0,0,0,0,0,0,50048,62372,640,0,0,0,0,496,4,0,0,0,0,1,0,0,19512,3842,40,0,0,512,0,0,0,0,14336,588,10255,0,0,32768,9411,33008,2,0,0,19512,3842,40,0,0,50048,61476,640,0,0,14336,588,10255,0,0,32768,9411,33008,2,0,0,0,28672,0,0,0,0,0,23,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,14336,588,10255,0,0,0,0,7936,16,0,0,0,0,0,0,0,50048,61476,640,0,0,0,0,0,0,0,32768,9411,33008,2,0,0,19512,3898,40,0,0,50048,62372,640,0,0,14336,588,10255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,50048,61476,640,0,0,0,0,8192,0,0,0,0,0,64,0,0,0,0,256,0,0,0,0,4096,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,14336,588,10751,0,0,0,0,0,4,0,0,0,0,64,0,0,768,0,0,0,0,0,0,2048,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,8,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,8,0,0,0,0,50048,61476,640,0,0,0,0,4096,0,0,0,0,0,64,0,0,0,0,512,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,7,0,0,0,0,0,32768,0,0,0,0,0,8,0,0,0,0,128,0,0,2048,0,0,0,0,32768,1,0,256,0,0,32768,61440,1,0,0,0,0,31,0,0,0,16384,0,0,0,0,0,0,0,0,0,8192,61440,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,50048,61476,640,0,0,14336,588,10255,0,0,0,0,0,4,0,0,24,0,4096,0,0,0,0,0,2,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,4096,0,0,14336,588,10255,0,0,32768,9411,33008,2,0,0,19512,3842,40,0,0,0,0,32,0,0,0,0,4096,0,0,0,120,0,0,0,0,16,0,0,0,0,0,0,8192,0,0,0,0,496,0,0,0,0,0,16,0,0,0,0,1024,0,0,128,0,0,0,0,0,0,0,0,0,0,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,32768,9411,33008,2,0,0,0,61440,17,0,0,0,0,287,0,0,0,0,4592,0,0,0,0,32768,0,0,0,24,0,4096,0,0,50048,61476,640,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61441,1,0,0,0,0,0,0,0,14336,588,10255,0,0,0,0,7936,0,0,0,0,0,1024,0,0,0,0,256,0,0,14336,588,10255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,0,0,0,120,0,0,0,0,19512,3842,40,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,7936,0,0,0,19512,3842,40,0,0,0,0,287,0,0,0,0,0,0,0,32768,1,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7936,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","state_decl","state_vars","state_var","main_decl","func_decl","func_list","func","params","param","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_state","type_reg","mode","state","main","funcs","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 84
        bit_end = (st Prelude.+ 1) Prelude.* 84
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..83]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (28) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (28) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (33) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (84) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (66) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (29) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (30) = happyShift action_10
action_6 (8) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (66) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (33) = happyShift action_30
action_8 (6) = happyGoto action_28
action_8 (7) = happyGoto action_29
action_8 _ = happyReduce_3

action_9 (31) = happyShift action_27
action_9 (9) = happyGoto action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (32) = happyShift action_13
action_10 (33) = happyShift action_14
action_10 (34) = happyShift action_15
action_10 (39) = happyShift action_16
action_10 (40) = happyShift action_17
action_10 (43) = happyShift action_18
action_10 (46) = happyShift action_19
action_10 (53) = happyShift action_20
action_10 (54) = happyShift action_21
action_10 (55) = happyShift action_22
action_10 (56) = happyShift action_23
action_10 (64) = happyShift action_24
action_10 (66) = happyShift action_25
action_10 (14) = happyGoto action_11
action_10 (15) = happyGoto action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (57) = happyShift action_56
action_11 (58) = happyShift action_57
action_11 (59) = happyShift action_58
action_11 (60) = happyShift action_59
action_11 (61) = happyShift action_60
action_11 _ = happyReduce_6

action_12 (75) = happyShift action_55
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_16

action_14 (68) = happyShift action_53
action_14 (72) = happyShift action_54
action_14 (75) = happyReduce_36
action_14 _ = happyReduce_33

action_15 (32) = happyShift action_13
action_15 (33) = happyShift action_14
action_15 (34) = happyShift action_15
action_15 (39) = happyShift action_16
action_15 (40) = happyShift action_17
action_15 (43) = happyShift action_18
action_15 (46) = happyShift action_19
action_15 (53) = happyShift action_20
action_15 (54) = happyShift action_21
action_15 (55) = happyShift action_22
action_15 (56) = happyShift action_23
action_15 (64) = happyShift action_24
action_15 (66) = happyShift action_25
action_15 (14) = happyGoto action_51
action_15 (15) = happyGoto action_12
action_15 (19) = happyGoto action_52
action_15 _ = happyReduce_43

action_16 _ = happyReduce_35

action_17 (32) = happyShift action_13
action_17 (33) = happyShift action_14
action_17 (34) = happyShift action_15
action_17 (39) = happyShift action_16
action_17 (40) = happyShift action_17
action_17 (43) = happyShift action_18
action_17 (46) = happyShift action_19
action_17 (48) = happyShift action_48
action_17 (49) = happyShift action_49
action_17 (50) = happyShift action_50
action_17 (53) = happyShift action_20
action_17 (54) = happyShift action_21
action_17 (55) = happyShift action_22
action_17 (56) = happyShift action_23
action_17 (64) = happyShift action_24
action_17 (66) = happyShift action_25
action_17 (14) = happyGoto action_46
action_17 (15) = happyGoto action_12
action_17 (24) = happyGoto action_47
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (33) = happyShift action_45
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (32) = happyShift action_13
action_19 (33) = happyShift action_14
action_19 (34) = happyShift action_15
action_19 (39) = happyShift action_16
action_19 (40) = happyShift action_17
action_19 (43) = happyShift action_18
action_19 (46) = happyShift action_19
action_19 (53) = happyShift action_20
action_19 (54) = happyShift action_21
action_19 (55) = happyShift action_22
action_19 (56) = happyShift action_23
action_19 (64) = happyShift action_24
action_19 (66) = happyShift action_25
action_19 (14) = happyGoto action_44
action_19 (15) = happyGoto action_12
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (68) = happyShift action_43
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (68) = happyShift action_42
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (68) = happyShift action_41
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (68) = happyShift action_40
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyShift action_13
action_24 (33) = happyShift action_14
action_24 (34) = happyShift action_15
action_24 (39) = happyShift action_16
action_24 (40) = happyShift action_17
action_24 (43) = happyShift action_18
action_24 (46) = happyShift action_19
action_24 (53) = happyShift action_20
action_24 (54) = happyShift action_21
action_24 (55) = happyShift action_22
action_24 (56) = happyShift action_23
action_24 (64) = happyShift action_24
action_24 (66) = happyShift action_25
action_24 (14) = happyGoto action_39
action_24 (15) = happyGoto action_12
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (35) = happyShift action_38
action_25 (17) = happyGoto action_36
action_25 (18) = happyGoto action_37
action_25 _ = happyReduce_40

action_26 (67) = happyShift action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (66) = happyShift action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (67) = happyShift action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (33) = happyShift action_30
action_29 (6) = happyGoto action_32
action_29 (7) = happyGoto action_29
action_29 _ = happyReduce_3

action_30 (70) = happyShift action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (36) = happyShift action_103
action_31 (37) = happyShift action_104
action_31 (38) = happyShift action_105
action_31 (39) = happyShift action_106
action_31 (26) = happyGoto action_101
action_31 (27) = happyGoto action_102
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_4

action_33 _ = happyReduce_2

action_34 (33) = happyShift action_99
action_34 (34) = happyShift action_100
action_34 (10) = happyGoto action_97
action_34 (11) = happyGoto action_98
action_34 _ = happyReduce_8

action_35 _ = happyReduce_1

action_36 (32) = happyShift action_13
action_36 (33) = happyShift action_14
action_36 (34) = happyShift action_15
action_36 (39) = happyShift action_16
action_36 (40) = happyShift action_17
action_36 (43) = happyShift action_18
action_36 (46) = happyShift action_19
action_36 (53) = happyShift action_20
action_36 (54) = happyShift action_21
action_36 (55) = happyShift action_22
action_36 (56) = happyShift action_23
action_36 (64) = happyShift action_24
action_36 (66) = happyShift action_25
action_36 (14) = happyGoto action_95
action_36 (15) = happyGoto action_12
action_36 (16) = happyGoto action_96
action_36 _ = happyReduce_38

action_37 (35) = happyShift action_38
action_37 (17) = happyGoto action_94
action_37 (18) = happyGoto action_37
action_37 _ = happyReduce_40

action_38 (33) = happyShift action_93
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (57) = happyShift action_56
action_39 (58) = happyShift action_57
action_39 (59) = happyShift action_58
action_39 (60) = happyShift action_59
action_39 (61) = happyShift action_60
action_39 (65) = happyShift action_92
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (32) = happyShift action_91
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (32) = happyShift action_90
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (32) = happyShift action_89
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (32) = happyShift action_88
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (47) = happyShift action_87
action_44 (57) = happyShift action_56
action_44 (58) = happyShift action_57
action_44 (59) = happyShift action_58
action_44 (60) = happyShift action_59
action_44 (61) = happyShift action_60
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (62) = happyShift action_86
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (57) = happyShift action_56
action_46 (58) = happyShift action_57
action_46 (59) = happyShift action_58
action_46 (60) = happyShift action_59
action_46 (61) = happyShift action_60
action_46 (62) = happyShift action_76
action_46 (63) = happyShift action_77
action_46 (76) = happyShift action_78
action_46 (77) = happyShift action_79
action_46 (78) = happyShift action_80
action_46 (79) = happyShift action_81
action_46 (80) = happyShift action_82
action_46 (81) = happyShift action_83
action_46 (82) = happyShift action_84
action_46 (83) = happyShift action_85
action_46 (25) = happyGoto action_75
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (41) = happyShift action_72
action_47 (51) = happyShift action_73
action_47 (52) = happyShift action_74
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_55

action_49 _ = happyReduce_56

action_50 (32) = happyShift action_13
action_50 (33) = happyShift action_14
action_50 (34) = happyShift action_15
action_50 (39) = happyShift action_16
action_50 (40) = happyShift action_17
action_50 (43) = happyShift action_18
action_50 (46) = happyShift action_19
action_50 (48) = happyShift action_48
action_50 (49) = happyShift action_49
action_50 (50) = happyShift action_50
action_50 (53) = happyShift action_20
action_50 (54) = happyShift action_21
action_50 (55) = happyShift action_22
action_50 (56) = happyShift action_23
action_50 (64) = happyShift action_24
action_50 (66) = happyShift action_25
action_50 (14) = happyGoto action_46
action_50 (15) = happyGoto action_12
action_50 (24) = happyGoto action_71
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (57) = happyShift action_56
action_51 (58) = happyShift action_57
action_51 (59) = happyShift action_58
action_51 (60) = happyShift action_59
action_51 (61) = happyShift action_60
action_51 (71) = happyShift action_70
action_51 _ = happyReduce_44

action_52 (65) = happyShift action_69
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (32) = happyShift action_13
action_53 (33) = happyShift action_14
action_53 (34) = happyShift action_15
action_53 (39) = happyShift action_16
action_53 (40) = happyShift action_17
action_53 (43) = happyShift action_18
action_53 (46) = happyShift action_19
action_53 (53) = happyShift action_20
action_53 (54) = happyShift action_21
action_53 (55) = happyShift action_22
action_53 (56) = happyShift action_23
action_53 (64) = happyShift action_24
action_53 (66) = happyShift action_25
action_53 (14) = happyGoto action_68
action_53 (15) = happyGoto action_12
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (34) = happyShift action_67
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (32) = happyShift action_13
action_55 (33) = happyShift action_14
action_55 (34) = happyShift action_15
action_55 (39) = happyShift action_16
action_55 (40) = happyShift action_17
action_55 (43) = happyShift action_18
action_55 (46) = happyShift action_19
action_55 (53) = happyShift action_20
action_55 (54) = happyShift action_21
action_55 (55) = happyShift action_22
action_55 (56) = happyShift action_23
action_55 (64) = happyShift action_24
action_55 (66) = happyShift action_25
action_55 (14) = happyGoto action_66
action_55 (15) = happyGoto action_12
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (32) = happyShift action_13
action_56 (33) = happyShift action_14
action_56 (34) = happyShift action_15
action_56 (39) = happyShift action_16
action_56 (40) = happyShift action_17
action_56 (43) = happyShift action_18
action_56 (46) = happyShift action_19
action_56 (53) = happyShift action_20
action_56 (54) = happyShift action_21
action_56 (55) = happyShift action_22
action_56 (56) = happyShift action_23
action_56 (64) = happyShift action_24
action_56 (66) = happyShift action_25
action_56 (14) = happyGoto action_65
action_56 (15) = happyGoto action_12
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (32) = happyShift action_13
action_57 (33) = happyShift action_14
action_57 (34) = happyShift action_15
action_57 (39) = happyShift action_16
action_57 (40) = happyShift action_17
action_57 (43) = happyShift action_18
action_57 (46) = happyShift action_19
action_57 (53) = happyShift action_20
action_57 (54) = happyShift action_21
action_57 (55) = happyShift action_22
action_57 (56) = happyShift action_23
action_57 (64) = happyShift action_24
action_57 (66) = happyShift action_25
action_57 (14) = happyGoto action_64
action_57 (15) = happyGoto action_12
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (32) = happyShift action_13
action_58 (33) = happyShift action_14
action_58 (34) = happyShift action_15
action_58 (39) = happyShift action_16
action_58 (40) = happyShift action_17
action_58 (43) = happyShift action_18
action_58 (46) = happyShift action_19
action_58 (53) = happyShift action_20
action_58 (54) = happyShift action_21
action_58 (55) = happyShift action_22
action_58 (56) = happyShift action_23
action_58 (64) = happyShift action_24
action_58 (66) = happyShift action_25
action_58 (14) = happyGoto action_63
action_58 (15) = happyGoto action_12
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (32) = happyShift action_13
action_59 (33) = happyShift action_14
action_59 (34) = happyShift action_15
action_59 (39) = happyShift action_16
action_59 (40) = happyShift action_17
action_59 (43) = happyShift action_18
action_59 (46) = happyShift action_19
action_59 (53) = happyShift action_20
action_59 (54) = happyShift action_21
action_59 (55) = happyShift action_22
action_59 (56) = happyShift action_23
action_59 (64) = happyShift action_24
action_59 (66) = happyShift action_25
action_59 (14) = happyGoto action_62
action_59 (15) = happyGoto action_12
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (32) = happyShift action_13
action_60 (33) = happyShift action_14
action_60 (34) = happyShift action_15
action_60 (39) = happyShift action_16
action_60 (40) = happyShift action_17
action_60 (43) = happyShift action_18
action_60 (46) = happyShift action_19
action_60 (53) = happyShift action_20
action_60 (54) = happyShift action_21
action_60 (55) = happyShift action_22
action_60 (56) = happyShift action_23
action_60 (64) = happyShift action_24
action_60 (66) = happyShift action_25
action_60 (14) = happyGoto action_61
action_60 (15) = happyGoto action_12
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (57) = happyShift action_56
action_61 (58) = happyShift action_57
action_61 (59) = happyShift action_58
action_61 _ = happyReduce_31

action_62 (57) = happyShift action_56
action_62 (58) = happyShift action_57
action_62 (59) = happyShift action_58
action_62 (61) = happyShift action_60
action_62 _ = happyReduce_32

action_63 (57) = happyShift action_56
action_63 (58) = happyShift action_57
action_63 _ = happyReduce_30

action_64 _ = happyReduce_29

action_65 _ = happyReduce_28

action_66 (57) = happyShift action_56
action_66 (58) = happyShift action_57
action_66 (59) = happyShift action_58
action_66 (60) = happyShift action_59
action_66 (61) = happyShift action_60
action_66 _ = happyReduce_20

action_67 (32) = happyShift action_13
action_67 (33) = happyShift action_14
action_67 (34) = happyShift action_15
action_67 (39) = happyShift action_16
action_67 (40) = happyShift action_17
action_67 (43) = happyShift action_18
action_67 (46) = happyShift action_19
action_67 (53) = happyShift action_20
action_67 (54) = happyShift action_21
action_67 (55) = happyShift action_22
action_67 (56) = happyShift action_23
action_67 (64) = happyShift action_24
action_67 (66) = happyShift action_25
action_67 (14) = happyGoto action_51
action_67 (15) = happyGoto action_12
action_67 (19) = happyGoto action_132
action_67 _ = happyReduce_43

action_68 (57) = happyShift action_56
action_68 (58) = happyShift action_57
action_68 (59) = happyShift action_58
action_68 (60) = happyShift action_59
action_68 (61) = happyShift action_60
action_68 (69) = happyShift action_131
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_21

action_70 (32) = happyShift action_13
action_70 (33) = happyShift action_14
action_70 (34) = happyShift action_15
action_70 (39) = happyShift action_16
action_70 (40) = happyShift action_17
action_70 (43) = happyShift action_18
action_70 (46) = happyShift action_19
action_70 (53) = happyShift action_20
action_70 (54) = happyShift action_21
action_70 (55) = happyShift action_22
action_70 (56) = happyShift action_23
action_70 (64) = happyShift action_24
action_70 (66) = happyShift action_25
action_70 (14) = happyGoto action_51
action_70 (15) = happyGoto action_12
action_70 (19) = happyGoto action_130
action_70 _ = happyReduce_43

action_71 _ = happyReduce_57

action_72 (32) = happyShift action_13
action_72 (33) = happyShift action_14
action_72 (34) = happyShift action_15
action_72 (39) = happyShift action_16
action_72 (40) = happyShift action_17
action_72 (43) = happyShift action_18
action_72 (46) = happyShift action_19
action_72 (53) = happyShift action_20
action_72 (54) = happyShift action_21
action_72 (55) = happyShift action_22
action_72 (56) = happyShift action_23
action_72 (64) = happyShift action_24
action_72 (66) = happyShift action_25
action_72 (14) = happyGoto action_129
action_72 (15) = happyGoto action_12
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (32) = happyShift action_13
action_73 (33) = happyShift action_14
action_73 (34) = happyShift action_15
action_73 (39) = happyShift action_16
action_73 (40) = happyShift action_17
action_73 (43) = happyShift action_18
action_73 (46) = happyShift action_19
action_73 (48) = happyShift action_48
action_73 (49) = happyShift action_49
action_73 (50) = happyShift action_50
action_73 (53) = happyShift action_20
action_73 (54) = happyShift action_21
action_73 (55) = happyShift action_22
action_73 (56) = happyShift action_23
action_73 (64) = happyShift action_24
action_73 (66) = happyShift action_25
action_73 (14) = happyGoto action_46
action_73 (15) = happyGoto action_12
action_73 (24) = happyGoto action_128
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (32) = happyShift action_13
action_74 (33) = happyShift action_14
action_74 (34) = happyShift action_15
action_74 (39) = happyShift action_16
action_74 (40) = happyShift action_17
action_74 (43) = happyShift action_18
action_74 (46) = happyShift action_19
action_74 (48) = happyShift action_48
action_74 (49) = happyShift action_49
action_74 (50) = happyShift action_50
action_74 (53) = happyShift action_20
action_74 (54) = happyShift action_21
action_74 (55) = happyShift action_22
action_74 (56) = happyShift action_23
action_74 (64) = happyShift action_24
action_74 (66) = happyShift action_25
action_74 (14) = happyGoto action_46
action_74 (15) = happyGoto action_12
action_74 (24) = happyGoto action_127
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (32) = happyShift action_13
action_75 (33) = happyShift action_14
action_75 (34) = happyShift action_15
action_75 (39) = happyShift action_16
action_75 (40) = happyShift action_17
action_75 (43) = happyShift action_18
action_75 (46) = happyShift action_19
action_75 (53) = happyShift action_20
action_75 (54) = happyShift action_21
action_75 (55) = happyShift action_22
action_75 (56) = happyShift action_23
action_75 (64) = happyShift action_24
action_75 (66) = happyShift action_25
action_75 (14) = happyGoto action_126
action_75 (15) = happyGoto action_12
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_61

action_77 _ = happyReduce_62

action_78 _ = happyReduce_63

action_79 _ = happyReduce_64

action_80 _ = happyReduce_65

action_81 _ = happyReduce_66

action_82 _ = happyReduce_67

action_83 _ = happyReduce_69

action_84 _ = happyReduce_68

action_85 _ = happyReduce_70

action_86 (32) = happyShift action_13
action_86 (33) = happyShift action_14
action_86 (34) = happyShift action_15
action_86 (39) = happyShift action_16
action_86 (40) = happyShift action_17
action_86 (43) = happyShift action_18
action_86 (46) = happyShift action_19
action_86 (53) = happyShift action_20
action_86 (54) = happyShift action_21
action_86 (55) = happyShift action_22
action_86 (56) = happyShift action_23
action_86 (64) = happyShift action_24
action_86 (66) = happyShift action_25
action_86 (14) = happyGoto action_125
action_86 (15) = happyGoto action_12
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (66) = happyShift action_124
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (71) = happyShift action_123
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (69) = happyShift action_122
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (69) = happyShift action_121
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (69) = happyShift action_120
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_34

action_93 (70) = happyShift action_119
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_41

action_95 (32) = happyShift action_13
action_95 (33) = happyShift action_14
action_95 (34) = happyShift action_15
action_95 (39) = happyShift action_16
action_95 (40) = happyShift action_17
action_95 (43) = happyShift action_18
action_95 (46) = happyShift action_19
action_95 (53) = happyShift action_20
action_95 (54) = happyShift action_21
action_95 (55) = happyShift action_22
action_95 (56) = happyShift action_23
action_95 (57) = happyShift action_56
action_95 (58) = happyShift action_57
action_95 (59) = happyShift action_58
action_95 (60) = happyShift action_59
action_95 (61) = happyShift action_60
action_95 (64) = happyShift action_24
action_95 (66) = happyShift action_25
action_95 (14) = happyGoto action_95
action_95 (15) = happyGoto action_12
action_95 (16) = happyGoto action_118
action_95 _ = happyReduce_38

action_96 (67) = happyShift action_117
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (67) = happyShift action_116
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (33) = happyShift action_99
action_98 (34) = happyShift action_100
action_98 (10) = happyGoto action_115
action_98 (11) = happyGoto action_98
action_98 _ = happyReduce_8

action_99 (64) = happyShift action_114
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (33) = happyShift action_113
action_100 (12) = happyGoto action_111
action_100 (13) = happyGoto action_112
action_100 _ = happyReduce_12

action_101 (62) = happyShift action_110
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_71

action_103 (68) = happyShift action_109
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (68) = happyShift action_108
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (33) = happyShift action_107
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_75

action_107 _ = happyReduce_74

action_108 (32) = happyShift action_153
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (32) = happyShift action_152
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (32) = happyShift action_13
action_110 (33) = happyShift action_14
action_110 (34) = happyShift action_15
action_110 (39) = happyShift action_16
action_110 (40) = happyShift action_17
action_110 (43) = happyShift action_18
action_110 (46) = happyShift action_19
action_110 (53) = happyShift action_20
action_110 (54) = happyShift action_21
action_110 (55) = happyShift action_22
action_110 (56) = happyShift action_23
action_110 (64) = happyShift action_24
action_110 (66) = happyShift action_25
action_110 (14) = happyGoto action_151
action_110 (15) = happyGoto action_12
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (65) = happyShift action_150
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (71) = happyShift action_149
action_112 _ = happyReduce_13

action_113 (70) = happyShift action_148
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (33) = happyShift action_113
action_114 (12) = happyGoto action_147
action_114 (13) = happyGoto action_112
action_114 _ = happyReduce_12

action_115 _ = happyReduce_9

action_116 _ = happyReduce_7

action_117 _ = happyReduce_17

action_118 _ = happyReduce_39

action_119 (36) = happyShift action_103
action_119 (37) = happyShift action_104
action_119 (38) = happyShift action_105
action_119 (39) = happyShift action_106
action_119 (27) = happyGoto action_146
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (64) = happyShift action_145
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (64) = happyShift action_144
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (64) = happyShift action_143
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (32) = happyShift action_142
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (32) = happyShift action_139
action_124 (33) = happyShift action_140
action_124 (73) = happyShift action_141
action_124 (20) = happyGoto action_136
action_124 (21) = happyGoto action_137
action_124 (22) = happyGoto action_138
action_124 _ = happyReduce_46

action_125 (44) = happyShift action_135
action_125 (57) = happyShift action_56
action_125 (58) = happyShift action_57
action_125 (59) = happyShift action_58
action_125 (60) = happyShift action_59
action_125 (61) = happyShift action_60
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (57) = happyShift action_56
action_126 (58) = happyShift action_57
action_126 (59) = happyShift action_58
action_126 (60) = happyShift action_59
action_126 (61) = happyShift action_60
action_126 _ = happyReduce_60

action_127 (51) = happyShift action_73
action_127 _ = happyReduce_59

action_128 _ = happyReduce_58

action_129 (42) = happyShift action_134
action_129 (57) = happyShift action_56
action_129 (58) = happyShift action_57
action_129 (59) = happyShift action_58
action_129 (60) = happyShift action_59
action_129 (61) = happyShift action_60
action_129 _ = happyFail (happyExpListPerState 129)

action_130 _ = happyReduce_45

action_131 _ = happyReduce_37

action_132 (65) = happyShift action_133
action_132 _ = happyFail (happyExpListPerState 132)

action_133 _ = happyReduce_22

action_134 (32) = happyShift action_13
action_134 (33) = happyShift action_14
action_134 (34) = happyShift action_15
action_134 (39) = happyShift action_16
action_134 (40) = happyShift action_17
action_134 (43) = happyShift action_18
action_134 (46) = happyShift action_19
action_134 (53) = happyShift action_20
action_134 (54) = happyShift action_21
action_134 (55) = happyShift action_22
action_134 (56) = happyShift action_23
action_134 (64) = happyShift action_24
action_134 (66) = happyShift action_25
action_134 (14) = happyGoto action_170
action_134 (15) = happyGoto action_12
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (32) = happyShift action_13
action_135 (33) = happyShift action_14
action_135 (34) = happyShift action_15
action_135 (39) = happyShift action_16
action_135 (40) = happyShift action_17
action_135 (43) = happyShift action_18
action_135 (46) = happyShift action_19
action_135 (53) = happyShift action_20
action_135 (54) = happyShift action_21
action_135 (55) = happyShift action_22
action_135 (56) = happyShift action_23
action_135 (64) = happyShift action_24
action_135 (66) = happyShift action_25
action_135 (14) = happyGoto action_169
action_135 (15) = happyGoto action_12
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (67) = happyShift action_168
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (32) = happyShift action_139
action_137 (33) = happyShift action_140
action_137 (73) = happyShift action_141
action_137 (20) = happyGoto action_167
action_137 (21) = happyGoto action_137
action_137 (22) = happyGoto action_138
action_137 _ = happyReduce_46

action_138 (74) = happyShift action_166
action_138 _ = happyFail (happyExpListPerState 138)

action_139 _ = happyReduce_50

action_140 (64) = happyShift action_165
action_140 _ = happyReduce_51

action_141 _ = happyReduce_49

action_142 (69) = happyShift action_164
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (32) = happyShift action_13
action_143 (33) = happyShift action_14
action_143 (34) = happyShift action_15
action_143 (39) = happyShift action_16
action_143 (40) = happyShift action_17
action_143 (43) = happyShift action_18
action_143 (46) = happyShift action_19
action_143 (53) = happyShift action_20
action_143 (54) = happyShift action_21
action_143 (55) = happyShift action_22
action_143 (56) = happyShift action_23
action_143 (64) = happyShift action_24
action_143 (66) = happyShift action_25
action_143 (14) = happyGoto action_163
action_143 (15) = happyGoto action_12
action_143 _ = happyFail (happyExpListPerState 143)

action_144 (32) = happyShift action_13
action_144 (33) = happyShift action_14
action_144 (34) = happyShift action_15
action_144 (39) = happyShift action_16
action_144 (40) = happyShift action_17
action_144 (43) = happyShift action_18
action_144 (46) = happyShift action_19
action_144 (53) = happyShift action_20
action_144 (54) = happyShift action_21
action_144 (55) = happyShift action_22
action_144 (56) = happyShift action_23
action_144 (64) = happyShift action_24
action_144 (66) = happyShift action_25
action_144 (14) = happyGoto action_162
action_144 (15) = happyGoto action_12
action_144 _ = happyFail (happyExpListPerState 144)

action_145 (32) = happyShift action_13
action_145 (33) = happyShift action_14
action_145 (34) = happyShift action_15
action_145 (39) = happyShift action_16
action_145 (40) = happyShift action_17
action_145 (43) = happyShift action_18
action_145 (46) = happyShift action_19
action_145 (53) = happyShift action_20
action_145 (54) = happyShift action_21
action_145 (55) = happyShift action_22
action_145 (56) = happyShift action_23
action_145 (64) = happyShift action_24
action_145 (66) = happyShift action_25
action_145 (14) = happyGoto action_161
action_145 (15) = happyGoto action_12
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (62) = happyShift action_160
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (65) = happyShift action_159
action_147 _ = happyFail (happyExpListPerState 147)

action_148 (36) = happyShift action_103
action_148 (37) = happyShift action_104
action_148 (38) = happyShift action_105
action_148 (39) = happyShift action_106
action_148 (27) = happyGoto action_158
action_148 _ = happyFail (happyExpListPerState 148)

action_149 (33) = happyShift action_113
action_149 (12) = happyGoto action_157
action_149 (13) = happyGoto action_112
action_149 _ = happyReduce_12

action_150 (70) = happyShift action_156
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (57) = happyShift action_56
action_151 (58) = happyShift action_57
action_151 (59) = happyShift action_58
action_151 (60) = happyShift action_59
action_151 (61) = happyShift action_60
action_151 _ = happyReduce_5

action_152 (69) = happyShift action_155
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (71) = happyShift action_154
action_153 _ = happyFail (happyExpListPerState 153)

action_154 (32) = happyShift action_182
action_154 _ = happyFail (happyExpListPerState 154)

action_155 _ = happyReduce_72

action_156 (36) = happyShift action_103
action_156 (37) = happyShift action_104
action_156 (38) = happyShift action_105
action_156 (39) = happyShift action_106
action_156 (27) = happyGoto action_181
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_14

action_158 _ = happyReduce_15

action_159 (70) = happyShift action_180
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (32) = happyShift action_13
action_160 (33) = happyShift action_14
action_160 (34) = happyShift action_15
action_160 (39) = happyShift action_16
action_160 (40) = happyShift action_17
action_160 (43) = happyShift action_18
action_160 (46) = happyShift action_19
action_160 (53) = happyShift action_20
action_160 (54) = happyShift action_21
action_160 (55) = happyShift action_22
action_160 (56) = happyShift action_23
action_160 (64) = happyShift action_24
action_160 (66) = happyShift action_25
action_160 (14) = happyGoto action_179
action_160 (15) = happyGoto action_12
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (57) = happyShift action_56
action_161 (58) = happyShift action_57
action_161 (59) = happyShift action_58
action_161 (60) = happyShift action_59
action_161 (61) = happyShift action_60
action_161 (65) = happyShift action_178
action_161 _ = happyFail (happyExpListPerState 161)

action_162 (57) = happyShift action_56
action_162 (58) = happyShift action_57
action_162 (59) = happyShift action_58
action_162 (60) = happyShift action_59
action_162 (61) = happyShift action_60
action_162 (65) = happyShift action_177
action_162 _ = happyFail (happyExpListPerState 162)

action_163 (57) = happyShift action_56
action_163 (58) = happyShift action_57
action_163 (59) = happyShift action_58
action_163 (60) = happyShift action_59
action_163 (61) = happyShift action_60
action_163 (65) = happyShift action_176
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (64) = happyShift action_175
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (32) = happyShift action_139
action_165 (33) = happyShift action_140
action_165 (73) = happyShift action_141
action_165 (22) = happyGoto action_173
action_165 (23) = happyGoto action_174
action_165 _ = happyReduce_53

action_166 (32) = happyShift action_13
action_166 (33) = happyShift action_14
action_166 (34) = happyShift action_15
action_166 (39) = happyShift action_16
action_166 (40) = happyShift action_17
action_166 (43) = happyShift action_18
action_166 (46) = happyShift action_19
action_166 (53) = happyShift action_20
action_166 (54) = happyShift action_21
action_166 (55) = happyShift action_22
action_166 (56) = happyShift action_23
action_166 (64) = happyShift action_24
action_166 (66) = happyShift action_25
action_166 (14) = happyGoto action_172
action_166 (15) = happyGoto action_12
action_166 _ = happyFail (happyExpListPerState 166)

action_167 _ = happyReduce_47

action_168 _ = happyReduce_23

action_169 (45) = happyShift action_171
action_169 (57) = happyShift action_56
action_169 (58) = happyShift action_57
action_169 (59) = happyShift action_58
action_169 (60) = happyShift action_59
action_169 (61) = happyShift action_60
action_169 _ = happyFail (happyExpListPerState 169)

action_170 _ = happyReduce_18

action_171 (32) = happyShift action_13
action_171 (33) = happyShift action_14
action_171 (34) = happyShift action_15
action_171 (39) = happyShift action_16
action_171 (40) = happyShift action_17
action_171 (43) = happyShift action_18
action_171 (46) = happyShift action_19
action_171 (53) = happyShift action_20
action_171 (54) = happyShift action_21
action_171 (55) = happyShift action_22
action_171 (56) = happyShift action_23
action_171 (64) = happyShift action_24
action_171 (66) = happyShift action_25
action_171 (14) = happyGoto action_189
action_171 (15) = happyGoto action_12
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (57) = happyShift action_56
action_172 (58) = happyShift action_57
action_172 (59) = happyShift action_58
action_172 (60) = happyShift action_59
action_172 (61) = happyShift action_60
action_172 _ = happyReduce_48

action_173 (71) = happyShift action_188
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (65) = happyShift action_187
action_174 _ = happyFail (happyExpListPerState 174)

action_175 (32) = happyShift action_13
action_175 (33) = happyShift action_14
action_175 (34) = happyShift action_15
action_175 (39) = happyShift action_16
action_175 (40) = happyShift action_17
action_175 (43) = happyShift action_18
action_175 (46) = happyShift action_19
action_175 (53) = happyShift action_20
action_175 (54) = happyShift action_21
action_175 (55) = happyShift action_22
action_175 (56) = happyShift action_23
action_175 (64) = happyShift action_24
action_175 (66) = happyShift action_25
action_175 (14) = happyGoto action_186
action_175 (15) = happyGoto action_12
action_175 _ = happyFail (happyExpListPerState 175)

action_176 _ = happyReduce_27

action_177 _ = happyReduce_25

action_178 _ = happyReduce_26

action_179 (57) = happyShift action_56
action_179 (58) = happyShift action_57
action_179 (59) = happyShift action_58
action_179 (60) = happyShift action_59
action_179 (61) = happyShift action_60
action_179 _ = happyReduce_42

action_180 (36) = happyShift action_103
action_180 (37) = happyShift action_104
action_180 (38) = happyShift action_105
action_180 (39) = happyShift action_106
action_180 (27) = happyGoto action_185
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (32) = happyShift action_13
action_181 (33) = happyShift action_14
action_181 (34) = happyShift action_15
action_181 (39) = happyShift action_16
action_181 (40) = happyShift action_17
action_181 (43) = happyShift action_18
action_181 (46) = happyShift action_19
action_181 (53) = happyShift action_20
action_181 (54) = happyShift action_21
action_181 (55) = happyShift action_22
action_181 (56) = happyShift action_23
action_181 (64) = happyShift action_24
action_181 (66) = happyShift action_25
action_181 (14) = happyGoto action_184
action_181 (15) = happyGoto action_12
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (69) = happyShift action_183
action_182 _ = happyFail (happyExpListPerState 182)

action_183 _ = happyReduce_73

action_184 (57) = happyShift action_56
action_184 (58) = happyShift action_57
action_184 (59) = happyShift action_58
action_184 (60) = happyShift action_59
action_184 (61) = happyShift action_60
action_184 _ = happyReduce_11

action_185 (32) = happyShift action_13
action_185 (33) = happyShift action_14
action_185 (34) = happyShift action_15
action_185 (39) = happyShift action_16
action_185 (40) = happyShift action_17
action_185 (43) = happyShift action_18
action_185 (46) = happyShift action_19
action_185 (53) = happyShift action_20
action_185 (54) = happyShift action_21
action_185 (55) = happyShift action_22
action_185 (56) = happyShift action_23
action_185 (64) = happyShift action_24
action_185 (66) = happyShift action_25
action_185 (14) = happyGoto action_192
action_185 (15) = happyGoto action_12
action_185 _ = happyFail (happyExpListPerState 185)

action_186 (57) = happyShift action_56
action_186 (58) = happyShift action_57
action_186 (59) = happyShift action_58
action_186 (60) = happyShift action_59
action_186 (61) = happyShift action_60
action_186 (65) = happyShift action_191
action_186 _ = happyFail (happyExpListPerState 186)

action_187 _ = happyReduce_52

action_188 (32) = happyShift action_139
action_188 (33) = happyShift action_140
action_188 (73) = happyShift action_141
action_188 (22) = happyGoto action_173
action_188 (23) = happyGoto action_190
action_188 _ = happyReduce_53

action_189 _ = happyReduce_19

action_190 _ = happyReduce_54

action_191 _ = happyReduce_24

action_192 (57) = happyShift action_56
action_192 (58) = happyShift action_57
action_192 (59) = happyShift action_58
action_192 (60) = happyShift action_59
action_192 (61) = happyShift action_60
action_192 _ = happyReduce_10

happyReduce_1 = happyReduce 7 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mode happy_var_2 happy_var_4 happy_var_5 happy_var_6
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
happyReduction_5 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (MState happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  8 happyReduction_6
happyReduction_6 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

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
happyReduction_10 ((HappyAbsSyn14  happy_var_7) `HappyStk`
	(HappyAbsSyn27  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Func happy_var_1 happy_var_3 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 6 11 happyReduction_11
happyReduction_11 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	(HappyAbsSyn27  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Func happy_var_1 happy_var_2 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_0  12 happyReduction_12
happyReduction_12  =  HappyAbsSyn12
		 ([]
	)

happyReduce_13 = happySpecReduce_1  12 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  12 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  13 happyReduction_15
happyReduction_15 (HappyAbsSyn27  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn13
		 (Param happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  14 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn14
		 (ExprLit happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 14 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 6 14 happyReduction_18
happyReduction_18 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 8 14 happyReduction_19
happyReduction_19 ((HappyAbsSyn14  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprFor happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  14 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  14 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn19  happy_var_2)
	(HappyTerminal (TokenIdC happy_var_1))
	 =  HappyAbsSyn14
		 (ExprCall happy_var_1 happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 5 14 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 14 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 9 14 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprUnOp (UnOpTransmute (Just (fromIntegral happy_var_3)) (Just (fromIntegral happy_var_5))) happy_var_8
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 7 14 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 14 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 7 14 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (ExprUnOp (UnOpShrink (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  14 happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  14 happyReduction_33
happyReduction_33 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn14
		 (ExprVar happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn14
		 (ExprVoid
	)

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn15
		 (LValId happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 15 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_0  16 happyReduction_38
happyReduction_38  =  HappyAbsSyn16
		 ([]
	)

happyReduce_39 = happySpecReduce_2  16 happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_0  17 happyReduction_40
happyReduction_40  =  HappyAbsSyn17
		 ([]
	)

happyReduce_41 = happySpecReduce_2  17 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happyReduce 6 18 happyReduction_42
happyReduction_42 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_0  19 happyReduction_43
happyReduction_43  =  HappyAbsSyn19
		 ([]
	)

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  19 happyReduction_45
happyReduction_45 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 : happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_0  20 happyReduction_46
happyReduction_46  =  HappyAbsSyn20
		 ([]
	)

happyReduce_47 = happySpecReduce_2  20 happyReduction_47
happyReduction_47 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1 : happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  21 happyReduction_48
happyReduction_48 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 ((happy_var_1, happy_var_3)
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  22 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn22
		 (PatWildcard
	)

happyReduce_50 = happySpecReduce_1  22 happyReduction_50
happyReduction_50 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn22
		 (PatLit happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  22 happyReduction_51
happyReduction_51 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn22
		 (PatData happy_var_1 []
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happyReduce 4 22 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_0  23 happyReduction_53
happyReduction_53  =  HappyAbsSyn23
		 ([]
	)

happyReduce_54 = happySpecReduce_3  23 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1 : happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  24 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn24
		 (PredLit True
	)

happyReduce_56 = happySpecReduce_1  24 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn24
		 (PredLit False
	)

happyReduce_57 = happySpecReduce_2  24 happyReduction_57
happyReduction_57 (HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn24
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  24 happyReduction_58
happyReduction_58 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn24
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  24 happyReduction_59
happyReduction_59 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn24
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  24 happyReduction_60
happyReduction_60 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn24
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  25 happyReduction_61
happyReduction_61 _
	 =  HappyAbsSyn25
		 (CompEq
	)

happyReduce_62 = happySpecReduce_1  25 happyReduction_62
happyReduction_62 _
	 =  HappyAbsSyn25
		 (CompNeq
	)

happyReduce_63 = happySpecReduce_1  25 happyReduction_63
happyReduction_63 _
	 =  HappyAbsSyn25
		 (CompLe
	)

happyReduce_64 = happySpecReduce_1  25 happyReduction_64
happyReduction_64 _
	 =  HappyAbsSyn25
		 (CompGe
	)

happyReduce_65 = happySpecReduce_1  25 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn25
		 (CompLeq
	)

happyReduce_66 = happySpecReduce_1  25 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn25
		 (CompGeq
	)

happyReduce_67 = happySpecReduce_1  25 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn25
		 (CompLeS
	)

happyReduce_68 = happySpecReduce_1  25 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn25
		 (CompGeS
	)

happyReduce_69 = happySpecReduce_1  25 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn25
		 (CompLeqS
	)

happyReduce_70 = happySpecReduce_1  25 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn25
		 (CompGeqS
	)

happyReduce_71 = happySpecReduce_1  26 happyReduction_71
happyReduction_71 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happyReduce 4 27 happyReduction_72
happyReduction_72 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_73 = happyReduce 6 27 happyReduction_73
happyReduction_73 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_74 = happySpecReduce_2  27 happyReduction_74
happyReduction_74 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn27
		 (TypeData happy_var_2
	)
happyReduction_74 _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  27 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn27
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 84 84 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenMode -> cont 28;
	TokenState -> cont 29;
	TokenMain -> cont 30;
	TokenFunctions -> cont 31;
	TokenInt happy_dollar_dollar -> cont 32;
	TokenId happy_dollar_dollar -> cont 33;
	TokenIdC happy_dollar_dollar -> cont 34;
	TokenVar -> cont 35;
	TokenBits -> cont 36;
	TokenRange -> cont 37;
	TokenData -> cont 38;
	TokenVoid -> cont 39;
	TokenIf -> cont 40;
	TokenThen -> cont 41;
	TokenElse -> cont 42;
	TokenFor -> cont 43;
	TokenTo -> cont 44;
	TokenDo -> cont 45;
	TokenMatch -> cont 46;
	TokenWith -> cont 47;
	TokenTrue -> cont 48;
	TokenFalse -> cont 49;
	TokenNot -> cont 50;
	TokenAnd -> cont 51;
	TokenOr -> cont 52;
	TokenTransmute -> cont 53;
	TokenShrink -> cont 54;
	TokenExtend -> cont 55;
	TokenSignExtend -> cont 56;
	TokenPlus -> cont 57;
	TokenMinus -> cont 58;
	TokenAmphersand -> cont 59;
	TokenPipe -> cont 60;
	TokenCaret -> cont 61;
	TokenEq -> cont 62;
	TokenNeq -> cont 63;
	TokenLParen -> cont 64;
	TokenRParen -> cont 65;
	TokenLBrace -> cont 66;
	TokenRBrace -> cont 67;
	TokenLBracket -> cont 68;
	TokenRBracket -> cont 69;
	TokenColon -> cont 70;
	TokenComma -> cont 71;
	TokenDot -> cont 72;
	TokenUnderscore -> cont 73;
	TokenRArrow -> cont 74;
	TokenLArrow -> cont 75;
	TokenLe -> cont 76;
	TokenGe -> cont 77;
	TokenLeq -> cont 78;
	TokenGeq -> cont 79;
	TokenLeS -> cont 80;
	TokenLeqS -> cont 81;
	TokenGeS -> cont 82;
	TokenGeqS -> cont 83;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 84 tk tks = happyError' (tks, explist)
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
