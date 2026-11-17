; Watcom C runtime: _EFG_Format_.
bits 32
%include "hockey.inc"
section s_D7AD5 progbits alloc exec nowrite align=1
extern _FtoS_, forcedecpt_
global _EFG_Format_
;-----------------------------------------------------------------------------
; _EFG_Format_                                                  D7AD5  library
; Run-time library: the float format hook for printf (%e, %f, %g)
;-----------------------------------------------------------------------------
_EFG_Format_:
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        mov esi, eax
        mov edi, ebx
        mov dword [byte ebx+0Ch], 0
        mov word [byte esp+08h], ds
        mov cl, byte [byte edi+015h]
        xor ebx, ebx
        cmp cl, 47h
        jb short .2
        jbe short .3
        cmp cl, 66h
        jb short .1
        jbe short .6
        cmp cl, 67h
        je short .3
        jmp near .11
.1:
        cmp cl, 65h
        je short .5
        jmp near .11
.2:
        cmp cl, 45h
        jb near .11
        jbe short .5
        jmp short .6
.3:
        cmp dword [byte edi+08h], byte 0
        jne short .4
        mov dword [byte edi+08h], 1
.4:
        sub cl, 2
.5:
        mov ebx, 1
.6:
        mov ebp, dword [edx]
        add ebp, byte 8
        mov dword [edx], ebp
        mov eax, dword [byte ebp-08h]
        mov dword [esp], eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte esp+04h], eax
        cmp dword [byte edi+08h], byte 0FFFFFFFFh
        jne short .7
        mov dword [byte edi+08h], 6
.7:
        mov al, byte [byte edi+015h]
        and al, 5Fh
        and eax, 0FFh
        push eax
        xor eax, eax
        mov al, cl
        push eax
        push byte 3
        push ebx
        lea edx, [byte esp+010h]
        xor ecx, ecx
        push byte 27h
        mov eax, esi
        mov ebx, dword [byte edi+08h]
        call _FtoS_
        mov ah, byte [esi]
        cmp ah, 2Ah
        jne short .8
        mov byte [byte edi+016h], ah
.8:
        mov byte [byte esi+027h], 0
.9:
        cmp byte [esi], 20h
        jne short .10
        inc esi
        jmp short .9
.10:
        mov eax, esi
        mov edx, edi
        call forcedecpt_
        mov word [byte esp+08h], ds
        mov eax, esi
        mov dword [byte edi+08h], 0FFFFFFFFh
.11:
        mov edx, dword [byte esp+08h]
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
