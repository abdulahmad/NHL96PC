;	Segment build for stub/dos4gw_kernel.asm: sets its origin and the outside labels it uses, then includes the file on its own
;	for checking against the EXE (tools/verify_segment.py dos4gw_kernel).
%include "inc/le_objects.inc"
	bits	16
	org	0xF474
%include "stub/dos4gw_kernel.asm"
