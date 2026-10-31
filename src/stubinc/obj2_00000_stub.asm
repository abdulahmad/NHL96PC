;	Segment build for obj2/obj2_00000.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py obj2_00000).
%include "inc/le_objects.inc"
	bits	32
	org	0xF0000
%include "obj2/obj2_00000.asm"
