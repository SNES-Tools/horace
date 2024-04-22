main:
    LDA.W #0
    BIT.W #1
    BEQ.B sign_extend0
    ORA.W #32766
sign_extend0:
    RTL
init:
    RTL
vblank:
    RTL
