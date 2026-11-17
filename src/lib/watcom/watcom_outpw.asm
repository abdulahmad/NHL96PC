; Watcom C runtime: outpw_.
bits 32
%include "hockey.inc"
section s_DB1A7 progbits alloc exec nowrite align=1
global outpw_
;-----------------------------------------------------------------------------
; outpw_                                                        DB1A7  library
; Run-time library outpw: writes a word to an I/O port
;-----------------------------------------------------------------------------
outpw_:
        push ebx
        mov ebx, edx
        mov edx, eax
        mov eax, ebx
        out dx, ax
        pop ebx
        ret
