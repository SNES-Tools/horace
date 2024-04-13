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
happyExpList = Happy_Data_Array.listArray (0,418) ([0,0,2,0,0,0,0,8192,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,2,0,0,0,0,1024,0,0,0,0,0,0,0,8192,0,0,0,512,0,0,0,0,32768,0,0,0,0,0,0,0,0,2,0,0,2048,0,0,0,0,0,16,0,0,0,0,0,19548,3842,40,0,0,0,0,0,4,0,0,8192,0,0,0,0,0,0,0,512,0,0,0,96,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,32768,8,0,0,50624,61476,640,0,0,0,19548,3842,40,0,0,0,0,0,0,0,0,23552,14924,10255,0,0,0,128,0,0,0,0,0,19548,3842,40,0,0,0,0,0,8,0,0,0,0,32768,0,0,0,0,0,2048,0,0,0,0,0,128,0,0,49152,9413,33008,2,0,0,32768,0,0,0,0,0,0,0,1024,0,0,0,0,0,32,0,0,0,0,0,4,0,0,2048,0,0,0,0,0,0,0,8192,0,0,0,1824,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,384,0,0,0,0,0,0,0,0,0,0,49152,9413,33008,2,0,0,32768,0,0,0,0,0,128,0,0,0,0,0,0,61440,17,0,0,16384,0,0,0,0,0,1024,0,0,0,0,0,64,0,0,0,0,0,4,0,0,0,0,0,16384,7936,0,0,0,0,0,512,0,0,0,0,0,127,2040,0,0,4096,192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,50624,62372,640,0,0,0,0,61440,1025,0,0,0,0,0,1,0,0,0,0,4096,0,0,0,50624,61476,640,0,0,0,16,0,0,0,0,49152,9413,33008,2,0,0,23552,588,10255,0,0,0,50624,61476,640,0,0,0,19548,3842,40,0,0,49152,9413,33008,2,0,0,23552,588,10255,0,0,0,0,0,1024,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,8192,7,0,0,0,0,0,0,256,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,28672,1,0,0,0,0,768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61440,1,0,0,49152,9413,33008,2,0,0,0,0,496,1,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,9413,33008,2,0,0,0,0,0,0,0,0,50624,61476,640,0,0,0,19548,3898,40,0,0,49152,42181,33011,2,0,0,23552,588,10255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,9413,33008,2,0,0,0,0,8192,0,0,0,0,0,16384,0,0,0,0,0,256,0,0,0,0,0,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,23552,588,10751,0,0,0,0,0,1024,0,0,0,0,0,64,0,0,32768,1,0,0,0,0,0,0,2048,0,0,0,128,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,23552,588,10255,0,0,0,0,0,256,0,0,0,0,0,1024,0,0,0,0,0,32,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,29184,0,0,0,0,0,0,0,8,0,0,0,0,32768,0,0,0,0,0,2048,0,0,0,64,0,0,0,0,0,12,0,4096,0,0,0,2048,7936,0,0,0,0,0,496,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,512,7936,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,64,0,0,0,0,0,1824,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,23552,588,10255,0,0,0,50624,61476,640,0,0,0,0,0,64,0,0,49152,0,0,256,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,1,0,0,50624,61476,640,0,0,0,19548,3842,40,0,0,49152,9413,33008,2,0,0,0,0,512,0,0,0,0,0,256,0,0,0,1824,0,0,0,0,32768,0,0,0,0,0,0,0,0,2,0,0,0,0,31,0,0,0,1824,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,19548,3842,40,0,0,0,0,7936,1,0,0,0,0,4592,0,0,0,0,0,287,0,0,0,0,0,8,0,0,49152,0,0,256,0,0,23552,588,10255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,7936,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,23552,588,10255,0,0,0,0,0,31,0,0,0,0,0,1024,0,0,0,0,0,1,0,0,23552,588,10255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,0,0,0,29184,0,0,0,0,0,19548,3842,40,0,0,0,0,7936,0,0,0,23552,588,10255,0,0,0,0,0,287,0,0,0,0,0,0,0,0,49152,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,496,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","mode_decl","types_decl","type_list","type","type_cases","type_case","type_vars","state_decl","state_vars","state_var","main_decl","func_decl","func_list","func","params","param","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_state","type_reg","mode","state","main","funcs","types","int","id","idc","Id","Idc","var","bits","range","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 92
        bit_end = (st Prelude.+ 1) Prelude.* 92
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..91]
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

action_3 (92) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (74) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (38) = happyShift action_7
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_10
action_6 (11) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (74) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (42) = happyShift action_16
action_8 (6) = happyGoto action_14
action_8 (7) = happyGoto action_15
action_8 _ = happyReduce_3

action_9 (36) = happyShift action_13
action_9 (14) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (74) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (40) = happyShift action_40
action_11 (12) = happyGoto action_38
action_11 (13) = happyGoto action_39
action_11 _ = happyReduce_13

action_12 (37) = happyShift action_37
action_12 (15) = happyGoto action_36
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (39) = happyShift action_22
action_13 (40) = happyShift action_23
action_13 (41) = happyShift action_24
action_13 (43) = happyShift action_25
action_13 (47) = happyShift action_26
action_13 (48) = happyShift action_27
action_13 (51) = happyShift action_28
action_13 (54) = happyShift action_29
action_13 (61) = happyShift action_30
action_13 (62) = happyShift action_31
action_13 (63) = happyShift action_32
action_13 (64) = happyShift action_33
action_13 (72) = happyShift action_34
action_13 (74) = happyShift action_35
action_13 (20) = happyGoto action_20
action_13 (21) = happyGoto action_21
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (75) = happyShift action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (42) = happyShift action_16
action_15 (6) = happyGoto action_18
action_15 (7) = happyGoto action_15
action_15 _ = happyReduce_3

action_16 (74) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (42) = happyShift action_74
action_17 (43) = happyShift action_75
action_17 (8) = happyGoto action_72
action_17 (9) = happyGoto action_73
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_4

action_19 _ = happyReduce_2

action_20 (65) = happyShift action_67
action_20 (66) = happyShift action_68
action_20 (67) = happyShift action_69
action_20 (68) = happyShift action_70
action_20 (69) = happyShift action_71
action_20 _ = happyReduce_16

action_21 (83) = happyShift action_66
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_26

action_23 (76) = happyShift action_64
action_23 (80) = happyShift action_65
action_23 (83) = happyReduce_47
action_23 _ = happyReduce_44

action_24 (39) = happyShift action_22
action_24 (40) = happyShift action_23
action_24 (41) = happyShift action_24
action_24 (43) = happyShift action_25
action_24 (47) = happyShift action_26
action_24 (48) = happyShift action_27
action_24 (51) = happyShift action_28
action_24 (54) = happyShift action_29
action_24 (61) = happyShift action_30
action_24 (62) = happyShift action_31
action_24 (63) = happyShift action_32
action_24 (64) = happyShift action_33
action_24 (72) = happyShift action_34
action_24 (74) = happyShift action_35
action_24 (20) = happyGoto action_61
action_24 (21) = happyGoto action_21
action_24 (25) = happyGoto action_63
action_24 _ = happyReduce_54

action_25 (39) = happyShift action_22
action_25 (40) = happyShift action_23
action_25 (41) = happyShift action_24
action_25 (43) = happyShift action_25
action_25 (47) = happyShift action_26
action_25 (48) = happyShift action_27
action_25 (51) = happyShift action_28
action_25 (54) = happyShift action_29
action_25 (61) = happyShift action_30
action_25 (62) = happyShift action_31
action_25 (63) = happyShift action_32
action_25 (64) = happyShift action_33
action_25 (72) = happyShift action_34
action_25 (74) = happyShift action_35
action_25 (20) = happyGoto action_61
action_25 (21) = happyGoto action_21
action_25 (25) = happyGoto action_62
action_25 _ = happyReduce_54

action_26 _ = happyReduce_46

action_27 (39) = happyShift action_22
action_27 (40) = happyShift action_23
action_27 (41) = happyShift action_24
action_27 (43) = happyShift action_25
action_27 (47) = happyShift action_26
action_27 (48) = happyShift action_27
action_27 (51) = happyShift action_28
action_27 (54) = happyShift action_29
action_27 (56) = happyShift action_58
action_27 (57) = happyShift action_59
action_27 (58) = happyShift action_60
action_27 (61) = happyShift action_30
action_27 (62) = happyShift action_31
action_27 (63) = happyShift action_32
action_27 (64) = happyShift action_33
action_27 (72) = happyShift action_34
action_27 (74) = happyShift action_35
action_27 (20) = happyGoto action_56
action_27 (21) = happyGoto action_21
action_27 (30) = happyGoto action_57
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (40) = happyShift action_55
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (39) = happyShift action_22
action_29 (40) = happyShift action_23
action_29 (41) = happyShift action_24
action_29 (43) = happyShift action_25
action_29 (47) = happyShift action_26
action_29 (48) = happyShift action_27
action_29 (51) = happyShift action_28
action_29 (54) = happyShift action_29
action_29 (61) = happyShift action_30
action_29 (62) = happyShift action_31
action_29 (63) = happyShift action_32
action_29 (64) = happyShift action_33
action_29 (72) = happyShift action_34
action_29 (74) = happyShift action_35
action_29 (20) = happyGoto action_54
action_29 (21) = happyGoto action_21
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (76) = happyShift action_53
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (76) = happyShift action_52
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (76) = happyShift action_51
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (76) = happyShift action_50
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (39) = happyShift action_22
action_34 (40) = happyShift action_23
action_34 (41) = happyShift action_24
action_34 (43) = happyShift action_25
action_34 (47) = happyShift action_26
action_34 (48) = happyShift action_27
action_34 (51) = happyShift action_28
action_34 (54) = happyShift action_29
action_34 (61) = happyShift action_30
action_34 (62) = happyShift action_31
action_34 (63) = happyShift action_32
action_34 (64) = happyShift action_33
action_34 (72) = happyShift action_34
action_34 (74) = happyShift action_35
action_34 (20) = happyGoto action_49
action_34 (21) = happyGoto action_21
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (44) = happyShift action_48
action_35 (23) = happyGoto action_46
action_35 (24) = happyGoto action_47
action_35 _ = happyReduce_51

action_36 (75) = happyShift action_45
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (74) = happyShift action_44
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (75) = happyShift action_43
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (40) = happyShift action_40
action_39 (12) = happyGoto action_42
action_39 (13) = happyGoto action_39
action_39 _ = happyReduce_13

action_40 (78) = happyShift action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (42) = happyShift action_78
action_41 (45) = happyShift action_79
action_41 (46) = happyShift action_80
action_41 (47) = happyShift action_81
action_41 (32) = happyGoto action_125
action_41 (33) = happyGoto action_126
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_14

action_43 _ = happyReduce_12

action_44 (40) = happyShift action_123
action_44 (41) = happyShift action_124
action_44 (16) = happyGoto action_121
action_44 (17) = happyGoto action_122
action_44 _ = happyReduce_18

action_45 _ = happyReduce_1

action_46 (39) = happyShift action_22
action_46 (40) = happyShift action_23
action_46 (41) = happyShift action_24
action_46 (43) = happyShift action_25
action_46 (47) = happyShift action_26
action_46 (48) = happyShift action_27
action_46 (51) = happyShift action_28
action_46 (54) = happyShift action_29
action_46 (61) = happyShift action_30
action_46 (62) = happyShift action_31
action_46 (63) = happyShift action_32
action_46 (64) = happyShift action_33
action_46 (72) = happyShift action_34
action_46 (74) = happyShift action_35
action_46 (20) = happyGoto action_119
action_46 (21) = happyGoto action_21
action_46 (22) = happyGoto action_120
action_46 _ = happyReduce_49

action_47 (44) = happyShift action_48
action_47 (23) = happyGoto action_118
action_47 (24) = happyGoto action_47
action_47 _ = happyReduce_51

action_48 (40) = happyShift action_117
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (65) = happyShift action_67
action_49 (66) = happyShift action_68
action_49 (67) = happyShift action_69
action_49 (68) = happyShift action_70
action_49 (69) = happyShift action_71
action_49 (73) = happyShift action_116
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (39) = happyShift action_115
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (39) = happyShift action_114
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (39) = happyShift action_113
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (39) = happyShift action_112
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (55) = happyShift action_111
action_54 (65) = happyShift action_67
action_54 (66) = happyShift action_68
action_54 (67) = happyShift action_69
action_54 (68) = happyShift action_70
action_54 (69) = happyShift action_71
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (70) = happyShift action_110
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (65) = happyShift action_67
action_56 (66) = happyShift action_68
action_56 (67) = happyShift action_69
action_56 (68) = happyShift action_70
action_56 (69) = happyShift action_71
action_56 (70) = happyShift action_100
action_56 (71) = happyShift action_101
action_56 (84) = happyShift action_102
action_56 (85) = happyShift action_103
action_56 (86) = happyShift action_104
action_56 (87) = happyShift action_105
action_56 (88) = happyShift action_106
action_56 (89) = happyShift action_107
action_56 (90) = happyShift action_108
action_56 (91) = happyShift action_109
action_56 (31) = happyGoto action_99
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (49) = happyShift action_96
action_57 (59) = happyShift action_97
action_57 (60) = happyShift action_98
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_66

action_59 _ = happyReduce_67

action_60 (39) = happyShift action_22
action_60 (40) = happyShift action_23
action_60 (41) = happyShift action_24
action_60 (43) = happyShift action_25
action_60 (47) = happyShift action_26
action_60 (48) = happyShift action_27
action_60 (51) = happyShift action_28
action_60 (54) = happyShift action_29
action_60 (56) = happyShift action_58
action_60 (57) = happyShift action_59
action_60 (58) = happyShift action_60
action_60 (61) = happyShift action_30
action_60 (62) = happyShift action_31
action_60 (63) = happyShift action_32
action_60 (64) = happyShift action_33
action_60 (72) = happyShift action_34
action_60 (74) = happyShift action_35
action_60 (20) = happyGoto action_56
action_60 (21) = happyGoto action_21
action_60 (30) = happyGoto action_95
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (65) = happyShift action_67
action_61 (66) = happyShift action_68
action_61 (67) = happyShift action_69
action_61 (68) = happyShift action_70
action_61 (69) = happyShift action_71
action_61 (79) = happyShift action_94
action_61 _ = happyReduce_55

action_62 (73) = happyShift action_93
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (73) = happyShift action_92
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (39) = happyShift action_22
action_64 (40) = happyShift action_23
action_64 (41) = happyShift action_24
action_64 (43) = happyShift action_25
action_64 (47) = happyShift action_26
action_64 (48) = happyShift action_27
action_64 (51) = happyShift action_28
action_64 (54) = happyShift action_29
action_64 (61) = happyShift action_30
action_64 (62) = happyShift action_31
action_64 (63) = happyShift action_32
action_64 (64) = happyShift action_33
action_64 (72) = happyShift action_34
action_64 (74) = happyShift action_35
action_64 (20) = happyGoto action_91
action_64 (21) = happyGoto action_21
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (41) = happyShift action_90
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (39) = happyShift action_22
action_66 (40) = happyShift action_23
action_66 (41) = happyShift action_24
action_66 (43) = happyShift action_25
action_66 (47) = happyShift action_26
action_66 (48) = happyShift action_27
action_66 (51) = happyShift action_28
action_66 (54) = happyShift action_29
action_66 (61) = happyShift action_30
action_66 (62) = happyShift action_31
action_66 (63) = happyShift action_32
action_66 (64) = happyShift action_33
action_66 (72) = happyShift action_34
action_66 (74) = happyShift action_35
action_66 (20) = happyGoto action_89
action_66 (21) = happyGoto action_21
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (39) = happyShift action_22
action_67 (40) = happyShift action_23
action_67 (41) = happyShift action_24
action_67 (43) = happyShift action_25
action_67 (47) = happyShift action_26
action_67 (48) = happyShift action_27
action_67 (51) = happyShift action_28
action_67 (54) = happyShift action_29
action_67 (61) = happyShift action_30
action_67 (62) = happyShift action_31
action_67 (63) = happyShift action_32
action_67 (64) = happyShift action_33
action_67 (72) = happyShift action_34
action_67 (74) = happyShift action_35
action_67 (20) = happyGoto action_88
action_67 (21) = happyGoto action_21
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (39) = happyShift action_22
action_68 (40) = happyShift action_23
action_68 (41) = happyShift action_24
action_68 (43) = happyShift action_25
action_68 (47) = happyShift action_26
action_68 (48) = happyShift action_27
action_68 (51) = happyShift action_28
action_68 (54) = happyShift action_29
action_68 (61) = happyShift action_30
action_68 (62) = happyShift action_31
action_68 (63) = happyShift action_32
action_68 (64) = happyShift action_33
action_68 (72) = happyShift action_34
action_68 (74) = happyShift action_35
action_68 (20) = happyGoto action_87
action_68 (21) = happyGoto action_21
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (39) = happyShift action_22
action_69 (40) = happyShift action_23
action_69 (41) = happyShift action_24
action_69 (43) = happyShift action_25
action_69 (47) = happyShift action_26
action_69 (48) = happyShift action_27
action_69 (51) = happyShift action_28
action_69 (54) = happyShift action_29
action_69 (61) = happyShift action_30
action_69 (62) = happyShift action_31
action_69 (63) = happyShift action_32
action_69 (64) = happyShift action_33
action_69 (72) = happyShift action_34
action_69 (74) = happyShift action_35
action_69 (20) = happyGoto action_86
action_69 (21) = happyGoto action_21
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (39) = happyShift action_22
action_70 (40) = happyShift action_23
action_70 (41) = happyShift action_24
action_70 (43) = happyShift action_25
action_70 (47) = happyShift action_26
action_70 (48) = happyShift action_27
action_70 (51) = happyShift action_28
action_70 (54) = happyShift action_29
action_70 (61) = happyShift action_30
action_70 (62) = happyShift action_31
action_70 (63) = happyShift action_32
action_70 (64) = happyShift action_33
action_70 (72) = happyShift action_34
action_70 (74) = happyShift action_35
action_70 (20) = happyGoto action_85
action_70 (21) = happyGoto action_21
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (39) = happyShift action_22
action_71 (40) = happyShift action_23
action_71 (41) = happyShift action_24
action_71 (43) = happyShift action_25
action_71 (47) = happyShift action_26
action_71 (48) = happyShift action_27
action_71 (51) = happyShift action_28
action_71 (54) = happyShift action_29
action_71 (61) = happyShift action_30
action_71 (62) = happyShift action_31
action_71 (63) = happyShift action_32
action_71 (64) = happyShift action_33
action_71 (72) = happyShift action_34
action_71 (74) = happyShift action_35
action_71 (20) = happyGoto action_84
action_71 (21) = happyGoto action_21
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (75) = happyShift action_83
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (79) = happyShift action_82
action_73 _ = happyReduce_6

action_74 _ = happyReduce_8

action_75 (42) = happyShift action_78
action_75 (45) = happyShift action_79
action_75 (46) = happyShift action_80
action_75 (47) = happyShift action_81
action_75 (10) = happyGoto action_76
action_75 (33) = happyGoto action_77
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (73) = happyShift action_154
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (79) = happyShift action_153
action_77 _ = happyReduce_10

action_78 _ = happyReduce_85

action_79 (76) = happyShift action_152
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (76) = happyShift action_151
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_86

action_82 (42) = happyShift action_74
action_82 (43) = happyShift action_75
action_82 (8) = happyGoto action_150
action_82 (9) = happyGoto action_73
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_5

action_84 (65) = happyShift action_67
action_84 (66) = happyShift action_68
action_84 (67) = happyShift action_69
action_84 _ = happyReduce_42

action_85 (65) = happyShift action_67
action_85 (66) = happyShift action_68
action_85 (67) = happyShift action_69
action_85 (69) = happyShift action_71
action_85 _ = happyReduce_43

action_86 (65) = happyShift action_67
action_86 (66) = happyShift action_68
action_86 _ = happyReduce_41

action_87 _ = happyReduce_40

action_88 _ = happyReduce_39

action_89 (65) = happyShift action_67
action_89 (66) = happyShift action_68
action_89 (67) = happyShift action_69
action_89 (68) = happyShift action_70
action_89 (69) = happyShift action_71
action_89 _ = happyReduce_30

action_90 (39) = happyShift action_22
action_90 (40) = happyShift action_23
action_90 (41) = happyShift action_24
action_90 (43) = happyShift action_25
action_90 (47) = happyShift action_26
action_90 (48) = happyShift action_27
action_90 (51) = happyShift action_28
action_90 (54) = happyShift action_29
action_90 (61) = happyShift action_30
action_90 (62) = happyShift action_31
action_90 (63) = happyShift action_32
action_90 (64) = happyShift action_33
action_90 (72) = happyShift action_34
action_90 (74) = happyShift action_35
action_90 (20) = happyGoto action_61
action_90 (21) = happyGoto action_21
action_90 (25) = happyGoto action_149
action_90 _ = happyReduce_54

action_91 (65) = happyShift action_67
action_91 (66) = happyShift action_68
action_91 (67) = happyShift action_69
action_91 (68) = happyShift action_70
action_91 (69) = happyShift action_71
action_91 (77) = happyShift action_148
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_31

action_93 _ = happyReduce_32

action_94 (39) = happyShift action_22
action_94 (40) = happyShift action_23
action_94 (41) = happyShift action_24
action_94 (43) = happyShift action_25
action_94 (47) = happyShift action_26
action_94 (48) = happyShift action_27
action_94 (51) = happyShift action_28
action_94 (54) = happyShift action_29
action_94 (61) = happyShift action_30
action_94 (62) = happyShift action_31
action_94 (63) = happyShift action_32
action_94 (64) = happyShift action_33
action_94 (72) = happyShift action_34
action_94 (74) = happyShift action_35
action_94 (20) = happyGoto action_61
action_94 (21) = happyGoto action_21
action_94 (25) = happyGoto action_147
action_94 _ = happyReduce_54

action_95 _ = happyReduce_68

action_96 (39) = happyShift action_22
action_96 (40) = happyShift action_23
action_96 (41) = happyShift action_24
action_96 (43) = happyShift action_25
action_96 (47) = happyShift action_26
action_96 (48) = happyShift action_27
action_96 (51) = happyShift action_28
action_96 (54) = happyShift action_29
action_96 (61) = happyShift action_30
action_96 (62) = happyShift action_31
action_96 (63) = happyShift action_32
action_96 (64) = happyShift action_33
action_96 (72) = happyShift action_34
action_96 (74) = happyShift action_35
action_96 (20) = happyGoto action_146
action_96 (21) = happyGoto action_21
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (39) = happyShift action_22
action_97 (40) = happyShift action_23
action_97 (41) = happyShift action_24
action_97 (43) = happyShift action_25
action_97 (47) = happyShift action_26
action_97 (48) = happyShift action_27
action_97 (51) = happyShift action_28
action_97 (54) = happyShift action_29
action_97 (56) = happyShift action_58
action_97 (57) = happyShift action_59
action_97 (58) = happyShift action_60
action_97 (61) = happyShift action_30
action_97 (62) = happyShift action_31
action_97 (63) = happyShift action_32
action_97 (64) = happyShift action_33
action_97 (72) = happyShift action_34
action_97 (74) = happyShift action_35
action_97 (20) = happyGoto action_56
action_97 (21) = happyGoto action_21
action_97 (30) = happyGoto action_145
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (39) = happyShift action_22
action_98 (40) = happyShift action_23
action_98 (41) = happyShift action_24
action_98 (43) = happyShift action_25
action_98 (47) = happyShift action_26
action_98 (48) = happyShift action_27
action_98 (51) = happyShift action_28
action_98 (54) = happyShift action_29
action_98 (56) = happyShift action_58
action_98 (57) = happyShift action_59
action_98 (58) = happyShift action_60
action_98 (61) = happyShift action_30
action_98 (62) = happyShift action_31
action_98 (63) = happyShift action_32
action_98 (64) = happyShift action_33
action_98 (72) = happyShift action_34
action_98 (74) = happyShift action_35
action_98 (20) = happyGoto action_56
action_98 (21) = happyGoto action_21
action_98 (30) = happyGoto action_144
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (39) = happyShift action_22
action_99 (40) = happyShift action_23
action_99 (41) = happyShift action_24
action_99 (43) = happyShift action_25
action_99 (47) = happyShift action_26
action_99 (48) = happyShift action_27
action_99 (51) = happyShift action_28
action_99 (54) = happyShift action_29
action_99 (61) = happyShift action_30
action_99 (62) = happyShift action_31
action_99 (63) = happyShift action_32
action_99 (64) = happyShift action_33
action_99 (72) = happyShift action_34
action_99 (74) = happyShift action_35
action_99 (20) = happyGoto action_143
action_99 (21) = happyGoto action_21
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_72

action_101 _ = happyReduce_73

action_102 _ = happyReduce_74

action_103 _ = happyReduce_75

action_104 _ = happyReduce_76

action_105 _ = happyReduce_77

action_106 _ = happyReduce_78

action_107 _ = happyReduce_80

action_108 _ = happyReduce_79

action_109 _ = happyReduce_81

action_110 (39) = happyShift action_22
action_110 (40) = happyShift action_23
action_110 (41) = happyShift action_24
action_110 (43) = happyShift action_25
action_110 (47) = happyShift action_26
action_110 (48) = happyShift action_27
action_110 (51) = happyShift action_28
action_110 (54) = happyShift action_29
action_110 (61) = happyShift action_30
action_110 (62) = happyShift action_31
action_110 (63) = happyShift action_32
action_110 (64) = happyShift action_33
action_110 (72) = happyShift action_34
action_110 (74) = happyShift action_35
action_110 (20) = happyGoto action_142
action_110 (21) = happyGoto action_21
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (74) = happyShift action_141
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (79) = happyShift action_140
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (77) = happyShift action_139
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (77) = happyShift action_138
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (77) = happyShift action_137
action_115 _ = happyFail (happyExpListPerState 115)

action_116 _ = happyReduce_45

action_117 (78) = happyShift action_136
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_52

action_119 (39) = happyShift action_22
action_119 (40) = happyShift action_23
action_119 (41) = happyShift action_24
action_119 (43) = happyShift action_25
action_119 (47) = happyShift action_26
action_119 (48) = happyShift action_27
action_119 (51) = happyShift action_28
action_119 (54) = happyShift action_29
action_119 (61) = happyShift action_30
action_119 (62) = happyShift action_31
action_119 (63) = happyShift action_32
action_119 (64) = happyShift action_33
action_119 (65) = happyShift action_67
action_119 (66) = happyShift action_68
action_119 (67) = happyShift action_69
action_119 (68) = happyShift action_70
action_119 (69) = happyShift action_71
action_119 (72) = happyShift action_34
action_119 (74) = happyShift action_35
action_119 (20) = happyGoto action_119
action_119 (21) = happyGoto action_21
action_119 (22) = happyGoto action_135
action_119 _ = happyReduce_49

action_120 (75) = happyShift action_134
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (75) = happyShift action_133
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (40) = happyShift action_123
action_122 (41) = happyShift action_124
action_122 (16) = happyGoto action_132
action_122 (17) = happyGoto action_122
action_122 _ = happyReduce_18

action_123 (72) = happyShift action_131
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (40) = happyShift action_130
action_124 (18) = happyGoto action_128
action_124 (19) = happyGoto action_129
action_124 _ = happyReduce_22

action_125 (70) = happyShift action_127
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_82

action_127 (39) = happyShift action_22
action_127 (40) = happyShift action_23
action_127 (41) = happyShift action_24
action_127 (43) = happyShift action_25
action_127 (47) = happyShift action_26
action_127 (48) = happyShift action_27
action_127 (51) = happyShift action_28
action_127 (54) = happyShift action_29
action_127 (61) = happyShift action_30
action_127 (62) = happyShift action_31
action_127 (63) = happyShift action_32
action_127 (64) = happyShift action_33
action_127 (72) = happyShift action_34
action_127 (74) = happyShift action_35
action_127 (20) = happyGoto action_176
action_127 (21) = happyGoto action_21
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (73) = happyShift action_175
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (79) = happyShift action_174
action_129 _ = happyReduce_23

action_130 (78) = happyShift action_173
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (40) = happyShift action_130
action_131 (18) = happyGoto action_172
action_131 (19) = happyGoto action_129
action_131 _ = happyReduce_22

action_132 _ = happyReduce_19

action_133 _ = happyReduce_17

action_134 _ = happyReduce_27

action_135 _ = happyReduce_50

action_136 (42) = happyShift action_78
action_136 (45) = happyShift action_79
action_136 (46) = happyShift action_80
action_136 (47) = happyShift action_81
action_136 (33) = happyGoto action_171
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (72) = happyShift action_170
action_137 _ = happyFail (happyExpListPerState 137)

action_138 (72) = happyShift action_169
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (72) = happyShift action_168
action_139 _ = happyFail (happyExpListPerState 139)

action_140 (39) = happyShift action_167
action_140 _ = happyFail (happyExpListPerState 140)

action_141 (39) = happyShift action_164
action_141 (40) = happyShift action_165
action_141 (81) = happyShift action_166
action_141 (26) = happyGoto action_161
action_141 (27) = happyGoto action_162
action_141 (28) = happyGoto action_163
action_141 _ = happyReduce_57

action_142 (52) = happyShift action_160
action_142 (65) = happyShift action_67
action_142 (66) = happyShift action_68
action_142 (67) = happyShift action_69
action_142 (68) = happyShift action_70
action_142 (69) = happyShift action_71
action_142 _ = happyFail (happyExpListPerState 142)

action_143 (65) = happyShift action_67
action_143 (66) = happyShift action_68
action_143 (67) = happyShift action_69
action_143 (68) = happyShift action_70
action_143 (69) = happyShift action_71
action_143 _ = happyReduce_71

action_144 (59) = happyShift action_97
action_144 _ = happyReduce_70

action_145 _ = happyReduce_69

action_146 (50) = happyShift action_159
action_146 (65) = happyShift action_67
action_146 (66) = happyShift action_68
action_146 (67) = happyShift action_69
action_146 (68) = happyShift action_70
action_146 (69) = happyShift action_71
action_146 _ = happyFail (happyExpListPerState 146)

action_147 _ = happyReduce_56

action_148 _ = happyReduce_48

action_149 (73) = happyShift action_158
action_149 _ = happyFail (happyExpListPerState 149)

action_150 _ = happyReduce_7

action_151 (39) = happyShift action_157
action_151 _ = happyFail (happyExpListPerState 151)

action_152 (39) = happyShift action_156
action_152 _ = happyFail (happyExpListPerState 152)

action_153 (42) = happyShift action_78
action_153 (45) = happyShift action_79
action_153 (46) = happyShift action_80
action_153 (47) = happyShift action_81
action_153 (10) = happyGoto action_155
action_153 (33) = happyGoto action_77
action_153 _ = happyFail (happyExpListPerState 153)

action_154 _ = happyReduce_9

action_155 _ = happyReduce_11

action_156 (77) = happyShift action_193
action_156 _ = happyFail (happyExpListPerState 156)

action_157 (79) = happyShift action_192
action_157 _ = happyFail (happyExpListPerState 157)

action_158 _ = happyReduce_33

action_159 (39) = happyShift action_22
action_159 (40) = happyShift action_23
action_159 (41) = happyShift action_24
action_159 (43) = happyShift action_25
action_159 (47) = happyShift action_26
action_159 (48) = happyShift action_27
action_159 (51) = happyShift action_28
action_159 (54) = happyShift action_29
action_159 (61) = happyShift action_30
action_159 (62) = happyShift action_31
action_159 (63) = happyShift action_32
action_159 (64) = happyShift action_33
action_159 (72) = happyShift action_34
action_159 (74) = happyShift action_35
action_159 (20) = happyGoto action_191
action_159 (21) = happyGoto action_21
action_159 _ = happyFail (happyExpListPerState 159)

action_160 (39) = happyShift action_22
action_160 (40) = happyShift action_23
action_160 (41) = happyShift action_24
action_160 (43) = happyShift action_25
action_160 (47) = happyShift action_26
action_160 (48) = happyShift action_27
action_160 (51) = happyShift action_28
action_160 (54) = happyShift action_29
action_160 (61) = happyShift action_30
action_160 (62) = happyShift action_31
action_160 (63) = happyShift action_32
action_160 (64) = happyShift action_33
action_160 (72) = happyShift action_34
action_160 (74) = happyShift action_35
action_160 (20) = happyGoto action_190
action_160 (21) = happyGoto action_21
action_160 _ = happyFail (happyExpListPerState 160)

action_161 (75) = happyShift action_189
action_161 _ = happyFail (happyExpListPerState 161)

action_162 (39) = happyShift action_164
action_162 (40) = happyShift action_165
action_162 (81) = happyShift action_166
action_162 (26) = happyGoto action_188
action_162 (27) = happyGoto action_162
action_162 (28) = happyGoto action_163
action_162 _ = happyReduce_57

action_163 (82) = happyShift action_187
action_163 _ = happyFail (happyExpListPerState 163)

action_164 _ = happyReduce_61

action_165 (72) = happyShift action_186
action_165 _ = happyReduce_62

action_166 _ = happyReduce_60

action_167 (77) = happyShift action_185
action_167 _ = happyFail (happyExpListPerState 167)

action_168 (39) = happyShift action_22
action_168 (40) = happyShift action_23
action_168 (41) = happyShift action_24
action_168 (43) = happyShift action_25
action_168 (47) = happyShift action_26
action_168 (48) = happyShift action_27
action_168 (51) = happyShift action_28
action_168 (54) = happyShift action_29
action_168 (61) = happyShift action_30
action_168 (62) = happyShift action_31
action_168 (63) = happyShift action_32
action_168 (64) = happyShift action_33
action_168 (72) = happyShift action_34
action_168 (74) = happyShift action_35
action_168 (20) = happyGoto action_184
action_168 (21) = happyGoto action_21
action_168 _ = happyFail (happyExpListPerState 168)

action_169 (39) = happyShift action_22
action_169 (40) = happyShift action_23
action_169 (41) = happyShift action_24
action_169 (43) = happyShift action_25
action_169 (47) = happyShift action_26
action_169 (48) = happyShift action_27
action_169 (51) = happyShift action_28
action_169 (54) = happyShift action_29
action_169 (61) = happyShift action_30
action_169 (62) = happyShift action_31
action_169 (63) = happyShift action_32
action_169 (64) = happyShift action_33
action_169 (72) = happyShift action_34
action_169 (74) = happyShift action_35
action_169 (20) = happyGoto action_183
action_169 (21) = happyGoto action_21
action_169 _ = happyFail (happyExpListPerState 169)

action_170 (39) = happyShift action_22
action_170 (40) = happyShift action_23
action_170 (41) = happyShift action_24
action_170 (43) = happyShift action_25
action_170 (47) = happyShift action_26
action_170 (48) = happyShift action_27
action_170 (51) = happyShift action_28
action_170 (54) = happyShift action_29
action_170 (61) = happyShift action_30
action_170 (62) = happyShift action_31
action_170 (63) = happyShift action_32
action_170 (64) = happyShift action_33
action_170 (72) = happyShift action_34
action_170 (74) = happyShift action_35
action_170 (20) = happyGoto action_182
action_170 (21) = happyGoto action_21
action_170 _ = happyFail (happyExpListPerState 170)

action_171 (70) = happyShift action_181
action_171 _ = happyFail (happyExpListPerState 171)

action_172 (73) = happyShift action_180
action_172 _ = happyFail (happyExpListPerState 172)

action_173 (42) = happyShift action_78
action_173 (45) = happyShift action_79
action_173 (46) = happyShift action_80
action_173 (47) = happyShift action_81
action_173 (33) = happyGoto action_179
action_173 _ = happyFail (happyExpListPerState 173)

action_174 (40) = happyShift action_130
action_174 (18) = happyGoto action_178
action_174 (19) = happyGoto action_129
action_174 _ = happyReduce_22

action_175 (78) = happyShift action_177
action_175 _ = happyFail (happyExpListPerState 175)

action_176 (65) = happyShift action_67
action_176 (66) = happyShift action_68
action_176 (67) = happyShift action_69
action_176 (68) = happyShift action_70
action_176 (69) = happyShift action_71
action_176 _ = happyReduce_15

action_177 (42) = happyShift action_78
action_177 (45) = happyShift action_79
action_177 (46) = happyShift action_80
action_177 (47) = happyShift action_81
action_177 (33) = happyGoto action_205
action_177 _ = happyFail (happyExpListPerState 177)

action_178 _ = happyReduce_24

action_179 _ = happyReduce_25

action_180 (78) = happyShift action_204
action_180 _ = happyFail (happyExpListPerState 180)

action_181 (39) = happyShift action_22
action_181 (40) = happyShift action_23
action_181 (41) = happyShift action_24
action_181 (43) = happyShift action_25
action_181 (47) = happyShift action_26
action_181 (48) = happyShift action_27
action_181 (51) = happyShift action_28
action_181 (54) = happyShift action_29
action_181 (61) = happyShift action_30
action_181 (62) = happyShift action_31
action_181 (63) = happyShift action_32
action_181 (64) = happyShift action_33
action_181 (72) = happyShift action_34
action_181 (74) = happyShift action_35
action_181 (20) = happyGoto action_203
action_181 (21) = happyGoto action_21
action_181 _ = happyFail (happyExpListPerState 181)

action_182 (65) = happyShift action_67
action_182 (66) = happyShift action_68
action_182 (67) = happyShift action_69
action_182 (68) = happyShift action_70
action_182 (69) = happyShift action_71
action_182 (73) = happyShift action_202
action_182 _ = happyFail (happyExpListPerState 182)

action_183 (65) = happyShift action_67
action_183 (66) = happyShift action_68
action_183 (67) = happyShift action_69
action_183 (68) = happyShift action_70
action_183 (69) = happyShift action_71
action_183 (73) = happyShift action_201
action_183 _ = happyFail (happyExpListPerState 183)

action_184 (65) = happyShift action_67
action_184 (66) = happyShift action_68
action_184 (67) = happyShift action_69
action_184 (68) = happyShift action_70
action_184 (69) = happyShift action_71
action_184 (73) = happyShift action_200
action_184 _ = happyFail (happyExpListPerState 184)

action_185 (72) = happyShift action_199
action_185 _ = happyFail (happyExpListPerState 185)

action_186 (39) = happyShift action_164
action_186 (40) = happyShift action_165
action_186 (81) = happyShift action_166
action_186 (28) = happyGoto action_197
action_186 (29) = happyGoto action_198
action_186 _ = happyReduce_64

action_187 (39) = happyShift action_22
action_187 (40) = happyShift action_23
action_187 (41) = happyShift action_24
action_187 (43) = happyShift action_25
action_187 (47) = happyShift action_26
action_187 (48) = happyShift action_27
action_187 (51) = happyShift action_28
action_187 (54) = happyShift action_29
action_187 (61) = happyShift action_30
action_187 (62) = happyShift action_31
action_187 (63) = happyShift action_32
action_187 (64) = happyShift action_33
action_187 (72) = happyShift action_34
action_187 (74) = happyShift action_35
action_187 (20) = happyGoto action_196
action_187 (21) = happyGoto action_21
action_187 _ = happyFail (happyExpListPerState 187)

action_188 _ = happyReduce_58

action_189 _ = happyReduce_34

action_190 (53) = happyShift action_195
action_190 (65) = happyShift action_67
action_190 (66) = happyShift action_68
action_190 (67) = happyShift action_69
action_190 (68) = happyShift action_70
action_190 (69) = happyShift action_71
action_190 _ = happyFail (happyExpListPerState 190)

action_191 _ = happyReduce_28

action_192 (39) = happyShift action_194
action_192 _ = happyFail (happyExpListPerState 192)

action_193 _ = happyReduce_83

action_194 (77) = happyShift action_212
action_194 _ = happyFail (happyExpListPerState 194)

action_195 (39) = happyShift action_22
action_195 (40) = happyShift action_23
action_195 (41) = happyShift action_24
action_195 (43) = happyShift action_25
action_195 (47) = happyShift action_26
action_195 (48) = happyShift action_27
action_195 (51) = happyShift action_28
action_195 (54) = happyShift action_29
action_195 (61) = happyShift action_30
action_195 (62) = happyShift action_31
action_195 (63) = happyShift action_32
action_195 (64) = happyShift action_33
action_195 (72) = happyShift action_34
action_195 (74) = happyShift action_35
action_195 (20) = happyGoto action_211
action_195 (21) = happyGoto action_21
action_195 _ = happyFail (happyExpListPerState 195)

action_196 (65) = happyShift action_67
action_196 (66) = happyShift action_68
action_196 (67) = happyShift action_69
action_196 (68) = happyShift action_70
action_196 (69) = happyShift action_71
action_196 _ = happyReduce_59

action_197 (79) = happyShift action_210
action_197 _ = happyFail (happyExpListPerState 197)

action_198 (73) = happyShift action_209
action_198 _ = happyFail (happyExpListPerState 198)

action_199 (39) = happyShift action_22
action_199 (40) = happyShift action_23
action_199 (41) = happyShift action_24
action_199 (43) = happyShift action_25
action_199 (47) = happyShift action_26
action_199 (48) = happyShift action_27
action_199 (51) = happyShift action_28
action_199 (54) = happyShift action_29
action_199 (61) = happyShift action_30
action_199 (62) = happyShift action_31
action_199 (63) = happyShift action_32
action_199 (64) = happyShift action_33
action_199 (72) = happyShift action_34
action_199 (74) = happyShift action_35
action_199 (20) = happyGoto action_208
action_199 (21) = happyGoto action_21
action_199 _ = happyFail (happyExpListPerState 199)

action_200 _ = happyReduce_38

action_201 _ = happyReduce_36

action_202 _ = happyReduce_37

action_203 (65) = happyShift action_67
action_203 (66) = happyShift action_68
action_203 (67) = happyShift action_69
action_203 (68) = happyShift action_70
action_203 (69) = happyShift action_71
action_203 _ = happyReduce_53

action_204 (42) = happyShift action_78
action_204 (45) = happyShift action_79
action_204 (46) = happyShift action_80
action_204 (47) = happyShift action_81
action_204 (33) = happyGoto action_207
action_204 _ = happyFail (happyExpListPerState 204)

action_205 (39) = happyShift action_22
action_205 (40) = happyShift action_23
action_205 (41) = happyShift action_24
action_205 (43) = happyShift action_25
action_205 (47) = happyShift action_26
action_205 (48) = happyShift action_27
action_205 (51) = happyShift action_28
action_205 (54) = happyShift action_29
action_205 (61) = happyShift action_30
action_205 (62) = happyShift action_31
action_205 (63) = happyShift action_32
action_205 (64) = happyShift action_33
action_205 (72) = happyShift action_34
action_205 (74) = happyShift action_35
action_205 (20) = happyGoto action_206
action_205 (21) = happyGoto action_21
action_205 _ = happyFail (happyExpListPerState 205)

action_206 (65) = happyShift action_67
action_206 (66) = happyShift action_68
action_206 (67) = happyShift action_69
action_206 (68) = happyShift action_70
action_206 (69) = happyShift action_71
action_206 _ = happyReduce_21

action_207 (39) = happyShift action_22
action_207 (40) = happyShift action_23
action_207 (41) = happyShift action_24
action_207 (43) = happyShift action_25
action_207 (47) = happyShift action_26
action_207 (48) = happyShift action_27
action_207 (51) = happyShift action_28
action_207 (54) = happyShift action_29
action_207 (61) = happyShift action_30
action_207 (62) = happyShift action_31
action_207 (63) = happyShift action_32
action_207 (64) = happyShift action_33
action_207 (72) = happyShift action_34
action_207 (74) = happyShift action_35
action_207 (20) = happyGoto action_215
action_207 (21) = happyGoto action_21
action_207 _ = happyFail (happyExpListPerState 207)

action_208 (65) = happyShift action_67
action_208 (66) = happyShift action_68
action_208 (67) = happyShift action_69
action_208 (68) = happyShift action_70
action_208 (69) = happyShift action_71
action_208 (73) = happyShift action_214
action_208 _ = happyFail (happyExpListPerState 208)

action_209 _ = happyReduce_63

action_210 (39) = happyShift action_164
action_210 (40) = happyShift action_165
action_210 (81) = happyShift action_166
action_210 (28) = happyGoto action_197
action_210 (29) = happyGoto action_213
action_210 _ = happyReduce_64

action_211 _ = happyReduce_29

action_212 _ = happyReduce_84

action_213 _ = happyReduce_65

action_214 _ = happyReduce_35

action_215 (65) = happyShift action_67
action_215 (66) = happyShift action_68
action_215 (67) = happyShift action_69
action_215 (68) = happyShift action_70
action_215 (69) = happyShift action_71
action_215 _ = happyReduce_20

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

happyReduce_32 = happySpecReduce_3  20 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn25  happy_var_2)
	(HappyTerminal (TokenCapIdC happy_var_1))
	 =  HappyAbsSyn20
		 (ExprConstruct happy_var_1 happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 5 20 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn25  happy_var_4) `HappyStk`
	(HappyTerminal (TokenIdC happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprMethodCall happy_var_1 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 6 20 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (ExprMatch happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 9 20 happyReduction_35
happyReduction_35 (_ `HappyStk`
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
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
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
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 7 20 happyReduction_38
happyReduction_38 (_ `HappyStk`
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

happyReduce_39 = happySpecReduce_3  20 happyReduction_39
happyReduction_39 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpAdd happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  20 happyReduction_40
happyReduction_40 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpSub happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  20 happyReduction_41
happyReduction_41 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitAnd happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  20 happyReduction_42
happyReduction_42 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitEor happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  20 happyReduction_43
happyReduction_43 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (ExprBinOp BinOpBitOr happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  20 happyReduction_44
happyReduction_44 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn20
		 (ExprVar happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  20 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  20 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn20
		 (ExprVoid
	)

happyReduce_47 = happySpecReduce_1  21 happyReduction_47
happyReduction_47 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn21
		 (LValId happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happyReduce 4 21 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_0  22 happyReduction_49
happyReduction_49  =  HappyAbsSyn22
		 ([]
	)

happyReduce_50 = happySpecReduce_2  22 happyReduction_50
happyReduction_50 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1 : happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_0  23 happyReduction_51
happyReduction_51  =  HappyAbsSyn23
		 ([]
	)

happyReduce_52 = happySpecReduce_2  23 happyReduction_52
happyReduction_52 (HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1 : happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 6 24 happyReduction_53
happyReduction_53 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn33  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_0  25 happyReduction_54
happyReduction_54  =  HappyAbsSyn25
		 ([]
	)

happyReduce_55 = happySpecReduce_1  25 happyReduction_55
happyReduction_55 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn25
		 ([happy_var_1]
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  25 happyReduction_56
happyReduction_56 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1 : happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_0  26 happyReduction_57
happyReduction_57  =  HappyAbsSyn26
		 ([]
	)

happyReduce_58 = happySpecReduce_2  26 happyReduction_58
happyReduction_58 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 : happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  27 happyReduction_59
happyReduction_59 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ((happy_var_1, happy_var_3)
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  28 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn28
		 (PatWildcard
	)

happyReduce_61 = happySpecReduce_1  28 happyReduction_61
happyReduction_61 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn28
		 (PatLit happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  28 happyReduction_62
happyReduction_62 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn28
		 (PatData happy_var_1 []
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happyReduce 4 28 happyReduction_63
happyReduction_63 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_64 = happySpecReduce_0  29 happyReduction_64
happyReduction_64  =  HappyAbsSyn29
		 ([]
	)

happyReduce_65 = happySpecReduce_3  29 happyReduction_65
happyReduction_65 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1 : happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  30 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn30
		 (PredLit True
	)

happyReduce_67 = happySpecReduce_1  30 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn30
		 (PredLit False
	)

happyReduce_68 = happySpecReduce_2  30 happyReduction_68
happyReduction_68 (HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_68 _ _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  30 happyReduction_69
happyReduction_69 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_3  30 happyReduction_70
happyReduction_70 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_70 _ _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  30 happyReduction_71
happyReduction_71 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn30
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_1  31 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn31
		 (CompEq
	)

happyReduce_73 = happySpecReduce_1  31 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn31
		 (CompNeq
	)

happyReduce_74 = happySpecReduce_1  31 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn31
		 (CompLe
	)

happyReduce_75 = happySpecReduce_1  31 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn31
		 (CompGe
	)

happyReduce_76 = happySpecReduce_1  31 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn31
		 (CompLeq
	)

happyReduce_77 = happySpecReduce_1  31 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn31
		 (CompGeq
	)

happyReduce_78 = happySpecReduce_1  31 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn31
		 (CompLeS
	)

happyReduce_79 = happySpecReduce_1  31 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn31
		 (CompGeS
	)

happyReduce_80 = happySpecReduce_1  31 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn31
		 (CompLeqS
	)

happyReduce_81 = happySpecReduce_1  31 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn31
		 (CompGeqS
	)

happyReduce_82 = happySpecReduce_1  32 happyReduction_82
happyReduction_82 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_82 _  = notHappyAtAll 

happyReduce_83 = happyReduce 4 33 happyReduction_83
happyReduction_83 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_84 = happyReduce 6 33 happyReduction_84
happyReduction_84 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_85 = happySpecReduce_1  33 happyReduction_85
happyReduction_85 (HappyTerminal (TokenCapId happy_var_1))
	 =  HappyAbsSyn33
		 (TypeUser happy_var_1
	)
happyReduction_85 _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_1  33 happyReduction_86
happyReduction_86 _
	 =  HappyAbsSyn33
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 92 92 notHappyAtAll (HappyState action) sts stk []

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
	TokenVoid -> cont 47;
	TokenIf -> cont 48;
	TokenThen -> cont 49;
	TokenElse -> cont 50;
	TokenFor -> cont 51;
	TokenTo -> cont 52;
	TokenDo -> cont 53;
	TokenMatch -> cont 54;
	TokenWith -> cont 55;
	TokenTrue -> cont 56;
	TokenFalse -> cont 57;
	TokenNot -> cont 58;
	TokenAnd -> cont 59;
	TokenOr -> cont 60;
	TokenTransmute -> cont 61;
	TokenShrink -> cont 62;
	TokenExtend -> cont 63;
	TokenSignExtend -> cont 64;
	TokenPlus -> cont 65;
	TokenMinus -> cont 66;
	TokenAmphersand -> cont 67;
	TokenPipe -> cont 68;
	TokenCaret -> cont 69;
	TokenEq -> cont 70;
	TokenNeq -> cont 71;
	TokenLParen -> cont 72;
	TokenRParen -> cont 73;
	TokenLBrace -> cont 74;
	TokenRBrace -> cont 75;
	TokenLBracket -> cont 76;
	TokenRBracket -> cont 77;
	TokenColon -> cont 78;
	TokenComma -> cont 79;
	TokenDot -> cont 80;
	TokenUnderscore -> cont 81;
	TokenRArrow -> cont 82;
	TokenLArrow -> cont 83;
	TokenLe -> cont 84;
	TokenGe -> cont 85;
	TokenLeq -> cont 86;
	TokenGeq -> cont 87;
	TokenLeS -> cont 88;
	TokenLeqS -> cont 89;
	TokenGeS -> cont 90;
	TokenGeqS -> cont 91;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 92 tk tks = happyError' (tks, explist)
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
