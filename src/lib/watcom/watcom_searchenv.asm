; Watcom C runtime: _searchenv, the environment path search.
bits 32
%include "hockey.inc"
section s_A9BC9 progbits alloc exec nowrite align=1
extern __set_errno_, access_, ErrnoPtr, getcwd_, getenv_, strcat_, strcpy_, strlen_
global _searchenv_
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; _searchenv_                                                   A9BCC  library
; Run-time library _searchenv: finds a file on the paths of an environment variable
;-----------------------------------------------------------------------------
_searchenv_:
        push ecx
        push esi
        push edi
        enter 4, 0
        mov ecx, eax
        mov edi, edx
        mov esi, ebx
        call ErrnoPtr
        mov eax, dword [eax]
        xor edx, edx
        mov dword [byte ebp-04h], eax
        mov eax, ecx
        call access_
        test eax, eax
        jne short .3
        mov eax, ebx
        cmp byte [ecx], 5Ch
        je short .2
        cmp byte [ecx], 2Eh
        je short .2
        cmp byte [ecx], 2Fh
        je short .2
        cmp byte [ecx], 0
        je short .1
        cmp byte [byte ecx+01h], 3Ah
        je short .2
.1:
        mov edx, 50h
        mov eax, esi
        call getcwd_
        mov eax, esi
        call strlen_
        add eax, esi
        cmp byte [byte eax-01h], 5Ch
        je short .2
        mov byte [eax], 5Ch
        inc eax
.2:
        mov edx, ecx
        call strcpy_
        leave
        pop edi
        pop esi
        pop ecx
        ret
.3:
        mov eax, edi
        call getenv_
        mov ebx, eax
        test eax, eax
        je near .9
.4:
        cmp byte [ebx], 0
        je near .9
        mov eax, esi
.5:
        cmp byte [ebx], 0
        je short .6
        cmp byte [ebx], 3Bh
        je short .6
        mov dl, byte [ebx]
        inc ebx
        mov byte [eax], dl
        inc eax
        jmp short .5
.6:
        cmp eax, esi
        je short .8
        cmp byte [byte eax-01h], 5Ch
        je short .7
        cmp byte [byte eax-01h], 2Fh
        je short .7
        cmp byte [byte eax-01h], 3Ah
        je short .7
        mov byte [eax], 5Ch
        inc eax
.7:
        mov edx, ecx
        mov byte [eax], 0
        call strcat_
        mov eax, esi
        xor edx, edx
        call access_
        test eax, eax
        jne short .8
        mov eax, dword [byte ebp-04h]
        call __set_errno_
        leave
        pop edi
        pop esi
        pop ecx
        ret
.8:
        cmp byte [ebx], 0
        je short .9
        inc ebx
        jmp short .4
.9:
        mov byte [esi], 0
        leave
        pop edi
        pop esi
        pop ecx
        ret
