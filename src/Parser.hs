{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer

import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,216) ([14848,16384,0,16386,0,0,0,0,0,0,0,0,0,65440,59391,16382,0,0,0,0,0,0,0,0,0,0,0,0,0,464,512,4096,3712,4096,32768,29696,32768,0,40964,3,4,32,29,32,256,232,256,2048,1856,2048,16384,14848,16384,0,53250,1,2,32784,14,16,128,116,128,1024,928,1024,8192,7424,8192,0,59393,0,1,16392,7,8,64,2,0,0,16,0,0,128,0,0,29696,32768,0,8196,0,0,0,1,0,0,232,256,2048,1856,2048,16384,14848,16384,0,53250,1,2,32784,14,16,128,116,128,1024,928,1024,8192,7424,8192,0,59393,0,1,16392,7,8,64,58,64,512,32,0,0,3712,4096,32768,29696,32768,0,16388,0,0,0,29,32,256,232,256,2048,128,0,0,1024,0,0,8192,0,0,0,1,0,0,8,0,0,928,1024,8192,512,0,0,0,0,1,0,0,16,0,58,64,512,0,512,0,0,8192,0,0,0,1,16384,0,0,0,2,0,0,16,0,0,128,0,0,1024,0,0,8192,0,0,32768,14,16,128,8,0,0,64,0,0,512,0,0,4096,0,0,32768,0,0,0,4,0,0,32,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,32768,0,16384,0,0,0,2,0,0,0,256,0,1856,2048,16384,1024,0,0,53248,1,2,32784,14,16,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,2048,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,928,1024,8192,256,0,0,4096,0,0,0,0,0,0,58,64,512,464,512,4096,3712,4096,32768,29696,32768,0,4,0,0,0,2,0,0,0,1024,0,128,0,0,1024,0,0,0,0,0,0,0,1024,0,0,512,0,928,1024,8192,512,0,0,0,0,2,16384,7,8,64,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","expr","seq","seq2","seq3","seq4","seq5","'('","')'","num","'#t'","'#f'","'+'","'-'","'*'","'/'","add1","sub1","sqrt","expt","'<'","'>'","'='","not","or","and","let","'let*'","var","'['","']'","lambda","if","cond","else","letrec","list","head","tail","length","reverse","concat","map","filter","sconcat","at","lstostr","str","%eof"]
        bit_start = st Prelude.* 51
        bit_end = (st Prelude.+ 1) Prelude.* 51
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..50]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_4
action_0 (12) = happyShift action_2
action_0 (13) = happyShift action_5
action_0 (14) = happyShift action_6
action_0 (31) = happyShift action_7
action_0 (50) = happyShift action_8
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (51) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (10) = happyShift action_4
action_4 (12) = happyShift action_2
action_4 (13) = happyShift action_5
action_4 (14) = happyShift action_6
action_4 (15) = happyShift action_10
action_4 (16) = happyShift action_11
action_4 (17) = happyShift action_12
action_4 (18) = happyShift action_13
action_4 (19) = happyShift action_14
action_4 (20) = happyShift action_15
action_4 (21) = happyShift action_16
action_4 (22) = happyShift action_17
action_4 (23) = happyShift action_18
action_4 (24) = happyShift action_19
action_4 (25) = happyShift action_20
action_4 (26) = happyShift action_21
action_4 (27) = happyShift action_22
action_4 (28) = happyShift action_23
action_4 (29) = happyShift action_24
action_4 (30) = happyShift action_25
action_4 (31) = happyShift action_7
action_4 (34) = happyShift action_26
action_4 (35) = happyShift action_27
action_4 (36) = happyShift action_28
action_4 (38) = happyShift action_29
action_4 (39) = happyShift action_30
action_4 (40) = happyShift action_31
action_4 (41) = happyShift action_32
action_4 (42) = happyShift action_33
action_4 (43) = happyShift action_34
action_4 (44) = happyShift action_35
action_4 (45) = happyShift action_36
action_4 (46) = happyShift action_37
action_4 (47) = happyShift action_38
action_4 (48) = happyShift action_39
action_4 (49) = happyShift action_40
action_4 (50) = happyShift action_8
action_4 (4) = happyGoto action_9
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 _ = happyReduce_20

action_8 _ = happyReduce_37

action_9 (10) = happyShift action_4
action_9 (12) = happyShift action_2
action_9 (13) = happyShift action_5
action_9 (14) = happyShift action_6
action_9 (31) = happyShift action_7
action_9 (50) = happyShift action_8
action_9 (4) = happyGoto action_43
action_9 (5) = happyGoto action_74
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (10) = happyShift action_4
action_10 (12) = happyShift action_2
action_10 (13) = happyShift action_5
action_10 (14) = happyShift action_6
action_10 (31) = happyShift action_7
action_10 (50) = happyShift action_8
action_10 (4) = happyGoto action_43
action_10 (5) = happyGoto action_73
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (10) = happyShift action_4
action_11 (12) = happyShift action_2
action_11 (13) = happyShift action_5
action_11 (14) = happyShift action_6
action_11 (31) = happyShift action_7
action_11 (50) = happyShift action_8
action_11 (4) = happyGoto action_43
action_11 (5) = happyGoto action_72
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_4
action_12 (12) = happyShift action_2
action_12 (13) = happyShift action_5
action_12 (14) = happyShift action_6
action_12 (31) = happyShift action_7
action_12 (50) = happyShift action_8
action_12 (4) = happyGoto action_43
action_12 (5) = happyGoto action_71
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (10) = happyShift action_4
action_13 (12) = happyShift action_2
action_13 (13) = happyShift action_5
action_13 (14) = happyShift action_6
action_13 (31) = happyShift action_7
action_13 (50) = happyShift action_8
action_13 (4) = happyGoto action_43
action_13 (5) = happyGoto action_70
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_4
action_14 (12) = happyShift action_2
action_14 (13) = happyShift action_5
action_14 (14) = happyShift action_6
action_14 (31) = happyShift action_7
action_14 (50) = happyShift action_8
action_14 (4) = happyGoto action_69
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (10) = happyShift action_4
action_15 (12) = happyShift action_2
action_15 (13) = happyShift action_5
action_15 (14) = happyShift action_6
action_15 (31) = happyShift action_7
action_15 (50) = happyShift action_8
action_15 (4) = happyGoto action_68
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_4
action_16 (12) = happyShift action_2
action_16 (13) = happyShift action_5
action_16 (14) = happyShift action_6
action_16 (31) = happyShift action_7
action_16 (50) = happyShift action_8
action_16 (4) = happyGoto action_67
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_4
action_17 (12) = happyShift action_2
action_17 (13) = happyShift action_5
action_17 (14) = happyShift action_6
action_17 (31) = happyShift action_7
action_17 (50) = happyShift action_8
action_17 (4) = happyGoto action_66
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_4
action_18 (12) = happyShift action_2
action_18 (13) = happyShift action_5
action_18 (14) = happyShift action_6
action_18 (31) = happyShift action_7
action_18 (50) = happyShift action_8
action_18 (4) = happyGoto action_43
action_18 (5) = happyGoto action_65
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (10) = happyShift action_4
action_19 (12) = happyShift action_2
action_19 (13) = happyShift action_5
action_19 (14) = happyShift action_6
action_19 (31) = happyShift action_7
action_19 (50) = happyShift action_8
action_19 (4) = happyGoto action_43
action_19 (5) = happyGoto action_64
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (10) = happyShift action_4
action_20 (12) = happyShift action_2
action_20 (13) = happyShift action_5
action_20 (14) = happyShift action_6
action_20 (31) = happyShift action_7
action_20 (50) = happyShift action_8
action_20 (4) = happyGoto action_43
action_20 (5) = happyGoto action_63
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_4
action_21 (12) = happyShift action_2
action_21 (13) = happyShift action_5
action_21 (14) = happyShift action_6
action_21 (31) = happyShift action_7
action_21 (50) = happyShift action_8
action_21 (4) = happyGoto action_62
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_4
action_22 (12) = happyShift action_2
action_22 (13) = happyShift action_5
action_22 (14) = happyShift action_6
action_22 (31) = happyShift action_7
action_22 (50) = happyShift action_8
action_22 (4) = happyGoto action_43
action_22 (5) = happyGoto action_61
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (10) = happyShift action_4
action_23 (12) = happyShift action_2
action_23 (13) = happyShift action_5
action_23 (14) = happyShift action_6
action_23 (31) = happyShift action_7
action_23 (50) = happyShift action_8
action_23 (4) = happyGoto action_43
action_23 (5) = happyGoto action_60
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (10) = happyShift action_59
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (10) = happyShift action_58
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (10) = happyShift action_57
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (10) = happyShift action_4
action_27 (12) = happyShift action_2
action_27 (13) = happyShift action_5
action_27 (14) = happyShift action_6
action_27 (31) = happyShift action_7
action_27 (50) = happyShift action_8
action_27 (4) = happyGoto action_56
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (10) = happyShift action_55
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (10) = happyShift action_54
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (10) = happyShift action_4
action_30 (12) = happyShift action_2
action_30 (13) = happyShift action_5
action_30 (14) = happyShift action_6
action_30 (31) = happyShift action_7
action_30 (50) = happyShift action_8
action_30 (4) = happyGoto action_52
action_30 (9) = happyGoto action_53
action_30 _ = happyReduce_46

action_31 (10) = happyShift action_4
action_31 (12) = happyShift action_2
action_31 (13) = happyShift action_5
action_31 (14) = happyShift action_6
action_31 (31) = happyShift action_7
action_31 (50) = happyShift action_8
action_31 (4) = happyGoto action_51
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (10) = happyShift action_4
action_32 (12) = happyShift action_2
action_32 (13) = happyShift action_5
action_32 (14) = happyShift action_6
action_32 (31) = happyShift action_7
action_32 (50) = happyShift action_8
action_32 (4) = happyGoto action_50
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_4
action_33 (12) = happyShift action_2
action_33 (13) = happyShift action_5
action_33 (14) = happyShift action_6
action_33 (31) = happyShift action_7
action_33 (50) = happyShift action_8
action_33 (4) = happyGoto action_49
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_4
action_34 (12) = happyShift action_2
action_34 (13) = happyShift action_5
action_34 (14) = happyShift action_6
action_34 (31) = happyShift action_7
action_34 (50) = happyShift action_8
action_34 (4) = happyGoto action_48
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (10) = happyShift action_4
action_35 (12) = happyShift action_2
action_35 (13) = happyShift action_5
action_35 (14) = happyShift action_6
action_35 (31) = happyShift action_7
action_35 (50) = happyShift action_8
action_35 (4) = happyGoto action_43
action_35 (5) = happyGoto action_47
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (10) = happyShift action_4
action_36 (12) = happyShift action_2
action_36 (13) = happyShift action_5
action_36 (14) = happyShift action_6
action_36 (31) = happyShift action_7
action_36 (50) = happyShift action_8
action_36 (4) = happyGoto action_46
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (10) = happyShift action_4
action_37 (12) = happyShift action_2
action_37 (13) = happyShift action_5
action_37 (14) = happyShift action_6
action_37 (31) = happyShift action_7
action_37 (50) = happyShift action_8
action_37 (4) = happyGoto action_45
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (10) = happyShift action_4
action_38 (12) = happyShift action_2
action_38 (13) = happyShift action_5
action_38 (14) = happyShift action_6
action_38 (31) = happyShift action_7
action_38 (50) = happyShift action_8
action_38 (4) = happyGoto action_43
action_38 (5) = happyGoto action_44
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (10) = happyShift action_4
action_39 (12) = happyShift action_2
action_39 (13) = happyShift action_5
action_39 (14) = happyShift action_6
action_39 (31) = happyShift action_7
action_39 (50) = happyShift action_8
action_39 (4) = happyGoto action_42
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (10) = happyShift action_4
action_40 (12) = happyShift action_2
action_40 (13) = happyShift action_5
action_40 (14) = happyShift action_6
action_40 (31) = happyShift action_7
action_40 (50) = happyShift action_8
action_40 (4) = happyGoto action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (11) = happyShift action_111
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (10) = happyShift action_4
action_42 (12) = happyShift action_2
action_42 (13) = happyShift action_5
action_42 (14) = happyShift action_6
action_42 (31) = happyShift action_7
action_42 (50) = happyShift action_8
action_42 (4) = happyGoto action_110
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (10) = happyShift action_4
action_43 (12) = happyShift action_2
action_43 (13) = happyShift action_5
action_43 (14) = happyShift action_6
action_43 (31) = happyShift action_7
action_43 (50) = happyShift action_8
action_43 (4) = happyGoto action_43
action_43 (5) = happyGoto action_109
action_43 _ = happyReduce_38

action_44 (11) = happyShift action_108
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (10) = happyShift action_4
action_45 (12) = happyShift action_2
action_45 (13) = happyShift action_5
action_45 (14) = happyShift action_6
action_45 (31) = happyShift action_7
action_45 (50) = happyShift action_8
action_45 (4) = happyGoto action_107
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (10) = happyShift action_4
action_46 (12) = happyShift action_2
action_46 (13) = happyShift action_5
action_46 (14) = happyShift action_6
action_46 (31) = happyShift action_7
action_46 (50) = happyShift action_8
action_46 (4) = happyGoto action_106
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (11) = happyShift action_105
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (11) = happyShift action_104
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (11) = happyShift action_103
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (11) = happyShift action_102
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (11) = happyShift action_101
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (10) = happyShift action_4
action_52 (12) = happyShift action_2
action_52 (13) = happyShift action_5
action_52 (14) = happyShift action_6
action_52 (31) = happyShift action_7
action_52 (50) = happyShift action_8
action_52 (4) = happyGoto action_52
action_52 (9) = happyGoto action_100
action_52 _ = happyReduce_46

action_53 (11) = happyShift action_99
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (31) = happyShift action_98
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (32) = happyShift action_97
action_55 (8) = happyGoto action_96
action_55 _ = happyReduce_44

action_56 (10) = happyShift action_4
action_56 (12) = happyShift action_2
action_56 (13) = happyShift action_5
action_56 (14) = happyShift action_6
action_56 (31) = happyShift action_7
action_56 (50) = happyShift action_8
action_56 (4) = happyGoto action_95
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (31) = happyShift action_94
action_57 (7) = happyGoto action_93
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (32) = happyShift action_91
action_58 (6) = happyGoto action_92
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (32) = happyShift action_91
action_59 (6) = happyGoto action_90
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (11) = happyShift action_89
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (11) = happyShift action_88
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (11) = happyShift action_87
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (11) = happyShift action_86
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (11) = happyShift action_85
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (11) = happyShift action_84
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (10) = happyShift action_4
action_66 (12) = happyShift action_2
action_66 (13) = happyShift action_5
action_66 (14) = happyShift action_6
action_66 (31) = happyShift action_7
action_66 (50) = happyShift action_8
action_66 (4) = happyGoto action_83
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (11) = happyShift action_82
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (11) = happyShift action_81
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (11) = happyShift action_80
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (11) = happyShift action_79
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (11) = happyShift action_78
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (11) = happyShift action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (11) = happyShift action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (11) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_22

action_76 _ = happyReduce_4

action_77 _ = happyReduce_5

action_78 _ = happyReduce_6

action_79 _ = happyReduce_7

action_80 _ = happyReduce_8

action_81 _ = happyReduce_9

action_82 _ = happyReduce_10

action_83 (11) = happyShift action_124
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_12

action_85 _ = happyReduce_13

action_86 _ = happyReduce_14

action_87 _ = happyReduce_15

action_88 _ = happyReduce_16

action_89 _ = happyReduce_17

action_90 (11) = happyShift action_123
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (31) = happyShift action_122
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (11) = happyShift action_121
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (11) = happyShift action_120
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (31) = happyShift action_94
action_94 (7) = happyGoto action_119
action_94 _ = happyReduce_42

action_95 (10) = happyShift action_4
action_95 (12) = happyShift action_2
action_95 (13) = happyShift action_5
action_95 (14) = happyShift action_6
action_95 (31) = happyShift action_7
action_95 (50) = happyShift action_8
action_95 (4) = happyGoto action_118
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (11) = happyShift action_117
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (10) = happyShift action_4
action_97 (12) = happyShift action_2
action_97 (13) = happyShift action_5
action_97 (14) = happyShift action_6
action_97 (31) = happyShift action_7
action_97 (50) = happyShift action_8
action_97 (4) = happyGoto action_116
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (10) = happyShift action_4
action_98 (12) = happyShift action_2
action_98 (13) = happyShift action_5
action_98 (14) = happyShift action_6
action_98 (31) = happyShift action_7
action_98 (50) = happyShift action_8
action_98 (4) = happyGoto action_115
action_98 _ = happyFail (happyExpListPerState 98)

action_99 _ = happyReduce_26

action_100 _ = happyReduce_47

action_101 _ = happyReduce_27

action_102 _ = happyReduce_28

action_103 _ = happyReduce_29

action_104 _ = happyReduce_30

action_105 _ = happyReduce_31

action_106 (11) = happyShift action_114
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (11) = happyShift action_113
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_34

action_109 _ = happyReduce_39

action_110 (11) = happyShift action_112
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_36

action_112 _ = happyReduce_35

action_113 _ = happyReduce_33

action_114 _ = happyReduce_32

action_115 (11) = happyShift action_132
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (10) = happyShift action_4
action_116 (12) = happyShift action_2
action_116 (13) = happyShift action_5
action_116 (14) = happyShift action_6
action_116 (31) = happyShift action_7
action_116 (50) = happyShift action_8
action_116 (4) = happyGoto action_131
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (10) = happyShift action_130
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (11) = happyShift action_129
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_43

action_120 (10) = happyShift action_4
action_120 (12) = happyShift action_2
action_120 (13) = happyShift action_5
action_120 (14) = happyShift action_6
action_120 (31) = happyShift action_7
action_120 (50) = happyShift action_8
action_120 (4) = happyGoto action_128
action_120 _ = happyFail (happyExpListPerState 120)

action_121 (10) = happyShift action_4
action_121 (12) = happyShift action_2
action_121 (13) = happyShift action_5
action_121 (14) = happyShift action_6
action_121 (31) = happyShift action_7
action_121 (50) = happyShift action_8
action_121 (4) = happyGoto action_127
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (10) = happyShift action_4
action_122 (12) = happyShift action_2
action_122 (13) = happyShift action_5
action_122 (14) = happyShift action_6
action_122 (31) = happyShift action_7
action_122 (50) = happyShift action_8
action_122 (4) = happyGoto action_126
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (10) = happyShift action_4
action_123 (12) = happyShift action_2
action_123 (13) = happyShift action_5
action_123 (14) = happyShift action_6
action_123 (31) = happyShift action_7
action_123 (50) = happyShift action_8
action_123 (4) = happyGoto action_125
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_11

action_125 (11) = happyShift action_139
action_125 _ = happyFail (happyExpListPerState 125)

action_126 (33) = happyShift action_138
action_126 _ = happyFail (happyExpListPerState 126)

action_127 (11) = happyShift action_137
action_127 _ = happyFail (happyExpListPerState 127)

action_128 (11) = happyShift action_136
action_128 _ = happyFail (happyExpListPerState 128)

action_129 _ = happyReduce_23

action_130 (37) = happyShift action_135
action_130 _ = happyFail (happyExpListPerState 130)

action_131 (33) = happyShift action_134
action_131 _ = happyFail (happyExpListPerState 131)

action_132 (10) = happyShift action_4
action_132 (12) = happyShift action_2
action_132 (13) = happyShift action_5
action_132 (14) = happyShift action_6
action_132 (31) = happyShift action_7
action_132 (50) = happyShift action_8
action_132 (4) = happyGoto action_133
action_132 _ = happyFail (happyExpListPerState 132)

action_133 (11) = happyShift action_143
action_133 _ = happyFail (happyExpListPerState 133)

action_134 (32) = happyShift action_97
action_134 (8) = happyGoto action_142
action_134 _ = happyReduce_44

action_135 (10) = happyShift action_4
action_135 (12) = happyShift action_2
action_135 (13) = happyShift action_5
action_135 (14) = happyShift action_6
action_135 (31) = happyShift action_7
action_135 (50) = happyShift action_8
action_135 (4) = happyGoto action_141
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_21

action_137 _ = happyReduce_19

action_138 (32) = happyShift action_91
action_138 (6) = happyGoto action_140
action_138 _ = happyReduce_40

action_139 _ = happyReduce_18

action_140 _ = happyReduce_41

action_141 (11) = happyShift action_144
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_45

action_143 _ = happyReduce_25

action_144 (11) = happyShift action_145
action_144 _ = happyFail (happyExpListPerState 144)

action_145 _ = happyReduce_24

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TkNum happy_var_1))
	 =  HappyAbsSyn4
		 (SNum happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (SBoolean Tr
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (SBoolean Fl
	)

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SAdd happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SSub happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SMult happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SDiv happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SAdd1 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SSub1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SSqrt happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SExpt happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLt happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SGt happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SEq happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SNot happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SOr happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SAnd happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 7 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLet happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 7 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLetS happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  4 happyReduction_20
happyReduction_20 (HappyTerminal (TkId happy_var_1))
	 =  HappyAbsSyn4
		 (SId happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 7 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLambda happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SApp happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SIf happy_var_3 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 10 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SCond happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 8 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyTerminal (TkId happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLetRec (SId happy_var_4) happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 4 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SListC happy_var_3
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 4 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SHead happy_var_3
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 4 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (STail happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 4 4 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLength happy_var_3
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 4 4 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SReverse happy_var_3
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 4 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SConcat happy_var_3
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 5 4 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SMap happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 5 4 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SFilter happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 4 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SConcatS happy_var_3
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 5 4 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SAt happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 4 4 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SLsToStr happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  4 happyReduction_37
happyReduction_37 (HappyTerminal (TkTxt happy_var_1))
	 =  HappyAbsSyn4
		 (SString happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  5 happyReduction_38
happyReduction_38 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  5 happyReduction_39
happyReduction_39 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 4 6 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TkId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ([(SId happy_var_2, happy_var_3)]
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 5 6 happyReduction_41
happyReduction_41 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TkId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((SId happy_var_2, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  7 happyReduction_42
happyReduction_42 (HappyTerminal (TkId happy_var_1))
	 =  HappyAbsSyn7
		 ([(SId happy_var_1)]
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  7 happyReduction_43
happyReduction_43 (HappyAbsSyn7  happy_var_2)
	(HappyTerminal (TkId happy_var_1))
	 =  HappyAbsSyn7
		 ((SId happy_var_1) : happy_var_2
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  8 happyReduction_44
happyReduction_44  =  HappyAbsSyn8
		 ([]
	)

happyReduce_45 = happyReduce 5 8 happyReduction_45
happyReduction_45 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_2, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_0  9 happyReduction_46
happyReduction_46  =  HappyAbsSyn9
		 ([]
	)

happyReduce_47 = happySpecReduce_2  9 happyReduction_47
happyReduction_47 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkBrO -> cont 10;
	TkBrC -> cont 11;
	TkNum happy_dollar_dollar -> cont 12;
	TkTrue -> cont 13;
	TkFalse -> cont 14;
	TkAdd -> cont 15;
	TkSub -> cont 16;
	TkMult -> cont 17;
	TkDiv -> cont 18;
	TkAdd1 -> cont 19;
	TkSub1 -> cont 20;
	TkSqrt -> cont 21;
	TkExpt -> cont 22;
	TkLt -> cont 23;
	TkGt -> cont 24;
	TkEq -> cont 25;
	TkNot -> cont 26;
	TkOr -> cont 27;
	TkAnd -> cont 28;
	TkLet -> cont 29;
	TkLetS -> cont 30;
	TkId happy_dollar_dollar -> cont 31;
	TkSqBrO -> cont 32;
	TkSqBrC -> cont 33;
	TkLambda -> cont 34;
	TkIf -> cont 35;
	TkCond -> cont 36;
	TkElse -> cont 37;
	TkLetRec -> cont 38;
	TkListC -> cont 39;
	TkHead -> cont 40;
	TkTail -> cont 41;
	TkLength -> cont 42;
	TkReverse -> cont 43;
	TkConcat -> cont 44;
	TkMap -> cont 45;
	TkFilter -> cont 46;
	TkSConcat -> cont 47;
	TkAt -> cont 48;
	TkLsToStr -> cont 49;
	TkTxt happy_dollar_dollar -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
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
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError x = error "Parse error"

-- No sé si así están bien los booleanos pero así se me ocurrió implementarlos y parece que funciona bien
data Bl = Tr | Fl

data SASA = SNum Double
         | SBoolean Bl
         | SAdd [SASA]
         | SSub [SASA]
         | SMult [SASA]
         | SDiv [SASA]
         | SAdd1 SASA
         | SSub1 SASA
         | SSqrt SASA
         | SExpt SASA SASA
         | SLt [SASA]
         | SGt [SASA]
         | SEq [SASA]
         | SNot SASA
         | SOr [SASA]
         | SAnd [SASA]
         | SId String
         | SLet [(SASA, SASA)] SASA
         | SLetS [(SASA, SASA)] SASA
         | SLambda [SASA] SASA
         | SApp SASA [SASA]
         | SIf SASA SASA SASA
         | SCond [(SASA, SASA)] SASA
         | SLetRec SASA SASA SASA
         | SListC [SASA]
         | SHead SASA
         | STail SASA
         | SLength SASA
         | SReverse SASA
         | SConcat [SASA]
         | SMap SASA SASA
         | SFilter SASA SASA
         | SConcatS [SASA]
         | SAt SASA SASA
         | SLsToStr SASA
         | SString String

intercala :: [String] -> String -> [String]
intercala [x] _ = [x]
intercala (x:xs) s = [x] ++ [s] ++ intercala xs s

showlsasa :: [SASA] -> String
showlsasa [] = ""
showlsasa lsasa = concat (intercala (map show lsasa) " ")

showlsasatup :: [(SASA, SASA)] -> String
showlsasatup [] = ""
showlsasatup lsasa = concat (intercala (map (\(x, y) -> "["++show x++" "++show y++"]") lsasa) " ")

showsvars :: [(SASA, SASA)] -> String
showsvars [] = ""
showsvars vars = concat (intercala (map (\(var, val) -> "[" ++ show var ++ " " ++ show val ++ "]") vars) " ")

instance Show SASA where
  show (SNum n) = show n
  show (SBoolean Tr) = "#t"
  show (SBoolean Fl) = "#f"
  show (SAdd lasa) = "(+ " ++ showlsasa lasa ++ ")"
  show (SSub lasa) = "(- " ++ showlsasa lasa ++ ")"
  show (SMult lasa) = "(* " ++ showlsasa lasa ++ ")"
  show (SDiv lasa) = "(/ " ++ showlsasa lasa ++ ")"
  show (SAdd1 asa) = "(add1 " ++ show asa ++ ")"
  show (SSub1 asa) = "(sub1 " ++ show asa ++ ")"
  show (SSqrt asa) = "(sqrt " ++ show asa ++ ")"
  show (SExpt asa1 asa2) = "(expt " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (SLt lasa) = "(< " ++ showlsasa lasa ++ ")"
  show (SGt lasa) = "(> " ++ showlsasa lasa ++ ")"
  show (SEq lasa) = "(= " ++ showlsasa lasa ++ ")"
  show (SNot asa) = "(not " ++ show asa ++ ")"
  show (SOr lasa) = "(or " ++ showlsasa lasa ++ ")"
  show (SAnd lasa) = "(and " ++ showlsasa lasa ++ ")"
  show (SLet vars asa) = "(let (" ++ showsvars vars  ++ ")" ++ " " ++ show asa ++ ")"
  show (SLetS vars asa) = "(let* (" ++ showsvars vars  ++ ")" ++ " " ++ show asa ++ ")"
  show (SId var) = var
  show (SLambda lasa asa) = "(lambda (" ++ showlsasa lasa ++ ") " ++ show asa ++ ")"
  show (SApp asa lasa) = "(" ++ show asa ++ " " ++ showlsasa lasa ++ ")"
  show (SIf asa1 asa2 asa3) = "(if " ++ show asa1 ++ " " ++ show asa2 ++ " " ++ show asa3 ++ ")"
  show (SCond lasa asa) = "(cond (" ++ showsvars lasa ++ ") (else " ++ show asa ++ "))"
  show (SLetRec id val asa) = "(letrec (" ++ show id ++ " " ++ show val ++ ")" ++ " " ++ show asa ++ ")"
  show (SListC lasa) = "(list "++ showlsasa lasa ++")"
  show (SHead asa) = "(head "++show asa++")"
  show (STail asa) = "(tail "++show asa++")"
  show (SLength asa) = "(length "++show asa++")"
  show (SReverse asa) = "(reverse "++show asa++")"
  show (SConcat lasa) = "(concat "++showlsasa lasa++")"
  show (SMap asa1 asa2) = "(map "++show asa1++" "++show asa2++")"
  show (SFilter asa1 asa2) = "(filter "++show asa1++" "++show asa2++")"
  show (SConcatS lasa) = "(sconcat "++showlsasa lasa++")"
  show (SAt asa1 asa2) = "(at "++show asa1++" "++show asa2++")"
  show (SLsToStr asa) = "(lstostr "++show asa++")"
  show (SString s) = "\""++s++"\""
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
