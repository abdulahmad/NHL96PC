; Watcom C runtime: file_putc_, __fprtf_, _nexpand_, __HeapManager_expand_, _nmsize_.
bits 32
%include "hockey.inc"
section s_C511A progbits alloc exec nowrite align=1
extern __ExpandDGROUP_, __flush_, __HeapFlags, __ioalloc_, __prtf_, _Extender, _ExtenderSubtype, _nfree_
extern fputc_, HeapList
global file_putc_, __fprtf_, _nexpand_, _nexpand__10, __HeapManager_expand_, __HeapManager_expand__18F, __HeapManager_expand__1EA, _nmsize_
        db 00h,00h
;-----------------------------------------------------------------------------
; file_putc_                                                    C511C  library
; Run-time library: writes one character to a stream (fprintf output)
;-----------------------------------------------------------------------------
file_putc_:
        push ebx
        mov ebx, eax
        mov eax, edx
        mov edx, dword [ebx]
        call fputc_
        inc dword [byte ebx+010h]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __fprtf_                                                      C512D  library
; Run-time library: the fprintf engine
;-----------------------------------------------------------------------------
__fprtf_:
        push ecx
        push esi
        push edi
        push ebp
        mov esi, eax
        mov ebp, dword [byte eax+0Ch]
        mov ah, byte [byte eax+0Ch]
        mov ecx, dword [byte esi+08h]
        and ah, 0CFh
        and ebp, byte 30h
        mov byte [byte esi+0Ch], ah
        test ecx, ecx
        jne short .1
        mov eax, esi
        call __ioalloc_
.1:
        mov cl, byte [byte esi+0Dh]
        xor edi, edi
        test cl, 4
        je short .2
        mov ch, cl
        and ch, 0FAh
        mov al, ch
        mov byte [byte esi+0Dh], ch
        or al, 1
        mov edi, 1
        mov byte [byte esi+0Dh], al
.2:
        mov ecx, file_putc_
        mov eax, esi
        call __prtf_
        mov edx, eax
        test edi, edi
        je short .3
        mov ah, byte [byte esi+0Dh]
        and ah, 0FAh
        mov bl, ah
        mov byte [byte esi+0Dh], ah
        or bl, 4
        mov eax, esi
        mov byte [byte esi+0Dh], bl
        call __flush_
.3:
        test byte [byte esi+0Ch], 20h
        je short .4
        mov edx, 0FFFFFFFFh
.4:
        mov edi, dword [byte esi+0Ch]
        or edi, ebp
        mov eax, edx
        mov dword [byte esi+0Ch], edi
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; _nexpand_                                                     C51B2  library
; Run-time library: grows a near heap block in place
;-----------------------------------------------------------------------------
_nexpand_:
        push ebx
        push ecx
        push esi
        push edi
        sub esp, byte 8
        mov esi, eax
        mov edi, edx
        and byte [byte esp+04h], 0FEh
_nexpand__10:
        mov eax, HeapList
        mov edx, ds
        mov ecx, esp
        xor eax, eax
        mov ebx, edi
        mov ax, dx
        mov edx, esi
        call __HeapManager_expand_
        mov edx, eax
        test eax, eax
        jne near __HeapManager_expand__18F
        mov eax, esi
        jmp near __HeapManager_expand__1EA
;-----------------------------------------------------------------------------
; __HeapManager_expand_                                         C51EA  library
; Run-time heap: grows a block in place
;-----------------------------------------------------------------------------
__HeapManager_expand_:
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        push eax
        mov edi, edx
        lea eax, [byte ebx+07h]
        and al, 0FCh
        cmp eax, ebx
        jae short .1
        mov eax, 0FFFFFFFFh
.1:
        cmp eax, byte 0Ch
        jae short .2
        mov eax, 0Ch
.2:
        lea edx, [byte edi-04h]
        mov dword [byte esp+04h], edx
        mov edx, dword [edx]
        and dl, 0FEh
        cmp eax, edx
        jbe near .14
        mov ebx, dword [byte esp+04h]
        sub eax, edx
        add ebx, edx
.3:
        mov dword [ecx], eax
        mov ebp, dword [ebx]
        cmp ebp, byte 0FFFFFFFFh
        jne short .4
        mov ebp, 2
        jmp near .20
.4:
        test ebp, 1
        jne near .13
        mov eax, dword [byte ebx+08h]
        mov dword [byte esp+08h], eax
        mov eax, dword [byte ebx+04h]
        mov edx, ds
        mov dword [byte esp+0Ch], eax
        mov eax, HeapList
        cmp dx, word [esp]
        jne short .8
        mov esi, dword [HeapList]
        jmp short .7
.5:
        cmp esi, edi
        ja short .6
        cmp edi, edx
        jb short .8
.6:
        mov esi, dword [byte esi+08h]
.7:
        mov edx, dword [byte esi+08h]
        test edx, edx
        jne short .5
.8:
        mov edx, dword [byte esi+0Ch]
        cmp ebx, edx
        jne short .9
        mov eax, dword [byte edx+04h]
        mov dword [byte esi+0Ch], eax
.9:
        cmp ebp, dword [ecx]
        jb short .10
        mov eax, ebp
        mov edx, dword [ecx]
        sub eax, edx
        cmp eax, byte 0Ch
        jae short .11
.10:
        mov eax, dword [byte esp+0Ch]
        mov edx, dword [byte esp+08h]
        mov dword [byte eax+08h], edx
        mov eax, edx
        mov edx, dword [byte esp+0Ch]
        mov dword [byte eax+04h], edx
        mov eax, dword [byte esp+04h]
        add dword [eax], ebp
        mov eax, dword [byte esi+01Ch]
        dec eax
        xor dl, dl
        mov dword [byte esi+01Ch], eax
        mov byte [__HeapFlags], dl
        mov edx, dword [ecx]
        cmp ebp, edx
        jb short .12
        jmp near .19
.11:
        add ebx, edx
        mov dword [ebx], eax
        mov eax, dword [byte esp+0Ch]
        mov dword [byte ebx+04h], eax
        mov eax, dword [byte esp+08h]
        mov dword [byte ebx+08h], eax
        mov eax, dword [byte esp+0Ch]
        mov dword [byte eax+08h], ebx
        mov eax, dword [byte esp+08h]
        mov dword [byte eax+04h], ebx
        mov edx, dword [byte esp+04h]
        mov eax, dword [ecx]
        mov edi, dword [edx]
        xor ebp, ebp
        add edi, eax
        xor ah, ah
        mov dword [edx], edi
        mov byte [__HeapFlags], ah
        jmp near .20
.12:
        mov eax, edx
        sub eax, ebp
        add ebx, ebp
        jmp near .3
.13:
        mov ebp, 1
        jmp short .20
.14:
        sub edx, eax
        cmp edx, byte 0Ch
        jb short .19
        mov ebx, eax
        mov ecx, dword [byte esp+04h]
        or bl, 1
        or dl, 1
        mov dword [ecx], ebx
        lea ebx, [ecx+eax]
        mov eax, HeapList
        mov dword [byte esp+04h], ebx
        mov dword [ebx], edx
        mov edx, ds
        mov ebx, dword [esp]
        cmp dx, bx
        jne short .18
        mov esi, dword [HeapList]
        jmp short .17
.15:
        cmp esi, edi
        ja short .16
        cmp edi, ecx
        jb short .18
.16:
        mov esi, dword [byte esi+08h]
.17:
        mov ecx, dword [byte esi+08h]
        test ecx, ecx
        jne short .15
.18:
        inc dword [byte esi+018h]
        mov eax, dword [byte esp+04h]
        add eax, byte 4
        call _nfree_
.19:
        xor ebp, ebp
.20:
        mov eax, ebp
        add esp, byte 10h
        pop ebp
        pop edi
        pop esi
        ret
__HeapManager_expand__18F:
        cmp eax, byte 1
        je short .25
        cmp byte [_Extender], 1
        jne short .21
        cmp byte [_ExtenderSubtype], 0
        je short .22
.21:
        cmp byte [_Extender], 9
        jne short .23
.22:
        xor edx, edx
        jmp short .24
.23:
        mov edx, 1
.24:
        test edx, edx
        je short .25
        cmp eax, byte 2
        jne near _nexpand__10
        mov bh, byte [byte esp+04h]
        test bh, 1
        jne short .25
        mov eax, dword [esp]
        call __ExpandDGROUP_
        test eax, eax
        je short .25
        mov cl, bh
        or cl, 1
        mov byte [byte esp+04h], cl
        jmp near _nexpand__10
.25:
        xor eax, eax
__HeapManager_expand__1EA:
        add esp, byte 8
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; _nmsize_                                                      C53DC  library
; Run-time library: the size of a near heap block
;-----------------------------------------------------------------------------
_nmsize_:
        mov eax, dword [byte eax-04h]
        and al, 0FEh
        sub eax, byte 4
        ret
