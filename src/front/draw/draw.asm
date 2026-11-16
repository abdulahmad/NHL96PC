; Drawing helpers: palette fades, the graphics mode, bitmap copies, text in colours, boxes, colour remapping (96 PC).
bits 32
%include "hockey.inc"
section s_63968 progbits alloc exec nowrite align=1
extern ClearChain4, dword_11D18C, dword_11D190, dword_11D194, dword_11D198, dword_11D19C, dword_11D1A0, dword_11D1A4
extern dword_11F5A0, dword_11F5C0, dword_11F5C4, dword_11FA14, dword_11FA18, dword_1219A4, dword_1228FC, BackBufferWidth
extern dword_122904, FatalError, fputchar, GetTicks, initgraphics, SetViewRect, SoundIdle, str_COPY
extern str_CouldNotAllocateLibraryB, str_LIBBUGFIX, str_NHLinitgraphicsfixNotCal, str_USETABLE, AllocMemBlock, AllocMemLocked, FreeMemBlock, sub_ADA50
extern sub_ADA80, TextSetColor, sub_B0CA8, sub_B0F7C, sub_B2B0C, BuildAaPalLut, CreateAaPalLut, BuildPaletteShadeTable
extern SetAaPalLut, DrawArtAaScaledInt, TranslatePixels, SetScreenTarget, GetPaletteRange, sub_DD7B8, sub_DDF4F, sub_DE01A
extern SetClipRect, bcopy, FillMem, unk_121FC8, IntroPalette, unk_17C0E0, WaitRetrace, WaitRetraceEdges
global BlackPalette, FadePalette, FadeOut, CopyBitmapRows, CopyBitmapRows_76, CopyBitmap, InitGraphicsFix, SetGraphicsMode
global SetGraphicsMode_204, SetScreenMode, DrawText, DrawTextRight, DrawTextRight_17, DrawTextCentred, FindTextColors, SetTextColors
global SetTextColorsRgb, DrawColorText, DrawColorTextRight, DrawColorTextRight_29, DrawColorTextRight_72, DrawColorTextCentred, FillBox, DrawBox
global SetScreenPalette, DrawFrameAt, FindNearest, NearestColor, BuildColorRemap, RemapScreenColors
;-----------------------------------------------------------------------------
; BlackPalette                                                    63968  96 PC
; Sets all 256 colours to black
;-----------------------------------------------------------------------------
BlackPalette:
        push ebx
        push ecx
        push edx
        push edi
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FadePalette                                                     63998  96 PC
; (out, palette, steps): fades the screen palette from or to black
;-----------------------------------------------------------------------------
FadePalette:
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push edx
        push ebx
        test ebx, ebx
        jne short .1
        inc dword [byte ebp-08h]
.1:
        test eax, eax
        jne short .2
        mov ecx, 300h
        mov esi, dword [byte ebp-04h]
        mov edi, unk_17C0E0
        rep movsb
        push dword [byte ebp-04h]
        push dword 100h
        push byte 0
        call GetPaletteRange
        add esp, byte 0Ch
        jmp short .3
.2:
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
.3:
        mov eax, dword [byte ebp-04h]
        mov edx, unk_17C0E0
        xor esi, esi
        xor ebx, ebx
.4:
        mov cl, byte [eax]
        cmp cl, byte [edx]
        jge short .6
        movsx esi, cl
        add esi, dword [byte ebp-08h]
        movsx ecx, byte [edx]
        cmp esi, ecx
        jle short .5
        mov cl, byte [edx]
        mov byte [eax], cl
        jmp short .8
.5:
        mov cl, byte [byte ebp-08h]
        add byte [eax], cl
        jmp short .8
.6:
        jle short .9
        movsx ecx, cl
        movsx esi, byte [edx]
        sub ecx, dword [byte ebp-08h]
        cmp ecx, esi
        jge short .7
        mov cl, byte [edx]
        mov byte [eax], cl
        jmp short .8
.7:
        mov cl, byte [byte ebp-08h]
        sub byte [eax], cl
.8:
        mov esi, 1
.9:
        inc eax
        inc ebx
        inc edx
        cmp ebx, 300h
        jb short .4
        test esi, esi
        je short .10
        call WaitRetraceEdges
        push dword [byte ebp-04h]
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
.10:
        call SoundIdle
        test esi, esi
        jne short .3
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FadeOut                                                         63A5B  96 PC
; (steps): fades the current palette to black
;-----------------------------------------------------------------------------
FadeOut:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push IntroPalette
        push dword 100h
        push byte 0
        call GetPaletteRange
        add esp, byte 0Ch
        test esi, esi
        jne short .1
        inc esi
.1:
        mov edx, IntroPalette
        mov eax, 1
        mov ebx, esi
        call FadePalette
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CopyBitmapRows                                  63A90  96 PC, low confidence
; Copies a bitmap's rows for CopyBitmap
;-----------------------------------------------------------------------------
CopyBitmapRows:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov ebx, edx
        cmp edx, byte 1
        jge short .1
        mov ebx, 1
.1:
        lea edx, [byte ebx-01h]
        xor edi, edi
        mov dword [byte ebp-08h], edx
        lea edx, [byte eax+010h]
        mov dword [byte ebp-04h], edi
        mov dword [byte ebp-0Ch], edx
.2:
        movsx edx, word [byte eax+06h]
        cmp edi, edx
        jge short CopyBitmapRows_76
        mov edx, dword [byte ebp-0Ch]
        cmp dword [byte ebp-04h], byte 0
        je short .3
        mov dword [byte ebp-04h], 0
        mov esi, dword [byte ebp-08h]
        jmp short .4
.3:
        mov dword [byte ebp-04h], 1
        xor esi, esi
.4:
        movsx ecx, word [byte eax+04h]
        imul ecx, edi
        add ecx, esi
        add edx, ecx
.5:
        movsx ecx, word [byte eax+04h]
        cmp esi, ecx
        jge short .7
        movzx ecx, byte [edx]
        cmp ecx, 0FFh
        je short .6
        mov byte [edx], 0
.6:
        add edx, ebx
        add esi, ebx
        jmp short .5
.7:
        add edi, ebx
        jmp short .2
CopyBitmapRows_76:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CopyBitmap                                   63B0C  96 PC, medium confidence
; (bitmap): a copy of a bitmap in a new COPY block
;-----------------------------------------------------------------------------
CopyBitmap:
        push ebx
        push ecx
        push esi
        push edi
        mov esi, eax
        push edx
        movsx edi, word [byte eax+06h]
        movsx edx, word [byte eax+04h]
        imul edx, edi
        add edx, byte 10h
        push edx
        push str_COPY
        call AllocMemBlock
        mov edi, eax
        movsx edx, word [byte esi+06h]
        movsx eax, word [byte esi+04h]
        imul edx, eax
        add esp, byte 0Ch
        add edx, byte 10h
        push edx
        push edi
        push esi
        call bcopy
        add esp, byte 0Ch
        mov eax, edi
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        mov ecx, edx
        xor edx, edx
        call CopyBitmap
        mov edx, ecx
        mov ebx, eax
        call CopyBitmapRows
        mov eax, ebx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InitGraphicsFix                              63B6A  96 PC, medium confidence
; Allocates the LIB BUG FIX block once (fatal error if out of memory)
;-----------------------------------------------------------------------------
InitGraphicsFix:
        push ebx
        push ecx
        push edx
        cmp dword [dword_11D198], byte 0
        jne short .1
        push dword 200h
        push dword 400h
        push str_LIBBUGFIX
        call AllocMemLocked
        add esp, byte 0Ch
        mov dword [dword_11D198], eax
        test eax, eax
        jne short .1
        push unk_121FC8
        push dword 100h
        push eax
        call sub_DD7B8
        add esp, byte 0Ch
        push str_CouldNotAllocateLibraryB
        call FatalError
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetGraphicsMode                              63BBA  96 PC, medium confidence
; (mode): switches the graphics mode (needs InitGraphicsFix:
; "NHLinitgraphicsfix not called.")
;-----------------------------------------------------------------------------
SetGraphicsMode:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        call GetTicks
        add eax, byte 28h
        mov dword [byte ebp-04h], eax
        call WaitRetrace
        cmp dword [dword_11D198], byte 0
        jne short .1
        push unk_121FC8
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push str_NHLinitgraphicsfixNotCal
        call FatalError
        jmp short .2
.1:
        push dword [dword_11D198]
        call FreeMemBlock
        mov dword [dword_11D198], 0
.2:
        add esp, byte 4
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push byte 0Fh
        push byte 2
        call sub_DDF4F
        add esp, byte 8
        push byte 0
        push dword 10000h
        push dword 0A0000h
        call FillMem
        add esp, byte 0Ch
        cmp esi, byte 1
        jne short .3
        push byte 0
        push dword 1E0h
        push dword 280h
        call initgraphics
        add esp, byte 0Ch
        mov dword [dword_11D194], esi
        jmp near .5
.3:
        cmp esi, byte 2
        jne near .4
        call WaitRetrace
        push byte 8
        push dword 0C8h
        push dword 140h
        mov edi, unk_17C0E0
        call initgraphics
        mov ecx, 300h
        add esp, byte 0Ch
        xor eax, eax
        mov dword [dword_11D194], 0
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        call ClearChain4
        mov dword [dword_11F5C4], 0F0h
        call sub_DE01A
        mov eax, dword [dword_11F5C4]
        add eax, eax
        push eax
        push byte 0
        push dword 140h
        push byte 0
        push BackBufferWidth
        call SetClipRect
        mov eax, dword [dword_11F5C4]
        add eax, eax
        add esp, byte 14h
        mov dword [dword_122904], eax
        call SetScreenTarget
        mov dword [dword_11F5A0], 9
        call WaitRetrace
        jmp short .5
.4:
        push byte 0
        push dword 0C8h
        push dword 140h
        mov dword [dword_11D194], 0
        call initgraphics
        add esp, byte 0Ch
.5:
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push byte 0Fh
        push byte 2
        call sub_DDF4F
        add esp, byte 8
        push byte 0
        push dword 10000h
        push dword 0A0000h
        call FillMem
        mov eax, dword [dword_11F5C4]
        add esp, byte 0Ch
        dec eax
        push eax
        mov eax, dword [dword_11F5C0]
        dec eax
        push eax
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        call InitGraphicsFix
.6:
        call GetTicks
        cmp eax, dword [byte ebp-04h]
        jge short .7
        call SoundIdle
        jmp short .6
.7:
        leave
SetGraphicsMode_204:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetScreenMode                                63DC4  96 PC, medium confidence
; (mode): black palette, clear, then SetGraphicsMode when the mode changes
;-----------------------------------------------------------------------------
SetScreenMode:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        call SetScreenTarget
        push byte 0
        call sub_ADA50
        add esp, byte 4
        cmp esi, dword [dword_11D194]
        je short SetGraphicsMode_204
        cmp esi, byte 1
        jne short .1
        mov eax, esi
        jmp short .2
.1:
        xor eax, eax
.2:
        call SetGraphicsMode
        mov ecx, 300h
        mov edi, unk_17C0E0
        xor eax, eax
        rep stosb
        call WaitRetraceEdges
        push unk_17C0E0
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push byte 0
        call sub_ADA50
        add esp, byte 4
        cmp esi, byte 1
        jne short .3
        push dword 1DFh
        push dword 27Fh
        jmp short .4
.3:
        push dword 0C7h
        push dword 13Fh
.4:
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        mov dword [dword_11D194], esi
        jmp near SetGraphicsMode_204
;-----------------------------------------------------------------------------
; DrawText                                     63E7C  96 PC, medium confidence
; Draws a string at x, y in the current font
;-----------------------------------------------------------------------------
DrawText:
        push ecx
        push ebx
        push edx
        push eax
        call sub_B2B0C
        add esp, byte 0Ch
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawTextRight                                63E8A  96 PC, medium confidence
; Draws a string ending at x
;-----------------------------------------------------------------------------
DrawTextRight:
        push ecx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        push eax
        call fputchar
        add esp, byte 4
DrawTextRight_17:
        push dword [byte ebp-04h]
        sub edi, eax
        push edi
        push esi
        call sub_B2B0C
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawTextCentred                              63EB5  96 PC, medium confidence
; Draws a string centred on x
;-----------------------------------------------------------------------------
DrawTextCentred:
        push ecx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        push eax
        call fputchar
        add esp, byte 4
        sar eax, 1
        jmp short DrawTextRight_17
;-----------------------------------------------------------------------------
; FindTextColors                                  63ED0  96 PC, low confidence
; Finds the palette colours nearest a colour triple, for the text colours
;-----------------------------------------------------------------------------
FindTextColors:
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        mov dword [byte ebp-010h], edx
        mov eax, ebx
        mov dword [byte ebp-08h], 0
        inc eax
        movsx ebx, byte [ebx]
        movsx edx, byte [eax]
        inc eax
        mov dword [byte ebp-04h], 0
        add ebx, edx
        movsx edx, byte [eax]
        mov ecx, 1
        add ebx, edx
        inc eax
        mov dword [byte ebp-0Ch], ebx
.1:
        movsx edx, byte [eax]
        inc eax
        movsx edi, byte [eax]
        inc eax
        add edx, edi
        movsx edi, byte [eax]
        add edx, edi
        inc eax
        cmp edx, dword [byte ebp-0Ch]
        jl short .2
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], ecx
.2:
        cmp edx, ebx
        jg short .3
        mov ebx, edx
        mov dword [byte ebp-04h], ecx
.3:
        inc ecx
        cmp ecx, 100h
        jl short .1
        mov eax, dword [byte ebp-08h]
        mov edx, dword [byte ebp-010h]
        mov dword [esi], eax
        mov eax, dword [byte ebp-04h]
        mov dword [edx], eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push ebx
        push ecx
        push esi
        push edi
        enter 300h, 0
        mov edi, eax
        mov esi, edx
        lea ebx, [dword ebp-0300h]
        push ebx
        push dword 100h
        push byte 0
        call GetPaletteRange
        lea ebx, [dword ebp-0300h]
        add esp, byte 0Ch
        mov edx, esi
        mov eax, edi
        call FindTextColors
        jmp near CopyBitmapRows_76
;-----------------------------------------------------------------------------
; SetTextColors                                                   63F79  96 PC
; (fg, bg): the text colours (dword_11D18C, dword_11D190)
;-----------------------------------------------------------------------------
SetTextColors:
        mov dword [dword_11D18C], eax
        mov dword [dword_11D190], edx
        ret
        push ebx
        push ecx
        push edx
        enter 308h, 0
        lea eax, [dword ebp-0308h]
        push eax
        push dword 100h
        push byte 0
        call GetPaletteRange
        lea ebx, [dword ebp-0308h]
        add esp, byte 0Ch
        lea edx, [byte ebp-08h]
        lea eax, [byte ebp-04h]
        call FindTextColors
        mov eax, dword [byte ebp-04h]
        mov dword [dword_11D18C], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_11D190], eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetTextColorsRgb                                63FC8  96 PC, low confidence
; The text colours nearest a colour triple
;-----------------------------------------------------------------------------
SetTextColorsRgb:
        push ebx
        push edx
        enter 8, 0
        lea edx, [byte ebp-08h]
        mov ebx, eax
        lea eax, [byte ebp-04h]
        call FindTextColors
        mov eax, dword [byte ebp-04h]
        mov dword [dword_11D18C], eax
        mov eax, dword [byte ebp-08h]
        mov dword [dword_11D190], eax
        leave
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawColorText                                63FEF  96 PC, medium confidence
; Draws a string in the text colours
;-----------------------------------------------------------------------------
DrawColorText:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        mov eax, dword [dword_11FA14]
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_11FA18]
        push eax
        push dword [dword_11D190]
        mov dword [byte ebp-0Ch], eax
        call TextSetColor
        mov eax, dword [byte ebp-04h]
        add esp, byte 8
        inc eax
        push eax
        lea eax, [byte edi+01h]
        push eax
        push esi
        call sub_B2B0C
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        push dword [dword_11D18C]
        call TextSetColor
        add esp, byte 8
        push dword [byte ebp-04h]
        push edi
        push esi
        call sub_B2B0C
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        push dword [byte ebp-08h]
        jmp short DrawColorTextRight_72
;-----------------------------------------------------------------------------
; DrawColorTextRight                           64054  96 PC, medium confidence
; Draws a string ending at x in the text colours
;-----------------------------------------------------------------------------
DrawColorTextRight:
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-04h], ebx
        mov eax, dword [dword_11FA14]
        push esi
        mov edi, dword [dword_11FA18]
        mov dword [byte ebp-0Ch], eax
        call fputchar
        add esp, byte 4
        mov edx, dword [byte ebp-08h]
DrawColorTextRight_29:
        push edi
        sub edx, eax
        push dword [dword_11D190]
        mov dword [byte ebp-010h], edx
        call TextSetColor
        mov eax, dword [byte ebp-04h]
        add esp, byte 8
        inc eax
        push eax
        mov eax, dword [byte ebp-010h]
        inc eax
        push eax
        push esi
        call sub_B2B0C
        add esp, byte 0Ch
        push edi
        push dword [dword_11D18C]
        call TextSetColor
        add esp, byte 8
        push dword [byte ebp-04h]
        push dword [byte ebp-010h]
        push esi
        call sub_B2B0C
        add esp, byte 0Ch
        push edi
        push dword [byte ebp-0Ch]
DrawColorTextRight_72:
        call TextSetColor
        add esp, byte 8
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawColorTextCentred                         640D3  96 PC, medium confidence
; Draws a string centred on x in the text colours
;-----------------------------------------------------------------------------
DrawColorTextCentred:
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-04h], ebx
        mov eax, dword [dword_11FA14]
        push esi
        mov edi, dword [dword_11FA18]
        mov dword [byte ebp-0Ch], eax
        call fputchar
        mov edx, dword [byte ebp-08h]
        add esp, byte 4
        sar eax, 1
        jmp near DrawColorTextRight_29
;-----------------------------------------------------------------------------
; FillBox                                      64103  96 PC, medium confidence
; Fills a rectangle clipped to the draw bitmap (dword_1228FC)
;-----------------------------------------------------------------------------
FillBox:
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov esi, ebx
        mov eax, dword [dword_1228FC]
        movsx ebx, word [byte eax+04h]
        cmp edx, ebx
        jg near .7
        movsx ebx, word [byte eax+06h]
        cmp esi, ebx
        jg near .7
        test ecx, ecx
        jl near .7
        cmp dword [byte ebp+010h], byte 0
        jl near .7
        cmp ecx, edx
        jl near .7
        cmp esi, dword [byte ebp+010h]
        jg near .7
        test edx, edx
        jge short .1
        xor edx, edx
.1:
        movsx ebx, word [byte eax+04h]
        dec ebx
        cmp ecx, ebx
        jle short .2
        mov ecx, ebx
.2:
        test esi, esi
        jge short .3
        xor esi, esi
.3:
        movsx ebx, word [byte eax+06h]
        dec ebx
        cmp ebx, dword [byte ebp+010h]
        jge short .4
        mov dword [byte ebp+010h], ebx
.4:
        add eax, byte 10h
        mov ebx, ecx
        movsx ecx, word [byte eax-0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, ecx
        imul eax, esi
        sub ebx, edx
        inc ebx
        cmp ebx, ecx
        jne short .5
        mov edx, dword [byte ebp-04h]
        add edx, eax
        mov eax, dword [byte ebp+010h]
        sub eax, esi
        inc eax
        imul eax, ecx
        push eax
        push dword [byte ebp-010h]
        push edx
        call TranslatePixels
        add esp, byte 0Ch
        jmp short .7
.5:
        mov edi, dword [byte ebp-04h]
        mov dword [byte ebp-0Ch], ecx
        add eax, edx
        mov dword [byte ebp-08h], ebx
        add edi, eax
.6:
        mov eax, esi
        inc esi
        cmp eax, dword [byte ebp+010h]
        jg short .7
        push dword [byte ebp-08h]
        push dword [byte ebp-010h]
        push edi
        call TranslatePixels
        add esp, byte 0Ch
        add edi, dword [byte ebp-0Ch]
        jmp short .6
.7:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; DrawBox                                      641D4  96 PC, medium confidence
; A box with a frame style (0, 1, 2) over FillBox
;-----------------------------------------------------------------------------
DrawBox:
        push esi
        push edi
        enter 4, 0
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        push dword [byte ebp+010h]
        call FillBox
        cmp dword [byte ebp+014h], byte 1
        jne short .1
        push dword [byte ebp+018h]
        push dword [byte ebp+010h]
        push dword [byte ebp-04h]
        push edi
        push esi
        jmp short .2
.1:
        cmp dword [byte ebp+014h], byte 0
        je short .3
        mov eax, dword [byte ebp+010h]
        push dword [byte ebp+018h]
        dec eax
        push eax
        mov eax, dword [byte ebp-04h]
        dec eax
        push eax
        lea eax, [byte edi+01h]
        push eax
        lea eax, [byte esi+01h]
        push eax
.2:
        call sub_ADA80
        add esp, byte 14h
.3:
        cmp dword [byte ebp+014h], byte 1
        jle short .4
        push dword [byte ebp+01Ch]
        push dword [byte ebp+010h]
        push dword [byte ebp-04h]
        push edi
        push esi
        call sub_ADA80
        add esp, byte 14h
.4:
        leave
        pop edi
        pop esi
        ret 10h
;-----------------------------------------------------------------------------
; SetScreenPalette                             6423E  96 PC, medium confidence
; (palette): sets the palette and its colour table
;-----------------------------------------------------------------------------
SetScreenPalette:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        call sub_B0CA8
        push esi
        call sub_B0F7C
        add esp, byte 4
        mov dword [dword_1219A4], eax
        mov eax, esi
        call BuildPaletteShadeTable
        cmp dword [dword_11D19C], byte 0
        jne short .1
        mov ebx, 20h
        mov edx, dword_11D19C
        mov eax, esi
        call CreateAaPalLut
        jmp short .2
.1:
        mov edx, dword [dword_11D19C]
        mov eax, esi
        call BuildAaPalLut
.2:
        mov eax, dword [dword_11D19C]
        call SetAaPalLut
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawFrameAt                                     64296  96 PC, low confidence
; Draws frame 0 of an animation
;-----------------------------------------------------------------------------
DrawFrameAt:
        push esi
        push edi
        enter 4, 0
        mov esi, edx
        movsx edi, word [byte edx+08h]
        movsx edx, word [byte edx+0Ah]
        mov word [byte esi+0Ah], 0
        mov dword [byte ebp-04h], edx
        mov dx, word [byte esi+0Ah]
        mov word [byte esi+08h], dx
        mov edx, esi
        call DrawArtAaScaledInt
        mov eax, dword [byte ebp-04h]
        mov word [byte esi+08h], di
        mov word [byte esi+0Ah], ax
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; FindNearest                                     642CD  96 PC, low confidence
; The index of the largest value under a limit in a table
;-----------------------------------------------------------------------------
FindNearest:
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        push edx
        test ebx, ebx
        jge short .1
        mov edx, ebx
        jmp short .5
.1:
        mov edx, 0FFFFFFFFh
        xor ecx, ecx
.2:
        cmp ecx, dword [byte ebp-08h]
        jge short .5
        cmp ebx, dword [eax]
        jle short .4
        test edx, edx
        jl short .3
        mov esi, edx
        shl esi, 2
        mov edi, dword [eax]
        add esi, dword [byte ebp-04h]
        cmp edi, dword [esi]
        jle short .4
.3:
        mov edx, ecx
.4:
        add eax, byte 4
        inc ecx
        jmp short .2
.5:
        mov eax, edx
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; NearestColor                                    6430E  96 PC, low confidence
; The palette colour nearest a colour triple
;-----------------------------------------------------------------------------
NearestColor:
        push ecx
        push esi
        push edi
        enter 18h, 0
        push eax
        movzx eax, byte [ebx]
        mov dword [byte ebp-04h], eax
        movsx eax, byte [byte ebx+01h]
        mov dword [byte ebp-0Ch], eax
        movsx eax, byte [byte ebx+02h]
        mov dword [byte ebp-08h], eax
        mov eax, edx
        lea ebx, [dword edx+0300h]
        mov ecx, 7FFFFFFh
        mov dword [byte ebp-014h], ebx
.1:
        movzx esi, byte [byte eax+01h]
        movzx ebx, byte [eax]
        mov dword [byte ebp-010h], esi
        movzx esi, byte [byte eax+02h]
        sub ebx, dword [byte ebp-04h]
        mov dword [byte ebp-018h], esi
        lea esi, [ebx+ebx]
        imul ebx, esi
        cmp ebx, ecx
        jg short .2
        mov esi, dword [byte ebp-010h]
        sub esi, dword [byte ebp-0Ch]
        lea edi, [esi+esi]
        imul esi, edi
        add ebx, esi
        cmp ebx, ecx
        jg short .2
        mov esi, dword [byte ebp-018h]
        sub esi, dword [byte ebp-08h]
        lea edi, [esi+esi]
        imul esi, edi
        add ebx, esi
        cmp ebx, ecx
        jg short .2
        mov ecx, ebx
.2:
        add eax, byte 3
        cmp eax, dword [byte ebp-014h]
        jne short .1
        cmp ecx, dword [dword_11D1A4]
        jle short .3
        mov eax, dword [dword_11D1A0]
        cmp eax, dword [byte ebp-01Ch]
        jge short .3
        lea eax, [eax+eax*2]
        mov bl, byte [byte ebp-04h]
        mov byte [edx+eax], bl
        imul eax, dword [dword_11D1A0], byte 3
        mov bl, byte [byte ebp-0Ch]
        mov byte [byte edx+eax+01h], bl
        imul eax, dword [dword_11D1A0], byte 3
        add edx, eax
        mov al, byte [byte ebp-08h]
        mov byte [byte edx+02h], al
        inc dword [dword_11D1A0]
.3:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; BuildColorRemap                                 643C9  96 PC, low confidence
; Maps each colour of one palette to the nearest in another
;-----------------------------------------------------------------------------
BuildColorRemap:
        push ecx
        push esi
        push edi
        enter 28h, 0
        push eax
        mov ecx, ebx
        mov eax, edx
        mov esi, ebx
        lea edx, [dword ebx+0FFh]
        mov dword [byte ebp-014h], edx
.1:
        movzx edx, byte [eax]
        mov dword [byte ebp-0Ch], 0FFFFFFFFh
        mov dword [byte ebp-024h], edx
        movzx edx, byte [byte eax+01h]
        mov dword [byte ebp-04h], 7FFFFFFFh
        mov dword [byte ebp-010h], edx
        movzx edx, byte [byte eax+02h]
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-01Ch], edx
        mov edx, dword [byte ebp-02Ch]
.2:
        movzx edi, byte [byte edx+01h]
        movzx ebx, byte [edx]
        mov dword [byte ebp-018h], edi
        movzx edi, byte [byte edx+02h]
        sub ebx, dword [byte ebp-024h]
        mov dword [byte ebp-020h], edi
        lea edi, [ebx+ebx]
        imul ebx, edi
        cmp ebx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-018h]
        sub edi, dword [byte ebp-010h]
        mov dword [byte ebp-028h], edi
        add edi, edi
        imul edi, dword [byte ebp-028h]
        add ebx, edi
        cmp ebx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-020h]
        sub edi, dword [byte ebp-01Ch]
        mov dword [byte ebp-028h], edi
        add edi, edi
        imul edi, dword [byte ebp-028h]
        add ebx, edi
        cmp ebx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-08h]
        mov dword [byte ebp-04h], ebx
        mov dword [byte ebp-0Ch], edi
.3:
        inc dword [byte ebp-08h]
        add edx, byte 3
        cmp dword [byte ebp-08h], 0FFh
        jl short .2
        mov dl, byte [byte ebp-0Ch]
        mov byte [esi], dl
        inc esi
        add eax, byte 3
        cmp esi, dword [byte ebp-014h]
        jne near .1
        mov byte [dword ecx+0FFh], 0FFh
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; RemapScreenColors                               6448D  96 PC, low confidence
; (USETABLE): remaps a screen's colours to a shared palette (three stars,
; trophy screens)
;-----------------------------------------------------------------------------
RemapScreenColors:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 198h, 0
        sub ebp, byte 6Ah
        cmp dword [dword ebp+096h], byte 0
        je near .20
        mov eax, dword [dword ebp+092h]
        lea edi, [dword ebp+09Ah]
        mov edx, dword [dword ebp+096h]
        mov dword [dword_11D1A4], eax
        shl edx, 3
        xor eax, eax
        jmp short .2
.1:
        mov ebx, dword [edi]
        add edi, byte 4
        mov dword [byte eax+ebp-02Eh], ebx
        add eax, byte 8
        mov ebx, dword [edi]
        add edi, byte 4
        mov dword [byte eax+ebp-032h], ebx
.2:
        cmp eax, edx
        jl short .1
        mov eax, dword [dword ebp+08Eh]
        inc eax
        mov dword [byte ebp+056h], eax
        mov eax, dword [dword ebp+08Ah]
        inc eax
        mov dword [byte ebp+052h], eax
        mov eax, dword [dword ebp+08Eh]
        sub eax, dword [dword ebp+08Ah]
        inc eax
        lea eax, [eax+eax*2]
        mov dword [byte ebp+05Ah], eax
        imul eax, dword [dword ebp+08Ah], byte 3
        mov edx, dword [dword ebp+086h]
        add edx, eax
        mov dword [byte ebp+04Eh], edx
.3:
        mov eax, dword [byte ebp+052h]
        mov ecx, dword [byte ebp+05Ah]
        mov edi, dword [byte ebp+04Eh]
        mov dword [dword_11D1A0], eax
        xor eax, eax
        rep stosb
        push byte 20h
        push dword 1800h
        push str_USETABLE
        call AllocMemBlock
        mov ecx, 1800h
        mov edi, eax
        add esp, byte 0Ch
        mov dword [byte ebp+032h], eax
        xor eax, eax
        rep stosb
        mov ecx, dword [dword ebp+096h]
        mov eax, 4
        shl ecx, 2
        jmp short .5
.4:
        mov edx, dword [byte eax+ebp+02Eh]
        add eax, byte 4
        add edx, 400h
        mov dword [byte eax+ebp+02Eh], edx
.5:
        cmp eax, ecx
        jl short .4
        mov dword [byte ebp+05Eh], 0
        xor esi, esi
        xor ecx, ecx
        jmp short .10
.6:
        mov eax, dword [byte ecx+ebp-02Eh]
        movsx edi, word [byte eax+04h]
        movsx ebx, word [byte eax+06h]
        imul ebx, edi
        lea edx, [byte eax+010h]
        mov edi, esi
.7:
        dec ebx
        cmp ebx, byte 0FFFFFFFFh
        je short .9
        movzx eax, byte [edx]
        cmp eax, 0FFh
        je short .8
        shl eax, 2
        mov dword [byte ebp+04Ah], eax
        mov eax, dword [byte edi+ebp+032h]
        add eax, dword [byte ebp+04Ah]
        inc dword [eax]
.8:
        inc edx
        jmp short .7
.9:
        mov eax, dword [byte ebp-02Eh]
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+06h]
        imul eax, edx
        lea ebx, [byte eax+01h]
        mov edx, 100h
        mov eax, dword [byte edi+ebp+032h]
        call FindNearest
        mov edx, dword [byte edi+ebp+032h]
        mov dword [byte edi+ebp+01Ah], eax
        inc dword [byte ebp+05Eh]
        mov eax, dword [edx+eax*4]
        add esi, byte 4
        inc eax
        add ecx, byte 8
        mov dword [byte edi+ebp+02h], eax
.10:
        mov eax, dword [byte ebp+05Eh]
        cmp eax, dword [dword ebp+096h]
        jl short .6
        mov esi, 1
.11:
        test esi, esi
        je near .16
        xor esi, esi
        xor ecx, ecx
        xor edi, edi
        mov dword [byte ebp+066h], esi
        jmp short .15
.12:
        mov edx, 100h
        mov ebx, dword [byte edi+ebp+02h]
        mov eax, dword [byte edi+ebp+032h]
        call FindNearest
        mov dword [byte edi+ebp+01Ah], eax
        test eax, eax
        jl short .14
        mov esi, 1
        cmp eax, 0FFh
        je short .13
        cmp dword [byte edi+ebp+02h], byte 0
        jle short .13
        lea eax, [eax+eax*2]
        mov ebx, dword [byte ecx+ebp-02Ah]
        mov edx, dword [dword ebp+086h]
        add ebx, eax
        mov eax, dword [byte ebp+056h]
        call NearestColor
.13:
        mov edx, dword [byte edi+ebp+01Ah]
        mov eax, dword [byte edi+ebp+032h]
        inc dword [eax+edx*4]
        mov eax, dword [eax+edx*4]
        mov dword [byte edi+ebp+02h], eax
.14:
        inc dword [byte ebp+066h]
        add ecx, byte 8
        add edi, byte 4
.15:
        mov eax, dword [byte ebp+066h]
        cmp eax, dword [dword ebp+096h]
        jge short .11
        jmp short .12
.16:
        push dword [byte ebp+032h]
        call FreeMemBlock
        mov eax, dword [dword_11D1A0]
        add esp, byte 4
        cmp eax, dword [dword ebp+08Eh]
        jle short .17
        call SoundIdle
        add dword [dword_11D1A4], byte 2
.17:
        mov eax, dword [dword_11D1A0]
        cmp eax, dword [dword ebp+08Eh]
        jg near .3
        mov dword [byte ebp+062h], 0
        xor esi, esi
        jmp short .19
.18:
        mov ecx, 100h
        mov eax, 0FFh
        lea edi, [dword ebp-012Eh]
        lea ebx, [dword ebp-012Eh]
        rep stosb
        mov eax, dword [dword ebp+086h]
        mov edx, dword [byte esi+ebp-02Ah]
        call BuildColorRemap
        mov eax, dword [byte esi+ebp-02Eh]
        mov byte [byte ebp-02Fh], 0FFh
        movsx edx, word [byte eax+04h]
        movsx ebx, word [byte eax+06h]
        imul edx, ebx
        push edx
        lea edx, [dword ebp-012Eh]
        push edx
        add eax, byte 10h
        push eax
        inc dword [byte ebp+062h]
        add esi, byte 8
        call TranslatePixels
        add esp, byte 0Ch
.19:
        mov eax, dword [byte ebp+062h]
        cmp eax, dword [dword ebp+096h]
        jl short .18
.20:
        lea esp, [byte ebp+06Ah]
        pop ebp
        jmp near SetGraphicsMode_204
