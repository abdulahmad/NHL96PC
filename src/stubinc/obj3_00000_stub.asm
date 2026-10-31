;	Segment build for obj3/obj3_00000.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py obj3_00000).
%include "inc/le_objects.inc"
	bits	32
	org	0x100000
%include "obj3/obj3_00000.asm"
