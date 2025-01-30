;=================================================
; Name: Daniel Nguyen
; Email: 
; 
; Lab: lab 8, ex 2
; Lab section: 
; TA: 
; 
;=================================================

.orig x3000

LD R6, top_stack_addr

; Test harness
;-------------------------------------------------

LEA R0, PROMPT
PUTS

GETC
OUT

ADD R1, R0, #0

LD R5, PARITY_CHECK_3600
JSRR R5

HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr .fill xFE00
PARITY_CHECK_3600 .fill x3600
PROMPT .STRINGZ "Enter a character: "

.end

;=================================================
; Subroutine: PARITY_CHECK_3600
; Parameter: r1
; Postcondition: // Fixme
; Return Value (R3): number of 1's 
;=================================================
.ORIG x3600

ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0

LD R3, DEC48
LD R4, COUNTER

LOOP
    ; bitwise AND on msb
    LD R2, MSB
    AND R2, R2, R1
    BRz ELSE
    IF_NEG
        ; parity counter
        ADD R3, R3, #1
    ELSE
    ; left shift
    ADD R1, R1, R1
    ADD R4, R4, #-1
    BRp LOOP

LD R0, NEWLINE
OUT

ADD R0, R3, #0
OUT

LDR R1, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1

RET

DEC48 .FILL #48
COUNTER .FILL #16
NEWLINE .FILL #10
MSB .FILL x8000

.end