main:
    LDA.W #15
    CMP.W #21
    BPL.B clamp_top0
    CMP.W #10
    BMI.B clamp_bot1
    BRA.B transmute_end2
clamp_top0:
    LDA.W #20
    BRA.B transmute_end2
clamp_bot1:
    LDA.W #10
transmute_end2:
    PHA
    LDA.B 1,S
    PHA
    LDA.W #6
    STA.B 0
    PLA
    SEC
    SBC.B 0
    CMP.W #21
    BPL.B clamp_top3
    CMP.W #10
    BMI.B clamp_bot4
    BRA.B transmute_end5
clamp_top3:
    LDA.W #20
    BRA.B transmute_end5
clamp_bot4:
    LDA.W #10
transmute_end5:
    PLX
    RTL
init:
    RTL
vblank:
    RTL
