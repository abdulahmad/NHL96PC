; EA library: SetClipRect, PlotPixel, PutPixel, PlotPixelClipped, BlitShapeClipped.
bits 32
%include "hockey.inc"
section s_DE084 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawRowBytes, DrawVideoBase, KeyedDraw
extern ScreenRowTable, VesaBankShift, VesaSetBank
global SetClipRect, PlotPixel, PlotPixel_8, PutPixel, PlotPixelClipped, PlotPixelClipped_C, BlitShapeClipped, BlitShapeClipped_3A
;-----------------------------------------------------------------------------
; SetClipRect                                  DE084  96 PC, medium confidence
; Sets a bitmap's clip rectangle (left, top, right, bottom), and the current
; clip when it is the draw target
;-----------------------------------------------------------------------------
SetClipRect:
        push ebp
        LD mov, ebp, esp
        push esi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte esi+02Ch]
        cmp dword [DrawVideoBase], eax
        je short .1
        mov eax, dword [byte ebp+0Ch]
        mov edx, dword [byte ebp+010h]
        mov ecx, dword [byte ebp+014h]
        mov ebx, dword [byte ebp+018h]
        mov dword [byte esi+08h], eax
        mov dword [byte esi+010h], edx
        mov dword [byte esi+0Ch], ecx
        mov dword [byte esi+014h], ebx
        pop esi
        leave
        ret
.1:
        mov eax, dword [byte ebp+0Ch]
        mov edx, dword [byte ebp+010h]
        mov ecx, dword [byte ebp+014h]
        mov ebx, dword [byte ebp+018h]
        mov dword [byte esi+08h], eax
        mov dword [byte esi+010h], edx
        mov dword [byte esi+0Ch], ecx
        mov dword [byte esi+014h], ebx
        db 0A3h                                 ; insn: mov [DrawClipLeft],eax
        dd DrawClipLeft
        db 089h,015h                            ; insn: mov [DrawClipRight],edx
        dd DrawClipRight
        mov dword [DrawClipTop], ecx
        mov dword [DrawClipBottom], ebx
        pop esi
        leave
        ret
        db 00h
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        cmp eax, dword [DrawClipLeft]
        jl short .2
        cmp eax, dword [DrawClipRight]
        jge short .2
        cmp edx, dword [DrawClipTop]
        jl short .2
        cmp edx, dword [DrawClipBottom]
        jl short PlotPixel_8
.2:
        ret
;-----------------------------------------------------------------------------
; PlotPixel                                    DE10D  95 PC, medium confidence
; Graphics library: plots a pixel, clipped to the window
;-----------------------------------------------------------------------------
PlotPixel:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
PlotPixel_8:
        cmp dword [KeyedDraw], byte 0
        jne short .2
        mov ecx, dword [DrawDestBuffer]
        add eax, dword [ecx+edx*4]
        add eax, dword [DrawVideoBase]
        movzx eax, byte [eax]
        ret
.1:
        call VesaSetBank
        movzx eax, byte [edx]
        ret
.2:
        add eax, dword [nosplit edx*4+ScreenRowTable]
        movzx edx, ax
        add edx, dword [DrawVideoBase]
        shr eax, 10h
        cmp al, byte [VesaBankShift]
        jne short .1
        movzx eax, byte [edx]
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; PutPixel                                        DE15C  96 PC, low confidence
; Plots a pixel of a colour at x, y when it is inside the clip rectangle
;-----------------------------------------------------------------------------
PutPixel:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
        cmp eax, dword [DrawClipLeft]
        jl short .1
        cmp eax, dword [DrawClipRight]
        jge short .1
        cmp edx, dword [DrawClipTop]
        jl short .1
        cmp edx, dword [DrawClipBottom]
        jl short PlotPixelClipped_C
.1:
        ret
        db 02Eh,08Bh,0C0h
;-----------------------------------------------------------------------------
; PlotPixelClipped                                DE18C  96 PC, low confidence
; Plots one pixel when it lies inside the clip window
;-----------------------------------------------------------------------------
PlotPixelClipped:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
PlotPixelClipped_C:
        cmp dword [KeyedDraw], byte 0
        jne short .2
        mov ecx, dword [DrawDestBuffer]
        add eax, dword [ecx+edx*4]
        add eax, dword [DrawVideoBase]
        mov byte [eax], bl
        ret
        db 090h
.1:
        call VesaSetBank
        mov byte [edx], bl
        ret
.2:
        add eax, dword [nosplit edx*4+ScreenRowTable]
        movzx edx, ax
        add edx, dword [DrawVideoBase]
        shr eax, 10h
        cmp al, byte [VesaBankShift]
        jne short .1
        mov byte [edx], bl
        ret
        cmp dword [KeyedDraw], byte 0
        jne short .4
        push ecx
        mov ecx, dword [DrawDestBuffer]
        add eax, dword [ecx+edx*4]
        add eax, dword [DrawVideoBase]
        mov byte [eax], bl
        pop ecx
        ret
        db 090h
.3:
        call VesaSetBank
        mov byte [edx], bl
        ret
.4:
        add eax, dword [nosplit edx*4+ScreenRowTable]
        movzx edx, ax
        add edx, dword [DrawVideoBase]
        shr eax, 10h
        cmp al, byte [VesaBankShift]
        jne short .3
        mov byte [edx], bl
        ret
        db 00h,00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push edi
        push esi
        mov edi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte edi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte edi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitShapeClipped_3A
;-----------------------------------------------------------------------------
; BlitShapeClipped                                DE247  96 PC, low confidence
; Stores a shape's position and copies it to the draw target, clipped
; (opaque)
;-----------------------------------------------------------------------------
BlitShapeClipped:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push edi
        push esi
        mov edi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov word [byte edi+0Ch], ax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        mov word [byte edi+0Eh], ax
        jmp short BlitShapeClipped_3A
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push edi
        push esi
        mov edi, dword [byte ebp+08h]
        movsx eax, word [byte edi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [byte ebp-08h], eax
BlitShapeClipped_3A:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte edi+06h]
        lea edx, [byte edi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop esi
        pop edi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte edi+04h]
        imul edx
        mov edx, dword [byte ebp-010h]
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
        movsx ecx, word [byte edi+04h]
        LD xor, edx, edx
        mov ebx, dword [byte ebp-04h]
        LD mov, eax, ebx
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
        LD mov, edi, ecx
        LD sub, edi, eax
        add dword [byte ebp-018h], edi
        mov edi, dword [DrawClipRight]
        LD sub, edi, ebx
        jle short .1
        LD cmp, eax, edi
        jl short .5
        LD mov, eax, edi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .10
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        mov esi, dword [ebx]
        add esi, dword [DrawVideoBase]
        add esi, dword [byte ebp-04h]
        mov edi, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        mov ebx, dword [DrawRowBytes]
        sub ebx, dword [byte ebp-0Ch]
        cmp dword [byte ebp-010h], byte 0
        je short .11
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        jae short .9
        je short .8
.7:
        LD mov, ecx, eax
        rep movsw
        movsb
        add edi, dword [byte ebp-010h]
        LD add, esi, ebx
        dec edx
        jg short .7
        jmp short .10
.8:
        movsb
        add edi, dword [byte ebp-010h]
        LD add, esi, ebx
        dec edx
        jg short .8
        jmp short .10
.9:
        LD mov, ecx, eax
        rep movsw
        add edi, dword [byte ebp-010h]
        LD add, esi, ebx
        dec edx
        jg short .9
.10:
        jmp near .1
.11:
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        mov dword [byte ebp-01Ch], eax
        jae short .13
        je short .14
.12:
        mov ecx, dword [byte ebp-01Ch]
        rep movsw
        movsb
        LD add, esi, ebx
        dec edx
        jg short .12
        jmp near .1
.13:
        mov ecx, dword [byte ebp-01Ch]
        rep movsw
        LD add, esi, ebx
        dec edx
        jg short .13
        jmp near .1
.14:
        movsb
        LD add, esi, ebx
        inc ebx
        dec edx
        jg short .14
        jmp near .1
        mov eax, dword [byte esp+04h]
