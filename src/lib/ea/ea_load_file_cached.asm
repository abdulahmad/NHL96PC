; EA library: LoadFileCached.
bits 32
%include "hockey.inc"
section s_C4DE0 progbits alloc exec nowrite align=1
extern AllocMemBlockLockedAt, ConvertShapeBank, ConvertShapeBankInPlace, FindCachedFile, LoadPackedCore, PushMemDescriptorLocked, SplitFileExt, str_FshVshQfsQvs
extern str_Qvs, str_Vsh, stricmp_
global LoadFileCached
;-----------------------------------------------------------------------------
; LoadFileCached                                  C4DE0  96 PC, low confidence
; Returns a file from the file cache, or loads it (shape banks unpacked)
;-----------------------------------------------------------------------------
LoadFileCached:
        push esi
        push edi
        push ebp
        sub esp, byte 64h
        mov ebp, dword [byte esp+078h]
        mov edi, dword [byte esp+07Ch]
        push str_FshVshQfsQvs
        lea eax, [byte esp+04h]
        push eax
        mov edx, dword [byte esp+07Ch]
        push edx
        call SplitFileExt
        add esp, byte 0Ch
        mov esi, eax
        mov eax, esp
        push eax
        call FindCachedFile
        add esp, byte 4
        test eax, eax
        jne near .3
        mov edx, str_Vsh
        mov eax, esi
        call stricmp_
        test eax, eax
        je short .1
        mov edx, str_Qvs
        mov eax, esi
        call stricmp_
        test eax, eax
        jne short .2
.1:
        mov eax, ebp
        push edi
        xor al, 20h
        push eax
        lea eax, [byte esp+08h]
        push eax
        call LoadPackedCore
        mov esi, eax
        add esp, byte 0Ch
        test eax, eax
        je short .3
        mov ebx, dword [eax]
        push ebx
        call ConvertShapeBankInPlace
        add esp, byte 4
        push edi
        push ebp
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        call AllocMemBlockLockedAt
        add esp, byte 10h
        mov ecx, dword [eax]
        push ecx
        mov ebp, dword [esi]
        push ebp
        mov edi, eax
        call ConvertShapeBank
        add esp, byte 8
        push esi
        call PushMemDescriptorLocked
        add esp, byte 4
        mov eax, edi
        jmp short .3
.2:
        push edi
        push ebp
        lea eax, [byte esp+08h]
        push eax
        call LoadPackedCore
        add esp, byte 0Ch
.3:
        add esp, byte 64h
        pop ebp
        pop edi
        pop esi
        ret
