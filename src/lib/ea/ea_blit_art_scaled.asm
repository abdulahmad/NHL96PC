; EA library: BlitArtScaled, DrawArtScaled, DrawArtScaledHotspot.
bits 32
%include "hockey.inc"
section s_BB603 progbits alloc exec nowrite align=1
extern BuildSpanOffsets, CopyMappedSpan, DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, ScaledRowBuffer
extern ScreenWidth, SetBlitSource
global BlitArtScaled, DrawArtScaled, DrawArtScaledHotspot
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; BlitArtScaled                                   BB610  96 PC, low confidence
; Draws art scaled to a width and height at x, y, clipped
;-----------------------------------------------------------------------------
BlitArtScaled:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov esi, dword [byte esp+01Ch]
        mov ecx, dword [byte esp+024h]
        mov ebp, dword [byte esp+028h]
        mov eax, dword [byte esp+020h]
        mov edi, dword [byte esp+020h]
        mov edx, dword [byte esp+018h]
        mov eax, dword [byte eax+02h]
        mov edi, dword [byte edi+04h]
        sar eax, 10h
        sar edi, 10h
        mov dword [byte esp+04h], eax
        test edx, edx
        je near .13
        test esi, esi
        je near .13
        cmp ecx, dword [DrawClipRight]
        jge near .13
        cmp ebp, dword [DrawClipBottom]
        jge near .13
        test edx, edx
        jl short .1
        mov eax, edx
        jmp short .2
.1:
        mov eax, edx
        neg eax
.2:
        mov ebx, dword [DrawClipLeft]
        add eax, ecx
        cmp eax, ebx
        jle near .13
        test esi, esi
        jl short .3
        mov eax, esi
        jmp short .4
.3:
        mov eax, esi
        neg eax
.4:
        mov edx, dword [DrawClipTop]
        add eax, ebp
        cmp eax, edx
        jle near .13
        mov edx, dword [byte esp+04h]
        shl edx, 10h
        mov ebx, dword [byte esp+018h]
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        shl edi, 10h
        mov ebx, eax
        mov edx, edi
        mov eax, edi
        sar edx, 1Fh
        idiv esi
        mov edx, eax
        sar edx, 1Fh
        mov dword [esp], eax
        LD sub, eax, edx
        sar eax, 1
        test esi, esi
        jge short .5
        neg esi
        add edi, eax
        jmp short .6
.5:
        mov edi, eax
.6:
        mov edx, ebx
        mov eax, ebx
        sar edx, 1Fh
        LD sub, eax, edx
        sar eax, 1
        mov edx, dword [byte esp+018h]
        test edx, edx
        jge short .7
        neg edx
        mov dword [byte esp+018h], edx
        mov edx, dword [byte esp+04h]
        shl edx, 10h
        add eax, edx
.7:
        mov edx, dword [DrawClipTop]
        cmp ebp, edx
        jge short .8
        sub edx, ebp
        mov ebp, edx
        mov edx, dword [esp]
        imul edx, ebp
        sub esi, ebp
        mov ebp, dword [DrawClipTop]
        add edi, edx
.8:
        lea edx, [esi+ebp]
        cmp edx, dword [DrawClipBottom]
        jle short .9
        mov esi, dword [DrawClipBottom]
        sub esi, ebp
.9:
        mov edx, dword [DrawClipLeft]
        cmp ecx, edx
        jge short .10
        sub edx, ecx
        mov ecx, edx
        mov edx, ebx
        imul edx, ecx
        add eax, edx
        mov edx, dword [byte esp+018h]
        sub edx, ecx
        mov ecx, dword [DrawClipLeft]
        mov dword [byte esp+018h], edx
.10:
        mov edx, dword [byte esp+018h]
        add edx, ecx
        cmp edx, dword [DrawClipRight]
        jle short .11
        mov edx, dword [DrawClipRight]
        sub edx, ecx
        mov dword [byte esp+018h], edx
.11:
        mov edx, dword [DrawDestBuffer]
        shl ebp, 2
        add ebp, edx
        mov ebp, dword [byte ebp+00h]
        add ebp, ecx
        test ebx, ebx
        mov ecx, dword [byte esp+018h]
        push ecx
        mov edx, dword [byte esp+08h]
        push edx
        push byte 0
        push ebx
        push byte 0
        push eax
        push ScaledRowBuffer
        call BuildSpanOffsets
        add esp, byte 1Ch
        mov eax, dword [byte esp+020h]
        push ScaledRowBuffer
        add eax, byte 10h
        push eax
        call SetBlitSource
        add esp, byte 8
.12:
        dec esi
        cmp esi, byte 0FFFFFFFFh
        je short .13
        mov eax, edi
        mov ebx, dword [byte esp+04h]
        sar eax, 10h
        imul eax, ebx
        mov ecx, dword [byte esp+018h]
        push ecx
        push eax
        push ebp
        call CopyMappedSpan
        add esp, byte 0Ch
        mov eax, dword [ScreenWidth]
        mov edx, dword [esp]
        add ebp, eax
        add edi, edx
        jmp short .12
.13:
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        mov ecx, dword [byte esp+014h]
        mov edx, dword [byte esp+0Ch]
        mov edi, dword [byte ecx+02h]
        shl edx, 10h
        sar edi, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv edi
        mov ebx, dword [byte ecx+04h]
        mov edx, dword [byte esp+010h]
        sar ebx, 10h
        shl edx, 10h
        mov esi, eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ebx, eax
        test esi, esi
        jl short .14
        mov edx, dword [byte ecx+06h]
        mov eax, esi
        sar edx, 10h
        mov esi, dword [byte esp+018h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sub esi, eax
        jmp short .15
.14:
        mov edx, dword [byte ecx+06h]
        sar edx, 10h
        sub edi, edx
        mov eax, esi
        mov edx, edi
        mov esi, dword [byte esp+018h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add esi, eax
.15:
        test ebx, ebx
        jl short .16
        mov edx, dword [byte ecx+08h]
        mov eax, ebx
        sar edx, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte esp+01Ch]
        sub edx, eax
        mov eax, edx
        jmp short .17
.16:
        mov edx, dword [byte ecx+04h]
        mov eax, dword [byte ecx+08h]
        sar edx, 10h
        sar eax, 10h
        sub edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add eax, dword [byte esp+01Ch]
.17:
        push eax
        push esi
        push ecx
        mov ebx, dword [byte esp+01Ch]
        push ebx
        mov ecx, dword [byte esp+01Ch]
        push ecx
        call BlitArtScaled
        add esp, byte 14h
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        mov edx, dword [byte esp+0Ch]
        mov eax, dword [byte edx+0Ch]
        sar eax, 10h
        push eax
        mov eax, dword [byte edx+0Ah]
        sar eax, 10h
        push eax
        push edx
        mov edx, dword [byte esp+014h]
        push edx
        mov ebx, dword [byte esp+014h]
        push ebx
        call BlitArtScaled
        add esp, byte 14h
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawArtScaled                                   BB8E0  96 PC, low confidence
; Draws art scaled by a factor at x, y
;-----------------------------------------------------------------------------
DrawArtScaled:
        push esi
        mov eax, dword [byte esp+08h]
        mov ecx, dword [byte esp+0Ch]
        test eax, eax
        jl short .1
        mov edx, eax
        jmp short .2
.1:
        mov edx, eax
        neg edx
.2:
        mov ebx, dword [byte ecx+02h]
        sar ebx, 10h
        imul ebx, eax
        mov eax, dword [byte ecx+04h]
        sar eax, 10h
        imul eax, edx
        mov edx, dword [byte esp+014h]
        push edx
        mov esi, dword [byte esp+014h]
        push esi
        push ecx
        sar eax, 10h
        push eax
        sar ebx, 10h
        push ebx
        call BlitArtScaled
        add esp, byte 14h
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawArtScaledHotspot                            BB924  96 PC, low confidence
; Draws art scaled by a factor around its hotspot
;-----------------------------------------------------------------------------
DrawArtScaledHotspot:
        push esi
        push edi
        push ebp
        mov eax, dword [byte esp+010h]
        mov ebx, dword [byte esp+014h]
        test eax, eax
        jl short .1
        mov edx, eax
        jmp short .2
.1:
        mov edx, eax
        neg edx
.2:
        mov ecx, dword [byte ebx+02h]
        mov edi, eax
        sar ecx, 10h
        imul edi, ecx
        mov ebp, dword [byte ebx+04h]
        sar ebp, 10h
        imul ebp, edx
        mov esi, edx
        sar edi, 10h
        sar ebp, 10h
        test eax, eax
        jl short .3
        mov edx, dword [byte ebx+06h]
        sar edx, 10h
        mov ecx, dword [byte esp+018h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sub ecx, eax
        jmp short .4
.3:
        mov edx, dword [byte ebx+06h]
        sar edx, 10h
        sub ecx, edx
        mov edx, ecx
        mov ecx, dword [byte esp+018h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
.4:
        mov edx, dword [byte ebx+08h]
        mov eax, esi
        sar edx, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte esp+01Ch]
        sub edx, eax
        push edx
        push ecx
        push ebx
        push ebp
        push edi
        call BlitArtScaled
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
