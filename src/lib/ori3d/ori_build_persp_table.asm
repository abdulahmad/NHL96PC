; 3D library: BuildPerspTable, ProjectPointWide.
bits 32
%include "hockey.inc"
section s_BEAE4 progbits alloc exec nowrite align=1
extern FovScaleX, Mul32To64, NearClipZ, ProjectFlags, Sar64, SortBuffer, ViewCentreX, ViewCentreY
global BuildPerspTable, ProjectPointWide
;-----------------------------------------------------------------------------
; BuildPerspTable                                 BEAE4  96 PC, low confidence
; Fills the perspective table from the projection distance
;-----------------------------------------------------------------------------
BuildPerspTable:
        push esi
        push edi
        mov esi, dword [FovScaleX]
        mov edi, dword [SortBuffer]
        mov ecx, 0Ah
        xor ebx, ebx
.1:
        mov edx, esi
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        add ebx, byte 4
        mov edx, edi
        mov dword [byte edx+ebx-04h], eax
        cmp ebx, byte 28h
        jne short .1
        mov ebx, ecx
        mov ecx, 28h
.2:
        mov edx, esi
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        add ecx, byte 4
        mov edx, edi
        inc ebx
        mov dword [byte ecx+edx-04h], eax
        cmp ebx, 400h
        jl short .2
        mov dword [SortBuffer], edi
        mov dword [FovScaleX], esi
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; ProjectPointWide                                BEB48  96 PC, low confidence
; Projects one 3D point with perspective using 64-bit maths
;-----------------------------------------------------------------------------
ProjectPointWide:
        push esi
        push edi
        push ebp
        sub esp, byte 20h
        mov ebp, dword [byte esp+030h]
        mov edi, dword [byte esp+034h]
        mov edx, dword [NearClipZ]
        mov eax, dword [byte ebp+08h]
        cmp eax, edx
        jg short .1
        mov dword [byte edi+04h], 80000000h
        mov eax, dword [byte edi+04h]
        mov dword [edi], eax
        or byte [ProjectFlags], 1
        jmp near .6
.1:
        mov ebx, 10h
        cmp eax, 10000h
        jl short .2
        mov ebx, 18h
        sar eax, 8
.2:
        cmp eax, 10000h
        jl short .3
        sar eax, 8
        add ebx, byte 8
.3:
        cmp eax, 1000h
        jl short .4
        sar eax, 4
        add ebx, byte 4
.4:
        cmp eax, 400h
        jl short .5
        sar eax, 2
        add ebx, byte 2
.5:
        mov ecx, dword [SortBuffer]
        lea esi, [byte esp+018h]
        mov ecx, dword [ecx+eax*4]
        push ebx
        mov edx, ecx
        mov eax, dword [byte ebp+00h]
        call Mul32To64
        mov esi, dword [byte esp+020h]
        push esi
        mov eax, dword [byte esp+020h]
        push eax
        lea esi, [byte esp+014h]
        call Sar64
        mov edx, dword [byte esp+08h]
        mov eax, dword [ViewCentreX]
        lea esi, [byte esp+010h]
        add eax, edx
        push ebx
        mov dword [edi], eax
        mov edx, ecx
        mov eax, dword [byte ebp+04h]
        call Mul32To64
        mov ebx, dword [byte esp+018h]
        push ebx
        mov ecx, dword [byte esp+018h]
        push ecx
        lea esi, [byte esp+0Ch]
        call Sar64
        mov esi, dword [esp]
        mov eax, dword [ViewCentreY]
        sub eax, esi
        mov dword [byte edi+04h], eax
.6:
        add esp, byte 20h
        pop ebp
        pop edi
        pop esi
        ret
