; 3D library: FillSpanList, BuildSpanOffsets, RemapSpanList, OriApplyMorph, OriRotateY and 1 more.
bits 32
%include "hockey.inc"
section s_C9FB7 progbits alloc exec nowrite align=1
extern AddVec3, DrawDestBuffer, DrawVideoBase, FatalError, FillRect, FillSpansAnd, FillSpansOr, FillSpansSet
extern FillSpansXor, KeyedDraw, OriScaleVector, RemapSpans, RemapTable, SinCosLookup, str_OriapplymorphObjectCanno, str_OriapplymorphObjectCannotMor
extern str_OriinitmorphObjectCannotMorp, strnicmp_, VesaSetBank
global FillSpanList, BuildSpanOffsets, RemapSpanList, OriApplyMorph, OriRotateY, FixedSinCos
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FillSpanList                                    C9FC0  96 PC, low confidence
; Fills a list of horizontal spans, directly or one FillRect per row when
; keyed drawing is on
;-----------------------------------------------------------------------------
FillSpanList:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov ebp, dword [byte esp+014h]
        cmp dword [KeyedDraw], byte 0
        jne short .2
        mov ecx, dword [byte esp+020h]
        push ecx
        mov edi, dword [byte esp+020h]
        push edi
        mov eax, dword [byte esp+020h]
        push eax
        push ebp
        push esi
        call FillSpansSet
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
.2:
        mov ebx, dword [byte esp+01Ch]
        xor edi, edi
        test ebx, ebx
        jle short .4
.3:
        mov edx, dword [byte esp+020h]
        mov eax, dword [byte ebp+00h]
        mov ebx, dword [esi]
        push edx
        sub eax, ebx
        push byte 1
        inc eax
        push eax
        mov ecx, dword [byte esp+024h]
        push ecx
        push ebx
        inc edi
        call FillRect
        add esp, byte 14h
        add esi, byte 4
        mov edx, dword [byte esp+018h]
        add ebp, byte 4
        inc edx
        mov ebx, dword [byte esp+01Ch]
        mov dword [byte esp+018h], edx
        cmp edi, ebx
        jl short .3
.4:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        push esi
        push edi
        mov edx, dword [byte esp+01Ch]
        push edx
        mov ebx, dword [byte esp+01Ch]
        push ebx
        mov ecx, dword [byte esp+01Ch]
        push ecx
        mov esi, dword [byte esp+01Ch]
        push esi
        mov edi, dword [byte esp+01Ch]
        push edi
        call FillSpansXor
        add esp, byte 14h
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        mov edx, dword [byte esp+01Ch]
        push edx
        mov ebx, dword [byte esp+01Ch]
        push ebx
        mov ecx, dword [byte esp+01Ch]
        push ecx
        mov esi, dword [byte esp+01Ch]
        push esi
        mov edi, dword [byte esp+01Ch]
        push edi
        call FillSpansAnd
        add esp, byte 14h
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        mov edx, dword [byte esp+01Ch]
        push edx
        mov ebx, dword [byte esp+01Ch]
        push ebx
        mov ecx, dword [byte esp+01Ch]
        push ecx
        mov esi, dword [byte esp+01Ch]
        push esi
        mov edi, dword [byte esp+01Ch]
        push edi
        call FillSpansOr
        add esp, byte 14h
        pop edi
        pop esi
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; BuildSpanOffsets                             CA0B0  96 PC, medium confidence
; Fills the column offset table by stepping source coordinates in 16.16 fixed
; point
;-----------------------------------------------------------------------------
BuildSpanOffsets:
        push esi
        push edi
        push ebp
        mov ebx, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        mov edx, dword [byte esp+018h]
        mov eax, dword [byte esp+028h]
        test eax, eax
        jle short .2
        mov ebp, dword [byte esp+024h]
.1:
        mov esi, edx
        sar esi, 10h
        imul esi, ebp
        mov edi, ecx
        sar edi, 10h
        add ebx, byte 4
        add esi, edi
        mov edi, dword [byte esp+020h]
        mov dword [byte ebx-04h], esi
        mov esi, dword [byte esp+01Ch]
        add edx, edi
        add ecx, esi
        dec eax
        jne short .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        push ebx
.3:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .4
        xor ebx, ebx
        mov bl, byte [eax]
        inc eax
        mov bl, byte [dword ebx+RemapTable]
        mov byte [byte eax-01h], bl
        jmp short .3
.4:
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; RemapSpanList                                   CA11C  96 PC, low confidence
; Remaps a list of horizontal spans, directly or row by row when keyed
; drawing is on
;-----------------------------------------------------------------------------
RemapSpanList:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        cmp dword [KeyedDraw], byte 0
        jne short .5
        mov ebx, dword [byte esp+020h]
        push ebx
        mov ecx, dword [byte esp+020h]
        push ecx
        mov esi, dword [byte esp+020h]
        push esi
        mov edi, dword [byte esp+020h]
        push edi
        call RemapSpans
        add esp, byte 10h
        jmp near .13
.5:
        mov ebp, dword [byte esp+01Ch]
        shl ebp, 2
.6:
        mov eax, dword [byte esp+020h]
        dec eax
        mov dword [byte esp+020h], eax
        cmp eax, byte 0FFFFFFFFh
        je near .13
        mov ecx, dword [byte esp+014h]
        mov eax, dword [byte esp+018h]
        mov ebx, dword [byte esp+014h]
        mov esi, dword [byte esp+018h]
        add ebx, byte 4
        mov ecx, dword [ecx]
        mov eax, dword [eax]
        add esi, byte 4
        sub eax, ecx
        mov dword [byte esp+014h], ebx
        lea edi, [byte eax+01h]
        mov dword [byte esp+018h], esi
        test edi, edi
        jle near .12
        mov eax, dword [DrawVideoBase]
        mov dword [esp], eax
        mov eax, dword [DrawDestBuffer]
        mov edx, dword [eax+ebp]
        add ecx, edx
        mov esi, ecx
        shr esi, 10h
        mov eax, esi
        and ecx, 0FFFFh
        call VesaSetBank
        lea edx, [ecx+edi]
        mov eax, dword [esp]
        add eax, ecx
        test edx, 10000h
        je short .10
        mov edx, 10000h
        sub edx, ecx
.7:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .8
        xor ebx, ebx
        mov bl, byte [eax]
        inc eax
        mov bl, byte [dword ebx+RemapTable]
        mov byte [byte eax-01h], bl
        jmp short .7
.8:
        lea eax, [byte esi+01h]
        call VesaSetBank
        lea edx, [ecx+edi]
        mov eax, dword [esp]
        and edx, 0FFFFh
.9:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .12
        xor ebx, ebx
        mov bl, byte [eax]
        inc eax
        mov bl, byte [dword ebx+RemapTable]
        mov byte [byte eax-01h], bl
        jmp short .9
.10:
        mov edx, edi
.11:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .12
        xor ebx, ebx
        mov bl, byte [eax]
        inc eax
        mov bl, byte [dword ebx+RemapTable]
        mov byte [byte eax-01h], bl
        jmp short .11
.12:
        mov ebx, dword [byte esp+01Ch]
        inc ebx
        add ebp, byte 4
        mov dword [byte esp+01Ch], ebx
        jmp near .6
.13:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 00h
        push esi
        push edi
        push ebp
        mov edi, dword [byte esp+014h]
        mov ebp, dword [byte esp+010h]
        mov ebp, dword [byte ebp+00h]
        xor esi, esi
        mov edx, dword [byte ebp+040h]
        mov ecx, dword [byte ebp+044h]
        test edx, edx
        jle short .16
.14:
        mov ebx, 8
        mov edx, edi
        mov eax, ecx
        call strnicmp_
        test eax, eax
        jne short .15
        mov eax, esi
        pop ebp
        pop edi
        pop esi
        ret
.15:
        inc esi
        mov ebx, dword [byte ebp+040h]
        add ecx, byte 14h
        cmp esi, ebx
        jl short .14
.16:
        mov eax, 0FFFFFFFFh
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; OriApplyMorph                                CA288  96 PC, medium confidence
; Morphs an object's points between its key shapes
;-----------------------------------------------------------------------------
OriApplyMorph:
        push esi
        push edi
        push ebp
        mov ebp, dword [byte esp+010h]
        mov edi, dword [byte ebp+00h]
        mov ah, byte [byte ebp+010h]
        mov esi, dword [byte edi+018h]
        test ah, 10h
        jne short .1
        push str_OriinitmorphObjectCannotMorp
        call FatalError
        add esp, byte 4
.1:
        mov edx, dword [byte edi+010h]
        lea ecx, [nosplit edx*4+00h]
        sub ecx, edx
        mov edi, dword [byte ebp+070h]
        shl ecx, 2
        rep movsb
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov eax, dword [byte esp+024h]
        mov eax, dword [eax]
        mov edx, dword [byte esp+028h]
        mov dword [byte esp+010h], eax
        lea eax, [nosplit edx*4+00h]
        mov edi, dword [byte esp+010h]
        add eax, edx
        mov edi, dword [byte edi+044h]
        shl eax, 2
        add edi, eax
        mov esi, dword [byte edi+0Ch]
        mov eax, dword [byte esp+010h]
        shl esi, 2
        add esi, dword [byte eax+050h]
        mov edx, dword [byte edi+010h]
        lea eax, [nosplit edx*4+00h]
        mov ebp, dword [byte esp+010h]
        sub eax, edx
        mov ebp, dword [byte ebp+018h]
        shl eax, 2
        add ebp, eax
        mov eax, dword [byte esp+024h]
        mov dl, byte [byte eax+010h]
        mov edi, dword [byte edi+08h]
        test dl, 10h
        jne short .2
        push str_OriapplymorphObjectCannotMor
        call FatalError
        add esp, byte 4
.2:
        mov ebx, dword [byte esp+028h]
        test ebx, ebx
        jl near .5
        mov edx, dword [byte esp+010h]
        cmp ebx, dword [byte edx+040h]
        jge near .5
        mov eax, dword [byte esp+02Ch]
        test eax, eax
        je near .5
        cmp eax, 10000h
        jne short .4
.3:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je short .5
        mov edx, dword [esi]
        imul edx, byte 0Ch
        mov eax, dword [byte esp+024h]
        mov eax, dword [byte eax+070h]
        add eax, edx
        push eax
        push ebp
        push eax
        add esi, byte 4
        add ebp, byte 0Ch
        call AddVec3
        add esp, byte 0Ch
        jmp short .3
.4:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je short .5
        mov eax, dword [esi]
        imul eax, byte 0Ch
        mov dword [byte esp+0Ch], eax
        mov eax, dword [byte esp+024h]
        mov ebx, dword [byte esp+0Ch]
        mov eax, dword [byte eax+070h]
        add eax, ebx
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov ecx, dword [byte esp+034h]
        push ecx
        push ebp
        call OriScaleVector
        add esp, byte 0Ch
        push eax
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [byte esp+014h]
        mov eax, dword [byte eax+070h]
        add eax, edx
        push eax
        add esi, byte 4
        add ebp, byte 0Ch
        call AddVec3
        add esp, byte 0Ch
        jmp short .4
.5:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov esi, dword [byte esp+028h]
        mov edi, dword [byte esp+024h]
        lea eax, [nosplit esi*4+00h]
        mov edi, dword [edi]
        add eax, esi
        mov ebp, dword [byte edi+044h]
        shl eax, 2
        add ebp, eax
        mov eax, dword [byte ebp+0Ch]
        mov esi, dword [byte edi+050h]
        shl eax, 2
        add esi, eax
        mov dword [byte esp+010h], esi
        mov eax, dword [byte edi+018h]
        mov esi, dword [byte ebp+010h]
        mov dword [byte esp+0Ch], eax
        lea eax, [nosplit esi*4+00h]
        sub eax, esi
        mov esi, dword [byte esp+0Ch]
        shl eax, 2
        add esi, eax
        mov eax, dword [byte esp+024h]
        mov dl, byte [byte eax+010h]
        mov ebp, dword [byte ebp+08h]
        test dl, 10h
        jne short .6
        push str_OriapplymorphObjectCanno
        call FatalError
        add esp, byte 4
.6:
        mov edx, dword [byte esp+028h]
        test edx, edx
        jl short .5
        cmp edx, dword [byte edi+040h]
        jge short .5
        mov ecx, dword [byte esp+02Ch]
        test ecx, ecx
        jne short .8
.7:
        dec ebp
        cmp ebp, byte 0FFFFFFFFh
        je near .5
        mov edi, dword [byte esp+010h]
        mov edi, dword [edi]
        imul edi, byte 0Ch
        mov ecx, dword [byte esp+010h]
        mov eax, dword [byte esp+024h]
        mov esi, dword [byte esp+0Ch]
        add ecx, byte 4
        mov eax, dword [byte eax+070h]
        add esi, edi
        add edi, eax
        mov dword [byte esp+010h], ecx
        movsd
        movsd
        movsd
        jmp short .7
.8:
        cmp ecx, 10000h
        jne short .10
.9:
        dec ebp
        cmp ebp, byte 0FFFFFFFFh
        je near .5
        mov eax, dword [byte esp+010h]
        mov eax, dword [eax]
        imul eax, byte 0Ch
        mov edi, dword [byte esp+024h]
        mov edi, dword [byte edi+070h]
        add edi, eax
        push edi
        mov edx, dword [byte esp+014h]
        mov ebx, dword [byte esp+010h]
        push esi
        add eax, ebx
        add edx, byte 4
        push eax
        mov dword [byte esp+01Ch], edx
        add esi, byte 0Ch
        call AddVec3
        add esp, byte 0Ch
        jmp short .9
.10:
        dec ebp
        cmp ebp, byte 0FFFFFFFFh
        je near .5
        mov edi, dword [byte esp+010h]
        mov edi, dword [edi]
        imul edi, byte 0Ch
        mov eax, dword [byte esp+024h]
        mov eax, dword [byte eax+070h]
        add eax, edi
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov ebx, dword [byte esp+034h]
        mov edx, dword [byte esp+018h]
        push ebx
        add edx, byte 4
        push esi
        mov dword [byte esp+020h], edx
        call OriScaleVector
        add esp, byte 0Ch
        mov ecx, dword [byte esp+010h]
        push eax
        add edi, ecx
        push edi
        add esi, byte 0Ch
        call AddVec3
        add esp, byte 0Ch
        jmp short .10
        db 00h,00h,00h,00h
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call SinCosLookup
        mov dword [esi], 10000h
        mov dword [byte esi+04h], 0
        mov dword [byte esi+08h], 0
        add esp, byte 0Ch
        mov dword [byte esi+0Ch], 0
        mov eax, dword [byte esp+04h]
        mov dword [byte esi+010h], eax
        mov eax, dword [esp]
        mov dword [byte esi+018h], 0
        mov dword [byte esi+014h], eax
        mov eax, dword [esp]
        mov ebx, eax
        neg ebx
        mov dword [byte esi+01Ch], ebx
        mov eax, dword [byte esp+04h]
        mov dword [byte esi+020h], eax
        add esp, byte 8
        pop esi
        ret
;-----------------------------------------------------------------------------
; OriRotateY                                      CA584  96 PC, low confidence
; Rotates points around the vertical axis
;-----------------------------------------------------------------------------
OriRotateY:
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call SinCosLookup
        add esp, byte 0Ch
        mov eax, dword [byte esp+04h]
        mov dword [byte esi+04h], 0
        mov dword [esi], eax
        mov eax, dword [esp]
        mov dword [byte esi+0Ch], 0
        mov dword [byte esi+010h], 10000h
        mov dword [byte esi+014h], 0
        mov ebx, eax
        neg ebx
        mov dword [byte esi+08h], ebx
        mov eax, dword [esp]
        mov dword [byte esi+01Ch], 0
        mov dword [byte esi+018h], eax
        mov eax, dword [byte esp+04h]
        mov dword [byte esi+020h], eax
        add esp, byte 8
        pop esi
        ret
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call SinCosLookup
        add esp, byte 0Ch
        mov eax, dword [byte esp+04h]
        mov dword [esi], eax
        mov eax, dword [esp]
        mov dword [byte esi+08h], 0
        mov dword [byte esi+04h], eax
        mov eax, dword [esp]
        mov ebx, eax
        neg ebx
        mov dword [byte esi+0Ch], ebx
        mov eax, dword [byte esp+04h]
        mov dword [byte esi+014h], 0
        mov dword [byte esi+018h], 0
        mov dword [byte esi+01Ch], 0
        mov dword [byte esi+020h], 10000h
        mov dword [byte esi+010h], eax
        add esp, byte 8
        pop esi
        ret
        db 00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FixedSinCos                                     CA650  96 PC, low confidence
; Graphics library: sine and cosine of a fixed-point angle from the table
;-----------------------------------------------------------------------------
FixedSinCos:
        sub esp, byte 8
        mov eax, esp
        push eax
        lea eax, [byte esp+08h]
        push eax
        mov eax, dword [byte esp+014h]
        sar eax, 6
        push eax
        call SinCosLookup
        add esp, byte 0Ch
        mov edx, dword [byte esp+0Ch]
        and edx, byte 3Fh
        imul edx, dword 6487Eh
        mov eax, dword [esp]
        sar eax, 2
        sar edx, 9
        imul eax, edx
        mov ebx, dword [byte esp+04h]
        sar eax, 15h
        add ebx, eax
        mov eax, dword [byte esp+010h]
        mov dword [eax], ebx
        mov eax, dword [byte esp+04h]
        sar eax, 2
        imul eax, edx
        mov edx, dword [esp]
        sar eax, 15h
        sub edx, eax
        mov eax, dword [byte esp+014h]
        mov dword [eax], edx
        add esp, byte 8
        ret
