; Watcom C runtime: strncpy_.
bits 32
%include "hockey.inc"
section s_B6991 progbits alloc exec nowrite align=1
global strncpy_
;-----------------------------------------------------------------------------
; strncpy_                                                      B6991  library
; Run-time library strncpy: copies at most n characters
;-----------------------------------------------------------------------------
strncpy_:
        push ecx
        push esi
        mov esi, eax
        jmp short .2
.1:
        mov cl, byte [edx]
        test cl, cl
        je short .3
        inc edx
        dec ebx
        mov byte [eax], cl
        inc eax
.2:
        test ebx, ebx
        jne short .1
.3:
        test ebx, ebx
        je short .4
        dec ebx
        mov byte [eax], 0
        inc eax
        jmp short .3
.4:
        mov eax, esi
        pop esi
        pop ecx
        ret
