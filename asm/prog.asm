first:
    LDA.B 6,S
    RTL
main:
    LDA.W #200
    PHA
    LDA.W #250
    PHA
    JSL.L first
    PLX
    PLX
    RTL
init:
    RTL
vblank:
    RTL
