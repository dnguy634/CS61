;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 022 
; TA: Cody Kurpanek
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================
.ORIG x3000            ; Program begins here
;-------------
;Instructions
;-------------

;----------------------------------------------
;output prompt
;----------------------------------------------
LEA R0, intro            ; get starting address of prompt string
PUTS                    ; Invokes BIOS routine to output string

;input 1st #
GETC

ADD R1, R0, #0
OUT
LEA R0, newline
PUTS

;input 2nd #
GETC

ADD R2, R0, #0
OUT
LEA R0, newline
PUTS

;output (# - # = #)
ADD R0, R1, #0
OUT

LEA R0, minus
PUTS


ADD R0, R2, #0
OUT

LEA R0, equal
PUTS

ADD R3, R2, #0
NOT R3, R3
ADD R3, R3, 1

ADD R5, R1, R3

;if statements (neg or pos)
BRn IF_NEG 
BRp IF_POS
BRnzp IF_POS

IF_NEG
    ;2's complement
    NOT R5, R5
    ADD R5, R5 #1
    
    LD R6, ASCII_NUM
    ADD R5, R5, R6

    LEA R0, neg
    PUTS

    ADD R0, R5, #0
    OUT

    LEA R0, newline
    PUTS

    HALT

IF_POS
    LD R6, ASCII_NUM
    ADD R5, R5, R6


    ADD R0, R5, #0
    OUT

    LEA R0, newline
    PUTS

    HALT

;------
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro   .STRINGZ    "ENTER two numbers (i.e '0'....'9')\n"         ; prompt string - use with LEA, followed by PUTS.
minus   .STRINGZ " - "
equal   .STRINGZ " = "
neg     .STRINGZ "-"

ASCII_NUM .FILL x30
newline .FILL x0A

;---------------
;END of PROGRAM
;---------------
.END
