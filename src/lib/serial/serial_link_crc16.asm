; Serial port: LinkCrc16.
bits 32
%include "hockey.inc"
section s_B1824 progbits alloc exec nowrite align=1
extern Crc16Table
global LinkCrc16
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; LinkCrc16                                       B1830  96 PC, low confidence
; Works out the 16-bit CRC of a packet
;-----------------------------------------------------------------------------
LinkCrc16:
        push esi
        mov ebx, dword [byte esp+08h]
        mov esi, dword [byte esp+0Ch]
        mov edx, 0FBEAh
        add esi, ebx
        mov eax, ebx
        cmp ebx, esi
        jae short .2
.1:
        xor ebx, ebx
        xor ecx, ecx
        mov bl, dl
        mov cl, byte [eax]
        xor ebx, ecx
        mov bx, word [nosplit ebx*2+Crc16Table]
        and ebx, 0FFFFh
        shr edx, 8
        inc eax
        xor edx, ebx
        cmp eax, esi
        jb short .1
.2:
        mov eax, edx
        pop esi
        ret
