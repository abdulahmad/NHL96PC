; CD-ROM: CdDirSearch.
bits 32
%include "hockey.inc"
section s_C5D56 progbits alloc exec nowrite align=1
extern __CHK, __set_errno_, _IsTable, _nmalloc_, getcwd_, tolower_
global CdDirSearch
;-----------------------------------------------------------------------------
; CdDirSearch                                  C5D56  96 PC, medium confidence
; Searches the CD directory for a file name and fills a find record
;-----------------------------------------------------------------------------
CdDirSearch:
        push dword 0ACh
        call __CHK
        push ecx
        push esi
        push edi
        push ebp
        sub esp, 90h
        push eax
        push ebx
        test eax, eax
        jne short .1
        mov ecx, 90h
        mov eax, ecx
        mov dword [esp], ecx
        call _nmalloc_
        mov dword [byte esp+04h], eax
        test eax, eax
        jne short .1
        mov eax, 5
        jmp short .5
.1:
        test edx, edx
        je short .2
        mov ah, byte [edx]
        test ah, ah
        jne short .3
.2:
        mov eax, dword [byte esp+04h]
        mov edx, dword [esp]
        call getcwd_
        jmp near .34
.3:
        mov ebx, dword [byte esp+04h]
        mov esi, dword [esp]
        mov ebp, edx
        cmp esi, byte 3
        jae short .7
.4:
        mov eax, 0Eh
.5:
        call __set_errno_
.6:
        xor eax, eax
        jmp near .34
.7:
        lea edi, [byte esi-02h]
        mov al, ah
        mov dword [esp], edi
        inc al
        and eax, 0FFh
        test byte [dword eax+_IsTable], 0C0h
        je short .8
        cmp byte [byte edx+01h], 3Ah
        jne short .8
        xor eax, eax
        mov al, byte [edx]
        call tolower_
        lea ecx, [byte eax-060h]
        mov al, byte [edx]
        mov byte [ebx], al
        mov al, byte [byte edx+01h]
        lea ebp, [byte edx+02h]
        mov byte [byte ebx+01h], al
        jmp short .9
.8:
        xor ecx, ecx
        mov ah, 19h
        int 21h
        mov cl, al
        inc ecx
        mov al, cl
        mov byte [byte ebx+01h], 3Ah
        add al, 40h
        mov byte [ebx], al
.9:
        mov al, byte [byte ebp+00h]
        add ebx, byte 2
        cmp al, 2Fh
        je near .27
        cmp al, 5Ch
        je near .27
        lea esi, [byte esp+08h]
        mov dl, cl
        mov ah, 47h
        int 21h
        rcl eax, 1
        ror eax, 1
        test eax, eax
        jge short .10
        mov eax, 1
        jmp near .5
.10:
        lea edi, [byte esp+08h]
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
        cmp byte [byte esp+08h], 5Ch
        je short .11
        mov eax, dword [esp]
        cmp eax, byte 2
        jb near .4
        lea edx, [byte eax-01h]
        mov byte [ebx], 5Ch
        mov dword [esp], edx
        inc ebx
.11:
        mov esi, dword [esp]
        lea eax, [byte ecx+01h]
        cmp eax, esi
        ja near .4
        mov edi, esi
        sub edi, ecx
        lea esi, [byte esp+08h]
        mov dword [esp], edi
        mov edi, ebx
        add ebx, ecx
        push edi
.12:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je near .13
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .12
.13:
        pop edi
        cmp byte [byte ebx-01h], 5Ch
        je short .14
        mov eax, dword [esp]
        cmp eax, byte 2
        jb near .4
        lea edx, [byte eax-01h]
        mov byte [ebx], 5Ch
        mov dword [esp], edx
        inc ebx
.14:
        mov esi, dword [byte esp+04h]
.15:
        mov cl, byte [byte ebp+00h]
        test cl, cl
        je near .26
        lea eax, [byte ebp+01h]
        cmp cl, 2Eh
        je short .16
        mov edx, dword [esp]
        cmp edx, byte 2
        jb near .4
        mov ebp, eax
        mov byte [ebx], cl
        lea ecx, [byte edx-01h]
        inc ebx
        mov dword [esp], ecx
        jmp short .15
.16:
        mov dl, byte [eax]
        mov ebp, eax
        cmp dl, 2Fh
        je short .17
        cmp dl, 5Ch
        jne short .19
.17:
        mov al, byte [byte ebx-01h]
        cmp al, 2Fh
        je short .18
        cmp al, 5Ch
        je short .18
        mov byte [ebx], 5Ch
        inc ebx
.18:
        inc ebp
        jmp short .15
.19:
        test dl, dl
        je near .26
        cmp dl, cl
        jne short .25
        mov dl, byte [byte eax+01h]
        cmp dl, 2Fh
        je short .20
        cmp dl, 5Ch
        jne short .25
.20:
        mov cl, byte [byte ebx-01h]
        add ebp, byte 2
        cmp cl, 2Fh
        je short .21
        cmp cl, 5Ch
        jne near .6
.21:
        sub ebx, byte 2
.22:
        cmp ebx, esi
        jb near .6
        mov dl, byte [ebx]
        cmp dl, 2Fh
        je short .24
        cmp dl, 5Ch
        je short .24
        cmp dl, 3Ah
        jne short .23
        inc ebx
        mov byte [ebx], 5Ch
        jmp short .24
.23:
        dec ebx
        jmp short .22
.24:
        inc ebx
        mov byte [ebx], 0
        jmp near .15
.25:
        mov edi, dword [esp]
        cmp edi, byte 2
        jb near .4
        lea eax, [byte edi-01h]
        mov byte [ebx], 2Eh
        mov dword [esp], eax
        inc ebx
        jmp near .15
.26:
        mov byte [ebx], 0
        jmp short .30
.27:
        mov edi, ebp
        mov esi, dword [esp]
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
        inc ecx
        cmp ecx, esi
        ja near .4
        mov edi, ebx
        mov esi, ebp
        push edi
.28:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je near .29
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .28
.29:
        pop edi
.30:
        mov eax, dword [byte esp+04h]
        jmp short .33
.31:
        cmp ch, 2Fh
        jne short .32
        mov byte [eax], 5Ch
.32:
        inc eax
.33:
        mov ch, byte [eax]
        test ch, ch
        jne short .31
        mov eax, dword [byte esp+04h]
.34:
        add esp, 98h
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
