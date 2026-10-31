;	Segment build for stub/dos16m_loader.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py dos16m_loader).
%include "inc/le_objects.inc"
	bits	16
	org	0x0
%include "stub/dos16m_loader.asm"
