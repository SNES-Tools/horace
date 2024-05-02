module Instructions where

import Prettyprinter
import Prettyprinter.Render.Text
import System.IO

import Data.List (intercalate)
import Data.Word (Word16, Word32, Word8)

{-

The reference for 65816 instructions is at
http://www.6502.org/tutorials/65c816opcodes.html

Regarding pretty printing: should the compiler generate assembly code that we
can run through a 65816 assembler, or should we just go ahead and generate the
binary directly? (This would require more work and I'm not sure we would get
extra benefit from this.)

-}
{-
This type holds all possible opcodes in 65816, and labels.
-}
data Instruction
  = ADC Operand
  | SBC Operand
  | CMP Operand
  | CPX Operand
  | CPY Operand
  | DEC Operand
  | DEX
  | DEY
  | INC Operand
  | INX
  | INY
  | AND Operand
  | EOR Operand
  | ORA Operand
  | BIT Operand
  | TRB Operand
  | TSB Operand
  | ASL Operand
  | LSR Operand
  | ROL Operand
  | ROR Operand
  | BCC Operand
  | BCS Operand
  | BEQ Operand
  | BMI Operand
  | BNE Operand
  | BPL Operand
  | BRA Operand
  | BVC Operand
  | BVS Operand
  | BRL Operand
  | JMP Operand
  | JSL Operand
  | JSR Operand
  | RTL
  | RTS
  | BRK Operand
  | COP Operand
  | RTI
  | CLC
  | CLD
  | CLI
  | CLV
  | SEC
  | SED
  | SEI
  | REP Operand
  | SEP Operand
  | LDA Operand
  | LDX Operand
  | LDY Operand
  | STA Operand
  | STX Operand
  | STY Operand
  | STZ Operand
  | MVN Operand Operand
  | MVP Operand Operand
  | NOP
  | WDM Operand
  | PEA Operand
  | PEI Operand
  | PER Operand
  | PHA
  | PHX
  | PHY
  | PLA
  | PLX
  | PLY
  | PHB
  | PHD
  | PHK
  | PHP
  | PLB
  | PLD
  | PLP
  | STP
  | WAI
  | TAX
  | TAY
  | TSX
  | TXA
  | TXS
  | TXY
  | TYA
  | TYX
  | TCD
  | TCS
  | TDC
  | TSC
  | XBA
  | XCE
  | Label String -- here is the label
  | TableDataWord [Word16]
  | Table [String]
  | IncBin String
  deriving (Show)

{-
These are all the possible operand types. Note that the use of a specific
operand types

here, ind = indirect

I have exposed some confusion around labels, at least regarding the assembler
(asar) that I am used to using. Labels are strictly a standin for addresses.
Since most operand types refer to addresses, labels can be substitued in this
portions as well. Should our compiler try to turn every memory allocation into
a label, and use labels everywhere? That would make it easier to inspect
compiled code.
-}
data Operand
  = Imm8 Word8 -- immediate size doesn't change the opcode, but assembler...
  | Imm16 Word16 -- still needs to know size due to variable width registers
  | Abs Word16
  | AbsX Word16
  | AbsY Word16
  | Dir Word8
  | DirX Word8
  | DirY Word8
  | Accumulator -- only used to specify no operand in INC and DEC
  | DirInd Word8
  | Long Word32 -- this should really be 24 bits
  | LongX Word32 -- this should really be 24 bits
  | DirIndLong Word8
  | DirIndY Word8
  | DirXInd Word8
  | AbsInd Word16
  | AbsIndLong Word16
  | AbsXInd Word16
  | DirIndLongY Word8
  | Stack Word8
  | StackIndY Word8
  | Label8 String -- labels for the purpose of (not long) branches
  | Label16 String -- location defined
  | Label24 String -- location defined
  | LabelXInd String
  deriving (Show)

isValidOperand :: Instruction -> Bool
isValidOperand (ADC operand) = isCommonOp operand
isValidOperand (SBC operand) = isCommonOp operand
isValidOperand (CMP operand) = isCommonOp operand
isValidOperand (CPX operand) = isCompareOp operand
isValidOperand (CPY operand) = isCompareOp operand
isValidOperand (DEC operand) = isShiftOp operand
isValidOperand (INC operand) = isShiftOp operand
isValidOperand (AND operand) = isCommonOp operand
isValidOperand (EOR operand) = isCommonOp operand
isValidOperand (ORA operand) = isCommonOp operand
isValidOperand (BIT operand) = isBitOp operand
isValidOperand (TRB operand) = isTestOp operand
isValidOperand (TSB operand) = isTestOp operand
isValidOperand (ASL operand) = isShiftOp operand
isValidOperand (LSR operand) = isShiftOp operand
isValidOperand (ROR operand) = isShiftOp operand
isValidOperand (ROL operand) = isShiftOp operand
isValidOperand (BCC operand) = isBranchOp operand
isValidOperand (BCS operand) = isBranchOp operand
isValidOperand (BEQ operand) = isBranchOp operand
isValidOperand (BMI operand) = isBranchOp operand
isValidOperand (BNE operand) = isBranchOp operand
isValidOperand (BPL operand) = isBranchOp operand
isValidOperand (BRA operand) = isBranchOp operand
isValidOperand (BVC operand) = isBranchOp operand
isValidOperand (BRL (Label16 _)) = True -- only valid operand type
isValidOperand (JMP operand) = isJumpOp operand
isValidOperand (JSL (Label24 _)) = True -- only valid operand type
isValidOperand (JSR operand) = isJsrOp operand
isValidOperand (BRK (Imm8 _)) = True -- only valid operand type
isValidOperand (COP (Imm8 _)) = True -- only valid operand type
isValidOperand (REP (Imm8 _)) = True -- only valid operand type
isValidOperand (SEP (Imm8 _)) = True -- only valid operand type
isValidOperand (LDA operand) = isCommonOp operand
isValidOperand (LDX operand) = isLoadXOp operand
isValidOperand (LDY operand) = isLoadYOp operand
isValidOperand (STA (Imm8 _)) = False -- forbid store to immediate
isValidOperand (STA (Imm16 _)) = False -- forbid store to immediate
isValidOperand (STA operand) = isCommonOp operand -- all other common ops okay
isValidOperand (STX operand) = isStoreXOp operand
isValidOperand (STY operand) = isStoreYOp operand
isValidOperand (STZ operand) = isStoreZOp operand
isValidOperand (MVN (Imm8 _) (Imm8 _)) = True -- only valid operand type
isValidOperand (MVP (Imm8 _) (Imm8 _)) = True -- only valid operand type
isValidOperand (WDM (Imm8 _)) = True -- only valid operand type
isValidOperand (PEA (Imm16 _)) = True -- only valid operand type
isValidOperand (PEI (Dir _)) = True -- only valid operand type
isValidOperand (PER (Label16 _)) = True -- only valid operand type
isValidOperand _ = False -- everything else is false

-- "common" operands are for the set of  arithmetic/memory instructions
-- which all accept a lot (15) of operand types
isCommonOp :: Operand -> Bool
isCommonOp (DirXInd _) = True
isCommonOp (Stack _) = True
isCommonOp (Dir _) = True
isCommonOp (DirIndLong _) = True
isCommonOp (Imm8 _) = True
isCommonOp (Imm16 _) = True
isCommonOp (Abs _) = True
isCommonOp (Long _) = True
isCommonOp (DirIndY _) = True
isCommonOp (DirInd _) = True
isCommonOp (StackIndY _) = True
isCommonOp (DirX _) = True
isCommonOp (DirIndLongY _) = True
isCommonOp (AbsY _) = True
isCommonOp (AbsX _) = True
isCommonOp (LongX _) = True
isCommonOp _ = False

-- operand types for CPX and CPY
isCompareOp :: Operand -> Bool
isCompareOp (Imm8 _) = True
isCompareOp (Imm16 _) = True
isCompareOp (Dir _) = True
isCompareOp (Abs _) = True
isCompareOp _ = False

-- operand types for INC, DEC, ASL, LSR, ROL, ROR
isShiftOp :: Operand -> Bool
isShiftOp Accumulator = True
isShiftOp (Dir _) = True
isShiftOp (Abs _) = True
isShiftOp (DirX _) = True
isShiftOp (AbsX _) = True
isShiftOp _ = False

-- operand types for BIT
isBitOp :: Operand -> Bool
isBitOp (Dir _) = True
isBitOp (Abs _) = True
isBitOp (DirX _) = True
isBitOp (AbsX _) = True
isBitOp (Imm8 _) = True
isBitOp (Imm16 _) = True
isBitOp _ = False

-- operand types for TRB and TSB
isTestOp :: Operand -> Bool
isTestOp (Dir _) = True
isTestOp (Abs _) = True
isTestOp _ = False

-- operand types for BCC, BCS, BEQ, BMI, BNE, BPL, BRA, BVC, BVS
isBranchOp :: Operand -> Bool
isBranchOp (Label8 _) = True
isBranchOp _ = False

-- operand types for JMP
isJumpOp :: Operand -> Bool
isJumpOp (Label16 _) = True
isJumpOp (Label24 _) = True
isJumpOp (AbsInd _) = True -- but these can be labels!
isJumpOp (AbsXInd _) = True -- but these can be labels!
isJumpOp (AbsIndLong _) = True -- but these can be labels!
isJumpOp _ = False

-- operand types for JSR
isJsrOp :: Operand -> Bool
isJsrOp (Label16 _) = True
isJsrOp (AbsXInd _) = True -- but these can be labels!
isJsrOp _ = False

-- operand types for LDX
isLoadXOp :: Operand -> Bool
isLoadXOp (Imm8 _) = True
isLoadXOp (Imm16 _) = True
isLoadXOp (Abs _) = True
isLoadXOp (AbsY _) = True
isLoadXOp (Dir _) = True
isLoadXOp (DirY _) = True
isLoadXOp _ = False

-- operand types for LDY
isLoadYOp :: Operand -> Bool
isLoadYOp (Imm8 _) = True
isLoadYOp (Imm16 _) = True
isLoadYOp (Abs _) = True
isLoadYOp (AbsX _) = True
isLoadYOp (Dir _) = True
isLoadYOp (DirX _) = True
isLoadYOp _ = False

-- operand types for STX
isStoreXOp :: Operand -> Bool
isStoreXOp (Abs _) = True
isStoreXOp (Dir _) = True
isStoreXOp (DirY _) = True
isStoreXOp _ = False

-- operand types for STY
isStoreYOp :: Operand -> Bool
isStoreYOp (Abs _) = True
isStoreYOp (Dir _) = True
isStoreYOp (DirX _) = True
isStoreYOp _ = False

-- operand types for STZ
isStoreZOp :: Operand -> Bool
isStoreZOp (Abs _) = True
isStoreZOp (AbsX _) = True
isStoreZOp (Dir _) = True
isStoreZOp (DirX _) = True
isStoreZOp _ = False

{-
Addressing addressing modes:

There are many addressing modes, and many instructions that take operands only
support a few of the addressing modes. I'm not sure if we can assert only
correct addresing modes in the types (without having multiple copies of the
same constructor lying around) or if we must throw runtime errors for
misused addressing modes.

Additionally, some instructions imply the operand through different mnemonics
(for example, PHA, PHX, PHY, etc. for pushing to the stack). We could possibly
change the Haskell representation for a single push and expose the operand as
an parameter on the constructor (so it would be like PUSH A, PUSH X, etc.).

For example, we could use the nocash syntax
(https://problemkaputt.de/fullsnes.htm#cpu65xxmicroprocessor)
which turns the various register-to-register transfer instructinos into MOVs:

  Opcode    Flags Clks  Native  Nocash    Bits  Effect
  A8        nz----  2   TAY     MOV Y,A   x     Y=A
  AA        nz----  2   TAX     MOV X,A   x     X=A
  BA        nz----  2   TSX     MOV X,S   x     X=S
  98        nz----  2   TYA     MOV A,Y   m     A=Y
  8A        nz----  2   TXA     MOV A,X   m     A=X
  9A        ------  2   TXS     MOV S,X   e     S=X
  9B        nz----  2   TXY     MOV Y,X   x     Y=X
  BB        nz----  2   TYX     MOV X,Y   x     X=Y
  7B        nz----  2   TDC     MOV A,D   16    A=D
  5B        nz----  2   TCD     MOV D,A   16    D=A
  3B        nz----  2   TSC     MOV A,SP  16    A=SP
  1B        ------  2   TCS     MOV SP,A  e?    SP=A

Is this worth it?

-}
sizeof :: Instruction -> Word
sizeof (ADC o) = 1 + sizeofOperand o
sizeof (SBC o) = 1 + sizeofOperand o
sizeof (CMP o) = 1 + sizeofOperand o
sizeof (CPX o) = 1 + sizeofOperand o
sizeof (CPY o) = 1 + sizeofOperand o
sizeof (DEC o) = 1 + sizeofOperand o
sizeof (INC o) = 1 + sizeofOperand o
sizeof (AND o) = 1 + sizeofOperand o
sizeof (EOR o) = 1 + sizeofOperand o
sizeof (ORA o) = 1 + sizeofOperand o
sizeof (BIT o) = 1 + sizeofOperand o
sizeof (TRB o) = 1 + sizeofOperand o
sizeof (TSB o) = 1 + sizeofOperand o
sizeof (ASL o) = 1 + sizeofOperand o
sizeof (LSR o) = 1 + sizeofOperand o
sizeof (ROL o) = 1 + sizeofOperand o
sizeof (ROR o) = 1 + sizeofOperand o
sizeof (BCC o) = 1 + sizeofOperand o
sizeof (BCS o) = 1 + sizeofOperand o
sizeof (BEQ o) = 1 + sizeofOperand o
sizeof (BMI o) = 1 + sizeofOperand o
sizeof (BNE o) = 1 + sizeofOperand o
sizeof (BPL o) = 1 + sizeofOperand o
sizeof (BRA o) = 1 + sizeofOperand o
sizeof (BVC o) = 1 + sizeofOperand o
sizeof (BVS o) = 1 + sizeofOperand o
sizeof (BRL o) = 1 + sizeofOperand o
sizeof (JMP o) = 1 + sizeofOperand o
sizeof (JSL o) = 1 + sizeofOperand o
sizeof (JSR o) = 1 + sizeofOperand o
sizeof (BRK o) = 1 + sizeofOperand o
sizeof (COP o) = 1 + sizeofOperand o
sizeof (REP o) = 1 + sizeofOperand o
sizeof (SEP o) = 1 + sizeofOperand o
sizeof (LDA o) = 1 + sizeofOperand o
sizeof (LDX o) = 1 + sizeofOperand o
sizeof (LDY o) = 1 + sizeofOperand o
sizeof (STA o) = 1 + sizeofOperand o
sizeof (STX o) = 1 + sizeofOperand o
sizeof (STY o) = 1 + sizeofOperand o
sizeof (STZ o) = 1 + sizeofOperand o
sizeof (MVN _ _) = 3
sizeof (MVP _ _) = 3
sizeof (WDM o) = 1 + sizeofOperand o
sizeof (PEA o) = 1 + sizeofOperand o
sizeof (PEI o) = 1 + sizeofOperand o
sizeof (PER o) = 1 + sizeofOperand o
sizeof (Label s) = 0
sizeof _ = 1 -- all instructions without operands

sizeofOperand :: Operand -> Word
sizeofOperand (Imm8 w) = 1
sizeofOperand (Imm16 w) = 2
sizeofOperand (Abs w) = 2
sizeofOperand (AbsX w) = 2
sizeofOperand (AbsY w) = 2
sizeofOperand (Dir w) = 1
sizeofOperand (DirX w) = 1
sizeofOperand (DirY w) = 1
sizeofOperand (Accumulator) = 0
sizeofOperand (DirInd w) = 1
sizeofOperand (Long w) = 3
sizeofOperand (LongX w) = 3
sizeofOperand (DirIndLong w) = 1
sizeofOperand (DirIndY w) = 1
sizeofOperand (DirXInd w) = 1
sizeofOperand (AbsInd w) = 2
sizeofOperand (AbsIndLong w) = 2
sizeofOperand (AbsXInd w) = 2
sizeofOperand (DirIndLongY w) = 1
sizeofOperand (Stack w) = 1
sizeofOperand (StackIndY w) = 1
sizeofOperand (Label8 s) = 1
sizeofOperand (Label16 s) = 2
sizeofOperand (Label24 s) = 3

instance Pretty Instruction where
  pretty (ADC o) = indent 4 (group (pretty "ADC" <> pretty o))
  pretty (SBC o) = indent 4 (group (pretty "SBC" <> pretty o))
  pretty (CMP o) = indent 4 (group (pretty "CMP" <> pretty o))
  pretty (CPX o) = indent 4 (group (pretty "CPX" <> pretty o))
  pretty (CPY o) = indent 4 (group (pretty "CPY" <> pretty o))
  pretty (DEC o) = indent 4 (group (pretty "DEC" <> pretty o))
  pretty (DEX) = indent 4 (pretty "DEX")
  pretty (DEY) = pretty "DEY"
  pretty (INC o) = indent 4 (group (pretty "INC" <> pretty o))
  pretty (INX) = indent 4 (pretty "INX")
  pretty (INY) = indent 4 (pretty "INY")
  pretty (AND o) = indent 4 (group (pretty "AND" <> pretty o))
  pretty (EOR o) = indent 4 (group (pretty "EOR" <> pretty o))
  pretty (ORA o) = indent 4 (group (pretty "ORA" <> pretty o))
  pretty (BIT o) = indent 4 (group (pretty "BIT" <> pretty o))
  pretty (TRB o) = indent 4 (group (pretty "TRB" <> pretty o))
  pretty (TSB o) = indent 4 (group (pretty "TSB" <> pretty o))
  pretty (ASL o) = indent 4 (group (pretty "ASL" <> pretty o))
  pretty (LSR o) = indent 4 (group (pretty "LSR" <> pretty o))
  pretty (ROL o) = indent 4 (group (pretty "ROL" <> pretty o))
  pretty (ROR o) = indent 4 (group (pretty "ROR" <> pretty o))
  pretty (BCC o) = indent 4 (group (pretty "BCC" <> pretty o))
  pretty (BCS o) = indent 4 (group (pretty "BCS" <> pretty o))
  pretty (BEQ o) = indent 4 (group (pretty "BEQ" <> pretty o))
  pretty (BMI o) = indent 4 (group (pretty "BMI" <> pretty o))
  pretty (BNE o) = indent 4 (group (pretty "BNE" <> pretty o))
  pretty (BPL o) = indent 4 (group (pretty "BPL" <> pretty o))
  pretty (BRA o) = indent 4 (group (pretty "BRA" <> pretty o))
  pretty (BVC o) = indent 4 (group (pretty "BVC" <> pretty o))
  pretty (BVS o) = indent 4 (group (pretty "BVS" <> pretty o))
  pretty (BRL o) = indent 4 (group (pretty "BRL" <> pretty o))
  pretty (JMP o) = indent 4 (group (pretty "JMP" <> pretty o))
  pretty (JSL o) = indent 4 (group (pretty "JSL" <> pretty o))
  pretty (JSR o) = indent 4 (group (pretty "JSR" <> pretty o))
  pretty (RTL) = indent 4 (pretty "RTL")
  pretty (RTS) = indent 4 (pretty "RTS")
  pretty (BRK o) = indent 4 (group (pretty "BRK" <> pretty o))
  pretty (COP o) = indent 4 (group (pretty "COP" <> pretty o))
  pretty (RTI) = indent 4 (pretty "RTI")
  pretty (CLC) = indent 4 (pretty "CLC")
  pretty (CLD) = indent 4 (pretty "CLD")
  pretty (CLI) = indent 4 (pretty "CLI")
  pretty (CLV) = indent 4 (pretty "CLV")
  pretty (SEC) = indent 4 (pretty "SEC")
  pretty (SED) = indent 4 (pretty "SED")
  pretty (SEI) = indent 4 (pretty "SEI")
  pretty (REP o) = indent 4 (group (pretty "REP" <> pretty o))
  pretty (SEP o) = indent 4 (group (pretty "SEP" <> pretty o))
  pretty (LDA o) = indent 4 (group (pretty "LDA" <> pretty o))
  pretty (LDX o) = indent 4 (group (pretty "LDX" <> pretty o))
  pretty (LDY o) = indent 4 (group (pretty "LDY" <> pretty o))
  pretty (STA o) = indent 4 (group (pretty "STA" <> pretty o))
  pretty (STX o) = indent 4 (group (pretty "STX" <> pretty o))
  pretty (STY o) = indent 4 (group (pretty "STY" <> pretty o))
  pretty (STZ o) = indent 4 (group (pretty "STZ" <> pretty o))
  pretty (MVN (Imm8 i1) (Imm8 i2)) =
    indent 4 (group (pretty "MVN" <> pretty i1 <> pretty "," <> pretty i2))
  pretty (MVP (Imm8 i1) (Imm8 i2)) =
    indent 4 (group (pretty "MVP" <> pretty i1 <> pretty "," <> pretty i2))
  pretty (NOP) = indent 4 (pretty "NOP")
  pretty (WDM o) = indent 4 (group (pretty "WDM" <> pretty o))
  pretty (PEA o) = indent 4 (group (pretty "PEA" <> pretty o))
  pretty (PEI o) = indent 4 (group (pretty "PEI" <> pretty o))
  pretty (PER o) = indent 4 (group (pretty "PER" <> pretty o))
  pretty (PHA) = indent 4 (pretty "PHA")
  pretty (PHX) = indent 4 (pretty "PHX")
  pretty (PHY) = indent 4 (pretty "PHY")
  pretty (PLA) = indent 4 (pretty "PLA")
  pretty (PLX) = indent 4 (pretty "PLX")
  pretty (PLY) = indent 4 (pretty "PLY")
  pretty (PHB) = indent 4 (pretty "PHB")
  pretty (PHD) = indent 4 (pretty "PHD")
  pretty (PHK) = indent 4 (pretty "PHK")
  pretty (PHP) = indent 4 (pretty "PHP")
  pretty (PLB) = indent 4 (pretty "PLB")
  pretty (PLD) = indent 4 (pretty "PLD")
  pretty (PLP) = indent 4 (pretty "PLP")
  pretty (STP) = indent 4 (pretty "STP")
  pretty (WAI) = indent 4 (pretty "WAI")
  pretty (TAX) = indent 4 (pretty "TAX")
  pretty (TAY) = indent 4 (pretty "TAY")
  pretty (TSX) = indent 4 (pretty "TSX")
  pretty (TXA) = indent 4 (pretty "TXA")
  pretty (TXS) = indent 4 (pretty "TXS")
  pretty (TXY) = indent 4 (pretty "TXY")
  pretty (TYA) = indent 4 (pretty "TYA")
  pretty (TYX) = indent 4 (pretty "TYX")
  pretty (TCD) = indent 4 (pretty "TCD")
  pretty (TCS) = indent 4 (pretty "TCS")
  pretty (TDC) = indent 4 (pretty "TDC")
  pretty (TSC) = indent 4 (pretty "TSC")
  pretty (XBA) = indent 4 (pretty "XBA")
  pretty (XCE) = indent 4 (pretty "XCE")
  pretty (Label s) = group (pretty s <> pretty ":")
  pretty (Table ss) =
    indent 4 (group ((pretty "dw") <+> pretty (intercalate "," ss)))
  pretty (TableDataWord ws) =
    indent 4 (group ((pretty "dw") <+> pretty (intercalate "," (map show ws))))
    -- use of show is no longer pretty printing :(
  pretty (IncBin s) = pretty $ "incbin \"" ++ s ++ "\""

instance Pretty Operand where
  pretty (Imm8 w) = pretty ".B" <+> pretty "#" <> pretty w
  pretty (Imm16 w) = pretty ".W" <+> pretty "#" <> pretty w
  pretty (Abs w) = pretty ".W" <+> pretty w
  pretty (AbsX w) = pretty ".W" <+> pretty w <> pretty ",X"
  pretty (AbsY w) = pretty ".W" <+> pretty w <> pretty ",Y"
  pretty (Dir w) = pretty ".B" <+> pretty w
  pretty (DirX w) = pretty ".B" <+> pretty w <> pretty ",X"
  pretty (DirY w) = pretty ".B" <+> pretty w <> pretty ",Y"
  pretty (Accumulator) = pretty " A"
  pretty (DirInd w) = pretty ".B" <+> parens (pretty w)
  pretty (Long w) = pretty ".L" <+> pretty w
  pretty (LongX w) = pretty ".L" <+> pretty w <> pretty ",X"
  pretty (DirIndLong w) = pretty ".B" <+> brackets (pretty w)
  pretty (DirIndY w) = pretty ".B" <+> parens (pretty w) <> pretty ",Y"
  pretty (DirXInd w) = pretty ".B" <+> parens (pretty w <> pretty ",X")
  pretty (AbsInd w) = pretty ".W" <+> parens (pretty w)
  pretty (AbsIndLong w) = pretty ".W" <+> brackets (pretty w)
  pretty (AbsXInd w) = pretty ".W" <+> parens (pretty w <> pretty ",X")
  pretty (DirIndLongY w) = pretty ".B" <+> brackets (pretty w) <> pretty ",Y"
  pretty (Stack w) = pretty ".B" <+> pretty w <> pretty ",S"
  pretty (StackIndY w) =
    pretty ".B" <+> parens (pretty w <> pretty ",S") <> pretty ",Y"
  pretty (Label8 s) = pretty ".B" <+> pretty s
  pretty (Label16 s) = pretty ".W" <+> pretty s
  pretty (Label24 s) = pretty ".L" <+> pretty s
  pretty (LabelXInd s) = pretty ".W" <+> parens (pretty s <> pretty ",X")

putDocCompact :: Doc a -> IO ()
putDocCompact = renderIO System.IO.stdout . layoutCompact . (fuse Deep)
