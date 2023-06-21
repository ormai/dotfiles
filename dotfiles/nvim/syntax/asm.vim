" vim: set et ft=vim sw=4 sts=4 ts=8 tw=80 :
" Script:   arm64asm.vim
" Author:   Saleem Abdulrasool <compnerd@compnerd.org>
" Homepage: http://github.com/compnerd/arm64asm
" Requires: Vim 7
" License:  Redistribute under the same terms as Vim itself
" Purpose:  ARM64 Assembly Syntax Highlighting

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" NOTE(compnerd) '.' is not in the default keyword, and will cause the
" directives to not be recognised by default.  Also add '!' to ensure that the
" increment operator is matched.
if version < 600
    set iskeyword=!,#,$,%,.,48-57,:,;,=,@,_
else
    setlocal iskeyword=!,#,$,.,48-57,:,;,=,@,_
endif

syntax case match

syntax keyword A64Special NOTE TODO XXX contained

syntax case ignore

syntax region A64Comment start="//" end="$" keepend contains=A64Special
syntax region A64Comment start="/\*" end="\*/" contains=A64Special
" MachO uses ; as a comment leader
syntax region A64Comment start=";" end="$" contains=todo

syntax keyword A64Directive .global .globl .comm .type .size 
syntax keyword A64Directive .section .text .data .bss
syntax keyword A64Directive .byte .2byte .hword .short .4byte .word .long
syntax keyword A64Directive .8byte .quad .dword .ascii .asciz .string 
syntax keyword A64Directive .float .single .double
syntax keyword A64Directive .align .balign .balignl .balignw .balignlw .balignwl
syntax keyword A64Directive .fill .space .skip
syntax keyword A64Directive .equ .set .equiv
syntax keyword A64Directive .if .ifdef .ifndef .else .endif
syntax keyword A64Directive .macro .endmacro .endm .exitm
syntax keyword A64Directive .include
" ?
syntax keyword A64Directive .loh
syntax keyword A64Directive .tlsdesccall
syntax keyword A64Directive .ltorg .pool
syntax keyword A64Directive .req .unreq
syntax keyword A64Directive .inst
syntax keyword A64Directive .private_extern .extern
syntax keyword A64Directive .def .endef .scl

syntax match A64Modifier /:lo12:/ contained
syntax match A64Modifier /:abs_g3:/ contained
syntax match A64Modifier /:abs_g2:/ contained
syntax match A64Modifier /:abs_g2_s:/ contained
syntax match A64Modifier /:abs_g2_nc:/ contained
syntax match A64Modifier /:abs_g1:/ contained
syntax match A64Modifier /:abs_g1_s:/ contained
syntax match A64Modifier /:abs_g1_nc:/ contained
syntax match A64Modifier /:abs_g0:/ contained
syntax match A64Modifier /:abs_g0_s:/ contained
syntax match A64Modifier /:abs_g0_nc:/ contained
syntax match A64Modifier /:dtprel_g2:/ contained
syntax match A64Modifier /:dtprel_g1:/ contained
syntax match A64Modifier /:dtprel_g1_nc:/ contained
syntax match A64Modifier /:dtprel_g0:/ contained
syntax match A64Modifier /:dtprel_g0_nc:/ contained
syntax match A64Modifier /:dtprel_hi12:/ contained
syntax match A64Modifier /:dtprel_lo12:/ contained
syntax match A64Modifier /:dtprel_lo12_nc:/ contained
syntax match A64Modifier /:tprel_g2:/ contained
syntax match A64Modifier /:tprel_g1:/ contained
syntax match A64Modifier /:tprel_g1_nc:/ contained
syntax match A64Modifier /:tprel_g0:/ contained
syntax match A64Modifier /:tprel_g0_nc:/ contained
syntax match A64Modifier /:tprel_hi12:/ contained
syntax match A64Modifier /:tprel_lo12:/ contained
syntax match A64Modifier /:tprel_lo12_nc:/ contained
syntax match A64Modifier /:tlsdesc:/ contained
syntax match A64Modifier /:tlsdesc_lo12:/ contained
syntax match A64Modifier /:got:/ contained
syntax match A64Modifier /:got_lo12:/ contained
syntax match A64Modifier /:gottprel:/ contained
syntax match A64Modifier /:gottprel_lo12:/ contained
syntax match A64Modifier /:gottprel_g1:/ contained
syntax match A64Modifier /:gottprel_g0_nc:/ contained

syntax match A64Modifier /@PAGE/ contained
syntax match A64Modifier /@PAGEOFF/ contained

syntax match A64Identifier /[-_$.A-Za-z0-9]\+/
syntax match A64Identifier /:.*:[-_$.A-Za-z0-9]\+/ contains=A64Modifier
" MachO uses @modifiers
syntax match A64Identifier /[-_$.A-Za-z0-9]\+@[a-zA-Z]\+/ contains=A64Modifier
" MachO uses L for the PrivateGloablPrefix, ELF uses .L
syntax match A64Identifier /\.\?L[-_$.A-Za-z0-9]\+/ contains=A64Modifier
syntax match A64Identifier /:.*:\.\?L[-_$.A-Za-z0-9]\+/ contains=A64Modifier
" MachO uses @modifiers
syntax match A64Identifier /\.\?L[-_$.A-Za-z0-9]\+[a-zA-Z]\+/ contains=A64Modifier

syntax match A64Label /^[-_$.A-Za-z0-9]\+\s*:/
" MachO uses L for the PrivateGloablPrefix, ELF uses .L
syntax match A64Label /^\.\?L[-_$.A-Za-z0-9]\+\s*:/
syntax match A64Label /^"[-_$.A-Za-z0-9 ]\+\s*":/

syntax match A64Label /\d\{1,2\}[:fb]/

syntax keyword A64Mnemonic ADC ADCS ADD ADDS ADR ADRP AND ANDS ASR ASRV AT

syntax keyword A64Mnemonic BEQ BNE BCS BHS BCC BLO BMI BPL BVS BVC BHI BLS
syntax keyword A64Mnemonic BGE BLT BGT BLE BAL BNV
syntax keyword A64Mnemonic B.EQ B.NE B.CS B.HS B.CC B.LO B.MI B.PL B.VS B.VC
syntax keyword A64Mnemonic B.HI B.LS B.GE B.LT B.GT B.LE B.AL B.NV
syntax keyword A64Mnemonic B BFI BFM BFXIL BIC BICS BL BLR BR BRK

syntax keyword A64Mnemonic CBNZ CBZ CCMN CINC CINV CLREX CLS CLZ CMN CMP
syntax keyword A64Mnemonic CNEG CRC32B CRC32H CRC32W CRC32X CRC32CB CRC32CH
syntax keyword A64Mnemonic CRC32CW CRC32CX
syntax keyword A64Mnemonic CSEL CSET CSINC CSINV CSNEG

syntax keyword A64Mnemonic DC DCPS1 DCPS2 DCP3 DMB DRPS DSB

syntax keyword A64Mnemonic EON EOR ERET EXTR

syntax keyword A64Mnemonic HINT HLT HVC

syntax keyword A64Mnemonic IC ISB

syntax keyword A64Mnemonic LDAR LDARB LDARH LDAXP LDAXR LDAXRB LDAXRH LDNP
syntax keyword A64Mnemonic LDP LDPSW LDR LDRB LDRH LDRSH LDRSW LDTR LDTRB
syntax keyword A64Mnemonic LDTRH LDTRSB LDTRSH LDTRSW LDUR LDURB LDURH
syntax keyword A64Mnemonic LDURSB LDURSH LDURSW LDXP LDXR LDXRB LDXRH LSL
syntax keyword A64Mnemonic LSLV LSR LSRV

syntax keyword A64Mnemonic MADD MNEG MOV MOVK MOVN MOVZ MRS MSUB MUL MVN

syntax keyword A64Mnemonic NEGS NGC NGCS NOP

syntax keyword A64Mnemonic ORN ORR

syntax keyword A64Mnemonic PRFM PRFUM

syntax keyword A64Mnemonic RBIT RET REV REV16 REV32 ROR RORV

syntax keyword A64Mnemonic SBC SBCS SBFIZ SBFM SBFX SDIV SEV SEVL SMADDL
syntax keyword A64Mnemonic SMC SMNEGL SMSUBL SMULH SMULL STLR STLRB STLRH
syntax keyword A64Mnemonic STLXP STLXR STLXRB STLXRH XTNP STP STR STRB STRH
syntax keyword A64Mnemonic STTTR STTRB STTRH STUR STURB STURH STXP STXR
syntax keyword A64Mnemonic STXRB STXRH SUB SUBS SVC SXTB SXTH SXTW SYS SYSL

syntax keyword A64Mnemonic TBNZ TBZ TLBI TST

syntax keyword A64Mnemonic UBFIZ UBFM UBFX UDIV UMADDL UMNEGL UMSUBL UMULH
syntax keyword A64Mnemonic UMULL UXTB UXTH

syntax keyword A64Mnemonic WFE WFI

syntax keyword A64Mnemonic YIELD

syntax keyword A64Mnemonic ABS ADD ADDHN ADDHN2 ADDP ADDV AESD AESE AESIMC
syntax keyword A64Mnemonic AESMC AND

syntax keyword A64Mnemonic BIC BIF BIT BSL

syntax keyword A64Mnemonic CLS CLZ CMEQ CMGE CMGT CMHI CMHS CMLE CMLT CMTST
syntax keyword A64Mnemonic CNT

syntax keyword A64Mnemonic DUP

syntax keyword A64Mnemonic EOR EXT

syntax keyword A64Mnemonic FABD FABS FACGE FACGT FADD FADDP FCCMP FCCMPE
syntax keyword A64Mnemonic FCMEQ FCMGE FCMGT FCMLE FCMLT FCMP FCMPE FCSEL
syntax keyword A64Mnemonic FCVT FCVTAS FCVTAU FCVTL FCVTL2 FCVTNS FCVTNU
syntax keyword A64Mnemonic FCVTPS FCVTPU FCVTXN FCVTXN2 FCVTZS FCVTZU FDIV
syntax keyword A64Mnemonic FMADD FMAX FMAXNM FMAXMP FMAXNMV FMAXP FMAXV FMIN
syntax keyword A64Mnemonic FMINNM FMINNMP FMINNMV FMINP FMINV FMLA FMLS FMOV
syntax keyword A64Mnemonic FMSUB FMUL FMULX FNEG FNMADD FNMSUB FNMUL FRECPE
syntax keyword A64Mnemonic FRECPS FRECPX FRINTA FRINTI FRINTM FRINTN FRINTP
syntax keyword A64Mnemonic FRINTX FRINTX FRINTZ FRSQRTE FRSQRTS FSQRT FSUB

syntax keyword A64Mnemonic INS

syntax keyword A64Mnemonic LD1 LD1R LD2 LD2R LD3 LD3R LD4 LD4R LDNP LDP LDR
syntax keyword A64Mnemonic LDUR

syntax keyword A64Mnemonic MLA MLS MOV MOVI MUL MVN MVNI

syntax keyword A64Mnemonic NEG NOT

syntax keyword A64Mnemonic ORN ORR

syntax keyword A64Mnemonic PMUL PMULL PMULL2

syntax keyword A64Mnemonic RBIT REV16 REV32 REV64 RSHRN RSHRN2 RSUBHN
syntax keyword A64Mnemonic RSUBHN2

syntax keyword A64Mnemonic SABA SABAL SABAL2 SABD SABDL SABDL2 SADALP SADDL
syntax keyword A64Mnemonic SADDL2 SADDLP SADDLV SADDW SADDW2 SCVTF SHA1C
syntax keyword A64Mnemonic SHA1H SHA1M SHA1P SHA1SU0 SHA1SU1 SHA256H2
syntax keyword A64Mnemonic SHA256H SHA256SU0 SHA256SU1 SHADD SHL SHLL SHLL2
syntax keyword A64Mnemonic SHRN SHRN2 SHSUB SLI SMAX SMAXP SMAXV SMIN SMINP
syntax keyword A64Mnemonic SMINV SMLAL SMLAL2 SMLSL SMLSL2 SMOV SMULL SMULL2
syntax keyword A64Mnemonic SQABS SQADD SQDMLAL SQDMLAL2 SQDMLSL SQDMLSL2
syntax keyword A64Mnemonic SQDMULH SQDMULL SQDMULL2 SQNEG SQRDMULH SQRSHL
syntax keyword A64Mnemonic SQRSHRN SQRSHRN2 SQSHL SQSHLU SQSHRN SQSHRN2
syntax keyword A64Mnemonic SQSUB SQXTN SQXTN2 SQXTUN SQXTUN2 SHRADD SRI
syntax keyword A64Mnemonic SRSHL SRSHR SRSRA SSHL SSHLL SSHLL2 SSHHR SSRA
syntax keyword A64Mnemonic SSUBL SSUBL2 SSUBW SSUBW2 ST1 ST2 ST3 ST4 STNP
syntax keyword A64Mnemonic STP STR STUR SUB SUBHN SUBHN2 SUQADD SXTL

syntax keyword A64Mnemonic TBL TBX TRN1 TRN2

syntax keyword A64Mnemonic UABA UABAL UABAL2 UABD UABDL UABDL2 UADALP UADDL
syntax keyword A64Mnemonic UADDL2 UADDLP UADDLV UADDW UADDW2 UCVTF UHADD
syntax keyword A64Mnemonic UHSUB UMAX UMAXP UMAXV UMIN UMINP UMINV UMLAL
syntax keyword A64Mnemonic UMLAL2 UMLSL UMLSL2 UMOV UMULL UMULL2 UQADD
syntax keyword A64Mnemonic UQRSHL UQRSHRN UQRSHRN2 UQSHL UQSHRN UQSUB UQXTN
syntax keyword A64Mnemonic UQXTN2 URECPE URHADD URSHL URSHR URSQRTE URSRA
syntax keyword A64Mnemonic USHL USHLL USHLL2 USHR USQADD USRA USUBL USUBL2
syntax keyword A64Mnemonic USUBW USUBW2 UXTL UZP1 UZP2

syntax keyword A64Mnemonic XTN XTN2

syntax keyword A64Mnemonic ZIP1 ZIP2

" Not working properly
syntax match A64Macro  /#[_a-zA-Z][_a-zA-Z0-9]*/

syntax match A64Number /#\?-\?\d[\.\d]\?/ " decimal (float)
syntax match A64Number /#\?0x\x*/ " hexadecimal
syntax match A64Number /#\?0b[01]*/  " binary

syntax match A64String /\".*\"/

syntax match A64Operator /=/
syntax match A64Operator /==/
syntax match A64Operator /!/
syntax match A64Operator /-/
syntax match A64Operator /+/

syntax keyword A64Register w0 w1 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 w12 w13 w14 w15 w16
syntax keyword A64Register w17 w18 w19 w20 w21 w22 w23 w24 w25 w26 w27 w28 w29 w30 w31

syntax keyword A64Register x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16
syntax keyword A64Register x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31

syntax keyword A64Register b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16
syntax keyword A64Register b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31

syntax keyword A64Register h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16
syntax keyword A64Register h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 h31

syntax keyword A64Register s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16
syntax keyword A64Register s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31

syntax keyword A64Register d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16
syntax keyword A64Register d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31

syntax keyword A64Register v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16
syntax keyword A64Register v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

syntax keyword A64Register wzr xzr sp pc pstate

syntax match A64Type /%function/
syntax match A64Type /%gnu_indirect_function/
syntax match A64Type /%object/
syntax match A64Type /%tls_object/
syntax match A64Type /%common/
syntax match A64Type /%notype/

highlight default link A64Comment    Comment
highlight default link A64Directive  PreProc
highlight default link A64Identifier Identifier
highlight default link A64Label      Label
highlight default link A64Macro      Macro
highlight default link A64Mnemonic   Keyword
highlight default link A64Modifier   Special
highlight default link A64Number     Number
highlight default link A64String     String
highlight default link A64Operator   Operator
highlight default link A64Register   StorageClass
highlight default link A64Type       Tag
highlight default link A64TODO       Todo

let b:current_syntax = "asm"

