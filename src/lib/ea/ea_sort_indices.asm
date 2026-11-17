; EA library: SortIndices.
bits 32
%include "hockey.inc"
section s_BEA22 progbits alloc exec nowrite align=1
extern SortBuffer
global SortIndices
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; SortIndices                                  BEA30  95 PC, medium confidence
; Sort library: sort n indices by their keys (n, keys, indices)
;-----------------------------------------------------------------------------
SortIndices:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov eax, dword [byte esp+018h]
        sar eax, 1
        mov dword [byte esp+04h], eax
        test eax, eax
        jle near .6
.1:
        mov eax, dword [byte esp+04h]
        mov esi, dword [byte esp+018h]
        mov dword [esp], eax
        cmp eax, esi
        jge short .5
.2:
        mov eax, dword [esp]
        sub eax, dword [byte esp+04h]
        test eax, eax
        jl short .4
.3:
        mov edi, dword [byte esp+04h]
        mov ebx, dword [byte esp+01Ch]
        mov edx, dword [byte esp+01Ch]
        add edi, eax
        lea esi, [nosplit eax*4+00h]
        shl edi, 2
        add edx, esi
        add ebx, edi
        mov ecx, dword [edx]
        cmp ecx, dword [ebx]
        jge short .4
        mov ebp, dword [ebx]
        mov ecx, dword [edx]
        mov dword [edx], ebp
        mov dword [ebx], ecx
        mov ebx, dword [byte esp+020h]
        mov edx, ebx
        add esi, ebx
        mov ebx, dword [edx+edi]
        mov ecx, dword [esi]
        mov dword [esi], ebx
        mov dword [edx+edi], ecx
        sub eax, dword [byte esp+04h]
        test eax, eax
        jge short .3
.4:
        mov edi, dword [esp]
        inc edi
        mov ebp, dword [byte esp+018h]
        mov dword [esp], edi
        cmp edi, ebp
        jl short .2
.5:
        mov ebx, dword [byte esp+04h]
        sar ebx, 1
        mov dword [byte esp+04h], ebx
        test ebx, ebx
        jg short .1
.6:
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h
        mov edx, dword [byte esp+04h]
        mov eax, dword [SortBuffer]
        test edx, edx
        je short .7
        mov dword [SortBuffer], edx
.7:
        ret
