;=================================================
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Lab: lab 3, ex 4
; Lab section: 022
; TA: Cody Kurpanek
; 
;=================================================
.ORIG x3000

LD R1, START
LD R2, COUNT


LEA R0, QUESTION
PUTS

DO_WHILE
    LD R3, SENTINAL
    GETC
    OUT
    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R2, R2, #-1
    ADD R3, R3, R0
    BRz END_SENTINAL
BRnp DO_WHILE

END_SENTINAL

LD R1, START
LD R2, COUNT

OUTPUT_LOOP
    LD R3, SENTINAL
    LDR R0, R1, #0
    OUT
    
    ADD R1, R1, #1
    ADD R2, R2, #-1
    ADD R3, R3, R0
    BRz END_SENTINAL2
BRnp OUTPUT_LOOP

END_SENTINAL2
    
HALT

QUESTION .STRINGZ "Enter up to 100 characters (end with '!'): \n"
COUNT .FILL #10
START .FILL x4000
SENTINAL .FILL #-33

.END

.ORIG x4000

ARRAY .BLKW #100

.END