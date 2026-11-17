; Watcom C runtime: getcwd_.
bits 32
%include "hockey.inc"
section s_C2444 progbits alloc exec nowrite align=1
extern __set_errno_, _nmalloc_, strncpy_
global getcwd_
;-----------------------------------------------------------------------------
; getcwd_                                                       C2444  library
; Run-time library getcwd: the current directory
;-----------------------------------------------------------------------------
getcwd_:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        sub esp, 90h
        mov ebx, eax
        mov ebp, edx
        lea esi, [byte esp+03h]
        xor dl, dl
        mov ah, 47h
        int 21h
        rcl eax, 1
        ror eax, 1
        test eax, eax
        jge short .2
        mov eax, 1
.1:
        call __set_errno_
        xor eax, eax
        jmp short .5
.2:
        mov ah, 19h
        int 21h
        mov ah, 3Ah
        mov dl, 5Ch
        add al, 41h
        mov edi, esp
        mov byte [esp], al
        mov byte [byte esp+01h], ah
        mov byte [byte esp+02h], dl
        push es
        mov eax, ds
        mov es, eax
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        pop es
        lea edx, [byte ecx+01h]
        test ebx, ebx
        jne short .4
        mov eax, edx
        call _nmalloc_
        mov ebx, eax
        test eax, eax
        jne short .3
        mov eax, 5
        jmp short .1
.3:
        mov ebp, edx
.4:
        mov edx, esp
        mov eax, ebx
        mov ebx, ebp
        call strncpy_
.5:
        add esp, 90h
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
