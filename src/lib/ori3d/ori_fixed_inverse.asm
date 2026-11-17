; 3D library: FixedInverse.
bits 32
%include "hockey.inc"
section s_BE926 progbits alloc exec nowrite align=1
global FixedInverse
;-----------------------------------------------------------------------------
; FixedInverse                                    BE926  96 PC, low confidence
; Returns 1/x in 16.16 fixed point
;-----------------------------------------------------------------------------
FixedInverse:
        mov eax, dword [byte esp+04h]
        LD mov, ebx, eax
        mov edx, 1
        mov eax, 0
        idiv ebx
        ret
