; EA library: CopyRowKeyed, DrawArtKeyed, DrawArtKeyedAtOrigin, PutBlockKeyed.
bits 32
%include "hockey.inc"
section s_C24CE progbits alloc exec nowrite align=1
extern bcopy, CopyRowKeyedRemap, DrawArtKeyedAt, DrawArtOpaque, KeyedDraw, PutBlock, PutBlockKeyedAt, RowCopyFunc
global CopyRowKeyed, DrawArtKeyed, DrawArtKeyedAtOrigin, PutBlockKeyed
        db 00h,00h
;-----------------------------------------------------------------------------
; CopyRowKeyed                                 C24D0  96 PC, medium confidence
; Row copier that skips colour 0FFh pixels
;-----------------------------------------------------------------------------
CopyRowKeyed:
        push esi
        mov ecx, dword [byte esp+0Ch]
        mov esi, dword [byte esp+010h]
        mov edx, dword [byte esp+08h]
        mov eax, ecx
        test esi, esi
        je short .3
        add esi, ecx
.1:
        mov bl, byte [edx]
        xor ecx, ecx
        mov cl, bl
        inc edx
        cmp ecx, 0FFh
        je short .2
        mov byte [eax], bl
.2:
        inc eax
        cmp eax, esi
        jb short .1
.3:
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; DrawArtKeyed                                 C2500  96 PC, medium confidence
; Draws art, skipping colour 0FFh when keyed drawing is on
;-----------------------------------------------------------------------------
DrawArtKeyed:
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
        call DrawArtKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.1:
        push eax
        push ebx
        mov esi, CopyRowKeyed
        push edx
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call DrawArtOpaque
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; DrawArtKeyedAtOrigin                         C254C  96 PC, medium confidence
; Draws art at its own origin, skipping colour 0FFh when keyed drawing is on
;-----------------------------------------------------------------------------
DrawArtKeyedAtOrigin:
        push esi
        push edi
        mov ebx, dword [byte esp+0Ch]
        mov ecx, dword [KeyedDraw]
        mov edx, dword [byte ebx+0Ah]
        mov eax, dword [byte ebx+0Ch]
        sar edx, 10h
        sar eax, 10h
        test ecx, ecx
        jne short .1
        push eax
        push edx
        push ebx
        call DrawArtKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.1:
        push eax
        push edx
        mov esi, CopyRowKeyed
        push ebx
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call DrawArtOpaque
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
        jne short .2
        push edx
        push ebx
        push eax
        call DrawArtKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.2:
        push edx
        push ebx
        mov esi, CopyRowKeyed
        push eax
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call DrawArtOpaque
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; PutBlockKeyed                                C2600  96 PC, medium confidence
; Puts a block, skipping colour 0FFh when keyed drawing is on
;-----------------------------------------------------------------------------
PutBlockKeyed:
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
        call PutBlockKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.1:
        push eax
        push ebx
        mov esi, CopyRowKeyedRemap
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
        call PutBlockKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.2:
        push eax
        push edx
        mov esi, CopyRowKeyedRemap
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
        call PutBlockKeyedAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.3:
        push edx
        push ebx
        mov esi, CopyRowKeyedRemap
        push eax
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call PutBlock
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
