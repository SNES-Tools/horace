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
happyExpList = Happy_Data_Array.listArray (0,411) ([0,0,2,0,0,0,0,4096,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,4096,0,0,0,0,0,16,0,0,0,0,0,0,0,32,0,0,32768,0,0,0,0,0,64,0,0,0,0,0,0,0,64,0,0,0,1,0,0,0,0,256,0,0,0,0,0,12512,15369,160,0,0,0,0,0,8,0,0,4096,0,0,0,0,0,0,0,256,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63488,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,2176,0,0,49152,4705,16504,1,0,0,0,0,0,0,0,0,39024,7796,80,0,0,0,1,0,0,0,0,7168,33062,5127,0,0,0,0,0,512,0,0,0,0,0,16,0,0,0,0,32768,0,0,0,0,0,1024,0,0,0,37646,960,10,0,0,32768,0,0,0,0,0,0,0,1024,0,0,0,0,0,16,0,0,0,0,0,1,0,0,512,0,0,0,0,0,0,0,512,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,12512,15369,160,0,0,0,8,0,0,0,0,4096,0,0,0,0,0,0,32768,143,0,0,0,2,0,0,0,0,4096,0,0,0,0,0,128,0,0,0,0,0,4,0,0,0,0,0,4096,1984,0,0,0,0,0,64,0,0,0,0,61440,32775,127,0,0,128,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,42179,33011,2,0,0,0,0,248,2,0,0,0,0,64,0,0,0,18823,480,5,0,0,8192,0,0,0,0,0,25024,30738,320,0,0,0,37646,960,10,0,0,28672,1176,20510,0,0,0,50048,61476,640,0,0,0,9756,1921,20,0,0,57344,2352,41020,0,0,0,0,0,2048,0,0,0,0,0,1024,0,0,0,0,16384,0,0,0,57344,1,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,56,0,0,0,0,49152,5,0,0,0,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31744,0,0,0,28672,1176,20510,0,0,0,0,0,4127,0,0,0,0,0,0,0,0,57344,2352,41020,0,0,0,0,0,0,0,0,0,19512,3842,40,0,0,49152,53857,16505,1,0,0,3584,52883,2563,0,0,0,39024,7684,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57344,2352,41020,0,0,0,0,0,1024,0,0,0,0,0,1024,0,0,0,0,0,8,0,0,0,0,16384,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,18823,16352,5,0,0,0,0,16384,0,0,0,0,0,512,0,0,0,12,0,0,0,0,0,0,4096,0,0,0,256,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,128,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,1024,0,0,0,0,0,12512,15369,160,0,0,0,0,0,2,0,0,0,0,0,4,0,0,0,0,4096,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,0,0,0,0,0,0,0,8,0,0,0,0,16384,0,0,0,0,0,512,0,0,0,16,0,0,0,0,32768,1,0,256,0,0,0,64,248,0,0,0,0,49152,7,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,32769,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,32768,0,0,0,1920,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39024,7684,80,0,0,32768,9411,33008,2,0,0,0,0,8192,0,0,0,96,0,16384,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,2,0,0,50048,61476,640,0,0,0,9756,1921,20,0,0,57344,2352,41020,0,0,0,0,0,64,0,0,0,0,0,16,0,0,0,60,0,0,0,0,1024,0,0,0,0,0,0,0,1024,0,0,0,0,7936,0,0,0,0,0,32768,0,0,0,0,0,4096,0,0,0,1,0,0,0,0,0,0,0,0,0,0,15360,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,9756,1921,20,0,0,0,0,18368,0,0,0,0,0,574,0,0,0,0,61440,17,0,0,0,0,16384,0,0,0,1536,0,0,4,0,0,39024,7684,80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49156,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,25024,30738,320,0,0,0,0,31744,0,0,0,0,0,0,8,0,0,0,0,256,0,0,0,9756,1921,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3968,0,0,0,57344,1,0,0,0,0,39024,7684,80,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,49152,7,0,0,0,18823,480,5,0,0,0,0,4592,0,0,0,0,0,0,0,0,0,6,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1984,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","types_decl","type_list","type","type_cases","type_case","type_vars","state_decl","state_vars","state_var","main_decl","func_decl","func_list","func","params","param","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_state","type_reg","mode","state","main","funcs","types","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 91
        bit_end = (st Prelude.+ 1) Prelude.* 91
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..90]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (34) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (34) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (40) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (91) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (73) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (38) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_10
action_6 (11) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (73) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (40) = happyShift action_16
action_8 (6) = happyGoto action_14
action_8 (7) = happyGoto action_15
action_8 _ = happyReduce_3

action_9 (36) = happyShift action_13
action_9 (14) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (73) = happyShift action_11
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
action_13 (46) = happyShift action_25
action_13 (47) = happyShift action_26
action_13 (50) = happyShift action_27
action_13 (53) = happyShift action_28
action_13 (60) = happyShift action_29
action_13 (61) = happyShift action_30
action_13 (62) = happyShift action_31
action_13 (63) = happyShift action_32
action_13 (71) = happyShift action_33
action_13 (73) = happyShift action_34
action_13 (20) = happyGoto action_20
action_13 (21) = happyGoto action_21
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (74) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (40) = happyShift action_16
action_15 (6) = happyGoto action_18
action_15 (7) = happyGoto action_15
action_15 _ = happyReduce_3

action_16 (73) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (40) = happyShift action_72
action_17 (8) = happyGoto action_70
action_17 (9) = happyGoto action_71
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_4

action_19 _ = happyReduce_2

action_20 (64) = happyShift action_65
action_20 (65) = happyShift action_66
action_20 (66) = happyShift action_67
action_20 (67) = happyShift action_68
action_20 (68) = happyShift action_69
action_20 _ = happyReduce_16

action_21 (82) = happyShift action_64
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_26

action_23 (75) = happyShift action_62
action_23 (79) = happyShift action_63
action_23 (82) = happyReduce_46
action_23 _ = happyReduce_43

action_24 (39) = happyShift action_22
action_24 (40) = happyShift action_23
action_24 (41) = happyShift action_24
action_24 (46) = happyShift action_25
action_24 (47) = happyShift action_26
action_24 (50) = happyShift action_27
action_24 (53) = happyShift action_28
action_24 (60) = happyShift action_29
action_24 (61) = happyShift action_30
action_24 (62) = happyShift action_31
action_24 (63) = happyShift action_32
action_24 (71) = happyShift action_33
action_24 (73) = happyShift action_34
action_24 (20) = happyGoto action_60
action_24 (21) = happyGoto action_21
action_24 (25) = happyGoto action_61
action_24 _ = happyReduce_53

action_25 _ = happyReduce_45

action_26 (39) = happyShift action_22
action_26 (40) = happyShift action_23
action_26 (41) = happyShift action_24
action_26 (46) = happyShift action_25
action_26 (47) = happyShift action_26
action_26 (50) = happyShift action_27
action_26 (53) = happyShift action_28
action_26 (55) = happyShift action_57
action_26 (56) = happyShift action_58
action_26 (57) = happyShift action_59
action_26 (60) = happyShift action_29
action_26 (61) = happyShift action_30
action_26 (62) = happyShift action_31
action_26 (63) = happyShift action_32
action_26 (71) = happyShift action_33
action_26 (73) = happyShift action_34
action_26 (20) = happyGoto action_55
action_26 (21) = happyGoto action_21
action_26 (30) = happyGoto action_56
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (40) = happyShift action_54
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (39) = happyShift action_22
action_28 (40) = happyShift action_23
action_28 (41) = happyShift action_24
action_28 (46) = happyShift action_25
action_28 (47) = happyShift action_26
action_28 (50) = happyShift action_27
action_28 (53) = happyShift action_28
action_28 (60) = happyShift action_29
action_28 (61) = happyShift action_30
action_28 (62) = happyShift action_31
action_28 (63) = happyShift action_32
action_28 (71) = happyShift action_33
action_28 (73) = happyShift action_34
action_28 (20) = happyGoto action_53
action_28 (21) = happyGoto action_21
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (75) = happyShift action_52
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (75) = happyShift action_51
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (75) = happyShift action_50
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (75) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (39) = happyShift action_22
action_33 (40) = happyShift action_23
action_33 (41) = happyShift action_24
action_33 (46) = happyShift action_25
action_33 (47) = happyShift action_26
action_33 (50) = happyShift action_27
action_33 (53) = happyShift action_28
action_33 (60) = happyShift action_29
action_33 (61) = happyShift action_30
action_33 (62) = happyShift action_31
action_33 (63) = happyShift action_32
action_33 (71) = happyShift action_33
action_33 (73) = happyShift action_34
action_33 (20) = happyGoto action_48
action_33 (21) = happyGoto action_21
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (42) = happyShift action_47
action_34 (23) = happyGoto action_45
action_34 (24) = happyGoto action_46
action_34 _ = happyReduce_50

action_35 (74) = happyShift action_44
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (73) = happyShift action_43
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (74) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (40) = happyShift action_39
action_38 (12) = happyGoto action_41
action_38 (13) = happyGoto action_38
action_38 _ = happyReduce_13

action_39 (77) = happyShift action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (43) = happyShift action_118
action_40 (44) = happyShift action_119
action_40 (45) = happyShift action_120
action_40 (46) = happyShift action_121
action_40 (32) = happyGoto action_116
action_40 (33) = happyGoto action_117
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_14

action_42 _ = happyReduce_12

action_43 (40) = happyShift action_114
action_43 (41) = happyShift action_115
action_43 (16) = happyGoto action_112
action_43 (17) = happyGoto action_113
action_43 _ = happyReduce_18

action_44 _ = happyReduce_1

action_45 (39) = happyShift action_22
action_45 (40) = happyShift action_23
action_45 (41) = happyShift action_24
action_45 (46) = happyShift action_25
action_45 (47) = happyShift action_26
action_45 (50) = happyShift action_27
action_45 (53) = happyShift action_28
action_45 (60) = happyShift action_29
action_45 (61) = happyShift action_30
action_45 (62) = happyShift action_31
action_45 (63) = happyShift action_32
action_45 (71) = happyShift action_33
action_45 (73) = happyShift action_34
action_45 (20) = happyGoto action_110
action_45 (21) = happyGoto action_21
action_45 (22) = happyGoto action_111
action_45 _ = happyReduce_48

action_46 (42) = happyShift action_47
action_46 (23) = happyGoto action_109
action_46 (24) = happyGoto action_46
action_46 _ = happyReduce_50

action_47 (40) = happyShift action_108
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (64) = happyShift action_65
action_48 (65) = happyShift action_66
action_48 (66) = happyShift action_67
action_48 (67) = happyShift action_68
action_48 (68) = happyShift action_69
action_48 (72) = happyShift action_107
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (39) = happyShift action_106
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (39) = happyShift action_105
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_104
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (39) = happyShift action_103
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (54) = happyShift action_102
action_53 (64) = happyShift action_65
action_53 (65) = happyShift action_66
action_53 (66) = happyShift action_67
action_53 (67) = happyShift action_68
action_53 (68) = happyShift action_69
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (69) = happyShift action_101
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (64) = happyShift action_65
action_55 (65) = happyShift action_66
action_55 (66) = happyShift action_67
action_55 (67) = happyShift action_68
action_55 (68) = happyShift action_69
action_55 (69) = happyShift action_91
action_55 (70) = happyShift action_92
action_55 (83) = happyShift action_93
action_55 (84) = happyShift action_94
action_55 (85) = happyShift action_95
action_55 (86) = happyShift action_96
action_55 (87) = happyShift action_97
action_55 (88) = happyShift action_98
action_55 (89) = happyShift action_99
action_55 (90) = happyShift action_100
action_55 (31) = happyGoto action_90
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (48) = happyShift action_87
action_56 (58) = happyShift action_88
action_56 (59) = happyShift action_89
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_65

action_58 _ = happyReduce_66

action_59 (39) = happyShift action_22
action_59 (40) = happyShift action_23
action_59 (41) = happyShift action_24
action_59 (46) = happyShift action_25
action_59 (47) = happyShift action_26
action_59 (50) = happyShift action_27
action_59 (53) = happyShift action_28
action_59 (55) = happyShift action_57
action_59 (56) = happyShift action_58
action_59 (57) = happyShift action_59
action_59 (60) = happyShift action_29
action_59 (61) = happyShift action_30
action_59 (62) = happyShift action_31
action_59 (63) = happyShift action_32
action_59 (71) = happyShift action_33
action_59 (73) = happyShift action_34
action_59 (20) = happyGoto action_55
action_59 (21) = happyGoto action_21
action_59 (30) = happyGoto action_86
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (64) = happyShift action_65
action_60 (65) = happyShift action_66
action_60 (66) = happyShift action_67
action_60 (67) = happyShift action_68
action_60 (68) = happyShift action_69
action_60 (78) = happyShift action_85
action_60 _ = happyReduce_54

action_61 (72) = happyShift action_84
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (39) = happyShift action_22
action_62 (40) = happyShift action_23
action_62 (41) = happyShift action_24
action_62 (46) = happyShift action_25
action_62 (47) = happyShift action_26
action_62 (50) = happyShift action_27
action_62 (53) = happyShift action_28
action_62 (60) = happyShift action_29
action_62 (61) = happyShift action_30
action_62 (62) = happyShift action_31
action_62 (63) = happyShift action_32
action_62 (71) = happyShift action_33
action_62 (73) = happyShift action_34
action_62 (20) = happyGoto action_83
action_62 (21) = happyGoto action_21
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (41) = happyShift action_82
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_22
action_64 (40) = happyShift action_23
action_64 (41) = happyShift action_24
action_64 (46) = happyShift action_25
action_64 (47) = happyShift action_26
action_64 (50) = happyShift action_27
action_64 (53) = happyShift action_28
action_64 (60) = happyShift action_29
action_64 (61) = happyShift action_30
action_64 (62) = happyShift action_31
action_64 (63) = happyShift action_32
action_64 (71) = happyShift action_33
action_64 (73) = happyShift action_34
action_64 (20) = happyGoto action_81
action_64 (21) = happyGoto action_21
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (39) = happyShift action_22
action_65 (40) = happyShift action_23
action_65 (41) = happyShift action_24
action_65 (46) = happyShift action_25
action_65 (47) = happyShift action_26
action_65 (50) = happyShift action_27
action_65 (53) = happyShift action_28
action_65 (60) = happyShift action_29
action_65 (61) = happyShift action_30
action_65 (62) = happyShift action_31
action_65 (63) = happyShift action_32
action_65 (71) = happyShift action_33
action_65 (73) = happyShift action_34
action_65 (20) = happyGoto action_80
action_65 (21) = happyGoto action_21
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (39) = happyShift action_22
action_66 (40) = happyShift action_23
action_66 (41) = happyShift action_24
action_66 (46) = happyShift action_25
action_66 (47) = happyShift action_26
action_66 (50) = happyShift action_27
action_66 (53) = happyShift action_28
action_66 (60) = happyShift action_29
action_66 (61) = happyShift action_30
action_66 (62) = happyShift action_31
action_66 (63) = happyShift action_32
action_66 (71) = happyShift action_33
action_66 (73) = happyShift action_34
action_66 (20) = happyGoto action_79
action_66 (21) = happyGoto action_21
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (39) = happyShift action_22
action_67 (40) = happyShift action_23
action_67 (41) = happyShift action_24
action_67 (46) = happyShift action_25
action_67 (47) = happyShift action_26
action_67 (50) = happyShift action_27
action_67 (53) = happyShift action_28
action_67 (60) = happyShift action_29
action_67 (61) = happyShift action_30
action_67 (62) = happyShift action_31
action_67 (63) = happyShift action_32
action_67 (71) = happyShift action_33
action_67 (73) = happyShift action_34
action_67 (20) = happyGoto action_78
action_67 (21) = happyGoto action_21
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (39) = happyShift action_22
action_68 (40) = happyShift action_23
action_68 (41) = happyShift action_24
action_68 (46) = happyShift action_25
action_68 (47) = happyShift action_26
action_68 (50) = happyShift action_27
action_68 (53) = happyShift action_28
action_68 (60) = happyShift action_29
action_68 (61) = happyShift action_30
action_68 (62) = happyShift action_31
action_68 (63) = happyShift action_32
action_68 (71) = happyShift action_33
action_68 (73) = happyShift action_34
action_68 (20) = happyGoto action_77
action_68 (21) = happyGoto action_21
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_22
action_69 (40) = happyShift action_23
action_69 (41) = happyShift action_24
action_69 (46) = happyShift action_25
action_69 (47) = happyShift action_26
action_69 (50) = happyShift action_27
action_69 (53) = happyShift action_28
action_69 (60) = happyShift action_29
action_69 (61) = happyShift action_30
action_69 (62) = happyShift action_31
action_69 (63) = happyShift action_32
action_69 (71) = happyShift action_33
action_69 (73) = happyShift action_34
action_69 (20) = happyGoto action_76
action_69 (21) = happyGoto action_21
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (74) = happyShift action_75
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (78) = happyShift action_74
action_71 _ = happyReduce_6

action_72 (71) = happyShift action_73
action_72 _ = happyReduce_8

action_73 (43) = happyShift action_118
action_73 (44) = happyShift action_119
action_73 (45) = happyShift action_120
action_73 (46) = happyShift action_121
action_73 (10) = happyGoto action_149
action_73 (33) = happyGoto action_150
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (40) = happyShift action_72
action_74 (8) = happyGoto action_148
action_74 (9) = happyGoto action_71
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_5

action_76 (64) = happyShift action_65
action_76 (65) = happyShift action_66
action_76 (66) = happyShift action_67
action_76 _ = happyReduce_41

action_77 (64) = happyShift action_65
action_77 (65) = happyShift action_66
action_77 (66) = happyShift action_67
action_77 (68) = happyShift action_69
action_77 _ = happyReduce_42

action_78 (64) = happyShift action_65
action_78 (65) = happyShift action_66
action_78 _ = happyReduce_40

action_79 _ = happyReduce_39

action_80 _ = happyReduce_38

action_81 (64) = happyShift action_65
action_81 (65) = happyShift action_66
action_81 (66) = happyShift action_67
action_81 (67) = happyShift action_68
action_81 (68) = happyShift action_69
action_81 _ = happyReduce_30

action_82 (39) = happyShift action_22
action_82 (40) = happyShift action_23
action_82 (41) = happyShift action_24
action_82 (46) = happyShift action_25
action_82 (47) = happyShift action_26
action_82 (50) = happyShift action_27
action_82 (53) = happyShift action_28
action_82 (60) = happyShift action_29
action_82 (61) = happyShift action_30
action_82 (62) = happyShift action_31
action_82 (63) = happyShift action_32
action_82 (71) = happyShift action_33
action_82 (73) = happyShift action_34
action_82 (20) = happyGoto action_60
action_82 (21) = happyGoto action_21
action_82 (25) = happyGoto action_147
action_82 _ = happyReduce_53

action_83 (64) = happyShift action_65
action_83 (65) = happyShift action_66
action_83 (66) = happyShift action_67
action_83 (67) = happyShift action_68
action_83 (68) = happyShift action_69
action_83 (76) = happyShift action_146
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_31

action_85 (39) = happyShift action_22
action_85 (40) = happyShift action_23
action_85 (41) = happyShift action_24
action_85 (46) = happyShift action_25
action_85 (47) = happyShift action_26
action_85 (50) = happyShift action_27
action_85 (53) = happyShift action_28
action_85 (60) = happyShift action_29
action_85 (61) = happyShift action_30
action_85 (62) = happyShift action_31
action_85 (63) = happyShift action_32
action_85 (71) = happyShift action_33
action_85 (73) = happyShift action_34
action_85 (20) = happyGoto action_60
action_85 (21) = happyGoto action_21
action_85 (25) = happyGoto action_145
action_85 _ = happyReduce_53

action_86 _ = happyReduce_67

action_87 (39) = happyShift action_22
action_87 (40) = happyShift action_23
action_87 (41) = happyShift action_24
action_87 (46) = happyShift action_25
action_87 (47) = happyShift action_26
action_87 (50) = happyShift action_27
action_87 (53) = happyShift action_28
action_87 (60) = happyShift action_29
action_87 (61) = happyShift action_30
action_87 (62) = happyShift action_31
action_87 (63) = happyShift action_32
action_87 (71) = happyShift action_33
action_87 (73) = happyShift action_34
action_87 (20) = happyGoto action_144
action_87 (21) = happyGoto action_21
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (39) = happyShift action_22
action_88 (40) = happyShift action_23
action_88 (41) = happyShift action_24
action_88 (46) = happyShift action_25
action_88 (47) = happyShift action_26
action_88 (50) = happyShift action_27
action_88 (53) = happyShift action_28
action_88 (55) = happyShift action_57
action_88 (56) = happyShift action_58
action_88 (57) = happyShift action_59
action_88 (60) = happyShift action_29
action_88 (61) = happyShift action_30
action_88 (62) = happyShift action_31
action_88 (63) = happyShift action_32
action_88 (71) = happyShift action_33
action_88 (73) = happyShift action_34
action_88 (20) = happyGoto action_55
action_88 (21) = happyGoto action_21
action_88 (30) = happyGoto action_143
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (39) = happyShift action_22
action_89 (40) = happyShift action_23
action_89 (41) = happyShift action_24
action_89 (46) = happyShift action_25
action_89 (47) = happyShift action_26
action_89 (50) = happyShift action_27
action_89 (53) = happyShift action_28
action_89 (55) = happyShift action_57
action_89 (56) = happyShift action_58
action_89 (57) = happyShift action_59
action_89 (60) = happyShift action_29
action_89 (61) = happyShift action_30
action_89 (62) = happyShift action_31
action_89 (63) = happyShift action_32
action_89 (71) = happyShift action_33
action_89 (73) = happyShift action_34
action_89 (20) = happyGoto action_55
action_89 (21) = happyGoto action_21
action_89 (30) = happyGoto action_142
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (39) = happyShift action_22
action_90 (40) = happyShift action_23
action_90 (41) = happyShift action_24
action_90 (46) = happyShift action_25
action_90 (47) = happyShift action_26
action_90 (50) = happyShift action_27
action_90 (53) = happyShift action_28
action_90 (60) = happyShift action_29
action_90 (61) = happyShift action_30
action_90 (62) = happyShift action_31
action_90 (63) = happyShift action_32
action_90 (71) = happyShift action_33
action_90 (73) = happyShift action_34
action_90 (20) = happyGoto action_141
action_90 (21) = happyGoto action_21
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_71

action_92 _ = happyReduce_72

action_93 _ = happyReduce_73

action_94 _ = happyReduce_74

action_95 _ = happyReduce_75

action_96 _ = happyReduce_76

action_97 _ = happyReduce_77

action_98 _ = happyReduce_79

action_99 _ = happyReduce_78

action_100 _ = happyReduce_80

action_101 (39) = happyShift action_22
action_101 (40) = happyShift action_23
action_101 (41) = happyShift action_24
action_101 (46) = happyShift action_25
action_101 (47) = happyShift action_26
action_101 (50) = happyShift action_27
action_101 (53) = happyShift action_28
action_101 (60) = happyShift action_29
action_101 (61) = happyShift action_30
action_101 (62) = happyShift action_31
action_101 (63) = happyShift action_32
action_101 (71) = happyShift action_33
action_101 (73) = happyShift action_34
action_101 (20) = happyGoto action_140
action_101 (21) = happyGoto action_21
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (73) = happyShift action_139
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (78) = happyShift action_138
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (76) = happyShift action_137
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (76) = happyShift action_136
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (76) = happyShift action_135
action_106 _ = happyFail (happyExpListPerState 106)

action_107 _ = happyReduce_44

action_108 (77) = happyShift action_134
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_51

action_110 (39) = happyShift action_22
action_110 (40) = happyShift action_23
action_110 (41) = happyShift action_24
action_110 (46) = happyShift action_25
action_110 (47) = happyShift action_26
action_110 (50) = happyShift action_27
action_110 (53) = happyShift action_28
action_110 (60) = happyShift action_29
action_110 (61) = happyShift action_30
action_110 (62) = happyShift action_31
action_110 (63) = happyShift action_32
action_110 (64) = happyShift action_65
action_110 (65) = happyShift action_66
action_110 (66) = happyShift action_67
action_110 (67) = happyShift action_68
action_110 (68) = happyShift action_69
action_110 (71) = happyShift action_33
action_110 (73) = happyShift action_34
action_110 (20) = happyGoto action_110
action_110 (21) = happyGoto action_21
action_110 (22) = happyGoto action_133
action_110 _ = happyReduce_48

action_111 (74) = happyShift action_132
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (74) = happyShift action_131
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (40) = happyShift action_114
action_113 (41) = happyShift action_115
action_113 (16) = happyGoto action_130
action_113 (17) = happyGoto action_113
action_113 _ = happyReduce_18

action_114 (71) = happyShift action_129
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (40) = happyShift action_128
action_115 (18) = happyGoto action_126
action_115 (19) = happyGoto action_127
action_115 _ = happyReduce_22

action_116 (69) = happyShift action_125
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_81

action_118 (75) = happyShift action_124
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (75) = happyShift action_123
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (40) = happyShift action_122
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_85

action_122 _ = happyReduce_84

action_123 (39) = happyShift action_173
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (39) = happyShift action_172
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (39) = happyShift action_22
action_125 (40) = happyShift action_23
action_125 (41) = happyShift action_24
action_125 (46) = happyShift action_25
action_125 (47) = happyShift action_26
action_125 (50) = happyShift action_27
action_125 (53) = happyShift action_28
action_125 (60) = happyShift action_29
action_125 (61) = happyShift action_30
action_125 (62) = happyShift action_31
action_125 (63) = happyShift action_32
action_125 (71) = happyShift action_33
action_125 (73) = happyShift action_34
action_125 (20) = happyGoto action_171
action_125 (21) = happyGoto action_21
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (72) = happyShift action_170
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (78) = happyShift action_169
action_127 _ = happyReduce_23

action_128 (77) = happyShift action_168
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (40) = happyShift action_128
action_129 (18) = happyGoto action_167
action_129 (19) = happyGoto action_127
action_129 _ = happyReduce_22

action_130 _ = happyReduce_19

action_131 _ = happyReduce_17

action_132 _ = happyReduce_27

action_133 _ = happyReduce_49

action_134 (43) = happyShift action_118
action_134 (44) = happyShift action_119
action_134 (45) = happyShift action_120
action_134 (46) = happyShift action_121
action_134 (33) = happyGoto action_166
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (71) = happyShift action_165
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (71) = happyShift action_164
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (71) = happyShift action_163
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (39) = happyShift action_162
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (39) = happyShift action_159
action_139 (40) = happyShift action_160
action_139 (80) = happyShift action_161
action_139 (26) = happyGoto action_156
action_139 (27) = happyGoto action_157
action_139 (28) = happyGoto action_158
action_139 _ = happyReduce_56

action_140 (51) = happyShift action_155
action_140 (64) = happyShift action_65
action_140 (65) = happyShift action_66
action_140 (66) = happyShift action_67
action_140 (67) = happyShift action_68
action_140 (68) = happyShift action_69
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (64) = happyShift action_65
action_141 (65) = happyShift action_66
action_141 (66) = happyShift action_67
action_141 (67) = happyShift action_68
action_141 (68) = happyShift action_69
action_141 _ = happyReduce_70

action_142 (58) = happyShift action_88
action_142 _ = happyReduce_69

action_143 _ = happyReduce_68

action_144 (49) = happyShift action_154
action_144 (64) = happyShift action_65
action_144 (65) = happyShift action_66
action_144 (66) = happyShift action_67
action_144 (67) = happyShift action_68
action_144 (68) = happyShift action_69
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_55

action_146 _ = happyReduce_47

action_147 (72) = happyShift action_153
action_147 _ = happyFail (happyExpListPerState 147)

action_148 _ = happyReduce_7

action_149 (72) = happyShift action_152
action_149 _ = happyFail (happyExpListPerState 149)

action_150 (78) = happyShift action_151
action_150 _ = happyReduce_10

action_151 (43) = happyShift action_118
action_151 (44) = happyShift action_119
action_151 (45) = happyShift action_120
action_151 (46) = happyShift action_121
action_151 (10) = happyGoto action_191
action_151 (33) = happyGoto action_150
action_151 _ = happyFail (happyExpListPerState 151)

action_152 _ = happyReduce_9

action_153 _ = happyReduce_32

action_154 (39) = happyShift action_22
action_154 (40) = happyShift action_23
action_154 (41) = happyShift action_24
action_154 (46) = happyShift action_25
action_154 (47) = happyShift action_26
action_154 (50) = happyShift action_27
action_154 (53) = happyShift action_28
action_154 (60) = happyShift action_29
action_154 (61) = happyShift action_30
action_154 (62) = happyShift action_31
action_154 (63) = happyShift action_32
action_154 (71) = happyShift action_33
action_154 (73) = happyShift action_34
action_154 (20) = happyGoto action_190
action_154 (21) = happyGoto action_21
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (39) = happyShift action_22
action_155 (40) = happyShift action_23
action_155 (41) = happyShift action_24
action_155 (46) = happyShift action_25
action_155 (47) = happyShift action_26
action_155 (50) = happyShift action_27
action_155 (53) = happyShift action_28
action_155 (60) = happyShift action_29
action_155 (61) = happyShift action_30
action_155 (62) = happyShift action_31
action_155 (63) = happyShift action_32
action_155 (71) = happyShift action_33
action_155 (73) = happyShift action_34
action_155 (20) = happyGoto action_189
action_155 (21) = happyGoto action_21
action_155 _ = happyFail (happyExpListPerState 155)

action_156 (74) = happyShift action_188
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (39) = happyShift action_159
action_157 (40) = happyShift action_160
action_157 (80) = happyShift action_161
action_157 (26) = happyGoto action_187
action_157 (27) = happyGoto action_157
action_157 (28) = happyGoto action_158
action_157 _ = happyReduce_56

action_158 (81) = happyShift action_186
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_60

action_160 (71) = happyShift action_185
action_160 _ = happyReduce_61

action_161 _ = happyReduce_59

action_162 (76) = happyShift action_184
action_162 _ = happyFail (happyExpListPerState 162)

action_163 (39) = happyShift action_22
action_163 (40) = happyShift action_23
action_163 (41) = happyShift action_24
action_163 (46) = happyShift action_25
action_163 (47) = happyShift action_26
action_163 (50) = happyShift action_27
action_163 (53) = happyShift action_28
action_163 (60) = happyShift action_29
action_163 (61) = happyShift action_30
action_163 (62) = happyShift action_31
action_163 (63) = happyShift action_32
action_163 (71) = happyShift action_33
action_163 (73) = happyShift action_34
action_163 (20) = happyGoto action_183
action_163 (21) = happyGoto action_21
action_163 _ = happyFail (happyExpListPerState 163)

action_164 (39) = happyShift action_22
action_164 (40) = happyShift action_23
action_164 (41) = happyShift action_24
action_164 (46) = happyShift action_25
action_164 (47) = happyShift action_26
action_164 (50) = happyShift action_27
action_164 (53) = happyShift action_28
action_164 (60) = happyShift action_29
action_164 (61) = happyShift action_30
action_164 (62) = happyShift action_31
action_164 (63) = happyShift action_32
action_164 (71) = happyShift action_33
action_164 (73) = happyShift action_34
action_164 (20) = happyGoto action_182
action_164 (21) = happyGoto action_21
action_164 _ = happyFail (happyExpListPerState 164)

action_165 (39) = happyShift action_22
action_165 (40) = happyShift action_23
action_165 (41) = happyShift action_24
action_165 (46) = happyShift action_25
action_165 (47) = happyShift action_26
action_165 (50) = happyShift action_27
action_165 (53) = happyShift action_28
action_165 (60) = happyShift action_29
action_165 (61) = happyShift action_30
action_165 (62) = happyShift action_31
action_165 (63) = happyShift action_32
action_165 (71) = happyShift action_33
action_165 (73) = happyShift action_34
action_165 (20) = happyGoto action_181
action_165 (21) = happyGoto action_21
action_165 _ = happyFail (happyExpListPerState 165)

action_166 (69) = happyShift action_180
action_166 _ = happyFail (happyExpListPerState 166)

action_167 (72) = happyShift action_179
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (43) = happyShift action_118
action_168 (44) = happyShift action_119
action_168 (45) = happyShift action_120
action_168 (46) = happyShift action_121
action_168 (33) = happyGoto action_178
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (40) = happyShift action_128
action_169 (18) = happyGoto action_177
action_169 (19) = happyGoto action_127
action_169 _ = happyReduce_22

action_170 (77) = happyShift action_176
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (64) = happyShift action_65
action_171 (65) = happyShift action_66
action_171 (66) = happyShift action_67
action_171 (67) = happyShift action_68
action_171 (68) = happyShift action_69
action_171 _ = happyReduce_15

action_172 (76) = happyShift action_175
action_172 _ = happyFail (happyExpListPerState 172)

action_173 (78) = happyShift action_174
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (39) = happyShift action_203
action_174 _ = happyFail (happyExpListPerState 174)

action_175 _ = happyReduce_82

action_176 (43) = happyShift action_118
action_176 (44) = happyShift action_119
action_176 (45) = happyShift action_120
action_176 (46) = happyShift action_121
action_176 (33) = happyGoto action_202
action_176 _ = happyFail (happyExpListPerState 176)

action_177 _ = happyReduce_24

action_178 _ = happyReduce_25

action_179 (77) = happyShift action_201
action_179 _ = happyFail (happyExpListPerState 179)

action_180 (39) = happyShift action_22
action_180 (40) = happyShift action_23
action_180 (41) = happyShift action_24
action_180 (46) = happyShift action_25
action_180 (47) = happyShift action_26
action_180 (50) = happyShift action_27
action_180 (53) = happyShift action_28
action_180 (60) = happyShift action_29
action_180 (61) = happyShift action_30
action_180 (62) = happyShift action_31
action_180 (63) = happyShift action_32
action_180 (71) = happyShift action_33
action_180 (73) = happyShift action_34
action_180 (20) = happyGoto action_200
action_180 (21) = happyGoto action_21
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (64) = happyShift action_65
action_181 (65) = happyShift action_66
action_181 (66) = happyShift action_67
action_181 (67) = happyShift action_68
action_181 (68) = happyShift action_69
action_181 (72) = happyShift action_199
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (64) = happyShift action_65
action_182 (65) = happyShift action_66
action_182 (66) = happyShift action_67
action_182 (67) = happyShift action_68
action_182 (68) = happyShift action_69
action_182 (72) = happyShift action_198
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (64) = happyShift action_65
action_183 (65) = happyShift action_66
action_183 (66) = happyShift action_67
action_183 (67) = happyShift action_68
action_183 (68) = happyShift action_69
action_183 (72) = happyShift action_197
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (71) = happyShift action_196
action_184 _ = happyFail (happyExpListPerState 184)

action_185 (39) = happyShift action_159
action_185 (40) = happyShift action_160
action_185 (80) = happyShift action_161
action_185 (28) = happyGoto action_194
action_185 (29) = happyGoto action_195
action_185 _ = happyReduce_63

action_186 (39) = happyShift action_22
action_186 (40) = happyShift action_23
action_186 (41) = happyShift action_24
action_186 (46) = happyShift action_25
action_186 (47) = happyShift action_26
action_186 (50) = happyShift action_27
action_186 (53) = happyShift action_28
action_186 (60) = happyShift action_29
action_186 (61) = happyShift action_30
action_186 (62) = happyShift action_31
action_186 (63) = happyShift action_32
action_186 (71) = happyShift action_33
action_186 (73) = happyShift action_34
action_186 (20) = happyGoto action_193
action_186 (21) = happyGoto action_21
action_186 _ = happyFail (happyExpListPerState 186)

action_187 _ = happyReduce_57

action_188 _ = happyReduce_33

action_189 (52) = happyShift action_192
action_189 (64) = happyShift action_65
action_189 (65) = happyShift action_66
action_189 (66) = happyShift action_67
action_189 (67) = happyShift action_68
action_189 (68) = happyShift action_69
action_189 _ = happyFail (happyExpListPerState 189)

action_190 _ = happyReduce_28

action_191 _ = happyReduce_11

action_192 (39) = happyShift action_22
action_192 (40) = happyShift action_23
action_192 (41) = happyShift action_24
action_192 (46) = happyShift action_25
action_192 (47) = happyShift action_26
action_192 (50) = happyShift action_27
action_192 (53) = happyShift action_28
action_192 (60) = happyShift action_29
action_192 (61) = happyShift action_30
action_192 (62) = happyShift action_31
action_192 (63) = happyShift action_32
action_192 (71) = happyShift action_33
action_192 (73) = happyShift action_34
action_192 (20) = happyGoto action_210
action_192 (21) = happyGoto action_21
action_192 _ = happyFail (happyExpListPerState 192)

action_193 (64) = happyShift action_65
action_193 (65) = happyShift action_66
action_193 (66) = happyShift action_67
action_193 (67) = happyShift action_68
action_193 (68) = happyShift action_69
action_193 _ = happyReduce_58

action_194 (78) = happyShift action_209
action_194 _ = happyFail (happyExpListPerState 194)

action_195 (72) = happyShift action_208
action_195 _ = happyFail (happyExpListPerState 195)

action_196 (39) = happyShift action_22
action_196 (40) = happyShift action_23
action_196 (41) = happyShift action_24
action_196 (46) = happyShift action_25
action_196 (47) = happyShift action_26
action_196 (50) = happyShift action_27
action_196 (53) = happyShift action_28
action_196 (60) = happyShift action_29
action_196 (61) = happyShift action_30
action_196 (62) = happyShift action_31
action_196 (63) = happyShift action_32
action_196 (71) = happyShift action_33
action_196 (73) = happyShift action_34
action_196 (20) = happyGoto action_207
action_196 (21) = happyGoto action_21
action_196 _ = happyFail (happyExpListPerState 196)

action_197 _ = happyReduce_37

action_198 _ = happyReduce_35

action_199 _ = happyReduce_36

action_200 (64) = happyShift action_65
action_200 (65) = happyShift action_66
action_200 (66) = happyShift action_67
action_200 (67) = happyShift action_68
action_200 (68) = happyShift action_69
action_200 _ = happyReduce_52

action_201 (43) = happyShift action_118
action_201 (44) = happyShift action_119
action_201 (45) = happyShift action_120
action_201 (46) = happyShift action_121
action_201 (33) = happyGoto action_206
action_201 _ = happyFail (happyExpListPerState 201)

action_202 (39) = happyShift action_22
action_202 (40) = happyShift action_23
action_202 (41) = happyShift action_24
action_202 (46) = happyShift action_25
action_202 (47) = happyShift action_26
action_202 (50) = happyShift action_27
action_202 (53) = happyShift action_28
action_202 (60) = happyShift action_29
action_202 (61) = happyShift action_30
action_202 (62) = happyShift action_31
action_202 (63) = happyShift action_32
action_202 (71) = happyShift action_33
action_202 (73) = happyShift action_34
action_202 (20) = happyGoto action_205
action_202 (21) = happyGoto action_21
action_202 _ = happyFail (happyExpListPerState 202)

action_203 (76) = happyShift action_204
action_203 _ = happyFail (happyExpListPerState 203)

action_204 _ = happyReduce_83

action_205 (64) = happyShift action_65
action_205 (65) = happyShift action_66
action_205 (66) = happyShift action_67
action_205 (67) = happyShift action_68
action_205 (68) = happyShift action_69
action_205 _ = happyReduce_21

action_206 (39) = happyShift action_22
action_206 (40) = happyShift action_23
action_206 (41) = happyShift action_24
action_206 (46) = happyShift action_25
action_206 (47) = happyShift action_26
action_206 (50) = happyShift action_27
action_206 (53) = happyShift action_28
action_206 (60) = happyShift action_29
action_206 (61) = happyShift action_30
action_206 (62) = happyShift action_31
action_206 (63) = happyShift action_32
action_206 (71) = happyShift action_33
action_206 (73) = happyShift action_34
action_206 (20) = happyGoto action_213
action_206 (21) = happyGoto action_21
action_206 _ = happyFail (happyExpListPerState 206)

action_207 (64) = happyShift action_65
action_207 (65) = happyShift action_66
action_207 (66) = happyShift action_67
action_207 (67) = happyShift action_68
action_207 (68) = happyShift action_69
action_207 (72) = happyShift action_212
action_207 _ = happyFail (happyExpListPerState 207)

action_208 _ = happyReduce_62

action_209 (39) = happyShift action_159
action_209 (40) = happyShift action_160
action_209 (80) = happyShift action_161
action_209 (28) = happyGoto action_194
action_209 (29) = happyGoto action_211
action_209 _ = happyReduce_63

action_210 _ = happyReduce_29

action_211 _ = happyReduce_64

action_212 _ = happyReduce_34

action_213 (64) = happyShift action_65
action_213 (65) = happyShift action_66
action_213 (66) = happyShift action_67
action_213 (67) = happyShift action_68
action_213 (68) = happyShift action_69
action_213 _ = happyReduce_20

happyReduce_1 = happyReduce 8 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
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
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
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
happyReduction_8 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn9
		 (Variant happy_var_1 []
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Variant happy_var_1 happy_var_3
	) `HappyStk` happyRest

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
	action 91 91 notHappyAtAll (HappyState action) sts stk []

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
	TokenVar -> cont 42;
	TokenBits -> cont 43;
	TokenRange -> cont 44;
	TokenData -> cont 45;
	TokenVoid -> cont 46;
	TokenIf -> cont 47;
	TokenThen -> cont 48;
	TokenElse -> cont 49;
	TokenFor -> cont 50;
	TokenTo -> cont 51;
	TokenDo -> cont 52;
	TokenMatch -> cont 53;
	TokenWith -> cont 54;
	TokenTrue -> cont 55;
	TokenFalse -> cont 56;
	TokenNot -> cont 57;
	TokenAnd -> cont 58;
	TokenOr -> cont 59;
	TokenTransmute -> cont 60;
	TokenShrink -> cont 61;
	TokenExtend -> cont 62;
	TokenSignExtend -> cont 63;
	TokenPlus -> cont 64;
	TokenMinus -> cont 65;
	TokenAmphersand -> cont 66;
	TokenPipe -> cont 67;
	TokenCaret -> cont 68;
	TokenEq -> cont 69;
	TokenNeq -> cont 70;
	TokenLParen -> cont 71;
	TokenRParen -> cont 72;
	TokenLBrace -> cont 73;
	TokenRBrace -> cont 74;
	TokenLBracket -> cont 75;
	TokenRBracket -> cont 76;
	TokenColon -> cont 77;
	TokenComma -> cont 78;
	TokenDot -> cont 79;
	TokenUnderscore -> cont 80;
	TokenRArrow -> cont 81;
	TokenLArrow -> cont 82;
	TokenLe -> cont 83;
	TokenGe -> cont 84;
	TokenLeq -> cont 85;
	TokenGeq -> cont 86;
	TokenLeS -> cont 87;
	TokenLeqS -> cont 88;
	TokenGeS -> cont 89;
	TokenGeqS -> cont 90;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 91 tk tks = happyError' (tks, explist)
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
