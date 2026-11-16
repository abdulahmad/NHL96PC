; DOS file helpers: open, create, close, read / write at an offset, copy, delete (96 PC).
bits 32
%include "hockey.inc"
section s_1DC65 progbits alloc exec nowrite align=1
extern _dos_close_, _dos_creat_, _dos_getdiskfree_, _dos_open_, _dos_read_, _dos_write_, FatalError, lseek_
extern rmdir_, str_backslash4, str_COPYBUFFER, str_dot2, str_ErrDiskFree2, strcat_, strcpy_, FillMusicStream
extern SoundSecondsToBytes, sub_AB758, sub_ABF4C, sub_B71D4, sub_B71F1, sub_B7256, unk_1106EC
global FileMissing, DeleteFiles, FileOpenRead, FileOpenRead_1A, FileOpenWrite, FileOpenReadWrite, FileCreate, FileClose
global FileReadAt, FileReadAt_5B, FileReadAt_5D, FileWriteAt, FileWriteAt_6B, FileWriteAt_77, FileCopy, FileCopy_ret
global WriteDbRecord6, ReadSeasonHeader
;-----------------------------------------------------------------------------
; FileMissing                                                     1DC65  96 PC
; (path): 1 when the file cannot be opened
;-----------------------------------------------------------------------------
FileMissing:
        push ebx
        push ecx
        push edx
        push esi
        enter 4, 0
        mov esi, eax
        mov dword [byte ebp-04h], 0FFFFFFFFh
        mov eax, 2
        lea ebx, [byte ebp-04h]
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 2
        mov edx, 40h
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
        xor ecx, ecx
        call _dos_open_
        test eax, eax
        jne short .1
        mov ecx, 1
.1:
        lea esi, [byte ebp-04h]
        cmp dword [byte ebp-04h], byte 0
        jl short .2
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [byte ebp-04h]
        call _dos_close_
.2:
        mov eax, ecx
        mov dword [esi], 0FFFFFFFFh
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DeleteFiles                                                     1DCDC  96 PC
; (dir, name, ext): deletes every dir\name.ext (find first / next, unlink)
;-----------------------------------------------------------------------------
DeleteFiles:
        push ecx
        push esi
        enter 4Ch, 0
        mov ecx, eax
        mov esi, edx
        mov edx, eax
        lea eax, [byte ebp-020h]
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        lea eax, [byte ebp-020h]
        mov edx, esi
        call strcat_
        mov edx, str_dot2
        lea eax, [byte ebp-020h]
        call strcat_
        lea eax, [byte ebp-020h]
        mov edx, ebx
        call strcat_
        lea ebx, [byte ebp-04Ch]
        lea eax, [byte ebp-020h]
        xor edx, edx
        call sub_B71D4
        mov ebx, eax
        test eax, eax
        jne near .3
        lea eax, [byte ebp-020h]
        mov edx, ecx
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        lea edx, [byte ebp-02Eh]
        lea eax, [byte ebp-020h]
        call strcat_
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-020h]
        call sub_B7256
.1:
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-04Ch]
        call sub_B71F1
        mov ebx, eax
        test eax, eax
        jne short .2
        lea eax, [byte ebp-020h]
        mov edx, ecx
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        lea edx, [byte ebp-02Eh]
        lea eax, [byte ebp-020h]
        call strcat_
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-020h]
        call sub_B7256
.2:
        test ebx, ebx
        je short .1
.3:
        mov eax, ebx
        leave
        pop esi
        pop ecx
        ret
        push ebx
        push ecx
        push edx
        enter 4Ch, 0
        mov ecx, eax
        mov edx, eax
        lea eax, [byte ebp-020h]
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        mov edx, unk_1106EC
        lea eax, [byte ebp-020h]
        call strcat_
        mov edx, str_dot2
        lea eax, [byte ebp-020h]
        call strcat_
        mov edx, unk_1106EC
        lea eax, [byte ebp-020h]
        call strcat_
        mov eax, 2
        lea ebx, [byte ebp-04Ch]
        call SoundSecondsToBytes
        call FillMusicStream
        xor edx, edx
        lea eax, [byte ebp-020h]
        call sub_B71D4
        test eax, eax
        jne near .6
        lea eax, [byte ebp-020h]
        mov edx, ecx
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        lea edx, [byte ebp-02Eh]
        lea eax, [byte ebp-020h]
        call strcat_
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-020h]
        call sub_B7256
.4:
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-04Ch]
        call sub_B71F1
        mov ebx, eax
        test eax, eax
        jne short .5
        lea eax, [byte ebp-020h]
        mov edx, ecx
        call strcpy_
        mov edx, str_backslash4
        lea eax, [byte ebp-020h]
        call strcat_
        lea edx, [byte ebp-02Eh]
        lea eax, [byte ebp-020h]
        call strcat_
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-020h]
        call sub_B7256
.5:
        test ebx, ebx
        je short .4
.6:
        mov eax, ecx
        call rmdir_
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FileOpenRead                                                    1DED8  96 PC
; (path, &handle): _dos_open_ read only
;-----------------------------------------------------------------------------
FileOpenRead:
        push ebx
        push ecx
        mov ecx, eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov ebx, edx
        mov edx, 40h
FileOpenRead_1A:
        mov eax, ecx
        call _dos_open_
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FileOpenWrite                                                   1DEFC  96 PC
; (path, &handle): _dos_open_ write only
;-----------------------------------------------------------------------------
FileOpenWrite:
        push ebx
        push ecx
        mov ecx, eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov ebx, edx
        mov edx, 41h
        jmp short FileOpenRead_1A
;-----------------------------------------------------------------------------
; FileOpenReadWrite                                               1DF18  96 PC
; (path, &handle): _dos_open_ read / write
;-----------------------------------------------------------------------------
FileOpenReadWrite:
        push ebx
        push ecx
        mov ecx, eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov ebx, edx
        mov edx, 42h
        jmp short FileOpenRead_1A
;-----------------------------------------------------------------------------
; FileCreate                                                      1DF34  96 PC
; (path, &handle): _dos_creat_
;-----------------------------------------------------------------------------
FileCreate:
        push ebx
        push ecx
        mov ecx, eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov ebx, edx
        mov eax, ecx
        xor edx, edx
        call _dos_creat_
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FileClose                                                       1DF55  96 PC
; (&handle): closes it when open, sets -1
;-----------------------------------------------------------------------------
FileClose:
        push edx
        mov edx, eax
        xor eax, eax
        cmp dword [edx], byte 0
        jl short .1
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [edx]
        call _dos_close_
.1:
        mov dword [edx], 0FFFFFFFFh
        pop edx
        ret
;-----------------------------------------------------------------------------
; FileReadAt                                   1DF7D  95 PC, medium confidence
; (handle, buf, offset (<0 = current), len): lseek then _dos_read; 0 ok, 1
; short read, -1 seek error
;-----------------------------------------------------------------------------
FileReadAt:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov edi, ecx
        mov edx, ebx
        xor ecx, ecx
        test ebx, ebx
        jl short .1
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        xor ebx, ebx
        mov eax, esi
        call lseek_
        test eax, eax
        jge short .1
        mov ecx, 0FFFFFFFFh
.1:
        test ecx, ecx
        jne short FileReadAt_5D
        mov eax, 2
        mov ebx, dword [byte ebp-04h]
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-08h]
        mov ecx, ds
        push eax
        mov edx, edi
        mov eax, esi
        call _dos_read_
FileReadAt_5B:
        mov ecx, eax
FileReadAt_5D:
        cmp edi, dword [byte ebp-08h]
        je short .2
        mov ecx, 1
.2:
        mov eax, ecx
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; FileWriteAt                                                     1DFEA  96 PC
; (handle, data, size, offset): seeks (offset >= 0) and writes; 0 ok, -1 seek
; error, 1 short write (the write side of FileReadAt)
;-----------------------------------------------------------------------------
FileWriteAt:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov edi, ecx
        mov edx, ebx
        xor ecx, ecx
        test ebx, ebx
        jl short .1
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        xor ebx, ebx
        mov eax, esi
        call lseek_
        test eax, eax
        jge short .1
        mov ecx, 0FFFFFFFFh
.1:
        test ecx, ecx
        jne short FileReadAt_5D
        mov eax, 2
        mov ebx, dword [byte ebp-04h]
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-08h]
        mov ecx, ds
        push eax
        mov edx, edi
        mov eax, esi
        call _dos_write_
        jmp short FileReadAt_5B
        push ecx
        push esi
        mov esi, eax
        mov eax, 2
        mov ecx, 3Ch
FileWriteAt_6B:
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
FileWriteAt_77:
        call FileReadAt
        pop esi
        pop ecx
        ret
        push ecx
        push esi
        mov esi, eax
        mov eax, 2
        mov ecx, 3Ch
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
        call FileWriteAt
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FileCopy                                                        1E08B  96 PC
; (from, to): copies a file through a 200 KB COPYBUFFER
;-----------------------------------------------------------------------------
FileCopy:
        push ebx
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov edi, edx
        push byte 0
        push dword 32000h
        push str_COPYBUFFER
        mov dword [byte ebp-08h], 0FFFFFFFFh
        mov dword [byte ebp-0Ch], 0FFFFFFFFh
        call sub_AB758
        add esp, byte 0Ch
        mov dword [byte ebp-04h], eax
        mov eax, 2
        lea ebx, [byte ebp-08h]
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 2
        mov edx, 40h
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
        call _dos_open_
        mov esi, eax
        test eax, eax
        jne short .1
        mov eax, 2
        lea ebx, [byte ebp-0Ch]
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 2
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, edi
        call _dos_creat_
        mov esi, eax
.1:
        test esi, esi
        jne near .6
        mov edi, ds
.2:
        mov eax, 2
        mov edx, 32000h
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-010h]
        mov ebx, dword [byte ebp-04h]
        push eax
        mov ecx, ds
        mov eax, dword [byte ebp-08h]
        call _dos_read_
        mov esi, eax
        test eax, eax
        jne short .3
        cmp dword [byte ebp-010h], byte 0
        jbe short .3
        mov eax, 2
        mov ebx, dword [byte ebp-04h]
        call SoundSecondsToBytes
        call FillMusicStream
        lea eax, [byte ebp-014h]
        mov ecx, ds
        push eax
        mov edx, dword [byte ebp-010h]
        mov eax, dword [byte ebp-0Ch]
        call _dos_write_
        mov esi, eax
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-010h]
        je short .3
        mov esi, 1
.3:
        cmp dword [byte ebp-010h], byte 0
        jbe short .4
        test esi, esi
        je short .2
.4:
        mov eax, 2
        lea edx, [byte ebp-0Ch]
        call SoundSecondsToBytes
        call FillMusicStream
        cmp dword [byte ebp-0Ch], byte 0
        jl short .5
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [byte ebp-0Ch]
        call _dos_close_
.5:
        mov dword [edx], 0FFFFFFFFh
.6:
        mov eax, 2
        lea edx, [byte ebp-08h]
        call SoundSecondsToBytes
        call FillMusicStream
        cmp dword [byte ebp-08h], byte 0
        jl short .7
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [byte ebp-08h]
        call _dos_close_
.7:
        push dword [byte ebp-04h]
        mov dword [edx], 0FFFFFFFFh
        call sub_ABF4C
        add esp, byte 4
        mov eax, esi
FileCopy_ret:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push ecx
        push esi
        mov esi, eax
        mov eax, 2
        mov ecx, 2Fh
        jmp near FileWriteAt_6B
;-----------------------------------------------------------------------------
; WriteDbRecord6                                  1E222  96 PC, low confidence
; (handle, data, index): writes a 6-byte season db record through FileWriteAt
;-----------------------------------------------------------------------------
WriteDbRecord6:
        push ecx
        push esi
        mov esi, eax
        imul ecx, ebx, byte 6
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
        mov ebx, 2
        jmp near FileWriteAt_77
        push ecx
        push esi
        mov esi, eax
        imul ebx, byte 6
        mov eax, 2
        mov ecx, 6
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, esi
        inc ebx
        inc ebx
        jmp near FileWriteAt_77
;-----------------------------------------------------------------------------
; ReadSeasonHeader                             1E268  96 PC, medium confidence
; (handle, buf): reads the 50BEh-byte header at the start of a season file
;-----------------------------------------------------------------------------
ReadSeasonHeader:
        push ebx
        push ecx
        push esi
        mov esi, eax
        mov eax, 2
        mov ecx, 50BEh
        call SoundSecondsToBytes
        call FillMusicStream
        xor ebx, ebx
        mov eax, esi
        call FileReadAt
        pop esi
        pop ecx
        pop ebx
        ret
        push ecx
        push esi
        mov esi, eax
        imul ebx, dword 31Bh
        mov eax, 2
        mov ecx, 31Bh
        jmp near FileWriteAt_6B
        push ecx
        push esi
        mov esi, eax
        imul ebx, byte 0Bh
        mov eax, 2
        mov ecx, 0Bh
        jmp near FileWriteAt_6B
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        mov ebx, eax
        mov esi, edx
        mov eax, 2
        lea edx, [byte ebp-08h]
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, ebx
        xor edi, edi
        call _dos_getdiskfree_
        test eax, eax
        je short .1
        push str_ErrDiskFree2
        call FatalError
        add esp, byte 4
.1:
        movzx edx, word [byte ebp-02h]
        movzx eax, word [byte ebp-04h]
        imul eax, edx
        cdq
        shl edx, 0Ah
        LD sbb, eax, edx
        sar eax, 0Ah
        mov ebx, eax
        jmp short .3
.2:
        mov eax, dword [esi]
        add eax, ebx
        dec eax
        cdq
        idiv ebx
        add esi, byte 4
        add edi, eax
.3:
        cmp dword [esi], byte 0
        jne short .2
        movzx eax, word [byte ebp-06h]
        cmp edi, eax
        jg short .4
        xor eax, eax
        jmp near FileCopy_ret
.4:
        mov eax, edi
        imul eax, ebx
        jmp near FileCopy_ret
        xor eax, eax
        ret
        ret
