;=================================================
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Lab: lab 5, ex 1
; Lab section: 022
; TA: Cody Kurpanek
; 
;=================================================
.orig x3000

ld r6, top_stack_addr 

LD R1, ARRAY_POINTER 

LD R3, SUB_GET_STRING
JSRR R3

LD R3, SUB_TO_UPPER
JSRR R3

LD R0, ARRAY_POINTER
PUTS

LEA R0, NEWLINE
PUTS

LD R1, ARRAY_POINTER

LD R3, SUB_IS_PALINDROME
JSRR R3

; OUTPUT TEST 
ADD R4, R4, #0
BRz FALSE

LEA R0, STRING
PUTS
LD R0, ARRAY_POINTER
PUTS
LEA R0, YES
PUTS
BR END_TEST

FALSE
LEA R0, STRING
PUTS
LD R0, ARRAY_POINTER
PUTS
LEA R0, NO
PUTS
    
END_TEST

; your code goes here
HALT

; your local data goes here
top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE

STRING .STRINGZ "The string "
YES .STRINGZ " IS a palindrome"
NO .STRINGZ " IS NOT a palindrome"

SUB_GET_STRING .FILL x3200
SUB_IS_PALINDROME .FILL x3400
SUB_TO_UPPER .FILL x3600
ARRAY_POINTER .FILL x4000
NEWLINE .FILL #10

.END
;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
;	terminated by the [ENTER] key (the "sentinel"), and has stored 
;	the received characters in an array of characters starting at (R1).
;	the array is NULL-terminated; the sentinel character is NOT stored.
; Return Value (R5): The number of non-sentinel chars read from the user.
;	R1 contains the starting address of the array unchanged.
;-------------------------------------------------------------------------
.ORIG x3200
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0


LEA R0, PROMPT
PUTS

AND R5, R5, #0

LOOP
    GETC
    OUT
    ADD R3, R0, #0
    ADD R3, R3, #-10
    BRz END
    
    ADD R3, R3, #2
    BRz DEL

    STR R0, R1, #0
    ADD R1, R1, #1
    ADD R5, R5, #1
    BR LOOP

DEL
    ADD R1, R1, #-1
    ADD R5, R5, #-1
    AND R0, R0, #0
    STR R0, R1, #0
    BR LOOP
END
AND R0, R0, #0
STR R0, R1, #0

LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1

RET

PROMPT .STRINGZ "Enter a string (end with RETURN key): "

.END
;-------------------------------------------------------------------------
; Subroutine: SUB_IS_PALINDROME
; Parameter (R1): The starting address of a null-terminated string
; Parameter (R5): The number of characters in the array.
; Postcondition: The subroutine has determined whether the string at (R1)
;		 is a palindrome or not, and returned a flag to that effect.
; Return Value: R4 {1 if the string is a palindrome, 0 otherwise}
;-------------------------------------------------------------------------
.ORIG x3400
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0

ADD R0, R1, R5
ADD R0, R0, #-1

AND R4, R4, #0
ADD R4, R4, #1

IS_PAL
    LDR R2, R1, #0
    LDR R3, R0, #0
    NOT R2, R2
    ADD R2, R2, #1
    ADD R2, R2, R3
    BRnp NOT_PAL
    
    ADD R1, R1, #1
    ADD R0, R0, #-1
    ADD R5, R5, #-2
    BRz END_LOOP
    BRp IS_PAL
    
BR END_LOOP

NOT_PAL
AND R4, R4, #0

END_LOOP

LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1

RET

HALT

.END
;-------------------------------------------------------------------------
; Subroutine: SUB_TO_UPPER
; Parameter (R1): Starting address of a null-terminated string
; Postcondition: The subroutine has converted the string to upper-case
;     in-place i.e. the upper-case string has replaced the original string
; No return value, no output, but R1 still contains the array address, unchanged
;-------------------------------------------------------------------------
.ORIG x3600
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0

LD R2, BIT_MASK

CONV_LOOP
    LDR R0, R1, #0
    BRz DONE
    
    AND R0, R0, R2
    STR R0, R1, #0
    ADD R1, R1, #1
    BRnzp CONV_LOOP

DONE
LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1

RET

BIT_MASK .FILL xDF

.END

.ORIG x4000

ARRAY .BLKW #100

.END