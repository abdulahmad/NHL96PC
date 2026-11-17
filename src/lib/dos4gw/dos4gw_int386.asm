; DOS/4GW: int386_.
bits 32
%include "hockey.inc"
section s_C53E5 progbits alloc exec nowrite align=1
extern int386x_, segread_
global int386_
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; int386_                                                       C53F0  library
; Run-time library int386: calls an interrupt
;-----------------------------------------------------------------------------
int386_:
        push ecx
        sub esp, byte 0Ch
        mov ecx, eax
        mov eax, esp
        call segread_
        mov eax, ecx
        mov ecx, esp
        call int386x_
        add esp, byte 0Ch
        pop ecx
        ret
