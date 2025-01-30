;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 022
; TA: Cody Kurpanek
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

.ORIG x3000		
;-------------
;Instructions
;-------------

; output intro prompt
						
; Set up flags, counters, accumulators as needed

; Get first character, test for '\n', '+', '-', digit/non-digit 	
					
; is very first character = '\n'? if so, just quit (no message)!

; is it = '+'? if so, ignore it, go get digits

; is it = '-'? if so, set neg flag, go get digits
					
; is it < '0'? if so, it is not a digit	- o/p error message, start over

; is it > '9'? if so, it is not a digit	- o/p error message, start over
				
; if none of the above, first character is first numeric digit - convert it to number & store in target register!
					
; Now get remaining digits from user in a loop (max 5), testing each to see if it is a digit, and build up number in accumulator

; remember to end with a newline!
					

LD R3, count

LOOP
    AND R4, R4, x0
    LD R0, introPromptPtr
    PUTS
    
    GETC
    OUT
    
    AND R1, R1, x0
    ADD R1, R0, #-10
    BRz EXIT
    
    LD R6, plus
    AND R1, R1, x0
    ADD R1, R0, R6
    BRz POS
    
    LD R6, minus
    AND R1, R1, x0
    ADD R1, R0, R6
    BRz NEG
    BRp DIGIT
    
DIGIT  
    LD R6, dec48
    AND R1, R1, x0
    ADD R1, R0, R6
    BRn EXIT
    
    LD R6, dec57
    AND R1, R1, x0
    ADD R1, R0, R6
    BRp EXIT
    
    ADD R3, R3, #-1
    BR GET_DIGITS

POS
    GETC
    OUT
    
    AND R1, R1, x0
    ADD R1, R0, #-10
    BRz DONE
    
    LD R6, dec48
    AND R1, R1, x0
    ADD R1, R0, R6
    BRn EXIT
    
    LD R6, dec57
    AND R7, R7, x0
    ADD R7, R0, R6
    BRp EXIT
    
    LD R2, mult
    AND R6, R6, x0
    ADD_LOOP1
        ADD R6, R6, R4
        ADD R2, R2, #-1
    BRp ADD_LOOP1
    ADD R4, R6, R1
    ADD R3, R3, #-1
    BRp POS
    BR DONE

NEG
    GETC
    OUT
    
    ADD R1, R0, #-10
    BRz COMP
    
    LD R6, dec48
    AND R1, R1, x0
    ADD R1, R0, R6
    BRn EXIT
    
    LD R6, dec57
    AND R7, R7, x0
    ADD R7, R0, R6
    BRp EXIT
    
    LD R2, mult
    AND R6, R6, x0
    ADD_LOOP2
        ADD R6, R6, R4
        ADD R2, R2, #-1
    BRp ADD_LOOP2
    ADD R4, R6, R1
    ADD R3, R3, #-1
    BRp NEG

COMP
    NOT R4, R4
    ADD R4, R4, #1
    BR DONE

GET_DIGITS
    AND R1, R1, x0
    ADD R1, R0, #-10
    BRz DONE
    
    LD R6, dec48
    AND R1, R1, x0
    ADD R1, R0, R6
    BRn EXIT
    
    LD R6, dec57
    AND R7, R7, x0
    ADD R7, R0, R6
    BRp EXIT
    
    LD R2, mult
    AND R6, R6, x0
    ADD_LOOP3
        ADD R6, R6, R4
        ADD R2, R2, #-1
    BRp ADD_LOOP3
    ADD R4, R6, R1
    BR POS
    
EXIT
    LEA R0, newline
    PUTS
    LD R0, errorMessagePtr
    PUTS
    BR LOOP

DONE
    LEA R0, newline
    PUTS

HALT

;---------------	
; Program Data
;---------------

introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200
plus .FILL #-43
minus .FILL #-45
dec48 .FILL #-48
dec57 .FILL #-57
newline .FILL #10

count .FILL #5
mult .FILL #10

.END

;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
.STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
.STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------
.END
;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.
