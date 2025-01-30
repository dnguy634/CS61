;=================================================
; Name: Daniel Nguyen
; Email: 
; 
; Lab: lab 4, ex 1
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000
LD R1, ARR
ST R1, SAVE_R1

LD R5, SUB_FILL_ARR_3200
JSRR R5

LD R5, CONV_TO_CHAR_3400
JSRR R5

HALT

SUB_FILL_ARR_3200 .FILL x3200
CONV_TO_CHAR_3400 .FILL x3400
ARR .FILL x4000
SAVE_R1 .BLKW 1

.END
;=================================================
.ORIG x3200

LD R3, COUNT
AND R2, R2, x0

LOOP
    STR R2, R1, #0
    ADD R1, R1, #1
    ADD R2, R2, #1
    ADD R3, R3, #-1
    BRp LOOP
RET

COUNT .FILL #10

.END
;=================================================
.ORIG x4000

ARRAY .BLKW #10

.END

