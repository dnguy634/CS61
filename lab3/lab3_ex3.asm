;=================================================
; Name: 
; Email: 
; 
; Lab: lab 3, ex 3
; Lab section: 
; TA: 
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

LD R0, NEXT
OUT

LD R1, START
LD R2, COUNT

OUTPUT_LOOP
    LDR R0, R1, #0
    OUT
    
    LD R0, NEXT
    OUT
    
    ADD R1, R1, #1
    ADD R2, R2, #-1
BRp OUTPUT_LOOP
    
HALT

QUESTION .STRINGZ "Enter 10 characters: \n"
COUNT .FILL #10
START .FILL x4000
NEXT .FILL x0A

.END

.ORIG x4000

ARRAY .BLKW #10

.END