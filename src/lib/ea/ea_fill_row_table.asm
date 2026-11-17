; EA library: FillRowTable, removewindow.
bits 32
%include "hockey.inc"
section s_C3CC0 progbits alloc exec nowrite align=1
extern FatalError, FillRectSpans_111, FillRectSpans_131, FillRectSpans_182, FillRectSpans_1D3, FillRectSpans_21D, FillRectSpans_263, FillRectSpans_AC
extern FillRectSpans_CD, FillRectSpans_F1, RowTable, RowTableSize, str_RemovewindowROWSPACE
global FillRowTable, removewindow, FillRectSpansModeTable
;-----------------------------------------------------------------------------
; FillRowTable                                    C3CC0  96 PC, low confidence
; Fills the screen row address table for a range of rows of the current
; screen
;-----------------------------------------------------------------------------
FillRowTable:
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov ecx, eax
        mov edi, edx
        mov esi, ebx
        mov eax, dword [RowTable]
        mov edx, dword [RowTableSize]
        xor ebx, ebx
        cmp eax, edx
        jae short .4
        mov edx, ecx
        add edx, edi
        mov dword [esp], edx
.1:
        mov edx, dword [eax]
        cmp edx, esi
        jl short .3
        cmp dword [byte eax+04h], byte 0
        jbe short .2
        cmp ecx, dword [byte eax+08h]
        jne short .3
        mov ebp, dword [byte eax+0Ch]
        cmp ebp, dword [esp]
        jne short .3
        mov edx, dword [byte eax+04h]
        add eax, byte 8
        inc edx
        mov dword [byte eax-04h], edx
        jmp near .10
.2:
        test ebx, ebx
        jne short .3
        mov ebx, eax
.3:
        shl edx, 2
        add edx, byte 8
        mov ebp, dword [RowTableSize]
        add eax, edx
        cmp eax, ebp
        jb short .1
.4:
        test ebx, ebx
        je short .9
        lea edx, [byte esi+08h]
        mov eax, dword [ebx]
        cmp eax, edx
        jge short .5
        mov esi, eax
        jmp short .6
.5:
        mov edx, eax
        sub edx, esi
        mov dword [byte ebx+esi*4+0Ch], 0
        sub edx, byte 2
        mov dword [byte ebx+esi*4+08h], edx
.6:
        add ebx, byte 4
        mov dword [byte ebx-04h], esi
        xor edx, edx
        mov dword [ebx], 1
        add ebx, byte 4
        test esi, esi
        jle short .8
        mov eax, ebx
.7:
        inc edx
        mov dword [eax], ecx
        add eax, byte 4
        add ecx, edi
        cmp edx, esi
        jl short .7
.8:
        mov eax, ebx
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
.9:
        xor eax, eax
.10:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; removewindow                                 C3D80  95 PC, medium confidence
; EA library: releases a drawing window (drops its reference and frees it at zero)
;-----------------------------------------------------------------------------
removewindow:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edx, eax
        mov ebx, dword [byte eax+04h]
        dec ebx
        mov dword [byte eax+04h], ebx
        test ebx, ebx
        ja near .5
        mov esi, dword [RowTable]
        xor edi, edi
        cmp esi, eax
        jae short .2
.1:
        mov eax, dword [esi]
        add eax, byte 2
        shl eax, 2
        mov edi, esi
        add esi, eax
        cmp esi, edx
        jb short .1
.2:
        cmp esi, edx
        je short .3
        push str_RemovewindowROWSPACE
        call FatalError
        add esp, byte 4
.3:
        mov eax, dword [esi]
        add eax, byte 2
        shl eax, 2
        mov ebp, dword [RowTableSize]
        add eax, esi
        cmp eax, ebp
        jae short .4
        cmp dword [byte eax+04h], byte 0
        ja short .4
        mov eax, dword [eax]
        mov ebx, dword [esi]
        add eax, byte 2
        add ebx, eax
        mov dword [esi], ebx
.4:
        test edi, edi
        je short .5
        cmp dword [byte edi+04h], byte 0
        ja short .5
        mov eax, dword [esi]
        add eax, byte 2
        add dword [edi], eax
.5:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
FillRectSpansModeTable:                         ; used by FillRectSpans
        dd FillRectSpans_AC
        dd FillRectSpans_AC
        dd FillRectSpans_CD
        dd FillRectSpans_F1
        dd FillRectSpans_111
        dd FillRectSpans_131
        dd FillRectSpans_182
        dd FillRectSpans_1D3
        dd FillRectSpans_21D
        dd FillRectSpans_263
