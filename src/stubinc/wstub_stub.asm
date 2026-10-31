;	Segment build for stub/wstub.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py wstub).
%include "inc/le_objects.inc"
	bits	16
	org	0x26654
%include "stub/wstub.asm"
