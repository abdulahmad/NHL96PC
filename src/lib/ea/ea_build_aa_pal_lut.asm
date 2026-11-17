; EA library: BuildAaPalLut, CreateAaPalLut, BuildPaletteShadeTable, AaSetFull, AaSetHalf and 13 more.
bits 32
%include "hockey.inc"
section s_B3358 progbits alloc exec nowrite align=1
extern AaColumnCodes, AaColumnSums, AaDestHeight, AaDestWidth, AaDestX, AaDestY, AaPalLut, AaSrcHeightFixed
extern AaSrcPtr, AaSrcWidth, AaSrcWidthFixed, AaStepX, AaStepY, AaWeights, AllocMemBlock, ColourLookup
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawVideoBase, FixedInverse, PaletteShadeTable
extern ScreenWidth, str_AAPLUT
global BuildAaPalLut, CreateAaPalLut, BuildPaletteShadeTable, AaSetFullJumpTable, AaSetFull, AaSetFull_46, AaSetFull_53, AaSetFull_6B
global AaSetFull_95, AaSetFull_C7, AaSetFull_105, AaSetFull_106, AaSetFull_107, AaSetFull_108, AaSetFull_109, AaSetFull_10A
global AaSetFull_10B, AaSetFull_10C, AaSetFull_10D, AaSetFull_10E, AaSetFull_10F, AaSetFull_110, AaSetFull_111, AaSetFull_11C
global AaSetFull_166, AaSetFull_193, AaSetFull_1BF, AaSetFull_1F1, AaSetFull_237, AaSetFull_274, AaSetFull_275, AaSetFull_276
global AaSetFull_277, AaSetFull_278, AaSetFull_279, AaSetFull_27A, AaSetFull_27B, AaSetFull_27C, AaSetFull_27D, AaSetFull_27E
global AaSetFull_27F, AaSetFull_280, AaSetFull_2C9, AaSetHalfJumpTable, AaSetHalf, AaSetHalf_46, AaSetHalf_54, AaSetHalf_6D
global AaSetHalf_97, AaSetHalf_C9, AaSetHalf_107, AaSetHalf_108, AaSetHalf_109, AaSetHalf_10A, AaSetHalf_10B, AaSetHalf_10C
global AaSetHalf_10D, AaSetHalf_10E, AaSetHalf_10F, AaSetHalf_110, AaSetHalf_111, AaSetHalf_112, AaSetHalf_113, AaSetHalf_11E
global AaSetHalf_168, AaSetHalf_195, AaSetHalf_1C1, AaSetHalf_1F3, AaSetHalf_239, AaSetHalf_276, AaSetHalf_277, AaSetHalf_278
global AaSetHalf_279, AaSetHalf_27A, AaSetHalf_27B, AaSetHalf_27C, AaSetHalf_27D, AaSetHalf_27E, AaSetHalf_27F, AaSetHalf_280
global AaSetHalf_281, AaSetHalf_282, AaAddHalfJumpTable, AaAddHalf, AaAddHalf_46, AaAddHalf_54, AaAddHalf_6D, AaAddHalf_9A
global AaAddHalf_D1, AaAddHalf_117, AaAddHalf_118, AaAddHalf_119, AaAddHalf_11A, AaAddHalf_11B, AaAddHalf_11C, AaAddHalf_11D
global AaAddHalf_11E, AaAddHalf_11F, AaAddHalf_120, AaAddHalf_121, AaAddHalf_122, AaAddHalf_123, AaAddHalf_12E, AaAddHalf_180
global AaAddHalf_1A4, AaAddHalf_1D1, AaAddHalf_20B, AaAddHalf_259, AaAddHalf_2A1, AaAddHalf_2A2, AaAddHalf_2A3, AaAddHalf_2A4
global AaAddHalf_2A5, AaAddHalf_2A6, AaAddHalf_2A7, AaAddHalf_2A8, AaAddHalf_2A9, AaAddHalf_2AA, AaAddHalf_2AB, AaAddHalf_2AC
global AaAddHalf_2AD, AaSetQuarterJumpTable, AaSetQuarter, AaSetQuarter_46, AaSetQuarter_54, AaSetQuarter_6D, AaSetQuarter_97, AaSetQuarter_C9
global AaSetQuarter_107, AaSetQuarter_108, AaSetQuarter_109, AaSetQuarter_10A, AaSetQuarter_10B, AaSetQuarter_10C, AaSetQuarter_10D, AaSetQuarter_10E
global AaSetQuarter_10F, AaSetQuarter_110, AaSetQuarter_111, AaSetQuarter_112, AaSetQuarter_113, AaSetQuarter_11E, AaSetQuarter_168, AaSetQuarter_195
global AaSetQuarter_1C1, AaSetQuarter_1F3, AaSetQuarter_239, AaSetQuarter_276, AaSetQuarter_277, AaSetQuarter_278, AaSetQuarter_279, AaSetQuarter_27A
global AaSetQuarter_27B, AaSetQuarter_27C, AaSetQuarter_27D, AaSetQuarter_27E, AaSetQuarter_27F, AaSetQuarter_280, AaSetQuarter_281, AaSetQuarter_282
global AaAddQuarterJumpTable, AaAddQuarter, AaAddQuarter_46, AaAddQuarter_54, AaAddQuarter_6D, AaAddQuarter_9A, AaAddQuarter_D1, AaAddQuarter_117
global AaAddQuarter_118, AaAddQuarter_119, AaAddQuarter_11A, AaAddQuarter_11B, AaAddQuarter_11C, AaAddQuarter_11D, AaAddQuarter_11E, AaAddQuarter_11F
global AaAddQuarter_120, AaAddQuarter_121, AaAddQuarter_122, AaAddQuarter_123, AaAddQuarter_12E, AaAddQuarter_180, AaAddQuarter_1A4, AaAddQuarter_1D1
global AaAddQuarter_20B, AaAddQuarter_259, AaAddQuarter_2A1, AaAddQuarter_2A2, AaAddQuarter_2A3, AaAddQuarter_2A4, AaAddQuarter_2A5, AaAddQuarter_2A6
global AaAddQuarter_2A7, AaAddQuarter_2A8, AaAddQuarter_2A9, AaAddQuarter_2AA, AaAddQuarter_2AB, AaAddQuarter_2AC, AaAddQuarter_2AD, AaSetThirdJumpTable
global AaSetThird, AaSetThird_46, AaSetThird_54, AaSetThird_6D, AaSetThird_97, AaSetThird_C9, AaSetThird_107, AaSetThird_108
global AaSetThird_109, AaSetThird_10A, AaSetThird_10B, AaSetThird_10C, AaSetThird_10D, AaSetThird_10E, AaSetThird_10F, AaSetThird_110
global AaSetThird_111, AaSetThird_112, AaSetThird_113, AaSetThird_11E, AaSetThird_168, AaSetThird_195, AaSetThird_1C1, AaSetThird_1F3
global AaSetThird_239, AaSetThird_276, AaSetThird_277, AaSetThird_278, AaSetThird_279, AaSetThird_27A, AaSetThird_27B, AaSetThird_27C
global AaSetThird_27D, AaSetThird_27E, AaSetThird_27F, AaSetThird_280, AaSetThird_281, AaSetThird_282, AaAddThirdJumpTable, AaAddThird
global AaAddThird_46, AaAddThird_54, AaAddThird_6D, AaAddThird_9A, AaAddThird_D1, AaAddThird_117, AaAddThird_118, AaAddThird_119
global AaAddThird_11A, AaAddThird_11B, AaAddThird_11C, AaAddThird_11D, AaAddThird_11E, AaAddThird_11F, AaAddThird_120, AaAddThird_121
global AaAddThird_122, AaAddThird_123, AaAddThird_12E, AaAddThird_180, AaAddThird_1A4, AaAddThird_1D1, AaAddThird_20B, AaAddThird_259
global AaAddThird_2A1, AaAddThird_2A2, AaAddThird_2A3, AaAddThird_2A4, AaAddThird_2A5, AaAddThird_2A6, AaAddThird_2A7, AaAddThird_2A8
global AaAddThird_2A9, AaAddThird_2AA, AaAddThird_2AB, AaAddThird_2AC, AaAddThird_2AD, AaSetTwoThirdsJumpTable, AaSetTwoThirds, AaSetTwoThirds_46
global AaSetTwoThirds_54, AaSetTwoThirds_6D, AaSetTwoThirds_97, AaSetTwoThirds_C9, AaSetTwoThirds_107, AaSetTwoThirds_108, AaSetTwoThirds_109, AaSetTwoThirds_10A
global AaSetTwoThirds_10B, AaSetTwoThirds_10C, AaSetTwoThirds_10D, AaSetTwoThirds_10E, AaSetTwoThirds_10F, AaSetTwoThirds_110, AaSetTwoThirds_111, AaSetTwoThirds_112
global AaSetTwoThirds_113, AaSetTwoThirds_11E, AaSetTwoThirds_168, AaSetTwoThirds_195, AaSetTwoThirds_1C1, AaSetTwoThirds_1F3, AaSetTwoThirds_239, AaSetTwoThirds_276
global AaSetTwoThirds_277, AaSetTwoThirds_278, AaSetTwoThirds_279, AaSetTwoThirds_27A, AaSetTwoThirds_27B, AaSetTwoThirds_27C, AaSetTwoThirds_27D, AaSetTwoThirds_27E
global AaSetTwoThirds_27F, AaSetTwoThirds_280, AaSetTwoThirds_281, AaSetTwoThirds_282, AaAddTwoThirdsJumpTable, AaAddTwoThirds, AaAddTwoThirds_46, AaAddTwoThirds_54
global AaAddTwoThirds_6D, AaAddTwoThirds_9A, AaAddTwoThirds_D1, AaAddTwoThirds_117, AaAddTwoThirds_118, AaAddTwoThirds_119, AaAddTwoThirds_11A, AaAddTwoThirds_11B
global AaAddTwoThirds_11C, AaAddTwoThirds_11D, AaAddTwoThirds_11E, AaAddTwoThirds_11F, AaAddTwoThirds_120, AaAddTwoThirds_121, AaAddTwoThirds_122, AaAddTwoThirds_123
global AaAddTwoThirds_12E, AaAddTwoThirds_180, AaAddTwoThirds_1A4, AaAddTwoThirds_1D1, AaAddTwoThirds_20B, AaAddTwoThirds_259, AaAddTwoThirds_2A1, AaAddTwoThirds_2A2
global AaAddTwoThirds_2A3, AaAddTwoThirds_2A4, AaAddTwoThirds_2A5, AaAddTwoThirds_2A6, AaAddTwoThirds_2A7, AaAddTwoThirds_2A8, AaAddTwoThirds_2A9, AaAddTwoThirds_2AA
global AaAddTwoThirds_2AB, AaAddTwoThirds_2AC, AaAddTwoThirds_2AD, AaBuildColumnSteps, SetAaPalLut, AaRowStepJumpTable, AaRowStepLastJumpTable, AaDrawScaledArt
global AaDrawScaledArt_1CA, AaDrawScaledArt_1D4, AaDrawScaledArt_1F7, AaDrawScaledArt_211, AaDrawScaledArt_244, AaDrawScaledArt_26E, AaDrawScaledArt_2B1, AaDrawScaledArt_2D6
global AaDrawScaledArt_2DB, AaDrawScaledArt_2E6, AaDrawScaledArt_2F1, AaDrawScaledArt_2FC, AaDrawScaledArt_307, AaDrawScaledArt_312, AaDrawScaledArt_31D, AaDrawScaledArt_328
global AaDrawScaledArt_333, AaDrawScaledArt_33E, AaDrawScaledArt_349, AaDrawScaledArt_354, AaDrawScaledArt_3A1, AaDrawScaledArt_3A6, AaDrawScaledArt_3B1, AaDrawScaledArt_3BC
global AaDrawScaledArt_3C7, AaDrawScaledArt_3D2, AaDrawScaledArt_3DD, AaDrawScaledArt_3E8, AaDrawScaledArt_3F3, AaDrawScaledArt_3FE, AaDrawScaledArt_409, AaDrawScaledArt_414
global AaDrawScaledArt_41F, AaDrawScaledArt_474, AaDrawScaledArt_487, AaDrawScaledArt_491, AaDrawScaledArt_4BC, AaDrawScaledArt_4D6, AaDrawScaledArt_511, AaDrawScaledArt_516
global AaDrawScaledArt_521, AaDrawScaledArt_52C, AaDrawScaledArt_537, AaDrawScaledArt_542, AaDrawScaledArt_54D, AaDrawScaledArt_558, AaDrawScaledArt_563, AaDrawScaledArt_56E
global AaDrawScaledArt_579, AaDrawScaledArt_584, AaDrawScaledArt_58F, AaDrawScaledArt_5D5, AaDrawScaledArt_5DA, AaDrawScaledArt_5E5, AaDrawScaledArt_5F0, AaDrawScaledArt_5FB
global AaDrawScaledArt_606, AaDrawScaledArt_611, AaDrawScaledArt_61C, AaDrawScaledArt_627, AaDrawScaledArt_632, AaDrawScaledArt_63D, AaDrawScaledArt_648, AaDrawScaledArt_653
global DrawArtAaScaledInt, DrawArtAaScaled, DrawArtAaScaledXY
        db 00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; BuildAaPalLut                                   B3360  96 PC, low confidence
; Builds the anti-aliasing palette table: for each colour, its RGB at each of
; the twelve weights
;-----------------------------------------------------------------------------
BuildAaPalLut:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov ebx, eax
        mov ebp, edx
        lea eax, [dword edx+0400h]
        mov esi, edx
        lea edi, [dword edx+03FCh]
.1:
        xor edx, edx
        mov dword [esi], eax
.2:
        xor ecx, ecx
        mov cl, byte [ebx]
        shl ecx, 2
        imul ecx, dword [dword edx+AaWeights]
        sar ecx, 10h
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte eax+02h], cl
        xor ecx, ecx
        mov cl, byte [byte ebx+01h]
        shl ecx, 2
        imul ecx, dword [dword edx+AaWeights]
        sar ecx, 10h
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte eax+01h], cl
        xor ecx, ecx
        mov cl, byte [byte ebx+02h]
        shl ecx, 2
        imul ecx, dword [dword edx+AaWeights]
        sar ecx, 10h
        add eax, byte 4
        mov dword [esp], ecx
        mov byte [byte eax-01h], 0
        mov cl, byte [esp]
        add edx, byte 4
        mov byte [byte eax-04h], cl
        cmp edx, byte 30h
        jne short .2
        add esi, byte 4
        add ebx, byte 3
        cmp esi, edi
        jne short .1
        mov edx, ebp
        mov dword [dword ebp+03FCh], eax
        xor edx, ebp
.3:
        mov byte [eax], 0
        mov bl, byte [eax]
        mov byte [byte eax+01h], bl
        mov byte [byte eax+02h], bl
        imul ebx, dword [dword edx+AaWeights], dword 0FFh
        add eax, byte 4
        sar ebx, 10h
        add edx, byte 4
        mov byte [byte eax-01h], bl
        cmp edx, byte 30h
        jne short .3
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CreateAaPalLut                                  B3420  96 PC, low confidence
; Allocates the anti-aliasing palette table ("AAPLUT") and builds it from a
; palette
;-----------------------------------------------------------------------------
CreateAaPalLut:
        push ecx
        push esi
        push edi
        mov esi, eax
        mov edi, edx
        push ebx
        push dword 3400h
        push str_AAPLUT
        call AllocMemBlock
        add esp, byte 0Ch
        mov edx, eax
        mov dword [edi], eax
        mov eax, esi
        call BuildAaPalLut
        pop edi
        pop esi
        pop ecx
        ret
        db 08Dh,040h,00h
        shl edx, 2
        add edx, eax
        mov eax, dword [eax+ebx*4]
        mov dword [edx], eax
        ret
        db 090h
;-----------------------------------------------------------------------------
; BuildPaletteShadeTable                          B3458  96 PC, low confidence
; Builds 16 shade levels of a 256 colour palette
;-----------------------------------------------------------------------------
BuildPaletteShadeTable:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        sub esp, byte 8
        mov dword [byte esp+04h], eax
        mov edx, PaletteShadeTable
        xor ebx, ebx
        xor edi, edi
.1:
        mov eax, dword [byte esp+04h]
        xor esi, esi
.2:
        xor ecx, ecx
        mov cl, byte [eax]
        shl ecx, 2
        imul ecx, ebx
        sar ecx, 8
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte edx+02h], cl
        xor ecx, ecx
        mov cl, byte [byte eax+01h]
        shl ecx, 2
        imul ecx, ebx
        sar ecx, 8
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte edx+01h], cl
        xor ecx, ecx
        mov cl, byte [byte eax+02h]
        shl ecx, 2
        imul ecx, ebx
        add eax, byte 3
        inc esi
        sar ecx, 8
        add edx, byte 4
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte edx-04h], cl
        cmp esi, 100h
        jl short .2
        inc edi
        add ebx, byte 10h
        cmp edi, byte 10h
        jl short .1
        add esp, byte 8
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
AaSetFullJumpTable:                             ; jump table for the switch cases of AaSetFull
        dd AaSetFull_46
        dd AaSetFull_53
        dd AaSetFull_6B
        dd AaSetFull_95
        dd AaSetFull_C7
        dd AaSetFull_11C
        dd AaSetFull_11C
        dd AaSetFull_111
        dd AaSetFull_111
        dd AaSetFull_110
        dd AaSetFull_110
        dd AaSetFull_10F
        dd AaSetFull_10F
        dd AaSetFull_10E
        dd AaSetFull_10E
        dd AaSetFull_10D
        dd AaSetFull_10D
        dd AaSetFull_10C
        dd AaSetFull_10C
        dd AaSetFull_10B
        dd AaSetFull_10B
        dd AaSetFull_10A
        dd AaSetFull_10A
        dd AaSetFull_109
        dd AaSetFull_109
        dd AaSetFull_108
        dd AaSetFull_108
        dd AaSetFull_107
        dd AaSetFull_107
        dd AaSetFull_106
        dd AaSetFull_106
        dd AaSetFull_105
        dd AaSetFull_105
        dd AaSetFull_46
        dd AaSetFull_46
        dd AaSetFull_53
        dd AaSetFull_166
        dd AaSetFull_193
        dd AaSetFull_1BF
        dd AaSetFull_1F1
        dd AaSetFull_237
        dd AaSetFull_280
        dd AaSetFull_27F
        dd AaSetFull_27F
        dd AaSetFull_27E
        dd AaSetFull_27E
        dd AaSetFull_27D
        dd AaSetFull_27D
        dd AaSetFull_27C
        dd AaSetFull_27C
        dd AaSetFull_27B
        dd AaSetFull_27B
        dd AaSetFull_27A
        dd AaSetFull_27A
        dd AaSetFull_279
        dd AaSetFull_279
        dd AaSetFull_278
        dd AaSetFull_278
        dd AaSetFull_277
        dd AaSetFull_277
        dd AaSetFull_276
        dd AaSetFull_276
        dd AaSetFull_275
        dd AaSetFull_275
        dd AaSetFull_274
        dd AaSetFull_274
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaSetFull                                       B35E4  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and stores each pixel's
; full weight colour sums
;-----------------------------------------------------------------------------
AaSetFull:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov edx, dword [edx+ebx]
        xor ebx, ebx
.1:
        mov ecx, dword [dword ebx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaSetFull_280.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaSetFullJumpTable]
AaSetFull_46:
        mov ecx, dword [edx]
        mov dword [dword ebx+AaColumnSums], ecx
        add ebx, byte 4
        jmp short AaSetFull.1
AaSetFull_53:
        mov eax, dword [edx]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp short AaSetFull.1
AaSetFull_6B:
        mov eax, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+08h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp short AaSetFull.1
AaSetFull_95:
        mov eax, dword [byte edx+010h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+04h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_C7:
        mov eax, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov ecx, dword [byte edx+014h]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_105:
        inc eax
AaSetFull_106:
        inc eax
AaSetFull_107:
        inc eax
AaSetFull_108:
        inc eax
AaSetFull_109:
        inc eax
AaSetFull_10A:
        inc eax
AaSetFull_10B:
        inc eax
AaSetFull_10C:
        inc eax
AaSetFull_10D:
        inc eax
AaSetFull_10E:
        inc eax
AaSetFull_10F:
        inc eax
AaSetFull_110:
        inc eax
AaSetFull_111:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
AaSetFull_11C:
        mov edx, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 2
        mov edx, dword [byte edx+014h]
        lea esi, [edx+ebp]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_166:
        mov eax, dword [byte edx+04h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+010h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_193:
        mov eax, dword [byte edx+08h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+08h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_1BF:
        mov eax, dword [byte edx+08h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_1F1:
        mov eax, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+08h]
        xor eax, eax
        mov dword [dword ebx+AaColumnSums], ebp
        mov al, byte [esi]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+014h]
        lea edx, [eax+ebp]
        lea eax, [byte esi+01h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_237:
        mov eax, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+08h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov eax, esi
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+014h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_274:
        inc eax
AaSetFull_275:
        inc eax
AaSetFull_276:
        inc eax
AaSetFull_277:
        inc eax
AaSetFull_278:
        inc eax
AaSetFull_279:
        inc eax
AaSetFull_27A:
        inc eax
AaSetFull_27B:
        inc eax
AaSetFull_27C:
        inc eax
AaSetFull_27D:
        inc eax
AaSetFull_27E:
        inc eax
AaSetFull_27F:
        inc eax
AaSetFull_280:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov edx, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        add esi, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+03h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 3
        mov ecx, dword [byte edx+014h]
        lea ebp, [esi+ecx]
        mov dword [dword ebx+AaColumnSums], ebp
.2:
        add ebx, byte 4
        jmp near AaSetFull.1
AaSetFull_2C9:
        mov dword [AaPalLut], edi
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Bh,0C0h
AaSetHalfJumpTable:                             ; jump table for the switch cases of AaSetHalf
        dd AaSetHalf_46
        dd AaSetHalf_54
        dd AaSetHalf_6D
        dd AaSetHalf_97
        dd AaSetHalf_C9
        dd AaSetHalf_11E
        dd AaSetHalf_11E
        dd AaSetHalf_113
        dd AaSetHalf_113
        dd AaSetHalf_112
        dd AaSetHalf_112
        dd AaSetHalf_111
        dd AaSetHalf_111
        dd AaSetHalf_110
        dd AaSetHalf_110
        dd AaSetHalf_10F
        dd AaSetHalf_10F
        dd AaSetHalf_10E
        dd AaSetHalf_10E
        dd AaSetHalf_10D
        dd AaSetHalf_10D
        dd AaSetHalf_10C
        dd AaSetHalf_10C
        dd AaSetHalf_10B
        dd AaSetHalf_10B
        dd AaSetHalf_10A
        dd AaSetHalf_10A
        dd AaSetHalf_109
        dd AaSetHalf_109
        dd AaSetHalf_108
        dd AaSetHalf_108
        dd AaSetHalf_107
        dd AaSetHalf_107
        dd AaSetHalf_46
        dd AaSetHalf_46
        dd AaSetHalf_54
        dd AaSetHalf_168
        dd AaSetHalf_195
        dd AaSetHalf_1C1
        dd AaSetHalf_1F3
        dd AaSetHalf_239
        dd AaSetHalf_282
        dd AaSetHalf_281
        dd AaSetHalf_281
        dd AaSetHalf_280
        dd AaSetHalf_280
        dd AaSetHalf_27F
        dd AaSetHalf_27F
        dd AaSetHalf_27E
        dd AaSetHalf_27E
        dd AaSetHalf_27D
        dd AaSetHalf_27D
        dd AaSetHalf_27C
        dd AaSetHalf_27C
        dd AaSetHalf_27B
        dd AaSetHalf_27B
        dd AaSetHalf_27A
        dd AaSetHalf_27A
        dd AaSetHalf_279
        dd AaSetHalf_279
        dd AaSetHalf_278
        dd AaSetHalf_278
        dd AaSetHalf_277
        dd AaSetHalf_277
        dd AaSetHalf_276
        dd AaSetHalf_276
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaSetHalf                                       B39C8  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and stores half weight
; colour sums
;-----------------------------------------------------------------------------
AaSetHalf:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov edx, dword [edx+ebx]
        xor ebx, ebx
.1:
        mov ecx, dword [dword ebx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaSetHalf_282.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaSetHalfJumpTable]
AaSetHalf_46:
        mov ecx, dword [byte edx+08h]
        mov dword [dword ebx+AaColumnSums], ecx
        add ebx, byte 4
        jmp short AaSetHalf.1
AaSetHalf_54:
        mov eax, dword [byte edx+08h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp short AaSetHalf.1
AaSetHalf_6D:
        mov eax, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+014h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp short AaSetHalf.1
AaSetHalf_97:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_C9:
        mov eax, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov ecx, dword [byte edx+020h]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_107:
        inc eax
AaSetHalf_108:
        inc eax
AaSetHalf_109:
        inc eax
AaSetHalf_10A:
        inc eax
AaSetHalf_10B:
        inc eax
AaSetHalf_10C:
        inc eax
AaSetHalf_10D:
        inc eax
AaSetHalf_10E:
        inc eax
AaSetHalf_10F:
        inc eax
AaSetHalf_110:
        inc eax
AaSetHalf_111:
        inc eax
AaSetHalf_112:
        inc eax
AaSetHalf_113:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
AaSetHalf_11E:
        mov edx, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 2
        mov edx, dword [byte edx+020h]
        lea esi, [edx+ebp]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_168:
        mov eax, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+01Ch]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_195:
        mov eax, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+014h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_1C1:
        mov eax, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_1F3:
        mov eax, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+014h]
        xor eax, eax
        mov dword [dword ebx+AaColumnSums], ebp
        mov al, byte [esi]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+020h]
        lea edx, [eax+ebp]
        lea eax, [byte esi+01h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_239:
        mov eax, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+014h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov eax, esi
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+020h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetHalf.1
AaSetHalf_276:
        inc eax
AaSetHalf_277:
        inc eax
AaSetHalf_278:
        inc eax
AaSetHalf_279:
        inc eax
AaSetHalf_27A:
        inc eax
AaSetHalf_27B:
        inc eax
AaSetHalf_27C:
        inc eax
AaSetHalf_27D:
        inc eax
AaSetHalf_27E:
        inc eax
AaSetHalf_27F:
        inc eax
AaSetHalf_280:
        inc eax
AaSetHalf_281:
        inc eax
AaSetHalf_282:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov edx, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        add esi, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+03h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 3
        mov ecx, dword [byte edx+020h]
        lea ebp, [esi+ecx]
        mov dword [dword ebx+AaColumnSums], ebp
.2:
        add ebx, byte 4
        jmp near AaSetHalf.1
        db 090h
AaAddHalfJumpTable:                             ; jump table for the switch cases of AaAddHalf
        dd AaAddHalf_46
        dd AaAddHalf_54
        dd AaAddHalf_6D
        dd AaAddHalf_9A
        dd AaAddHalf_D1
        dd AaAddHalf_12E
        dd AaAddHalf_12E
        dd AaAddHalf_123
        dd AaAddHalf_123
        dd AaAddHalf_122
        dd AaAddHalf_122
        dd AaAddHalf_121
        dd AaAddHalf_121
        dd AaAddHalf_120
        dd AaAddHalf_120
        dd AaAddHalf_11F
        dd AaAddHalf_11F
        dd AaAddHalf_11E
        dd AaAddHalf_11E
        dd AaAddHalf_11D
        dd AaAddHalf_11D
        dd AaAddHalf_11C
        dd AaAddHalf_11C
        dd AaAddHalf_11B
        dd AaAddHalf_11B
        dd AaAddHalf_11A
        dd AaAddHalf_11A
        dd AaAddHalf_119
        dd AaAddHalf_119
        dd AaAddHalf_118
        dd AaAddHalf_118
        dd AaAddHalf_117
        dd AaAddHalf_117
        dd AaAddHalf_46
        dd AaAddHalf_46
        dd AaAddHalf_180
        dd AaAddHalf_1A4
        dd AaAddHalf_1D1
        dd AaAddHalf_1D1
        dd AaAddHalf_20B
        dd AaAddHalf_259
        dd AaAddHalf_2AD
        dd AaAddHalf_2AC
        dd AaAddHalf_2AC
        dd AaAddHalf_2AB
        dd AaAddHalf_2AB
        dd AaAddHalf_2AA
        dd AaAddHalf_2AA
        dd AaAddHalf_2A9
        dd AaAddHalf_2A9
        dd AaAddHalf_2A8
        dd AaAddHalf_2A8
        dd AaAddHalf_2A7
        dd AaAddHalf_2A7
        dd AaAddHalf_2A6
        dd AaAddHalf_2A6
        dd AaAddHalf_2A5
        dd AaAddHalf_2A5
        dd AaAddHalf_2A4
        dd AaAddHalf_2A4
        dd AaAddHalf_2A3
        dd AaAddHalf_2A3
        dd AaAddHalf_2A2
        dd AaAddHalf_2A2
        dd AaAddHalf_2A1
        dd AaAddHalf_2A1
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaAddHalf                                       B3DA0  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and adds half weight colour
; sums
;-----------------------------------------------------------------------------
AaAddHalf:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov ebx, dword [edx+ebx]
        xor edx, edi
.1:
        mov ecx, dword [dword edx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaAddHalf_2AD.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaAddHalfJumpTable]
AaAddHalf_46:
        mov ecx, dword [byte ebx+08h]
        add dword [dword edx+AaColumnSums], ecx
        add edx, byte 4
        jmp short AaAddHalf.1
AaAddHalf_54:
        mov eax, dword [byte ebx+08h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp short AaAddHalf.1
AaAddHalf_6D:
        mov eax, dword [byte ebx+014h]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+014h]
        lea ebp, [esi+ecx]
        mov dword [dword edx+AaColumnSums], ebp
        add edx, byte 4
        jmp short AaAddHalf.1
AaAddHalf_9A:
        mov eax, dword [byte ebx+01Ch]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+010h]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_D1:
        mov eax, dword [byte ebx+020h]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+014h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+020h]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_117:
        inc eax
AaAddHalf_118:
        inc eax
AaAddHalf_119:
        inc eax
AaAddHalf_11A:
        inc eax
AaAddHalf_11B:
        inc eax
AaAddHalf_11C:
        inc eax
AaAddHalf_11D:
        inc eax
AaAddHalf_11E:
        inc eax
AaAddHalf_11F:
        inc eax
AaAddHalf_120:
        inc eax
AaAddHalf_121:
        inc eax
AaAddHalf_122:
        inc eax
AaAddHalf_123:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
AaAddHalf_12E:
        mov ebx, dword [byte ebx+020h]
        mov ecx, dword [dword edx+AaColumnSums]
        add ecx, ebx
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ecx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+014h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 2
        mov ebx, dword [byte ebx+020h]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_180:
        mov eax, dword [byte ebx+08h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_1A4:
        mov eax, dword [byte ebx+010h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+01Ch]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_1D1:
        mov eax, dword [byte ebx+014h]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+014h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_20B:
        mov eax, dword [byte ebx+020h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+014h]
        lea ebx, [eax+ebp]
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [esi]
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+020h]
        lea eax, [byte esi+01h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [eax]
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_259:
        mov eax, dword [byte ebx+020h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+014h]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov eax, esi
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+020h]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddHalf.1
AaAddHalf_2A1:
        inc eax
AaAddHalf_2A2:
        inc eax
AaAddHalf_2A3:
        inc eax
AaAddHalf_2A4:
        inc eax
AaAddHalf_2A5:
        inc eax
AaAddHalf_2A6:
        inc eax
AaAddHalf_2A7:
        inc eax
AaAddHalf_2A8:
        inc eax
AaAddHalf_2A9:
        inc eax
AaAddHalf_2AA:
        inc eax
AaAddHalf_2AB:
        inc eax
AaAddHalf_2AC:
        inc eax
AaAddHalf_2AD:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+020h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        mov ebx, dword [byte ebx+014h]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+03h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 3
        mov ecx, dword [byte ebx+020h]
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
.2:
        add edx, byte 4
        jmp near AaAddHalf.1
        db 08Dh,040h,00h
AaSetQuarterJumpTable:                          ; jump table for the switch cases of AaSetQuarter
        dd AaSetQuarter_46
        dd AaSetQuarter_54
        dd AaSetQuarter_6D
        dd AaSetQuarter_97
        dd AaSetQuarter_C9
        dd AaSetQuarter_11E
        dd AaSetQuarter_11E
        dd AaSetQuarter_113
        dd AaSetQuarter_113
        dd AaSetQuarter_112
        dd AaSetQuarter_112
        dd AaSetQuarter_111
        dd AaSetQuarter_111
        dd AaSetQuarter_110
        dd AaSetQuarter_110
        dd AaSetQuarter_10F
        dd AaSetQuarter_10F
        dd AaSetQuarter_10E
        dd AaSetQuarter_10E
        dd AaSetQuarter_10D
        dd AaSetQuarter_10D
        dd AaSetQuarter_10C
        dd AaSetQuarter_10C
        dd AaSetQuarter_10B
        dd AaSetQuarter_10B
        dd AaSetQuarter_10A
        dd AaSetQuarter_10A
        dd AaSetQuarter_109
        dd AaSetQuarter_109
        dd AaSetQuarter_108
        dd AaSetQuarter_108
        dd AaSetQuarter_107
        dd AaSetQuarter_107
        dd AaSetQuarter_46
        dd AaSetQuarter_46
        dd AaSetQuarter_54
        dd AaSetQuarter_168
        dd AaSetQuarter_195
        dd AaSetQuarter_1C1
        dd AaSetQuarter_1F3
        dd AaSetQuarter_239
        dd AaSetQuarter_282
        dd AaSetQuarter_281
        dd AaSetQuarter_281
        dd AaSetQuarter_280
        dd AaSetQuarter_280
        dd AaSetQuarter_27F
        dd AaSetQuarter_27F
        dd AaSetQuarter_27E
        dd AaSetQuarter_27E
        dd AaSetQuarter_27D
        dd AaSetQuarter_27D
        dd AaSetQuarter_27C
        dd AaSetQuarter_27C
        dd AaSetQuarter_27B
        dd AaSetQuarter_27B
        dd AaSetQuarter_27A
        dd AaSetQuarter_27A
        dd AaSetQuarter_279
        dd AaSetQuarter_279
        dd AaSetQuarter_278
        dd AaSetQuarter_278
        dd AaSetQuarter_277
        dd AaSetQuarter_277
        dd AaSetQuarter_276
        dd AaSetQuarter_276
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaSetQuarter                                    B41A8  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and stores quarter weight
; colour sums
;-----------------------------------------------------------------------------
AaSetQuarter:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov edx, dword [edx+ebx]
        xor ebx, ebx
.1:
        mov ecx, dword [dword ebx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaSetQuarter_282.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaSetQuarterJumpTable]
AaSetQuarter_46:
        mov ecx, dword [byte edx+014h]
        mov dword [dword ebx+AaColumnSums], ecx
        add ebx, byte 4
        jmp short AaSetQuarter.1
AaSetQuarter_54:
        mov eax, dword [byte edx+014h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp short AaSetQuarter.1
AaSetQuarter_6D:
        mov eax, dword [byte edx+020h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+020h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp short AaSetQuarter.1
AaSetQuarter_97:
        mov eax, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_C9:
        mov eax, dword [byte edx+02Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+020h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov ecx, dword [byte edx+02Ch]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_107:
        inc eax
AaSetQuarter_108:
        inc eax
AaSetQuarter_109:
        inc eax
AaSetQuarter_10A:
        inc eax
AaSetQuarter_10B:
        inc eax
AaSetQuarter_10C:
        inc eax
AaSetQuarter_10D:
        inc eax
AaSetQuarter_10E:
        inc eax
AaSetQuarter_10F:
        inc eax
AaSetQuarter_110:
        inc eax
AaSetQuarter_111:
        inc eax
AaSetQuarter_112:
        inc eax
AaSetQuarter_113:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
AaSetQuarter_11E:
        mov edx, dword [byte edx+02Ch]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+020h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 2
        mov edx, dword [byte edx+02Ch]
        lea esi, [edx+ebp]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_168:
        mov eax, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+028h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_195:
        mov eax, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+020h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_1C1:
        mov eax, dword [byte edx+020h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+020h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_1F3:
        mov eax, dword [byte edx+02Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+020h]
        xor eax, eax
        mov dword [dword ebx+AaColumnSums], ebp
        mov al, byte [esi]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+02Ch]
        lea edx, [eax+ebp]
        lea eax, [byte esi+01h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_239:
        mov eax, dword [byte edx+02Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+020h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov eax, esi
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+02Ch]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetQuarter.1
AaSetQuarter_276:
        inc eax
AaSetQuarter_277:
        inc eax
AaSetQuarter_278:
        inc eax
AaSetQuarter_279:
        inc eax
AaSetQuarter_27A:
        inc eax
AaSetQuarter_27B:
        inc eax
AaSetQuarter_27C:
        inc eax
AaSetQuarter_27D:
        inc eax
AaSetQuarter_27E:
        inc eax
AaSetQuarter_27F:
        inc eax
AaSetQuarter_280:
        inc eax
AaSetQuarter_281:
        inc eax
AaSetQuarter_282:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov edx, dword [byte edx+02Ch]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        add esi, dword [byte edx+020h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+03h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 3
        mov ecx, dword [byte edx+02Ch]
        lea ebp, [esi+ecx]
        mov dword [dword ebx+AaColumnSums], ebp
.2:
        add ebx, byte 4
        jmp near AaSetQuarter.1
        db 090h
AaAddQuarterJumpTable:                          ; jump table for the switch cases of AaAddQuarter
        dd AaAddQuarter_46
        dd AaAddQuarter_54
        dd AaAddQuarter_6D
        dd AaAddQuarter_9A
        dd AaAddQuarter_D1
        dd AaAddQuarter_12E
        dd AaAddQuarter_12E
        dd AaAddQuarter_123
        dd AaAddQuarter_123
        dd AaAddQuarter_122
        dd AaAddQuarter_122
        dd AaAddQuarter_121
        dd AaAddQuarter_121
        dd AaAddQuarter_120
        dd AaAddQuarter_120
        dd AaAddQuarter_11F
        dd AaAddQuarter_11F
        dd AaAddQuarter_11E
        dd AaAddQuarter_11E
        dd AaAddQuarter_11D
        dd AaAddQuarter_11D
        dd AaAddQuarter_11C
        dd AaAddQuarter_11C
        dd AaAddQuarter_11B
        dd AaAddQuarter_11B
        dd AaAddQuarter_11A
        dd AaAddQuarter_11A
        dd AaAddQuarter_119
        dd AaAddQuarter_119
        dd AaAddQuarter_118
        dd AaAddQuarter_118
        dd AaAddQuarter_117
        dd AaAddQuarter_117
        dd AaAddQuarter_46
        dd AaAddQuarter_46
        dd AaAddQuarter_180
        dd AaAddQuarter_1A4
        dd AaAddQuarter_1D1
        dd AaAddQuarter_1D1
        dd AaAddQuarter_20B
        dd AaAddQuarter_259
        dd AaAddQuarter_2AD
        dd AaAddQuarter_2AC
        dd AaAddQuarter_2AC
        dd AaAddQuarter_2AB
        dd AaAddQuarter_2AB
        dd AaAddQuarter_2AA
        dd AaAddQuarter_2AA
        dd AaAddQuarter_2A9
        dd AaAddQuarter_2A9
        dd AaAddQuarter_2A8
        dd AaAddQuarter_2A8
        dd AaAddQuarter_2A7
        dd AaAddQuarter_2A7
        dd AaAddQuarter_2A6
        dd AaAddQuarter_2A6
        dd AaAddQuarter_2A5
        dd AaAddQuarter_2A5
        dd AaAddQuarter_2A4
        dd AaAddQuarter_2A4
        dd AaAddQuarter_2A3
        dd AaAddQuarter_2A3
        dd AaAddQuarter_2A2
        dd AaAddQuarter_2A2
        dd AaAddQuarter_2A1
        dd AaAddQuarter_2A1
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaAddQuarter                                    B4580  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and adds quarter weight
; colour sums
;-----------------------------------------------------------------------------
AaAddQuarter:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov ebx, dword [edx+ebx]
        xor edx, edi
.1:
        mov ecx, dword [dword edx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaAddQuarter_2AD.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaAddQuarterJumpTable]
AaAddQuarter_46:
        mov ecx, dword [byte ebx+014h]
        add dword [dword edx+AaColumnSums], ecx
        add edx, byte 4
        jmp short AaAddQuarter.1
AaAddQuarter_54:
        mov eax, dword [byte ebx+014h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp short AaAddQuarter.1
AaAddQuarter_6D:
        mov eax, dword [byte ebx+020h]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+020h]
        lea ebp, [esi+ecx]
        mov dword [dword edx+AaColumnSums], ebp
        add edx, byte 4
        jmp short AaAddQuarter.1
AaAddQuarter_9A:
        mov eax, dword [byte ebx+028h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+01Ch]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_D1:
        mov eax, dword [byte ebx+02Ch]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+020h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+02Ch]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_117:
        inc eax
AaAddQuarter_118:
        inc eax
AaAddQuarter_119:
        inc eax
AaAddQuarter_11A:
        inc eax
AaAddQuarter_11B:
        inc eax
AaAddQuarter_11C:
        inc eax
AaAddQuarter_11D:
        inc eax
AaAddQuarter_11E:
        inc eax
AaAddQuarter_11F:
        inc eax
AaAddQuarter_120:
        inc eax
AaAddQuarter_121:
        inc eax
AaAddQuarter_122:
        inc eax
AaAddQuarter_123:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
AaAddQuarter_12E:
        mov ebx, dword [byte ebx+02Ch]
        mov ecx, dword [dword edx+AaColumnSums]
        add ecx, ebx
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ecx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+020h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 2
        mov ebx, dword [byte ebx+02Ch]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_180:
        mov eax, dword [byte ebx+014h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_1A4:
        mov eax, dword [byte ebx+01Ch]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+028h]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_1D1:
        mov eax, dword [byte ebx+020h]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+020h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_20B:
        mov eax, dword [byte ebx+02Ch]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+020h]
        lea ebx, [eax+ebp]
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [esi]
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+02Ch]
        lea eax, [byte esi+01h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [eax]
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_259:
        mov eax, dword [byte ebx+02Ch]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+020h]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov eax, esi
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+02Ch]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddQuarter.1
AaAddQuarter_2A1:
        inc eax
AaAddQuarter_2A2:
        inc eax
AaAddQuarter_2A3:
        inc eax
AaAddQuarter_2A4:
        inc eax
AaAddQuarter_2A5:
        inc eax
AaAddQuarter_2A6:
        inc eax
AaAddQuarter_2A7:
        inc eax
AaAddQuarter_2A8:
        inc eax
AaAddQuarter_2A9:
        inc eax
AaAddQuarter_2AA:
        inc eax
AaAddQuarter_2AB:
        inc eax
AaAddQuarter_2AC:
        inc eax
AaAddQuarter_2AD:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+02Ch]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        mov ebx, dword [byte ebx+020h]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+03h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 3
        mov ecx, dword [byte ebx+02Ch]
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
.2:
        add edx, byte 4
        jmp near AaAddQuarter.1
        db 08Dh,040h,00h
AaSetThirdJumpTable:                            ; jump table for the switch cases of AaSetThird
        dd AaSetThird_46
        dd AaSetThird_54
        dd AaSetThird_6D
        dd AaSetThird_97
        dd AaSetThird_C9
        dd AaSetThird_11E
        dd AaSetThird_11E
        dd AaSetThird_113
        dd AaSetThird_113
        dd AaSetThird_112
        dd AaSetThird_112
        dd AaSetThird_111
        dd AaSetThird_111
        dd AaSetThird_110
        dd AaSetThird_110
        dd AaSetThird_10F
        dd AaSetThird_10F
        dd AaSetThird_10E
        dd AaSetThird_10E
        dd AaSetThird_10D
        dd AaSetThird_10D
        dd AaSetThird_10C
        dd AaSetThird_10C
        dd AaSetThird_10B
        dd AaSetThird_10B
        dd AaSetThird_10A
        dd AaSetThird_10A
        dd AaSetThird_109
        dd AaSetThird_109
        dd AaSetThird_108
        dd AaSetThird_108
        dd AaSetThird_107
        dd AaSetThird_107
        dd AaSetThird_46
        dd AaSetThird_46
        dd AaSetThird_54
        dd AaSetThird_168
        dd AaSetThird_195
        dd AaSetThird_1C1
        dd AaSetThird_1F3
        dd AaSetThird_239
        dd AaSetThird_282
        dd AaSetThird_281
        dd AaSetThird_281
        dd AaSetThird_280
        dd AaSetThird_280
        dd AaSetThird_27F
        dd AaSetThird_27F
        dd AaSetThird_27E
        dd AaSetThird_27E
        dd AaSetThird_27D
        dd AaSetThird_27D
        dd AaSetThird_27C
        dd AaSetThird_27C
        dd AaSetThird_27B
        dd AaSetThird_27B
        dd AaSetThird_27A
        dd AaSetThird_27A
        dd AaSetThird_279
        dd AaSetThird_279
        dd AaSetThird_278
        dd AaSetThird_278
        dd AaSetThird_277
        dd AaSetThird_277
        dd AaSetThird_276
        dd AaSetThird_276
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaSetThird                                      B4988  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and stores one third weight
; colour sums
;-----------------------------------------------------------------------------
AaSetThird:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov edx, dword [edx+ebx]
        xor ebx, ebx
.1:
        mov ecx, dword [dword ebx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaSetThird_282.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaSetThirdJumpTable]
AaSetThird_46:
        mov ecx, dword [byte edx+010h]
        mov dword [dword ebx+AaColumnSums], ecx
        add ebx, byte 4
        jmp short AaSetThird.1
AaSetThird_54:
        mov eax, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp short AaSetThird.1
AaSetThird_6D:
        mov eax, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+01Ch]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp short AaSetThird.1
AaSetThird_97:
        mov eax, dword [byte edx+024h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+018h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_C9:
        mov eax, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov ecx, dword [byte edx+028h]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_107:
        inc eax
AaSetThird_108:
        inc eax
AaSetThird_109:
        inc eax
AaSetThird_10A:
        inc eax
AaSetThird_10B:
        inc eax
AaSetThird_10C:
        inc eax
AaSetThird_10D:
        inc eax
AaSetThird_10E:
        inc eax
AaSetThird_10F:
        inc eax
AaSetThird_110:
        inc eax
AaSetThird_111:
        inc eax
AaSetThird_112:
        inc eax
AaSetThird_113:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
AaSetThird_11E:
        mov edx, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 2
        mov edx, dword [byte edx+028h]
        lea esi, [edx+ebp]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_168:
        mov eax, dword [byte edx+018h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+024h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_195:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+01Ch]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_1C1:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_1F3:
        mov eax, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+01Ch]
        xor eax, eax
        mov dword [dword ebx+AaColumnSums], ebp
        mov al, byte [esi]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+028h]
        lea edx, [eax+ebp]
        lea eax, [byte esi+01h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_239:
        mov eax, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+01Ch]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov eax, esi
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+028h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetThird.1
AaSetThird_276:
        inc eax
AaSetThird_277:
        inc eax
AaSetThird_278:
        inc eax
AaSetThird_279:
        inc eax
AaSetThird_27A:
        inc eax
AaSetThird_27B:
        inc eax
AaSetThird_27C:
        inc eax
AaSetThird_27D:
        inc eax
AaSetThird_27E:
        inc eax
AaSetThird_27F:
        inc eax
AaSetThird_280:
        inc eax
AaSetThird_281:
        inc eax
AaSetThird_282:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov edx, dword [byte edx+028h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        add esi, dword [byte edx+01Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+03h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 3
        mov ecx, dword [byte edx+028h]
        lea ebp, [esi+ecx]
        mov dword [dword ebx+AaColumnSums], ebp
.2:
        add ebx, byte 4
        jmp near AaSetThird.1
        db 090h
AaAddThirdJumpTable:                            ; jump table for the switch cases of AaAddThird
        dd AaAddThird_46
        dd AaAddThird_54
        dd AaAddThird_6D
        dd AaAddThird_9A
        dd AaAddThird_D1
        dd AaAddThird_12E
        dd AaAddThird_12E
        dd AaAddThird_123
        dd AaAddThird_123
        dd AaAddThird_122
        dd AaAddThird_122
        dd AaAddThird_121
        dd AaAddThird_121
        dd AaAddThird_120
        dd AaAddThird_120
        dd AaAddThird_11F
        dd AaAddThird_11F
        dd AaAddThird_11E
        dd AaAddThird_11E
        dd AaAddThird_11D
        dd AaAddThird_11D
        dd AaAddThird_11C
        dd AaAddThird_11C
        dd AaAddThird_11B
        dd AaAddThird_11B
        dd AaAddThird_11A
        dd AaAddThird_11A
        dd AaAddThird_119
        dd AaAddThird_119
        dd AaAddThird_118
        dd AaAddThird_118
        dd AaAddThird_117
        dd AaAddThird_117
        dd AaAddThird_46
        dd AaAddThird_46
        dd AaAddThird_180
        dd AaAddThird_1A4
        dd AaAddThird_1D1
        dd AaAddThird_1D1
        dd AaAddThird_20B
        dd AaAddThird_259
        dd AaAddThird_2AD
        dd AaAddThird_2AC
        dd AaAddThird_2AC
        dd AaAddThird_2AB
        dd AaAddThird_2AB
        dd AaAddThird_2AA
        dd AaAddThird_2AA
        dd AaAddThird_2A9
        dd AaAddThird_2A9
        dd AaAddThird_2A8
        dd AaAddThird_2A8
        dd AaAddThird_2A7
        dd AaAddThird_2A7
        dd AaAddThird_2A6
        dd AaAddThird_2A6
        dd AaAddThird_2A5
        dd AaAddThird_2A5
        dd AaAddThird_2A4
        dd AaAddThird_2A4
        dd AaAddThird_2A3
        dd AaAddThird_2A3
        dd AaAddThird_2A2
        dd AaAddThird_2A2
        dd AaAddThird_2A1
        dd AaAddThird_2A1
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaAddThird                                      B4D60  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and adds one third weight
; colour sums
;-----------------------------------------------------------------------------
AaAddThird:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov ebx, dword [edx+ebx]
        xor edx, edi
.1:
        mov ecx, dword [dword edx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaAddThird_2AD.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaAddThirdJumpTable]
AaAddThird_46:
        mov ecx, dword [byte ebx+010h]
        add dword [dword edx+AaColumnSums], ecx
        add edx, byte 4
        jmp short AaAddThird.1
AaAddThird_54:
        mov eax, dword [byte ebx+010h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp short AaAddThird.1
AaAddThird_6D:
        mov eax, dword [byte ebx+01Ch]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+01Ch]
        lea ebp, [esi+ecx]
        mov dword [dword edx+AaColumnSums], ebp
        add edx, byte 4
        jmp short AaAddThird.1
AaAddThird_9A:
        mov eax, dword [byte ebx+024h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+018h]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_D1:
        mov eax, dword [byte ebx+028h]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+01Ch]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+028h]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_117:
        inc eax
AaAddThird_118:
        inc eax
AaAddThird_119:
        inc eax
AaAddThird_11A:
        inc eax
AaAddThird_11B:
        inc eax
AaAddThird_11C:
        inc eax
AaAddThird_11D:
        inc eax
AaAddThird_11E:
        inc eax
AaAddThird_11F:
        inc eax
AaAddThird_120:
        inc eax
AaAddThird_121:
        inc eax
AaAddThird_122:
        inc eax
AaAddThird_123:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
AaAddThird_12E:
        mov ebx, dword [byte ebx+028h]
        mov ecx, dword [dword edx+AaColumnSums]
        add ecx, ebx
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ecx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+01Ch]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 2
        mov ebx, dword [byte ebx+028h]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_180:
        mov eax, dword [byte ebx+010h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_1A4:
        mov eax, dword [byte ebx+018h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+024h]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_1D1:
        mov eax, dword [byte ebx+01Ch]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+01Ch]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_20B:
        mov eax, dword [byte ebx+028h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+01Ch]
        lea ebx, [eax+ebp]
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [esi]
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+028h]
        lea eax, [byte esi+01h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [eax]
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_259:
        mov eax, dword [byte ebx+028h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+01Ch]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov eax, esi
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+028h]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddThird.1
AaAddThird_2A1:
        inc eax
AaAddThird_2A2:
        inc eax
AaAddThird_2A3:
        inc eax
AaAddThird_2A4:
        inc eax
AaAddThird_2A5:
        inc eax
AaAddThird_2A6:
        inc eax
AaAddThird_2A7:
        inc eax
AaAddThird_2A8:
        inc eax
AaAddThird_2A9:
        inc eax
AaAddThird_2AA:
        inc eax
AaAddThird_2AB:
        inc eax
AaAddThird_2AC:
        inc eax
AaAddThird_2AD:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+028h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        mov ebx, dword [byte ebx+01Ch]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+03h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 3
        mov ecx, dword [byte ebx+028h]
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
.2:
        add edx, byte 4
        jmp near AaAddThird.1
        db 08Dh,040h,00h
AaSetTwoThirdsJumpTable:                        ; jump table for the switch cases of AaSetTwoThirds
        dd AaSetTwoThirds_46
        dd AaSetTwoThirds_54
        dd AaSetTwoThirds_6D
        dd AaSetTwoThirds_97
        dd AaSetTwoThirds_C9
        dd AaSetTwoThirds_11E
        dd AaSetTwoThirds_11E
        dd AaSetTwoThirds_113
        dd AaSetTwoThirds_113
        dd AaSetTwoThirds_112
        dd AaSetTwoThirds_112
        dd AaSetTwoThirds_111
        dd AaSetTwoThirds_111
        dd AaSetTwoThirds_110
        dd AaSetTwoThirds_110
        dd AaSetTwoThirds_10F
        dd AaSetTwoThirds_10F
        dd AaSetTwoThirds_10E
        dd AaSetTwoThirds_10E
        dd AaSetTwoThirds_10D
        dd AaSetTwoThirds_10D
        dd AaSetTwoThirds_10C
        dd AaSetTwoThirds_10C
        dd AaSetTwoThirds_10B
        dd AaSetTwoThirds_10B
        dd AaSetTwoThirds_10A
        dd AaSetTwoThirds_10A
        dd AaSetTwoThirds_109
        dd AaSetTwoThirds_109
        dd AaSetTwoThirds_108
        dd AaSetTwoThirds_108
        dd AaSetTwoThirds_107
        dd AaSetTwoThirds_107
        dd AaSetTwoThirds_46
        dd AaSetTwoThirds_46
        dd AaSetTwoThirds_54
        dd AaSetTwoThirds_168
        dd AaSetTwoThirds_195
        dd AaSetTwoThirds_1C1
        dd AaSetTwoThirds_1F3
        dd AaSetTwoThirds_239
        dd AaSetTwoThirds_282
        dd AaSetTwoThirds_281
        dd AaSetTwoThirds_281
        dd AaSetTwoThirds_280
        dd AaSetTwoThirds_280
        dd AaSetTwoThirds_27F
        dd AaSetTwoThirds_27F
        dd AaSetTwoThirds_27E
        dd AaSetTwoThirds_27E
        dd AaSetTwoThirds_27D
        dd AaSetTwoThirds_27D
        dd AaSetTwoThirds_27C
        dd AaSetTwoThirds_27C
        dd AaSetTwoThirds_27B
        dd AaSetTwoThirds_27B
        dd AaSetTwoThirds_27A
        dd AaSetTwoThirds_27A
        dd AaSetTwoThirds_279
        dd AaSetTwoThirds_279
        dd AaSetTwoThirds_278
        dd AaSetTwoThirds_278
        dd AaSetTwoThirds_277
        dd AaSetTwoThirds_277
        dd AaSetTwoThirds_276
        dd AaSetTwoThirds_276
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaSetTwoThirds                                  B5168  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and stores two thirds
; weight colour sums
;-----------------------------------------------------------------------------
AaSetTwoThirds:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov edx, dword [edx+ebx]
        xor ebx, ebx
.1:
        mov ecx, dword [dword ebx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaSetTwoThirds_282.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaSetTwoThirdsJumpTable]
AaSetTwoThirds_46:
        mov ecx, dword [byte edx+04h]
        mov dword [dword ebx+AaColumnSums], ecx
        add ebx, byte 4
        jmp short AaSetTwoThirds.1
AaSetTwoThirds_54:
        mov eax, dword [byte edx+04h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp short AaSetTwoThirds.1
AaSetTwoThirds_6D:
        mov eax, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+010h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp short AaSetTwoThirds.1
AaSetTwoThirds_97:
        mov eax, dword [byte edx+018h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+0Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_C9:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov ecx, dword [byte edx+01Ch]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_107:
        inc eax
AaSetTwoThirds_108:
        inc eax
AaSetTwoThirds_109:
        inc eax
AaSetTwoThirds_10A:
        inc eax
AaSetTwoThirds_10B:
        inc eax
AaSetTwoThirds_10C:
        inc eax
AaSetTwoThirds_10D:
        inc eax
AaSetTwoThirds_10E:
        inc eax
AaSetTwoThirds_10F:
        inc eax
AaSetTwoThirds_110:
        inc eax
AaSetTwoThirds_111:
        inc eax
AaSetTwoThirds_112:
        inc eax
AaSetTwoThirds_113:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
AaSetTwoThirds_11E:
        mov edx, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 2
        mov edx, dword [byte edx+01Ch]
        lea esi, [edx+ebp]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+01h]
        inc eax
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_168:
        mov eax, dword [byte edx+0Ch]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], eax
        mov dl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+018h]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_195:
        mov eax, dword [byte edx+010h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+010h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_1C1:
        mov eax, dword [byte edx+010h]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], ebp
        mov dl, byte [esi]
        mov eax, esi
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_1F3:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov ebp, dword [dword ebx+AaColumnSums]
        add ebp, dword [byte edx+010h]
        xor eax, eax
        mov dword [dword ebx+AaColumnSums], ebp
        mov al, byte [esi]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+01Ch]
        lea edx, [eax+ebp]
        lea eax, [byte esi+01h]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [ecx+edx*4]
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_239:
        mov eax, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], eax
        xor eax, eax
        mov al, byte [ecx]
        mov ecx, edi
        mov edx, dword [ecx+eax*4]
        mov eax, dword [byte edx+010h]
        add dword [dword ebx+AaColumnSums], eax
        xor edx, edx
        mov dl, byte [esi]
        mov edx, dword [ecx+edx*4]
        mov eax, esi
        mov esi, dword [dword ebx+AaColumnSums]
        mov ecx, dword [byte edx+01Ch]
        add esi, ecx
        mov dword [dword ebx+AaColumnSums], esi
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
AaSetTwoThirds_276:
        inc eax
AaSetTwoThirds_277:
        inc eax
AaSetTwoThirds_278:
        inc eax
AaSetTwoThirds_279:
        inc eax
AaSetTwoThirds_27A:
        inc eax
AaSetTwoThirds_27B:
        inc eax
AaSetTwoThirds_27C:
        inc eax
AaSetTwoThirds_27D:
        inc eax
AaSetTwoThirds_27E:
        inc eax
AaSetTwoThirds_27F:
        inc eax
AaSetTwoThirds_280:
        inc eax
AaSetTwoThirds_281:
        inc eax
AaSetTwoThirds_282:
        xor edx, edx
        mov ecx, edi
        mov dl, byte [byte eax+01h]
        mov edx, dword [ecx+edx*4]
        mov edx, dword [byte edx+01Ch]
        mov dword [dword ebx+AaColumnSums], edx
        xor edx, edx
        mov dl, byte [byte eax+02h]
        mov edx, dword [ecx+edx*4]
        mov esi, dword [dword ebx+AaColumnSums]
        add esi, dword [byte edx+010h]
        xor edx, edx
        mov dword [dword ebx+AaColumnSums], esi
        mov dl, byte [byte eax+03h]
        mov edx, dword [ecx+edx*4]
        add eax, byte 3
        mov ecx, dword [byte edx+01Ch]
        lea ebp, [esi+ecx]
        mov dword [dword ebx+AaColumnSums], ebp
.2:
        add ebx, byte 4
        jmp near AaSetTwoThirds.1
        db 090h
AaAddTwoThirdsJumpTable:                        ; jump table for the switch cases of AaAddTwoThirds
        dd AaAddTwoThirds_46
        dd AaAddTwoThirds_54
        dd AaAddTwoThirds_6D
        dd AaAddTwoThirds_9A
        dd AaAddTwoThirds_D1
        dd AaAddTwoThirds_12E
        dd AaAddTwoThirds_12E
        dd AaAddTwoThirds_123
        dd AaAddTwoThirds_123
        dd AaAddTwoThirds_122
        dd AaAddTwoThirds_122
        dd AaAddTwoThirds_121
        dd AaAddTwoThirds_121
        dd AaAddTwoThirds_120
        dd AaAddTwoThirds_120
        dd AaAddTwoThirds_11F
        dd AaAddTwoThirds_11F
        dd AaAddTwoThirds_11E
        dd AaAddTwoThirds_11E
        dd AaAddTwoThirds_11D
        dd AaAddTwoThirds_11D
        dd AaAddTwoThirds_11C
        dd AaAddTwoThirds_11C
        dd AaAddTwoThirds_11B
        dd AaAddTwoThirds_11B
        dd AaAddTwoThirds_11A
        dd AaAddTwoThirds_11A
        dd AaAddTwoThirds_119
        dd AaAddTwoThirds_119
        dd AaAddTwoThirds_118
        dd AaAddTwoThirds_118
        dd AaAddTwoThirds_117
        dd AaAddTwoThirds_117
        dd AaAddTwoThirds_46
        dd AaAddTwoThirds_46
        dd AaAddTwoThirds_180
        dd AaAddTwoThirds_1A4
        dd AaAddTwoThirds_1D1
        dd AaAddTwoThirds_1D1
        dd AaAddTwoThirds_20B
        dd AaAddTwoThirds_259
        dd AaAddTwoThirds_2AD
        dd AaAddTwoThirds_2AC
        dd AaAddTwoThirds_2AC
        dd AaAddTwoThirds_2AB
        dd AaAddTwoThirds_2AB
        dd AaAddTwoThirds_2AA
        dd AaAddTwoThirds_2AA
        dd AaAddTwoThirds_2A9
        dd AaAddTwoThirds_2A9
        dd AaAddTwoThirds_2A8
        dd AaAddTwoThirds_2A8
        dd AaAddTwoThirds_2A7
        dd AaAddTwoThirds_2A7
        dd AaAddTwoThirds_2A6
        dd AaAddTwoThirds_2A6
        dd AaAddTwoThirds_2A5
        dd AaAddTwoThirds_2A5
        dd AaAddTwoThirds_2A4
        dd AaAddTwoThirds_2A4
        dd AaAddTwoThirds_2A3
        dd AaAddTwoThirds_2A3
        dd AaAddTwoThirds_2A2
        dd AaAddTwoThirds_2A2
        dd AaAddTwoThirds_2A1
        dd AaAddTwoThirds_2A1
        dd AaSetFull_2C9
;-----------------------------------------------------------------------------
; AaAddTwoThirds                                  B5540  96 PC, low confidence
; Anti-aliased scaling: runs the column step list and adds two thirds weight
; colour sums
;-----------------------------------------------------------------------------
AaAddTwoThirds:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov edi, dword [AaPalLut]
        mov eax, dword [AaSrcPtr]
        xor edx, edx
        mov dl, byte [eax]
        lea ebx, [nosplit edx*4+00h]
        mov edx, edi
        mov ebx, dword [edx+ebx]
        xor edx, edi
.1:
        mov ecx, dword [dword edx+AaColumnCodes]
        cmp ecx, byte 42h
        ja near AaAddTwoThirds_2AD.2
        lea ebp, [nosplit ecx*4+00h]
        lea ecx, [byte eax+01h]
        lea esi, [byte eax+02h]
        jmp dword [dword cs:ebp+AaAddTwoThirdsJumpTable]
AaAddTwoThirds_46:
        mov ecx, dword [byte ebx+04h]
        add dword [dword edx+AaColumnSums], ecx
        add edx, byte 4
        jmp short AaAddTwoThirds.1
AaAddTwoThirds_54:
        mov eax, dword [byte ebx+04h]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp short AaAddTwoThirds.1
AaAddTwoThirds_6D:
        mov eax, dword [byte ebx+010h]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+010h]
        lea ebp, [esi+ecx]
        mov dword [dword edx+AaColumnSums], ebp
        add edx, byte 4
        jmp short AaAddTwoThirds.1
AaAddTwoThirds_9A:
        mov eax, dword [byte ebx+018h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+0Ch]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_D1:
        mov eax, dword [byte ebx+01Ch]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+010h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov ecx, dword [byte ebx+01Ch]
        mov eax, esi
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_117:
        inc eax
AaAddTwoThirds_118:
        inc eax
AaAddTwoThirds_119:
        inc eax
AaAddTwoThirds_11A:
        inc eax
AaAddTwoThirds_11B:
        inc eax
AaAddTwoThirds_11C:
        inc eax
AaAddTwoThirds_11D:
        inc eax
AaAddTwoThirds_11E:
        inc eax
AaAddTwoThirds_11F:
        inc eax
AaAddTwoThirds_120:
        inc eax
AaAddTwoThirds_121:
        inc eax
AaAddTwoThirds_122:
        inc eax
AaAddTwoThirds_123:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
AaAddTwoThirds_12E:
        mov ebx, dword [byte ebx+01Ch]
        mov ecx, dword [dword edx+AaColumnSums]
        add ecx, ebx
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ecx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+010h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 2
        mov ebx, dword [byte ebx+01Ch]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+01h]
        inc eax
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_180:
        mov eax, dword [byte ebx+04h]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_1A4:
        mov eax, dword [byte ebx+0Ch]
        add dword [dword edx+AaColumnSums], eax
        xor ebx, ebx
        mov bl, byte [ecx]
        mov eax, ecx
        mov ecx, edi
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+018h]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_1D1:
        mov eax, dword [byte ebx+010h]
        mov ebx, dword [dword edx+AaColumnSums]
        add ebx, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+010h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [esi]
        mov eax, esi
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_20B:
        mov eax, dword [byte ebx+01Ch]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+010h]
        lea ebx, [eax+ebp]
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebx
        mov al, byte [esi]
        mov ebx, dword [ecx+eax*4]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, dword [byte ebx+01Ch]
        lea eax, [byte esi+01h]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [eax]
        mov ebx, dword [ecx+ebx*4]
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_259:
        mov eax, dword [byte ebx+01Ch]
        mov ebp, dword [dword edx+AaColumnSums]
        add ebp, eax
        xor eax, eax
        mov dword [dword edx+AaColumnSums], ebp
        mov al, byte [ecx]
        mov ecx, edi
        mov ebx, dword [ecx+eax*4]
        mov eax, dword [byte ebx+010h]
        lea ebx, [eax+ebp]
        mov dword [dword edx+AaColumnSums], ebx
        xor ebx, ebx
        mov bl, byte [esi]
        mov ebx, dword [ecx+ebx*4]
        mov eax, esi
        mov esi, dword [dword edx+AaColumnSums]
        mov ecx, dword [byte ebx+01Ch]
        add esi, ecx
        mov dword [dword edx+AaColumnSums], esi
        add edx, byte 4
        jmp near AaAddTwoThirds.1
AaAddTwoThirds_2A1:
        inc eax
AaAddTwoThirds_2A2:
        inc eax
AaAddTwoThirds_2A3:
        inc eax
AaAddTwoThirds_2A4:
        inc eax
AaAddTwoThirds_2A5:
        inc eax
AaAddTwoThirds_2A6:
        inc eax
AaAddTwoThirds_2A7:
        inc eax
AaAddTwoThirds_2A8:
        inc eax
AaAddTwoThirds_2A9:
        inc eax
AaAddTwoThirds_2AA:
        inc eax
AaAddTwoThirds_2AB:
        inc eax
AaAddTwoThirds_2AC:
        inc eax
AaAddTwoThirds_2AD:
        xor ebx, ebx
        mov ecx, edi
        mov bl, byte [byte eax+01h]
        mov ebx, dword [ecx+ebx*4]
        mov esi, dword [dword edx+AaColumnSums]
        add esi, dword [byte ebx+01Ch]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], esi
        mov bl, byte [byte eax+02h]
        mov ebx, dword [ecx+ebx*4]
        mov ebx, dword [byte ebx+010h]
        lea ebp, [esi+ebx]
        xor ebx, ebx
        mov dword [dword edx+AaColumnSums], ebp
        mov bl, byte [byte eax+03h]
        mov ebx, dword [ecx+ebx*4]
        add eax, byte 3
        mov ecx, dword [byte ebx+01Ch]
        lea esi, [ecx+ebp]
        mov dword [dword edx+AaColumnSums], esi
.2:
        add edx, byte 4
        jmp near AaAddTwoThirds.1
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; AaBuildColumnSteps                              B583C  96 PC, low confidence
; Builds the list of column step codes for an anti-aliased scale
;-----------------------------------------------------------------------------
AaBuildColumnSteps:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov edi, dword [AaSrcWidthFixed]
        mov ebx, dword [AaDestWidth]
        xor edx, edx
        xor esi, esi
        xor ecx, ecx
        xor eax, eax
        mov dword [byte esp+04h], edx
        shl ebx, 2
        dec edi
        mov dword [esp], ebx
        test edi, edi
        jle short .6
.1:
        mov ebx, dword [AaStepX]
        mov ebp, dword [AaSrcWidthFixed]
        add eax, ebx
        cmp eax, ebp
        jl short .2
        mov eax, edi
.2:
        mov ebx, eax
        sar ebx, 0Fh
        sub ebx, ecx
        add ecx, ebx
        test esi, esi
        je short .3
        lea ebp, [byte ebx+021h]
        mov dword [dword edx+AaColumnCodes], ebp
        jmp short .4
.3:
        mov dword [dword edx+AaColumnCodes], ebx
.4:
        test bl, 1
        je short .5
        test esi, esi
        sete bl
        movzx esi, bl
.5:
        mov ebx, dword [byte esp+04h]
        mov ebp, dword [esp]
        inc ebx
        add edx, byte 4
        mov dword [byte esp+04h], ebx
        cmp edx, ebp
        jge short .6
        cmp eax, edi
        jl short .1
.6:
        mov eax, dword [byte esp+04h]
        mov dword [nosplit eax*4+AaColumnCodes], 42h
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 090h
;-----------------------------------------------------------------------------
; SetAaPalLut                                     B58D8  96 PC, low confidence
; Sets the anti-aliasing palette table that scaled art drawing uses
;-----------------------------------------------------------------------------
SetAaPalLut:
        mov dword [AaPalLut], eax
        ret
        db 08Bh,0C0h
AaRowStepJumpTable:                             ; jump table for the switch cases of AaDrawScaledArt
        dd AaDrawScaledArt_1CA
        dd AaDrawScaledArt_1D4
        dd AaDrawScaledArt_1F7
        dd AaDrawScaledArt_211
        dd AaDrawScaledArt_244
        dd AaDrawScaledArt_26E
        dd AaDrawScaledArt_2B1
        dd AaDrawScaledArt_354
        dd AaDrawScaledArt_41F
        dd AaDrawScaledArt_349
        dd AaDrawScaledArt_414
        dd AaDrawScaledArt_33E
        dd AaDrawScaledArt_409
        dd AaDrawScaledArt_333
        dd AaDrawScaledArt_3FE
        dd AaDrawScaledArt_328
        dd AaDrawScaledArt_3F3
        dd AaDrawScaledArt_31D
        dd AaDrawScaledArt_3E8
        dd AaDrawScaledArt_312
        dd AaDrawScaledArt_3DD
        dd AaDrawScaledArt_307
        dd AaDrawScaledArt_3D2
        dd AaDrawScaledArt_2FC
        dd AaDrawScaledArt_3C7
        dd AaDrawScaledArt_2F1
        dd AaDrawScaledArt_3BC
        dd AaDrawScaledArt_2E6
        dd AaDrawScaledArt_3B1
        dd AaDrawScaledArt_2DB
        dd AaDrawScaledArt_3A6
        dd AaDrawScaledArt_2D6
        dd AaDrawScaledArt_3A1
AaRowStepLastJumpTable:                         ; jump table for the switch cases of AaDrawScaledArt
        dd AaDrawScaledArt_1CA
        dd AaDrawScaledArt_474
        dd AaDrawScaledArt_487
        dd AaDrawScaledArt_491
        dd AaDrawScaledArt_4BC
        dd AaDrawScaledArt_4D6
        dd AaDrawScaledArt_2B1
        dd AaDrawScaledArt_58F
        dd AaDrawScaledArt_653
        dd AaDrawScaledArt_584
        dd AaDrawScaledArt_648
        dd AaDrawScaledArt_579
        dd AaDrawScaledArt_63D
        dd AaDrawScaledArt_56E
        dd AaDrawScaledArt_632
        dd AaDrawScaledArt_563
        dd AaDrawScaledArt_627
        dd AaDrawScaledArt_558
        dd AaDrawScaledArt_61C
        dd AaDrawScaledArt_54D
        dd AaDrawScaledArt_611
        dd AaDrawScaledArt_542
        dd AaDrawScaledArt_606
        dd AaDrawScaledArt_537
        dd AaDrawScaledArt_5FB
        dd AaDrawScaledArt_52C
        dd AaDrawScaledArt_5F0
        dd AaDrawScaledArt_521
        dd AaDrawScaledArt_5E5
        dd AaDrawScaledArt_516
        dd AaDrawScaledArt_5DA
        dd AaDrawScaledArt_511
        dd AaDrawScaledArt_5D5
;-----------------------------------------------------------------------------
; AaDrawScaledArt                                 B59E8  96 PC, low confidence
; Draws art scaled down with anti-aliasing, row by row through the weight sum
; routines
;-----------------------------------------------------------------------------
AaDrawScaledArt:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov ebp, dword [AaDestWidth]
        mov eax, dword [DrawClipLeft-2]
        mov edx, dword [AaDestX]
        sar eax, 10h
        cmp eax, edx
        jle short .1
        add edx, ebp
        cmp edx, eax
        jl near AaDrawScaledArt_653.14
        mov ebx, dword [AaDestX]
        mov edx, eax
        sub edx, ebx
        mov ecx, dword [AaStepX]
        sub ebp, edx
        imul edx, ecx
        mov esi, dword [AaSrcPtr]
        sar edx, 10h
        add esi, edx
        mov dword [AaDestX], eax
        mov dword [AaSrcPtr], esi
.1:
        mov eax, dword [DrawClipRight-2]
        mov edx, dword [AaDestX]
        sar eax, 10h
        add edx, ebp
        cmp edx, eax
        jl short .2
        cmp eax, dword [AaDestX]
        jle near AaDrawScaledArt_653.14
        sub edx, eax
        sub ebp, edx
.2:
        mov eax, dword [DrawClipTop-2]
        mov edx, dword [AaDestY]
        sar eax, 10h
        cmp eax, edx
        jle short .3
        mov ebx, dword [AaDestHeight]
        add edx, ebx
        cmp edx, eax
        jl near AaDrawScaledArt_653.14
        mov ecx, dword [AaDestY]
        mov edx, eax
        mov esi, ebx
        sub edx, ecx
        mov edi, dword [AaStepY]
        sub esi, edx
        imul edx, edi
        mov ebx, dword [AaSrcWidth]
        sar edx, 10h
        imul edx, ebx
        mov ecx, dword [AaSrcPtr]
        mov dword [AaDestY], eax
        add ecx, edx
        mov dword [AaDestHeight], esi
        mov dword [AaSrcPtr], ecx
.3:
        mov edx, dword [AaDestY]
        mov eax, dword [DrawClipBottom-2]
        mov esi, dword [AaDestHeight]
        sar eax, 10h
        add edx, esi
        mov dword [AaDestWidth], ebp
        cmp edx, eax
        jl short .4
        cmp eax, dword [AaDestY]
        jle near AaDrawScaledArt_653.14
        sub edx, eax
        mov eax, esi
        sub eax, edx
        mov dword [AaDestHeight], eax
.4:
        xor edx, edx
        mov dword [byte esp+0Ch], edx
        mov dword [esp], edx
        mov dword [byte esp+08h], edx
        mov edx, dword [AaDestY]
        mov eax, dword [DrawDestBuffer]
        shl edx, 2
        add eax, edx
        mov edx, dword [DrawVideoBase]
        mov eax, dword [eax]
        add eax, edx
        mov edx, dword [AaDestX]
        add edx, eax
        call AaBuildColumnSteps
.5:
        mov dword [byte esp+04h], edx
        mov esi, dword [AaDestHeight]
        dec esi
        mov ebp, dword [AaDestWidth]
        mov dword [AaDestHeight], esi
        cmp esi, byte 0FFFFFFFFh
        je near AaDrawScaledArt_653.14
        mov edx, dword [byte esp+08h]
        add edx, dword [AaStepY]
        mov ebx, dword [AaSrcHeightFixed]
        mov dword [byte esp+08h], edx
        cmp edx, ebx
        jl short .6
        lea eax, [byte ebx-01h]
        mov dword [byte esp+08h], eax
.6:
        mov edx, dword [byte esp+08h]
        mov ecx, dword [esp]
        sar edx, 0Fh
        mov eax, dword [AaSrcPtr]
        sub edx, ecx
        mov edi, dword [AaSrcWidth]
        lea esi, [ecx+edx]
        add eax, edi
        mov ecx, dword [byte esp+0Ch]
        mov dword [esp], esi
        lea ebx, [nosplit edx*4+00h]
        test ecx, ecx
        je near AaDrawScaledArt_41F.7
        mov dword [AaDestWidth], ebp
        cmp edx, byte 20h
        ja near AaDrawScaledArt_653.10
        jmp dword [dword cs:ebx+AaRowStepJumpTable]
AaDrawScaledArt_1CA:
        call AaSetFull
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_1D4:
        call AaSetFull
        mov eax, dword [AaSrcWidth]
        mov ebx, dword [AaSrcPtr]
        xor ecx, ecx
        add ebx, eax
        mov dword [byte esp+0Ch], ecx
        mov dword [AaSrcPtr], ebx
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_1F7:
        call AaSetHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_211:
        call AaSetThird
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddTwoThirds
        mov eax, dword [AaSrcWidth]
        mov esi, dword [AaSrcPtr]
        xor edi, edi
        add esi, eax
        mov dword [byte esp+0Ch], edi
        mov dword [AaSrcPtr], esi
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_244:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddQuarter
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_26E:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddQuarter
        mov eax, dword [AaSrcWidth]
        mov esi, dword [AaSrcPtr]
        xor edi, edi
        add esi, eax
        mov dword [byte esp+0Ch], edi
        mov dword [AaSrcPtr], esi
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_2B1:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        jmp near AaDrawScaledArt_653.8
AaDrawScaledArt_2D6:
        mov dword [AaSrcPtr], eax
AaDrawScaledArt_2DB:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_2E6:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_2F1:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_2FC:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_307:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_312:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_31D:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_328:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_333:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_33E:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_349:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_354:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        mov edx, dword [AaSrcPtr]
        add eax, eax
        add edx, eax
        mov dword [AaSrcPtr], edx
        call AaAddQuarter
        mov eax, dword [AaSrcWidth]
        mov ebx, dword [AaSrcPtr]
        xor ecx, ecx
        add ebx, eax
        mov dword [byte esp+0Ch], ecx
        mov dword [AaSrcPtr], ebx
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_3A1:
        mov dword [AaSrcPtr], eax
AaDrawScaledArt_3A6:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3B1:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3BC:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3C7:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3D2:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3DD:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3E8:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3F3:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_3FE:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_409:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_414:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_41F:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        mov ecx, dword [AaSrcPtr]
        add eax, eax
        add ecx, eax
        mov dword [AaSrcPtr], ecx
        call AaAddQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        jmp near AaDrawScaledArt_653.10
.7:
        mov dword [AaDestWidth], ebp
        cmp edx, byte 20h
        ja near AaDrawScaledArt_653.10
        jmp dword [dword cs:ebx+AaRowStepLastJumpTable]
AaDrawScaledArt_474:
        mov esi, 1
        call AaSetFull
        mov dword [byte esp+0Ch], esi
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_487:
        call AaSetFull
        jmp near AaDrawScaledArt_653.9
AaDrawScaledArt_491:
        call AaSetTwoThirds
        mov eax, dword [AaSrcWidth]
        mov edx, dword [AaSrcPtr]
        mov ebx, 1
        add edx, eax
        mov dword [byte esp+0Ch], ebx
        mov dword [AaSrcPtr], edx
        call AaAddThird
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_4BC:
        call AaSetHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        jmp near AaDrawScaledArt_653.9
AaDrawScaledArt_4D6:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        mov ebx, dword [AaSrcPtr]
        mov ecx, 1
        add ebx, eax
        mov dword [byte esp+0Ch], ecx
        mov dword [AaSrcPtr], ebx
        call AaAddQuarter
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_511:
        mov dword [AaSrcPtr], eax
AaDrawScaledArt_516:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_521:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_52C:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_537:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_542:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_54D:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_558:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_563:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_56E:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_579:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_584:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_58F:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddQuarter
        mov eax, dword [AaSrcWidth]
        mov edx, dword [AaSrcPtr]
        mov ebx, 1
        add edx, eax
        mov dword [byte esp+0Ch], ebx
        mov dword [AaSrcPtr], edx
        jmp near AaDrawScaledArt_653.10
AaDrawScaledArt_5D5:
        mov dword [AaSrcPtr], eax
AaDrawScaledArt_5DA:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_5E5:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_5F0:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_5FB:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_606:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_611:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_61C:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_627:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_632:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_63D:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_648:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
AaDrawScaledArt_653:
        call AaSetQuarter
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
        call AaAddHalf
        mov eax, dword [AaSrcWidth]
        mov ebx, dword [AaSrcPtr]
        add eax, eax
        add ebx, eax
        mov dword [AaSrcPtr], ebx
.8:
        call AaAddQuarter
.9:
        mov eax, dword [AaSrcWidth]
        add dword [AaSrcPtr], eax
.10:
        mov eax, dword [byte esp+04h]
        mov ebp, dword [AaDestWidth]
        xor ebx, ebx
        xor ecx, ecx
.11:
        mov edx, dword [dword ecx+AaColumnSums]
        mov dword [byte esp+010h], edx
        xor edx, edx
        mov dl, byte [byte esp+013h]
        cmp edx, 0D0h
        ja short .13
        cmp edx, byte 20h
        jbe short .12
        and edx, 0F0h
        mov esi, PaletteShadeTable
        shl edx, 6
        add esi, edx
        xor edx, edx
        mov dl, byte [eax]
        mov edx, dword [esi+edx*4]
        add dword [byte esp+010h], edx
.12:
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+010h]
        mov edx, dword [byte esp+010h]
        shr esi, 10h
        shr edi, 8
        and edx, 0FFh
        and esi, 0FFh
        and edi, 0FFh
        shr esi, 3
        shr edi, 3
        shl esi, 0Ah
        shl edi, 5
        shr edx, 3
        or esi, edi
        or esi, edx
        mov edx, dword [ColourLookup]
        mov dl, byte [edx+esi]
        mov byte [eax], dl
.13:
        add ecx, byte 4
        inc ebx
        inc eax
        cmp ebx, ebp
        jl near .11
        mov edx, dword [byte esp+04h]
        mov edi, dword [AaDestY]
        mov eax, dword [ScreenWidth]
        mov dword [AaDestWidth], ebp
        inc edi
        add edx, eax
        mov dword [AaDestY], edi
        jmp near AaDrawScaledArt.5
.14:
        mov dword [AaDestWidth], ebp
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; DrawArtAaScaledInt                              B6140  96 PC, low confidence
; Draws art anti-aliased at a scale, at whole pixel x, y
;-----------------------------------------------------------------------------
DrawArtAaScaledInt:
        shl ecx, 10h
        shl ebx, 10h
        LD mov, eax, eax
;-----------------------------------------------------------------------------
; DrawArtAaScaled                                 B6148  96 PC, low confidence
; Draws art anti-aliased at a scale (at least 1/16), at 16.16 x, y
;-----------------------------------------------------------------------------
DrawArtAaScaled:
        push esi
        push edi
        push ebp
        mov esi, eax
        mov edi, edx
        mov ebp, ebx
        cmp eax, 1000h
        jge short .1
        mov esi, 1000h
.1:
        mov eax, dword [byte edi+02h]
        mov edx, esi
        sar eax, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [AaDestWidth], eax
        mov eax, dword [byte edi+04h]
        mov edx, esi
        sar eax, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov dword [AaDestHeight], eax
        mov eax, dword [byte edi+06h]
        sar eax, 10h
        imul eax, esi
        sub ebp, eax
        mov eax, dword [byte edi+08h]
        sar eax, 10h
        imul esi, eax
        lea eax, [byte edi+010h]
        mov dword [AaSrcPtr], eax
        mov eax, dword [byte edi+02h]
        sub ecx, esi
        sar eax, 10h
        sar ecx, 10h
        mov dword [AaSrcWidth], eax
        shl eax, 10h
        mov dword [AaDestY], ecx
        mov dword [AaSrcWidthFixed], eax
        mov eax, dword [byte edi+04h]
        mov ecx, dword [AaDestWidth]
        sar eax, 10h
        mov edx, dword [AaSrcWidth]
        shl eax, 10h
        shl edx, 10h
        mov dword [AaSrcHeightFixed], eax
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edx, dword [AaSrcHeightFixed]
        mov dword [AaStepX], eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        sar ebp, 10h
        mov dword [AaDestX], ebp
        mov dword [AaStepY], eax
        call AaDrawScaledArt
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawArtAaScaledXY                               B621C  96 PC, low confidence
; Draws art anti-aliased with separate x and y scales
;-----------------------------------------------------------------------------
DrawArtAaScaledXY:
        push esi
        push edi
        mov esi, eax
        mov edi, edx
        cmp eax, 1000h
        jge short .1
        mov esi, 1000h
.1:
        cmp edi, 1000h
        jge short .2
        mov edi, 1000h
.2:
        mov eax, dword [byte ebx+02h]
        mov edx, esi
        sar eax, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [AaDestWidth], eax
        mov eax, dword [byte ebx+04h]
        mov edx, edi
        sar eax, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [AaDestHeight], eax
        mov eax, dword [byte ebx+06h]
        sar eax, 10h
        imul eax, esi
        sub ecx, eax
        mov eax, dword [byte ebx+08h]
        sar eax, 10h
        imul eax, edi
        sar ecx, 10h
        mov dword [AaDestX], ecx
        mov ecx, dword [byte esp+0Ch]
        sub ecx, eax
        mov eax, ecx
        sar eax, 10h
        mov dword [AaDestY], eax
        lea eax, [byte ebx+010h]
        mov dword [AaSrcPtr], eax
        mov eax, dword [byte ebx+02h]
        sar eax, 10h
        mov dword [AaSrcWidth], eax
        shl eax, 10h
        mov dword [AaSrcWidthFixed], eax
        mov eax, dword [byte ebx+04h]
        sar eax, 10h
        shl eax, 10h
        push esi
        mov dword [AaSrcHeightFixed], eax
        call FixedInverse
        add esp, byte 4
        inc eax
        push edi
        mov dword [AaStepX], eax
        call FixedInverse
        inc eax
        add esp, byte 4
        mov dword [AaStepY], eax
        call AaDrawScaledArt
        pop edi
        pop esi
        ret 4
        db 090h
        push esi
        mov esi, dword [byte esp+08h]
        shl esi, 10h
        push esi
        shl ecx, 10h
        call DrawArtAaScaledXY
        pop esi
        ret 4
