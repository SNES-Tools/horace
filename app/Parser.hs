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
happyExpList = Happy_Data_Array.listArray (0,329) ([0,18823,480,5,0,32,0,0,0,0,0,0,0,0,0,7936,0,0,0,0,32768,0,0,0,8192,2,49152,4705,16504,1,0,0,0,0,0,34560,59209,1281,0,16384,0,0,0,0,9756,1921,20,0,0,0,2048,0,0,0,0,1,0,0,0,32,0,0,0,1024,0,14336,588,10255,0,0,8,0,0,0,12512,15369,160,0,8192,0,0,0,0,1,0,0,0,0,57344,35,0,512,0,0,0,16384,0,0,0,0,8,0,0,0,256,0,0,0,0,4096,1984,0,0,0,0,1,0,0,0,127,2040,0,32800,1,0,0,0,0,0,0,0,0,0,0,14336,14924,10255,0,0,0,15872,128,0,0,0,64,0,7168,33062,5127,0,0,2,0,0,0,39024,7684,80,0,3584,49299,2563,0,49152,4705,16504,1,0,19512,3842,40,0,34560,57417,1281,0,57344,2352,41020,0,0,0,16384,0,0,0,0,0,0,0,0,768,0,0,0,28672,0,0,0,0,14,0,0,0,0,0,0,18823,480,5,0,0,49152,1031,0,0,0,0,0,32768,9411,33008,2,0,0,384,0,0,3584,49299,2563,0,49152,53857,16505,1,0,19512,3898,40,0,34560,57417,1281,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,9411,33008,2,0,0,0,64,0,0,0,0,1,0,0,0,8,0,0,0,256,0,0,0,8192,0,0,0,0,0,0,0,0,256,0,0,0,0,0,28672,1176,21502,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,240,0,0,0,0,0,32,0,0,0,1024,0,0,0,32768,0,0,16,0,0,0,1536,0,0,4,0,1024,3968,0,0,0,61440,1,0,0,0,0,0,0,0,2,0,0,4096,63488,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,14336,588,10255,0,0,18823,480,5,0,0,0,256,0,3072,0,0,8,0,0,0,512,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,256,0,34560,57417,1281,0,57344,2352,41020,0,0,9756,1921,20,0,0,0,32,0,0,0,0,1,0,0,0,32,0,128,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,1024,0,0,0,32768,9411,33008,2,0,0,57344,35,0,0,0,1148,0,0,0,36736,0,0,0,0,8,0,768,0,0,2,57344,2352,41020,0,0,0,0,0,0,0,0,0,0,0,512,992,0,0,0,31744,0,0,25024,30738,320,0,0,0,496,0,0,0,0,128,0,0,0,64,0,7168,33062,5127,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3968,0,0,0,0,256,0,0,0,32768,0,8192,0,0,0,0,0,0,0,0,0,0,287,0,0,0,0,0,0,6,0,1024,0,0,32768,15,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","expr","lval","exprs","vars","var_decl","args","cases","case","pat","pats","pred","comp","type_reg","int","id","idc","var","bits","range","data","void","if","then","else","for","to","do","match","with","true","false","not","and","or","trans","shrink","ext","sext","'+'","'-'","'&'","'|'","'^'","'='","'/='","'('","')'","'{'","'}'","'['","']'","':'","','","'.'","'_'","'->'","'<-'","'<'","'>'","'<='","'>='","'<$'","'<=$'","'>$'","'>=$'","%eof"]
        bit_start = st Prelude.* 69
        bit_end = (st Prelude.+ 1) Prelude.* 69
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..68]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_2
action_0 (18) = happyShift action_5
action_0 (19) = happyShift action_6
action_0 (24) = happyShift action_7
action_0 (25) = happyShift action_8
action_0 (28) = happyShift action_9
action_0 (31) = happyShift action_10
action_0 (38) = happyShift action_11
action_0 (39) = happyShift action_12
action_0 (40) = happyShift action_13
action_0 (41) = happyShift action_14
action_0 (49) = happyShift action_15
action_0 (51) = happyShift action_16
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (42) = happyShift action_37
action_3 (43) = happyShift action_38
action_3 (44) = happyShift action_39
action_3 (45) = happyShift action_40
action_3 (46) = happyShift action_41
action_3 (69) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (60) = happyShift action_36
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (53) = happyShift action_34
action_5 (57) = happyShift action_35
action_5 (60) = happyReduce_21
action_5 _ = happyReduce_18

action_6 (17) = happyShift action_2
action_6 (18) = happyShift action_5
action_6 (19) = happyShift action_6
action_6 (24) = happyShift action_7
action_6 (25) = happyShift action_8
action_6 (28) = happyShift action_9
action_6 (31) = happyShift action_10
action_6 (38) = happyShift action_11
action_6 (39) = happyShift action_12
action_6 (40) = happyShift action_13
action_6 (41) = happyShift action_14
action_6 (49) = happyShift action_15
action_6 (51) = happyShift action_16
action_6 (4) = happyGoto action_32
action_6 (5) = happyGoto action_4
action_6 (9) = happyGoto action_33
action_6 _ = happyReduce_28

action_7 _ = happyReduce_20

action_8 (17) = happyShift action_2
action_8 (18) = happyShift action_5
action_8 (19) = happyShift action_6
action_8 (24) = happyShift action_7
action_8 (25) = happyShift action_8
action_8 (28) = happyShift action_9
action_8 (31) = happyShift action_10
action_8 (33) = happyShift action_29
action_8 (34) = happyShift action_30
action_8 (35) = happyShift action_31
action_8 (38) = happyShift action_11
action_8 (39) = happyShift action_12
action_8 (40) = happyShift action_13
action_8 (41) = happyShift action_14
action_8 (49) = happyShift action_15
action_8 (51) = happyShift action_16
action_8 (4) = happyGoto action_27
action_8 (5) = happyGoto action_4
action_8 (14) = happyGoto action_28
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (18) = happyShift action_26
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (17) = happyShift action_2
action_10 (18) = happyShift action_5
action_10 (19) = happyShift action_6
action_10 (24) = happyShift action_7
action_10 (25) = happyShift action_8
action_10 (28) = happyShift action_9
action_10 (31) = happyShift action_10
action_10 (38) = happyShift action_11
action_10 (39) = happyShift action_12
action_10 (40) = happyShift action_13
action_10 (41) = happyShift action_14
action_10 (49) = happyShift action_15
action_10 (51) = happyShift action_16
action_10 (4) = happyGoto action_25
action_10 (5) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (53) = happyShift action_24
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (53) = happyShift action_23
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (53) = happyShift action_22
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (53) = happyShift action_21
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (17) = happyShift action_2
action_15 (18) = happyShift action_5
action_15 (19) = happyShift action_6
action_15 (24) = happyShift action_7
action_15 (25) = happyShift action_8
action_15 (28) = happyShift action_9
action_15 (31) = happyShift action_10
action_15 (38) = happyShift action_11
action_15 (39) = happyShift action_12
action_15 (40) = happyShift action_13
action_15 (41) = happyShift action_14
action_15 (49) = happyShift action_15
action_15 (51) = happyShift action_16
action_15 (4) = happyGoto action_20
action_15 (5) = happyGoto action_4
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (20) = happyShift action_19
action_16 (7) = happyGoto action_17
action_16 (8) = happyGoto action_18
action_16 _ = happyReduce_25

action_17 (17) = happyShift action_2
action_17 (18) = happyShift action_5
action_17 (19) = happyShift action_6
action_17 (24) = happyShift action_7
action_17 (25) = happyShift action_8
action_17 (28) = happyShift action_9
action_17 (31) = happyShift action_10
action_17 (38) = happyShift action_11
action_17 (39) = happyShift action_12
action_17 (40) = happyShift action_13
action_17 (41) = happyShift action_14
action_17 (49) = happyShift action_15
action_17 (51) = happyShift action_16
action_17 (4) = happyGoto action_76
action_17 (5) = happyGoto action_4
action_17 (6) = happyGoto action_77
action_17 _ = happyReduce_23

action_18 (20) = happyShift action_19
action_18 (7) = happyGoto action_75
action_18 (8) = happyGoto action_18
action_18 _ = happyReduce_25

action_19 (18) = happyShift action_74
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (42) = happyShift action_37
action_20 (43) = happyShift action_38
action_20 (44) = happyShift action_39
action_20 (45) = happyShift action_40
action_20 (46) = happyShift action_41
action_20 (50) = happyShift action_73
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (17) = happyShift action_72
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_71
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (17) = happyShift action_70
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (17) = happyShift action_69
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (32) = happyShift action_68
action_25 (42) = happyShift action_37
action_25 (43) = happyShift action_38
action_25 (44) = happyShift action_39
action_25 (45) = happyShift action_40
action_25 (46) = happyShift action_41
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (47) = happyShift action_67
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (42) = happyShift action_37
action_27 (43) = happyShift action_38
action_27 (44) = happyShift action_39
action_27 (45) = happyShift action_40
action_27 (46) = happyShift action_41
action_27 (47) = happyShift action_57
action_27 (48) = happyShift action_58
action_27 (61) = happyShift action_59
action_27 (62) = happyShift action_60
action_27 (63) = happyShift action_61
action_27 (64) = happyShift action_62
action_27 (65) = happyShift action_63
action_27 (66) = happyShift action_64
action_27 (67) = happyShift action_65
action_27 (68) = happyShift action_66
action_27 (15) = happyGoto action_56
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (26) = happyShift action_53
action_28 (36) = happyShift action_54
action_28 (37) = happyShift action_55
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_40

action_30 _ = happyReduce_41

action_31 (17) = happyShift action_2
action_31 (18) = happyShift action_5
action_31 (19) = happyShift action_6
action_31 (24) = happyShift action_7
action_31 (25) = happyShift action_8
action_31 (28) = happyShift action_9
action_31 (31) = happyShift action_10
action_31 (33) = happyShift action_29
action_31 (34) = happyShift action_30
action_31 (35) = happyShift action_31
action_31 (38) = happyShift action_11
action_31 (39) = happyShift action_12
action_31 (40) = happyShift action_13
action_31 (41) = happyShift action_14
action_31 (49) = happyShift action_15
action_31 (51) = happyShift action_16
action_31 (4) = happyGoto action_27
action_31 (5) = happyGoto action_4
action_31 (14) = happyGoto action_52
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (42) = happyShift action_37
action_32 (43) = happyShift action_38
action_32 (44) = happyShift action_39
action_32 (45) = happyShift action_40
action_32 (46) = happyShift action_41
action_32 (56) = happyShift action_51
action_32 _ = happyReduce_29

action_33 (50) = happyShift action_50
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (17) = happyShift action_2
action_34 (18) = happyShift action_5
action_34 (19) = happyShift action_6
action_34 (24) = happyShift action_7
action_34 (25) = happyShift action_8
action_34 (28) = happyShift action_9
action_34 (31) = happyShift action_10
action_34 (38) = happyShift action_11
action_34 (39) = happyShift action_12
action_34 (40) = happyShift action_13
action_34 (41) = happyShift action_14
action_34 (49) = happyShift action_15
action_34 (51) = happyShift action_16
action_34 (4) = happyGoto action_49
action_34 (5) = happyGoto action_4
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (19) = happyShift action_48
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_2
action_36 (18) = happyShift action_5
action_36 (19) = happyShift action_6
action_36 (24) = happyShift action_7
action_36 (25) = happyShift action_8
action_36 (28) = happyShift action_9
action_36 (31) = happyShift action_10
action_36 (38) = happyShift action_11
action_36 (39) = happyShift action_12
action_36 (40) = happyShift action_13
action_36 (41) = happyShift action_14
action_36 (49) = happyShift action_15
action_36 (51) = happyShift action_16
action_36 (4) = happyGoto action_47
action_36 (5) = happyGoto action_4
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (17) = happyShift action_2
action_37 (18) = happyShift action_5
action_37 (19) = happyShift action_6
action_37 (24) = happyShift action_7
action_37 (25) = happyShift action_8
action_37 (28) = happyShift action_9
action_37 (31) = happyShift action_10
action_37 (38) = happyShift action_11
action_37 (39) = happyShift action_12
action_37 (40) = happyShift action_13
action_37 (41) = happyShift action_14
action_37 (49) = happyShift action_15
action_37 (51) = happyShift action_16
action_37 (4) = happyGoto action_46
action_37 (5) = happyGoto action_4
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (17) = happyShift action_2
action_38 (18) = happyShift action_5
action_38 (19) = happyShift action_6
action_38 (24) = happyShift action_7
action_38 (25) = happyShift action_8
action_38 (28) = happyShift action_9
action_38 (31) = happyShift action_10
action_38 (38) = happyShift action_11
action_38 (39) = happyShift action_12
action_38 (40) = happyShift action_13
action_38 (41) = happyShift action_14
action_38 (49) = happyShift action_15
action_38 (51) = happyShift action_16
action_38 (4) = happyGoto action_45
action_38 (5) = happyGoto action_4
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (17) = happyShift action_2
action_39 (18) = happyShift action_5
action_39 (19) = happyShift action_6
action_39 (24) = happyShift action_7
action_39 (25) = happyShift action_8
action_39 (28) = happyShift action_9
action_39 (31) = happyShift action_10
action_39 (38) = happyShift action_11
action_39 (39) = happyShift action_12
action_39 (40) = happyShift action_13
action_39 (41) = happyShift action_14
action_39 (49) = happyShift action_15
action_39 (51) = happyShift action_16
action_39 (4) = happyGoto action_44
action_39 (5) = happyGoto action_4
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (17) = happyShift action_2
action_40 (18) = happyShift action_5
action_40 (19) = happyShift action_6
action_40 (24) = happyShift action_7
action_40 (25) = happyShift action_8
action_40 (28) = happyShift action_9
action_40 (31) = happyShift action_10
action_40 (38) = happyShift action_11
action_40 (39) = happyShift action_12
action_40 (40) = happyShift action_13
action_40 (41) = happyShift action_14
action_40 (49) = happyShift action_15
action_40 (51) = happyShift action_16
action_40 (4) = happyGoto action_43
action_40 (5) = happyGoto action_4
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (17) = happyShift action_2
action_41 (18) = happyShift action_5
action_41 (19) = happyShift action_6
action_41 (24) = happyShift action_7
action_41 (25) = happyShift action_8
action_41 (28) = happyShift action_9
action_41 (31) = happyShift action_10
action_41 (38) = happyShift action_11
action_41 (39) = happyShift action_12
action_41 (40) = happyShift action_13
action_41 (41) = happyShift action_14
action_41 (49) = happyShift action_15
action_41 (51) = happyShift action_16
action_41 (4) = happyGoto action_42
action_41 (5) = happyGoto action_4
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (45) = happyShift action_40
action_42 _ = happyReduce_16

action_43 _ = happyReduce_17

action_44 (45) = happyShift action_40
action_44 (46) = happyShift action_41
action_44 _ = happyReduce_15

action_45 (44) = happyShift action_39
action_45 (45) = happyShift action_40
action_45 (46) = happyShift action_41
action_45 _ = happyReduce_14

action_46 (44) = happyShift action_39
action_46 (45) = happyShift action_40
action_46 (46) = happyShift action_41
action_46 _ = happyReduce_13

action_47 _ = happyReduce_5

action_48 (17) = happyShift action_2
action_48 (18) = happyShift action_5
action_48 (19) = happyShift action_6
action_48 (24) = happyShift action_7
action_48 (25) = happyShift action_8
action_48 (28) = happyShift action_9
action_48 (31) = happyShift action_10
action_48 (38) = happyShift action_11
action_48 (39) = happyShift action_12
action_48 (40) = happyShift action_13
action_48 (41) = happyShift action_14
action_48 (49) = happyShift action_15
action_48 (51) = happyShift action_16
action_48 (4) = happyGoto action_32
action_48 (5) = happyGoto action_4
action_48 (9) = happyGoto action_93
action_48 _ = happyReduce_28

action_49 (42) = happyShift action_37
action_49 (43) = happyShift action_38
action_49 (44) = happyShift action_39
action_49 (45) = happyShift action_40
action_49 (46) = happyShift action_41
action_49 (54) = happyShift action_92
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_6

action_51 (17) = happyShift action_2
action_51 (18) = happyShift action_5
action_51 (19) = happyShift action_6
action_51 (24) = happyShift action_7
action_51 (25) = happyShift action_8
action_51 (28) = happyShift action_9
action_51 (31) = happyShift action_10
action_51 (38) = happyShift action_11
action_51 (39) = happyShift action_12
action_51 (40) = happyShift action_13
action_51 (41) = happyShift action_14
action_51 (49) = happyShift action_15
action_51 (51) = happyShift action_16
action_51 (4) = happyGoto action_32
action_51 (5) = happyGoto action_4
action_51 (9) = happyGoto action_91
action_51 _ = happyReduce_28

action_52 (36) = happyShift action_54
action_52 (37) = happyShift action_55
action_52 _ = happyReduce_42

action_53 (17) = happyShift action_2
action_53 (18) = happyShift action_5
action_53 (19) = happyShift action_6
action_53 (24) = happyShift action_7
action_53 (25) = happyShift action_8
action_53 (28) = happyShift action_9
action_53 (31) = happyShift action_10
action_53 (38) = happyShift action_11
action_53 (39) = happyShift action_12
action_53 (40) = happyShift action_13
action_53 (41) = happyShift action_14
action_53 (49) = happyShift action_15
action_53 (51) = happyShift action_16
action_53 (4) = happyGoto action_90
action_53 (5) = happyGoto action_4
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_2
action_54 (18) = happyShift action_5
action_54 (19) = happyShift action_6
action_54 (24) = happyShift action_7
action_54 (25) = happyShift action_8
action_54 (28) = happyShift action_9
action_54 (31) = happyShift action_10
action_54 (33) = happyShift action_29
action_54 (34) = happyShift action_30
action_54 (35) = happyShift action_31
action_54 (38) = happyShift action_11
action_54 (39) = happyShift action_12
action_54 (40) = happyShift action_13
action_54 (41) = happyShift action_14
action_54 (49) = happyShift action_15
action_54 (51) = happyShift action_16
action_54 (4) = happyGoto action_27
action_54 (5) = happyGoto action_4
action_54 (14) = happyGoto action_89
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (17) = happyShift action_2
action_55 (18) = happyShift action_5
action_55 (19) = happyShift action_6
action_55 (24) = happyShift action_7
action_55 (25) = happyShift action_8
action_55 (28) = happyShift action_9
action_55 (31) = happyShift action_10
action_55 (33) = happyShift action_29
action_55 (34) = happyShift action_30
action_55 (35) = happyShift action_31
action_55 (38) = happyShift action_11
action_55 (39) = happyShift action_12
action_55 (40) = happyShift action_13
action_55 (41) = happyShift action_14
action_55 (49) = happyShift action_15
action_55 (51) = happyShift action_16
action_55 (4) = happyGoto action_27
action_55 (5) = happyGoto action_4
action_55 (14) = happyGoto action_88
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (17) = happyShift action_2
action_56 (18) = happyShift action_5
action_56 (19) = happyShift action_6
action_56 (24) = happyShift action_7
action_56 (25) = happyShift action_8
action_56 (28) = happyShift action_9
action_56 (31) = happyShift action_10
action_56 (38) = happyShift action_11
action_56 (39) = happyShift action_12
action_56 (40) = happyShift action_13
action_56 (41) = happyShift action_14
action_56 (49) = happyShift action_15
action_56 (51) = happyShift action_16
action_56 (4) = happyGoto action_87
action_56 (5) = happyGoto action_4
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_46

action_58 _ = happyReduce_47

action_59 _ = happyReduce_48

action_60 _ = happyReduce_49

action_61 _ = happyReduce_50

action_62 _ = happyReduce_51

action_63 _ = happyReduce_52

action_64 _ = happyReduce_54

action_65 _ = happyReduce_53

action_66 _ = happyReduce_55

action_67 (17) = happyShift action_2
action_67 (18) = happyShift action_5
action_67 (19) = happyShift action_6
action_67 (24) = happyShift action_7
action_67 (25) = happyShift action_8
action_67 (28) = happyShift action_9
action_67 (31) = happyShift action_10
action_67 (38) = happyShift action_11
action_67 (39) = happyShift action_12
action_67 (40) = happyShift action_13
action_67 (41) = happyShift action_14
action_67 (49) = happyShift action_15
action_67 (51) = happyShift action_16
action_67 (4) = happyGoto action_86
action_67 (5) = happyGoto action_4
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (51) = happyShift action_85
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (56) = happyShift action_84
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (54) = happyShift action_83
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (54) = happyShift action_82
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (54) = happyShift action_81
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_19

action_74 (55) = happyShift action_80
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_26

action_76 (17) = happyShift action_2
action_76 (18) = happyShift action_5
action_76 (19) = happyShift action_6
action_76 (24) = happyShift action_7
action_76 (25) = happyShift action_8
action_76 (28) = happyShift action_9
action_76 (31) = happyShift action_10
action_76 (38) = happyShift action_11
action_76 (39) = happyShift action_12
action_76 (40) = happyShift action_13
action_76 (41) = happyShift action_14
action_76 (42) = happyShift action_37
action_76 (43) = happyShift action_38
action_76 (44) = happyShift action_39
action_76 (45) = happyShift action_40
action_76 (46) = happyShift action_41
action_76 (49) = happyShift action_15
action_76 (51) = happyShift action_16
action_76 (4) = happyGoto action_76
action_76 (5) = happyGoto action_4
action_76 (6) = happyGoto action_79
action_76 _ = happyReduce_23

action_77 (52) = happyShift action_78
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_2

action_79 _ = happyReduce_24

action_80 (21) = happyShift action_108
action_80 (22) = happyShift action_109
action_80 (23) = happyShift action_110
action_80 (24) = happyShift action_111
action_80 (16) = happyGoto action_107
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (49) = happyShift action_106
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (49) = happyShift action_105
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (49) = happyShift action_104
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (17) = happyShift action_103
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (17) = happyShift action_100
action_85 (18) = happyShift action_101
action_85 (58) = happyShift action_102
action_85 (10) = happyGoto action_97
action_85 (11) = happyGoto action_98
action_85 (12) = happyGoto action_99
action_85 _ = happyReduce_31

action_86 (29) = happyShift action_96
action_86 (42) = happyShift action_37
action_86 (43) = happyShift action_38
action_86 (44) = happyShift action_39
action_86 (45) = happyShift action_40
action_86 (46) = happyShift action_41
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (42) = happyShift action_37
action_87 (43) = happyShift action_38
action_87 (44) = happyShift action_39
action_87 (45) = happyShift action_40
action_87 (46) = happyShift action_41
action_87 _ = happyReduce_45

action_88 _ = happyReduce_44

action_89 (37) = happyShift action_55
action_89 _ = happyReduce_43

action_90 (27) = happyShift action_95
action_90 (42) = happyShift action_37
action_90 (43) = happyShift action_38
action_90 (44) = happyShift action_39
action_90 (45) = happyShift action_40
action_90 (46) = happyShift action_41
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_30

action_92 _ = happyReduce_22

action_93 (50) = happyShift action_94
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_7

action_95 (17) = happyShift action_2
action_95 (18) = happyShift action_5
action_95 (19) = happyShift action_6
action_95 (24) = happyShift action_7
action_95 (25) = happyShift action_8
action_95 (28) = happyShift action_9
action_95 (31) = happyShift action_10
action_95 (38) = happyShift action_11
action_95 (39) = happyShift action_12
action_95 (40) = happyShift action_13
action_95 (41) = happyShift action_14
action_95 (49) = happyShift action_15
action_95 (51) = happyShift action_16
action_95 (4) = happyGoto action_125
action_95 (5) = happyGoto action_4
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (17) = happyShift action_2
action_96 (18) = happyShift action_5
action_96 (19) = happyShift action_6
action_96 (24) = happyShift action_7
action_96 (25) = happyShift action_8
action_96 (28) = happyShift action_9
action_96 (31) = happyShift action_10
action_96 (38) = happyShift action_11
action_96 (39) = happyShift action_12
action_96 (40) = happyShift action_13
action_96 (41) = happyShift action_14
action_96 (49) = happyShift action_15
action_96 (51) = happyShift action_16
action_96 (4) = happyGoto action_124
action_96 (5) = happyGoto action_4
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (52) = happyShift action_123
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (17) = happyShift action_100
action_98 (18) = happyShift action_101
action_98 (58) = happyShift action_102
action_98 (10) = happyGoto action_122
action_98 (11) = happyGoto action_98
action_98 (12) = happyGoto action_99
action_98 _ = happyReduce_31

action_99 (59) = happyShift action_121
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_35

action_101 (49) = happyShift action_120
action_101 _ = happyReduce_36

action_102 _ = happyReduce_34

action_103 (54) = happyShift action_119
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (17) = happyShift action_2
action_104 (18) = happyShift action_5
action_104 (19) = happyShift action_6
action_104 (24) = happyShift action_7
action_104 (25) = happyShift action_8
action_104 (28) = happyShift action_9
action_104 (31) = happyShift action_10
action_104 (38) = happyShift action_11
action_104 (39) = happyShift action_12
action_104 (40) = happyShift action_13
action_104 (41) = happyShift action_14
action_104 (49) = happyShift action_15
action_104 (51) = happyShift action_16
action_104 (4) = happyGoto action_118
action_104 (5) = happyGoto action_4
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (17) = happyShift action_2
action_105 (18) = happyShift action_5
action_105 (19) = happyShift action_6
action_105 (24) = happyShift action_7
action_105 (25) = happyShift action_8
action_105 (28) = happyShift action_9
action_105 (31) = happyShift action_10
action_105 (38) = happyShift action_11
action_105 (39) = happyShift action_12
action_105 (40) = happyShift action_13
action_105 (41) = happyShift action_14
action_105 (49) = happyShift action_15
action_105 (51) = happyShift action_16
action_105 (4) = happyGoto action_117
action_105 (5) = happyGoto action_4
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (17) = happyShift action_2
action_106 (18) = happyShift action_5
action_106 (19) = happyShift action_6
action_106 (24) = happyShift action_7
action_106 (25) = happyShift action_8
action_106 (28) = happyShift action_9
action_106 (31) = happyShift action_10
action_106 (38) = happyShift action_11
action_106 (39) = happyShift action_12
action_106 (40) = happyShift action_13
action_106 (41) = happyShift action_14
action_106 (49) = happyShift action_15
action_106 (51) = happyShift action_16
action_106 (4) = happyGoto action_116
action_106 (5) = happyGoto action_4
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (47) = happyShift action_115
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (53) = happyShift action_114
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (53) = happyShift action_113
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (18) = happyShift action_112
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_59

action_112 _ = happyReduce_58

action_113 (17) = happyShift action_136
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (17) = happyShift action_135
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (17) = happyShift action_2
action_115 (18) = happyShift action_5
action_115 (19) = happyShift action_6
action_115 (24) = happyShift action_7
action_115 (25) = happyShift action_8
action_115 (28) = happyShift action_9
action_115 (31) = happyShift action_10
action_115 (38) = happyShift action_11
action_115 (39) = happyShift action_12
action_115 (40) = happyShift action_13
action_115 (41) = happyShift action_14
action_115 (49) = happyShift action_15
action_115 (51) = happyShift action_16
action_115 (4) = happyGoto action_134
action_115 (5) = happyGoto action_4
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (42) = happyShift action_37
action_116 (43) = happyShift action_38
action_116 (44) = happyShift action_39
action_116 (45) = happyShift action_40
action_116 (46) = happyShift action_41
action_116 (50) = happyShift action_133
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (42) = happyShift action_37
action_117 (43) = happyShift action_38
action_117 (44) = happyShift action_39
action_117 (45) = happyShift action_40
action_117 (46) = happyShift action_41
action_117 (50) = happyShift action_132
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (42) = happyShift action_37
action_118 (43) = happyShift action_38
action_118 (44) = happyShift action_39
action_118 (45) = happyShift action_40
action_118 (46) = happyShift action_41
action_118 (50) = happyShift action_131
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (49) = happyShift action_130
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (17) = happyShift action_100
action_120 (18) = happyShift action_101
action_120 (58) = happyShift action_102
action_120 (12) = happyGoto action_128
action_120 (13) = happyGoto action_129
action_120 _ = happyReduce_38

action_121 (17) = happyShift action_2
action_121 (18) = happyShift action_5
action_121 (19) = happyShift action_6
action_121 (24) = happyShift action_7
action_121 (25) = happyShift action_8
action_121 (28) = happyShift action_9
action_121 (31) = happyShift action_10
action_121 (38) = happyShift action_11
action_121 (39) = happyShift action_12
action_121 (40) = happyShift action_13
action_121 (41) = happyShift action_14
action_121 (49) = happyShift action_15
action_121 (51) = happyShift action_16
action_121 (4) = happyGoto action_127
action_121 (5) = happyGoto action_4
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_32

action_123 _ = happyReduce_8

action_124 (30) = happyShift action_126
action_124 (42) = happyShift action_37
action_124 (43) = happyShift action_38
action_124 (44) = happyShift action_39
action_124 (45) = happyShift action_40
action_124 (46) = happyShift action_41
action_124 _ = happyFail (happyExpListPerState 124)

action_125 (42) = happyShift action_37
action_125 (43) = happyShift action_38
action_125 (44) = happyShift action_39
action_125 (45) = happyShift action_40
action_125 (46) = happyShift action_41
action_125 _ = happyReduce_3

action_126 (17) = happyShift action_2
action_126 (18) = happyShift action_5
action_126 (19) = happyShift action_6
action_126 (24) = happyShift action_7
action_126 (25) = happyShift action_8
action_126 (28) = happyShift action_9
action_126 (31) = happyShift action_10
action_126 (38) = happyShift action_11
action_126 (39) = happyShift action_12
action_126 (40) = happyShift action_13
action_126 (41) = happyShift action_14
action_126 (49) = happyShift action_15
action_126 (51) = happyShift action_16
action_126 (4) = happyGoto action_142
action_126 (5) = happyGoto action_4
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (42) = happyShift action_37
action_127 (43) = happyShift action_38
action_127 (44) = happyShift action_39
action_127 (45) = happyShift action_40
action_127 (46) = happyShift action_41
action_127 _ = happyReduce_33

action_128 (56) = happyShift action_141
action_128 _ = happyFail (happyExpListPerState 128)

action_129 (50) = happyShift action_140
action_129 _ = happyFail (happyExpListPerState 129)

action_130 (17) = happyShift action_2
action_130 (18) = happyShift action_5
action_130 (19) = happyShift action_6
action_130 (24) = happyShift action_7
action_130 (25) = happyShift action_8
action_130 (28) = happyShift action_9
action_130 (31) = happyShift action_10
action_130 (38) = happyShift action_11
action_130 (39) = happyShift action_12
action_130 (40) = happyShift action_13
action_130 (41) = happyShift action_14
action_130 (49) = happyShift action_15
action_130 (51) = happyShift action_16
action_130 (4) = happyGoto action_139
action_130 (5) = happyGoto action_4
action_130 _ = happyFail (happyExpListPerState 130)

action_131 _ = happyReduce_12

action_132 _ = happyReduce_10

action_133 _ = happyReduce_11

action_134 (42) = happyShift action_37
action_134 (43) = happyShift action_38
action_134 (44) = happyShift action_39
action_134 (45) = happyShift action_40
action_134 (46) = happyShift action_41
action_134 _ = happyReduce_27

action_135 (54) = happyShift action_138
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (56) = happyShift action_137
action_136 _ = happyFail (happyExpListPerState 136)

action_137 (17) = happyShift action_145
action_137 _ = happyFail (happyExpListPerState 137)

action_138 _ = happyReduce_56

action_139 (42) = happyShift action_37
action_139 (43) = happyShift action_38
action_139 (44) = happyShift action_39
action_139 (45) = happyShift action_40
action_139 (46) = happyShift action_41
action_139 (50) = happyShift action_144
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_37

action_141 (17) = happyShift action_100
action_141 (18) = happyShift action_101
action_141 (58) = happyShift action_102
action_141 (12) = happyGoto action_128
action_141 (13) = happyGoto action_143
action_141 _ = happyReduce_38

action_142 (42) = happyShift action_37
action_142 (43) = happyShift action_38
action_142 (44) = happyShift action_39
action_142 (45) = happyShift action_40
action_142 (46) = happyShift action_41
action_142 _ = happyReduce_4

action_143 _ = happyReduce_39

action_144 _ = happyReduce_9

action_145 (54) = happyShift action_146
action_145 _ = happyFail (happyExpListPerState 145)

action_146 _ = happyReduce_57

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

happyReduce_9 = happyReduce 9 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprUnOp (UnOpTransmute (Just (fromIntegral happy_var_3)) (Just (fromIntegral happy_var_5))) happy_var_8
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprUnOp (UnOpExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprUnOp (UnOpSignExtend (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 7 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ExprUnOp (UnOpShrink (Just (fromIntegral happy_var_3))) happy_var_6
	) `HappyStk` happyRest

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

happyReduce_20 = happySpecReduce_1  4 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn4
		 (ExprVoid
	)

happyReduce_21 = happySpecReduce_1  5 happyReduction_21
happyReduction_21 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn5
		 (LValId happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 5 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (LValArrIndex happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_0  6 happyReduction_23
happyReduction_23  =  HappyAbsSyn6
		 ([]
	)

happyReduce_24 = happySpecReduce_2  6 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  7 happyReduction_25
happyReduction_25  =  HappyAbsSyn7
		 ([]
	)

happyReduce_26 = happySpecReduce_2  7 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 6 8 happyReduction_27
happyReduction_27 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Var happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_0  9 happyReduction_28
happyReduction_28  =  HappyAbsSyn9
		 ([]
	)

happyReduce_29 = happySpecReduce_1  9 happyReduction_29
happyReduction_29 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  9 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  10 happyReduction_31
happyReduction_31  =  HappyAbsSyn10
		 ([]
	)

happyReduce_32 = happySpecReduce_2  10 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  11 happyReduction_33
happyReduction_33 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_3)
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn12
		 (PatWildcard
	)

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (PatLit happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  12 happyReduction_36
happyReduction_36 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn12
		 (PatData happy_var_1 []
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 12 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (PatData happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_0  13 happyReduction_38
happyReduction_38  =  HappyAbsSyn13
		 ([]
	)

happyReduce_39 = happySpecReduce_3  13 happyReduction_39
happyReduction_39 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (PredLit True
	)

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn14
		 (PredLit False
	)

happyReduce_42 = happySpecReduce_2  14 happyReduction_42
happyReduction_42 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (PredUnOp PredNot happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  14 happyReduction_43
happyReduction_43 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredAnd happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  14 happyReduction_44
happyReduction_44 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (PredBinOp PredOr happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  14 happyReduction_45
happyReduction_45 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn14
		 (PredComp happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (CompEq
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn15
		 (CompNeq
	)

happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn15
		 (CompLe
	)

happyReduce_49 = happySpecReduce_1  15 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn15
		 (CompGe
	)

happyReduce_50 = happySpecReduce_1  15 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn15
		 (CompLeq
	)

happyReduce_51 = happySpecReduce_1  15 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn15
		 (CompGeq
	)

happyReduce_52 = happySpecReduce_1  15 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn15
		 (CompLeS
	)

happyReduce_53 = happySpecReduce_1  15 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn15
		 (CompGeS
	)

happyReduce_54 = happySpecReduce_1  15 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn15
		 (CompLeqS
	)

happyReduce_55 = happySpecReduce_1  15 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn15
		 (CompGeqS
	)

happyReduce_56 = happyReduce 4 16 happyReduction_56
happyReduction_56 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeBits $ fromIntegral happy_var_3
	) `HappyStk` happyRest

happyReduce_57 = happyReduce 6 16 happyReduction_57
happyReduction_57 (_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (TypeRange happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_58 = happySpecReduce_2  16 happyReduction_58
happyReduction_58 (HappyTerminal (TokenId happy_var_2))
	_
	 =  HappyAbsSyn16
		 (TypeData happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  16 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn16
		 (TypeVoid
	)

happyNewToken action sts stk [] =
	action 69 69 notHappyAtAll (HappyState action) sts stk []

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
	TokenNeq -> cont 48;
	TokenLParen -> cont 49;
	TokenRParen -> cont 50;
	TokenLBrace -> cont 51;
	TokenRBrace -> cont 52;
	TokenLBracket -> cont 53;
	TokenRBracket -> cont 54;
	TokenColon -> cont 55;
	TokenComma -> cont 56;
	TokenDot -> cont 57;
	TokenUnderscore -> cont 58;
	TokenRArrow -> cont 59;
	TokenLArrow -> cont 60;
	TokenLe -> cont 61;
	TokenGe -> cont 62;
	TokenLeq -> cont 63;
	TokenGeq -> cont 64;
	TokenLeS -> cont 65;
	TokenLeqS -> cont 66;
	TokenGeS -> cont 67;
	TokenGeqS -> cont 68;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 69 tk tks = happyError' (tks, explist)
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
