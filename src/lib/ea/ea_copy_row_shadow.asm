; EA library: CopyRowShadow.
bits 32
%include "hockey.inc"
section s_DD57B progbits alloc exec nowrite align=1
extern bcopy, CopyRowShadowFast, DrawArtOpaque, KeyedDraw, RemapTable, RowCopyFunc
global CopyRowShadow
        db 00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; CopyRowShadow                                   DD580  96 PC, low confidence
; Row copy routine for shadow art: FFh skipped, FEh remapped, others copied
;-----------------------------------------------------------------------------
CopyRowShadow:
        push esi
        mov esi, dword [byte esp+010h]
        mov edx, dword [byte esp+08h]
        mov eax, dword [byte esp+0Ch]
.1:
        dec esi
        cmp esi, byte 0FFFFFFFFh
        je short .4
        mov bl, byte [edx]
        xor ecx, ecx
        mov cl, bl
        inc edx
        cmp ecx, 0FFh
        jne short .2
        inc eax
        jmp short .1
.2:
        cmp ecx, 0FEh
        jne short .3
        xor ebx, ebx
        mov bl, byte [eax]
        inc eax
        mov bl, byte [dword ebx+RemapTable]
        mov byte [byte eax-01h], bl
        jmp short .1
.3:
        inc eax
        mov byte [byte eax-01h], bl
        jmp short .1
.4:
        pop esi
        ret
        db 08Dh,040h,00h
        push esi
        push edi
        mov edx, dword [byte esp+0Ch]
        mov ebx, dword [byte esp+010h]
        mov eax, dword [byte esp+014h]
        cmp dword [KeyedDraw], byte 0
        jne short .5
        push eax
        push ebx
        push edx
        call CopyRowShadowFast
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.5:
        push eax
        push ebx
        mov esi, CopyRowShadow
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
        push esi
        push edi
        mov ebx, dword [byte esp+0Ch]
        mov ecx, dword [KeyedDraw]
        mov edx, dword [byte ebx+0Ah]
        mov eax, dword [byte ebx+0Ch]
        sar edx, 10h
        sar eax, 10h
        test ecx, ecx
        jne short .6
        push eax
        push edx
        push ebx
        call CopyRowShadowFast
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.6:
        push eax
        push edx
        mov esi, CopyRowShadow
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
        jne short .7
        push edx
        push ebx
        push eax
        call CopyRowShadowFast
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
.7:
        push edx
        push ebx
        mov esi, CopyRowShadow
        push eax
        mov edi, bcopy
        mov dword [RowCopyFunc], esi
        call DrawArtOpaque
        add esp, byte 0Ch
        mov dword [RowCopyFunc], edi
        pop edi
        pop esi
        ret
        db 00h,00h,00h
