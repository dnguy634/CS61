;=================================================
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Lab: lab 2. ex 1
; Lab section: 022
; TA: Cody Kurpanek
; 
;=================================================
.ORIG x3000

LD R0, HEX_61
LD R1, HEX_1A

HEX_61 .FILL x61
HEX_1A .FILL x1A

DO_WHILE_LOOP
    OUT
    ADD R0, R0, #1
    ADD R1, R1, #-1
    BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP

HALT

.END