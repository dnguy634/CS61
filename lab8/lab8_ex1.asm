;=================================================
; Name: Daniel Nguyen
; Email: 
; 
; Lab: lab 8, ex 1
; Lab section: 
; TA: 
; 
;=================================================

.orig x3000

LD R6, top_stack_addr

LD R5, LOAD_FILL_VALUE_3200
JSRR R5

ADD R1, R1, #1

LD R5, OUTPUT_AS_DECIMAL_3400
JSRR R5

; Test harness
;-------------------------------------------------

HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr .fill xFE00
LOAD_FILL_VALUE_3200 .FILL x3200
OUTPUT_AS_DECIMAL_3400 .FILL x3400

.end

;=================================================
; Subroutine: LOAD_FILL_VALUE_3200
; Parameter: r1 input
; Postcondition: ??
; Return Value: r1 value
;=================================================

.orig x3200

ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0

LD R1, VALUE

ADD R1, R1, #0
BRzp POS

NEG
    NOT R1, R1
    ADD R1, R1, #1
    LD R0, NEG_SIGN
    OUT
POS

LDR R5, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

RET

VALUE .FILL #-6
NEG_SIGN .STRINGZ "-"

.end

;=================================================
; Subroutine: OUTPUT_AS_DECIMAL_3400
; Parameter: // Fixme
; Postcondition: // Fixme
; Return Value: // Fixme
;=================================================
.orig x3400

ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0

LD R2, STACK

LOOP 
    ADD R4, R1, #0
    ADD R1, R1, #-10
    BRn END
    ADD R3, R3, #1
    BR LOOP
    
; 27 > 17 > 7
; r3 = 2, r4 = 7

END
    STR R4, R2, #0
    ADD R2, R2, #1
    ADD R1, R3, #0
    ; r1 = 2, clear counter
    AND R3, R3, #0
    ADD R1, R1, #0
    BRp LOOP

LD R3, ASCII
LD R4, STACK
NOT R4, R4
ADD R4, R4, #1
ADD R4, R2, R4

PRINT
    ADD R2, R2, #-1
    LDR R0, R2, #0
    ADD R0, R0, R3 
    OUT
    ADD R4, R4, #-1
    BRp PRINT

LDR R4, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1

RET

STACK .FILL x4000
ASCII .FILL #48

.end