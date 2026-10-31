;	Segment build for obj4/obj4_13000.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py obj4_13000).
%include "inc/le_objects.inc"
	bits	32
	org	0x123000
%include "obj4/obj4_13000.asm"
