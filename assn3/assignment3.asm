;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 022
; TA: Cody Kurpanek
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;-------------------------------

LD R2, BIT_COUNT
LD R4, FOUR_COUNT
LD R5, END_COUNT
LD R6, MSB

LOOP
    AND R3, R1, R6
    BRz IF_POS
    
    LEA R0, PRINT_ONE
    PUTS
    BRnzp SHIFT
    
IF_POS
    LEA R0, PRINT_ZERO
    PUTS
    BRnzp SHIFT
    
SHIFT
    ADD R4, R4, #-1
    BRz ADD_SPACE
    
    ADD R1, R1, R1
    ADD R2, R2, #-1
    BRp LOOP
    
ADD_SPACE
    ADD R5, R5, #-1
    BRz END_PRINT
    LEA R0, PRINT_SPACE
    PUTS
    
    ADD R4, R4, #4
    ADD R1, R1, R1
    ADD R2, R2, #-1
    BRp LOOP

END_PRINT
    LEA R0, PRINT_NEWLINE
    PUTS
    
HALT

PRINT_ONE .STRINGZ "1"
PRINT_ZERO .STRINGZ "0"
PRINT_SPACE .STRINGZ " "
PRINT_NEWLINE .STRINGZ "\n"
BIT_COUNT .FILL #16
FOUR_COUNT .FILL #4
END_COUNT .FILL #4
MSB .FILL x8000
;---------------	
;Data
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored

.END

.ORIG xCA01					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
