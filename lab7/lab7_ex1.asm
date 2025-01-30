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

LD R3, STRLEN_ADDR
JSRR R3

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
LEA R0, YES
PUTS
BR END_TEST

FALSE
LEA R0, STRING
PUTS
LEA R0, NO
PUTS
LEA R0, YES
PUTS
    
END_TEST

; your code goes here
HALT

; your local data goes here
top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE

STRING .STRINGZ "The string is "
YES .STRINGZ "a palindrome\n"
NO .STRINGZ "not "

SUB_GET_STRING .FILL x3200
STRLEN_ADDR .FILL x3300
SUB_IS_PALINDROME .FILL x3400
ARRAY_POINTER .FILL x4000
NEWLINE .FILL #10

.END
;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
;	terminated by the [0] key (the "sentinel"), and has stored 
;	the received characters in an array of characters starting at (R1).
;	the array is NULL-terminated; the sentinel character is NOT stored.
;-------------------------------------------------------------------------
.ORIG x3200
ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0


LEA R0, PROMPT
PUTS

;LD R2, DEC

LOOP
    GETC
    ADD R3, R0, #0
    ADD R3, R3, #-10
    BRz END
    OUT

    STR R0, R1, #0
    ADD R1, R1, #1
    BR LOOP
END
AND R0, R0, #0
STR R0, R1, #0

LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

RET

PROMPT .STRINGZ "Enter a string: "
;DEC .FILL #-48

.END
;-------------------------------------------------------------------------
; Subroutine: STRLEN_ADDR
; Parameter (R1): Starting address of a zero terminated string
; Return value: Length of the string
;-------------------------------------------------------------------------
.ORIG x3300
ADD R6, R6, #-1
STR R7, R6, #0
;ADD R6, R6, #-1
;STR R5, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0

AND R5, R5, #0

CLOOP
    LDR R2, R1, #0
    BRz CDONE
    ADD R5, R5, #1
    ADD R1, R1, #1
    BR CLOOP
CDONE
    
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
;LDR R5, R6, #0
;ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

RET

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
palindrome
ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0

ADD R0, R1, R5
ADD R0, R0, #-1

AND R4, R4, #0
ADD R4, R4, #1

LDR R2, R1, #0
LDR R3, R0, #0
NOT R3, R3
ADD R3, R3, #1
ADD R3, R3, R2
BRnp NOT_PAL

ADD R1, R1, #1
ADD R0, R0, #-1
ADD R5, R5, #-2
BRnz P_DONE

JSR palindrome
BR P_DONE

NOT_PAL
AND R4, R4, #0

P_DONE

LDR R3, R6, #0
ADD R6, R6, #1
LDR R0, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1

RET

.END

.ORIG x4000

ARRAY .BLKW #100

.END