; EA library: PutBytesLE.
bits 32
%include "hockey.inc"
section s_D7D43 progbits alloc exec nowrite align=1
global PutBytesLE
        db 090h
;-----------------------------------------------------------------------------
; PutBytesLE                                      D7D44  96 PC, low confidence
; Stores n bytes of a value, low byte first
;-----------------------------------------------------------------------------
PutBytesLE:
        sub esp, byte 4
        mov ebx, dword [byte esp+0Ch]
        mov edx, dword [byte esp+010h]
        mov eax, dword [byte esp+08h]
        test edx, edx
        je short .2
.1:
        mov dword [esp], ebx
        inc eax
        mov cl, byte [esp]
        shr ebx, 8
        mov byte [byte eax-01h], cl
        dec edx
        jne short .1
.2:
        add esp, byte 4
        ret
        db 090h
        sub esp, byte 4
        mov edx, dword [byte esp+0Ch]
        mov ebx, dword [byte esp+010h]
        mov ecx, 4
        sub ecx, ebx
        shl ecx, 3
        mov eax, dword [byte esp+08h]
        shl edx, cl
        test ebx, ebx
        je short .4
.3:
        mov ecx, edx
        shr ecx, 18h
        mov dword [esp], ecx
        inc eax
        mov cl, byte [esp]
        shl edx, 8
        mov byte [byte eax-01h], cl
        dec ebx
        jne short .3
.4:
        add esp, byte 4
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
