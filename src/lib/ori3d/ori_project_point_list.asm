; 3D library: ProjectPointList, AngleOfVector, SinInterp, CosInterp, FillPolyIndexed and 5 more.
bits 32
%include "hockey.inc"
section s_BA3D0 progbits alloc exec nowrite align=1
extern AtanSlopeTable, AtanTable, Div64By32, DrawDestBuffer, DrawVideoBase, FillMem, FillRectColor, FillShadedPoly
extern LineClipBottom, LineClipLeft, LineClipRight, LineClipTop, min_, NearClipZ, PerspQuadState, PerspQuadTex
extern PerspQuadVerts, PolyLeftEdges, PolyRightEdges, ProjectPoint, ProjectPointsPersp, QuadDepthLimit, Shl64, SinTable
extern SubdivDepth, SubdivLimit, SubdivMaxSize, SubdivMinDepth, SubdivTable, TransformVector, ViewScreenHeight, ViewScreenWidth
global ProjectPointList, AngleOfVectorJumpTable, AngleOfVector, AngleOfVector_90, AngleOfVector_92, AngleOfVector_9C, AngleOfVector_A8, AngleOfVector_AF
global AngleOfVector_B9, AngleOfVector_BB, AngleOfVector_C0, SinInterp, CosInterp, FillPolyIndexed, ClassifyQuadDepth, SubdivideTexturedQuad
global DrawPerspQuad, DrawFlatPoly, DrawPolyOutline
;-----------------------------------------------------------------------------
; ProjectPointList                                BA3D0  96 PC, low confidence
; Projects a list of 3D points to the screen through ProjectPoint
;-----------------------------------------------------------------------------
ProjectPointList:
        push esi
        push edi
        push ebp
        mov edi, dword [byte esp+010h]
        mov esi, dword [byte esp+014h]
        mov ebp, dword [byte esp+018h]
.1:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je short .2
        push ebp
        push esi
        add ebp, byte 8
        call ProjectPoint
        add esi, byte 0Ch
        add esp, byte 8
        jmp short .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h
AngleOfVectorJumpTable:                         ; jump table for the switch cases of AngleOfVector
        dd AngleOfVector_C0
        dd AngleOfVector_90
        dd AngleOfVector_9C
        dd AngleOfVector_92
        dd AngleOfVector_A8
        dd AngleOfVector_BB
        dd AngleOfVector_AF
        dd AngleOfVector_B9
;-----------------------------------------------------------------------------
; AngleOfVector                                   BA420  96 PC, low confidence
; Returns the angle of a 2D vector in 1024ths of a turn, by octant
;-----------------------------------------------------------------------------
AngleOfVector:
        push esi
        sub esp, byte 8
        mov eax, dword [byte esp+010h]
        mov edx, dword [byte esp+014h]
        xor ebx, ebx
        test edx, edx
        jge short .1
        mov ebx, 2
        neg edx
.1:
        test eax, eax
        jge short .2
        or bl, 4
        neg eax
.2:
        cmp eax, edx
        jne short .3
        mov eax, 2000h
        jmp short .5
.3:
        cmp edx, eax
        jge short .4
        mov esi, eax
        or bl, 1
        mov eax, edx
        mov edx, esi
.4:
        push edx
        lea esi, [byte esp+04h]
        mov edx, 20h
        call Shl64
        mov edx, dword [byte esp+08h]
        push edx
        mov ecx, dword [byte esp+08h]
        push ecx
        call Div64By32
        mov esi, eax
        shr eax, 18h
        lea edx, [nosplit eax*4+00h]
        shr esi, 8
        mov eax, dword [dword edx+AtanTable]
        mov edx, dword [dword edx+AtanSlopeTable]
        and esi, 0FFFFh
        sub edx, eax
        imul edx, esi
        shr edx, 10h
        add eax, edx
.5:
        cmp ebx, byte 7
        ja short AngleOfVector_C0
        jmp dword [nosplit cs:ebx*4+AngleOfVectorJumpTable]
AngleOfVector_90:
        neg eax
AngleOfVector_92:
        add eax, 4000h
        add esp, byte 8
        pop esi
        ret
AngleOfVector_9C:
        neg eax
        add eax, 8000h
        add esp, byte 8
        pop esi
        ret
AngleOfVector_A8:
        neg eax
        add esp, byte 8
        pop esi
        ret
AngleOfVector_AF:
        add eax, 0FFFF8000h
        add esp, byte 8
        pop esi
        ret
AngleOfVector_B9:
        neg eax
AngleOfVector_BB:
        sub eax, 4000h
AngleOfVector_C0:
        add esp, byte 8
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; SinInterp                                       BA4F0  96 PC, low confidence
; Returns the sine of a fine angle, interpolating between table entries
;-----------------------------------------------------------------------------
SinInterp:
        push esi
        mov ebx, dword [byte esp+08h]
        sar ebx, 6
        mov eax, ebx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        mov esi, eax
        mov eax, ebx
        mov ebx, dword [byte esp+08h]
        and ebx, byte 3Fh
        imul ebx, dword 6487Eh
        lea ecx, [dword eax+0100h]
        shl ch, 7
        sbb edx, edx
        add ch, ch
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        sar eax, 2
        sar ebx, 9
        imul eax, ebx
        sar eax, 15h
        add eax, esi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; CosInterp                                       BA55C  96 PC, low confidence
; Returns the cosine of a fine angle, interpolating between table entries
;-----------------------------------------------------------------------------
CosInterp:
        push esi
        mov ebx, dword [byte esp+08h]
        sar ebx, 6
        mov eax, ebx
        lea ecx, [dword eax+0100h]
        shl ch, 7
        sbb edx, edx
        add ch, ch
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        mov esi, eax
        mov eax, ebx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        mov ebx, eax
        mov eax, dword [byte esp+08h]
        and eax, byte 3Fh
        imul eax, dword 6487Eh
        neg ebx
        sar ebx, 2
        sar eax, 9
        imul eax, ebx
        sar eax, 15h
        add eax, esi
        pop esi
        ret
        db 00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FillPolyIndexed                                 BA5D0  96 PC, low confidence
; Fills a polygon given 2D points and an index list
;-----------------------------------------------------------------------------
FillPolyIndexed:
        push esi
        push edi
        push ebp
        sub esp, 88h
        mov dword [byte esp+028h], eax
        mov dword [byte esp+014h], edx
        mov dword [byte esp+018h], ebx
        mov dword [byte esp+060h], ecx
        cmp edx, byte 3
        jl near .56
        mov ebp, dword [byte esp+018h]
        mov esi, 1
        mov edi, dword [byte esp+018h]
        mov ebp, dword [byte ebp+00h]
        xor ebx, ebx
        shl ebp, 3
        mov dword [byte esp+024h], ebx
        add ebp, eax
        mov dword [byte esp+08h], ebx
        add edi, byte 4
        mov ebx, dword [byte ebp+00h]
        mov ebp, dword [byte ebp+04h]
        mov dword [byte esp+0Ch], ebx
        mov dword [byte esp+01Ch], ebp
        cmp edx, esi
        jle short .6
.1:
        mov edx, dword [edi]
        mov ecx, dword [byte esp+028h]
        shl edx, 3
        add edx, ecx
        mov ecx, dword [byte esp+01Ch]
        mov eax, dword [edx]
        mov edx, dword [byte edx+04h]
        add edi, byte 4
        cmp edx, ecx
        jge short .2
        mov dword [byte esp+08h], esi
        mov dword [byte esp+01Ch], edx
        jmp short .3
.2:
        cmp edx, ebp
        jle short .3
        mov dword [byte esp+024h], esi
        mov ebp, edx
.3:
        cmp eax, dword [byte esp+0Ch]
        jge short .4
        mov dword [byte esp+0Ch], eax
        jmp short .5
.4:
        cmp eax, ebx
        jle short .5
        mov ebx, eax
.5:
        mov edx, dword [byte esp+014h]
        inc esi
        cmp esi, edx
        jl short .1
.6:
        cmp ebx, dword [LineClipLeft]
        jl near .56
        mov eax, dword [byte esp+0Ch]
        cmp eax, dword [LineClipRight]
        jg near .56
        mov edi, dword [LineClipTop]
        cmp ebp, edi
        jl near .56
        mov eax, dword [byte esp+01Ch]
        cmp eax, dword [LineClipBottom]
        jg near .56
        cmp eax, edi
        jge short .7
        mov dword [byte esp+01Ch], edi
.7:
        cmp ebp, dword [LineClipBottom]
        mov eax, dword [byte esp+08h]
        mov esi, dword [byte esp+018h]
        mov dword [byte esp+044h], eax
        shl eax, 2
        add eax, esi
        mov eax, dword [eax]
        mov edx, dword [byte esp+028h]
        shl eax, 3
        add edx, eax
        mov eax, dword [byte esp+08h]
        mov dword [byte esp+038h], edx
        mov edi, dword [edx]
        mov ebp, dword [byte edx+04h]
        mov edx, dword [byte esp+024h]
        mov esi, PolyLeftEdges
        cmp eax, edx
        je near .16
.8:
        mov ecx, dword [byte esp+044h]
        inc ecx
        mov edx, dword [byte esp+014h]
        mov dword [byte esp+044h], ecx
        cmp ecx, edx
        jl short .9
        xor ebx, ebx
        mov dword [byte esp+044h], ebx
.9:
        mov eax, dword [byte esp+044h]
        mov ecx, dword [byte esp+018h]
        shl eax, 2
        add eax, ecx
        mov eax, dword [eax]
        mov ebx, dword [byte esp+028h]
        shl eax, 3
        add ebx, eax
        mov edx, dword [byte esp+038h]
        mov eax, dword [byte ebx+04h]
        mov dword [byte esp+038h], ebx
        mov dword [byte esp+048h], eax
        mov ebx, eax
        sub ebx, dword [byte edx+04h]
        test ebx, ebx
        jle near .15
        mov eax, dword [byte esp+038h]
        mov ecx, dword [edx]
        mov eax, dword [eax]
        sub eax, ecx
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov ebx, eax
        mov eax, dword [byte esp+048h]
        sar ebx, 2
        cmp ebp, eax
        jge short .15
.10:
        cmp ebp, dword [LineClipTop]
        jle short .14
        cmp ebp, dword [LineClipBottom]
        jge short .16
        mov edx, dword [LineClipLeft]
        lea eax, [byte esi+04h]
        cmp edi, edx
        jge short .11
        mov dword [esi], edx
        jmp short .13
.11:
        mov ecx, dword [LineClipRight]
        cmp edi, ecx
        jl short .12
        lea edx, [byte ecx-01h]
        mov dword [esi], edx
        jmp short .13
.12:
        mov dword [esi], edi
.13:
        mov esi, eax
.14:
        mov edx, dword [byte esp+048h]
        add ebp, 4000h
        add edi, ebx
        cmp ebp, edx
        jl short .10
.15:
        mov edi, dword [byte esp+038h]
        mov eax, dword [byte esp+044h]
        mov ebx, dword [byte esp+024h]
        mov edi, dword [edi]
        cmp eax, ebx
        jne near .8
.16:
        sub esi, PolyLeftEdges
        mov eax, dword [byte esp+08h]
        sar esi, 2
        mov dword [byte esp+040h], eax
        mov dword [byte esp+02Ch], esi
        shl eax, 2
        add eax, dword [byte esp+018h]
        mov eax, dword [eax]
        mov edx, dword [byte esp+028h]
        shl eax, 3
        add edx, eax
        mov eax, dword [byte esp+08h]
        mov dword [byte esp+03Ch], edx
        mov edi, dword [edx]
        mov ebp, dword [byte edx+04h]
        mov edx, dword [byte esp+024h]
        mov esi, PolyRightEdges
        cmp eax, edx
        je near .25
        mov eax, dword [byte esp+014h]
        dec eax
        mov dword [esp], eax
.17:
        mov ecx, dword [byte esp+040h]
        dec ecx
        mov dword [byte esp+040h], ecx
        test ecx, ecx
        jge short .18
        mov eax, dword [esp]
        mov dword [byte esp+040h], eax
.18:
        mov eax, dword [byte esp+040h]
        mov ebx, dword [byte esp+018h]
        shl eax, 2
        add eax, ebx
        mov eax, dword [eax]
        mov ebx, dword [byte esp+028h]
        shl eax, 3
        mov edx, dword [byte esp+03Ch]
        add ebx, eax
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte ebx+04h]
        mov dword [byte esp+03Ch], ebx
        mov ebx, eax
        sub ebx, ecx
        mov dword [byte esp+050h], eax
        test ebx, ebx
        jle near .24
        mov eax, dword [byte esp+03Ch]
        mov ecx, dword [edx]
        mov eax, dword [eax]
        sub eax, ecx
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov ebx, eax
        mov eax, dword [byte esp+050h]
        sar ebx, 2
        cmp ebp, eax
        jge short .24
.19:
        cmp ebp, dword [LineClipTop]
        jle short .23
        cmp ebp, dword [LineClipBottom]
        jge short .25
        mov edx, dword [LineClipLeft]
        lea eax, [byte esi+04h]
        cmp edi, edx
        jge short .20
        mov dword [esi], edx
        jmp short .22
.20:
        mov ecx, dword [LineClipRight]
        cmp edi, ecx
        jl short .21
        lea edx, [byte ecx-01h]
        mov dword [esi], edx
        jmp short .22
.21:
        mov dword [esi], edi
.22:
        mov esi, eax
.23:
        mov edx, dword [byte esp+050h]
        add ebp, 4000h
        add edi, ebx
        cmp ebp, edx
        jl short .19
.24:
        mov edi, dword [byte esp+03Ch]
        mov eax, dword [byte esp+040h]
        mov ebx, dword [byte esp+024h]
        mov edi, dword [edi]
        cmp eax, ebx
        jne near .17
.25:
        mov eax, PolyLeftEdges
        mov edx, PolyRightEdges
        mov esi, dword [byte esp+02Ch]
        xor ebx, ebx
        test esi, esi
        jle near .56
        mov edi, dword [byte esp+02Ch]
.26:
        mov ecx, dword [eax]
        mov ebp, dword [edx]
        cmp ecx, ebp
        jge short .27
        mov eax, PolyLeftEdges
        mov edx, PolyRightEdges
        mov dword [byte esp+058h], eax
        mov dword [byte esp+05Ch], edx
        jmp short .29
.27:
        cmp ebp, ecx
        jge short .28
        mov edi, PolyRightEdges
        mov ebp, PolyLeftEdges
        mov dword [byte esp+058h], edi
        mov dword [byte esp+05Ch], ebp
        jmp short .29
.28:
        add eax, byte 4
        inc ebx
        add edx, byte 4
        cmp ebx, edi
        jl short .26
        jmp near .56
.29:
        mov edx, dword [byte esp+060h]
        xor eax, eax
        mov esi, 4
        mov al, byte [edx]
        mov edi, dword [byte esp+02Ch]
        mov dword [byte esp+04h], eax
        mov eax, dword [byte esp+01Ch]
        xor ebx, ebx
        and eax, 0FFFFh
        mov dword [byte esp+034h], ebx
        sar eax, 0Eh
        lea ecx, [byte edx+04h]
        sub esi, eax
        mov dword [byte esp+060h], ecx
        cmp esi, edi
        jle short .30
        mov esi, edi
.30:
        mov eax, dword [byte esp+01Ch]
        sar eax, 10h
        mov ebp, dword [byte esp+02Ch]
        mov dword [byte esp+010h], eax
        cmp ebp, dword [byte esp+034h]
        jle near .56
        mov eax, dword [byte esp+010h]
        shl eax, 2
        mov dword [byte esp+020h], eax
.31:
        mov edi, dword [byte esp+058h]
        mov eax, dword [byte esp+05Ch]
        mov edx, 1
        mov edi, dword [edi]
        mov eax, dword [eax]
        mov ebp, edi
        mov dword [byte esp+068h], eax
        mov dword [byte esp+064h], eax
        cmp esi, edx
        jle short .37
        mov ecx, dword [byte esp+058h]
        mov ebx, dword [byte esp+05Ch]
        add ecx, byte 4
        add ebx, byte 4
.32:
        mov eax, dword [ecx]
        cmp eax, ebp
        jge short .33
        mov ebp, eax
        jmp short .34
.33:
        cmp eax, edi
        jle short .34
        mov edi, eax
.34:
        mov eax, dword [ebx]
        cmp eax, dword [byte esp+064h]
        jge short .35
        mov dword [byte esp+064h], eax
        jmp short .36
.35:
        cmp eax, dword [byte esp+068h]
        jle short .36
        mov dword [byte esp+068h], eax
.36:
        add ecx, byte 4
        inc edx
        add ebx, byte 4
        cmp edx, esi
        jl short .32
.37:
        cmp ebp, dword [byte esp+068h]
        je near .55
        mov edx, dword [byte esp+020h]
        mov eax, dword [DrawDestBuffer]
        add edx, eax
        mov eax, dword [DrawVideoBase]
        mov ecx, dword [edx]
        sar ebp, 10h
        add eax, ecx
        mov dword [byte esp+07Ch], ebp
        add eax, ebp
        shl ebp, 10h
        mov dword [dword esp+080h], eax
        mov dword [byte esp+078h], ebp
        lea eax, [dword ebp+010000h]
        sar edi, 10h
        mov dword [byte esp+070h], eax
        mov eax, edi
        shl eax, 10h
        mov dword [byte esp+030h], edi
        mov dword [byte esp+054h], eax
        cmp ebp, eax
        jg near .44
.38:
        xor edx, edx
        xor ebx, ebx
        test esi, esi
        jle short .42
        mov eax, dword [byte esp+070h]
        mov edi, dword [byte esp+078h]
        mov dword [dword esp+084h], eax
        mov eax, dword [byte esp+058h]
.39:
        mov ebp, dword [eax]
        cmp edi, ebp
        jle short .40
        add edx, 10000h
        jmp short .41
.40:
        mov ecx, ebp
        cmp ecx, dword [dword esp+084h]
        jge short .41
        mov ebp, 10000h
        and ecx, 0FFFFh
        sub ebp, ecx
        add edx, ebp
.41:
        inc ebx
        add eax, byte 4
        cmp ebx, esi
        jl short .39
.42:
        sar edx, 0Eh
        test edx, edx
        je short .43
        mov ebx, dword [dword esp+080h]
        xor eax, eax
        shl edx, 8
        mov al, byte [ebx]
        mov edi, dword [byte esp+060h]
        add eax, edx
        add eax, edi
        mov al, byte [dword eax-0100h]
        mov byte [ebx], al
.43:
        mov edx, dword [byte esp+07Ah]
        mov ebx, dword [byte esp+072h]
        mov ebp, dword [byte esp+07Ch]
        mov eax, dword [dword esp+080h]
        inc edx
        inc ebx
        inc ebp
        inc eax
        mov word [byte esp+07Ah], dx
        mov word [byte esp+072h], bx
        mov dword [dword esp+080h], eax
        mov eax, dword [byte esp+078h]
        mov edx, dword [byte esp+054h]
        mov dword [byte esp+07Ch], ebp
        cmp eax, edx
        jle near .38
.44:
        mov eax, dword [byte esp+064h]
        mov edx, dword [byte esp+030h]
        sar eax, 10h
        inc edx
        cmp eax, edx
        jle near .53
        sub eax, dword [byte esp+030h]
        mov ebp, dword [byte esp+07Ch]
        lea edi, [byte eax-01h]
        add ebp, edi
        cmp esi, byte 4
        jne short .45
        mov eax, dword [byte esp+04h]
        push eax
        push edi
        mov edx, dword [dword esp+088h]
        push edx
        call FillMem
        add esp, byte 0Ch
        mov ebx, dword [dword esp+080h]
        add ebx, edi
        mov dword [byte esp+07Ch], ebp
        mov dword [dword esp+080h], ebx
        jmp near .53
.45:
        test esi, esi
        je near .53
        mov edx, esi
        mov ecx, dword [byte esp+060h]
        shl edx, 0Ah
        mov dword [byte esp+07Ch], ebp
        add edx, ecx
.46:
        mov eax, edi
        dec edi
        test eax, eax
        jle near .53
        mov ebx, dword [dword esp+080h]
        xor eax, eax
        mov al, byte [ebx]
        lea ecx, [byte ebx+01h]
        mov al, byte [edx+eax]
        mov dword [dword esp+080h], ecx
        mov byte [ebx], al
        jmp short .46
.47:
        xor edx, edx
        xor ebx, ebx
        test esi, esi
        jle short .51
        mov ebp, dword [byte esp+06Ch]
        mov edi, eax
        mov eax, dword [byte esp+05Ch]
.48:
        mov ecx, dword [eax]
        cmp ebp, ecx
        jge short .49
        add edx, 10000h
        jmp short .50
.49:
        cmp edi, ecx
        jge short .50
        and ecx, 0FFFFh
        add edx, ecx
.50:
        inc ebx
        add eax, byte 4
        cmp ebx, esi
        jl short .48
.51:
        sar edx, 0Eh
        test edx, edx
        je short .52
        mov ebx, dword [dword esp+080h]
        xor eax, eax
        shl edx, 8
        mov al, byte [ebx]
        mov ebx, dword [byte esp+060h]
        add eax, edx
        add eax, ebx
        mov edx, dword [dword esp+080h]
        mov al, byte [dword eax-0100h]
        mov byte [edx], al
.52:
        mov ecx, dword [byte esp+06Eh]
        mov edi, dword [byte esp+076h]
        inc ecx
        inc edi
        mov word [byte esp+06Eh], cx
        mov word [byte esp+076h], di
        mov ecx, dword [byte esp+07Ch]
        mov edi, dword [dword esp+080h]
        inc ecx
        inc edi
        mov dword [byte esp+07Ch], ecx
        mov dword [dword esp+080h], edi
        jmp short .54
.53:
        mov eax, dword [byte esp+07Ch]
        mov edx, dword [byte esp+068h]
        shl eax, 10h
        sar edx, 10h
        lea ebx, [dword eax+010000h]
        shl edx, 10h
        mov dword [byte esp+06Ch], ebx
        mov dword [byte esp+074h], eax
        mov dword [byte esp+04Ch], edx
.54:
        mov eax, dword [byte esp+074h]
        cmp eax, dword [byte esp+04Ch]
        jle near .47
.55:
        mov eax, dword [byte esp+034h]
        mov edx, dword [byte esp+058h]
        mov ebx, dword [byte esp+05Ch]
        mov edi, dword [byte esp+020h]
        mov ebp, dword [byte esp+010h]
        add edi, byte 4
        add eax, esi
        inc ebp
        mov dword [byte esp+034h], eax
        shl esi, 2
        mov ecx, eax
        add edx, esi
        mov dword [byte esp+020h], edi
        mov dword [byte esp+058h], edx
        mov edx, dword [byte esp+02Ch]
        mov dword [byte esp+010h], ebp
        sub edx, eax
        mov eax, 4
        add ebx, esi
        call min_
        mov edx, dword [byte esp+02Ch]
        mov esi, eax
        mov eax, ecx
        mov dword [byte esp+05Ch], ebx
        cmp eax, edx
        jl near .31
.56:
        add esp, 88h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ClassifyQuadDepth                               BACC0  96 PC, low confidence
; Sorts a quad by depth: behind the near plane, crossing it, flat enough or
; needing subdivision
;-----------------------------------------------------------------------------
ClassifyQuadDepth:
        push esi
        push edi
        push ebp
        mov ecx, dword [byte esp+014h]
        mov edx, dword [byte esp+018h]
        mov esi, dword [byte esp+01Ch]
        mov eax, dword [byte esp+010h]
        mov eax, dword [byte eax+08h]
        mov edi, dword [byte ecx+08h]
        mov ebx, eax
        cmp eax, edi
        jle short .1
        mov eax, edi
        jmp short .2
.1:
        jge short .2
        mov ebx, edi
.2:
        mov ecx, dword [byte edx+08h]
        cmp eax, ecx
        jle short .3
        mov eax, ecx
        jmp short .4
.3:
        cmp ebx, ecx
        jge short .4
        mov ebx, ecx
.4:
        mov ebp, dword [byte esi+08h]
        cmp eax, ebp
        jle short .5
        mov eax, ebp
        jmp short .6
.5:
        cmp ebx, ebp
        jge short .6
        mov ebx, ebp
.6:
        mov ecx, dword [NearClipZ]
        cmp ebx, ecx
        jg short .7
        mov eax, 1
        pop ebp
        pop edi
        pop esi
        ret
.7:
        cmp eax, ecx
        jg short .8
        mov eax, 3
        pop ebp
        pop edi
        pop esi
        ret
.8:
        mov ecx, ebx
        mov edx, dword [QuadDepthLimit]
        sub ecx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp ecx, eax
        jge short .9
        xor eax, eax
        pop ebp
        pop edi
        pop esi
        ret
.9:
        mov eax, 2
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; SubdivideTexturedQuad                           BAD58  96 PC, low confidence
; Draws a textured quad, splitting it in four until the perspective error is
; small
;-----------------------------------------------------------------------------
SubdivideTexturedQuad:
        push esi
        push edi
        push ebp
        sub esp, byte 6Ch
        mov edx, dword [dword esp+08Ch]
        push edx
        mov ebx, dword [dword esp+08Ch]
        push ebx
        mov ecx, dword [dword esp+08Ch]
        push ecx
        mov esi, dword [dword esp+08Ch]
        push esi
        call ClassifyQuadDepth
        add esp, byte 10h
        mov edx, eax
        cmp eax, byte 1
        je near .9
        cmp eax, byte 3
        je near .4
        mov eax, dword [dword esp+090h]
        mov edi, dword [ViewScreenHeight]
        cmp edi, dword [byte eax+04h]
        jg short .1
        mov eax, dword [dword esp+094h]
        cmp edi, dword [byte eax+04h]
        jg short .1
        mov eax, dword [dword esp+098h]
        cmp edi, dword [byte eax+04h]
        jg short .1
        mov eax, dword [dword esp+09Ch]
        cmp edi, dword [byte eax+04h]
        jle near .9
.1:
        mov eax, dword [dword esp+090h]
        mov esi, dword [ViewScreenWidth]
        cmp esi, dword [eax]
        jg short .2
        mov eax, dword [dword esp+094h]
        cmp esi, dword [eax]
        jg short .2
        mov eax, dword [dword esp+098h]
        cmp esi, dword [eax]
        jg short .2
        mov eax, dword [dword esp+09Ch]
        cmp esi, dword [eax]
        jle near .9
.2:
        mov eax, dword [dword esp+090h]
        cmp dword [byte eax+04h], byte 0
        jg short .3
        mov eax, dword [dword esp+094h]
        cmp dword [byte eax+04h], byte 0
        jg short .3
        mov eax, dword [dword esp+098h]
        cmp dword [byte eax+04h], byte 0
        jg short .3
        mov eax, dword [dword esp+09Ch]
        cmp dword [byte eax+04h], byte 0
        jle near .9
.3:
        mov eax, dword [dword esp+090h]
        cmp dword [eax], byte 0
        jg short .4
        mov eax, dword [dword esp+094h]
        cmp dword [eax], byte 0
        jg short .4
        mov eax, dword [dword esp+098h]
        cmp dword [eax], byte 0
        jg short .4
        mov eax, dword [dword esp+09Ch]
        cmp dword [eax], byte 0
        jle near .9
.4:
        cmp edx, byte 3
        jne short .5
        mov eax, dword [byte esp+07Ch]
        cmp eax, dword [SubdivMaxSize]
        jg near .9
.5:
        test edx, edx
        je short .6
        mov eax, dword [byte esp+07Ch]
        cmp eax, dword [SubdivMaxSize]
        jl near .7
.6:
        lea edi, [byte esp+020h]
        mov esi, dword [dword esp+090h]
        movsd
        movsd
        lea edi, [byte esp+028h]
        mov esi, dword [dword esp+094h]
        movsd
        movsd
        lea edi, [byte esp+030h]
        mov esi, dword [dword esp+098h]
        movsd
        movsd
        lea edi, [byte esp+038h]
        mov esi, dword [dword esp+09Ch]
        movsd
        movsd
        mov edi, esp
        mov esi, dword [dword esp+0A0h]
        movsd
        movsd
        lea edi, [byte esp+08h]
        mov esi, dword [dword esp+0A4h]
        movsd
        movsd
        lea edi, [byte esp+010h]
        mov esi, dword [dword esp+0A8h]
        movsd
        movsd
        lea edi, [byte esp+018h]
        mov esi, dword [dword esp+0ACh]
        movsd
        movsd
        mov edi, dword [SubdivDepth]
        push edi
        lea eax, [byte esp+024h]
        push eax
        lea eax, [byte esp+08h]
        push eax
        push byte 4
        mov ebp, dword [SubdivLimit]
        push ebp
        call FillShadedPoly
        mov eax, dword [SubdivTable]
        add esp, byte 14h
        test eax, eax
        je near .9
        mov eax, dword [dword esp+094h]
        push byte 4
        mov edx, dword [byte eax+04h]
        push edx
        mov ebx, dword [eax]
        mov eax, dword [dword esp+098h]
        push ebx
        mov ecx, dword [byte eax+04h]
        push ecx
        mov esi, dword [eax]
        push esi
        call FillRectColor
        add esp, byte 14h
        mov eax, dword [dword esp+094h]
        push byte 4
        mov edi, dword [byte eax+04h]
        push edi
        mov ebp, dword [eax]
        mov eax, dword [dword esp+0A0h]
        push ebp
        mov edx, dword [byte eax+04h]
        push edx
        mov ebx, dword [eax]
        push ebx
        call FillRectColor
        add esp, byte 14h
        mov eax, dword [dword esp+09Ch]
        push byte 4
        mov ecx, dword [byte eax+04h]
        push ecx
        mov esi, dword [eax]
        mov eax, dword [dword esp+0A0h]
        push esi
        mov edi, dword [byte eax+04h]
        push edi
        mov ebp, dword [eax]
        push ebp
        call FillRectColor
        add esp, byte 14h
        mov eax, dword [dword esp+09Ch]
        push byte 4
        mov edx, dword [byte eax+04h]
        push edx
        mov ebx, dword [eax]
        mov eax, dword [dword esp+098h]
        push ebx
        mov ecx, dword [byte eax+04h]
        push ecx
        mov esi, dword [eax]
        push esi
        call FillRectColor
        add esp, byte 14h
        add esp, byte 6Ch
        pop ebp
        pop edi
        pop esi
        ret
.7:
        mov edx, eax
        shl eax, 2
        mov edi, PerspQuadTex
        sub eax, edx
        mov ebp, edx
        shl eax, 2
        shl ebp, 3
        add edi, eax
        mov eax, PerspQuadVerts
        add eax, ebp
        mov edx, dword [dword esp+084h]
        mov dword [byte esp+068h], eax
        mov eax, dword [dword esp+080h]
        mov ebx, dword [edx]
        mov eax, dword [eax]
        add eax, ebx
        sar eax, 1
        mov dword [edi], eax
        mov eax, dword [dword esp+080h]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte edi+04h], eax
        mov eax, dword [dword esp+080h]
        mov esi, dword [byte edx+08h]
        mov eax, dword [byte eax+08h]
        add eax, esi
        sar eax, 1
        mov dword [byte edi+08h], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+088h]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte edi+0Ch], eax
        mov eax, dword [dword esp+084h]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte edi+010h], eax
        mov eax, dword [dword esp+084h]
        mov esi, dword [byte edx+08h]
        mov eax, dword [byte eax+08h]
        add eax, esi
        sar eax, 1
        mov dword [byte edi+014h], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+08Ch]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte edi+018h], eax
        mov eax, dword [dword esp+088h]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte edi+01Ch], eax
        mov eax, dword [dword esp+088h]
        mov esi, dword [byte edx+08h]
        mov eax, dword [byte eax+08h]
        add eax, esi
        sar eax, 1
        mov dword [byte edi+020h], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+080h]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte edi+024h], eax
        mov eax, dword [dword esp+08Ch]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte edi+028h], eax
        mov eax, dword [dword esp+08Ch]
        mov esi, dword [byte edx+08h]
        mov eax, dword [byte eax+08h]
        add eax, esi
        sar eax, 1
        mov dword [byte edi+02Ch], eax
        mov edx, dword [byte edi+018h]
        mov eax, dword [edi]
        add eax, edx
        sar eax, 1
        mov dword [byte edi+030h], eax
        mov ebx, dword [byte edi+01Ch]
        mov eax, dword [byte edi+04h]
        add eax, ebx
        push byte 10h
        sar eax, 1
        mov esi, dword [byte esp+06Ch]
        mov dword [byte edi+034h], eax
        push esi
        mov ecx, dword [byte edi+020h]
        mov eax, dword [byte edi+08h]
        push edi
        add eax, ecx
        push byte 5
        sar eax, 1
        add ebp, PerspQuadState
        mov dword [byte edi+038h], eax
        call ProjectPointsPersp
        add esp, byte 10h
        lea edx, [byte esi+028h]
.8:
        mov eax, dword [SubdivMinDepth]
        mov ebx, dword [byte esi+04h]
        add esi, byte 8
        sub ebx, eax
        mov dword [byte esi-04h], ebx
        cmp esi, edx
        jne short .8
        mov eax, dword [dword esp+0A0h]
        mov edx, dword [dword esp+0A4h]
        mov eax, dword [eax]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp+00h], eax
        mov eax, dword [dword esp+0A0h]
        mov esi, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, esi
        sar eax, 1
        mov dword [byte ebp+04h], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+0A8h]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp+08h], eax
        mov eax, dword [dword esp+0A4h]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte ebp+0Ch], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+0ACh]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp+010h], eax
        mov eax, dword [dword esp+0A8h]
        mov ebx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ebx
        sar eax, 1
        mov dword [byte ebp+014h], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+0A0h]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp+018h], eax
        mov eax, dword [dword esp+0ACh]
        mov esi, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, esi
        sar eax, 1
        mov dword [byte ebp+01Ch], eax
        mov eax, dword [edx]
        mov edx, dword [dword esp+0A8h]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp+020h], eax
        mov eax, dword [dword esp+0A0h]
        mov ecx, dword [byte edx+04h]
        mov eax, dword [byte eax+04h]
        add eax, ecx
        sar eax, 1
        mov dword [byte ebp+024h], eax
        lea eax, [byte ebp+018h]
        mov esi, dword [SubdivMinDepth]
        mov dword [byte esp+040h], eax
        push eax
        lea eax, [byte ebp+020h]
        inc esi
        push eax
        mov dword [SubdivMinDepth], esi
        mov ebx, dword [dword esp+0A8h]
        push ebp
        mov dword [byte esp+06Ch], eax
        mov eax, dword [byte esp+074h]
        push ebx
        add eax, byte 18h
        mov esi, dword [byte esp+078h]
        push eax
        add esi, byte 20h
        push esi
        mov dword [byte esp+05Ch], eax
        mov eax, dword [dword esp+080h]
        push eax
        mov edx, dword [dword esp+0ACh]
        push edx
        lea eax, [byte edi+024h]
        push eax
        mov dword [byte esp+06Ch], eax
        lea eax, [byte edi+030h]
        push eax
        push edi
        mov dword [dword esp+090h], eax
        mov eax, dword [dword esp+0ACh]
        push eax
        mov eax, dword [dword esp+0ACh]
        add eax, byte 5
        push eax
        mov dword [dword esp+090h], eax
        call SubdivideTexturedQuad
        add esp, byte 34h
        mov ebx, dword [byte esp+060h]
        push ebx
        lea eax, [byte ebp+08h]
        push eax
        mov dword [byte esp+058h], eax
        mov eax, dword [dword esp+0ACh]
        push eax
        push ebp
        mov eax, dword [byte esp+078h]
        push esi
        add eax, byte 8
        push eax
        mov ebx, dword [dword esp+0ACh]
        push ebx
        mov ecx, dword [dword esp+084h]
        push ecx
        mov dword [byte esp+078h], eax
        mov eax, dword [dword esp+084h]
        push eax
        lea eax, [byte edi+0Ch]
        push eax
        mov ebx, dword [dword esp+0ACh]
        push ebx
        push edi
        mov ecx, dword [dword esp+08Ch]
        push ecx
        mov dword [dword esp+088h], eax
        call SubdivideTexturedQuad
        add esp, byte 34h
        mov eax, dword [dword esp+0ACh]
        push eax
        add ebp, byte 10h
        push ebp
        mov ebx, dword [byte esp+068h]
        push ebx
        mov ecx, dword [byte esp+04Ch]
        push ecx
        mov dword [byte esp+05Ch], ebp
        mov ebp, dword [dword esp+0ACh]
        push ebp
        mov ebp, dword [byte esp+07Ch]
        add ebp, byte 10h
        push ebp
        push esi
        mov eax, dword [byte esp+060h]
        push eax
        mov edx, dword [dword esp+0ACh]
        push edx
        add edi, byte 18h
        push edi
        mov ebx, dword [dword esp+08Ch]
        push ebx
        mov ecx, dword [byte esp+074h]
        push ecx
        mov eax, dword [dword esp+08Ch]
        push eax
        call SubdivideTexturedQuad
        add esp, byte 34h
        mov edx, dword [byte esp+04Ch]
        push edx
        mov ebx, dword [dword esp+0ACh]
        push ebx
        mov ecx, dword [byte esp+058h]
        push ecx
        mov eax, dword [byte esp+06Ch]
        push eax
        push ebp
        mov edx, dword [dword esp+0ACh]
        push edx
        mov ebx, dword [byte esp+070h]
        push ebx
        push esi
        push edi
        mov ecx, dword [dword esp+0ACh]
        push ecx
        mov esi, dword [byte esp+07Ch]
        push esi
        mov edi, dword [dword esp+090h]
        push edi
        mov ebp, dword [dword esp+08Ch]
        push ebp
        call SubdivideTexturedQuad
        mov eax, dword [SubdivMinDepth]
        dec eax
        add esp, byte 34h
        mov dword [SubdivMinDepth], eax
.9:
        add esp, byte 6Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawPerspQuad                                   BB384  96 PC, low confidence
; Draws a perspective correct textured quad from 3D points and texture points
;-----------------------------------------------------------------------------
DrawPerspQuad:
        push esi
        push edi
        push ebp
        mov ecx, dword [byte esp+014h]
        mov ebp, dword [byte esp+018h]
        mov edx, dword [byte esp+01Ch]
        mov eax, dword [byte esp+010h]
        mov dword [SubdivLimit], eax
        mov eax, dword [byte esp+020h]
        xor ebx, ebx
        mov dword [SubdivDepth], eax
        xor eax, eax
.1:
        imul esi, dword [edx], byte 0Ch
        lea edi, [dword ebx+PerspQuadTex]
        add esi, ecx
        movsd
        movsd
        movsd
        mov esi, dword [edx]
        add edx, byte 4
        shl esi, 3
        lea edi, [dword eax+PerspQuadVerts]
        add esi, ebp
        add eax, byte 8
        add ebx, byte 0Ch
        movsd
        movsd
        cmp eax, byte 20h
        jne short .1
        push PerspQuadState+18h
        push PerspQuadState+10h
        push PerspQuadState+8
        xor ebp, ebp
        push PerspQuadState
        mov eax, dword [SubdivLimit]
        mov dword [PerspQuadState], ebp
        push PerspQuadVerts+18h
        mov dword [PerspQuadState+4], ebp
        mov dword [PerspQuadState+0Ch], ebp
        push PerspQuadVerts+10h
        mov dword [PerspQuadState+18h], ebp
        mov edx, dword [byte eax+02h]
        push PerspQuadVerts+8
        sar edx, 10h
        push PerspQuadVerts
        mov eax, dword [byte eax+04h]
        dec edx
        push PerspQuadTex+24h
        sar eax, 10h
        push PerspQuadTex+18h
        shl edx, 10h
        dec eax
        push PerspQuadTex+0Ch
        mov dword [PerspQuadState+8], edx
        mov dword [PerspQuadState+10h], edx
        push PerspQuadTex
        shl eax, 10h
        push byte 4
        mov dword [PerspQuadState+14h], eax
        mov dword [PerspQuadState+1Ch], eax
        call SubdivideTexturedQuad
        add esp, byte 34h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawFlatPoly                                 BB470  96 PC, medium confidence
; Draws a flat polygon
;-----------------------------------------------------------------------------
DrawFlatPoly:
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        mov ebp, dword [byte esp+028h]
        cmp ebp, dword [byte esp+020h]
        jne short .2
.1:
        mov edx, dword [byte esp+01Ch]
        dec edx
        mov dword [byte esp+01Ch], edx
        cmp edx, byte 0FFFFFFFFh
        je short .4
        mov eax, esp
        push eax
        mov ecx, dword [byte esp+028h]
        push ecx
        mov esi, dword [byte esp+028h]
        push esi
        mov edi, ebp
        lea esi, [byte esp+0Ch]
        call TransformVector
        add esp, byte 0Ch
        movsd
        movsd
        movsd
        mov edi, dword [byte esp+020h]
        add edi, byte 0Ch
        add ebp, byte 0Ch
        mov dword [byte esp+020h], edi
        jmp short .1
.2:
        mov esi, dword [byte esp+024h]
.3:
        mov ebx, dword [byte esp+01Ch]
        dec ebx
        mov dword [byte esp+01Ch], ebx
        cmp ebx, byte 0FFFFFFFFh
        je short .4
        push ebp
        push esi
        mov edi, dword [byte esp+028h]
        push edi
        call TransformVector
        add esp, byte 0Ch
        lea eax, [byte edi+0Ch]
        add ebp, byte 0Ch
        mov dword [byte esp+020h], eax
        jmp short .3
.4:
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        ret
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        mov ebp, dword [byte esp+028h]
        cmp ebp, dword [byte esp+020h]
        jne short .6
.5:
        mov edx, dword [byte esp+01Ch]
        dec edx
        mov dword [byte esp+01Ch], edx
        cmp edx, byte 0FFFFFFFFh
        je short .4
        mov eax, esp
        push eax
        mov ecx, dword [byte esp+028h]
        push ecx
        mov esi, dword [byte esp+028h]
        push esi
        mov edi, ebp
        lea esi, [byte esp+0Ch]
        call TransformVector
        add esp, byte 0Ch
        movsd
        movsd
        movsd
        mov edi, dword [byte esp+020h]
        add edi, byte 0Ch
        add ebp, byte 0Ch
        mov dword [byte esp+020h], edi
        jmp short .5
.6:
        mov esi, dword [byte esp+024h]
.7:
        mov ebx, dword [byte esp+01Ch]
        dec ebx
        mov dword [byte esp+01Ch], ebx
        cmp ebx, byte 0FFFFFFFFh
        je short .4
        push ebp
        push esi
        mov edi, dword [byte esp+028h]
        push edi
        call TransformVector
        add esp, byte 0Ch
        lea eax, [byte edi+0Ch]
        add ebp, byte 0Ch
        mov dword [byte esp+020h], eax
        jmp short .7
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawPolyOutline                                 BB570  96 PC, low confidence
; Draws a polygon outline
;-----------------------------------------------------------------------------
DrawPolyOutline:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov edx, dword [byte esp+014h]
        mov ecx, dword [byte esp+018h]
        mov eax, dword [byte esp+01Ch]
.1:
        dec esi
        cmp esi, byte 0FFFFFFFFh
        je short .2
        mov ebx, dword [edx]
        mov edi, dword [ecx]
        add ebx, edi
        mov dword [eax], ebx
        mov ebx, dword [byte edx+04h]
        mov ebp, dword [byte ecx+04h]
        add ebx, ebp
        mov dword [byte eax+04h], ebx
        mov ebx, dword [byte edx+08h]
        mov edi, dword [byte ecx+08h]
        add eax, byte 0Ch
        add ebx, edi
        add edx, byte 0Ch
        mov dword [byte eax-04h], ebx
        jmp short .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
        push esi
        push edi
        push ebp
        mov edi, dword [byte esp+010h]
        mov ebx, dword [byte esp+014h]
        mov eax, dword [byte esp+018h]
        mov esi, dword [byte esp+01Ch]
        mov edx, dword [byte esp+020h]
.3:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je short .2
        mov cl, al
        mov ebp, dword [ebx]
        sar ebp, cl
        mov ecx, dword [esi]
        add ebp, ecx
        mov dword [edx], ebp
        mov cl, al
        mov ebp, dword [byte ebx+04h]
        sar ebp, cl
        mov ecx, dword [byte esi+04h]
        add ebp, ecx
        mov dword [byte edx+04h], ebp
        mov cl, al
        mov ebp, dword [byte ebx+08h]
        add edx, byte 0Ch
        sar ebp, cl
        mov ecx, dword [byte esi+08h]
        add ebp, ecx
        add ebx, byte 0Ch
        mov dword [byte edx-04h], ebp
        jmp short .3
