; EA library: ReadFileRange, LoadPackedAlloc, LoadPackedAllocQuiet, LoadPackedHandle and 3 more.
bits 32
%include "hockey.inc"
section s_B75A0 progbits alloc exec nowrite align=1
extern _os_handle_0, _os_handle_1, AllocMemBlockLockedAt, bcopy, DosCloseFile, DosOpenFile, DosReadFile, DosSeekFile
extern FindCachedFile, ResizeMemBlock, unpack, UnpackedSize
global ReadFileRange, LoadPackedAlloc, LoadPackedAllocQuiet, LoadPackedHandle, LoadPackedHandleQuiet, LoadPackedCore, FileSizeByName
;-----------------------------------------------------------------------------
; ReadFileRange                                   B75A0  96 PC, low confidence
; Reads part of an open file into memory, unpacking it when packed
;-----------------------------------------------------------------------------
ReadFileRange:
        push esi
        push edi
        push ebp
        sub esp, 100h
        mov ebp, dword [dword esp+0110h]
        mov edi, dword [dword esp+0118h]
        mov edx, dword [dword esp+0114h]
        push edx
        push ebp
        xor esi, esi
        call DosSeekFile
        lea eax, [byte edi-08h]
        add esp, byte 8
        cmp eax, 100h
        jl short .1
        mov eax, 100h
.1:
        cmp eax, byte 8
        jle short .2
        lea eax, [byte edi-08h]
        cmp eax, 100h
        jl short .3
        mov eax, 100h
        jmp short .3
.2:
        mov eax, 8
.3:
        push eax
        lea eax, [byte esp+04h]
        push eax
        push ebp
        call DosReadFile
        add esp, byte 0Ch
        test eax, eax
        je short .4
        mov eax, esp
        push eax
        call UnpackedSize
        add esp, byte 4
        mov esi, eax
        test eax, eax
        jne short .4
        mov esi, edi
.4:
        mov ebx, dword [dword esp+0114h]
        push ebx
        push ebp
        call DosSeekFile
        add esp, byte 8
        mov eax, esi
        add esp, 100h
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; LoadPackedAlloc                                 B7638  96 PC, low confidence
; Loads a file into a new memory block and returns its data, stopping on an
; error
;-----------------------------------------------------------------------------
LoadPackedAlloc:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadPackedCore
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov eax, dword [eax]
.1:
        ret
        db 090h
;-----------------------------------------------------------------------------
; LoadPackedAllocQuiet                            B7654  96 PC, low confidence
; Loads a file into a new memory block and returns its data, or 0 on an error
;-----------------------------------------------------------------------------
LoadPackedAllocQuiet:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadPackedCore
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov eax, dword [eax]
.1:
        ret
        db 090h
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        mov ecx, dword [byte esp+0Ch]
        push ecx
        call LoadPackedCore
        add esp, byte 0Ch
        test eax, eax
        je short .2
        mov eax, dword [eax]
.2:
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; LoadPackedHandle                                B7690  96 PC, low confidence
; Loads a file into a new memory block and returns the block, stopping on an
; error
;-----------------------------------------------------------------------------
LoadPackedHandle:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadPackedCore
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; LoadPackedHandleQuiet                           B76A8  96 PC, low confidence
; Loads a file into a new memory block and returns the block, or 0 on an
; error
;-----------------------------------------------------------------------------
LoadPackedHandleQuiet:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadPackedCore
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; LoadPackedCore                                  B76C0  96 PC, low confidence
; Loads a file, from the file cache when it is there, unpacking it when
; packed
;-----------------------------------------------------------------------------
LoadPackedCore:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov esi, dword [byte esp+024h]
        mov ebp, dword [byte esp+02Ch]
        push esi
        call FindCachedFile
        add esp, byte 4
        test eax, eax
        jne near .7
        push ebp
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        push esi
        call DosOpenFile
        add esp, byte 14h
        mov edx, dword [byte esp+08h]
        test edx, edx
        jne short .1
        xor eax, eax
        jmp near .7
.1:
        push ebp
        push edx
        mov ecx, dword [byte esp+0Ch]
        push ecx
        mov edi, dword [byte esp+0Ch]
        push edi
        call ReadFileRange
        add esp, byte 10h
        mov dword [byte esp+0Ch], eax
        test eax, eax
        jne short .2
        mov edx, dword [esp]
        push edx
        call DosCloseFile
        add esp, byte 4
        xor eax, eax
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
.2:
        mov edx, dword [byte esp+08h]
        cmp eax, edx
        jg short .3
        mov eax, edx
.3:
        push ebp
        mov ebx, dword [byte esp+02Ch]
        add eax, 3EBh
        push ebx
        and al, 0FCh
        push eax
        push esi
        mov edi, eax
        call AllocMemBlockLockedAt
        add esp, byte 10h
        mov esi, eax
        mov dword [byte esp+010h], eax
        test eax, eax
        jne short .4
        mov eax, dword [esp]
        push eax
        call DosCloseFile
        add esp, byte 4
        xor eax, eax
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
.4:
        mov ecx, dword [eax]
        push ecx
        call _os_handle_0
        add esp, byte 4
        add eax, edi
        sub eax, dword [byte esp+08h]
        and al, 0FCh
        push eax
        call _os_handle_1
        add esp, byte 4
        mov edi, eax
        mov eax, dword [byte esp+08h]
        add eax, byte 3
        and al, 0FCh
        push eax
        push edi
        mov eax, dword [byte esp+08h]
        push eax
        call DosReadFile
        add esp, byte 0Ch
        push edi
        call UnpackedSize
        add esp, byte 4
        test eax, eax
        je short .5
        push ebp
        mov ecx, dword [esi]
        push ecx
        push edi
        call unpack
        jmp short .6
.5:
        mov edx, dword [byte esp+08h]
        push edx
        mov ebx, dword [esi]
        push ebx
        push edi
        call bcopy
.6:
        add esp, byte 0Ch
        push ebp
        mov esi, dword [byte esp+010h]
        push esi
        mov edi, dword [byte esp+018h]
        push edi
        call ResizeMemBlock
        add esp, byte 0Ch
        mov ebp, dword [esp]
        push ebp
        call DosCloseFile
        add esp, byte 4
        mov eax, edi
.7:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FileSizeByName                                  B7810  96 PC, low confidence
; Opens a file to get its size, then closes it
;-----------------------------------------------------------------------------
FileSizeByName:
        sub esp, byte 0Ch
        push byte 1
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+014h]
        push eax
        mov edx, dword [byte esp+020h]
        push edx
        call DosOpenFile
        add esp, byte 14h
        mov ebx, dword [byte esp+08h]
        push ebx
        call DosCloseFile
        add esp, byte 4
        mov eax, dword [esp]
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
        sub esp, byte 0Ch
        push byte 0
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+014h]
        push eax
        mov edx, dword [byte esp+020h]
        push edx
        call DosOpenFile
        add esp, byte 14h
        mov ebx, dword [byte esp+08h]
        push ebx
        call DosCloseFile
        add esp, byte 4
        mov eax, dword [esp]
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
        sub esp, byte 0Ch
        mov edx, dword [byte esp+014h]
        push edx
        lea eax, [byte esp+04h]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+014h]
        push eax
        mov ebx, dword [byte esp+020h]
        push ebx
        call DosOpenFile
        add esp, byte 14h
        mov ecx, dword [byte esp+08h]
        push ecx
        call DosCloseFile
        add esp, byte 4
        mov eax, dword [esp]
        add esp, byte 0Ch
        ret
