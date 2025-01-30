;=================================================
; Name: Daniel Nguyen
; Email: 
; 
; Lab: lab 4, ex 4
; Lab section: 
; TA: 
; 
;=================================================
.ORIG x3000

LD R1, ARR

LD R5, SUB_FILL_ARR_3200
JSRR R5

LD R5, SUB_CONVERT_ARRAY_3400
JSRR R5

;LD R5, SUB_PRINT_ARRAY_3600
;JSRR R5

LD R5, SUB_PRETTY_PRINT_ARRAY_3800
JSRR R5

HALT

SUB_FILL_ARR_3200 .FILL x3200
SUB_CONVERT_ARRAY_3400 .FILL x3400
SUB_PRINT_ARRAY_3600 .FILL x3600
SUB_PRETTY_PRINT_ARRAY_3800 .FILL x3800
ARR .FILL x4000

.END
;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY
; Parameter (R1): The starting address of the array, unchanged at the end.
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3200

LD R3, COUNT

LOOP
    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R0, R0, #1
    ADD R3, R3, #-1
    BRp LOOP
ADD R1, R1, #-10
RET

COUNT .FILL #10

.END
;------------------------------------------------------------------------
; Subroutine: SUB_CONVERT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (number) in the array should be represented as a character. E.g. 0 -> ‘0’
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3400

LD R3, COUNT2
LD R4, ASCII_OFFSET
AND R0, R0, x0

CONV_LOOP
    LDR R0, R1, #0
    ADD R0, R0, R4
    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R3, R3, #-1
    BRp CONV_LOOP
ADD R1, R1, #-10
RET

COUNT2 .FILL #10
ASCII_OFFSET .FILL x30

.END
;------------------------------------------------------------------------
; Subroutine: SUB_PRINT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (character) in the array is printed out to the console.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3600

LD R3 COUNT3
AND R0, R0, x0

OUTPUT_LOOP
    LDR R0, R1, #0
    OUT
    ADD R1, R1, #1
    ADD R3, R3, #-1
    BRp OUTPUT_LOOP
ADD R1, R1, #-10
RET

COUNT3 .FILL #10

.END
;------------------------------------------------------------------------
; Subroutine: SUB_PRETTY_PRINT_ARRAY
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Prints out “=====” (5 equal signs), prints out the array, and after prints out “=====” again.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG x3800

AND R0, R0, x0

LEA R0, EQUAL
PUTS

LD R5, PTR_SUB_PRINT_ARRAY
JSRR R5

LEA R0, EQUAL
PUTS

RET

EQUAL .STRINGZ "====="
PTR_SUB_PRINT_ARRAY .FILL x3600

.END
;------------------------------------------------------------------------
.ORIG x4000

ARRAY .BLKW #10

.END