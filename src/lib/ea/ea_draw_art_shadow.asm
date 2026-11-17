; EA library: DrawArtShadow, FlipArtVertical, TranslateArtPixels.
bits 32
%include "hockey.inc"
section s_DD120 progbits alloc exec nowrite align=1
extern bcopy, BlitBlockShadow, ColourRemap, CopyRowShadow, KeyedDraw, PutBlock, RowCopyFunc, ShapeBankCount
extern ShapeBankEntry, ShapeBankEntryId, TranslatePixels
global DrawArtShadow, FlipArtVertical, TranslateArtPixels
;-----------------------------------------------------------------------------
; DrawArtShadow                                   DD120  96 PC, low confidence
; Draws art with shadow pixels at x, y (FFh skipped, FEh darkened)
;-----------------------------------------------------------------------------
DrawArtShadow:
        push esi
        push edi
        mov edx, dword [byte esp+0Ch]
        mov ebx, dword [byte esp+010h]
        mov eax, dword [byte esp+014h]
        cmp dword [KeyedDraw], byte 0
        jne short .1
        push eax
        push ebx
        push edx
        call BlitBlockShadow
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.1:
        push eax
        push ebx
        mov esi, CopyRowShadow
        push edx
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call PutBlock
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        push esi
        push edi
        mov ebx, dword [byte esp+0Ch]
        mov ecx, dword [KeyedDraw]
        mov edx, dword [byte ebx+0Ah]
        mov eax, dword [byte ebx+0Ch]
        sar edx, 10h
        sar eax, 10h
        test ecx, ecx
        jne short .2
        push eax
        push edx
        push ebx
        call BlitBlockShadow
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.2:
        push eax
        push edx
        mov esi, CopyRowShadow
        push ebx
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call PutBlock
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        mov eax, dword [byte esp+0Ch]
        mov ebx, dword [byte eax+06h]
        mov edx, dword [byte esp+010h]
        sar ebx, 10h
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [byte eax+08h]
        mov ecx, dword [byte esp+014h]
        sar edx, 10h
        sub ecx, edx
        mov edx, ecx
        cmp dword [KeyedDraw], byte 0
        jne short .3
        push edx
        push ebx
        push eax
        call BlitBlockShadow
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.3:
        push edx
        push ebx
        mov esi, CopyRowShadow
        push eax
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call PutBlock
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FlipArtVertical                                 DD220  96 PC, low confidence
; Mirrors art top to bottom
;-----------------------------------------------------------------------------
FlipArtVertical:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov eax, dword [byte esp+018h]
        mov esi, dword [byte esp+018h]
        mov eax, dword [byte eax+04h]
        mov esi, dword [byte esi+02h]
        sar eax, 10h
        sar esi, 10h
        mov dword [esp], eax
        dec eax
        imul eax, esi
        mov edx, dword [byte esp+018h]
        xor edi, edi
        mov ebp, dword [esp]
        add edx, byte 10h
        sar ebp, 1
        lea ebx, [esi+esi]
        add eax, edx
        mov dword [byte esp+04h], ebx
        test ebp, ebp
        jle short .4
.1:
        xor ebx, ebx
        test esi, esi
        jle short .3
.2:
        mov cl, byte [edx]
        inc edx
        mov ch, byte [eax]
        inc eax
        mov byte [byte edx-01h], ch
        inc ebx
        mov byte [byte eax-01h], cl
        cmp ebx, esi
        jl short .2
.3:
        mov ebx, dword [byte esp+04h]
        inc edi
        sub eax, ebx
        cmp edi, ebp
        jl short .1
.4:
        mov edx, dword [byte esp+018h]
        mov eax, dword [esp]
        mov bx, word [byte edx+0Ah]
        sub eax, ebx
        mov word [byte edx+0Ah], ax
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; TranslateArtPixels                              DD2A0  96 PC, low confidence
; Passes all of an art's pixels through a translate table
;-----------------------------------------------------------------------------
TranslateArtPixels:
        mov ebx, dword [byte esp+04h]
        mov edx, dword [byte ebx+02h]
        mov eax, dword [byte ebx+04h]
        sar edx, 10h
        sar eax, 10h
        imul eax, edx
        push eax
        push ColourRemap
        lea eax, [byte ebx+010h]
        push eax
        call TranslatePixels
        add esp, byte 0Ch
        ret
        db 08Bh,0C0h
        push esi
        push edi
        sub esp, byte 8
        mov edi, dword [byte esp+014h]
        xor esi, esi
        jmp short .3
.1:
        mov eax, esp
        push eax
        push esi
        push edi
        call ShapeBankEntryId
        add esp, byte 0Ch
        xor eax, eax
        mov al, byte [esp]
        cmp eax, byte 21h
        je short .2
        push esi
        push edi
        call ShapeBankEntry
        mov ebx, dword [byte eax+02h]
        mov edx, dword [byte eax+04h]
        sar ebx, 10h
        sar edx, 10h
        imul edx, ebx
        add esp, byte 8
        push edx
        push ColourRemap
        add eax, byte 10h
        push eax
        call TranslatePixels
        add esp, byte 0Ch
.2:
        inc esi
.3:
        push edi
        call ShapeBankCount
        add esp, byte 4
        cmp esi, eax
        jl short .1
        add esp, byte 8
        pop edi
        pop esi
        ret
