; 3D library: TransformVector, MultiplyMatrix, ProjectPointsPersp, DrawPolyList, SetRinkMatrix and 19 more.
bits 32
%include "hockey.inc"
section s_BB9C2 progbits alloc exec nowrite align=1
extern AllocMemBlock, CameraMatrix, DrawClippedPoly, DrawFlatPoly, DrawPolyOutline, FatalError, FillTexturePoly, FixedSinCos
extern FreeMemBlock, IdentityMatrix, ModelPolyClip, ModelPolyColour, ModelPolyCount, ModelPolyDrawFn, ModelPolyFirst, ModelPolyFlags
extern ModelPolyShade, NearClipZ, NearPlaneZ, OpenArtArchive, OriApplyMorph, OriFlatDrawFuncs, OriPolyDrawFuncs, OriPositionBuf
extern OriQuadDrawFuncs, OriRotateY, OriSetMaterialRgb, OriStripDrawFuncs, OriTriDrawFuncs, ProjectFlags, ProjectPointList, ProjectRinkObject
extern RinkMatrix, RinkTranslation, RinkViewChanged, SetRinkView, SortBuffer, SortIndices, str_INVMATRX, str_Ori
extern str_ORIINST, str_OriloadCouldNotLoadORIGA, strncpy_, SubVec3, TransformRinkObject, TransformRinkPoints, ViewCentreX, ViewCentreY
global TransformVector, MultiplyMatrix, ProjectPointsPersp, DrawPolyList, SetRinkMatrix, SetRinkTranslation, SetScreenScale, ProjectModelPoints
global DrawModelFlat, DrawModelFlat_93, SetModelFrame, DrawSortedModelPolys, DrawSortedModelPolys_B3, DrawModelSorted, DrawModelPoly, DrawModelPoly_174
global DrawModelPolyList, DrawModelPolys, OriCreateInstance, OriSetObjectMatrix, OriSetObjectPosition, OriFixupModel, OriReadModel, OriLoadModel
global MakeRotXMatrix, MakeRotYMatrix, MakeRotZMatrix
        db 00h,00h
;-----------------------------------------------------------------------------
; TransformVector                              BB9C4  96 PC, medium confidence
; Multiplies a vector by a 3x3 16.16 fixed point matrix
;-----------------------------------------------------------------------------
TransformVector:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov ebx, dword [byte esp+014h]
        mov edi, dword [byte esp+018h]
        mov eax, dword [esi]
        imul dword [ebx]
        LD mov, ebp, eax
        LD mov, ecx, edx
        mov eax, dword [byte esi+04h]
        imul dword [byte ebx+0Ch]
        LD add, ebp, eax
        LD adc, ecx, edx
        mov eax, dword [byte esi+08h]
        imul dword [byte ebx+018h]
        LD add, eax, ebp
        LD adc, edx, ecx
        shrd eax, edx, 10h
        mov dword [edi], eax
        mov eax, dword [esi]
        imul dword [byte ebx+04h]
        LD mov, ebp, eax
        LD mov, ecx, edx
        mov eax, dword [byte esi+04h]
        imul dword [byte ebx+010h]
        LD add, ebp, eax
        LD adc, ecx, edx
        mov eax, dword [byte esi+08h]
        imul dword [byte ebx+01Ch]
        LD add, eax, ebp
        LD adc, edx, ecx
        shrd eax, edx, 10h
        mov dword [byte edi+04h], eax
        mov eax, dword [esi]
        imul dword [byte ebx+08h]
        LD mov, ebp, eax
        LD mov, ecx, edx
        mov eax, dword [byte esi+04h]
        imul dword [byte ebx+014h]
        LD add, ebp, eax
        LD adc, ecx, edx
        mov eax, dword [byte esi+08h]
        imul dword [byte ebx+020h]
        LD add, eax, ebp
        LD adc, edx, ecx
        shrd eax, edx, 10h
        mov dword [byte edi+08h], eax
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; MultiplyMatrix                                  BBA41  96 PC, low confidence
; Multiplies two 3x3 fixed-point matrices
;-----------------------------------------------------------------------------
MultiplyMatrix:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        mov edi, dword [byte ebp+010h]
        mov ecx, 9
        push ebp
.1:
        mov eax, dword [esi]
        imul dword [ebx]
        shrd eax, edx, 10h
        LD mov, ebp, eax
        mov eax, dword [byte esi+04h]
        imul dword [byte ebx+0Ch]
        shrd eax, edx, 10h
        LD add, ebp, eax
        mov eax, dword [byte esi+08h]
        imul dword [byte ebx+018h]
        shrd eax, edx, 10h
        LD add, ebp, eax
        mov dword [edi], ebp
        add edi, byte 4
        cmp cl, 7
        je short .2
        cmp cl, 4
        je short .2
        add ebx, byte 4
        dec ecx
        jne short .1
        pop ebp
        pop edi
        pop esi
        leave
        ret
.2:
        sub ebx, byte 8
        add esi, byte 0Ch
        dec ecx
        jne short .1
        db 00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ProjectPointsPersp                              BBAA0  96 PC, low confidence
; Projects a list of 3D points with perspective, marking points behind the
; near plane
;-----------------------------------------------------------------------------
ProjectPointsPersp:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov ebp, dword [byte esp+018h]
        mov eax, dword [byte esp+024h]
        mov esi, dword [byte esp+01Ch]
        add eax, byte 8
        mov ebx, dword [byte esp+020h]
        mov dword [byte esp+04h], eax
.1:
        dec ebp
        cmp ebp, byte 0FFFFFFFFh
        je near .8
        mov edx, dword [NearClipZ]
        mov eax, dword [byte esi+08h]
        cmp eax, edx
        jg short .2
        mov dword [byte ebx+04h], 80000000h
        mov eax, dword [byte ebx+04h]
        mov dword [ebx], eax
        or byte [ProjectFlags], 1
        jmp short .7
.2:
        mov edx, dword [byte esp+024h]
        cmp eax, 10000h
        jl short .3
        mov edx, dword [byte esp+04h]
        sar eax, 8
.3:
        cmp eax, 10000h
        jl short .4
        sar eax, 8
        add edx, byte 8
.4:
        cmp eax, 1000h
        jl short .5
        sar eax, 4
        add edx, byte 4
.5:
        cmp eax, 400h
        jl short .6
        sar eax, 2
        add edx, byte 2
.6:
        mov edi, dword [SortBuffer]
        mov edi, dword [edi+eax*4]
        mov eax, dword [esi]
        imul eax, edi
        mov cl, dl
        sar eax, cl
        mov dword [esp], eax
        mov ecx, dword [esp]
        mov eax, dword [ViewCentreX]
        add eax, ecx
        mov dword [ebx], eax
        imul edi, dword [byte esi+04h]
        mov cl, dl
        mov eax, dword [ViewCentreY]
        sar edi, cl
        sub eax, edi
        mov dword [byte ebx+04h], eax
.7:
        add esi, byte 0Ch
        add ebx, byte 8
        jmp near .1
.8:
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawPolyList                                    BBB70  96 PC, low confidence
; Draws a list of polygons
;-----------------------------------------------------------------------------
DrawPolyList:
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
        call DrawClippedPoly
        add esp, byte 0Ch
        add esp, byte 20h
        pop ebp
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; SetRinkMatrix                                   BBBD0  96 PC, low confidence
; Copies the rink view rotation matrix and marks the view as changed
;-----------------------------------------------------------------------------
SetRinkMatrix:
        push esi
        push edi
        mov edx, 1
        mov ecx, 9
        mov esi, dword [byte esp+0Ch]
        mov edi, RinkMatrix
        mov dword [RinkViewChanged], edx
        rep movsd
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SetRinkTranslation                              BBBF0  96 PC, low confidence
; Copies the rink view translation vector
;-----------------------------------------------------------------------------
SetRinkTranslation:
        push esi
        push edi
        mov esi, dword [byte esp+0Ch]
        mov edi, RinkTranslation
        movsd
        movsd
        movsd
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; SetScreenScale                                  BBC04  96 PC, low confidence
; Sets the screen scale and the matching text scale
;-----------------------------------------------------------------------------
SetScreenScale:
        mov eax, dword [byte esp+04h]
        mov dword [NearPlaneZ], eax
        dec eax
        mov dword [NearClipZ], eax
        ret
;-----------------------------------------------------------------------------
; ProjectModelPoints                              BBC14  96 PC, low confidence
; Projects a model's points, flat or with perspective by its flags
;-----------------------------------------------------------------------------
ProjectModelPoints:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        test byte [byte esi+010h], 20h
        je short .2
        mov edi, dword [dword esi+080h]
        push edi
        mov ebp, dword [byte esi+078h]
        push ebp
        mov eax, dword [byte esi+04h]
        push eax
        call ProjectPointList
        add esp, byte 0Ch
        mov eax, dword [byte esi+07Ch]
        mov ebx, dword [byte esi+04h]
        mov edx, dword [dword esi+080h]
        add ebx, ebx
.1:
        dec ebx
        cmp ebx, byte 0FFFFFFFFh
        je short .3
        mov ecx, edx
        mov ecx, dword [ecx]
        add ecx, 8000h
        add eax, byte 4
        sar ecx, 10h
        add edx, byte 4
        mov dword [byte eax-04h], ecx
        jmp short .1
.2:
        push byte 10h
        mov edx, dword [byte esi+07Ch]
        push edx
        mov ebx, dword [byte esi+078h]
        push ebx
        mov ecx, dword [byte esi+04h]
        push ecx
        call ProjectPointsPersp
        add esp, byte 10h
.3:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawModelFlat                                   BBC80  96 PC, low confidence
; Updates a model's matrix when needed and draws it as flat polygons with
; outlines
;-----------------------------------------------------------------------------
DrawModelFlat:
        push esi
        push edi
        push ebp
        sub esp, byte 18h
        mov esi, dword [byte esp+028h]
        test byte [byte esi+010h], 4
        jne short .1
        cmp dword [RinkViewChanged], byte 0
        je short .2
.1:
        lea eax, [byte esi+04Ch]
        push eax
        push RinkMatrix
        lea eax, [byte esi+028h]
        push eax
        call MultiplyMatrix
        mov dl, byte [byte esi+010h]
        and dl, 0FBh
        add esp, byte 0Ch
        mov byte [byte esi+010h], dl
.2:
        mov eax, esp
        push eax
        push RinkTranslation
        lea eax, [byte esi+01Ch]
        push eax
        call SubVec3
        add esp, byte 0Ch
        lea eax, [byte esp+0Ch]
        push eax
        push RinkMatrix
        lea eax, [byte esp+08h]
        push eax
        call TransformVector
        add esp, byte 0Ch
        mov ebx, dword [byte esi+078h]
        push ebx
        lea eax, [byte esi+04Ch]
        push eax
        mov ecx, dword [byte esi+070h]
        push ecx
        mov edi, dword [byte esi+04h]
        push edi
        call DrawFlatPoly
        add esp, byte 10h
        mov ebp, dword [byte esi+078h]
        push ebp
        lea eax, [byte esp+010h]
        push eax
        push ebp
        mov edx, dword [byte esi+04h]
        push edx
        call DrawPolyOutline
        add esp, byte 10h
        add esp, byte 18h
DrawModelFlat_93:
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; SetModelFrame                                   BBD18  96 PC, low confidence
; Selects an animation frame of a model instance
;-----------------------------------------------------------------------------
SetModelFrame:
        push esi
        push edi
        push ebp
        mov ecx, dword [byte esp+010h]
        mov ebx, dword [byte esp+014h]
        mov esi, dword [ecx]
        mov eax, dword [dword ecx+084h]
        mov dword [byte ecx+08h], 0
        test ebx, ebx
        jl short .1
        cmp ebx, dword [byte esi+048h]
        jl short .4
.1:
        mov edi, dword [byte esi+028h]
        mov ebp, dword [byte esi+024h]
        xor ebx, ebx
        test ebp, ebp
        jle short DrawModelFlat_93
.2:
        test byte [byte edi+01h], 4
        jne short .3
        mov edx, dword [byte ecx+08h]
        lea ebp, [byte edx+01h]
        add eax, byte 4
        mov dword [byte ecx+08h], ebp
        mov dword [byte eax-04h], edx
.3:
        inc ebx
        cmp ebx, dword [byte esi+024h]
        jge short DrawModelFlat_93
        jmp short .2
.4:
        mov edi, dword [byte esi+04Ch]
        mov edx, dword [byte esi+050h]
        mov esi, ebx
        shl ebx, 3
        sub ebx, esi
        shl ebx, 2
        add edi, ebx
        mov ebx, dword [byte edi+010h]
        shl ebx, 2
        add edx, ebx
        mov ebx, dword [byte edi+014h]
        mov dword [byte ecx+08h], ebx
.5:
        dec ebx
        cmp ebx, byte 0FFFFFFFFh
        je short DrawModelFlat_93
        add eax, byte 4
        mov ecx, dword [edx]
        add edx, byte 4
        mov dword [byte eax-04h], ecx
        jmp short .5
        db 090h
;-----------------------------------------------------------------------------
; DrawSortedModelPolys                            BBD98  96 PC, low confidence
; Sorts a model's faces by depth and draws them back to front
;-----------------------------------------------------------------------------
DrawSortedModelPolys:
        push esi
        push edi
        push ebp
        sub esp, 0FA8h
        mov esi, dword [dword esp+0FB8h]
        mov ecx, dword [dword esp+0FC0h]
        mov edx, dword [dword esp+0FBCh]
        mov dword [dword esp+0FA0h], ecx
        mov eax, dword [esi]
        mov esi, dword [byte esi+078h]
        cmp edx, 3E8h
        jle short .1
        mov dword [dword esp+0FBCh], 3E8h
.1:
        mov edi, dword [dword esp+0FBCh]
        mov eax, dword [byte eax+028h]
        xor ebx, ebx
        mov dword [dword esp+0FA4h], eax
        mov eax, esp
        test edi, edi
        jle short .3
.2:
        imul edx, dword [ecx], byte 0Ch
        add edx, dword [dword esp+0FA4h]
        mov edx, dword [byte edx+04h]
        imul edi, dword [edx], byte 0Ch
        mov edi, dword [byte edi+esi+08h]
        add edx, byte 4
        mov dword [eax], edi
        imul edx, dword [edx], byte 0Ch
        add eax, byte 4
        inc ebx
        mov ebp, dword [byte eax-04h]
        mov edx, dword [byte edx+esi+08h]
        add ecx, byte 4
        add ebp, edx
        mov edx, dword [dword esp+0FBCh]
        mov dword [byte eax-04h], ebp
        cmp ebx, edx
        jl short .2
.3:
        mov ebx, dword [dword esp+0FA0h]
        push ebx
        lea eax, [byte esp+04h]
        push eax
        mov ecx, dword [dword esp+0FC4h]
        push ecx
        call SortIndices
        add esp, byte 0Ch
        add esp, 0FA8h
DrawSortedModelPolys_B3:
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; DrawModelSorted                                 BBE50  96 PC, low confidence
; Draws a model's polygons depth sorted
;-----------------------------------------------------------------------------
DrawModelSorted:
        mov eax, dword [byte esp+04h]
        mov edx, dword [dword eax+084h]
        push edx
        mov ebx, dword [byte eax+08h]
        push ebx
        push eax
        call DrawSortedModelPolys
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
        push esi
        push edi
        push ebp
        mov eax, dword [byte esp+010h]
        push byte 0
        mov edx, dword [byte eax+07Ch]
        push edx
        mov ebx, dword [byte eax+078h]
        mov edi, dword [eax]
        push ebx
        mov esi, dword [byte edi+028h]
        mov edi, dword [byte edi+024h]
        call SetRinkView
        add esp, byte 0Ch
.1:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je short DrawSortedModelPolys_B3
        mov eax, dword [esi]
        and eax, byte 7
        cmp eax, byte 4
        jne short .2
        test byte [esi], 80h
        je short .2
        mov ecx, dword [byte esi+04h]
        push ecx
        call TransformRinkObject
        mov dl, byte [byte esi+01h]
        and dl, 0DFh
        and eax, byte 1
        mov byte [byte esi+01h], dl
        shl eax, 0Dh
        mov ebp, dword [esi]
        or ebp, eax
        add esp, byte 4
        mov dword [esi], ebp
.2:
        add esi, byte 0Ch
        jmp short .1
;-----------------------------------------------------------------------------
; DrawModelPoly                                   BBEC8  96 PC, low confidence
; Transforms, projects and draws one model polygon through the ORI draw
; tables
;-----------------------------------------------------------------------------
DrawModelPoly:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov eax, dword [byte esp+014h]
.1:
        imul eax, byte 0Ch
        mov ebp, dword [ModelPolyFlags]
        add ebp, eax
        mov esi, dword [byte ebp+00h]
        mov eax, esi
        mov edx, dword [ModelPolyDrawFn]
        and eax, byte 7
        mov edi, dword [byte ebp+04h]
        mov dword [esp], eax
        test edx, edx
        je short .2
        push edi
        push eax
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne near .14
.2:
        test si, 100h
        jne short .3
        test si, 400h
        jne short .3
        push edi
        call ProjectRinkObject
        add esp, byte 4
        xor ebx, ebx
        test eax, eax
        setg al
        mov bl, al
        test si, 200h
        sete al
        and eax, 0FFh
        xor eax, ebx
        jne near .14
.3:
        mov eax, esi
        shl eax, 8
        shr eax, 18h
        imul eax, byte 14h
        mov ebx, dword [ModelPolyColour]
        add ebx, eax
        cmp dword [byte ebx+010h], byte 0
        je short .4
        mov eax, dword [ModelPolyShade]
        mov edx, ebp
        call dword [byte ebx+010h]
        test eax, eax
        je near .14
        jmp near .13
.4:
        test si, 80h
        je near .11
        mov eax, dword [byte ebx+0Ch]
        test eax, eax
        je near .11
        mov ebx, esi
        shl ebx, 19h
        shr ebx, 1Ch
        mov edx, dword [esp]
        shl ebx, 2
        cmp edx, byte 3
        jne short .5
        push edi
        mov ecx, dword [byte ebp+08h]
        push ecx
        push eax
        call dword [dword ebx+OriTriDrawFuncs]
        jmp near .12
.5:
        test si, 1000h
        je short .8
        cmp dword [ModelPolyClip], byte 0
        jne short .6
        test si, 2000h
        je short .7
.6:
        mov ebx, esi
        push edi
        mov edx, dword [byte ebp+08h]
        shl ebx, 19h
        push edx
        shr ebx, 1Ch
        push eax
        call dword [nosplit ebx*4+OriQuadDrawFuncs]
        jmp short .12
.7:
        push edi
        mov ecx, dword [byte ebp+08h]
        push ecx
        push eax
        call dword [dword ebx+OriPolyDrawFuncs]
        jmp short .12
.8:
        cmp dword [ModelPolyClip], byte 0
        jne short .9
        test si, 2000h
        je short .10
.9:
        mov ebx, esi
        push edi
        shl ebx, 19h
        push eax
        shr ebx, 1Ch
        call dword [nosplit ebx*4+OriStripDrawFuncs]
        add esp, byte 8
        jmp short .13
.10:
        push edi
        push eax
        call dword [dword ebx+OriFlatDrawFuncs]
        add esp, byte 8
        jmp short .13
.11:
        push edi
        mov edx, dword [byte esp+04h]
        push edx
        mov ecx, dword [byte ebx+04h]
        push ecx
        call FillTexturePoly
.12:
        add esp, byte 0Ch
.13:
        test si, 800h
        je short .14
        mov eax, dword [esp]
        mov eax, dword [edi+eax*4]
        jmp near .1
.14:
        add esp, byte 4
DrawModelPoly_174:
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawModelPolyList                               BC040  96 PC, low confidence
; Sets the model draw state and the rink view, then draws a list of polygons
;-----------------------------------------------------------------------------
DrawModelPolyList:
        push esi
        push edi
        push ebp
        mov eax, dword [byte esp+010h]
        mov edi, dword [byte esp+014h]
        mov esi, dword [byte esp+018h]
        mov edx, dword [eax]
        mov dword [ModelPolyFirst], edx
        mov ebx, dword [byte edx+028h]
        mov edx, dword [byte edx+020h]
        mov dword [ModelPolyCount], edx
        mov edx, dword [byte eax+014h]
        mov dword [ModelPolyColour], edx
        mov edx, dword [byte eax+010h]
        shl edx, 1Eh
        shr edx, 1Fh
        mov dword [ModelPolyDrawFn], edx
        mov edx, dword [byte eax+010h]
        shl edx, 19h
        shr edx, 1Fh
        mov dword [ModelPolyClip], edx
        mov edx, dword [ModelPolyCount]
        push edx
        mov dword [ModelPolyFlags], ebx
        mov ebx, dword [byte eax+07Ch]
        push ebx
        mov ecx, dword [byte eax+078h]
        push ecx
        mov dword [ModelPolyShade], eax
        call SetRinkView
        add esp, byte 0Ch
.1:
        mov eax, edi
        dec edi
        test eax, eax
        jle short DrawModelPoly_174
        mov ebp, dword [esi]
        push ebp
        add esi, byte 4
        call DrawModelPoly
        add esp, byte 4
        jmp short .1
        db 090h
;-----------------------------------------------------------------------------
; DrawModelPolys                                  BC0C4  96 PC, low confidence
; Draws all of a model's polygons through DrawModelPolyList
;-----------------------------------------------------------------------------
DrawModelPolys:
        mov eax, dword [byte esp+04h]
        mov edx, dword [dword eax+084h]
        push edx
        mov ebx, dword [byte eax+08h]
        push ebx
        push eax
        call DrawModelPolyList
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
        push esi
        push edi
        push ebp
        mov eax, dword [byte esp+010h]
        mov ebp, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        mov edi, dword [byte esp+01Ch]
        mov ecx, dword [byte esp+020h]
        mov edx, dword [eax]
        mov edx, dword [byte edx+010h]
        test edx, edx
        je near DrawModelPoly_174
        mov eax, dword [byte eax+07Ch]
        mov esi, dword [eax]
        mov dword [ebx], esi
        mov dword [byte ebp+00h], esi
        mov esi, dword [byte eax+04h]
        dec edx
        mov dword [ecx], esi
        add eax, byte 8
        mov dword [edi], esi
.1:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je near DrawModelPoly_174
        mov esi, dword [eax]
        cmp esi, dword [byte ebp+00h]
        jge short .2
        mov dword [byte ebp+00h], esi
        jmp short .3
.2:
        cmp esi, dword [ebx]
        jle short .3
        mov dword [ebx], esi
.3:
        mov esi, dword [byte eax+04h]
        cmp esi, dword [edi]
        jge short .4
        mov dword [edi], esi
        jmp short .5
.4:
        cmp esi, dword [ecx]
        jle short .5
        mov dword [ecx], esi
.5:
        add eax, byte 8
        jmp short .1
        db 00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; OriCreateInstance                               BC150  96 PC, low confidence
; Creates an instance ("ORI_INST") of a 3D model with its own frame and
; materials
;-----------------------------------------------------------------------------
OriCreateInstance:
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        mov dword [byte esp+08h], eax
        mov ebp, edx
        mov dword [byte esp+04h], ebx
        mov esi, dword [byte eax+010h]
        mov edi, dword [byte eax+024h]
        mov ecx, dword [byte eax+064h]
        mov eax, dword [byte eax+038h]
        mov dword [esp], eax
        lea eax, [nosplit esi*4+00h]
        sub eax, esi
        lea edx, [nosplit eax*4+00h]
        mov eax, dword [byte esp+08h]
        inc dword [byte eax+0Ch]
        mov bl, byte [byte esp+04h]
        lea eax, [dword edx+08Ch]
        test bl, 1
        je short .1
        add eax, edx
.1:
        test byte [byte esp+04h], 2
        je short .2
        lea edx, [nosplit esi*4+00h]
        sub edx, esi
        shl edx, 2
        add eax, edx
.2:
        lea edx, [nosplit esi*8+00h]
        mov bl, byte [byte esp+04h]
        add eax, edx
        test bl, 4
        je short .3
        add eax, edx
.3:
        lea edx, [nosplit edi*4+00h]
        mov ebx, dword [esp]
        add eax, edx
        lea edx, [nosplit ebx*4+00h]
        add edx, ebx
        shl edx, 2
        add eax, edx
        lea edx, [nosplit ecx*8+00h]
        add edx, ecx
        shl edx, 2
        push ebp
        add eax, edx
        push eax
        push str_ORIINST
        call AllocMemBlock
        add esp, byte 0Ch
        mov ebp, eax
        mov bh, byte [byte eax+010h]
        mov dword [byte eax+04h], esi
        mov edx, dword [byte esp+08h]
        and bh, 0BFh
        mov dword [eax], edx
        mov cl, byte [byte esp+04h]
        mov byte [byte eax+010h], bh
        lea edx, [dword eax+08Ch]
        test cl, 1
        je short .4
        mov bl, bh
        mov dword [byte eax+070h], edx
        or bl, 10h
        mov byte [byte eax+010h], bl
        lea eax, [nosplit esi*4+00h]
        sub eax, esi
        shl eax, 2
        add edx, eax
        jmp short .5
.4:
        mov ebx, dword [byte esp+08h]
        mov ch, byte [byte eax+010h]
        mov ebx, dword [byte ebx+018h]
        and ch, 0EFh
        mov dword [byte eax+070h], ebx
        mov byte [byte eax+010h], ch
.5:
        test byte [byte esp+04h], 2
        je short .6
        lea eax, [nosplit esi*4+00h]
        mov ch, byte [byte ebp+010h]
        mov dword [byte ebp+074h], edx
        sub eax, esi
        or ch, 8
        shl eax, 2
        mov byte [byte ebp+010h], ch
        add edx, eax
        jmp short .7
.6:
        mov cl, byte [byte ebp+010h]
        mov eax, dword [byte ebp+070h]
        and cl, 0F7h
        mov dword [byte ebp+074h], eax
        mov byte [byte ebp+010h], cl
.7:
        lea eax, [nosplit esi*4+00h]
        sub eax, esi
        shl eax, 2
        mov dword [byte ebp+078h], edx
        add edx, eax
        test byte [byte esp+04h], 4
        je short .8
        lea eax, [nosplit esi*8+00h]
        mov bl, byte [byte ebp+010h]
        mov dword [dword ebp+080h], edx
        or bl, 20h
        add edx, eax
        mov byte [byte ebp+010h], bl
        jmp short .9
.8:
        mov ah, byte [byte ebp+010h]
        mov dword [dword ebp+080h], 0
        and ah, 0DFh
        mov byte [byte ebp+010h], ah
.9:
        shl esi, 3
        mov dword [byte ebp+07Ch], edx
        add edx, esi
        shl edi, 2
        mov dword [dword ebp+084h], edx
        lea eax, [edx+edi]
        mov edx, dword [esp]
        mov dword [byte ebp+014h], eax
        lea eax, [nosplit edx*4+00h]
        add edx, eax
        mov ecx, 9
        shl edx, 2
        mov eax, dword [byte ebp+014h]
        mov esi, IdentityMatrix
        add eax, edx
        lea edi, [byte ebp+028h]
        mov dword [dword ebp+088h], eax
        rep movsd
        mov bh, byte [byte ebp+010h]
        mov esi, CameraMatrix
        or bh, 4
        lea edi, [byte ebp+01Ch]
        mov byte [byte ebp+010h], bh
        movsd
        movsd
        movsd
        mov cl, byte [byte ebp+010h]
        push byte 0FFFFFFFFh
        or cl, 1
        push ebp
        mov byte [byte ebp+010h], cl
        call SetModelFrame
        mov ch, byte [byte ebp+010h]
        add esp, byte 8
        test ch, 10h
        je short .10
        push ebp
        call OriApplyMorph
        add esp, byte 4
.10:
        push ebp
        call OriSetMaterialRgb
        add esp, byte 4
        mov eax, dword [byte esp+08h]
        mov eax, dword [byte eax+038h]
        mov dword [byte ebp+0Ch], eax
        mov eax, dword [byte esp+08h]
        mov ecx, dword [byte eax+038h]
        xor edx, edx
        test ecx, ecx
        jle short .12
        xor eax, eax
.11:
        mov ebx, dword [byte ebp+014h]
        mov dword [byte ebx+eax+0Ch], 0
        mov ebx, dword [byte ebp+014h]
        mov dword [byte ebx+eax+010h], 0
        mov ebx, dword [byte esp+08h]
        inc edx
        mov esi, dword [byte ebx+038h]
        add eax, byte 14h
        cmp edx, esi
        jl short .11
.12:
        mov eax, ebp
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
        db 08Bh,0C0h
        mov edx, dword [byte esp+04h]
        mov eax, dword [edx]
        push edx
        dec dword [byte eax+0Ch]
        call FreeMemBlock
        add esp, byte 4
        ret
        db 090h
;-----------------------------------------------------------------------------
; OriSetObjectMatrix                              BC3A0  96 PC, low confidence
; Copies a matrix into a 3D object and marks its matrix changed
;-----------------------------------------------------------------------------
OriSetObjectMatrix:
        push esi
        push edi
        mov eax, dword [byte esp+0Ch]
        mov ecx, 9
        mov esi, dword [byte esp+010h]
        lea edi, [byte eax+028h]
        rep movsd
        or byte [byte eax+010h], 4
        pop edi
        pop esi
        ret
        db 090h
        push esi
        push edi
        push ebp
        sub esp, byte 24h
        mov ebp, dword [byte esp+034h]
        mov edx, dword [byte esp+038h]
        push edx
        lea eax, [byte esp+04h]
        push eax
        lea esi, [byte esp+08h]
        call OriRotateY
        mov ecx, 9
        lea edi, [byte ebp+028h]
        add esp, byte 8
        rep movsd
        or byte [byte ebp+010h], 4
        add esp, byte 24h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; OriSetObjectPosition                            BC3F4  96 PC, low confidence
; Copies a position into a 3D object and marks it moved
;-----------------------------------------------------------------------------
OriSetObjectPosition:
        push esi
        push edi
        mov eax, dword [byte esp+0Ch]
        mov esi, dword [byte esp+010h]
        lea edi, [byte eax+01Ch]
        movsd
        movsd
        movsd
        or byte [byte eax+010h], 1
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h
        mov edx, dword [byte esp+04h]
        mov ebx, 28h
        mov eax, OriPositionBuf
        jmp near strncpy_
        db 090h
;-----------------------------------------------------------------------------
; OriFixupModel                                   BC424  96 PC, low confidence
; Turns a loaded model's offsets into pointers and allocates its inverse
; matrices ("INVMATRX")
;-----------------------------------------------------------------------------
OriFixupModel:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov edx, dword [byte esi+064h]
        test edx, edx
        je short .1
        lea eax, [nosplit edx*8+00h]
        mov ebx, dword [byte esp+014h]
        add eax, edx
        push ebx
        shl eax, 2
        push eax
        push str_INVMATRX
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte esi+06Ch], eax
        jmp short .2
.1:
        mov dword [byte esi+06Ch], edx
.2:
        mov dword [byte esi+0Ch], 0
        mov ecx, dword [byte esi+018h]
        mov edi, dword [byte esi+020h]
        mov ebp, dword [byte esi+028h]
        mov eax, dword [byte esi+03Ch]
        mov edx, dword [byte esi+044h]
        mov ebx, dword [byte esi+04Ch]
        add ecx, esi
        add edi, esi
        mov dword [byte esi+018h], ecx
        add ebp, esi
        mov dword [byte esi+020h], edi
        add eax, esi
        mov dword [byte esi+028h], ebp
        add edx, esi
        mov dword [byte esi+03Ch], eax
        add ebx, esi
        mov dword [byte esi+044h], edx
        mov dword [byte esi+04Ch], ebx
        mov ecx, dword [byte esi+050h]
        mov edi, dword [byte esi+058h]
        mov ebp, dword [byte esi+060h]
        mov eax, dword [byte esi+068h]
        mov edx, dword [byte esi+024h]
        add ecx, esi
        add edi, esi
        mov dword [byte esi+050h], ecx
        add ebp, esi
        mov dword [byte esi+058h], edi
        add eax, esi
        mov dword [byte esi+060h], ebp
        xor ebx, ebx
        mov dword [byte esi+068h], eax
        test edx, edx
        jle short .4
        xor ecx, ecx
.3:
        mov eax, dword [byte esi+028h]
        mov edi, dword [byte ecx+eax+04h]
        mov edx, dword [byte esi+050h]
        shl edi, 2
        add edx, edi
        mov edi, dword [byte ecx+eax+08h]
        mov dword [byte ecx+eax+04h], edx
        shl edi, 2
        mov edx, dword [byte esi+050h]
        add edx, edi
        mov dword [byte ecx+eax+08h], edx
        inc ebx
        mov edi, dword [byte esi+024h]
        add ecx, byte 0Ch
        cmp ebx, edi
        jl short .3
.4:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; OriReadModel                                    BC4F0  96 PC, low confidence
; Reads a 3D model (.ori) from the art archive
;-----------------------------------------------------------------------------
OriReadModel:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 50h
        mov ecx, eax
        mov ebp, edx
        mov esi, OriPositionBuf
        mov edi, esp
        push edi
.1:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .2
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .1
.2:
        pop edi
        mov edi, esp
        mov esi, ecx
        xor edx, edx
        push edi
        LD sub, ecx, ecx
        dec ecx
        mov al, 0
        repne scasb
        dec edi
.3:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .4
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .3
.4:
        pop edi
        jmp short .7
.5:
        mov ecx, dword [byte esp+edx-03h]
        sar ecx, 18h
        cmp ecx, byte 2Eh
        jne short .6
        xor ah, ah
        mov byte [esp+edx], ah
        jmp short .8
.6:
        inc edx
.7:
        mov edi, esp
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        cmp edx, ecx
        jb short .5
.8:
        mov esi, str_Ori
        mov edi, esp
        push edi
        LD sub, ecx, ecx
        dec ecx
        mov al, 0
        repne scasb
        dec edi
.9:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .10
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .9
.10:
        pop edi
        push ebp
        lea eax, [byte esp+04h]
        push eax
        call OpenArtArchive
        add esp, byte 8
        mov edi, eax
        test eax, eax
        je short .11
        push ebp
        push eax
        call OriFixupModel
        add esp, byte 8
.11:
        mov eax, edi
        add esp, byte 50h
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; OriLoadModel                                    BC5C0  96 PC, low confidence
; Loads a 3D model and stops with an error when it cannot be read
;-----------------------------------------------------------------------------
OriLoadModel:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        call OriReadModel
        mov esi, eax
        test eax, eax
        jne short .1
        push ebx
        push str_OriloadCouldNotLoadORIGA
        call FatalError
        add esp, byte 8
.1:
        mov eax, esi
        pop esi
        pop ecx
        pop ebx
        ret
        push esi
        mov esi, dword [byte esp+08h]
        mov edx, dword [byte esi+06Ch]
        test edx, edx
        je short .2
        push edx
        call FreeMemBlock
        add esp, byte 4
.2:
        push esi
        call FreeMemBlock
        add esp, byte 4
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; MakeRotXMatrix                               BC610  96 PC, medium confidence
; Builds a rotation matrix around the X axis from an angle
;-----------------------------------------------------------------------------
MakeRotXMatrix:
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call FixedSinCos
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
; MakeRotYMatrix                               BC674  96 PC, medium confidence
; Builds a rotation matrix around the Y axis from an angle
;-----------------------------------------------------------------------------
MakeRotYMatrix:
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call FixedSinCos
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
;-----------------------------------------------------------------------------
; MakeRotZMatrix                               BC6D8  96 PC, medium confidence
; Builds a rotation matrix around the Z axis from an angle
;-----------------------------------------------------------------------------
MakeRotZMatrix:
        push esi
        sub esp, byte 8
        mov esi, dword [byte esp+010h]
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call FixedSinCos
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
