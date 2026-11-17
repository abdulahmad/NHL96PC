; 3D library: PolyCrossProduct, RasterMappedTriangle, DrawMappedTriangle and 12 more.
bits 32
%include "hockey.inc"
section s_C6591 progbits alloc exec nowrite align=1
extern ArtBitDepth, BuildEdgeTableMax, BuildEdgeTableMin, BuildFixedTableMax, BuildFixedTableMin, BuildSpanOffsets, CopyMappedSpan, CopyScaledSpan
extern CopyScaledSpanShadow, DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawVideoBase, FillFlatPolyCore
extern MapPolySpans, MapPolySpansRemap, ScaledRowBuffer, SetBlitSource
global PolyCrossProduct, RasterMappedTriangle, DrawMappedTriangle, RasterMappedTriangleShadow, DrawMappedTriangleShadow, RasterShapeTriangle, DrawShapeTriangleMapped, DrawClippedPoly
global DrawMappedPolyClipped, DrawMappedStrip, DrawMappedStripShadow, DrawMappedStripDirect, DrawFlatPolyClipped, DrawFlatPolyMapped, TexSpanFill
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; PolyCrossProduct                             C65A0  96 PC, medium confidence
; Returns the 2D cross product of three indexed polygon points (its winding)
;-----------------------------------------------------------------------------
PolyCrossProduct:
        push esi
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        mov ebx, dword [byte edx+08h]
        mov esi, dword [byte edx+04h]
        shl ebx, 3
        mov edx, dword [edx]
        shl esi, 3
        shl edx, 3
        add ebx, eax
        add esi, eax
        add edx, eax
        mov eax, dword [ebx]
        mov ebx, dword [byte ebx+04h]
        mov ecx, dword [edx]
        mov edx, dword [byte edx+04h]
        sub eax, dword [esi]
        sub ebx, dword [byte esi+04h]
        sub ecx, dword [esi]
        sub edx, dword [byte esi+04h]
        imul eax, edx
        imul ebx, ecx
        sub ebx, eax
        mov eax, ebx
        pop esi
        ret
        push ebx
        push ecx
        test edx, edx
        je short .1
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.1:
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; RasterMappedTriangle                            C65F8  96 PC, low confidence
; Draws a mapped triangle row by row with scaled spans
;-----------------------------------------------------------------------------
RasterMappedTriangle:
        push esi
        push edi
        push ebp
        sub esp, byte 7Ch
        mov esi, dword [dword esp+08Ch]
        mov eax, dword [byte esi+02h]
        sar eax, 10h
        push ScaledRowBuffer
        mov dword [byte esp+068h], eax
        lea eax, [byte esi+010h]
        push eax
        call SetBlitSource
        add esp, byte 8
        xor edx, edx
        push esi
        mov dword [byte esp+06Ch], edx
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 20h
        jne short .1
        mov dword [byte esp+068h], 2
.1:
        push esi
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 10h
        jne short .2
        mov dword [byte esp+068h], 1
.2:
        mov eax, dword [dword esp+094h]
        xor esi, esi
        mov edx, dword [dword esp+094h]
        mov dword [byte esp+030h], esi
        mov eax, dword [byte eax+0Ch]
        mov ebp, dword [byte edx+04h]
        mov dword [byte esp+02Ch], esi
        cmp eax, ebp
        jle short .3
        mov dword [byte esp+030h], 1
.3:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add edx, eax
        mov eax, dword [dword esp+094h]
        mov ebx, dword [byte edx+04h]
        cmp ebx, dword [byte eax+0Ch]
        jle short .4
        mov dword [byte esp+02Ch], 1
.4:
        mov edx, dword [byte esp+030h]
        mov esi, dword [dword esp+094h]
        shl edx, 3
        add edx, esi
        mov eax, dword [byte esi+014h]
        cmp eax, dword [byte edx+04h]
        jle short .5
        mov dword [byte esp+030h], 2
.5:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte edx+014h]
        cmp edx, dword [byte eax+04h]
        jge short .6
        mov dword [byte esp+02Ch], 2
.6:
        mov eax, dword [byte esp+02Ch]
        mov esi, dword [byte esp+030h]
        mov edx, 3
        or eax, esi
        sub edx, eax
        mov edi, dword [dword esp+094h]
        mov dword [byte esp+018h], edx
        lea eax, [nosplit edx*8+00h]
        add eax, edi
        mov edx, dword [byte eax+04h]
        mov eax, dword [eax]
        mov dword [byte esp+024h], edx
        mov dword [byte esp+020h], eax
        mov eax, edx
        lea edx, [nosplit esi*8+00h]
        mov esi, dword [byte esp+02Ch]
        sar eax, 10h
        shl esi, 3
        add edx, edi
        add esi, edi
        mov dword [byte esp+0Ch], eax
        mov eax, dword [edx]
        sub eax, dword [esi]
        mov ecx, dword [byte esi+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte edx+04h]
        sub eax, ecx
        mov dword [byte esp+028h], eax
        cmp eax, 10000h
        jl near .58
        mov edx, dword [byte esp+024h]
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        sub edx, ecx
        imul edx
        idiv ebx
        mov edx, dword [esi]
        add edx, eax
        mov esi, dword [byte esp+020h]
        mov dword [byte esp+014h], edx
        xor eax, eax
        sub esi, edx
        mov dword [byte esp+010h], eax
        mov edi, esi
        test esi, esi
        jge short .7
        mov ebx, 1
        neg esi
        mov dword [byte esp+010h], ebx
.7:
        cmp esi, 10000h
        jl near .58
        cmp esi, 6000000h
        jge near .58
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebp, dword [dword esp+090h]
        add edx, eax
        mov ecx, dword [byte esp+024h]
        mov dword [byte esp+04h], edx
        mov edx, dword [byte edx+04h]
        add ebp, eax
        sub edx, ecx
        mov ecx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+090h]
        shl ecx, 3
        add ecx, eax
        mov ebx, dword [byte ebp+00h]
        mov eax, dword [ecx]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+00h]
        add edx, eax
        mov dword [esp], edx
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte esp+024h]
        mov edx, dword [byte edx+04h]
        mov ebx, dword [byte ebp+04h]
        sub edx, eax
        mov eax, dword [byte ecx+04h]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+04h]
        add edx, eax
        mov eax, dword [byte esp+018h]
        mov ecx, dword [dword esp+090h]
        shl eax, 3
        add eax, ecx
        mov ebp, dword [esp]
        mov eax, dword [eax]
        mov dword [byte esp+08h], edx
        sub eax, ebp
        test edi, edi
        je short .8
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.8:
        mov ebp, eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ebx, dword [byte esp+08h]
        mov eax, dword [byte eax+04h]
        sub eax, ebx
        test edi, edi
        je short .9
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.9:
        sar esi, 10h
        inc esi
        push esi
        mov ecx, dword [byte esp+068h]
        push ecx
        push eax
        push ebp
        push dword 8000h
        push dword 8000h
        push ScaledRowBuffer
        call BuildSpanOffsets
        add esp, byte 1Ch
        mov edx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+094h]
        shl edx, 3
        mov edi, dword [dword esp+090h]
        add eax, edx
        add edx, edi
        mov esi, dword [byte eax+04h]
        mov ebp, dword [eax]
        mov edi, dword [edx]
        mov edx, dword [byte edx+04h]
        sar esi, 10h
        mov dword [byte esp+078h], edx
        mov edx, dword [byte esp+010h]
        mov dword [byte esp+074h], ebp
        test edx, edx
        je near .12
        mov edx, dword [byte esp+018h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [edx]
        mov ebx, dword [byte eax+04h]
        mov edx, edi
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .10
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .11
.10:
        mov eax, edx
.11:
        mov ebx, dword [byte esp+018h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        mov edx, dword [byte esp+02Ch]
        add ebx, eax
        shl edx, 3
        mov ecx, dword [byte ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte edx+eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ecx, dword [byte esp+024h]
        mov ebx, dword [byte edx+04h]
        sub ebx, ecx
        je near .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp near .15
.12:
        mov ebx, dword [byte esp+030h]
        mov edx, dword [dword esp+090h]
        shl ebx, 3
        mov ecx, edi
        sub ecx, dword [edx+ebx]
        mov edx, ecx
        mov ecx, dword [dword esp+094h]
        add ecx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, dword [byte ecx+04h]
        je short .13
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .14
.13:
        mov eax, edx
.14:
        mov edx, dword [byte esp+02Ch]
        mov ebx, dword [byte esp+030h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        shl edx, 3
        lea ecx, [eax+ebx]
        mov eax, dword [byte edx+eax+04h]
        sub eax, dword [byte ecx+04h]
        mov ecx, dword [dword esp+094h]
        add ecx, edx
        mov edx, dword [dword esp+094h]
        add edx, ebx
        mov ebx, dword [byte ecx+04h]
        sub ebx, dword [byte edx+04h]
        je short .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.15:
        mov dword [byte esp+06Ch], eax
        cmp esi, dword [byte esp+0Ch]
        jge near .36
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebx, dword [byte esp+010h]
        add eax, edx
        test ebx, ebx
        je short .20
        mov ebx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ecx, dword [byte esp+024h]
        sub edx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, ecx
        je short .16
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .17
.16:
        mov eax, edx
.17:
        mov dword [byte esp+048h], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .18
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .19
.18:
        mov eax, dword [byte esp+01Ch]
.19:
        mov dword [byte esp+044h], eax
        jmp short .25
.20:
        mov ecx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ebx, dword [byte eax+04h]
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .21
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .22
.21:
        mov eax, edx
.22:
        mov edx, dword [byte esp+028h]
        mov dword [byte esp+044h], eax
        test edx, edx
        je short .23
        mov eax, dword [byte esp+01Ch]
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .24
.23:
        mov eax, dword [byte esp+01Ch]
.24:
        mov dword [byte esp+048h], eax
.25:
        mov edx, dword [byte esp+0Ch]
        mov eax, dword [DrawClipBottom]
        cmp eax, edx
        jge short .26
        mov ebx, eax
        jmp short .27
.26:
        mov ebx, edx
.27:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+038h], ebx
        cmp esi, ecx
        jl near .30
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ecx, dword [DrawClipLeft]
        mov edx, dword [eax]
        cmp edx, ecx
        jl near .30
        mov eax, edx
        mov edx, dword [DrawClipRight]
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+020h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+014h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        lea eax, [nosplit esi*4+00h]
        shl ebx, 2
        mov dword [byte esp+05Ch], eax
        mov dword [byte esp+03Ch], ebx
.28:
        mov eax, dword [byte esp+05Ch]
        cmp eax, dword [byte esp+03Ch]
        jge near .36
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .29
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+060h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyScaledSpan
        add esp, byte 0Ch
.29:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+05Ch]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+05Ch], eax
        jmp near .28
.30:
        lea eax, [nosplit esi*4+00h]
.31:
        mov dword [byte esp+058h], eax
        cmp esi, dword [byte esp+038h]
        jge near .36
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .32
        sub eax, ebx
.32:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .33
        sub eax, ebx
        add edx, ebx
        jmp short .34
.33:
        xor ebx, ebx
.34:
        test eax, eax
        jle short .35
        cmp esi, dword [DrawClipTop]
        jl short .35
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+05Ch]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyScaledSpan
        add esp, byte 0Ch
.35:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+058h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .31
.36:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte eax+04h]
        sar edx, 10h
        cmp esi, edx
        jge near .58
        cmp dword [byte esp+010h], byte 0
        je near .43
        mov edx, dword [byte esp+020h]
        mov ebx, dword [eax]
        mov ecx, dword [byte eax+04h]
        sub edx, ebx
        mov ebx, dword [byte esp+024h]
        sub ebx, ecx
        je short .37
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .38
.37:
        mov eax, edx
.38:
        mov edi, dword [byte esp+028h]
        mov dword [byte esp+050h], eax
        test edi, edi
        je short .39
        mov eax, dword [byte esp+01Ch]
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .40
.39:
        mov eax, dword [byte esp+01Ch]
.40:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+020h]
        mov dword [byte esp+074h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edi, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esp+030h]
        mov dword [byte esp+078h], eax
        mov eax, dword [dword esp+090h]
        shl edx, 3
        mov ebx, dword [dword esp+094h]
        mov ecx, dword [edx+eax]
        mov eax, edi
        add edx, ebx
        mov ebx, dword [byte esp+024h]
        sub eax, ecx
        sub ebx, dword [byte edx+04h]
        je short .41
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.41:
        mov dword [byte esp+070h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        mov ecx, dword [byte edx+ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ebx, dword [byte esp+024h]
        sub ebx, dword [byte edx+04h]
        je short .42
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.42:
        mov dword [byte esp+06Ch], eax
        jmp short .48
.43:
        mov edx, dword [byte esp+020h]
        mov ebx, dword [byte esp+024h]
        mov ecx, dword [eax]
        mov ebp, dword [byte eax+04h]
        sub edx, ecx
        sub ebx, ebp
        je short .44
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .45
.44:
        mov eax, edx
.45:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .46
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .47
.46:
        mov eax, dword [byte esp+01Ch]
.47:
        mov ebp, dword [byte esp+020h]
        mov dword [byte esp+050h], eax
.48:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov eax, dword [byte eax+04h]
        mov ebx, dword [DrawClipBottom]
        sar eax, 10h
        cmp eax, ebx
        jle short .49
        mov eax, ebx
.49:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+034h], eax
        cmp esi, ecx
        jl near .52
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [DrawClipLeft]
        mov ebx, dword [edx]
        cmp ebx, ecx
        jl near .52
        mov edx, ebx
        mov ebx, dword [DrawClipRight]
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+020h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+014h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        lea edx, [nosplit esi*4+00h]
        shl eax, 2
        mov dword [byte esp+060h], edx
        mov dword [byte esp+040h], eax
.50:
        mov eax, dword [byte esp+060h]
        cmp eax, dword [byte esp+040h]
        jge near .58
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .51
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+064h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyScaledSpan
        add esp, byte 0Ch
.51:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+060h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+060h], eax
        jmp near .50
.52:
        lea eax, [nosplit esi*4+00h]
.53:
        mov dword [byte esp+054h], eax
        cmp esi, dword [byte esp+034h]
        jge near .58
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .54
        sub eax, ebx
.54:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .55
        sub eax, ebx
        add edx, ebx
        jmp short .56
.55:
        xor ebx, ebx
.56:
        test eax, eax
        jle short .57
        cmp esi, dword [DrawClipTop]
        jl short .57
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+058h]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyScaledSpan
        add esp, byte 0Ch
.57:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+054h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .53
.58:
        add esp, byte 7Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; DrawMappedTriangle                              C6FA4  96 PC, low confidence
; Draws a mapped triangle, opaque
;-----------------------------------------------------------------------------
DrawMappedTriangle:
        sub esp, byte 30h
        mov edx, dword [byte esp+038h]
        mov eax, dword [byte esp+03Ch]
        mov ebx, dword [edx]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+018h], ebx
        mov ebx, dword [byte edx+04h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+01Ch], ebx
        mov ebx, dword [byte edx+08h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+020h], ebx
        mov ebx, dword [byte edx+0Ch]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+024h], ebx
        mov ebx, dword [byte edx+010h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+028h], ebx
        mov edx, dword [byte edx+014h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+02Ch], edx
        mov edx, dword [eax]
        shl edx, 10h
        add edx, 8000h
        mov dword [esp], edx
        mov edx, dword [byte eax+04h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+04h], edx
        mov edx, dword [byte eax+08h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+08h], edx
        mov edx, dword [byte eax+0Ch]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+0Ch], edx
        mov edx, dword [byte eax+010h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+010h], edx
        mov eax, dword [byte eax+014h]
        shl eax, 10h
        add eax, 8000h
        mov dword [byte esp+014h], eax
        mov eax, esp
        push eax
        lea eax, [byte esp+01Ch]
        push eax
        mov edx, dword [byte esp+03Ch]
        push edx
        call RasterMappedTriangle
        add esp, byte 0Ch
        add esp, byte 30h
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        push ebx
        push ecx
        test edx, edx
        je short .1
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.1:
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; RasterMappedTriangleShadow                      C70A8  96 PC, low confidence
; Draws a mapped triangle row by row with see-through and shadow spans
;-----------------------------------------------------------------------------
RasterMappedTriangleShadow:
        push esi
        push edi
        push ebp
        sub esp, byte 7Ch
        mov esi, dword [dword esp+08Ch]
        mov eax, dword [byte esi+02h]
        sar eax, 10h
        push ScaledRowBuffer
        mov dword [byte esp+068h], eax
        lea eax, [byte esi+010h]
        push eax
        call SetBlitSource
        add esp, byte 8
        xor edx, edx
        push esi
        mov dword [byte esp+06Ch], edx
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 20h
        jne short .1
        mov dword [byte esp+068h], 2
.1:
        push esi
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 10h
        jne short .2
        mov dword [byte esp+068h], 1
.2:
        mov eax, dword [dword esp+094h]
        xor esi, esi
        mov edx, dword [dword esp+094h]
        mov dword [byte esp+030h], esi
        mov eax, dword [byte eax+0Ch]
        mov ebp, dword [byte edx+04h]
        mov dword [byte esp+02Ch], esi
        cmp eax, ebp
        jle short .3
        mov dword [byte esp+030h], 1
.3:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add edx, eax
        mov eax, dword [dword esp+094h]
        mov ebx, dword [byte edx+04h]
        cmp ebx, dword [byte eax+0Ch]
        jle short .4
        mov dword [byte esp+02Ch], 1
.4:
        mov edx, dword [byte esp+030h]
        mov esi, dword [dword esp+094h]
        shl edx, 3
        add edx, esi
        mov eax, dword [byte esi+014h]
        cmp eax, dword [byte edx+04h]
        jle short .5
        mov dword [byte esp+030h], 2
.5:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte edx+014h]
        cmp edx, dword [byte eax+04h]
        jge short .6
        mov dword [byte esp+02Ch], 2
.6:
        mov eax, dword [byte esp+02Ch]
        mov esi, dword [byte esp+030h]
        mov edx, 3
        or eax, esi
        sub edx, eax
        mov edi, dword [dword esp+094h]
        mov dword [byte esp+018h], edx
        lea eax, [nosplit edx*8+00h]
        add eax, edi
        mov edx, dword [byte eax+04h]
        mov eax, dword [eax]
        mov dword [byte esp+024h], edx
        mov dword [byte esp+020h], eax
        mov eax, edx
        lea edx, [nosplit esi*8+00h]
        mov esi, dword [byte esp+02Ch]
        sar eax, 10h
        shl esi, 3
        add edx, edi
        add esi, edi
        mov dword [byte esp+0Ch], eax
        mov eax, dword [edx]
        sub eax, dword [esi]
        mov ecx, dword [byte esi+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte edx+04h]
        sub eax, ecx
        mov dword [byte esp+028h], eax
        cmp eax, 10000h
        jl near .58
        mov edx, dword [byte esp+024h]
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        sub edx, ecx
        imul edx
        idiv ebx
        mov edx, dword [esi]
        add edx, eax
        mov esi, dword [byte esp+020h]
        mov dword [byte esp+014h], edx
        xor eax, eax
        sub esi, edx
        mov dword [byte esp+010h], eax
        mov edi, esi
        test esi, esi
        jge short .7
        mov ebx, 1
        neg esi
        mov dword [byte esp+010h], ebx
.7:
        cmp esi, 10000h
        jl near .58
        cmp esi, 6000000h
        jge near .58
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebp, dword [dword esp+090h]
        add edx, eax
        mov ecx, dword [byte esp+024h]
        mov dword [byte esp+04h], edx
        mov edx, dword [byte edx+04h]
        add ebp, eax
        sub edx, ecx
        mov ecx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+090h]
        shl ecx, 3
        add ecx, eax
        mov ebx, dword [byte ebp+00h]
        mov eax, dword [ecx]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+00h]
        add edx, eax
        mov dword [esp], edx
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte esp+024h]
        mov edx, dword [byte edx+04h]
        mov ebx, dword [byte ebp+04h]
        sub edx, eax
        mov eax, dword [byte ecx+04h]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+04h]
        add edx, eax
        mov eax, dword [byte esp+018h]
        mov ecx, dword [dword esp+090h]
        shl eax, 3
        add eax, ecx
        mov ebp, dword [esp]
        mov eax, dword [eax]
        mov dword [byte esp+08h], edx
        sub eax, ebp
        test edi, edi
        je short .8
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.8:
        mov ebp, eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ebx, dword [byte esp+08h]
        mov eax, dword [byte eax+04h]
        sub eax, ebx
        test edi, edi
        je short .9
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.9:
        sar esi, 10h
        inc esi
        push esi
        mov ecx, dword [byte esp+068h]
        push ecx
        push eax
        push ebp
        push dword 8000h
        push dword 8000h
        push ScaledRowBuffer
        call BuildSpanOffsets
        add esp, byte 1Ch
        mov edx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+094h]
        shl edx, 3
        mov edi, dword [dword esp+090h]
        add eax, edx
        add edx, edi
        mov esi, dword [byte eax+04h]
        mov ebp, dword [eax]
        mov edi, dword [edx]
        mov edx, dword [byte edx+04h]
        sar esi, 10h
        mov dword [byte esp+078h], edx
        mov edx, dword [byte esp+010h]
        mov dword [byte esp+074h], ebp
        test edx, edx
        je near .12
        mov edx, dword [byte esp+018h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [edx]
        mov ebx, dword [byte eax+04h]
        mov edx, edi
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .10
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .11
.10:
        mov eax, edx
.11:
        mov ebx, dword [byte esp+018h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        mov edx, dword [byte esp+02Ch]
        add ebx, eax
        shl edx, 3
        mov ecx, dword [byte ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte edx+eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ecx, dword [byte esp+024h]
        mov ebx, dword [byte edx+04h]
        sub ebx, ecx
        je near .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp near .15
.12:
        mov ebx, dword [byte esp+030h]
        mov edx, dword [dword esp+090h]
        shl ebx, 3
        mov ecx, edi
        sub ecx, dword [edx+ebx]
        mov edx, ecx
        mov ecx, dword [dword esp+094h]
        add ecx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, dword [byte ecx+04h]
        je short .13
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .14
.13:
        mov eax, edx
.14:
        mov edx, dword [byte esp+02Ch]
        mov ebx, dword [byte esp+030h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        shl edx, 3
        lea ecx, [eax+ebx]
        mov eax, dword [byte edx+eax+04h]
        sub eax, dword [byte ecx+04h]
        mov ecx, dword [dword esp+094h]
        add ecx, edx
        mov edx, dword [dword esp+094h]
        add edx, ebx
        mov ebx, dword [byte ecx+04h]
        sub ebx, dword [byte edx+04h]
        je short .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.15:
        mov dword [byte esp+06Ch], eax
        cmp esi, dword [byte esp+0Ch]
        jge near .36
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebx, dword [byte esp+010h]
        add eax, edx
        test ebx, ebx
        je short .20
        mov ebx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ecx, dword [byte esp+024h]
        sub edx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, ecx
        je short .16
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .17
.16:
        mov eax, edx
.17:
        mov dword [byte esp+048h], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .18
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .19
.18:
        mov eax, dword [byte esp+01Ch]
.19:
        mov dword [byte esp+044h], eax
        jmp short .25
.20:
        mov ecx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ebx, dword [byte eax+04h]
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .21
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .22
.21:
        mov eax, edx
.22:
        mov edx, dword [byte esp+028h]
        mov dword [byte esp+044h], eax
        test edx, edx
        je short .23
        mov eax, dword [byte esp+01Ch]
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .24
.23:
        mov eax, dword [byte esp+01Ch]
.24:
        mov dword [byte esp+048h], eax
.25:
        mov edx, dword [byte esp+0Ch]
        mov eax, dword [DrawClipBottom]
        cmp eax, edx
        jge short .26
        mov ebx, eax
        jmp short .27
.26:
        mov ebx, edx
.27:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+038h], ebx
        cmp esi, ecx
        jl near .30
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ecx, dword [DrawClipLeft]
        mov edx, dword [eax]
        cmp edx, ecx
        jl near .30
        mov eax, edx
        mov edx, dword [DrawClipRight]
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+020h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+014h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        lea eax, [nosplit esi*4+00h]
        shl ebx, 2
        mov dword [byte esp+05Ch], eax
        mov dword [byte esp+03Ch], ebx
.28:
        mov eax, dword [byte esp+05Ch]
        cmp eax, dword [byte esp+03Ch]
        jge near .36
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .29
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+060h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyScaledSpanShadow
        add esp, byte 0Ch
.29:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+05Ch]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+05Ch], eax
        jmp near .28
.30:
        lea eax, [nosplit esi*4+00h]
.31:
        mov dword [byte esp+058h], eax
        cmp esi, dword [byte esp+038h]
        jge near .36
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .32
        sub eax, ebx
.32:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .33
        sub eax, ebx
        add edx, ebx
        jmp short .34
.33:
        xor ebx, ebx
.34:
        test eax, eax
        jle short .35
        cmp esi, dword [DrawClipTop]
        jl short .35
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+05Ch]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyScaledSpanShadow
        add esp, byte 0Ch
.35:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+058h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .31
.36:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte eax+04h]
        sar edx, 10h
        cmp esi, edx
        jge near .58
        cmp dword [byte esp+010h], byte 0
        je near .43
        mov edx, dword [byte esp+020h]
        mov ebx, dword [eax]
        mov ecx, dword [byte eax+04h]
        sub edx, ebx
        mov ebx, dword [byte esp+024h]
        sub ebx, ecx
        je short .37
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .38
.37:
        mov eax, edx
.38:
        mov edi, dword [byte esp+028h]
        mov dword [byte esp+050h], eax
        test edi, edi
        je short .39
        mov eax, dword [byte esp+01Ch]
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .40
.39:
        mov eax, dword [byte esp+01Ch]
.40:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+020h]
        mov dword [byte esp+074h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edi, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esp+030h]
        mov dword [byte esp+078h], eax
        mov eax, dword [dword esp+090h]
        shl edx, 3
        mov ebx, dword [dword esp+094h]
        mov ecx, dword [edx+eax]
        mov eax, edi
        add edx, ebx
        mov ebx, dword [byte esp+024h]
        sub eax, ecx
        sub ebx, dword [byte edx+04h]
        je short .41
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.41:
        mov dword [byte esp+070h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        mov ecx, dword [byte edx+ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ebx, dword [byte esp+024h]
        sub ebx, dword [byte edx+04h]
        je short .42
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.42:
        mov dword [byte esp+06Ch], eax
        jmp short .48
.43:
        mov edx, dword [byte esp+020h]
        mov ebx, dword [byte esp+024h]
        mov ecx, dword [eax]
        mov ebp, dword [byte eax+04h]
        sub edx, ecx
        sub ebx, ebp
        je short .44
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .45
.44:
        mov eax, edx
.45:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .46
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .47
.46:
        mov eax, dword [byte esp+01Ch]
.47:
        mov ebp, dword [byte esp+020h]
        mov dword [byte esp+050h], eax
.48:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov eax, dword [byte eax+04h]
        mov ebx, dword [DrawClipBottom]
        sar eax, 10h
        cmp eax, ebx
        jle short .49
        mov eax, ebx
.49:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+034h], eax
        cmp esi, ecx
        jl near .52
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [DrawClipLeft]
        mov ebx, dword [edx]
        cmp ebx, ecx
        jl near .52
        mov edx, ebx
        mov ebx, dword [DrawClipRight]
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+020h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+014h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        lea edx, [nosplit esi*4+00h]
        shl eax, 2
        mov dword [byte esp+060h], edx
        mov dword [byte esp+040h], eax
.50:
        mov eax, dword [byte esp+060h]
        cmp eax, dword [byte esp+040h]
        jge near .58
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .51
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+064h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyScaledSpanShadow
        add esp, byte 0Ch
.51:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+060h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+060h], eax
        jmp near .50
.52:
        lea eax, [nosplit esi*4+00h]
.53:
        mov dword [byte esp+054h], eax
        cmp esi, dword [byte esp+034h]
        jge near .58
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .54
        sub eax, ebx
.54:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .55
        sub eax, ebx
        add edx, ebx
        jmp short .56
.55:
        xor ebx, ebx
.56:
        test eax, eax
        jle short .57
        cmp esi, dword [DrawClipTop]
        jl short .57
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+058h]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyScaledSpanShadow
        add esp, byte 0Ch
.57:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+054h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .53
.58:
        add esp, byte 7Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; DrawMappedTriangleShadow                        C7A54  96 PC, low confidence
; Draws a mapped triangle with see-through and shadow colours
;-----------------------------------------------------------------------------
DrawMappedTriangleShadow:
        sub esp, byte 30h
        mov edx, dword [byte esp+038h]
        mov eax, dword [byte esp+03Ch]
        mov ebx, dword [edx]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+018h], ebx
        mov ebx, dword [byte edx+04h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+01Ch], ebx
        mov ebx, dword [byte edx+08h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+020h], ebx
        mov ebx, dword [byte edx+0Ch]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+024h], ebx
        mov ebx, dword [byte edx+010h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+028h], ebx
        mov edx, dword [byte edx+014h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+02Ch], edx
        mov edx, dword [eax]
        shl edx, 10h
        add edx, 8000h
        mov dword [esp], edx
        mov edx, dword [byte eax+04h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+04h], edx
        mov edx, dword [byte eax+08h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+08h], edx
        mov edx, dword [byte eax+0Ch]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+0Ch], edx
        mov edx, dword [byte eax+010h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+010h], edx
        mov eax, dword [byte eax+014h]
        shl eax, 10h
        add eax, 8000h
        mov dword [byte esp+014h], eax
        mov eax, esp
        push eax
        lea eax, [byte esp+01Ch]
        push eax
        mov edx, dword [byte esp+03Ch]
        push edx
        call RasterMappedTriangleShadow
        add esp, byte 0Ch
        add esp, byte 30h
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        push ebx
        push ecx
        test edx, edx
        je short .1
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.1:
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; RasterShapeTriangle                          C7B58  96 PC, medium confidence
; Draws one triangle of a shape mapped onto screen coordinates, stepping
; source and destination edges in fixed point
;-----------------------------------------------------------------------------
RasterShapeTriangle:
        push esi
        push edi
        push ebp
        sub esp, byte 7Ch
        mov esi, dword [dword esp+08Ch]
        mov eax, dword [byte esi+02h]
        sar eax, 10h
        push ScaledRowBuffer
        mov dword [byte esp+068h], eax
        lea eax, [byte esi+010h]
        push eax
        call SetBlitSource
        add esp, byte 8
        xor edx, edx
        push esi
        mov dword [byte esp+06Ch], edx
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 20h
        jne short .1
        mov dword [byte esp+068h], 2
.1:
        push esi
        call ArtBitDepth
        add esp, byte 4
        cmp eax, byte 10h
        jne short .2
        mov dword [byte esp+068h], 1
.2:
        mov eax, dword [dword esp+094h]
        xor esi, esi
        mov edx, dword [dword esp+094h]
        mov dword [byte esp+030h], esi
        mov eax, dword [byte eax+0Ch]
        mov ebp, dword [byte edx+04h]
        mov dword [byte esp+02Ch], esi
        cmp eax, ebp
        jle short .3
        mov dword [byte esp+030h], 1
.3:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add edx, eax
        mov eax, dword [dword esp+094h]
        mov ebx, dword [byte edx+04h]
        cmp ebx, dword [byte eax+0Ch]
        jle short .4
        mov dword [byte esp+02Ch], 1
.4:
        mov edx, dword [byte esp+030h]
        mov esi, dword [dword esp+094h]
        shl edx, 3
        add edx, esi
        mov eax, dword [byte esi+014h]
        cmp eax, dword [byte edx+04h]
        jle short .5
        mov dword [byte esp+030h], 2
.5:
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte edx+014h]
        cmp edx, dword [byte eax+04h]
        jge short .6
        mov dword [byte esp+02Ch], 2
.6:
        mov eax, dword [byte esp+02Ch]
        mov esi, dword [byte esp+030h]
        mov edx, 3
        or eax, esi
        sub edx, eax
        mov edi, dword [dword esp+094h]
        mov dword [byte esp+018h], edx
        lea eax, [nosplit edx*8+00h]
        add eax, edi
        mov edx, dword [byte eax+04h]
        mov eax, dword [eax]
        mov dword [byte esp+024h], edx
        mov dword [byte esp+020h], eax
        mov eax, edx
        lea edx, [nosplit esi*8+00h]
        mov esi, dword [byte esp+02Ch]
        sar eax, 10h
        shl esi, 3
        add edx, edi
        add esi, edi
        mov dword [byte esp+0Ch], eax
        mov eax, dword [edx]
        sub eax, dword [esi]
        mov ecx, dword [byte esi+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte edx+04h]
        sub eax, ecx
        mov dword [byte esp+028h], eax
        cmp eax, 10000h
        jl near .58
        mov edx, dword [byte esp+024h]
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        sub edx, ecx
        imul edx
        idiv ebx
        mov edx, dword [esi]
        add edx, eax
        mov esi, dword [byte esp+020h]
        mov dword [byte esp+014h], edx
        xor eax, eax
        sub esi, edx
        mov dword [byte esp+010h], eax
        mov edi, esi
        test esi, esi
        jge short .7
        mov ebx, 1
        neg esi
        mov dword [byte esp+010h], ebx
.7:
        cmp esi, 10000h
        jl near .58
        cmp esi, 6000000h
        jge near .58
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebp, dword [dword esp+090h]
        add edx, eax
        mov ecx, dword [byte esp+024h]
        mov dword [byte esp+04h], edx
        mov edx, dword [byte edx+04h]
        add ebp, eax
        sub edx, ecx
        mov ecx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+090h]
        shl ecx, 3
        add ecx, eax
        mov ebx, dword [byte ebp+00h]
        mov eax, dword [ecx]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+00h]
        add edx, eax
        mov dword [esp], edx
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte esp+024h]
        mov edx, dword [byte edx+04h]
        mov ebx, dword [byte ebp+04h]
        sub edx, eax
        mov eax, dword [byte ecx+04h]
        sub eax, ebx
        mov ebx, dword [byte esp+028h]
        imul edx
        idiv ebx
        mov edx, dword [byte ebp+04h]
        add edx, eax
        mov eax, dword [byte esp+018h]
        mov ecx, dword [dword esp+090h]
        shl eax, 3
        add eax, ecx
        mov ebp, dword [esp]
        mov eax, dword [eax]
        mov dword [byte esp+08h], edx
        sub eax, ebp
        test edi, edi
        je short .8
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.8:
        mov ebp, eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ebx, dword [byte esp+08h]
        mov eax, dword [byte eax+04h]
        sub eax, ebx
        test edi, edi
        je short .9
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.9:
        sar esi, 10h
        inc esi
        push esi
        mov ecx, dword [byte esp+068h]
        push ecx
        push eax
        push ebp
        push dword 8000h
        push dword 8000h
        push ScaledRowBuffer
        call BuildSpanOffsets
        add esp, byte 1Ch
        mov edx, dword [byte esp+02Ch]
        mov eax, dword [dword esp+094h]
        shl edx, 3
        mov edi, dword [dword esp+090h]
        add eax, edx
        add edx, edi
        mov esi, dword [byte eax+04h]
        mov ebp, dword [eax]
        mov edi, dword [edx]
        mov edx, dword [byte edx+04h]
        sar esi, 10h
        mov dword [byte esp+078h], edx
        mov edx, dword [byte esp+010h]
        mov dword [byte esp+074h], ebp
        test edx, edx
        je near .12
        mov edx, dword [byte esp+018h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [edx]
        mov ebx, dword [byte eax+04h]
        mov edx, edi
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .10
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .11
.10:
        mov eax, edx
.11:
        mov ebx, dword [byte esp+018h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        mov edx, dword [byte esp+02Ch]
        add ebx, eax
        shl edx, 3
        mov ecx, dword [byte ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte edx+eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ecx, dword [byte esp+024h]
        mov ebx, dword [byte edx+04h]
        sub ebx, ecx
        je near .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp near .15
.12:
        mov ebx, dword [byte esp+030h]
        mov edx, dword [dword esp+090h]
        shl ebx, 3
        mov ecx, edi
        sub ecx, dword [edx+ebx]
        mov edx, ecx
        mov ecx, dword [dword esp+094h]
        add ecx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, dword [byte ecx+04h]
        je short .13
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .14
.13:
        mov eax, edx
.14:
        mov edx, dword [byte esp+02Ch]
        mov ebx, dword [byte esp+030h]
        mov dword [byte esp+070h], eax
        mov eax, dword [dword esp+090h]
        shl ebx, 3
        shl edx, 3
        lea ecx, [eax+ebx]
        mov eax, dword [byte edx+eax+04h]
        sub eax, dword [byte ecx+04h]
        mov ecx, dword [dword esp+094h]
        add ecx, edx
        mov edx, dword [dword esp+094h]
        add edx, ebx
        mov ebx, dword [byte ecx+04h]
        sub ebx, dword [byte edx+04h]
        je short .15
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.15:
        mov dword [byte esp+06Ch], eax
        cmp esi, dword [byte esp+0Ch]
        jge near .36
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        mov ebx, dword [byte esp+010h]
        add eax, edx
        test ebx, ebx
        je short .20
        mov ebx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ecx, dword [byte esp+024h]
        sub edx, ebx
        mov ebx, dword [byte eax+04h]
        sub ebx, ecx
        je short .16
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .17
.16:
        mov eax, edx
.17:
        mov dword [byte esp+048h], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .18
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .19
.18:
        mov eax, dword [byte esp+01Ch]
.19:
        mov dword [byte esp+044h], eax
        jmp short .25
.20:
        mov ecx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov ebx, dword [byte eax+04h]
        mov eax, dword [byte esp+024h]
        sub edx, ecx
        sub ebx, eax
        je short .21
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .22
.21:
        mov eax, edx
.22:
        mov edx, dword [byte esp+028h]
        mov dword [byte esp+044h], eax
        test edx, edx
        je short .23
        mov eax, dword [byte esp+01Ch]
        mov ebx, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .24
.23:
        mov eax, dword [byte esp+01Ch]
.24:
        mov dword [byte esp+048h], eax
.25:
        mov edx, dword [byte esp+0Ch]
        mov eax, dword [DrawClipBottom]
        cmp eax, edx
        jge short .26
        mov ebx, eax
        jmp short .27
.26:
        mov ebx, edx
.27:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+038h], ebx
        cmp esi, ecx
        jl near .30
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov ecx, dword [DrawClipLeft]
        mov edx, dword [eax]
        cmp edx, ecx
        jl near .30
        mov eax, edx
        mov edx, dword [DrawClipRight]
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+020h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        mov eax, dword [byte esp+014h]
        cmp eax, ecx
        jl near .30
        cmp eax, edx
        jge near .30
        lea eax, [nosplit esi*4+00h]
        shl ebx, 2
        mov dword [byte esp+05Ch], eax
        mov dword [byte esp+03Ch], ebx
.28:
        mov eax, dword [byte esp+05Ch]
        cmp eax, dword [byte esp+03Ch]
        jge near .36
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .29
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+060h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyMappedSpan
        add esp, byte 0Ch
.29:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+05Ch]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+05Ch], eax
        jmp near .28
.30:
        lea eax, [nosplit esi*4+00h]
.31:
        mov dword [byte esp+058h], eax
        cmp esi, dword [byte esp+038h]
        jge near .36
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .32
        sub eax, ebx
.32:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .33
        sub eax, ebx
        add edx, ebx
        jmp short .34
.33:
        xor ebx, ebx
.34:
        test eax, eax
        jle short .35
        cmp esi, dword [DrawClipTop]
        jl short .35
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+05Ch]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyMappedSpan
        add esp, byte 0Ch
.35:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+044h]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+048h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+058h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .31
.36:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte eax+04h]
        sar edx, 10h
        cmp esi, edx
        jge near .58
        cmp dword [byte esp+010h], byte 0
        je near .43
        mov edx, dword [byte esp+020h]
        mov ebx, dword [eax]
        mov ecx, dword [byte eax+04h]
        sub edx, ebx
        mov ebx, dword [byte esp+024h]
        sub ebx, ecx
        je short .37
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .38
.37:
        mov eax, edx
.38:
        mov edi, dword [byte esp+028h]
        mov dword [byte esp+050h], eax
        test edi, edi
        je short .39
        mov eax, dword [byte esp+01Ch]
        mov ebx, edi
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .40
.39:
        mov eax, dword [byte esp+01Ch]
.40:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+020h]
        mov dword [byte esp+074h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edi, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esp+030h]
        mov dword [byte esp+078h], eax
        mov eax, dword [dword esp+090h]
        shl edx, 3
        mov ebx, dword [dword esp+094h]
        mov ecx, dword [edx+eax]
        mov eax, edi
        add edx, ebx
        mov ebx, dword [byte esp+024h]
        sub eax, ecx
        sub ebx, dword [byte edx+04h]
        je short .41
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.41:
        mov dword [byte esp+070h], eax
        mov eax, dword [byte esp+018h]
        mov edx, dword [dword esp+090h]
        shl eax, 3
        add eax, edx
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        mov ecx, dword [byte edx+ebx+04h]
        mov ebx, dword [dword esp+094h]
        mov eax, dword [byte eax+04h]
        add edx, ebx
        sub eax, ecx
        mov ebx, dword [byte esp+024h]
        sub ebx, dword [byte edx+04h]
        je short .42
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
.42:
        mov dword [byte esp+06Ch], eax
        jmp short .48
.43:
        mov edx, dword [byte esp+020h]
        mov ebx, dword [byte esp+024h]
        mov ecx, dword [eax]
        mov ebp, dword [byte eax+04h]
        sub edx, ecx
        sub ebx, ebp
        je short .44
        mov eax, edx
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .45
.44:
        mov eax, edx
.45:
        mov dword [byte esp+04Ch], eax
        mov eax, dword [byte esp+028h]
        test eax, eax
        je short .46
        mov ebx, eax
        mov eax, dword [byte esp+01Ch]
        cdq
        shld edx, eax, 10h
        shl eax, 10h
        idiv ebx
        jmp short .47
.46:
        mov eax, dword [byte esp+01Ch]
.47:
        mov ebp, dword [byte esp+020h]
        mov dword [byte esp+050h], eax
.48:
        mov eax, dword [byte esp+030h]
        mov edx, dword [dword esp+094h]
        shl eax, 3
        add eax, edx
        mov eax, dword [byte eax+04h]
        mov ebx, dword [DrawClipBottom]
        sar eax, 10h
        cmp eax, ebx
        jle short .49
        mov eax, ebx
.49:
        mov ecx, dword [DrawClipTop]
        mov dword [byte esp+034h], eax
        cmp esi, ecx
        jl near .52
        mov edx, dword [byte esp+030h]
        mov ebx, dword [dword esp+090h]
        shl edx, 3
        add edx, ebx
        mov ecx, dword [DrawClipLeft]
        mov ebx, dword [edx]
        cmp ebx, ecx
        jl near .52
        mov edx, ebx
        mov ebx, dword [DrawClipRight]
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+020h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        mov edx, dword [byte esp+014h]
        cmp edx, ecx
        jl near .52
        cmp edx, ebx
        jge near .52
        lea edx, [nosplit esi*4+00h]
        shl eax, 2
        mov dword [byte esp+060h], edx
        mov dword [byte esp+040h], eax
.50:
        mov eax, dword [byte esp+060h]
        cmp eax, dword [byte esp+040h]
        jge near .58
        mov eax, dword [byte esp+074h]
        mov edx, ebp
        sar eax, 10h
        sar edx, 10h
        sub edx, eax
        test edx, edx
        jle short .51
        push edx
        mov edx, dword [byte esp+07Ch]
        mov ebx, dword [byte esp+068h]
        sar edx, 10h
        imul ebx, edx
        mov edx, edi
        sar edx, 10h
        mov cl, byte [byte esp+06Ch]
        add edx, ebx
        shl edx, cl
        mov ebx, dword [byte esp+064h]
        push edx
        mov edx, dword [DrawDestBuffer]
        add edx, ebx
        add eax, dword [edx]
        push eax
        call CopyMappedSpan
        add esp, byte 0Ch
.51:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+060h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        mov dword [byte esp+060h], eax
        jmp near .50
.52:
        lea eax, [nosplit esi*4+00h]
.53:
        mov dword [byte esp+054h], eax
        cmp esi, dword [byte esp+034h]
        jge near .58
        mov edx, dword [byte esp+074h]
        mov eax, ebp
        sar edx, 10h
        sar eax, 10h
        sub eax, edx
        mov ecx, dword [DrawClipRight]
        lea ebx, [edx+eax]
        sub ebx, ecx
        test ebx, ebx
        jle short .54
        sub eax, ebx
.54:
        mov ebx, dword [DrawClipLeft]
        sub ebx, edx
        test ebx, ebx
        jle short .55
        sub eax, ebx
        add edx, ebx
        jmp short .56
.55:
        xor ebx, ebx
.56:
        test eax, eax
        jle short .57
        cmp esi, dword [DrawClipTop]
        jl short .57
        push eax
        mov eax, dword [byte esp+07Ch]
        mov ecx, dword [byte esp+068h]
        sar eax, 10h
        imul ecx, eax
        mov eax, edi
        sar eax, 10h
        add eax, ecx
        add eax, dword [nosplit ebx*4+ScaledRowBuffer]
        mov cl, byte [byte esp+06Ch]
        shl eax, cl
        mov ebx, dword [byte esp+058h]
        push eax
        mov eax, dword [DrawDestBuffer]
        add eax, ebx
        add edx, dword [eax]
        push edx
        call CopyMappedSpan
        add esp, byte 0Ch
.57:
        mov eax, dword [byte esp+070h]
        mov edx, dword [byte esp+078h]
        mov ebx, dword [byte esp+074h]
        mov ecx, dword [byte esp+04Ch]
        add edi, eax
        mov eax, dword [byte esp+06Ch]
        inc esi
        add edx, eax
        mov eax, dword [byte esp+050h]
        add ebp, ecx
        add ebx, eax
        mov eax, dword [byte esp+054h]
        mov dword [byte esp+078h], edx
        add eax, byte 4
        mov dword [byte esp+074h], ebx
        jmp near .53
.58:
        add esp, byte 7Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; DrawShapeTriangleMapped                         C8504  96 PC, low confidence
; Converts a source and a destination triangle to 16.16 fixed point and draws
; the mapped shape triangle
;-----------------------------------------------------------------------------
DrawShapeTriangleMapped:
        sub esp, byte 30h
        mov edx, dword [byte esp+038h]
        mov eax, dword [byte esp+03Ch]
        mov ebx, dword [edx]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+018h], ebx
        mov ebx, dword [byte edx+04h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+01Ch], ebx
        mov ebx, dword [byte edx+08h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+020h], ebx
        mov ebx, dword [byte edx+0Ch]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+024h], ebx
        mov ebx, dword [byte edx+010h]
        shl ebx, 10h
        add ebx, 8000h
        mov dword [byte esp+028h], ebx
        mov edx, dword [byte edx+014h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+02Ch], edx
        mov edx, dword [eax]
        shl edx, 10h
        add edx, 8000h
        mov dword [esp], edx
        mov edx, dword [byte eax+04h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+04h], edx
        mov edx, dword [byte eax+08h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+08h], edx
        mov edx, dword [byte eax+0Ch]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+0Ch], edx
        mov edx, dword [byte eax+010h]
        shl edx, 10h
        add edx, 8000h
        mov dword [byte esp+010h], edx
        mov eax, dword [byte eax+014h]
        shl eax, 10h
        add eax, 8000h
        mov dword [byte esp+014h], eax
        mov eax, esp
        push eax
        lea eax, [byte esp+01Ch]
        push eax
        mov edx, dword [byte esp+03Ch]
        push edx
        call RasterShapeTriangle
        add esp, byte 0Ch
        add esp, byte 30h
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawClippedPoly                              C85F0  96 PC, medium confidence
; Clips and draws a polygon
;-----------------------------------------------------------------------------
DrawClippedPoly:
        push esi
        push edi
        push ebp
        sub esp, 4868h
        mov eax, dword [dword esp+04878h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        mov dword [dword esp+04854h], eax
        mov eax, dword [dword esp+04880h]
        mov ecx, 2
        mov eax, dword [byte eax+04h]
        xor edx, edx
        mov dword [dword esp+04814h], eax
        mov eax, dword [dword esp+04880h]
        mov dword [dword esp+04828h], edx
        mov dword [dword esp+04834h], edx
        mov eax, dword [byte eax+014h]
        mov dword [dword esp+04840h], ecx
        mov dword [dword esp+04810h], eax
        mov eax, dword [dword esp+04880h]
.1:
        mov esi, dword [dword esp+04814h]
        mov ebx, dword [byte eax+04h]
        cmp ebx, esi
        jge short .2
        mov dword [dword esp+04814h], ebx
        mov dword [dword esp+04834h], edx
        jmp short .3
.2:
        cmp ebx, dword [dword esp+04810h]
        jle short .3
        mov dword [dword esp+04810h], ebx
        mov dword [dword esp+04840h], edx
.3:
        inc edx
        add eax, byte 8
        cmp edx, byte 4
        jl short .1
        mov eax, dword [dword esp+04814h]
        cmp eax, dword [DrawClipBottom]
        jge near .25
        mov eax, dword [dword esp+04810h]
        cmp eax, dword [DrawClipTop]
        jl near .25
        mov edx, dword [dword esp+04834h]
        inc edx
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        shl edx, 3
        add edx, ebx
        mov ebx, dword [dword esp+04834h]
        mov ecx, dword [dword esp+04880h]
        shl ebx, 3
        add ebx, ecx
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        mov esi, dword [byte ebx+04h]
        mov ebp, dword [ebx]
        sub eax, esi
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edi, dword [dword esp+04834h]
        dec edi
        and edi, byte 3
        mov esi, eax
        lea edx, [nosplit edi*8+00h]
        add edx, dword [dword esp+04880h]
        mov ecx, dword [byte ebx+04h]
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        sub eax, ecx
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        cmp esi, eax
        jl short .4
        mov dword [dword esp+0483Ch], 1
        jmp short .5
.4:
        mov dword [dword esp+0483Ch], 0FFFFFFFFh
.5:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .8
.6:
        mov edi, dword [dword esp+0483Ch]
        mov eax, esi
        sub eax, edi
        and eax, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04830h], eax
        shl eax, 3
        shl esi, 3
        mov dword [dword esp+04818h], eax
        add ebx, eax
        mov eax, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [byte ebx+04h]
        mov ecx, dword [byte eax+04h]
        sub edx, ecx
        mov dword [dword esp+0481Ch], esi
        lea esi, [byte edx+01h]
        test esi, esi
        jle near .7
        mov ebp, dword [ebx]
        push ebp
        mov edx, dword [eax]
        push edx
        push esi
        push ecx
        lea eax, [byte esp+010h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMin
        add esp, byte 14h
        mov ebp, eax
        mov ebx, dword [dword esp+04818h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, ebx
        mov edx, dword [dword esp+04820h]
        mov dword [dword esp+0480Ch], eax
        mov ecx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, edx
        push ecx
        mov ebx, dword [eax]
        push ebx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov ebp, dword [byte eax+04h]
        push ebp
        push esi
        push edi
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.7:
        mov esi, dword [dword esp+04830h]
        cmp esi, dword [dword esp+04840h]
        jne near .6
.8:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .11
.9:
        mov eax, dword [dword esp+0483Ch]
        mov ebx, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [dword esp+04880h]
        and eax, byte 3
        shl esi, 3
        mov dword [dword esp+0482Ch], eax
        shl eax, 3
        add edx, esi
        add ebx, eax
        mov ecx, dword [byte edx+04h]
        mov dword [dword esp+04820h], eax
        mov eax, dword [byte ebx+04h]
        sub eax, ecx
        mov dword [dword esp+04824h], esi
        lea esi, [byte eax+01h]
        test esi, esi
        jle near .10
        mov ebp, dword [ebx]
        push ebp
        mov eax, dword [edx]
        push eax
        push esi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMax
        add esp, byte 14h
        mov ebp, eax
        mov edx, dword [dword esp+04820h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04828h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ebx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        push ecx
        push esi
        push edi
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.10:
        mov esi, dword [dword esp+0482Ch]
        cmp esi, dword [dword esp+04840h]
        jne near .9
.11:
        mov eax, dword [dword esp+04814h]
        mov ebx, dword [DrawClipTop]
        cmp eax, ebx
        jge short .12
        mov dword [dword esp+04814h], ebx
.12:
        mov eax, dword [dword esp+04810h]
        mov ecx, dword [DrawClipBottom]
        cmp eax, ecx
        jl short .13
        lea eax, [byte ecx-01h]
        mov dword [dword esp+04810h], eax
.13:
        mov eax, dword [dword esp+04810h]
        mov esi, dword [dword esp+04814h]
        sub eax, esi
        inc eax
        mov dword [dword esp+04858h], eax
        mov eax, dword [dword esp+04878h]
        add eax, byte 10h
        shl esi, 2
        mov dword [dword esp+04838h], eax
.14:
        mov edi, dword [dword esp+04858h]
        dec edi
        mov dword [dword esp+04858h], edi
        cmp edi, byte 0FFFFFFFFh
        je near .25
        mov eax, dword [dword esp+esi+01800h]
        mov edx, dword [esp+esi]
        sub eax, edx
        lea ebx, [byte eax+01h]
        test ebx, ebx
        jle near .18
        mov eax, edx
        cmp eax, dword [DrawClipRight]
        jge near .17
        mov ecx, dword [DrawClipLeft]
        cmp ecx, dword [dword esp+esi+01800h]
        jg near .17
        mov edx, dword [dword esp+esi+03000h]
        mov edi, dword [dword esp+esi+0C00h]
        sub edx, edi
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ebp, dword [dword esp+esi+03C00h]
        mov edx, dword [dword esp+esi+02400h]
        sub edx, ebp
        mov ecx, eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword esp+04864h], ebp
        mov ebp, dword [DrawClipLeft]
        mov edi, eax
        mov edx, dword [esp+esi]
        mov eax, dword [dword esp+esi+0C00h]
        cmp edx, ebp
        jge short .15
        mov edx, ebp
        sub edx, dword [esp+esi]
        mov ebp, ecx
        imul ebp, edx
        add eax, ebp
        mov ebp, edi
        imul ebp, edx
        sub ebx, edx
        mov edx, dword [DrawClipLeft]
        add dword [dword esp+04864h], ebp
        mov dword [esp+esi], edx
.15:
        mov ebp, dword [DrawClipRight]
        mov edx, dword [dword esp+esi+01800h]
        cmp edx, ebp
        jl short .16
        sub edx, ebp
        inc edx
        sub ebx, edx
.16:
        mov ebp, dword [DrawVideoBase]
        mov edx, dword [DrawDestBuffer]
        add ebp, dword [edx+esi]
        mov edx, ebp
        mov ebp, dword [esp+esi]
        add edx, ebp
        mov dword [dword esp+04800h], edx
        mov edx, edi
        mov ebp, dword [dword esp+04854h]
        sar edx, 10h
        imul ebp, edx
        mov edx, ecx
        sar edx, 10h
        push ebx
        add edx, ebp
        mov ebx, dword [dword esp+04858h]
        push edx
        add edx, ebx
        push edx
        push edi
        mov edi, dword [dword esp+04874h]
        mov edx, edi
        sar edx, 10h
        imul edx, ebx
        push edi
        push ecx
        mov ebp, dword [dword esp+04818h]
        mov ecx, dword [dword esp+04850h]
        push eax
        sar eax, 10h
        add edx, ecx
        push ebp
        add eax, edx
        push eax
        call MapPolySpans
        add esp, byte 24h
.17:
        add esi, byte 4
        jmp near .14
.18:
        mov ebx, dword [dword esp+04828h]
        test ebx, ebx
        jne near .25
        mov ecx, dword [dword esp+0483Ch]
        mov eax, dword [dword esp+04834h]
        mov ebp, dword [dword esp+04840h]
        lea edi, [byte ebx+01h]
        neg ecx
        mov dword [dword esp+04828h], edi
        mov dword [dword esp+0483Ch], ecx
        cmp eax, ebp
        je near .21
.19:
        mov ebx, dword [dword esp+0483Ch]
        mov edx, eax
        sub edx, ebx
        and edx, byte 3
        shl eax, 3
        mov dword [dword esp+04860h], edx
        shl edx, 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04848h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+0484Ch], eax
        mov eax, dword [byte ebx+04h]
        mov ebp, dword [byte edx+04h]
        sub eax, ebp
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .20
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ebp
        lea eax, [byte esp+010h]
        push eax
        call BuildEdgeTableMin
        mov dword [dword esp+04820h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04848h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04850h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov ebx, dword [dword esp+0480Ch]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.20:
        mov eax, dword [dword esp+04860h]
        cmp eax, dword [dword esp+04840h]
        jne near .19
.21:
        mov eax, dword [dword esp+04834h]
        cmp eax, dword [dword esp+04840h]
        je near .24
.22:
        mov edx, dword [dword esp+0483Ch]
        add edx, eax
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+0485Ch], edx
        shl edx, 3
        shl eax, 3
        mov dword [dword esp+04850h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+04844h], eax
        mov eax, dword [byte ebx+04h]
        mov ecx, dword [byte edx+04h]
        sub eax, ecx
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .23
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov ebp, ecx
        call BuildEdgeTableMax
        mov dword [dword esp+04818h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04850h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04848h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04820h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov ebx, dword [dword esp+04804h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04810h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.23:
        mov eax, dword [dword esp+0485Ch]
        cmp eax, dword [dword esp+04840h]
        jne near .22
.24:
        inc dword [dword esp+04858h]
        jmp near .14
.25:
        add esp, 4868h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; DrawMappedPolyClipped                           C8D50  96 PC, low confidence
; Clips a mapped polygon and draws it as triangles
;-----------------------------------------------------------------------------
DrawMappedPolyClipped:
        push esi
        push edi
        push ebp
        sub esp, 4868h
        mov eax, dword [dword esp+04878h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        mov dword [dword esp+04854h], eax
        mov eax, dword [dword esp+04880h]
        mov ecx, 2
        mov eax, dword [byte eax+04h]
        xor edx, edx
        mov dword [dword esp+04814h], eax
        mov eax, dword [dword esp+04880h]
        mov dword [dword esp+04828h], edx
        mov dword [dword esp+04834h], edx
        mov eax, dword [byte eax+014h]
        mov dword [dword esp+04840h], ecx
        mov dword [dword esp+04810h], eax
        mov eax, dword [dword esp+04880h]
.1:
        mov esi, dword [dword esp+04814h]
        mov ebx, dword [byte eax+04h]
        cmp ebx, esi
        jge short .2
        mov dword [dword esp+04814h], ebx
        mov dword [dword esp+04834h], edx
        jmp short .3
.2:
        cmp ebx, dword [dword esp+04810h]
        jle short .3
        mov dword [dword esp+04810h], ebx
        mov dword [dword esp+04840h], edx
.3:
        inc edx
        add eax, byte 8
        cmp edx, byte 4
        jl short .1
        mov eax, dword [dword esp+04814h]
        cmp eax, dword [DrawClipBottom]
        jge near .25
        mov eax, dword [dword esp+04810h]
        cmp eax, dword [DrawClipTop]
        jl near .25
        mov edx, dword [dword esp+04834h]
        inc edx
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        shl edx, 3
        add edx, ebx
        mov ebx, dword [dword esp+04834h]
        mov ecx, dword [dword esp+04880h]
        shl ebx, 3
        add ebx, ecx
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        mov esi, dword [byte ebx+04h]
        mov ebp, dword [ebx]
        sub eax, esi
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edi, dword [dword esp+04834h]
        dec edi
        and edi, byte 3
        mov esi, eax
        lea edx, [nosplit edi*8+00h]
        add edx, dword [dword esp+04880h]
        mov ecx, dword [byte ebx+04h]
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        sub eax, ecx
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        cmp esi, eax
        jl short .4
        mov dword [dword esp+0483Ch], 1
        jmp short .5
.4:
        mov dword [dword esp+0483Ch], 0FFFFFFFFh
.5:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .8
.6:
        mov edi, dword [dword esp+0483Ch]
        mov eax, esi
        sub eax, edi
        and eax, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04830h], eax
        shl eax, 3
        shl esi, 3
        mov dword [dword esp+04818h], eax
        add ebx, eax
        mov eax, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [byte ebx+04h]
        mov ecx, dword [byte eax+04h]
        sub edx, ecx
        mov dword [dword esp+0481Ch], esi
        lea esi, [byte edx+01h]
        test esi, esi
        jle near .7
        mov ebp, dword [ebx]
        push ebp
        mov edx, dword [eax]
        push edx
        push esi
        push ecx
        lea eax, [byte esp+010h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMin
        add esp, byte 14h
        mov ebp, eax
        mov ebx, dword [dword esp+04818h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, ebx
        mov edx, dword [dword esp+04820h]
        mov dword [dword esp+0480Ch], eax
        mov ecx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, edx
        push ecx
        mov ebx, dword [eax]
        push ebx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov ebp, dword [byte eax+04h]
        push ebp
        push esi
        push edi
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.7:
        mov esi, dword [dword esp+04830h]
        cmp esi, dword [dword esp+04840h]
        jne near .6
.8:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .11
.9:
        mov eax, dword [dword esp+0483Ch]
        mov ebx, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [dword esp+04880h]
        and eax, byte 3
        shl esi, 3
        mov dword [dword esp+0482Ch], eax
        shl eax, 3
        add edx, esi
        add ebx, eax
        mov ecx, dword [byte edx+04h]
        mov dword [dword esp+04820h], eax
        mov eax, dword [byte ebx+04h]
        sub eax, ecx
        mov dword [dword esp+04824h], esi
        lea esi, [byte eax+01h]
        test esi, esi
        jle near .10
        mov ebp, dword [ebx]
        push ebp
        mov eax, dword [edx]
        push eax
        push esi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMax
        add esp, byte 14h
        mov ebp, eax
        mov edx, dword [dword esp+04820h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04828h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ebx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        push ecx
        push esi
        push edi
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.10:
        mov esi, dword [dword esp+0482Ch]
        cmp esi, dword [dword esp+04840h]
        jne near .9
.11:
        mov eax, dword [dword esp+04814h]
        mov ebx, dword [DrawClipTop]
        cmp eax, ebx
        jge short .12
        mov dword [dword esp+04814h], ebx
.12:
        mov eax, dword [dword esp+04810h]
        mov ecx, dword [DrawClipBottom]
        cmp eax, ecx
        jl short .13
        lea eax, [byte ecx-01h]
        mov dword [dword esp+04810h], eax
.13:
        mov eax, dword [dword esp+04810h]
        mov esi, dword [dword esp+04814h]
        sub eax, esi
        inc eax
        mov dword [dword esp+04858h], eax
        mov eax, dword [dword esp+04878h]
        add eax, byte 10h
        shl esi, 2
        mov dword [dword esp+04838h], eax
.14:
        mov edi, dword [dword esp+04858h]
        dec edi
        mov dword [dword esp+04858h], edi
        cmp edi, byte 0FFFFFFFFh
        je near .25
        mov eax, dword [dword esp+esi+01800h]
        mov edx, dword [esp+esi]
        sub eax, edx
        lea ebx, [byte eax+01h]
        test ebx, ebx
        jle near .18
        mov eax, edx
        cmp eax, dword [DrawClipRight]
        jge near .17
        mov ecx, dword [DrawClipLeft]
        cmp ecx, dword [dword esp+esi+01800h]
        jg near .17
        mov edx, dword [dword esp+esi+03000h]
        mov edi, dword [dword esp+esi+0C00h]
        sub edx, edi
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ebp, dword [dword esp+esi+03C00h]
        mov edx, dword [dword esp+esi+02400h]
        sub edx, ebp
        mov ecx, eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword esp+04864h], ebp
        mov ebp, dword [DrawClipLeft]
        mov edi, eax
        mov edx, dword [esp+esi]
        mov eax, dword [dword esp+esi+0C00h]
        cmp edx, ebp
        jge short .15
        mov edx, ebp
        sub edx, dword [esp+esi]
        mov ebp, ecx
        imul ebp, edx
        add eax, ebp
        mov ebp, edi
        imul ebp, edx
        sub ebx, edx
        mov edx, dword [DrawClipLeft]
        add dword [dword esp+04864h], ebp
        mov dword [esp+esi], edx
.15:
        mov ebp, dword [DrawClipRight]
        mov edx, dword [dword esp+esi+01800h]
        cmp edx, ebp
        jl short .16
        sub edx, ebp
        inc edx
        sub ebx, edx
.16:
        mov ebp, dword [DrawVideoBase]
        mov edx, dword [DrawDestBuffer]
        add ebp, dword [edx+esi]
        mov edx, ebp
        mov ebp, dword [esp+esi]
        add edx, ebp
        mov dword [dword esp+04800h], edx
        mov edx, edi
        mov ebp, dword [dword esp+04854h]
        sar edx, 10h
        imul ebp, edx
        mov edx, ecx
        sar edx, 10h
        push ebx
        add edx, ebp
        mov ebx, dword [dword esp+04858h]
        push edx
        add edx, ebx
        push edx
        push edi
        mov edi, dword [dword esp+04874h]
        mov edx, edi
        sar edx, 10h
        imul edx, ebx
        push edi
        push ecx
        mov ebp, dword [dword esp+04818h]
        mov ecx, dword [dword esp+04850h]
        push eax
        sar eax, 10h
        add edx, ecx
        push ebp
        add eax, edx
        push eax
        call MapPolySpansRemap
        add esp, byte 24h
.17:
        add esi, byte 4
        jmp near .14
.18:
        mov ebx, dword [dword esp+04828h]
        test ebx, ebx
        jne near .25
        mov ecx, dword [dword esp+0483Ch]
        mov eax, dword [dword esp+04834h]
        mov ebp, dword [dword esp+04840h]
        lea edi, [byte ebx+01h]
        neg ecx
        mov dword [dword esp+04828h], edi
        mov dword [dword esp+0483Ch], ecx
        cmp eax, ebp
        je near .21
.19:
        mov ebx, dword [dword esp+0483Ch]
        mov edx, eax
        sub edx, ebx
        and edx, byte 3
        shl eax, 3
        mov dword [dword esp+04860h], edx
        shl edx, 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04848h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+0484Ch], eax
        mov eax, dword [byte ebx+04h]
        mov ebp, dword [byte edx+04h]
        sub eax, ebp
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .20
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ebp
        lea eax, [byte esp+010h]
        push eax
        call BuildEdgeTableMin
        mov dword [dword esp+04820h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04848h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04850h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov ebx, dword [dword esp+0480Ch]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.20:
        mov eax, dword [dword esp+04860h]
        cmp eax, dword [dword esp+04840h]
        jne near .19
.21:
        mov eax, dword [dword esp+04834h]
        cmp eax, dword [dword esp+04840h]
        je near .24
.22:
        mov edx, dword [dword esp+0483Ch]
        add edx, eax
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+0485Ch], edx
        shl edx, 3
        shl eax, 3
        mov dword [dword esp+04850h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+04844h], eax
        mov eax, dword [byte ebx+04h]
        mov ecx, dword [byte edx+04h]
        sub eax, ecx
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .23
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov ebp, ecx
        call BuildEdgeTableMax
        mov dword [dword esp+04818h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04850h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04848h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04820h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov ebx, dword [dword esp+04804h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04810h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.23:
        mov eax, dword [dword esp+0485Ch]
        cmp eax, dword [dword esp+04840h]
        jne near .22
.24:
        inc dword [dword esp+04858h]
        jmp near .14
.25:
        add esp, 4868h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h
        push esi
        push edi
        push ebp
        sub esp, byte 30h
        mov ebp, dword [byte esp+044h]
        mov eax, dword [byte esp+040h]
        mov esi, dword [byte esp+040h]
        mov edx, 1
        push ebp
        mov eax, dword [byte eax+02h]
        mov esi, dword [byte esi+04h]
        sar eax, 10h
        sar esi, 10h
        sub eax, byte 2
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], eax
        mov edi, eax
        mov dword [byte esp+014h], eax
        lea eax, [byte esp+04h]
        mov dword [byte esp+08h], edx
        push eax
        mov eax, dword [byte esp+048h]
        sub esi, byte 2
        push eax
        mov dword [byte esp+018h], edx
        mov dword [byte esp+020h], esi
        call DrawMappedTriangle
        add esp, byte 0Ch
        mov edx, 1
        mov dword [esp], edi
        mov dword [byte esp+04h], esi
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], esi
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        lea edi, [byte esp+018h]
        lea esi, [byte ebp+010h]
        movsd
        movsd
        lea edi, [byte esp+020h]
        lea esi, [byte ebp+018h]
        movsd
        movsd
        lea eax, [byte esp+018h]
        lea edi, [byte esp+028h]
        mov esi, ebp
        push eax
        lea eax, [byte esp+04h]
        movsd
        movsd
        push eax
        mov esi, dword [byte esp+048h]
        push esi
        call DrawMappedTriangle
        add esp, byte 0Ch
        add esp, byte 30h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawMappedStrip                                 C955C  96 PC, low confidence
; Draws a strip of mapped triangles
;-----------------------------------------------------------------------------
DrawMappedStrip:
        push esi
        push edi
        push ebp
        sub esp, byte 34h
        mov edi, dword [byte esp+048h]
        mov esi, dword [byte esp+04Ch]
        mov eax, dword [byte esp+044h]
        mov ebp, dword [byte esp+044h]
        mov edx, 1
        mov eax, dword [byte eax+02h]
        mov ebp, dword [byte ebp+04h]
        sar eax, 10h
        sar ebp, 10h
        mov dword [esp], edx
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], edx
        sub eax, byte 2
        sub ebp, byte 2
        mov dword [byte esp+08h], eax
        mov dword [byte esp+010h], eax
        mov dword [byte esp+014h], ebp
        mov dword [byte esp+030h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov eax, dword [byte esp+04Ch]
        push eax
        call DrawMappedTriangle
        add esp, byte 0Ch
        mov edx, 1
        mov eax, dword [byte esp+030h]
        mov dword [byte esp+04h], ebp
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], ebp
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        mov dword [esp], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov esi, dword [byte esp+04Ch]
        push esi
        call DrawMappedTriangle
        add esp, byte 0Ch
        add esp, byte 34h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        push esi
        push edi
        push ebp
        sub esp, byte 30h
        mov ebp, dword [byte esp+044h]
        mov eax, dword [byte esp+040h]
        mov esi, dword [byte esp+040h]
        mov edx, 1
        push ebp
        mov eax, dword [byte eax+02h]
        mov esi, dword [byte esi+04h]
        sar eax, 10h
        sar esi, 10h
        sub eax, byte 2
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], eax
        mov edi, eax
        mov dword [byte esp+014h], eax
        lea eax, [byte esp+04h]
        mov dword [byte esp+08h], edx
        push eax
        mov eax, dword [byte esp+048h]
        sub esi, byte 2
        push eax
        mov dword [byte esp+018h], edx
        mov dword [byte esp+020h], esi
        call DrawMappedTriangleShadow
        add esp, byte 0Ch
        mov edx, 1
        mov dword [esp], edi
        mov dword [byte esp+04h], esi
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], esi
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        lea edi, [byte esp+018h]
        lea esi, [byte ebp+010h]
        movsd
        movsd
        lea edi, [byte esp+020h]
        lea esi, [byte ebp+018h]
        movsd
        movsd
        lea eax, [byte esp+018h]
        lea edi, [byte esp+028h]
        mov esi, ebp
        push eax
        lea eax, [byte esp+04h]
        movsd
        movsd
        push eax
        mov esi, dword [byte esp+048h]
        push esi
        call DrawMappedTriangleShadow
        add esp, byte 0Ch
        add esp, byte 30h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawMappedStripShadow                           C972C  96 PC, low confidence
; Draws a strip of mapped triangles with see-through and shadow colours
;-----------------------------------------------------------------------------
DrawMappedStripShadow:
        push esi
        push edi
        push ebp
        sub esp, byte 34h
        mov edi, dword [byte esp+048h]
        mov esi, dword [byte esp+04Ch]
        mov eax, dword [byte esp+044h]
        mov ebp, dword [byte esp+044h]
        mov edx, 1
        mov eax, dword [byte eax+02h]
        mov ebp, dword [byte ebp+04h]
        sar eax, 10h
        sar ebp, 10h
        mov dword [esp], edx
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], edx
        sub eax, byte 2
        sub ebp, byte 2
        mov dword [byte esp+08h], eax
        mov dword [byte esp+010h], eax
        mov dword [byte esp+014h], ebp
        mov dword [byte esp+030h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov eax, dword [byte esp+04Ch]
        push eax
        call DrawMappedTriangleShadow
        add esp, byte 0Ch
        mov edx, 1
        mov eax, dword [byte esp+030h]
        mov dword [byte esp+04h], ebp
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], ebp
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        mov dword [esp], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov esi, dword [byte esp+04Ch]
        push esi
        call DrawMappedTriangleShadow
        add esp, byte 0Ch
        add esp, byte 34h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        push esi
        push edi
        push ebp
        sub esp, byte 30h
        mov ebp, dword [byte esp+044h]
        mov eax, dword [byte esp+040h]
        mov esi, dword [byte esp+040h]
        mov edx, 1
        push ebp
        mov eax, dword [byte eax+02h]
        mov esi, dword [byte esi+04h]
        sar eax, 10h
        sar esi, 10h
        sub eax, byte 2
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], eax
        mov edi, eax
        mov dword [byte esp+014h], eax
        lea eax, [byte esp+04h]
        mov dword [byte esp+08h], edx
        push eax
        mov eax, dword [byte esp+048h]
        sub esi, byte 2
        push eax
        mov dword [byte esp+018h], edx
        mov dword [byte esp+020h], esi
        call DrawShapeTriangleMapped
        add esp, byte 0Ch
        mov edx, 1
        mov dword [esp], edi
        mov dword [byte esp+04h], esi
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], esi
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        lea edi, [byte esp+018h]
        lea esi, [byte ebp+010h]
        movsd
        movsd
        lea edi, [byte esp+020h]
        lea esi, [byte ebp+018h]
        movsd
        movsd
        lea eax, [byte esp+018h]
        lea edi, [byte esp+028h]
        mov esi, ebp
        push eax
        lea eax, [byte esp+04h]
        movsd
        movsd
        push eax
        mov esi, dword [byte esp+048h]
        push esi
        call DrawShapeTriangleMapped
        add esp, byte 0Ch
        add esp, byte 30h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawMappedStripDirect                           C98FC  96 PC, low confidence
; Draws a strip of triangles through the shape mapper
;-----------------------------------------------------------------------------
DrawMappedStripDirect:
        push esi
        push edi
        push ebp
        sub esp, byte 34h
        mov edi, dword [byte esp+048h]
        mov esi, dword [byte esp+04Ch]
        mov eax, dword [byte esp+044h]
        mov ebp, dword [byte esp+044h]
        mov edx, 1
        mov eax, dword [byte eax+02h]
        mov ebp, dword [byte ebp+04h]
        sar eax, 10h
        sar ebp, 10h
        mov dword [esp], edx
        mov dword [byte esp+04h], edx
        mov dword [byte esp+0Ch], edx
        sub eax, byte 2
        sub ebp, byte 2
        mov dword [byte esp+08h], eax
        mov dword [byte esp+010h], eax
        mov dword [byte esp+014h], ebp
        mov dword [byte esp+030h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+04h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov eax, dword [byte esp+04Ch]
        push eax
        call DrawShapeTriangleMapped
        add esp, byte 0Ch
        mov edx, 1
        mov eax, dword [byte esp+030h]
        mov dword [byte esp+04h], ebp
        mov dword [byte esp+08h], edx
        mov dword [byte esp+0Ch], ebp
        mov dword [byte esp+010h], edx
        mov dword [byte esp+014h], edx
        mov dword [esp], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+018h], eax
        mov eax, dword [byte esi+08h]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+020h], eax
        mov eax, dword [byte esi+0Ch]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+024h], eax
        mov eax, dword [esi]
        mov eax, dword [edi+eax*8]
        mov dword [byte esp+028h], eax
        mov eax, dword [esi]
        mov eax, dword [byte edi+eax*8+04h]
        mov dword [byte esp+02Ch], eax
        lea eax, [byte esp+018h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov esi, dword [byte esp+04Ch]
        push esi
        call DrawShapeTriangleMapped
        add esp, byte 0Ch
        add esp, byte 34h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawFlatPolyClipped                             C9A20  96 PC, low confidence
; Clips and fills a flat polygon
;-----------------------------------------------------------------------------
DrawFlatPolyClipped:
        push ebp
        sub esp, byte 20h
        mov edx, dword [byte esp+028h]
        xor ebx, ebx
        mov dword [byte esp+018h], ebx
        mov dword [byte esp+0Ch], ebx
        mov dword [byte esp+04h], ebx
        mov dword [esp], ebx
        mov eax, dword [byte edx+02h]
        sar eax, 10h
        shl eax, 10h
        dec eax
        mov dword [byte esp+010h], eax
        mov dword [byte esp+08h], eax
        mov eax, dword [byte edx+04h]
        sar eax, 10h
        shl eax, 10h
        mov ebp, dword [byte esp+02Ch]
        dec eax
        push ebp
        mov dword [byte esp+020h], eax
        mov dword [byte esp+018h], eax
        lea eax, [byte esp+04h]
        push eax
        push edx
        call FillFlatPolyCore
        add esp, byte 0Ch
        add esp, byte 20h
        pop ebp
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawFlatPolyMapped                              C9A80  96 PC, low confidence
; Clips and draws a flat mapped polygon
;-----------------------------------------------------------------------------
DrawFlatPolyMapped:
        push ebp
        sub esp, byte 20h
        mov edx, dword [byte esp+028h]
        xor ebx, ebx
        mov dword [byte esp+018h], ebx
        mov dword [byte esp+0Ch], ebx
        mov dword [byte esp+04h], ebx
        mov dword [esp], ebx
        mov eax, dword [byte edx+02h]
        sar eax, 10h
        shl eax, 10h
        dec eax
        mov dword [byte esp+010h], eax
        mov dword [byte esp+08h], eax
        mov eax, dword [byte edx+04h]
        sar eax, 10h
        shl eax, 10h
        mov ebp, dword [byte esp+02Ch]
        dec eax
        push ebp
        mov dword [byte esp+020h], eax
        mov dword [byte esp+018h], eax
        lea eax, [byte esp+04h]
        push eax
        push edx
        call DrawMappedPolyClipped
        add esp, byte 0Ch
        add esp, byte 20h
        pop ebp
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; TexSpanFill                                     C9AD8  96 PC, low confidence
; Fills one textured span
;-----------------------------------------------------------------------------
TexSpanFill:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        shl ebx, 10h
        mov ebp, dword [byte esp+01Ch]
        shl ebp, 10h
        mov bx, word [byte esp+020h]
        mov dx, word [byte esp+024h]
        sub dword [byte esp+030h], byte 10h
        js near .2
        test edi, 3
        jne near .7
.1:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        mov dword [edi], eax
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        mov dword [byte edi+04h], eax
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        mov dword [byte edi+08h], eax
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        mov dword [byte edi+0Ch], eax
        sub dword [byte esp+030h], byte 10h
        lea edi, [byte edi+010h]
        jns near .1
.2:
        add dword [byte esp+030h], byte 0Ch
        js short .4
        cmp dx, byte 0
        je near .8
.3:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        LD add, bx, dx
        mov ah, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        bswap eax
        mov dword [edi], eax
        sub dword [byte esp+030h], byte 4
        lea edi, [byte edi+04h]
        jns short .3
.4:
        add dword [byte esp+030h], byte 3
        js short .6
.5:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        mov byte [edi], al
        adc esi, dword [byte esp+ecx*4+02Ch]
        sub dword [byte esp+030h], byte 1
        lea edi, [byte edi+01h]
        jns short .5
.6:
        pop ebp
        pop edi
        pop esi
        ret
.7:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        mov byte [edi], al
        adc esi, dword [byte esp+ecx*4+02Ch]
        sub dword [byte esp+030h], byte 1
        lea edi, [byte edi+01h]
        test edi, 3
        jne short .7
        cmp dword [byte esp+030h], byte 0
        jns near .1
        jmp near .2
.8:
        mov edx, dword [byte esp+02Ch]
        mov ecx, dword [byte esp+030h]
.9:
        LD add, ebx, ebp
        mov al, byte [esi]
        LD adc, esi, edx
        LD add, ebx, ebp
        mov ah, byte [esi]
        LD adc, esi, edx
        bswap eax
        LD add, ebx, ebp
        mov ah, byte [esi]
        LD adc, esi, edx
        LD add, ebx, ebp
        mov al, byte [esi]
        LD adc, esi, edx
        bswap eax
        mov dword [edi], eax
        sub ecx, byte 4
        lea edi, [byte edi+04h]
        jns short .9
        add ecx, byte 3
        js short .11
.10:
        LD add, ebx, ebp
        mov al, byte [esi]
        LD adc, esi, edx
        mov byte [edi], al
        sub ecx, byte 1
        lea edi, [byte edi+01h]
        jns short .10
.11:
        jmp short .6
