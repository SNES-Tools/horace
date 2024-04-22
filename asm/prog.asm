main:
    LDA.W #0
    AND.W #1
    PHA
    LDA.W #100
    AND.W #127
    PHA
    LDA.W #200
    CLC
    ADC.B 1,S
    PLX
    AND.W #255
    STA.B 1,S
    PLX
    RTL
init:
    RTL
vblank:
    RTL
