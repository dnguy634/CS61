;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 022
; TA: Cody Kurpanek
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

;------------------------------------------
;REG VALUES     R0 R1 R2 R3 R4 R5 R6 R7
;------------------------------------------
;Pre-loop       0  0  0  0  0  0  0  0
;Iteration 01   0  12 12 5  0  0  6  0
;Iteration 02   0  24 12 4  0  0  0  0
;Iteration 03   0  36 12 3  0  0  0  0
;Iteration 04   0  48 12 2  0  0  0  0
;Iteration 05   0  60 12 1  0  0  0  0
;Iteration 06   0  72 12 0  0  0  0  0
;End of Program 0  32767 12  0  0  0  12286  0
;
;
;
;
;


.ORIG x3000			; Program begins here
;-------------
;Instructions: CODE GOES HERE
;-------------
LD R1, DEC_6
LD R2, DEC_12
AND R3, R3 x0

DO_WHILE 
    ADD R3, R3, R2
    ADD R1, R1, #-1
    BRp DO_WHILE


HALT
;---------------	
;Data (.FILL, .STRINGZ, .BLKW)
;---------------

DEC_6 .FILL #6
DEC_12 .FILL #12

;---------------	
;END of PROGRAM
;---------------	
.END


