;=================================================
; Name: Daniel Nguyen
; Email: dnguy634@ucr.edu
; 
; Lab: lab 3, ex 1
; Lab section: 022
; TA: Cody Kurpanek
; 
;=================================================
.ORIG x3000

LD R5, DATA_PTR

LDR R3, R5, #0
LDR R4, R5, #1

ADD R3, R3, #1
ADD R4, R4, #1

STR R3, R5, #0
STR R4, R5, #1

HALT

DATA_PTR .FILL x4000

.END

.ORIG x4000
.FILL #65
.FILL x41

.END