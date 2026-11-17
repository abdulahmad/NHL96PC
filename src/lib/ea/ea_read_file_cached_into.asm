; EA library: ReadFileCachedInto, LoadFileInto, LoadFileToBlockShared, LoadFileToBlockPlain.
bits 32
%include "hockey.inc"
section s_B7410 progbits alloc exec nowrite align=1
extern _os_handle_0, _os_handle_1, bcopy, DosCloseFile, DosOpenFile, DosReadFile, FindCachedFileData, FreeMemBlock
extern MemPtrSize, ReadFileRange, unpack
global ReadFileCachedInto, LoadFileInto, LoadFileToBlockShared, LoadFileToBlockPlain
;-----------------------------------------------------------------------------
; ReadFileCachedInto                              B7410  96 PC, low confidence
; Copies a cached file into a buffer, or reads it from disk
;-----------------------------------------------------------------------------
ReadFileCachedInto:
        push esi
        push edi
        sub esp, byte 0Ch
        mov edi, dword [byte esp+01Ch]
        mov edx, dword [byte esp+018h]
        push edx
        call FindCachedFileData
        mov esi, eax
        add esp, byte 4
        test eax, eax
        je short .1
        push eax
        call MemPtrSize
        add esp, byte 4
        push eax
        push edi
        push esi
        call bcopy
        add esp, byte 0Ch
        push esi
        call FreeMemBlock
        jmp short .2
.1:
        mov ebx, dword [byte esp+020h]
        push ebx
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        mov ecx, dword [byte esp+028h]
        push ecx
        call DosOpenFile
        add esp, byte 14h
        mov esi, dword [byte esp+08h]
        test esi, esi
        je short .3
        push esi
        push edi
        mov eax, dword [byte esp+08h]
        push eax
        call DosReadFile
        add esp, byte 0Ch
        mov edx, dword [esp]
        push edx
        mov esi, edi
        call DosCloseFile
.2:
        add esp, byte 4
.3:
        mov eax, esi
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; LoadFileInto                                    B7498  96 PC, low confidence
; Loads a file into a buffer
;-----------------------------------------------------------------------------
LoadFileInto:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call ReadFileCachedInto
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; LoadFileToBlockShared                           B74B0  96 PC, low confidence
; Loads a file into a memory block in shared mode
;-----------------------------------------------------------------------------
LoadFileToBlockShared:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call ReadFileCachedInto
        add esp, byte 0Ch
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; LoadFileToBlockPlain                            B74D0  96 PC, low confidence
; Loads a file into a memory block
;-----------------------------------------------------------------------------
LoadFileToBlockPlain:
        push esi
        push edi
        push ebp
        sub esp, byte 0Ch
        push byte 0
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        lea eax, [byte esp+0Ch]
        push eax
        mov edx, dword [byte esp+02Ch]
        push edx
        call DosOpenFile
        add esp, byte 14h
        mov ebx, dword [byte esp+08h]
        test ebx, ebx
        jne short .1
        xor eax, eax
        jmp near .4
.1:
        push byte 0
        push ebx
        mov esi, dword [byte esp+0Ch]
        push esi
        mov edi, dword [byte esp+0Ch]
        push edi
        call ReadFileRange
        add esp, byte 10h
        mov edi, eax
        test eax, eax
        jne short .2
        mov edx, dword [esp]
        push edx
        call DosCloseFile
        add esp, byte 4
        xor eax, eax
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        ret
.2:
        mov ebp, dword [byte esp+08h]
        mov esi, eax
        cmp eax, ebp
        jge short .3
        mov esi, ebp
.3:
        mov eax, dword [byte esp+020h]
        push eax
        call _os_handle_0
        add esp, byte 4
        add eax, esi
        sub eax, dword [byte esp+08h]
        add eax, 103h
        and al, 0FCh
        push eax
        call _os_handle_1
        add esp, byte 4
        mov ebx, dword [byte esp+08h]
        push ebx
        push eax
        mov ecx, dword [byte esp+08h]
        push ecx
        mov esi, eax
        call DosReadFile
        add esp, byte 0Ch
        push byte 0
        mov ebp, dword [byte esp+024h]
        push ebp
        push esi
        call unpack
        add esp, byte 0Ch
        mov eax, dword [esp]
        push eax
        call DosCloseFile
        add esp, byte 4
        mov eax, edi
.4:
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h
