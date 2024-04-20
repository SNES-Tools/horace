double:
    LDA.B 4,S
    PHA
    LDA.B 6,S
    PHA
    LDA.B 3,S
    CLC
    ADC.B 1,S
    PLX
    PLX
    RTL
main:
    LDA.W #255
    PHA
    JSL.L double
    PLX
    RTL
init:
    RTL
vblank:
    RTL
