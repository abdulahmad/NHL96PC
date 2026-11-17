; Watcom C runtime: strcmp_.
bits 32
%include "hockey.inc"
section s_B2200 progbits alloc exec nowrite align=1
global strcmp_
;-----------------------------------------------------------------------------
; strcmp_                                                       B2200  library
; Run-time library strcmp: compares two strings
;-----------------------------------------------------------------------------
strcmp_:
        push ebx
        push ecx
        mov ebx, eax
        cmp eax, edx
        je short .2
.1:
        mov eax, dword [ebx]
        mov ecx, dword [edx]
        cmp ecx, eax
        jne short .3
        not ecx
        add eax, 0FEFEFEFFh
        and eax, ecx
        and eax, 80808080h
        jne short .2
        mov eax, dword [byte ebx+04h]
        mov ecx, dword [byte edx+04h]
        cmp ecx, eax
        jne short .3
        not ecx
        add eax, 0FEFEFEFFh
        and eax, ecx
        and eax, 80808080h
        jne short .2
        mov eax, dword [byte ebx+08h]
        mov ecx, dword [byte edx+08h]
        cmp ecx, eax
        jne short .3
        not ecx
        add eax, 0FEFEFEFFh
        and eax, ecx
        and eax, 80808080h
        jne short .2
        mov eax, dword [byte ebx+0Ch]
        mov ecx, dword [byte edx+0Ch]
        cmp ecx, eax
        jne short .3
        add ebx, byte 10h
        add edx, byte 10h
        not ecx
        add eax, 0FEFEFEFFh
        and eax, ecx
        and eax, 80808080h
        je short .1
.2:
        sub eax, eax
        pop ecx
        pop ebx
        ret
.3:
        cmp al, cl
        jne short .4
        cmp al, 0
        je short .2
        cmp ah, ch
        jne short .4
        cmp ah, 0
        je short .2
        shr eax, 10h
        shr ecx, 10h
        cmp al, cl
        jne short .4
        cmp al, 0
        je short .2
        cmp ah, ch
.4:
        sbb eax, eax
        or al, 1
        pop ecx
        pop ebx
        ret
