; Watcom C runtime: stricmp_.
bits 32
%include "hockey.inc"
section s_B73CA progbits alloc exec nowrite align=1
global stricmp_
;-----------------------------------------------------------------------------
; stricmp_                                                      B73CA  library
; Run-time library stricmp: compares two strings, ignoring case
;-----------------------------------------------------------------------------
stricmp_:
        push ebx
.1:
        mov bl, byte [eax]
        mov bh, byte [edx]
        cmp bl, 41h
        jb short .2
        cmp bl, 5Ah
        ja short .2
        add bl, 20h
.2:
        cmp bh, 41h
        jb short .3
        cmp bh, 5Ah
        ja short .3
        add bh, 20h
.3:
        cmp bl, bh
        jne short .4
        test bh, bh
        je short .4
        inc eax
        inc edx
        jmp short .1
.4:
        xor edx, edx
        xor eax, eax
        mov dl, bl
        mov al, bh
        sub edx, eax
        mov eax, edx
        pop ebx
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
