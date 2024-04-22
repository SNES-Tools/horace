main:
    LDA.W 18
    PHA
    LDA.W #1
    CLC
    ADC.B 1,S
    PLX
    CMP.W #101
    BPL.B clamp_top3
    CMP.W #65436
    BMI.B clamp_bot4
    BRA.B transmute_end5
clamp_top3:
    LDA.W #100
    BRA.B transmute_end5
clamp_bot4:
    LDA.W #65436
transmute_end5:
    STA.W 18
    RTL
init:
    LDA.W #50
    CMP.W #101
    BPL.B clamp_top0
    CMP.W #65436
    BMI.B clamp_bot1
    BRA.B transmute_end2
clamp_top0:
    LDA.W #100
    BRA.B transmute_end2
clamp_bot1:
    LDA.W #65436
transmute_end2:
    STA.W 18
    RTL
vblank:
    RTL
