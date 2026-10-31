;	Segment build for obj1/obj1_49000.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py obj1_49000).
%include "inc/le_objects.inc"
	bits	32
	org	0x59000
%include "obj1/obj1_49000.asm"
