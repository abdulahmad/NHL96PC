;	Segment build for le/le_header.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py le_header).
%include "inc/le_objects.inc"
	bits	16
	org	0x290A4
; Outside addresses, read from the retail EXE. Equates only (the full build has the labels).
wstub	equ	0x26654
start	equ	0xB6308
%include "le/le_header.asm"
