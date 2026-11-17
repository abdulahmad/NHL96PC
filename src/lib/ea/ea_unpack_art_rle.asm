; EA library: UnpackArtRle, BlitBlockShadow, CopyRowShadowFast.
bits 32
%include "hockey.inc"
section s_DF5BD progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawRowBytes, DrawVideoBase, RemapTable
global UnpackArtRle, BlitBlockShadow, BlitBlockShadow_32, CopyRowShadowFast, CopyRowShadowFast_34
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; UnpackArtRle                                    DF5C0  96 PC, low confidence
; Copies an art header and unpacks its run length coded rows
;-----------------------------------------------------------------------------
UnpackArtRle:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov edi, dword [byte ebp+0Ch]
        LD mov, edx, edi
        mov ecx, 4
        rep movsd
        cmp dword [byte ebp+010h], byte 0
        jne short .7
        LD xor, ecx, ecx
        jmp short .5
.1:
        add esi, byte 2
        mov al, byte [byte esi-01h]
        push ecx
        LD mov, ah, al
        shl eax, 8
        LD mov, al, ah
        shl eax, 8
        LD mov, al, ah
        shr ecx, 2
        rep stosd
        pop ecx
        and ecx, byte 3
        rep stosb
        or cl, byte [esi]
        je short .6
        jns short .1
.2:
        inc esi
        neg cl
.3:
        test ecx, 3
        je short .4
        movsb
        dec ecx
        jmp short .3
.4:
        shr ecx, 2
        rep movsd
.5:
        or cl, byte [esi]
        js short .2
        jne short .1
.6:
        LD mov, eax, edx
        and byte [eax], 7Fh
        pop edi
        pop esi
        leave
        ret
.7:
        mov eax, dword [byte edi-0Ch]
        sub eax, dword [byte edi-08h]
        mov dword [byte edi-08h], eax
        LD mov, ebx, edi
        mov edx, dword [byte edi-0Ch]
        mov dword [byte ebp-04h], edx
        LD add, edi, edx
        dec edi
        LD xor, ecx, ecx
.8:
        mov cl, byte [esi]
        inc esi
        LD or, cl, cl
        jg short .9
        jl short .12
        jmp short .15
.9:
        mov al, byte [esi]
        std
.10:
        stosb
        dec edx
        jne short .11
        mov edx, dword [byte ebp-04h]
        LD add, ebx, edx
        LD mov, edi, ebx
        LD add, edi, edx
        dec edi
.11:
        dec ecx
        jne short .10
        cld
        inc esi
        jmp short .8
.12:
        neg cl
.13:
        mov al, byte [esi]
        inc esi
        std
        stosb
        cld
        dec edx
        jne short .14
        mov edx, dword [byte ebp-04h]
        LD add, ebx, edx
        LD mov, edi, ebx
        LD add, edi, edx
        dec edi
.14:
        dec ecx
        jne short .13
        jmp short .8
.15:
        mov edx, dword [byte ebp+0Ch]
        jmp short .6
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE8h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockShadow_32
;-----------------------------------------------------------------------------
; BlitBlockShadow                                 DF6A7  96 PC, low confidence
; Draws a block with shadow pixels: FFh skipped, FEh remapped, others copied
;-----------------------------------------------------------------------------
BlitBlockShadow:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE8h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockShadow_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE8h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlockShadow_32:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte esi+06h]
        lea edx, [byte esi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop edi
        pop esi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-018h], edx
        movsx edx, word [byte esi+04h]
        imul edx
        mov edx, dword [byte ebp-018h]
        LD add, edx, eax
        LD mov, eax, ebx
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jle short .1
.3:
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ecx
        mov dword [byte ebp-08h], ebx
        movsx ecx, word [byte esi+04h]
        LD xor, edx, edx
        mov eax, dword [byte ebp-04h]
        LD mov, ebx, eax
        cmp eax, dword [DrawClipLeft]
        jl short .4
        LD add, eax, ecx
        sub eax, dword [DrawClipRight]
        jl short .6
        LD sub, ecx, eax
        jle short .1
        LD mov, edx, eax
        jmp short .6
.4:
        mov ebx, dword [DrawClipLeft]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        LD mov, esi, ecx
        LD sub, esi, eax
        add dword [byte ebp-018h], esi
        mov esi, dword [DrawClipRight]
        LD sub, esi, ebx
        jle short .1
        LD cmp, eax, esi
        jl short .5
        LD mov, eax, esi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .12
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+ebx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-04h]
        mov esi, dword [byte ebp-018h]
        mov edx, dword [DrawRowBytes]
        sub edx, dword [byte ebp-0Ch]
        LD xor, eax, eax
.7:
        mov ecx, dword [byte ebp-0Ch]
.8:
        mov al, byte [esi]
        inc esi
        cmp al, 0FEh
        ja short .10
        je short .9
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .8
        jmp short .11
.9:
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .8
        jmp short .11
.10:
        inc edi
        dec ecx
        jne short .8
.11:
        add esi, dword [byte ebp-010h]
        LD add, edi, edx
        dec dword [byte ebp-014h]
        jg short .7
.12:
        pop edi
        pop esi
        leave
        ret
        db 00h,00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        cwde
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        cwde
        mov dword [byte ebp-08h], eax
        jmp short CopyRowShadowFast_34
;-----------------------------------------------------------------------------
; CopyRowShadowFast                               DF810  96 PC, low confidence
; Copies a row with shadow pixels to a linear screen
;-----------------------------------------------------------------------------
CopyRowShadowFast:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short CopyRowShadowFast_34
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
CopyRowShadowFast_34:
        mov ebx, dword [byte ebp-08h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        mov edi, dword [ebx]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov edx, dword [DrawRowBytes]
        movsx eax, word [byte esi+04h]
        mov dword [byte ebp-0Ch], eax
        LD sub, edx, eax
        movsx eax, word [byte esi+06h]
        mov dword [byte ebp-010h], eax
        cld
        add esi, byte 10h
        LD xor, eax, eax
.1:
        mov ecx, dword [byte ebp-0Ch]
.2:
        mov al, byte [esi]
        inc esi
        cmp al, 0FEh
        ja short .4
        je short .3
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .2
        jmp short .5
.3:
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .2
        jmp short .5
.4:
        inc edi
        dec ecx
        jne short .2
.5:
        LD add, edi, edx
        dec dword [byte ebp-010h]
        jg short .1
        pop edi
        pop esi
        pop ds
        leave
        ret
        db 00h
