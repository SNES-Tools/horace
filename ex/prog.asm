    LDA.W #250
    PHA
    LDA.W #255
    PHA
    LDA.B 1,S
    LDA.B 1,S
    STA.B 3,S
    LDA.B 1,S
    PHA
    LDA.B 5,S
    STA.B 0
    PLA
    CMP.B 0
    BEQ.B if_true0
    BRA.B if_false1
if_true0:
    LDA.W #20
    BRA.B if_end2
if_false1:
    LDA.W #20
if_end2:
    PLX
    LDA.B 1,S
    LDA.W #5
    PLX
