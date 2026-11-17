; EA library: SetRemapTable, GetRemapTable, SetColourRemap, GetColourRemap, SetBlitSource and 7 more.
bits 32
%include "hockey.inc"
section s_DD8AD progbits alloc exec nowrite align=1
extern BlendTablePtr, BlitColumnOffsets, BlitSourcePtr, ColourRemap, DrawBitsPerPixel, DrawVideoBase, RemapTable
global SetRemapTable, GetRemapTable, SetColourRemap, GetColourRemap, SetBlitSource, SetBlendTables, CopyMappedSpan, ScaleRowRemapKeyed
global CopyScaledSpanShadow, ScaleRowShadow, ScaleRowBlend, CopyScaledSpan
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; SetRemapTable                                   DD8B0  96 PC, low confidence
; Copies a 256-entry colour remap table into the current one
;-----------------------------------------------------------------------------
SetRemapTable:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov ecx, 40h
        mov esi, dword [byte ebp+08h]
        mov edi, RemapTable
        rep movsd
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; GetRemapTable                                   DD8C8  96 PC, low confidence
; Copies the current 256-entry colour remap table out
;-----------------------------------------------------------------------------
GetRemapTable:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov edi, dword [byte ebp+08h]
        mov esi, RemapTable
        mov ecx, 40h
        rep movsd
        pop edi
        pop esi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov ecx, dword [byte ebp+0Ch]
        mov esi, dword [byte ebp+010h]
        mov edi, RemapTable
        mov ebx, dword [byte ebp+08h]
        lea edi, [ebx+edi]
        shr ecx, 2
        rep movsd
        mov ecx, dword [byte ebp+0Ch]
        and ecx, byte 3
        rep movsb
        pop edi
        pop esi
        leave
        ret
        db 00h
;-----------------------------------------------------------------------------
; SetColourRemap                               DD908  96 PC, medium confidence
; Copies a 256 byte colour remap table into the current remap
;-----------------------------------------------------------------------------
SetColourRemap:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov edi, ColourRemap
        mov esi, dword [byte ebp+08h]
        mov ecx, 40h
        rep movsd
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; GetColourRemap                               DD920  96 PC, medium confidence
; Copies the current 256 byte colour remap table out
;-----------------------------------------------------------------------------
GetColourRemap:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov edi, dword [byte ebp+08h]
        mov esi, ColourRemap
        mov ecx, 40h
        rep movsd
        pop edi
        pop esi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+010h]
        mov edi, ColourRemap
        add edi, dword [byte ebp+08h]
        mov ecx, dword [byte ebp+0Ch]
.1:
        test ecx, 3
        je short .2
        movsb
        dec ecx
        jmp short .1
.2:
        shr ecx, 2
        rep movsd
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; SetBlitSource                                DD960  96 PC, medium confidence
; Sets the source pointer and the column offset table used by the span
; copiers
;-----------------------------------------------------------------------------
SetBlitSource:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [BlitSourcePtr], eax
        mov eax, dword [byte ebp+0Ch]
        mov dword [BlitColumnOffsets], eax
        leave
        ret
;-----------------------------------------------------------------------------
; SetBlendTables                                  DD975  96 PC, low confidence
; Sets the table of blend tables translucent scaled drawing uses
;-----------------------------------------------------------------------------
SetBlendTables:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [BlendTablePtr], eax
        leave
        ret
;-----------------------------------------------------------------------------
; CopyMappedSpan                               DD982  96 PC, medium confidence
; Copies a span of pixels from the source through the column offset table, by
; pixel depth
;-----------------------------------------------------------------------------
CopyMappedSpan:
        push esi
        push edi
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+0Ch]
        mov ecx, dword [byte esp+014h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        LD xor, eax, eax
        sub ecx, byte 4
        js short .6
.1:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+04h]
        cmp al, 0FFh
        je short .2
        mov byte [edi], al
.2:
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+08h]
        cmp al, 0FFh
        je short .3
        mov byte [byte edi+01h], al
.3:
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+0Ch]
        cmp al, 0FFh
        je short .4
        mov byte [byte edi+02h], al
.4:
        mov al, byte [ebx+esi]
        cmp al, 0FFh
        je short .5
        mov byte [byte edi+03h], al
.5:
        sub ecx, byte 4
        lea edx, [byte edx+010h]
        lea edi, [byte edi+04h]
        jns short .1
.6:
        add ecx, byte 3
        js short .9
.7:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        cmp al, 0FFh
        je short .8
        mov byte [edi], al
.8:
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+01h]
        jns short .7
.9:
        pop edi
        pop esi
        ret
        mov ebx, dword [edx]
        cmp dword [DrawBitsPerPixel], byte 10h
        je short .12
.10:
        mov eax, dword [esi+ebx*4]
        LD or, eax, eax
        je short .11
        mov dword [edi], eax
.11:
        mov ebx, dword [byte edx+04h]
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+04h]
        jns short .10
        jmp short .9
.12:
        mov ax, word [esi+ebx*2]
        LD or, ax, ax
        je short .13
        mov word [edi], ax
.13:
        mov ebx, dword [byte edx+04h]
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+02h]
        jns short .12
        jmp short .9
;-----------------------------------------------------------------------------
; ScaleRowRemapKeyed                              DDA44  96 PC, low confidence
; Draws a scaled row through the colour remap, skipping FFh pixels
;-----------------------------------------------------------------------------
ScaleRowRemapKeyed:
        push esi
        push edi
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+0Ch]
        mov ecx, dword [byte esp+014h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        LD xor, eax, eax
        sub ecx, byte 4
        js short .6
.1:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+04h]
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .2
        mov byte [edi], al
.2:
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+08h]
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .3
        mov byte [byte edi+01h], al
.3:
        mov al, byte [ebx+esi]
        mov ebx, dword [byte edx+0Ch]
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .4
        mov byte [byte edi+02h], al
.4:
        mov al, byte [ebx+esi]
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .5
        mov byte [byte edi+03h], al
.5:
        sub ecx, byte 4
        lea edx, [byte edx+010h]
        lea edi, [byte edi+04h]
        jns short .1
.6:
        add ecx, byte 3
        js short .9
.7:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .8
        mov byte [edi], al
.8:
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+01h]
        jns short .7
.9:
        pop edi
        pop esi
        ret
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+0Ch]
        mov edi, dword [byte ebp+08h]
        mov ecx, dword [byte ebp+010h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        LD xor, eax, eax
.10:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov al, byte [dword eax+ColourRemap]
        add edx, byte 4
        mov byte [edi], al
        sub ecx, byte 1
        lea edi, [byte edi+01h]
        jne short .10
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; CopyScaledSpanShadow                         DDB22  96 PC, medium confidence
; Copies a scaled row, skipping colour 0FFh and shading under colour 0FEh
;-----------------------------------------------------------------------------
CopyScaledSpanShadow:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+0Ch]
        mov edi, dword [byte ebp+08h]
        mov ecx, dword [byte ebp+010h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        LD xor, eax, eax
.1:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        add edx, byte 4
        cmp al, 0FEh
        jb short .2
        jne short .3
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
.2:
        mov byte [edi], al
.3:
        sub ecx, byte 1
        lea edi, [byte edi+01h]
        jne short .1
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; ScaleRowShadow                                  DDB68  96 PC, low confidence
; Draws a scaled row through the colour remap: FEh darkens what is under it,
; FFh is skipped
;-----------------------------------------------------------------------------
ScaleRowShadow:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+0Ch]
        mov edi, dword [byte ebp+08h]
        mov ecx, dword [byte ebp+010h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        LD xor, eax, eax
.1:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov al, byte [dword eax+ColourRemap]
        add edx, byte 4
        cmp al, 0FEh
        jb short .2
        jne short .3
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
.2:
        mov byte [edi], al
.3:
        sub ecx, byte 1
        lea edi, [byte edi+01h]
        jne short .1
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; ScaleRowBlend                                   DDBB4  96 PC, low confidence
; Draws a scaled row blended with what is under it through the blend tables
;-----------------------------------------------------------------------------
ScaleRowBlend:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov ebp, dword [byte esp+010h]
        mov ecx, dword [byte esp+018h]
        add esi, dword [BlitSourcePtr]
        add ebp, dword [DrawVideoBase]
        mov edx, dword [BlitColumnOffsets]
        mov edi, dword [BlendTablePtr]
        LD xor, eax, eax
        sub ecx, byte 2
        js short .2
.1:
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov ebx, dword [edi+eax*4]
        mov al, byte [byte ebp+00h]
        mov al, byte [eax+ebx]
        mov byte [byte ebp+00h], al
        mov ebx, dword [byte edx+04h]
        mov al, byte [ebx+esi]
        mov ebx, dword [edi+eax*4]
        mov al, byte [byte ebp+01h]
        mov al, byte [ebx+eax]
        mov byte [byte ebp+01h], al
        sub ecx, byte 2
        lea edx, [byte edx+08h]
        lea ebp, [byte ebp+02h]
        jns short .1
.2:
        add ecx, byte 1
        js short .3
        mov ebx, dword [edx]
        mov al, byte [ebx+esi]
        mov ebx, dword [edi+eax*4]
        mov al, byte [byte ebp+00h]
        mov al, byte [ebx+eax]
        mov byte [byte ebp+00h], al
.3:
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CopyScaledSpan                               DDC2A  96 PC, medium confidence
; Copies a scaled row of pixels
;-----------------------------------------------------------------------------
CopyScaledSpan:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov edi, dword [byte esp+010h]
        mov ecx, dword [byte esp+018h]
        mov edx, dword [BlitColumnOffsets]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        mov ebx, dword [byte edx+0Ch]
        sub ecx, byte 10h
        js near .2
        test edi, 3
        jne near .7
.1:
        mov ebp, dword [byte edx+08h]
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+04h]
        mov ah, byte [esi+ebp]
        mov ebp, dword [edx]
        bswap eax
        mov ah, byte [esi+ebx]
        mov ebx, dword [byte edx+01Ch]
        mov al, byte [esi+ebp]
        mov ebp, dword [byte edx+018h]
        mov dword [edi], eax
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+014h]
        mov ah, byte [esi+ebp]
        mov ebp, dword [byte edx+010h]
        bswap eax
        mov ah, byte [esi+ebx]
        mov ebx, dword [byte edx+02Ch]
        mov al, byte [esi+ebp]
        mov ebp, dword [byte edx+028h]
        mov dword [byte edi+04h], eax
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+024h]
        mov ah, byte [esi+ebp]
        mov ebp, dword [byte edx+020h]
        bswap eax
        mov ah, byte [esi+ebx]
        mov ebx, dword [byte edx+03Ch]
        mov al, byte [esi+ebp]
        mov ebp, dword [byte edx+038h]
        mov dword [byte edi+08h], eax
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+034h]
        mov ah, byte [esi+ebp]
        mov ebp, dword [byte edx+030h]
        bswap eax
        mov ah, byte [esi+ebx]
        mov ebx, dword [byte edx+04Ch]
        mov al, byte [esi+ebp]
        lea edx, [byte edx+040h]
        mov dword [byte edi+0Ch], eax
        sub ecx, byte 10h
        lea edi, [byte edi+010h]
        jns short .1
.2:
        add ecx, byte 0Ch
        js short .4
.3:
        mov ebp, dword [byte edx+08h]
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+04h]
        mov ah, byte [esi+ebp]
        mov ebp, dword [edx]
        bswap eax
        mov ah, byte [esi+ebx]
        mov ebx, dword [byte edx+01Ch]
        mov al, byte [esi+ebp]
        mov dword [edi], eax
        add edx, byte 10h
        add edi, byte 4
        sub ecx, byte 4
        jns short .3
.4:
        add ecx, byte 3
        js short .6
        mov ebx, dword [edx]
.5:
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+04h]
        mov byte [edi], al
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+01h]
        jns short .5
.6:
        pop ebp
        pop edi
        pop esi
        ret
.7:
        add ecx, byte 10h
        mov ebx, dword [edx]
.8:
        mov al, byte [esi+ebx]
        mov ebx, dword [byte edx+04h]
        mov byte [edi], al
        lea edi, [byte edi+01h]
        lea edx, [byte edx+04h]
        test edi, 3
        lea ecx, [byte ecx-01h]
        jne short .8
        mov ebx, dword [byte edx+0Ch]
        sub ecx, byte 10h
        jns near .1
        jmp short .2
        mov ebx, dword [edx]
        cmp dword [DrawBitsPerPixel], byte 10h
        je short .10
.9:
        mov eax, dword [esi+ebx*4]
        mov ebx, dword [byte edx+04h]
        mov dword [edi], eax
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+04h]
        jns short .9
        jmp short .6
.10:
        mov ax, word [esi+ebx*2]
        mov ebx, dword [byte edx+04h]
        mov word [edi], ax
        sub ecx, byte 1
        lea edx, [byte edx+04h]
        lea edi, [byte edi+02h]
        jns short .10
        jmp short .6
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov edi, dword [byte esp+010h]
        mov ebp, dword [byte esp+018h]
        add esi, dword [BlitSourcePtr]
        add edi, dword [DrawVideoBase]
        sub ebp, byte 10h
        js short .12
.11:
        mov eax, dword [esi]
        mov edx, dword [byte esi+04h]
        LD mov, bl, ah
        LD mov, bh, ah
        bswap ebx
        LD mov, bl, al
        LD mov, bh, al
        bswap eax
        LD mov, cl, al
        LD mov, ch, al
        bswap ecx
        LD mov, cl, ah
        LD mov, ch, ah
        mov dword [edi], ebx
        mov dword [byte edi+04h], ecx
        LD mov, bl, dh
        LD mov, bh, dh
        bswap ebx
        LD mov, bl, dl
        LD mov, bh, dl
        bswap edx
        LD mov, cl, dl
        LD mov, ch, dl
        bswap ecx
        LD mov, cl, dh
        LD mov, ch, dh
        mov dword [byte edi+08h], ebx
        mov dword [byte edi+0Ch], ecx
        sub ebp, byte 10h
        lea esi, [byte esi+08h]
        lea edi, [byte edi+010h]
        jns short .11
.12:
        add ebp, byte 0Ch
        js short .14
.13:
        mov al, byte [esi]
        mov ah, byte [byte esi+01h]
        LD mov, bl, ah
        LD mov, bh, ah
        bswap ebx
        LD mov, bl, al
        LD mov, bh, al
        mov dword [edi], ebx
        sub ebp, byte 4
        lea esi, [byte esi+02h]
        lea edi, [byte edi+04h]
        jns short .13
.14:
        add ebp, byte 3
        js short .16
.15:
        mov al, byte [esi]
        mov byte [edi], al
        sub ebp, byte 1
        lea edi, [byte edi+01h]
        jns short .15
.16:
        pop ebp
        pop edi
        pop esi
        ret
        db 02Eh,08Bh,0C0h
        LD mov, ebx, esi
        LD mov, edx, edi
        mov edi, dword [byte esp+04h]
        mov esi, dword [byte esp+08h]
        mov eax, dword [byte esp+0Ch]
        add edi, dword [DrawVideoBase]
        add esi, dword [BlitSourcePtr]
        cmp eax, byte 0Ch
        jl short .17
        LD mov, ecx, edi
        neg ecx
        and ecx, byte 3
        LD sub, eax, ecx
        rep movsb
        LD mov, ecx, eax
        shr ecx, 2
        rep movsd
        and eax, byte 3
        jne short .17
        LD mov, edi, edx
        LD mov, esi, ebx
        ret
.17:
        LD mov, ecx, eax
        rep movsb
        LD mov, edi, edx
        LD mov, esi, ebx
        ret
