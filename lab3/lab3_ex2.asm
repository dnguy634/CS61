;=================================================
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Lab: lab 3, ex 2
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
    GETC
    OUT
    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R2, R2, #-1
BRp DO_WHILE
    
HALT

QUESTION .STRINGZ "Enter 10 characters: \n"
COUNT .FILL #10
START .FILL x4000

.END 

.ORIG x4000

ARRAY .BLKW #10

.END


