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

LD R3, DEC_65
LD R4, HEX_41

HALT

DEC_65 .FILL #65
HEX_41 .FILL #41

.END