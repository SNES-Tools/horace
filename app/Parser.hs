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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,413) ([0,0,2,0,0,0,0,16384,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,64,0,0,0,0,0,1,0,0,0,0,0,0,0,32,0,0,0,2,0,0,0,0,256,0,0,0,0,0,0,0,4096,0,0,0,64,0,0,0,0,0,1,0,0,0,0,32768,37635,960,10,0,0,0,0,0,2,0,0,4096,0,0,0,0,0,0,0,1024,0,0,0,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,992,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,2176,0,0,49152,18817,480,5,0,0,0,0,0,0,0,0,1792,40230,5127,0,0,0,64,0,0,0,0,0,38940,7684,80,0,0,0,0,0,32,0,0,0,0,0,4,0,0,0,0,32768,0,0,0,0,0,4096,0,0,0,12344,15369,160,0,0,0,32,0,0,0,0,0,0,0,4,0,0,0,0,16384,0,0,0,0,0,4096,0,0,0,32,0,0,0,0,0,0,0,512,0,0,0,240,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,0,0,32768,37635,960,10,0,0,0,2,0,0,0,0,1024,0,0,0,0,0,0,0,574,0,0,0,8,0,0,0,0,0,1,0,0,0,0,8192,0,0,0,0,0,1024,0,0,0,0,0,0,256,124,0,0,0,0,0,16,0,0,0,0,61440,32775,127,0,0,512,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49376,62372,640,0,0,0,0,57344,2051,0,0,0,0,0,4,0,0,28672,4704,16504,1,0,0,2048,0,0,0,0,0,33216,57417,1281,0,0,0,12344,15369,160,0,0,0,9735,1921,20,0,0,57344,9408,33008,2,0,0,7168,1176,20510,0,0,0,896,49299,2563,0,0,0,0,0,512,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,30,0,0,0,0,0,0,2048,0,0,0,0,0,16384,0,0,0,0,0,256,0,0,0,0,0,32,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,14336,0,0,0,0,0,5888,0,0,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,49152,18817,480,5,0,0,0,0,1984,4,0,0,0,0,0,0,0,0,49376,61476,640,0,0,0,0,0,0,0,0,32768,37635,960,10,0,0,28672,53856,16505,1,0,0,3584,14924,10255,0,0,0,33216,57417,1281,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49376,61476,640,0,0,0,0,0,64,0,0,0,0,0,256,0,0,0,0,0,8,0,0,0,0,0,1,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,7168,1176,21502,0,0,0,0,0,4096,0,0,0,0,0,512,0,0,0,12,0,0,0,0,0,0,0,1,0,0,4096,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,38940,7684,80,0,0,0,0,0,4,0,0,0,0,0,32,0,0,0,0,0,2,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57344,1,0,0,0,0,0,0,64,0,0,0,0,0,8,0,0,0,0,0,1,0,0,2048,0,0,0,0,0,768,0,0,8,0,0,0,8,31,0,0,0,0,57344,3,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,32,496,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,16,0,0,0,0,0,1920,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,32768,37635,960,10,0,0,28672,4704,16504,1,0,0,0,0,16384,0,0,0,192,0,0,2,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,24688,30738,320,0,0,0,19470,3842,40,0,0,49152,18817,480,5,0,0,0,0,2048,0,0,0,0,0,2048,0,0,0,30720,0,0,0,0,0,8,0,0,0,0,0,0,0,128,0,0,0,0,3968,0,0,0,32768,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,57344,9408,33008,2,0,0,0,0,9184,0,0,0,0,0,1148,0,0,0,0,32768,143,0,0,0,0,0,8,0,0,49152,0,0,512,0,0,14336,2352,41020,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57346,3,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,12344,15369,160,0,0,0,0,63488,0,0,0,0,0,0,64,0,0,0,0,8192,0,0,0,896,49299,2563,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1984,0,0,0,49152,3,0,0,0,0,49376,61476,640,0,0,0,0,57344,3,0,0,32768,37635,960,10,0,0,0,0,36736,0,0,0,0,0,0,0,0,0,192,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,124,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","types_decl","type_list","type","type_cases","type_case","type_vars","state_decl","state_vars","state_var","main_decl","func_decl","func_list","func","params","param","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_state","type_reg","mode","state","main","funcs","types","int","id","idc","Id","Idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 93
        bit_end = (st Prelude.+ 1) Prelude.* 93
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..92]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (34) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (34) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (42) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (93) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (75) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (38) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_10
action_6 (11) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (75) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (42) = happyShift action_16
action_8 (6) = happyGoto action_14
action_8 (7) = happyGoto action_15
action_8 _ = happyReduce_3

action_9 (36) = happyShift action_13
action_9 (14) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (75) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (40) = happyShift action_39
action_11 (12) = happyGoto action_37
action_11 (13) = happyGoto action_38
action_11 _ = happyReduce_13

action_12 (37) = happyShift action_36
action_12 (15) = happyGoto action_35
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (39) = happyShift action_22
action_13 (40) = happyShift action_23
action_13 (41) = happyShift action_24
action_13 (48) = happyShift action_25
action_13 (49) = happyShift action_26
action_13 (52) = happyShift action_27
action_13 (55) = happyShift action_28
action_13 (62) = happyShift action_29
action_13 (63) = happyShift action_30
action_13 (64) = happyShift action_31
action_13 (65) = happyShift action_32
action_13 (73) = happyShift action_33
action_13 (75) = happyShift action_34
action_13 (20) = happyGoto action_20
action_13 (21) = happyGoto action_21
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (76) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (42) = happyShift action_16
action_15 (6) = happyGoto action_18
action_15 (7) = happyGoto action_15
action_15 _ = happyReduce_3

action_16 (75) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (42) = happyShift action_72
action_17 (43) = happyShift action_73
action_17 (8) = happyGoto action_70
action_17 (9) = happyGoto action_71
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_4

action_19 _ = happyReduce_2

action_20 (66) = happyShift action_65
action_20 (67) = happyShift action_66
action_20 (68) = happyShift action_67
action_20 (69) = happyShift action_68
action_20 (70) = happyShift action_69
action_20 _ = happyReduce_16

action_21 (84) = happyShift action_64
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_26

action_23 (77) = happyShift action_62
action_23 (81) = happyShift action_63
action_23 (84) = happyReduce_46
action_23 _ = happyReduce_43

action_24 (39) = happyShift action_22
action_24 (40) = happyShift action_23
action_24 (41) = happyShift action_24
action_24 (48) = happyShift action_25
action_24 (49) = happyShift action_26
action_24 (52) = happyShift action_27
action_24 (55) = happyShift action_28
action_24 (62) = happyShift action_29
action_24 (63) = happyShift action_30
action_24 (64) = happyShift action_31
action_24 (65) = happyShift action_32
action_24 (73) = happyShift action_33
action_24 (75) = happyShift action_34
action_24 (20) = happyGoto action_60
action_24 (21) = happyGoto action_21
action_24 (25) = happyGoto action_61
action_24 _ = happyReduce_53

action_25 _ = happyReduce_45

action_26 (39) = happyShift action_22
action_26 (40) = happyShift action_23
action_26 (41) = happyShift action_24
action_26 (48) = happyShift action_25
action_26 (49) = happyShift action_26
action_26 (52) = happyShift action_27
action_26 (55) = happyShift action_28
action_26 (57) = happyShift action_57
action_26 (58) = happyShift action_58
action_26 (59) = happyShift action_59
action_26 (62) = happyShift action_29
action_26 (63) = happyShift action_30
action_26 (64) = happyShift action_31
action_26 (65) = happyShift action_32
action_26 (73) = happyShift action_33
action_26 (75) = happyShift action_34
action_26 (20) = happyGoto action_55
action_26 (21) = happyGoto action_21
action_26 (30) = happyGoto action_56
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (40) = happyShift action_54
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (39) = happyShift action_22
action_28 (40) = happyShift action_23
action_28 (41) = happyShift action_24
action_28 (48) = happyShift action_25
action_28 (49) = happyShift action_26
action_28 (52) = happyShift action_27
action_28 (55) = happyShift action_28
action_28 (62) = happyShift action_29
action_28 (63) = happyShift action_30
action_28 (64) = happyShift action_31
action_28 (65) = happyShift action_32
action_28 (73) = happyShift action_33
action_28 (75) = happyShift action_34
action_28 (20) = happyGoto action_53
action_28 (21) = happyGoto action_21
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (77) = happyShift action_52
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (77) = happyShift action_51
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (77) = happyShift action_50
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (77) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (39) = happyShift action_22
action_33 (40) = happyShift action_23
action_33 (41) = happyShift action_24
action_33 (48) = happyShift action_25
action_33 (49) = happyShift action_26
action_33 (52) = happyShift action_27
action_33 (55) = happyShift action_28
action_33 (62) = happyShift action_29
action_33 (63) = happyShift action_30
action_33 (64) = happyShift action_31
action_33 (65) = happyShift action_32
action_33 (73) = happyShift action_33
action_33 (75) = happyShift action_34
action_33 (20) = happyGoto action_48
action_33 (21) = happyGoto action_21
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (44) = happyShift action_47
action_34 (23) = happyGoto action_45
action_34 (24) = happyGoto action_46
action_34 _ = happyReduce_50

action_35 (76) = happyShift action_44
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (75) = happyShift action_43
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (76) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (40) = happyShift action_39
action_38 (12) = happyGoto action_41
action_38 (13) = happyGoto action_38
action_38 _ = happyReduce_13

action_39 (79) = happyShift action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (45) = happyShift action_76
action_40 (46) = happyShift action_77
action_40 (47) = happyShift action_78
action_40 (48) = happyShift action_79
action_40 (32) = happyGoto action_122
action_40 (33) = happyGoto action_123
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_14

action_42 _ = happyReduce_12

action_43 (40) = happyShift action_120
action_43 (41) = happyShift action_121
action_43 (16) = happyGoto action_118
action_43 (17) = happyGoto action_119
action_43 _ = happyReduce_18

action_44 _ = happyReduce_1

action_45 (39) = happyShift action_22
action_45 (40) = happyShift action_23
action_45 (41) = happyShift action_24
action_45 (48) = happyShift action_25
action_45 (49) = happyShift action_26
action_45 (52) = happyShift action_27
action_45 (55) = happyShift action_28
action_45 (62) = happyShift action_29
action_45 (63) = happyShift action_30
action_45 (64) = happyShift action_31
action_45 (65) = happyShift action_32
action_45 (73) = happyShift action_33
action_45 (75) = happyShift action_34
action_45 (20) = happyGoto action_116
action_45 (21) = happyGoto action_21
action_45 (22) = happyGoto action_117
action_45 _ = happyReduce_48

action_46 (44) = happyShift action_47
action_46 (23) = happyGoto action_115
action_46 (24) = happyGoto action_46
action_46 _ = happyReduce_50

action_47 (40) = happyShift action_114
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (66) = happyShift action_65
action_48 (67) = happyShift action_66
action_48 (68) = happyShift action_67
action_48 (69) = happyShift action_68
action_48 (70) = happyShift action_69
action_48 (74) = happyShift action_113
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (39) = happyShift action_112
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (39) = happyShift action_111
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_110
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (39) = happyShift action_109
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (56) = happyShift action_108
action_53 (66) = happyShift action_65
action_53 (67) = happyShift action_66
action_53 (68) = happyShift action_67
action_53 (69) = happyShift action_68
action_53 (70) = happyShift action_69
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (71) = happyShift action_107
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (66) = happyShift action_65
action_55 (67) = happyShift action_66
action_55 (68) = happyShift action_67
action_55 (69) = happyShift action_68
action_55 (70) = happyShift action_69
action_55 (71) = happyShift action_97
action_55 (72) = happyShift action_98
action_55 (85) = happyShift action_99
action_55 (86) = happyShift action_100
action_55 (87) = happyShift action_101
action_55 (88) = happyShift action_102
action_55 (89) = happyShift action_103
action_55 (90) = happyShift action_104
action_55 (91) = happyShift action_105
action_55 (92) = happyShift action_106
action_55 (31) = happyGoto action_96
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (50) = happyShift action_93
action_56 (60) = happyShift action_94
action_56 (61) = happyShift action_95
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_65

action_58 _ = happyReduce_66

action_59 (39) = happyShift action_22
action_59 (40) = happyShift action_23
action_59 (41) = happyShift action_24
action_59 (48) = happyShift action_25
action_59 (49) = happyShift action_26
action_59 (52) = happyShift action_27
action_59 (55) = happyShift action_28
action_59 (57) = happyShift action_57
action_59 (58) = happyShift action_58
action_59 (59) = happyShift action_59
action_59 (62) = happyShift action_29
action_59 (63) = happyShift action_30
action_59 (64) = happyShift action_31
action_59 (65) = happyShift action_32
action_59 (73) = happyShift action_33
action_59 (75) = happyShift action_34
action_59 (20) = happyGoto action_55
action_59 (21) = happyGoto action_21
action_59 (30) = happyGoto action_92
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (66) = happyShift action_65
action_60 (67) = happyShift action_66
action_60 (68) = happyShift action_67
action_60 (69) = happyShift action_68
action_60 (70) = happyShift action_69
action_60 (80) = happyShift action_91
action_60 _ = happyReduce_54

action_61 (74) = happyShift action_90
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (39) = happyShift action_22
action_62 (40) = happyShift action_23
action_62 (41) = happyShift action_24
action_62 (48) = happyShift action_25
action_62 (49) = happyShift action_26
action_62 (52) = happyShift action_27
action_62 (55) = happyShift action_28
action_62 (62) = happyShift action_29
action_62 (63) = happyShift action_30
action_62 (64) = happyShift action_31
action_62 (65) = happyShift action_32
action_62 (73) = happyShift action_33
action_62 (75) = happyShift action_34
action_62 (20) = happyGoto action_89
action_62 (21) = happyGoto action_21
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (41) = happyShift action_88
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_22
action_64 (40) = happyShift action_23
action_64 (41) = happyShift action_24
action_64 (48) = happyShift action_25
action_64 (49) = happyShift action_26
action_64 (52) = happyShift action_27
action_64 (55) = happyShift action_28
action_64 (62) = happyShift action_29
action_64 (63) = happyShift action_30
action_64 (64) = happyShift action_31
action_64 (65) = happyShift action_32
action_64 (73) = happyShift action_33
action_64 (75) = happyShift action_34
action_64 (20) = happyGoto action_87
action_64 (21) = happyGoto action_21
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyShift action_22
action_65 (40) = happyShift action_23
action_65 (41) = happyShift action_24
action_65 (48) = happyShift action_25
action_65 (49) = happyShift action_26
action_65 (52) = happyShift action_27
action_65 (55) = happyShift action_28
action_65 (62) = happyShift action_29
action_65 (63) = happyShift action_30
action_65 (64) = happyShift action_31
action_65 (65) = happyShift action_32
action_65 (73) = happyShift action_33
action_65 (75) = happyShift action_34
action_65 (20) = happyGoto action_86
action_65 (21) = happyGoto action_21
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (39) = happyShift action_22
action_66 (40) = happyShift action_23
action_66 (41) = happyShift action_24
action_66 (48) = happyShift action_25
action_66 (49) = happyShift action_26
action_66 (52) = happyShift action_27
action_66 (55) = happyShift action_28
action_66 (62) = happyShift action_29
action_66 (63) = happyShift action_30
action_66 (64) = happyShift action_31
action_66 (65) = happyShift action_32
action_66 (73) = happyShift action_33
action_66 (75) = happyShift action_34
action_66 (20) = happyGoto action_85
action_66 (21) = happyGoto action_21
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (39) = happyShift action_22
action_67 (40) = happyShift action_23
action_67 (41) = happyShift action_24
action_67 (48) = happyShift action_25
action_67 (49) = happyShift action_26
action_67 (52) = happyShift action_27
action_67 (55) = happyShift action_28
action_67 (62) = happyShift action_29
action_67 (63) = happyShift action_30
action_67 (64) = happyShift action_31
action_67 (65) = happyShift action_32
action_67 (73) = happyShift action_33
action_67 (75) = happyShift action_34
action_67 (20) = happyGoto action_84
action_67 (21) = happyGoto action_21
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (39) = happyShift action_22
action_68 (40) = happyShift action_23
action_68 (41) = happyShift action_24
action_68 (48) = happyShift action_25
action_68 (49) = happyShift action_26
action_68 (52) = happyShift action_27
action_68 (55) = happyShift action_28
action_68 (62) = happyShift action_29
action_68 (63) = happyShift action_30
action_68 (64) = happyShift action_31
action_68 (65) = happyShift action_32
action_68 (73) = happyShift action_33
action_68 (75) = happyShift action_34
action_68 (20) = happyGoto action_83
action_68 (21) = happyGoto action_21
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_22
action_69 (40) = happyShift action_23
action_69 (41) = happyShift action_24
action_69 (48) = happyShift action_25
action_69 (49) = happyShift action_26
action_69 (52) = happyShift action_27
action_69 (55) = happyShift action_28
action_69 (62) = happyShift action_29
action_69 (63) = happyShift action_30
action_69 (64) = happyShift action_31
action_69 (65) = happyShift action_32
action_69 (73) = happyShift action_33
action_69 (75) = happyShift action_34
action_69 (20) = happyGoto action_82
action_69 (21) = happyGoto action_21
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (76) = happyShift action_81
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (80) = happyShift action_80
action_71 _ = happyReduce_6

action_72 _ = happyReduce_8

action_73 (45) = happyShift action_76
action_73 (46) = happyShift action_77
action_73 (47) = happyShift action_78
action_73 (48) = happyShift action_79
action_73 (10) = happyGoto action_74
action_73 (33) = happyGoto action_75
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (74) = happyShift action_152
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (80) = happyShift action_151
action_75 _ = happyReduce_10

action_76 (77) = happyShift action_150
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (77) = happyShift action_149
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (40) = happyShift action_148
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_85

action_80 (42) = happyShift action_72
action_80 (43) = happyShift action_73
action_80 (8) = happyGoto action_147
action_80 (9) = happyGoto action_71
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_5

action_82 (66) = happyShift action_65
action_82 (67) = happyShift action_66
action_82 (68) = happyShift action_67
action_82 _ = happyReduce_41

action_83 (66) = happyShift action_65
action_83 (67) = happyShift action_66
action_83 (68) = happyShift action_67
action_83 (70) = happyShift action_69
action_83 _ = happyReduce_42

action_84 (66) = happyShift action_65
action_84 (67) = happyShift action_66
action_84 _ = happyReduce_40

action_85 _ = happyReduce_39

action_86 _ = happyReduce_38

action_87 (66) = happyShift action_65
action_87 (67) = happyShift action_66
action_87 (68) = happyShift action_67
action_87 (69) = happyShift action_68
action_87 (70) = happyShift action_69
action_87 _ = happyReduce_30

action_88 (39) = happyShift action_22
action_88 (40) = happyShift action_23
action_88 (41) = happyShift action_24
action_88 (48) = happyShift action_25
action_88 (49) = happyShift action_26
action_88 (52) = happyShift action_27
action_88 (55) = happyShift action_28
action_88 (62) = happyShift action_29
action_88 (63) = happyShift action_30
action_88 (64) = happyShift action_31
action_88 (65) = happyShift action_32
action_88 (73) = happyShift action_33
action_88 (75) = happyShift action_34
action_88 (20) = happyGoto action_60
action_88 (21) = happyGoto action_21
action_88 (25) = happyGoto action_146
action_88 _ = happyReduce_53

action_89 (66) = happyShift action_65
action_89 (67) = happyShift action_66
action_89 (68) = happyShift action_67
action_89 (69) = happyShift action_68
action_89 (70) = happyShift action_69
action_89 (78) = happyShift action_145
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_31

action_91 (39) = happyShift action_22
action_91 (40) = happyShift action_23
action_91 (41) = happyShift action_24
action_91 (48) = happyShift action_25
action_91 (49) = happyShift action_26
action_91 (52) = happyShift action_27
action_91 (55) = happyShift action_28
action_91 (62) = happyShift action_29
action_91 (63) = happyShift action_30
action_91 (64) = happyShift action_31
action_91 (65) = happyShift action_32
action_91 (73) = happyShift action_33
action_91 (75) = happyShift action_34
action_91 (20) = happyGoto action_60
action_91 (21) = happyGoto action_21
action_91 (25) = happyGoto action_144
action_91 _ = happyReduce_53

action_92 _ = happyReduce_67

action_93 (39) = happyShift action_22
action_93 (40) = happyShift action_23
action_93 (41) = happyShift action_24
action_93 (48) = happyShift action_25
action_93 (49) = happyShift action_26
action_93 (52) = happyShift action_27
action_93 (55) = happyShift action_28
action_93 (62) = happyShift action_29
action_93 (63) = happyShift action_30
action_93 (64) = happyShift action_31
action_93 (65) = happyShift action_32
action_93 (73) = happyShift action_33
action_93 (75) = happyShift action_34
action_93 (20) = happyGoto action_143
action_93 (21) = happyGoto action_21
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (39) = happyShift action_22
action_94 (40) = happyShift action_23
action_94 (41) = happyShift action_24
action_94 (48) = happyShift action_25
action_94 (49) = happyShift action_26
action_94 (52) = happyShift action_27
action_94 (55) = happyShift action_28
action_94 (57) = happyShift action_57
action_94 (58) = happyShift action_58
action_94 (59) = happyShift action_59
action_94 (62) = happyShift action_29
action_94 (63) = happyShift action_30
action_94 (64) = happyShift action_31
action_94 (65) = happyShift action_32
action_94 (73) = happyShift action_33
action_94 (75) = happyShift action_34
action_94 (20) = happyGoto action_55
action_94 (21) = happyGoto action_21
action_94 (30) = happyGoto action_142
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (39) = happyShift action_22
action_95 (40) = happyShift action_23
action_95 (41) = happyShift action_24
action_95 (48) = happyShift action_25
action_95 (49) = happyShift action_26
action_95 (52) = happyShift action_27
action_95 (55) = happyShift action_28
action_95 (57) = happyShift action_57
action_95 (58) = happyShift action_58
action_95 (59) = happyShift action_59
action_95 (62) = happyShift action_29
action_95 (63) = happyShift action_30
action_95 (64) = happyShift action_31
action_95 (65) = happyShift action_32
action_95 (73) = happyShift action_33
action_95 (75) = happyShift action_34
action_95 (20) = happyGoto action_55
action_95 (21) = happyGoto action_21
action_95 (30) = happyGoto action_141
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (39) = happyShift action_22
action_96 (40) = happyShift action_23
action_96 (41) = happyShift action_24
action_96 (48) = happyShift action_25
action_96 (49) = happyShift action_26
action_96 (52) = happyShift action_27
action_96 (55) = happyShift action_28
action_96 (62) = happyShift action_29
action_96 (63) = happyShift action_30
action_96 (64) = happyShift action_31
action_96 (65) = happyShift action_32
action_96 (73) = happyShift action_33
action_96 (75) = happyShift action_34
action_96 (20) = happyGoto action_140
action_96 (21) = happyGoto action_21
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_71

action_98 _ = happyReduce_72

action_99 _ = happyReduce_73

action_100 _ = happyReduce_74

action_101 _ = happyReduce_75

action_102 _ = happyReduce_76

action_103 _ = happyReduce_77

action_104 _ = happyReduce_79

action_105 _ = happyReduce_78

action_106 _ = happyReduce_80

action_107 (39) = happyShift action_22
action_107 (40) = happyShift action_23
action_107 (41) = happyShift action_24
action_107 (48) = happyShift action_25
action_107 (49) = happyShift action_26
action_107 (52) = happyShift action_27
action_107 (55) = happyShift action_28
action_107 (62) = happyShift action_29
action_107 (63) = happyShift action_30
action_107 (64) = happyShift action_31
action_107 (65) = happyShift action_32
action_107 (73) = happyShift action_33
action_107 (75) = happyShift action_34
action_107 (20) = happyGoto action_139
action_107 (21) = happyGoto action_21
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (75) = happyShift action_138
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (80) = happyShift action_137
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (78) = happyShift action_136
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (78) = happyShift action_135
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (78) = happyShift action_134
action_112 _ = happyFail (happyExpListPerState 112)

action_113 _ = happyReduce_44

action_114 (79) = happyShift action_133
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_51

action_116 (39) = happyShift action_22
action_116 (40) = happyShift action_23
action_116 (41) = happyShift action_24
action_116 (48) = happyShift action_25
action_116 (49) = happyShift action_26
action_116 (52) = happyShift action_27
action_116 (55) = happyShift action_28
action_116 (62) = happyShift action_29
action_116 (63) = happyShift action_30
action_116 (64) = happyShift action_31
action_116 (65) = happyShift action_32
action_116 (66) = happyShift action_65
action_116 (67) = happyShift action_66
action_116 (68) = happyShift action_67
action_116 (69) = happyShift action_68
action_116 (70) = happyShift action_69
action_116 (73) = happyShift action_33
action_116 (75) = happyShift action_34
action_116 (20) = happyGoto action_116
action_116 (21) = happyGoto action_21
action_116 (22) = happyGoto action_132
action_116 _ = happyReduce_48

action_117 (76) = happyShift action_131
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (76) = happyShift action_130
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (40) = happyShift action_120
action_119 (41) = happyShift action_121
action_119 (16) = happyGoto action_129
action_119 (17) = happyGoto action_119
action_119 _ = happyReduce_18

action_120 (73) = happyShift action_128
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (40) = happyShift action_127
action_121 (18) = happyGoto action_125
action_121 (19) = happyGoto action_126
action_121 _ = happyReduce_22

action_122 (71) = happyShift action_124
action_122 _ = happyFail (happyExpListPerState 122)

action_123 _ = happyReduce_81

action_124 (39) = happyShift action_22
action_124 (40) = happyShift action_23
action_124 (41) = happyShift action_24
action_124 (48) = happyShift action_25
action_124 (49) = happyShift action_26
action_124 (52) = happyShift action_27
action_124 (55) = happyShift action_28
action_124 (62) = happyShift action_29
action_124 (63) = happyShift action_30
action_124 (64) = happyShift action_31
action_124 (65) = happyShift action_32
action_124 (73) = happyShift action_33
action_124 (75) = happyShift action_34
action_124 (20) = happyGoto action_174
action_124 (21) = happyGoto action_21
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (74) = happyShift action_173
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (80) = happyShift action_172
action_126 _ = happyReduce_23

action_127 (79) = happyShift action_171
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (40) = happyShift action_127
action_128 (18) = happyGoto action_170
action_128 (19) = happyGoto action_126
action_128 _ = happyReduce_22

action_129 _ = happyReduce_19

action_130 _ = happyReduce_17

action_131 _ = happyReduce_27

action_132 _ = happyReduce_49

action_133 (45) = happyShift action_76
action_133 (46) = happyShift action_77
action_133 (47) = happyShift action_78
action_133 (48) = happyShift action_79
action_133 (33) = happyGoto action_169
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (73) = happyShift action_168
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (73) = happyShift action_167
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (73) = happyShift action_166
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (39) = happyShift action_165
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (39) = happyShift action_162
action_138 (40) = happyShift action_163
action_138 (82) = happyShift action_164
action_138 (26) = happyGoto action_159
action_138 (27) = happyGoto action_160
action_138 (28) = happyGoto action_161
action_138 _ = happyReduce_56

action_139 (53) = happyShift action_158
action_139 (66) = happyShift action_65
action_139 (67) = happyShift action_66
action_139 (68) = happyShift action_67
action_139 (69) = happyShift action_68
action_139 (70) = happyShift action_69
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (66) = happyShift action_65
action_140 (67) = happyShift action_66
action_140 (68) = happyShift action_67
action_140 (69) = happyShift action_68
action_140 (70) = happyShift action_69
action_140 _ = happyReduce_70

action_141 (60) = happyShift action_94
action_141 _ = happyReduce_69

action_142 _ = happyReduce_68

action_143 (51) = happyShift action_157
action_143 (66) = happyShift action_65
action_143 (67) = happyShift action_66
action_143 (68) = happyShift action_67
action_143 (69) = happyShift action_68
action_143 (70) = happyShift action_69
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_55

action_145 _ = happyReduce_47

action_146 (74) = happyShift action_156
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_7

action_148 _ = happyReduce_84

action_149 (39) = happyShift action_155
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (39) = happyShift action_154
action_150 _ = happyFail (happyExpListPerState 150)

action_151 (45) = happyShift action_76
action_151 (46) = happyShift action_77
action_151 (47) = happyShift action_78
action_151 (48) = happyShift action_79
action_151 (10) = happyGoto action_153
action_151 (33) = happyGoto action_75
action_151 _ = happyFail (happyExpListPerState 151)

action_152 _ = happyReduce_9

action_153 _ = happyReduce_11

action_154 (78) = happyShift action_191
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (80) = happyShift action_190
action_155 _ = happyFail (happyExpListPerState 155)

action_156 _ = happyReduce_32

action_157 (39) = happyShift action_22
action_157 (40) = happyShift action_23
action_157 (41) = happyShift action_24
action_157 (48) = happyShift action_25
action_157 (49) = happyShift action_26
action_157 (52) = happyShift action_27
action_157 (55) = happyShift action_28
action_157 (62) = happyShift action_29
action_157 (63) = happyShift action_30
action_157 (64) = happyShift action_31
action_157 (65) = happyShift action_32
action_157 (73) = happyShift action_33
action_157 (75) = happyShift action_34
action_157 (20) = happyGoto action_189
action_157 (21) = happyGoto action_21
action_157 _ = happyFail (happyExpListPerState 157)

action_158 (39) = happyShift action_22
action_158 (40) = happyShift action_23
action_158 (41) = happyShift action_24
action_158 (48) = happyShift action_25
action_158 (49) = happyShift action_26
action_158 (52) = happyShift action_27
action_158 (55) = happyShift action_28
action_158 (62) = happyShift action_29
action_158 (63) = happyShift action_30
action_158 (64) = happyShift action_31
action_158 (65) = happyShift action_32
action_158 (73) = happyShift action_33
action_158 (75) = happyShift action_34
action_158 (20) = happyGoto action_188
action_158 (21) = happyGoto action_21
action_158 _ = happyFail (happyExpListPerState 158)

action_159 (76) = happyShift action_187
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (39) = happyShift action_162
action_160 (40) = happyShift action_163
action_160 (82) = happyShift action_164
action_160 (26) = happyGoto action_186
action_160 (27) = happyGoto action_160
action_160 (28) = happyGoto action_161
action_160 _ = happyReduce_56

action_161 (83) = happyShift action_185
action_161 _ = happyFail (happyExpListPerState 161)

action_162 _ = happyReduce_60

action_163 (73) = happyShift action_184
action_163 _ = happyReduce_61

action_164 _ = happyReduce_59

action_165 (78) = happyShift action_183
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (39) = happyShift action_22
action_166 (40) = happyShift action_23
action_166 (41) = happyShift action_24
action_166 (48) = happyShift action_25
action_166 (49) = happyShift action_26
action_166 (52) = happyShift action_27
action_166 (55) = happyShift action_28
action_166 (62) = happyShift action_29
action_166 (63) = happyShift action_30
action_166 (64) = happyShift action_31
action_166 (65) = happyShift action_32
action_166 (73) = happyShift action_33
action_166 (75) = happyShift action_34
action_166 (20) = happyGoto action_182
action_166 (21) = happyGoto action_21
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (39) = happyShift action_22
action_167 (40) = happyShift action_23
action_167 (41) = happyShift action_24
action_167 (48) = happyShift action_25
action_167 (49) = happyShift action_26
action_167 (52) = happyShift action_27
action_167 (55) = happyShift action_28
action_167 (62) = happyShift action_29
action_167 (63) = happyShift action_30
action_167 (64) = happyShift action_31
action_167 (65) = happyShift action_32
action_167 (73) = happyShift action_33
action_167 (75) = happyShift action_34
action_167 (20) = happyGoto action_181
action_167 (21) = happyGoto action_21
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (39) = happyShift action_22
action_168 (40) = happyShift action_23
action_168 (41) = happyShift action_24
action_168 (48) = happyShift action_25
action_168 (49) = happyShift action_26
action_168 (52) = happyShift action_27
action_168 (55) = happyShift action_28
action_168 (62) = happyShift action_29
action_168 (63) = happyShift action_30
action_168 (64) = happyShift action_31
action_168 (65) = happyShift action_32
action_168 (73) = happyShift action_33
action_168 (75) = happyShift action_34
action_168 (20) = happyGoto action_180
action_168 (21) = happyGoto action_21
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (71) = happyShift action_179
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (74) = happyShift action_178
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (45) = happyShift action_76
action_171 (46) = happyShift action_77
action_171 (47) = happyShift action_78
action_171 (48) = happyShift action_79
action_171 (33) = happyGoto action_177
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (40) = happyShift action_127
action_172 (18) = happyGoto action_176
action_172 (19) = happyGoto action_126
action_172 _ = happyReduce_22

action_173 (79) = happyShift action_175
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (66) = happyShift action_65
action_174 (67) = happyShift action_66
action_174 (68) = happyShift action_67
action_174 (69) = happyShift action_68
action_174 (70) = happyShift action_69
action_174 _ = happyReduce_15

action_175 (45) = happyShift action_76
action_175 (46) = happyShift action_77
action_175 (47) = happyShift action_78
action_175 (48) = happyShift action_79
action_175 (33) = happyGoto action_203
action_175 _ = happyFail (happyExpListPerState 175)

action_176 _ = happyReduce_24

action_177 _ = happyReduce_25

action_178 (79) = happyShift action_202
action_178 _ = happyFail (happyExpListPerState 178)

action_179 (39) = happyShift action_22
action_179 (40) = happyShift action_23
action_179 (41) = happyShift action_24
action_179 (48) = happyShift action_25
action_179 (49) = happyShift action_26
action_179 (52) = happyShift action_27
action_179 (55) = happyShift action_28
action_179 (62) = happyShift action_29
action_179 (63) = happyShift action_30
action_179 (64) = happyShift action_31
action_179 (65) = happyShift action_32
action_179 (73) = happyShift action_33
action_179 (75) = happyShift action_34
action_179 (20) = happyGoto action_201
action_179 (21) = happyGoto action_21
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (66) = happyShift action_65
action_180 (67) = happyShift action_66
action_180 (68) = happyShift action_67
action_180 (69) = happyShift action_68
action_180 (70) = happyShift action_69
action_180 (74) = happyShift action_200
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (66) = happyShift action_65
action_181 (67) = happyShift action_66
action_181 (68) = happyShift action_67
action_181 (69) = happyShift action_68
action_181 (70) = happyShift action_69
action_181 (74) = happyShift action_199
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (66) = happyShift action_65
action_182 (67) = happyShift action_66
action_182 (68) = happyShift action_67
action_182 (69) = happyShift action_68
action_182 (70) = happyShift action_69
action_182 (74) = happyShift action_198
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (73) = happyShift action_197
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (39) = happyShift action_162
action_184 (40) = happyShift action_163
action_184 (82) = happyShift action_164
action_184 (28) = happyGoto action_195
action_184 (29) = happyGoto action_196
action_184 _ = happyReduce_63

action_185 (39) = happyShift action_22
action_185 (40) = happyShift action_23
action_185 (41) = happyShift action_24
action_185 (48) = happyShift action_25
action_185 (49) = happyShift action_26
action_185 (52) = happyShift action_27
action_185 (55) = happyShift action_28
action_185 (62) = happyShift action_29
action_185 (63) = happyShift action_30
action_185 (64) = happyShift action_31
action_185 (65) = happyShift action_32
action_185 (73) = happyShift action_33
action_185 (75) = happyShift action_34
action_185 (20) = happyGoto action_194
action_185 (21) = happyGoto action_21
action_185 _ = happyFail (happyExpListPerState 185)

action_186 _ = happyReduce_57

action_187 _ = happyReduce_33

action_188 (54) = happyShift action_193
action_188 (66) = happyShift action_65
action_188 (67) = happyShift action_66
action_188 (68) = happyShift action_67
action_188 (69) = happyShift action_68
action_188 (70) = happyShift action_69
action_188 _ = happyFail (happyExpListPerState 188)

action_189 _ = happyReduce_28

action_190 (39) = happyShift action_192
action_190 _ = happyFail (happyExpListPerState 190)

action_191 _ = happyReduce_82

action_192 (78) = happyShift action_210
action_192 _ = happyFail (happyExpListPerState 192)

action_193 (39) = happyShift action_22
action_193 (40) = happyShift action_23
action_193 (41) = happyShift action_24
action_193 (48) = happyShift action_25
action_193 (49) = happyShift action_26
action_193 (52) = happyShift action_27
action_193 (55) = happyShift action_28
action_193 (62) = happyShift action_29
action_193 (63) = happyShift action_30
action_193 (64) = happyShift action_31
action_193 (65) = happyShift action_32
action_193 (73) = happyShift action_33
action_193 (75) = happyShift action_34
action_193 (20) = happyGoto action_209
action_193 (21) = happyGoto action_21
action_193 _ = happyFail (happyExpListPerState 193)

action_194 (66) = happyShift action_65
action_194 (67) = happyShift action_66
action_194 (68) = happyShift action_67
action_194 (69) = happyShift action_68
action_194 (70) = happyShift action_69
action_194 _ = happyReduce_58

action_195 (80) = happyShift action_208
action_195 _ = happyFail (happyExpListPerState 195)

action_196 (74) = happyShift action_207
action_196 _ = happyFail (happyExpListPerState 196)

action_197 (39) = happyShift action_22
action_197 (40) = happyShift action_23
action_197 (41) = happyShift action_24
action_197 (48) = happyShift action_25
action_197 (49) = happyShift action_26
action_197 (52) = happyShift action_27
action_197 (55) = happyShift action_28
action_197 (62) = happyShift action_29
action_197 (63) = happyShift action_30
action_197 (64) = happyShift action_31
action_197 (65) = happyShift action_32
action_197 (73) = happyShift action_33
action_197 (75) = happyShift action_34
action_197 (20) = happyGoto action_206
action_197 (21) = happyGoto action_21
action_197 _ = happyFail (happyExpListPerState 197)

action_198 _ = happyReduce_37

action_199 _ = happyReduce_35

action_200 _ = happyReduce_36

action_201 (66) = happyShift action_65
action_201 (67) = happyShift action_66
action_201 (68) = happyShift action_67
action_201 (69) = happyShift action_68
action_201 (70) = happyShift action_69
action_201 _ = happyReduce_52

action_202 (45) = happyShift action_76
action_202 (46) = happyShift action_77
action_202 (47) = happyShift action_78
action_202 (48) = happyShift action_79
action_202 (33) = happyGoto action_205
action_202 _ = happyFail (happyExpListPerState 202)

action_203 (39) = happyShift action_22
action_203 (40) = happyShift action_23
action_203 (41) = happyShift action_24
action_203 (48) = happyShift action_25
action_203 (49) = happyShift action_26
action_203 (52) = happyShift action_27
action_203 (55) = happyShift action_28
action_203 (62) = happyShift action_29
action_203 (63) = happyShift action_30
action_203 (64) = happyShift action_31
action_203 (65) = happyShift action_32
action_203 (73) = happyShift action_33
action_203 (75) = happyShift action_34
action_203 (20) = happyGoto action_204
action_203 (21) = happyGoto action_21
action_203 _ = happyFail (happyExpListPerState 203)

action_204 (66) = happyShift action_65
action_204 (67) = happyShift action_66
action_204 (68) = happyShift action_67
action_204 (69) = happyShift action_68
action_204 (70) = happyShift action_69
action_204 _ = happyReduce_21

action_205 (39) = happyShift action_22
action_205 (40) = happyShift action_23
action_205 (41) = happyShift action_24
action_205 (48) = happyShift action_25
action_205 (49) = happyShift action_26
action_205 (52) = happyShift action_27
action_205 (55) = happyShift action_28
action_205 (62) = happyShift action_29
action_205 (63) = happyShift action_30
action_205 (64) = happyShift action_31
action_205 (65) = happyShift action_32
action_205 (73) = happyShift action_33
action_205 (75) = happyShift action_34
action_205 (20) = happyGoto action_213
action_205 (21) = happyGoto action_21
action_205 _ = happyFail (happyExpListPerState 205)

action_206 (66) = happyShift action_65
action_206 (67) = happyShift action_66
action_206 (68) = happyShift action_67
action_206 (69) = happyShift action_68
action_206 (70) = happyShift action_69
action_206 (74) = happyShift action_212
action_206 _ = happyFail (happyExpListPerState 206)

action_207 _ = happyReduce_62

action_208 (39) = happyShift action_162
action_208 (40) = happyShift action_163
action_208 (82) = happyShift action_164
action_208 (28) = happyGoto action_195
action_208 (29) = happyGoto action_211
action_208 _ = happyReduce_63

action_209 _ = happyReduce_29

action_210 _ = happyReduce_83

action_211 _ = happyReduce_64

action_212 _ = happyReduce_34

action_213 (66) = happyShift action_65
action_213 (67) = happyShift action_66
action_213 (68) = happyShift action_67
action_213 (69) = happyShift action_68
action_213 (70) = happyShift action_69
action_213 _ = happyReduce_20

happyReduce_1 = happyReduce 8 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mode happy_var_2 happy_var_4 happy_var_5 happy_var_6 happy_var_7
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

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenCapId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (UserType happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  8 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  9 happyReduction_8
happyReduction_8 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn9
		 (Variant happy_var_1 []
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn10  happy_var_2)
	(HappyTerminal (TokenCapIdC happy_var_1))
	 =  HappyAbsSyn9
		 (Variant happy_var_1 happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 11 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_0  12 happyReduction_13
happyReduction_13  =  HappyAbsSyn12
		 ([]
	)

happyReduce_14 = happySpecReduce_2  12 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 5 13 happyReduction_15
happyReduction_15 ((HappyAbsSyn20  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (MState happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  14 happyReduction_16
happyReduction_16 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 15 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_0  16 happyReduction_18
happyReduction_18  =  HappyAbsSyn16
		 ([]
	)

happyReduce_19 = happySpecReduce_2  16 happyReduction_19
happyReduction_19 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 7 17 happyReduction_20
happyReduction_20 ((HappyAbsSyn20  happy_var_7) `HappyStk`
	(HappyAbsSyn33  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Func happy_var_1 happy_var_3 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 6 17 happyReduction_21
happyReduction_21 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	(HappyAbsSyn33  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Func happy_var_1 happy_var_2 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_0  18 happyReduction_22
happyReduction_22  =  HappyAbsSyn18
		 ([]
	)

happyReduce_23 = happySpecReduce_1  18 happyReduction_23
happyReduction_23 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  18 happyReduction_24
happyReduction_24 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  19 happyReduction_25
happyReduction_25 (HappyAbsSyn33  happy_var_3)
	_
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn19
		 (Param happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  20 happyReduction_26
happyReduction_26 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn20
		 (ExprLit happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 20 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprBlock happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 6 20 happyReduction_28
happyReduction_28 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 8 20 happyReduction_29
happyReduction_29 ((HappyAbsSyn20  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprFor happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  20 happyReduction_30
happyReduction_30 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprAssign happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  20 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn25  happy_var_2)
	(HappyTerminal (TokenIdC happy_var_1))
	 =  HappyAbsSyn20
		 (ExprCall happy_var_1 happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 5 20 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 6 20 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 9 20 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprUnOp (UnOpTransmute (Just (fromIntegral happy_var_3)) (Just (fromIntegral happy_var_5))) happy_var_8
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 7 20 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 7 20 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 7 20 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprUnOp (UnOpShrink (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_3  20 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  20 happyReduction_39
happyReduction_39 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  20 happyReduction_40
happyReduction_40 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  20 happyReduction_41
happyReduction_41 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  20 happyReduction_42
happyReduction_42 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  20 happyReduction_43
happyReduction_43 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn20
		 (ExprVar happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  20 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  20 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn20
		 (ExprVoid
	)

happyReduce_46 = happySpecReduce_1  21 happyReduction_46
happyReduction_46 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn21
		 (LValId happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happyReduce 4 21 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_0  22 happyReduction_48
happyReduction_48  =  HappyAbsSyn22
		 ([]
	)

happyReduce_49 = happySpecReduce_2  22 happyReduction_49
happyReduction_49 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1 : happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_0  23 happyReduction_50
happyReduction_50  =  HappyAbsSyn23
		 ([]
	)

happyReduce_51 = happySpecReduce_2  23 happyReduction_51
happyReduction_51 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1 : happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 6 24 happyReduction_52
happyReduction_52 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_0  25 happyReduction_53
happyReduction_53  =  HappyAbsSyn25
		 ([]
	)

happyReduce_54 = happySpecReduce_1  25 happyReduction_54
happyReduction_54 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  25 happyReduction_55
happyReduction_55 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1 : happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_0  26 happyReduction_56
happyReduction_56  =  HappyAbsSyn26
		 ([]
	)

happyReduce_57 = happySpecReduce_2  26 happyReduction_57
happyReduction_57 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 : happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  27 happyReduction_58
happyReduction_58 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ((happy_var_1, happy_var_3)
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  28 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn28
		 (PatWildcard
	)

happyReduce_60 = happySpecReduce_1  28 happyReduction_60
happyReduction_60 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn28
		 (PatLit happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  28 happyReduction_61
happyReduction_61 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn28
		 (PatData happy_var_1 []
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happyReduce 4 28 happyReduction_62
happyReduction_62 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_63 = happySpecReduce_0  29 happyReduction_63
happyReduction_63  =  HappyAbsSyn29
		 ([]
	)

happyReduce_64 = happySpecReduce_3  29 happyReduction_64
happyReduction_64 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1 : happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  30 happyReduction_65
happyReduction_65 _
	 =  HappyAbsSyn30
		 (PredLit True
	)

happyReduce_66 = happySpecReduce_1  30 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn30
		 (PredLit False
	)

happyReduce_67 = happySpecReduce_2  30 happyReduction_67
happyReduction_67 (HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_67 _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_3  30 happyReduction_68
happyReduction_68 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_68 _ _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  30 happyReduction_69
happyReduction_69 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  30 happyReduction_70
happyReduction_70 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn30
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  31 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn31
		 (CompEq
	)

happyReduce_72 = happySpecReduce_1  31 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn31
		 (CompNeq
	)

happyReduce_73 = happySpecReduce_1  31 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn31
		 (CompLe
	)

happyReduce_74 = happySpecReduce_1  31 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn31
		 (CompGe
	)

happyReduce_75 = happySpecReduce_1  31 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn31
		 (CompLeq
	)

happyReduce_76 = happySpecReduce_1  31 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn31
		 (CompGeq
	)

happyReduce_77 = happySpecReduce_1  31 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn31
		 (CompLeS
	)

happyReduce_78 = happySpecReduce_1  31 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn31
		 (CompGeS
	)

happyReduce_79 = happySpecReduce_1  31 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn31
		 (CompLeqS
	)

happyReduce_80 = happySpecReduce_1  31 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn31
		 (CompGeqS
	)

happyReduce_81 = happySpecReduce_1  32 happyReduction_81
happyReduction_81 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_81 _  = notHappyAtAll 

happyReduce_82 = happyReduce 4 33 happyReduction_82
happyReduction_82 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_83 = happyReduce 6 33 happyReduction_83
happyReduction_83 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_84 = happySpecReduce_2  33 happyReduction_84
happyReduction_84 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn33
		 (TypeUser happy_var_2
	)
happyReduction_84 _ _  = notHappyAtAll 

happyReduce_85 = happySpecReduce_1  33 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn33
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 93 93 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenMode -> cont 34;
	TokenState -> cont 35;
	TokenMain -> cont 36;
	TokenFunctions -> cont 37;
	TokenTypes -> cont 38;
	TokenInt happy_dollar_dollar -> cont 39;
	TokenId happy_dollar_dollar -> cont 40;
	TokenIdC happy_dollar_dollar -> cont 41;
	TokenCapId happy_dollar_dollar -> cont 42;
	TokenCapIdC happy_dollar_dollar -> cont 43;
	TokenVar -> cont 44;
	TokenBits -> cont 45;
	TokenRange -> cont 46;
	TokenData -> cont 47;
	TokenVoid -> cont 48;
	TokenIf -> cont 49;
	TokenThen -> cont 50;
	TokenElse -> cont 51;
	TokenFor -> cont 52;
	TokenTo -> cont 53;
	TokenDo -> cont 54;
	TokenMatch -> cont 55;
	TokenWith -> cont 56;
	TokenTrue -> cont 57;
	TokenFalse -> cont 58;
	TokenNot -> cont 59;
	TokenAnd -> cont 60;
	TokenOr -> cont 61;
	TokenTransmute -> cont 62;
	TokenShrink -> cont 63;
	TokenExtend -> cont 64;
	TokenSignExtend -> cont 65;
	TokenPlus -> cont 66;
	TokenMinus -> cont 67;
	TokenAmphersand -> cont 68;
	TokenPipe -> cont 69;
	TokenCaret -> cont 70;
	TokenEq -> cont 71;
	TokenNeq -> cont 72;
	TokenLParen -> cont 73;
	TokenRParen -> cont 74;
	TokenLBrace -> cont 75;
	TokenRBrace -> cont 76;
	TokenLBracket -> cont 77;
	TokenRBracket -> cont 78;
	TokenColon -> cont 79;
	TokenComma -> cont 80;
	TokenDot -> cont 81;
	TokenUnderscore -> cont 82;
	TokenRArrow -> cont 83;
	TokenLArrow -> cont 84;
	TokenLe -> cont 85;
	TokenGe -> cont 86;
	TokenLeq -> cont 87;
	TokenGeq -> cont 88;
	TokenLeS -> cont 89;
	TokenLeqS -> cont 90;
	TokenGeS -> cont 91;
	TokenGeqS -> cont 92;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 93 tk tks = happyError' (tks, explist)
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
