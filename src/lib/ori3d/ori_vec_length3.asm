; 3D library: VecLength3, NormalizeVec3.
bits 32
%include "hockey.inc"
section s_C9D4F progbits alloc exec nowrite align=1
extern abs_, vecdist
global VecLength3, NormalizeVec3
        db 00h
;-----------------------------------------------------------------------------
; VecLength3                                   C9D50  96 PC, medium confidence
; Returns the length of a 3D vector
;-----------------------------------------------------------------------------
VecLength3:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte eax+08h]
        push edx
        mov ebx, dword [byte eax+04h]
        push ebx
        mov ecx, dword [eax]
        push ecx
        call vecdist
        add esp, byte 8
        push eax
        call vecdist
        add esp, byte 8
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; NormalizeVec3                                   C9D80  96 PC, low confidence
; Scales a 3D vector to unit length
;-----------------------------------------------------------------------------
NormalizeVec3:
        push esi
        mov ebx, dword [byte esp+08h]
        mov esi, dword [byte esp+0Ch]
        mov eax, dword [ebx]
        call abs_
        mov ecx, eax
        mov edx, eax
        mov eax, dword [byte ebx+04h]
        call abs_
        cmp eax, ecx
        jle short .1
        mov eax, dword [byte ebx+04h]
        call abs_
        mov edx, eax
.1:
        mov eax, dword [byte ebx+08h]
        call abs_
        cmp eax, edx
        jle short .2
        mov eax, dword [byte ebx+08h]
        call abs_
        mov edx, eax
.2:
        test edx, edx
        jne short .3
        mov dword [esi], 10000h
        mov dword [byte esi+08h], edx
        mov dword [byte esi+04h], edx
        pop esi
        ret
.3:
        cmp edx, 800000h
        jle short .4
        mov eax, 8
        sar edx, 8
        jmp short .5
.4:
        xor eax, eax
.5:
        cmp edx, 200000h
        jle short .6
        sar edx, 4
        add eax, byte 4
.6:
        cmp edx, 100000h
        jle short .7
        sar edx, 2
        add eax, byte 2
.7:
        cmp edx, 8000h
        jle short .8
        add eax, byte 2
.8:
        mov cl, al
        mov edx, dword [ebx]
        sar edx, cl
        mov dword [esi], edx
        mov edx, dword [byte ebx+04h]
        sar edx, cl
        mov dword [byte esi+04h], edx
        mov edx, dword [byte ebx+08h]
        sar edx, cl
        push esi
        mov dword [byte esi+08h], edx
        call VecLength3
        mov edx, dword [esi]
        shl edx, 10h
        mov ebx, eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [byte esi+04h]
        shl edx, 10h
        mov dword [esi], eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [byte esi+08h]
        shl edx, 10h
        mov dword [byte esi+04h], eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        add esp, byte 4
        mov dword [byte esi+08h], eax
        pop esi
        ret
        mul edx
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        ret
