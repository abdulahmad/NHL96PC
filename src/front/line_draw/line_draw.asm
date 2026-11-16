; The 3D view's line drawer: the anti-alias colour table, clipping, fixed-point lines (96 PC).
bits 32
%include "hockey.inc"
section s_873AE progbits alloc exec nowrite align=1
extern LinePattern, ScreenWidth, DrawClipLeft, DrawClipTop, DrawClipRight, DrawClipBottom, DrawDestBuffer, DrawVideoBase
extern LineClipRight, LineClipBottom, LineSteep, LineClipTop, LineClipLeft, LineErrX, LineErrStepY, LineErrStepX
extern LineDeltaX, LineDeltaY, LineX, LineSpanRight, LineSpanBottom, LineSpanTop, LineSpanLeft, LineStepY
extern LineErrY, LineColor, LineEndX, LineEndY, LineUserClipBottom, LineUserClipTop, PlotPixel, SetClipWindow
extern str_AALIAS, AllocMemBlock, FillRectClipped, NearestColour, FixedLerp, PlotPixelClipped
global BuildAntiAliasTable, ClipLineY, ClipLineX, DrawLineYPlot, DrawLineYPlot_186, DrawLineYPlot_187, DrawLineY, DrawLineXPlot
global DrawLineX, DrawFixedLine, DrawFixedLineClip
;-----------------------------------------------------------------------------
; BuildAntiAliasTable                          873AE  96 PC, medium confidence
; The AALIAS table (1004h bytes) of blended colours for the 3D view's lines
;-----------------------------------------------------------------------------
BuildAntiAliasTable:
        push esi
        push edi
        enter 18h, 0
        push eax
        push edx
        push ebx
        push ecx
        push dword [byte ebp+010h]
        push dword 1004h
        push str_AALIAS
        mov edi, dword [byte ebp-01Ch]
        call AllocMemBlock
        mov esi, eax
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-020h]
        shl edi, 10h
        shl eax, 8
        or eax, edi
        add esp, byte 0Ch
        or eax, dword [byte ebp-024h]
        push eax
        call NearestColour
        mov byte [esi], al
        inc esi
        mov al, byte [byte ebp-01Ch]
        mov byte [esi], al
        inc esi
        mov al, byte [byte ebp-020h]
        mov byte [esi], al
        inc esi
        mov al, byte [byte ebp-024h]
        mov dword [byte ebp-010h], 10000h
        mov byte [esi], al
        mov eax, dword [byte ebp-028h]
        add esp, byte 4
        add eax, 300h
        inc esi
        mov dword [byte ebp-08h], eax
.1:
        mov eax, dword [byte ebp-010h]
        cdq
        shl edx, 4
        LD sbb, eax, edx
        sar eax, 4
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-08h]
        mov edi, dword [byte ebp-028h]
        mov dword [byte ebp-04h], eax
.2:
        push dword [byte ebp-018h]
        movzx eax, byte [edi]
        push dword [byte ebp-01Ch]
        shl eax, 2
        push eax
        call FixedLerp
        add esp, byte 0Ch
        shl eax, 10h
        push dword [byte ebp-018h]
        mov dword [byte ebp-014h], eax
        movzx eax, byte [byte edi+01h]
        push dword [byte ebp-020h]
        shl eax, 2
        push eax
        call FixedLerp
        mov edx, dword [byte ebp-014h]
        add esp, byte 0Ch
        shl eax, 8
        push dword [byte ebp-018h]
        or edx, eax
        movzx eax, byte [byte edi+02h]
        push dword [byte ebp-024h]
        shl eax, 2
        push eax
        mov dword [byte ebp-014h], edx
        call FixedLerp
        add esp, byte 0Ch
        or eax, dword [byte ebp-014h]
        push eax
        add edi, byte 3
        call NearestColour
        add esp, byte 4
        mov byte [esi], al
        inc esi
        cmp edi, dword [byte ebp-04h]
        jne short .2
        inc word [byte ebp-0Eh]
        cmp dword [byte ebp-010h], 110000h
        jne near .1
        mov eax, dword [byte ebp-0Ch]
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; ClipLineY                                       874AE  96 PC, low confidence
; Clips the current line to the view's top and bottom (LineClipBottom / 17DC24)
;-----------------------------------------------------------------------------
ClipLineY:
        push ebx
        push ecx
        push edx
        mov eax, dword [LineEndY]
        cmp eax, dword [LineClipTop]
        jge short .2
.1:
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov eax, dword [LineStepY]
        cmp eax, dword [LineClipBottom]
        jge short .1
        cmp eax, dword [LineClipTop]
        jge short .3
        mov ebx, dword [LineClipTop]
        sub ebx, eax
        mov eax, dword [LineErrY]
        mov edx, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, ebx
        add dword [LineSpanLeft], eax
        mov eax, dword [LineErrStepY]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [LineSpanRight], eax
        mov eax, dword [LineClipTop]
        mov dword [LineStepY], eax
.3:
        mov eax, dword [LineEndY]
        cmp eax, dword [LineClipBottom]
        jle short .4
        mov eax, dword [LineClipBottom]
        mov dword [LineEndY], eax
.4:
        mov eax, dword [LineSpanLeft]
        cmp eax, dword [LineClipLeft]
        jl short .5
        mov eax, dword [LineSpanRight]
        cmp eax, dword [LineClipRight]
        jl short .6
.5:
        mov eax, 1
        jmp short .7
.6:
        xor eax, eax
.7:
        mov dword [LineSteep], eax
        mov eax, dword [LineSpanRight]
        cmp eax, dword [LineClipLeft]
        jge near .8
        cmp dword [LineErrStepY], byte 0
        jle near .1
        mov eax, dword [LineClipLeft]
        mov ebx, dword [LineErrStepY]
        sub eax, dword [LineSpanRight]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [LineStepY], eax
        mov ebx, dword [LineStepY]
        cmp ebx, dword [LineClipBottom]
        jge near .1
        cmp ebx, dword [LineClipTop]
        jl near .1
        mov ebx, dword [LineClipLeft]
        mov dword [LineSpanRight], ebx
        mov ebx, dword [LineErrY]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [LineSteep], 1
        add dword [LineSpanLeft], eax
.8:
        mov eax, dword [LineSpanLeft]
        cmp eax, dword [LineClipRight]
        jl near .9
        cmp dword [LineErrY], byte 0
        jge near .1
        mov eax, dword [LineClipRight]
        sub eax, dword [LineSpanLeft]
        mov ebx, dword [LineErrY]
        inc eax
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [LineStepY], eax
        mov ebx, dword [LineStepY]
        cmp ebx, dword [LineClipBottom]
        jge near .1
        cmp ebx, dword [LineClipTop]
        jl near .1
        mov ebx, dword [LineErrStepY]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [LineSpanRight], eax
        mov eax, dword [LineClipRight]
        dec eax
        mov dword [LineSteep], 1
        mov dword [LineSpanLeft], eax
.9:
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ClipLineX                                       876A1  96 PC, low confidence
; Clips the current line to the view's left and right (LineClipRight / 17DC28)
;-----------------------------------------------------------------------------
ClipLineX:
        push ebx
        push ecx
        push edx
        mov eax, dword [LineEndX]
        cmp eax, dword [LineClipLeft]
        jge short .2
.1:
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov eax, dword [LineX]
        cmp eax, dword [LineClipRight]
        jge short .1
        cmp eax, dword [LineClipLeft]
        jge short .3
        mov ebx, dword [LineClipLeft]
        sub ebx, eax
        mov eax, dword [LineErrStepX]
        mov edx, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, ebx
        add dword [LineSpanTop], eax
        mov eax, dword [LineErrX]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [LineSpanBottom], eax
        mov eax, dword [LineClipLeft]
        mov dword [LineX], eax
.3:
        mov eax, dword [LineEndX]
        cmp eax, dword [LineClipRight]
        jle short .4
        mov eax, dword [LineClipRight]
        mov dword [LineEndX], eax
.4:
        mov eax, dword [LineSpanTop]
        cmp eax, dword [LineClipTop]
        jl short .5
        mov eax, dword [LineSpanBottom]
        cmp eax, dword [LineClipBottom]
        jl short .6
.5:
        mov eax, 1
        jmp short .7
.6:
        xor eax, eax
.7:
        mov dword [LineSteep], eax
        mov eax, dword [LineSpanBottom]
        cmp eax, dword [LineClipTop]
        jge near .8
        cmp dword [LineErrX], byte 0
        jle near .1
        mov eax, dword [LineClipTop]
        mov ebx, dword [LineErrX]
        sub eax, dword [LineSpanBottom]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [LineX], eax
        mov ebx, dword [LineX]
        cmp ebx, dword [LineClipRight]
        jge near .1
        cmp ebx, dword [LineClipLeft]
        jl near .1
        mov ebx, dword [LineClipTop]
        mov dword [LineSpanBottom], ebx
        mov ebx, dword [LineErrStepX]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [LineSteep], 1
        add dword [LineSpanTop], eax
.8:
        mov eax, dword [LineSpanTop]
        cmp eax, dword [LineClipBottom]
        jl near .9
        cmp dword [LineErrStepX], byte 0
        jge near .1
        mov eax, dword [LineClipBottom]
        sub eax, dword [LineSpanTop]
        mov ebx, dword [LineErrStepX]
        inc eax
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [LineX], eax
        mov ebx, dword [LineX]
        cmp ebx, dword [LineClipRight]
        jge near .1
        cmp ebx, dword [LineClipLeft]
        jl near .1
        mov ebx, dword [LineErrX]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [LineSpanBottom], eax
        mov eax, dword [LineClipBottom]
        dec eax
        mov dword [LineSteep], 1
        mov dword [LineSpanTop], eax
.9:
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawLineYPlot                                   87894  96 PC, low confidence
; Draws a mostly vertical line pixel by pixel (PlotPixel)
;-----------------------------------------------------------------------------
DrawLineYPlot:
        push esi
        push edi
        enter 0Ch, 0
        mov eax, dword [LineStepY]
        sar eax, 10h
        mov dword [byte ebp-04h], eax
.1:
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge near DrawLineYPlot_186
        mov edi, dword [LineSpanRight]
        mov esi, dword [LineSpanLeft]
        movsx eax, word [DrawClipLeft]
        sar esi, 10h
        sar edi, 10h
        cmp esi, eax
        jl short .2
        movsx eax, word [DrawClipRight]
        cmp edi, eax
        jl near DrawLineYPlot_186
.2:
        movsx eax, word [DrawClipLeft]
        cmp esi, eax
        jge short .3
        cmp edi, eax
        jl near DrawLineYPlot_186
.3:
        movsx eax, word [DrawClipRight]
        cmp esi, eax
        jl short .4
        cmp edi, eax
        jge near DrawLineYPlot_186
.4:
        mov eax, dword [LineSpanLeft]
        mov edx, 10000h
        and eax, 0FFFFh
        sub edx, eax
        mov eax, edx
        sar eax, 0Ch
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [LineSpanRight]
        and eax, 0FFFFh
        sar eax, 0Ch
        mov dword [byte ebp-08h], eax
        cmp edi, esi
        jne short .5
        add eax, dword [byte ebp-0Ch]
        sub eax, byte 10h
        mov dword [byte ebp-08h], eax
        test eax, eax
        jle near .9
        push dword [byte ebp-04h]
        push esi
        mov esi, dword [byte ebp-08h]
        jmp near .8
.5:
        cmp dword [byte ebp-0Ch], byte 0
        je short .6
        movsx eax, word [DrawClipLeft]
        cmp esi, eax
        jle short .6
        push dword [byte ebp-04h]
        push esi
        call PlotPixel
        mov edx, dword [byte ebp-0Ch]
        shl edx, 8
        add eax, edx
        mov edx, dword [LineColor]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push dword [byte ebp-04h]
        push esi
        call PlotPixelClipped
        add esp, byte 0Ch
.6:
        inc esi
        cmp esi, edi
        jge short .7
        movsx eax, byte [LinePattern]
        push eax
        mov eax, edi
        push byte 1
        sub eax, esi
        push eax
        push dword [byte ebp-04h]
        push esi
        call FillRectClipped
        add esp, byte 14h
.7:
        cmp dword [byte ebp-08h], byte 0
        je short .9
        movsx eax, word [DrawClipRight]
        cmp edi, eax
        jge short .9
        push dword [byte ebp-04h]
        mov esi, dword [byte ebp-08h]
        push edi
.8:
        shl esi, 8
        call PlotPixel
        add esi, eax
        mov eax, dword [LineColor]
        add esp, byte 8
        movsx eax, byte [dword esi+eax-0100h]
        push eax
        push dword [byte ebp-04h]
        push edi
        call PlotPixelClipped
        add esp, byte 0Ch
.9:
        mov eax, dword [LineErrY]
        add dword [LineSpanLeft], eax
        mov eax, dword [LineErrStepY]
        add dword [LineSpanRight], eax
        mov eax, dword [LineDeltaY]
        inc dword [byte ebp-04h]
        add dword [LineStepY], eax
        jmp near .1
DrawLineYPlot_186:
        leave
DrawLineYPlot_187:
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawLineY                                       87A1E  96 PC, low confidence
; Draws a mostly vertical line straight into the bitmap
;-----------------------------------------------------------------------------
DrawLineY:
        push esi
        push edi
        enter 8, 0
        mov eax, dword [LineStepY]
        sar eax, 10h
        mov edi, eax
        mov dword [byte ebp-04h], eax
        shl edi, 2
.1:
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge short DrawLineYPlot_186
        mov eax, dword [LineSpanRight]
        cmp eax, dword [LineClipRight]
        jge short DrawLineYPlot_186
        mov edx, eax
        and edx, 0FFFFh
        mov eax, dword [LineSpanLeft]
        sar edx, 0Ch
        cmp eax, dword [LineClipLeft]
        jl short DrawLineYPlot_186
        mov ebx, dword [LineSpanRight]
        sar eax, 10h
        sar ebx, 10h
        mov dword [byte ebp-08h], eax
        sub ebx, eax
        mov eax, dword [LineSpanLeft]
        mov esi, 10000h
        and eax, 0FFFFh
        mov ecx, dword [DrawVideoBase]
        sub esi, eax
        mov eax, dword [DrawDestBuffer]
        add ecx, dword [edi+eax]
        mov eax, ecx
        sar esi, 0Ch
        add eax, dword [byte ebp-08h]
        test ebx, ebx
        jg short .2
        lea ebx, [byte edx+esi-010h]
        movzx edx, byte [eax]
        shl ebx, 8
        jmp short .6
.2:
        test esi, esi
        je short .4
        movzx ecx, byte [eax]
        shl esi, 8
        add ecx, esi
        mov esi, dword [LineColor]
        add esi, ecx
        mov cl, byte [dword esi-0100h]
.3:
        mov byte [eax], cl
.4:
        inc eax
        dec ebx
        je short .5
        mov cl, byte [LinePattern]
        jmp short .3
.5:
        test edx, edx
        je short .7
        shl edx, 8
        movzx ebx, byte [eax]
.6:
        add edx, ebx
        mov ebx, dword [LineColor]
        mov dl, byte [dword edx+ebx-0100h]
        mov byte [eax], dl
.7:
        mov eax, dword [LineErrY]
        add dword [LineSpanLeft], eax
        mov eax, dword [LineErrStepY]
        inc dword [byte ebp-04h]
        add dword [LineSpanRight], eax
        mov eax, dword [LineDeltaY]
        add edi, byte 4
        add dword [LineStepY], eax
        jmp near .1
;-----------------------------------------------------------------------------
; DrawLineXPlot                                   87B1D  96 PC, low confidence
; Draws a mostly horizontal line pixel by pixel (PlotPixel)
;-----------------------------------------------------------------------------
DrawLineXPlot:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, dword [LineX]
        sar edi, 10h
.1:
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge near DrawLineYPlot_186
        mov eax, dword [LineSpanBottom]
        mov esi, dword [LineSpanTop]
        sar eax, 10h
        sar esi, 10h
        mov dword [byte ebp-04h], eax
        movsx eax, word [DrawClipTop]
        cmp esi, eax
        jl short .2
        movsx eax, word [DrawClipBottom]
        cmp eax, dword [byte ebp-04h]
        jg near DrawLineYPlot_186
.2:
        movsx eax, word [DrawClipTop]
        cmp esi, eax
        jge short .3
        cmp eax, dword [byte ebp-04h]
        jg near DrawLineYPlot_186
.3:
        movsx eax, word [DrawClipBottom]
        cmp esi, eax
        jl short .4
        cmp eax, dword [byte ebp-04h]
        jle near DrawLineYPlot_186
.4:
        mov eax, dword [LineSpanTop]
        mov edx, 10000h
        and eax, 0FFFFh
        sub edx, eax
        mov eax, edx
        sar eax, 0Ch
        mov dword [byte ebp-08h], eax
        mov eax, dword [LineSpanBottom]
        and eax, 0FFFFh
        sar eax, 0Ch
        mov dword [byte ebp-0Ch], eax
        cmp esi, dword [byte ebp-04h]
        jne short .5
        mov eax, dword [byte ebp-08h]
        add eax, dword [byte ebp-0Ch]
        sub eax, byte 10h
        mov dword [byte ebp-08h], eax
        test eax, eax
        jle near .9
        push esi
        push edi
        call PlotPixel
        mov edx, dword [byte ebp-08h]
        shl edx, 8
        add edx, eax
        mov eax, dword [LineColor]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push esi
        jmp near .8
.5:
        cmp dword [byte ebp-08h], byte 0
        je short .6
        movsx eax, word [DrawClipTop]
        cmp esi, eax
        jle short .6
        push esi
        push edi
        call PlotPixel
        mov edx, dword [byte ebp-08h]
        shl edx, 8
        add eax, edx
        mov edx, dword [LineColor]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push esi
        push edi
        call PlotPixelClipped
        add esp, byte 0Ch
.6:
        inc esi
        cmp esi, dword [byte ebp-04h]
        jge short .7
        movsx eax, byte [LinePattern]
        push eax
        mov eax, dword [byte ebp-04h]
        sub eax, esi
        push eax
        push byte 1
        push esi
        push edi
        call FillRectClipped
        add esp, byte 14h
.7:
        cmp dword [byte ebp-0Ch], byte 0
        je short .9
        movsx eax, word [DrawClipBottom]
        cmp eax, dword [byte ebp-04h]
        jle short .9
        push dword [byte ebp-04h]
        push edi
        call PlotPixel
        mov edx, dword [byte ebp-0Ch]
        shl edx, 8
        add edx, eax
        mov eax, dword [LineColor]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push dword [byte ebp-04h]
.8:
        push edi
        call PlotPixelClipped
        add esp, byte 0Ch
.9:
        mov eax, dword [LineErrStepX]
        add dword [LineSpanTop], eax
        mov eax, dword [LineErrX]
        add dword [LineSpanBottom], eax
        mov eax, dword [LineDeltaX]
        inc edi
        add dword [LineX], eax
        jmp near .1
;-----------------------------------------------------------------------------
; DrawLineX                                       87CBF  96 PC, low confidence
; Draws a mostly horizontal line straight into the bitmap
;-----------------------------------------------------------------------------
DrawLineX:
        push esi
        push edi
        mov edi, dword [LineX]
        sar edi, 10h
.1:
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge near DrawLineYPlot_187
        mov eax, dword [LineSpanBottom]
        cmp eax, dword [LineClipBottom]
        jge near DrawLineYPlot_187
        mov eax, dword [LineSpanTop]
        cmp eax, dword [LineClipTop]
        jl near DrawLineYPlot_187
        mov ecx, 10000h
        mov esi, dword [LineSpanBottom]
        mov ebx, dword [LineSpanBottom]
        mov edx, dword [LineSpanTop]
        sar eax, 10h
        and esi, 0FFFFh
        and edx, 0FFFFh
        sar ebx, 10h
        sub ecx, edx
        sub ebx, eax
        mov edx, ecx
        mov ecx, dword [DrawDestBuffer]
        shl eax, 2
        add eax, ecx
        mov ecx, dword [DrawVideoBase]
        sar esi, 0Ch
        add ecx, dword [eax]
        sar edx, 0Ch
        lea eax, [ecx+edi]
        test ebx, ebx
        jg short .2
        add edx, esi
        sub edx, byte 10h
        test edx, edx
        jle short .7
        mov ebx, edx
        shl ebx, 8
        movzx edx, byte [eax]
        add ebx, edx
        mov edx, dword [LineColor]
        jmp short .6
.2:
        test edx, edx
        je short .4
        movzx ecx, byte [eax]
        shl edx, 8
        add ecx, edx
        mov edx, dword [LineColor]
        add edx, ecx
        mov dl, byte [dword edx-0100h]
.3:
        mov byte [eax], dl
.4:
        add eax, dword [ScreenWidth]
        dec ebx
        je short .5
        mov dl, byte [LinePattern]
        jmp short .3
.5:
        test esi, esi
        je short .7
        shl esi, 8
        movzx edx, byte [eax]
        mov ebx, dword [LineColor]
        add edx, esi
.6:
        mov dl, byte [dword edx+ebx-0100h]
        mov byte [eax], dl
.7:
        mov eax, dword [LineErrStepX]
        add dword [LineSpanTop], eax
        mov eax, dword [LineErrX]
        add dword [LineSpanBottom], eax
        mov eax, dword [LineDeltaX]
        inc edi
        add dword [LineX], eax
        jmp near .1
;-----------------------------------------------------------------------------
; DrawFixedLine                                87DD6  96 PC, medium confidence
; (x0, y0, x1, y1 in 16.16, colour): a line of the 3D rink model (rink_model
; calls)
;-----------------------------------------------------------------------------
DrawFixedLine:
        push esi
        push edi
        push ebp
        mov ebp, esp
        mov edi, dword [byte ebp+018h]
        mov esi, dword [byte ebp+01Ch]
        mov edx, dword [byte ebp+020h]
        cmp dword [byte ebp+024h], byte 0
        jl near .17
        cmp dword [byte ebp+028h], byte 0
        jl near .17
        mov eax, edi
        sub eax, dword [byte ebp+010h]
        mov dword [LineDeltaX], eax
        mov eax, esi
        sub eax, dword [byte ebp+014h]
        mov dword [LineDeltaY], eax
        cmp dword [LineDeltaX], byte 0
        jl short .1
        mov eax, dword [LineDeltaX]
        jmp short .2
.1:
        mov eax, dword [LineDeltaX]
        neg eax
.2:
        cmp eax, 10000h
        jge short .5
        cmp dword [LineDeltaY], byte 0
        jl short .3
        mov eax, dword [LineDeltaY]
        jmp short .4
.3:
        mov eax, dword [LineDeltaY]
        neg eax
.4:
        cmp eax, 10000h
        jl near .17
.5:
        mov al, byte [edx]
        add edx, byte 4
        mov byte [LinePattern], al
        mov dword [LineColor], edx
        cmp dword [LineDeltaY], byte 0
        jl short .6
        mov ecx, dword [LineDeltaY]
        jmp short .7
.6:
        mov ecx, dword [LineDeltaY]
        neg ecx
.7:
        cmp dword [LineDeltaX], byte 0
        jl short .8
        mov edx, dword [LineDeltaX]
        jmp short .9
.8:
        mov edx, dword [LineDeltaX]
        neg edx
.9:
        mov eax, dword [byte ebp+028h]
        mov ebx, dword [byte ebp+024h]
        sub eax, dword [byte ebp+024h]
        sar ebx, 1
        cmp ecx, edx
        jle near .13
        mov ecx, dword [LineDeltaY]
        sar ecx, 10h
        cdq
        add ecx, ecx
        idiv ecx
        mov ecx, eax
        cmp dword [LineDeltaY], byte 0
        jge short .10
        mov eax, dword [byte ebp+014h]
        mov dword [LineEndY], eax
        mov eax, dword [byte ebp+028h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov edx, edi
        mov dword [LineStepY], esi
        sub edx, eax
        add edi, eax
        mov dword [LineSpanLeft], edx
        mov dword [LineSpanRight], edi
        jmp short .11
.10:
        mov eax, dword [byte ebp+014h]
        mov dword [LineStepY], eax
        mov eax, dword [byte ebp+010h]
        sub eax, ebx
        mov dword [LineSpanLeft], eax
        mov eax, dword [byte ebp+010h]
        add eax, ebx
        mov dword [LineEndY], esi
        mov dword [LineSpanRight], eax
.11:
        mov ebx, dword [LineDeltaY]
        mov eax, dword [LineDeltaX]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [LineDeltaX], eax
        sub eax, ecx
        mov dword [LineErrY], eax
        mov eax, dword [LineDeltaX]
        add ecx, eax
        mov dword [LineDeltaY], 10000h
        mov dword [LineErrStepY], ecx
        call ClipLineY
        test eax, eax
        jle near .17
        cmp dword [LineSteep], byte 0
        je short .12
        call DrawLineYPlot
.12:
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge near .17
        call DrawLineY
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge near .17
        call DrawLineYPlot
        pop ebp
        pop edi
        pop esi
        ret
.13:
        mov ecx, dword [LineDeltaX]
        sar ecx, 10h
        cdq
        add ecx, ecx
        idiv ecx
        mov ecx, eax
        cmp dword [LineDeltaX], byte 0
        jge short .14
        mov eax, dword [byte ebp+010h]
        mov dword [LineEndX], eax
        mov eax, dword [byte ebp+028h]
        mov edx, esi
        sar eax, 1
        mov dword [LineX], edi
        sub edx, eax
        add esi, eax
        mov dword [LineSpanTop], edx
        mov dword [LineSpanBottom], esi
        jmp short .15
.14:
        mov eax, dword [byte ebp+010h]
        mov dword [LineX], eax
        mov eax, dword [byte ebp+014h]
        sub eax, ebx
        mov dword [LineSpanTop], eax
        mov eax, dword [byte ebp+014h]
        add eax, ebx
        mov dword [LineEndX], edi
        mov dword [LineSpanBottom], eax
.15:
        mov ebx, dword [LineDeltaX]
        mov eax, dword [LineDeltaY]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [LineDeltaY], eax
        sub eax, ecx
        mov dword [LineErrStepX], eax
        mov eax, dword [LineDeltaY]
        add ecx, eax
        mov dword [LineDeltaX], 10000h
        mov dword [LineErrX], ecx
        call ClipLineX
        test eax, eax
        jle short .17
        cmp dword [LineSteep], byte 0
        je short .16
        call DrawLineXPlot
.16:
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge short .17
        call DrawLineX
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge short .17
        call DrawLineXPlot
.17:
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawFixedLineClip                            8805A  96 PC, medium confidence
; The same with its own clip window
;-----------------------------------------------------------------------------
DrawFixedLineClip:
        push esi
        push edi
        enter 10h, 0
        mov edi, dword [byte ebp+014h]
        mov ebx, dword [byte ebp+018h]
        mov esi, dword [byte ebp+01Ch]
        mov edx, dword [byte ebp+020h]
        mov dword [byte ebp-0Ch], 0
        cmp dword [byte ebp+024h], byte 0
        jl near .31
        cmp dword [byte ebp+028h], byte 0
        jl near .31
        mov eax, ebx
        sub eax, dword [byte ebp+010h]
        mov dword [LineDeltaX], eax
        mov eax, esi
        sub eax, edi
        mov dword [LineDeltaY], eax
        cmp dword [LineDeltaX], byte 0
        jl short .1
        mov eax, dword [LineDeltaX]
        jmp short .2
.1:
        mov eax, dword [LineDeltaX]
        neg eax
.2:
        cmp eax, 10000h
        jge short .5
        cmp dword [LineDeltaY], byte 0
        jl short .3
        mov eax, dword [LineDeltaY]
        jmp short .4
.3:
        mov eax, dword [LineDeltaY]
        neg eax
.4:
        cmp eax, 10000h
        jl near .31
.5:
        mov al, byte [edx]
        add edx, byte 4
        mov byte [LinePattern], al
        mov dword [LineColor], edx
        cmp dword [LineDeltaY], byte 0
        jl short .6
        mov edx, dword [LineDeltaY]
        jmp short .7
.6:
        mov edx, dword [LineDeltaY]
        neg edx
.7:
        cmp dword [LineDeltaX], byte 0
        jl short .8
        mov ecx, dword [LineDeltaX]
        jmp short .9
.8:
        mov ecx, dword [LineDeltaX]
        neg ecx
.9:
        mov eax, dword [byte ebp+028h]
        sub eax, dword [byte ebp+024h]
        cmp edx, ecx
        jle near .22
        mov ecx, dword [LineDeltaY]
        cdq
        sar ecx, 10h
        idiv ecx
        mov dword [byte ebp-08h], eax
        cmp dword [LineDeltaY], byte 0
        jge short .12
        mov dword [LineStepY], esi
        mov dword [LineEndY], edi
        cmp dword [byte ebp+02Ch], byte 0
        je short .10
        mov eax, ebx
        sub eax, dword [byte ebp+028h]
        mov dword [LineSpanLeft], eax
        mov eax, dword [byte ebp-08h]
        mov dword [LineErrStepY], 0
        mov dword [LineErrY], eax
        mov dword [LineSpanRight], ebx
        neg dword [LineErrY]
        jmp near .20
.10:
        mov eax, dword [byte ebp+028h]
        add eax, ebx
        mov dword [LineErrY], 0
        mov dword [LineSpanRight], eax
        mov eax, dword [byte ebp-08h]
        mov dword [LineSpanLeft], ebx
.11:
        mov dword [LineErrStepY], eax
        jmp near .20
.12:
        cmp dword [LineUserClipTop], byte 0
        jne short .13
        cmp dword [LineUserClipBottom], byte 0
        je near .18
.13:
        movsx eax, word [DrawClipBottom]
        mov dword [byte ebp-04h], eax
        movsx eax, word [DrawClipTop]
        mov dword [byte ebp-0Ch], 1
        mov dword [byte ebp-010h], eax
        cmp edi, esi
        jle short .15
        mov eax, edi
        sar eax, 10h
        cmp eax, dword [byte ebp-04h]
        jle short .14
        mov eax, dword [byte ebp-04h]
.14:
        push eax
        mov eax, esi
        movsx edx, word [DrawClipTop]
        sar eax, 10h
        cmp edx, eax
        jle short .17
        mov eax, edx
        jmp short .17
.15:
        mov eax, esi
        sar eax, 10h
        cmp eax, dword [byte ebp-04h]
        jle short .16
        mov eax, dword [byte ebp-04h]
.16:
        push eax
        mov edx, edi
        movsx eax, word [DrawClipTop]
        sar edx, 10h
        cmp eax, edx
        jg short .17
        mov eax, edx
.17:
        push eax
        movsx eax, word [DrawClipRight]
        push eax
        movsx eax, word [DrawClipLeft]
        push eax
        call SetClipWindow
        add esp, byte 10h
        movsx eax, word [DrawClipTop]
        shl eax, 10h
        mov dword [LineClipTop], eax
        movsx eax, word [DrawClipBottom]
        shl eax, 10h
        mov dword [LineClipBottom], eax
.18:
        mov dword [LineStepY], edi
        mov dword [LineEndY], esi
        cmp dword [byte ebp+02Ch], byte 0
        je short .19
        mov eax, dword [byte ebp+010h]
        mov dword [LineSpanLeft], eax
        add eax, dword [byte ebp+024h]
        mov dword [LineSpanRight], eax
        mov eax, dword [byte ebp-08h]
        mov dword [LineErrY], 0
        jmp near .11
.19:
        mov eax, dword [byte ebp+010h]
        sub eax, dword [byte ebp+024h]
        mov dword [LineSpanLeft], eax
        mov eax, dword [byte ebp-08h]
        mov dword [LineErrStepY], 0
        mov dword [LineErrY], eax
        mov eax, dword [byte ebp+010h]
        neg dword [LineErrY]
        mov dword [LineSpanRight], eax
.20:
        mov ebx, dword [LineDeltaY]
        mov eax, dword [LineDeltaX]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [LineDeltaY], 10000h
        mov dword [LineDeltaX], eax
        add dword [LineErrY], eax
        add dword [LineErrStepY], eax
        call ClipLineY
        test eax, eax
        jle near .30
        cmp dword [LineSteep], byte 0
        je short .21
        call DrawLineYPlot
.21:
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge near .30
        call DrawLineY
        mov eax, dword [LineStepY]
        cmp eax, dword [LineEndY]
        jge near .30
        call DrawLineYPlot
        jmp near .30
.22:
        mov ecx, dword [LineDeltaX]
        cdq
        sar ecx, 10h
        idiv ecx
        cmp dword [LineDeltaX], byte 0
        jge short .25
        mov edx, dword [byte ebp+010h]
        mov dword [LineX], ebx
        mov dword [LineEndX], edx
        cmp dword [byte ebp+02Ch], byte 0
        je short .23
        mov dword [LineErrStepX], 0
        mov edx, dword [byte ebp+028h]
        mov dword [LineSpanTop], esi
        add edx, esi
        jmp short .27
.23:
        mov dword [LineErrX], 0
        mov edx, esi
        mov dword [LineErrStepX], eax
        mov dword [LineSpanBottom], esi
        sub edx, dword [byte ebp+028h]
.24:
        neg dword [LineErrStepX]
        mov dword [LineSpanTop], edx
        jmp short .28
.25:
        mov edx, dword [byte ebp+010h]
        mov dword [LineEndX], ebx
        mov dword [LineX], edx
        cmp dword [byte ebp+02Ch], byte 0
        je short .26
        mov dword [LineErrX], 0
        mov edx, edi
        mov dword [LineErrStepX], eax
        mov dword [LineSpanBottom], edi
        sub edx, dword [byte ebp+024h]
        jmp short .24
.26:
        mov dword [LineErrStepX], 0
        mov edx, dword [byte ebp+024h]
        mov dword [LineSpanTop], edi
        add edx, edi
.27:
        mov dword [LineErrX], eax
        mov dword [LineSpanBottom], edx
.28:
        mov ebx, dword [LineDeltaX]
        mov eax, dword [LineDeltaY]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [LineDeltaX], 10000h
        mov dword [LineDeltaY], eax
        add dword [LineErrStepX], eax
        add dword [LineErrX], eax
        call ClipLineX
        test eax, eax
        jle short .30
        cmp dword [LineSteep], byte 0
        je short .29
        call DrawLineXPlot
.29:
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge short .30
        call DrawLineX
        mov eax, dword [LineX]
        cmp eax, dword [LineEndX]
        jge short .30
        call DrawLineXPlot
.30:
        cmp dword [byte ebp-0Ch], byte 0
        je short .31
        push dword [byte ebp-04h]
        push dword [byte ebp-010h]
        movsx eax, word [DrawClipRight]
        push eax
        movsx eax, word [DrawClipLeft]
        push eax
        call SetClipWindow
        movsx eax, word [DrawClipTop]
        shl eax, 10h
        mov dword [LineUserClipBottom], 0
        mov dword [LineClipTop], eax
        movsx eax, word [DrawClipBottom]
        mov dword [LineUserClipTop], 0
        shl eax, 10h
        add esp, byte 10h
        mov dword [LineClipBottom], eax
.31:
        leave
        pop edi
        pop esi
        ret
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [LineUserClipTop], eax
        mov eax, dword [byte ebp+0Ch]
        mov dword [LineUserClipBottom], eax
        pop ebp
        ret
