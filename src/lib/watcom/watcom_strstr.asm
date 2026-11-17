; Watcom C runtime: strstr_, atoi_, strlen_, strncmp_.
bits 32
%include "hockey.inc"
section s_B16C9 progbits alloc exec nowrite align=1
extern _IsTable
global strstr_, atoi_, strlen_, strncmp_
;-----------------------------------------------------------------------------
; strstr_                                                       B16C9  library
; Run-time library strstr: finds a substring
;-----------------------------------------------------------------------------
strstr_:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov esi, eax
        mov ebx, edx
        cmp byte [edx], 0
        jne short .2
.1:
        mov eax, esi
        jmp near .13
.2:
        cmp byte [byte edx+01h], 0
        jne short .6
        mov dl, byte [ebx]
.3:
        mov al, byte [esi]
        LD cmp, al, dl
        je short .5
        cmp al, 0
        je near .4
        inc esi
        mov al, byte [esi]
        LD cmp, al, dl
        je short .5
        inc esi
        cmp al, 0
        jne short .3
.4:
        LD sub, esi, esi
.5:
        jmp short .1
.6:
        mov ecx, 0FFFFFFFFh
        mov edi, esi
        xor al, al
        push es
        jecxz .7
        mov edx, ds
        mov es, edx
        repne scasb
        jne short .7
        dec edi
        db 066h
        db 0A9h
.7:
        mov edi, ecx
        pop es
        mov dword [esp], edi
        mov edi, ebx
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
        mov ebp, ecx
.8:
        mov ecx, dword [esp]
        sub ecx, esi
        cmp ecx, ebp
        jl short .12
        mov edi, esi
        mov al, byte [ebx]
        push es
        jecxz .9
        mov edx, ds
        mov es, edx
        repne scasb
        jne short .9
        dec edi
        db 066h
        db 0A9h
.9:
        mov edi, ecx
        pop es
        mov edx, edi
        test edi, edi
        je short .12
        mov esi, edi
        mov ecx, ebp
        mov edi, ebx
        push es
        mov eax, ds
        mov es, eax
        xor eax, eax
        repe cmpsb
        je short .10
        sbb eax, eax
        sbb eax, byte 0FFFFFFFFh
.10:
        pop es
        test eax, eax
        jne short .11
        mov eax, edx
        jmp short .13
.11:
        lea esi, [byte edx+01h]
        jmp short .8
.12:
        xor eax, eax
.13:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; atoi_                                                         B178B  library
; Run-time library atoi: a decimal string to an integer
;-----------------------------------------------------------------------------
atoi_:
        push ebx
        push ecx
        push edx
.1:
        mov dl, byte [eax]
        inc dl
        and edx, 0FFh
        test byte [dword edx+_IsTable], 2
        je short .2
        inc eax
        jmp short .1
.2:
        mov cl, byte [eax]
        cmp cl, 2Bh
        je short .3
        cmp cl, 2Dh
        jne short .4
.3:
        inc eax
.4:
        xor ebx, ebx
.5:
        mov dl, byte [eax]
        inc dl
        and edx, 0FFh
        test byte [dword edx+_IsTable], 20h
        je short .6
        imul ebx, byte 0Ah
        xor edx, edx
        mov dl, byte [eax]
        add ebx, edx
        inc eax
        sub ebx, byte 30h
        jmp short .5
.6:
        cmp cl, 2Dh
        jne short .7
        neg ebx
.7:
        mov eax, ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; strlen_                                                       B17E2  library
; Run-time library strlen: the length of a string
;-----------------------------------------------------------------------------
strlen_:
        push ecx
        push edi
        mov edi, eax
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
        mov eax, ecx
        pop edi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; strncmp_                                                      B17FB  library
; Run-time library strncmp: compares at most n characters
;-----------------------------------------------------------------------------
strncmp_:
        push ecx
.1:
        test ebx, ebx
        jne short .3
.2:
        xor eax, eax
        pop ecx
        ret
.3:
        mov cl, byte [eax]
        mov ch, byte [edx]
        cmp cl, ch
        je short .4
        xor ebx, ebx
        xor eax, eax
        mov bl, cl
        mov al, ch
        sub ebx, eax
        mov eax, ebx
        pop ecx
        ret
.4:
        cmp byte [eax], 0
        je short .2
        inc eax
        inc edx
        dec ebx
        jmp short .1
