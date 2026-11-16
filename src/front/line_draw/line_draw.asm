; The 3D view's line drawer: the anti-alias colour table, clipping, fixed-point lines (96 PC).
bits 32
%include "hockey.inc"
section s_873AE progbits alloc exec nowrite align=1
extern byte_17DC70, ScreenWidth, ClipTopRow, ClipLeftCol, ClipRight, ScreenHeight, dword_1228F8, dword_1228FC
extern dword_17DC18, dword_17DC1C, dword_17DC20, dword_17DC24, dword_17DC28, dword_17DC2C, dword_17DC30, dword_17DC34
extern dword_17DC38, dword_17DC3C, dword_17DC40, dword_17DC44, dword_17DC48, dword_17DC4C, dword_17DC50, dword_17DC54
extern dword_17DC58, dword_17DC5C, dword_17DC60, dword_17DC64, dword_17DC68, dword_17DC6C, PlotPixel, SetClipWindow
extern str_AALIAS, sub_AB758, sub_AD824, sub_B31C0, sub_B9BB0, sub_DE18C
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
        call sub_AB758
        mov esi, eax
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-020h]
        shl edi, 10h
        shl eax, 8
        or eax, edi
        add esp, byte 0Ch
        or eax, dword [byte ebp-024h]
        push eax
        call sub_B31C0
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
        call sub_B9BB0
        add esp, byte 0Ch
        shl eax, 10h
        push dword [byte ebp-018h]
        mov dword [byte ebp-014h], eax
        movzx eax, byte [byte edi+01h]
        push dword [byte ebp-020h]
        shl eax, 2
        push eax
        call sub_B9BB0
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
        call sub_B9BB0
        add esp, byte 0Ch
        or eax, dword [byte ebp-014h]
        push eax
        add edi, byte 3
        call sub_B31C0
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
; Clips the current line to the view's top and bottom (dword_17DC1C / 17DC24)
;-----------------------------------------------------------------------------
ClipLineY:
        push ebx
        push ecx
        push edx
        mov eax, dword [dword_17DC64]
        cmp eax, dword [dword_17DC24]
        jge short .2
.1:
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC1C]
        jge short .1
        cmp eax, dword [dword_17DC24]
        jge short .3
        mov ebx, dword [dword_17DC24]
        sub ebx, eax
        mov eax, dword [dword_17DC58]
        mov edx, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, ebx
        add dword [dword_17DC50], eax
        mov eax, dword [dword_17DC30]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword_17DC44], eax
        mov eax, dword [dword_17DC24]
        mov dword [dword_17DC54], eax
.3:
        mov eax, dword [dword_17DC64]
        cmp eax, dword [dword_17DC1C]
        jle short .4
        mov eax, dword [dword_17DC1C]
        mov dword [dword_17DC64], eax
.4:
        mov eax, dword [dword_17DC50]
        cmp eax, dword [dword_17DC28]
        jl short .5
        mov eax, dword [dword_17DC44]
        cmp eax, dword [dword_17DC18]
        jl short .6
.5:
        mov eax, 1
        jmp short .7
.6:
        xor eax, eax
.7:
        mov dword [dword_17DC20], eax
        mov eax, dword [dword_17DC44]
        cmp eax, dword [dword_17DC28]
        jge near .8
        cmp dword [dword_17DC30], byte 0
        jle near .1
        mov eax, dword [dword_17DC28]
        mov ebx, dword [dword_17DC30]
        sub eax, dword [dword_17DC44]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [dword_17DC54], eax
        mov ebx, dword [dword_17DC54]
        cmp ebx, dword [dword_17DC1C]
        jge near .1
        cmp ebx, dword [dword_17DC24]
        jl near .1
        mov ebx, dword [dword_17DC28]
        mov dword [dword_17DC44], ebx
        mov ebx, dword [dword_17DC58]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword_17DC20], 1
        add dword [dword_17DC50], eax
.8:
        mov eax, dword [dword_17DC50]
        cmp eax, dword [dword_17DC18]
        jl near .9
        cmp dword [dword_17DC58], byte 0
        jge near .1
        mov eax, dword [dword_17DC18]
        sub eax, dword [dword_17DC50]
        mov ebx, dword [dword_17DC58]
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
        add dword [dword_17DC54], eax
        mov ebx, dword [dword_17DC54]
        cmp ebx, dword [dword_17DC1C]
        jge near .1
        cmp ebx, dword [dword_17DC24]
        jl near .1
        mov ebx, dword [dword_17DC30]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword_17DC44], eax
        mov eax, dword [dword_17DC18]
        dec eax
        mov dword [dword_17DC20], 1
        mov dword [dword_17DC50], eax
.9:
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ClipLineX                                       876A1  96 PC, low confidence
; Clips the current line to the view's left and right (dword_17DC18 / 17DC28)
;-----------------------------------------------------------------------------
ClipLineX:
        push ebx
        push ecx
        push edx
        mov eax, dword [dword_17DC60]
        cmp eax, dword [dword_17DC28]
        jge short .2
.1:
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC18]
        jge short .1
        cmp eax, dword [dword_17DC28]
        jge short .3
        mov ebx, dword [dword_17DC28]
        sub ebx, eax
        mov eax, dword [dword_17DC34]
        mov edx, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, ebx
        add dword [dword_17DC4C], eax
        mov eax, dword [dword_17DC2C]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword_17DC48], eax
        mov eax, dword [dword_17DC28]
        mov dword [dword_17DC40], eax
.3:
        mov eax, dword [dword_17DC60]
        cmp eax, dword [dword_17DC18]
        jle short .4
        mov eax, dword [dword_17DC18]
        mov dword [dword_17DC60], eax
.4:
        mov eax, dword [dword_17DC4C]
        cmp eax, dword [dword_17DC24]
        jl short .5
        mov eax, dword [dword_17DC48]
        cmp eax, dword [dword_17DC1C]
        jl short .6
.5:
        mov eax, 1
        jmp short .7
.6:
        xor eax, eax
.7:
        mov dword [dword_17DC20], eax
        mov eax, dword [dword_17DC48]
        cmp eax, dword [dword_17DC24]
        jge near .8
        cmp dword [dword_17DC2C], byte 0
        jle near .1
        mov eax, dword [dword_17DC24]
        mov ebx, dword [dword_17DC2C]
        sub eax, dword [dword_17DC48]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        add dword [dword_17DC40], eax
        mov ebx, dword [dword_17DC40]
        cmp ebx, dword [dword_17DC18]
        jge near .1
        cmp ebx, dword [dword_17DC28]
        jl near .1
        mov ebx, dword [dword_17DC24]
        mov dword [dword_17DC48], ebx
        mov ebx, dword [dword_17DC34]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword_17DC20], 1
        add dword [dword_17DC4C], eax
.8:
        mov eax, dword [dword_17DC4C]
        cmp eax, dword [dword_17DC1C]
        jl near .9
        cmp dword [dword_17DC34], byte 0
        jge near .1
        mov eax, dword [dword_17DC1C]
        sub eax, dword [dword_17DC4C]
        mov ebx, dword [dword_17DC34]
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
        add dword [dword_17DC40], eax
        mov ebx, dword [dword_17DC40]
        cmp ebx, dword [dword_17DC18]
        jge near .1
        cmp ebx, dword [dword_17DC28]
        jl near .1
        mov ebx, dword [dword_17DC2C]
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword_17DC48], eax
        mov eax, dword [dword_17DC1C]
        dec eax
        mov dword [dword_17DC20], 1
        mov dword [dword_17DC4C], eax
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
        mov eax, dword [dword_17DC54]
        sar eax, 10h
        mov dword [byte ebp-04h], eax
.1:
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge near DrawLineYPlot_186
        mov edi, dword [dword_17DC44]
        mov esi, dword [dword_17DC50]
        movsx eax, word [ClipTopRow]
        sar esi, 10h
        sar edi, 10h
        cmp esi, eax
        jl short .2
        movsx eax, word [ClipRight]
        cmp edi, eax
        jl near DrawLineYPlot_186
.2:
        movsx eax, word [ClipTopRow]
        cmp esi, eax
        jge short .3
        cmp edi, eax
        jl near DrawLineYPlot_186
.3:
        movsx eax, word [ClipRight]
        cmp esi, eax
        jl short .4
        cmp edi, eax
        jge near DrawLineYPlot_186
.4:
        mov eax, dword [dword_17DC50]
        mov edx, 10000h
        and eax, 0FFFFh
        sub edx, eax
        mov eax, edx
        sar eax, 0Ch
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_17DC44]
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
        movsx eax, word [ClipTopRow]
        cmp esi, eax
        jle short .6
        push dword [byte ebp-04h]
        push esi
        call PlotPixel
        mov edx, dword [byte ebp-0Ch]
        shl edx, 8
        add eax, edx
        mov edx, dword [dword_17DC5C]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push dword [byte ebp-04h]
        push esi
        call sub_DE18C
        add esp, byte 0Ch
.6:
        inc esi
        cmp esi, edi
        jge short .7
        movsx eax, byte [byte_17DC70]
        push eax
        mov eax, edi
        push byte 1
        sub eax, esi
        push eax
        push dword [byte ebp-04h]
        push esi
        call sub_AD824
        add esp, byte 14h
.7:
        cmp dword [byte ebp-08h], byte 0
        je short .9
        movsx eax, word [ClipRight]
        cmp edi, eax
        jge short .9
        push dword [byte ebp-04h]
        mov esi, dword [byte ebp-08h]
        push edi
.8:
        shl esi, 8
        call PlotPixel
        add esi, eax
        mov eax, dword [dword_17DC5C]
        add esp, byte 8
        movsx eax, byte [dword esi+eax-0100h]
        push eax
        push dword [byte ebp-04h]
        push edi
        call sub_DE18C
        add esp, byte 0Ch
.9:
        mov eax, dword [dword_17DC58]
        add dword [dword_17DC50], eax
        mov eax, dword [dword_17DC30]
        add dword [dword_17DC44], eax
        mov eax, dword [dword_17DC3C]
        inc dword [byte ebp-04h]
        add dword [dword_17DC54], eax
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
        mov eax, dword [dword_17DC54]
        sar eax, 10h
        mov edi, eax
        mov dword [byte ebp-04h], eax
        shl edi, 2
.1:
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge short DrawLineYPlot_186
        mov eax, dword [dword_17DC44]
        cmp eax, dword [dword_17DC18]
        jge short DrawLineYPlot_186
        mov edx, eax
        and edx, 0FFFFh
        mov eax, dword [dword_17DC50]
        sar edx, 0Ch
        cmp eax, dword [dword_17DC28]
        jl short DrawLineYPlot_186
        mov ebx, dword [dword_17DC44]
        sar eax, 10h
        sar ebx, 10h
        mov dword [byte ebp-08h], eax
        sub ebx, eax
        mov eax, dword [dword_17DC50]
        mov esi, 10000h
        and eax, 0FFFFh
        mov ecx, dword [dword_1228FC]
        sub esi, eax
        mov eax, dword [dword_1228F8]
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
        mov esi, dword [dword_17DC5C]
        add esi, ecx
        mov cl, byte [dword esi-0100h]
.3:
        mov byte [eax], cl
.4:
        inc eax
        dec ebx
        je short .5
        mov cl, byte [byte_17DC70]
        jmp short .3
.5:
        test edx, edx
        je short .7
        shl edx, 8
        movzx ebx, byte [eax]
.6:
        add edx, ebx
        mov ebx, dword [dword_17DC5C]
        mov dl, byte [dword edx+ebx-0100h]
        mov byte [eax], dl
.7:
        mov eax, dword [dword_17DC58]
        add dword [dword_17DC50], eax
        mov eax, dword [dword_17DC30]
        inc dword [byte ebp-04h]
        add dword [dword_17DC44], eax
        mov eax, dword [dword_17DC3C]
        add edi, byte 4
        add dword [dword_17DC54], eax
        jmp near .1
;-----------------------------------------------------------------------------
; DrawLineXPlot                                   87B1D  96 PC, low confidence
; Draws a mostly horizontal line pixel by pixel (PlotPixel)
;-----------------------------------------------------------------------------
DrawLineXPlot:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, dword [dword_17DC40]
        sar edi, 10h
.1:
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
        jge near DrawLineYPlot_186
        mov eax, dword [dword_17DC48]
        mov esi, dword [dword_17DC4C]
        sar eax, 10h
        sar esi, 10h
        mov dword [byte ebp-04h], eax
        movsx eax, word [ClipLeftCol]
        cmp esi, eax
        jl short .2
        movsx eax, word [ScreenHeight]
        cmp eax, dword [byte ebp-04h]
        jg near DrawLineYPlot_186
.2:
        movsx eax, word [ClipLeftCol]
        cmp esi, eax
        jge short .3
        cmp eax, dword [byte ebp-04h]
        jg near DrawLineYPlot_186
.3:
        movsx eax, word [ScreenHeight]
        cmp esi, eax
        jl short .4
        cmp eax, dword [byte ebp-04h]
        jle near DrawLineYPlot_186
.4:
        mov eax, dword [dword_17DC4C]
        mov edx, 10000h
        and eax, 0FFFFh
        sub edx, eax
        mov eax, edx
        sar eax, 0Ch
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_17DC48]
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
        mov eax, dword [dword_17DC5C]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push esi
        jmp near .8
.5:
        cmp dword [byte ebp-08h], byte 0
        je short .6
        movsx eax, word [ClipLeftCol]
        cmp esi, eax
        jle short .6
        push esi
        push edi
        call PlotPixel
        mov edx, dword [byte ebp-08h]
        shl edx, 8
        add eax, edx
        mov edx, dword [dword_17DC5C]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push esi
        push edi
        call sub_DE18C
        add esp, byte 0Ch
.6:
        inc esi
        cmp esi, dword [byte ebp-04h]
        jge short .7
        movsx eax, byte [byte_17DC70]
        push eax
        mov eax, dword [byte ebp-04h]
        sub eax, esi
        push eax
        push byte 1
        push esi
        push edi
        call sub_AD824
        add esp, byte 14h
.7:
        cmp dword [byte ebp-0Ch], byte 0
        je short .9
        movsx eax, word [ScreenHeight]
        cmp eax, dword [byte ebp-04h]
        jle short .9
        push dword [byte ebp-04h]
        push edi
        call PlotPixel
        mov edx, dword [byte ebp-0Ch]
        shl edx, 8
        add edx, eax
        mov eax, dword [dword_17DC5C]
        add esp, byte 8
        movsx eax, byte [dword edx+eax-0100h]
        push eax
        push dword [byte ebp-04h]
.8:
        push edi
        call sub_DE18C
        add esp, byte 0Ch
.9:
        mov eax, dword [dword_17DC34]
        add dword [dword_17DC4C], eax
        mov eax, dword [dword_17DC2C]
        add dword [dword_17DC48], eax
        mov eax, dword [dword_17DC38]
        inc edi
        add dword [dword_17DC40], eax
        jmp near .1
;-----------------------------------------------------------------------------
; DrawLineX                                       87CBF  96 PC, low confidence
; Draws a mostly horizontal line straight into the bitmap
;-----------------------------------------------------------------------------
DrawLineX:
        push esi
        push edi
        mov edi, dword [dword_17DC40]
        sar edi, 10h
.1:
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
        jge near DrawLineYPlot_187
        mov eax, dword [dword_17DC48]
        cmp eax, dword [dword_17DC1C]
        jge near DrawLineYPlot_187
        mov eax, dword [dword_17DC4C]
        cmp eax, dword [dword_17DC24]
        jl near DrawLineYPlot_187
        mov ecx, 10000h
        mov esi, dword [dword_17DC48]
        mov ebx, dword [dword_17DC48]
        mov edx, dword [dword_17DC4C]
        sar eax, 10h
        and esi, 0FFFFh
        and edx, 0FFFFh
        sar ebx, 10h
        sub ecx, edx
        sub ebx, eax
        mov edx, ecx
        mov ecx, dword [dword_1228F8]
        shl eax, 2
        add eax, ecx
        mov ecx, dword [dword_1228FC]
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
        mov edx, dword [dword_17DC5C]
        jmp short .6
.2:
        test edx, edx
        je short .4
        movzx ecx, byte [eax]
        shl edx, 8
        add ecx, edx
        mov edx, dword [dword_17DC5C]
        add edx, ecx
        mov dl, byte [dword edx-0100h]
.3:
        mov byte [eax], dl
.4:
        add eax, dword [ScreenWidth]
        dec ebx
        je short .5
        mov dl, byte [byte_17DC70]
        jmp short .3
.5:
        test esi, esi
        je short .7
        shl esi, 8
        movzx edx, byte [eax]
        mov ebx, dword [dword_17DC5C]
        add edx, esi
.6:
        mov dl, byte [dword edx+ebx-0100h]
        mov byte [eax], dl
.7:
        mov eax, dword [dword_17DC34]
        add dword [dword_17DC4C], eax
        mov eax, dword [dword_17DC2C]
        add dword [dword_17DC48], eax
        mov eax, dword [dword_17DC38]
        inc edi
        add dword [dword_17DC40], eax
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
        mov dword [dword_17DC38], eax
        mov eax, esi
        sub eax, dword [byte ebp+014h]
        mov dword [dword_17DC3C], eax
        cmp dword [dword_17DC38], byte 0
        jl short .1
        mov eax, dword [dword_17DC38]
        jmp short .2
.1:
        mov eax, dword [dword_17DC38]
        neg eax
.2:
        cmp eax, 10000h
        jge short .5
        cmp dword [dword_17DC3C], byte 0
        jl short .3
        mov eax, dword [dword_17DC3C]
        jmp short .4
.3:
        mov eax, dword [dword_17DC3C]
        neg eax
.4:
        cmp eax, 10000h
        jl near .17
.5:
        mov al, byte [edx]
        add edx, byte 4
        mov byte [byte_17DC70], al
        mov dword [dword_17DC5C], edx
        cmp dword [dword_17DC3C], byte 0
        jl short .6
        mov ecx, dword [dword_17DC3C]
        jmp short .7
.6:
        mov ecx, dword [dword_17DC3C]
        neg ecx
.7:
        cmp dword [dword_17DC38], byte 0
        jl short .8
        mov edx, dword [dword_17DC38]
        jmp short .9
.8:
        mov edx, dword [dword_17DC38]
        neg edx
.9:
        mov eax, dword [byte ebp+028h]
        mov ebx, dword [byte ebp+024h]
        sub eax, dword [byte ebp+024h]
        sar ebx, 1
        cmp ecx, edx
        jle near .13
        mov ecx, dword [dword_17DC3C]
        sar ecx, 10h
        cdq
        add ecx, ecx
        idiv ecx
        mov ecx, eax
        cmp dword [dword_17DC3C], byte 0
        jge short .10
        mov eax, dword [byte ebp+014h]
        mov dword [dword_17DC64], eax
        mov eax, dword [byte ebp+028h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov edx, edi
        mov dword [dword_17DC54], esi
        sub edx, eax
        add edi, eax
        mov dword [dword_17DC50], edx
        mov dword [dword_17DC44], edi
        jmp short .11
.10:
        mov eax, dword [byte ebp+014h]
        mov dword [dword_17DC54], eax
        mov eax, dword [byte ebp+010h]
        sub eax, ebx
        mov dword [dword_17DC50], eax
        mov eax, dword [byte ebp+010h]
        add eax, ebx
        mov dword [dword_17DC64], esi
        mov dword [dword_17DC44], eax
.11:
        mov ebx, dword [dword_17DC3C]
        mov eax, dword [dword_17DC38]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [dword_17DC38], eax
        sub eax, ecx
        mov dword [dword_17DC58], eax
        mov eax, dword [dword_17DC38]
        add ecx, eax
        mov dword [dword_17DC3C], 10000h
        mov dword [dword_17DC30], ecx
        call ClipLineY
        test eax, eax
        jle near .17
        cmp dword [dword_17DC20], byte 0
        je short .12
        call DrawLineYPlot
.12:
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge near .17
        call DrawLineY
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge near .17
        call DrawLineYPlot
        pop ebp
        pop edi
        pop esi
        ret
.13:
        mov ecx, dword [dword_17DC38]
        sar ecx, 10h
        cdq
        add ecx, ecx
        idiv ecx
        mov ecx, eax
        cmp dword [dword_17DC38], byte 0
        jge short .14
        mov eax, dword [byte ebp+010h]
        mov dword [dword_17DC60], eax
        mov eax, dword [byte ebp+028h]
        mov edx, esi
        sar eax, 1
        mov dword [dword_17DC40], edi
        sub edx, eax
        add esi, eax
        mov dword [dword_17DC4C], edx
        mov dword [dword_17DC48], esi
        jmp short .15
.14:
        mov eax, dword [byte ebp+010h]
        mov dword [dword_17DC40], eax
        mov eax, dword [byte ebp+014h]
        sub eax, ebx
        mov dword [dword_17DC4C], eax
        mov eax, dword [byte ebp+014h]
        add eax, ebx
        mov dword [dword_17DC60], edi
        mov dword [dword_17DC48], eax
.15:
        mov ebx, dword [dword_17DC38]
        mov eax, dword [dword_17DC3C]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [dword_17DC3C], eax
        sub eax, ecx
        mov dword [dword_17DC34], eax
        mov eax, dword [dword_17DC3C]
        add ecx, eax
        mov dword [dword_17DC38], 10000h
        mov dword [dword_17DC2C], ecx
        call ClipLineX
        test eax, eax
        jle short .17
        cmp dword [dword_17DC20], byte 0
        je short .16
        call DrawLineXPlot
.16:
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
        jge short .17
        call DrawLineX
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
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
        mov dword [dword_17DC38], eax
        mov eax, esi
        sub eax, edi
        mov dword [dword_17DC3C], eax
        cmp dword [dword_17DC38], byte 0
        jl short .1
        mov eax, dword [dword_17DC38]
        jmp short .2
.1:
        mov eax, dword [dword_17DC38]
        neg eax
.2:
        cmp eax, 10000h
        jge short .5
        cmp dword [dword_17DC3C], byte 0
        jl short .3
        mov eax, dword [dword_17DC3C]
        jmp short .4
.3:
        mov eax, dword [dword_17DC3C]
        neg eax
.4:
        cmp eax, 10000h
        jl near .31
.5:
        mov al, byte [edx]
        add edx, byte 4
        mov byte [byte_17DC70], al
        mov dword [dword_17DC5C], edx
        cmp dword [dword_17DC3C], byte 0
        jl short .6
        mov edx, dword [dword_17DC3C]
        jmp short .7
.6:
        mov edx, dword [dword_17DC3C]
        neg edx
.7:
        cmp dword [dword_17DC38], byte 0
        jl short .8
        mov ecx, dword [dword_17DC38]
        jmp short .9
.8:
        mov ecx, dword [dword_17DC38]
        neg ecx
.9:
        mov eax, dword [byte ebp+028h]
        sub eax, dword [byte ebp+024h]
        cmp edx, ecx
        jle near .22
        mov ecx, dword [dword_17DC3C]
        cdq
        sar ecx, 10h
        idiv ecx
        mov dword [byte ebp-08h], eax
        cmp dword [dword_17DC3C], byte 0
        jge short .12
        mov dword [dword_17DC54], esi
        mov dword [dword_17DC64], edi
        cmp dword [byte ebp+02Ch], byte 0
        je short .10
        mov eax, ebx
        sub eax, dword [byte ebp+028h]
        mov dword [dword_17DC50], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_17DC30], 0
        mov dword [dword_17DC58], eax
        mov dword [dword_17DC44], ebx
        neg dword [dword_17DC58]
        jmp near .20
.10:
        mov eax, dword [byte ebp+028h]
        add eax, ebx
        mov dword [dword_17DC58], 0
        mov dword [dword_17DC44], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_17DC50], ebx
.11:
        mov dword [dword_17DC30], eax
        jmp near .20
.12:
        cmp dword [dword_17DC6C], byte 0
        jne short .13
        cmp dword [dword_17DC68], byte 0
        je near .18
.13:
        movsx eax, word [ScreenHeight]
        mov dword [byte ebp-04h], eax
        movsx eax, word [ClipLeftCol]
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
        movsx edx, word [ClipLeftCol]
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
        movsx eax, word [ClipLeftCol]
        sar edx, 10h
        cmp eax, edx
        jg short .17
        mov eax, edx
.17:
        push eax
        movsx eax, word [ClipRight]
        push eax
        movsx eax, word [ClipTopRow]
        push eax
        call SetClipWindow
        add esp, byte 10h
        movsx eax, word [ClipLeftCol]
        shl eax, 10h
        mov dword [dword_17DC24], eax
        movsx eax, word [ScreenHeight]
        shl eax, 10h
        mov dword [dword_17DC1C], eax
.18:
        mov dword [dword_17DC54], edi
        mov dword [dword_17DC64], esi
        cmp dword [byte ebp+02Ch], byte 0
        je short .19
        mov eax, dword [byte ebp+010h]
        mov dword [dword_17DC50], eax
        add eax, dword [byte ebp+024h]
        mov dword [dword_17DC44], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_17DC58], 0
        jmp near .11
.19:
        mov eax, dword [byte ebp+010h]
        sub eax, dword [byte ebp+024h]
        mov dword [dword_17DC50], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_17DC30], 0
        mov dword [dword_17DC58], eax
        mov eax, dword [byte ebp+010h]
        neg dword [dword_17DC58]
        mov dword [dword_17DC44], eax
.20:
        mov ebx, dword [dword_17DC3C]
        mov eax, dword [dword_17DC38]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [dword_17DC3C], 10000h
        mov dword [dword_17DC38], eax
        add dword [dword_17DC58], eax
        add dword [dword_17DC30], eax
        call ClipLineY
        test eax, eax
        jle near .30
        cmp dword [dword_17DC20], byte 0
        je short .21
        call DrawLineYPlot
.21:
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge near .30
        call DrawLineY
        mov eax, dword [dword_17DC54]
        cmp eax, dword [dword_17DC64]
        jge near .30
        call DrawLineYPlot
        jmp near .30
.22:
        mov ecx, dword [dword_17DC38]
        cdq
        sar ecx, 10h
        idiv ecx
        cmp dword [dword_17DC38], byte 0
        jge short .25
        mov edx, dword [byte ebp+010h]
        mov dword [dword_17DC40], ebx
        mov dword [dword_17DC60], edx
        cmp dword [byte ebp+02Ch], byte 0
        je short .23
        mov dword [dword_17DC34], 0
        mov edx, dword [byte ebp+028h]
        mov dword [dword_17DC4C], esi
        add edx, esi
        jmp short .27
.23:
        mov dword [dword_17DC2C], 0
        mov edx, esi
        mov dword [dword_17DC34], eax
        mov dword [dword_17DC48], esi
        sub edx, dword [byte ebp+028h]
.24:
        neg dword [dword_17DC34]
        mov dword [dword_17DC4C], edx
        jmp short .28
.25:
        mov edx, dword [byte ebp+010h]
        mov dword [dword_17DC60], ebx
        mov dword [dword_17DC40], edx
        cmp dword [byte ebp+02Ch], byte 0
        je short .26
        mov dword [dword_17DC2C], 0
        mov edx, edi
        mov dword [dword_17DC34], eax
        mov dword [dword_17DC48], edi
        sub edx, dword [byte ebp+024h]
        jmp short .24
.26:
        mov dword [dword_17DC34], 0
        mov edx, dword [byte ebp+024h]
        mov dword [dword_17DC4C], edi
        add edx, edi
.27:
        mov dword [dword_17DC2C], eax
        mov dword [dword_17DC48], edx
.28:
        mov ebx, dword [dword_17DC38]
        mov eax, dword [dword_17DC3C]
        sar ebx, 10h
        cdq
        idiv ebx
        mov dword [dword_17DC38], 10000h
        mov dword [dword_17DC3C], eax
        add dword [dword_17DC34], eax
        add dword [dword_17DC2C], eax
        call ClipLineX
        test eax, eax
        jle short .30
        cmp dword [dword_17DC20], byte 0
        je short .29
        call DrawLineXPlot
.29:
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
        jge short .30
        call DrawLineX
        mov eax, dword [dword_17DC40]
        cmp eax, dword [dword_17DC60]
        jge short .30
        call DrawLineXPlot
.30:
        cmp dword [byte ebp-0Ch], byte 0
        je short .31
        push dword [byte ebp-04h]
        push dword [byte ebp-010h]
        movsx eax, word [ClipRight]
        push eax
        movsx eax, word [ClipTopRow]
        push eax
        call SetClipWindow
        movsx eax, word [ClipLeftCol]
        shl eax, 10h
        mov dword [dword_17DC68], 0
        mov dword [dword_17DC24], eax
        movsx eax, word [ScreenHeight]
        mov dword [dword_17DC6C], 0
        shl eax, 10h
        add esp, byte 10h
        mov dword [dword_17DC1C], eax
.31:
        leave
        pop edi
        pop esi
        ret
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [dword_17DC6C], eax
        mov eax, dword [byte ebp+0Ch]
        mov dword [dword_17DC68], eax
        pop ebp
        ret
