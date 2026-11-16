; Game data files: their paths by id and directory, loading them (96 PC).
bits 32
%include "hockey.inc"
section s_1E3C8 progbits alloc exec nowrite align=1
extern DirPathTable, optflags, sprintf_, str_02d, str_07d, str_backslash2, str_D15, str_DB2
extern str_dot3, strcat_, stricmp_, SyncMusicStream, AllocMemBlock, FreeMemBlock, sub_AC838, sub_AFD00
extern LoadResourceBlockShared, LoadResourceData, LoadResourceDataShared, sub_B049E, OpenArtArchiveErr, OpenArtArchive, LoadDataFileErr, LoadFileAllocQuiet
extern OpenResourceArchive, sub_B73C4, LoadFileInto, LoadFileToBlockShared, LoadFileToBlockPlain, sub_B7638, sub_B7654, sub_B7690
extern sub_B76A8, DataDirPath, unk_1151A7, unk_115333, DataFilePath, unpack, word_11512D
global jpt_1E3C8, jpt_1E3D8, MakeDataPath, MakeDataPath_42, MakeDataPath_4A, MakeDataPath_50, MakeDataPath_63, MakeDataPath_E0
global MakeDataPath_E8, MakeDataPath_EE, MakeDataPath_101, jpt_1E54A, MakeDirPath, jpt_1E633, SelectDataLibrary, SelectDataLibrary_32
global SelectDataLibrary_3A, SelectDataLibrary_40, SelectDataLibrary_54, LoadDataFile, LoadDataFile_1B, LoadDataFileFlag0, LoadDataFileHandle, LoadPackedFile
global LoadDataFileLib, MakeDatabasePath
jpt_1E3C8:
        dd MakeDataPath_63
        dd MakeDataPath_42
        dd MakeDataPath_4A
        dd MakeDataPath_50
jpt_1E3D8:
        dd MakeDataPath_101
        dd MakeDataPath_E0
        dd MakeDataPath_E8
        dd MakeDataPath_EE
;-----------------------------------------------------------------------------
; MakeDataPath                                                    1E3E8  96 PC
; (out, file id): the path of a game data file: the language prefix (optflags
; & 3) where the file has one, its directory (table DataDirPath) and name
; (table unk_115333, 16h-byte entries)
;-----------------------------------------------------------------------------
MakeDataPath:
        push ebx
        push ecx
        push esi
        push edi
        mov esi, eax
        mov ebx, edx
        imul edi, edx, byte 16h
        mov byte [eax], 0
        mov edx, dword [optflags]
        and edx, byte 3
        mov eax, edx
        add edi, unk_115333
        shl eax, 2
        cmp dword [byte edi+0Eh], byte 0
        jge near MakeDataPath_63.6
        imul ebx, dword [byte edi+0Eh], byte 0FFFFFFEAh
        add ebx, unk_1151A7
        cmp edx, byte 3
        ja short MakeDataPath_63
        jmp dword [dword cs:eax+jpt_1E3C8]
MakeDataPath_42:
        test byte [byte ebx+012h], 1
.1:
        jne short MakeDataPath_63
        jmp short MakeDataPath_50.2
MakeDataPath_4A:
        test byte [byte ebx+012h], 2
        jmp short MakeDataPath_42.1
MakeDataPath_50:
        test byte [byte ebx+012h], 4
        jne short MakeDataPath_63
.2:
        mov edx, dword [DirPathTable]
        mov eax, esi
        call strcat_
MakeDataPath_63:
        mov eax, dword [byte ebx+0Eh]
        test eax, eax
        je short .4
        cmp eax, byte 8
        jge short .4
        test byte [optflags], 0Ch
        je short .3
        cmp byte [ebx], 0
        je short .3
        imul eax, byte 0Fh
        movsx eax, word [dword eax+word_11512D]
.3:
        imul eax, byte 0Fh
        mov edx, DataDirPath
        add edx, eax
        mov eax, esi
        call strcat_
        mov edx, str_backslash2
        mov eax, esi
        call strcat_
.4:
        lea edx, [byte ebx+01h]
        mov eax, esi
        call strcat_
        call sub_B73C4
        mov edx, esi
        call stricmp_
        test eax, eax
        je short .5
        push esi
        call OpenResourceArchive
        add esp, byte 4
.5:
        lea edx, [byte edi+01h]
        mov eax, esi
        mov byte [esi], 0
        jmp near MakeDataPath_101.12
.6:
        cmp edx, byte 3
        ja short MakeDataPath_101
        jmp dword [dword cs:eax+jpt_1E3D8]
MakeDataPath_E0:
        test byte [byte edi+012h], 1
.7:
        jne short MakeDataPath_101
        jmp short MakeDataPath_EE.8
MakeDataPath_E8:
        test byte [byte edi+012h], 2
        jmp short MakeDataPath_E0.7
MakeDataPath_EE:
        test byte [byte edi+012h], 4
        jne short MakeDataPath_101
.8:
        mov edx, dword [DirPathTable]
        mov eax, esi
        call strcat_
MakeDataPath_101:
        mov eax, dword [byte edi+0Eh]
        test eax, eax
        je short .11
        cmp eax, byte 8
        jge short .11
        test byte [optflags], 0Ch
        je short .9
        cmp byte [edi], 0
        je short .9
        imul eax, byte 0Fh
        movsx edx, word [dword eax+word_11512D]
        imul edx, byte 0Fh
        mov eax, esi
        add edx, DataDirPath
        jmp short .10
.9:
        imul eax, byte 0Fh
        mov edx, DataDirPath
        add edx, eax
        mov eax, esi
.10:
        call strcat_
        mov edx, str_backslash2
        mov eax, esi
        call strcat_
.11:
        test ebx, ebx
        je short .13
        lea edx, [byte edi+01h]
        mov eax, esi
.12:
        call strcat_
.13:
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
jpt_1E54A:
        dd .6
        dd .1
        dd .3
        dd .4
        push ebx
        push ecx
        mov ebx, eax
        imul edx, byte 16h
        mov byte [eax], 0
        mov eax, dword [optflags]
        mov ecx, unk_1151A7
        and eax, byte 3
        add ecx, edx
        cmp eax, byte 3
        ja short .6
        jmp dword [nosplit cs:eax*4+jpt_1E54A]
.1:
        test byte [byte ecx+012h], 1
.2:
        jne short .6
        jmp short .5
.3:
        test byte [byte ecx+012h], 2
        jmp short .2
.4:
        test byte [byte ecx+012h], 4
        jne short .6
.5:
        mov edx, dword [DirPathTable]
        mov eax, ebx
        call strcat_
.6:
        mov eax, dword [byte ecx+0Eh]
        test eax, eax
        je short .9
        cmp eax, byte 8
        jge short .9
        test byte [optflags], 0Ch
        je short .7
        cmp byte [ecx], 0
        je short .7
        imul eax, byte 0Fh
        movsx edx, word [dword eax+word_11512D]
        imul edx, byte 0Fh
        mov eax, ebx
        add edx, DataDirPath
        jmp short .8
.7:
        imul eax, byte 0Fh
        mov edx, DataDirPath
        add edx, eax
        mov eax, ebx
.8:
        call strcat_
        mov edx, str_backslash2
        mov eax, ebx
        call strcat_
.9:
        lea edx, [byte ecx+01h]
        mov eax, ebx
        call strcat_
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; MakeDirPath                                                     1E5FC  96 PC
; (out, dir, language): a game directory path (language prefix, directory
; from DataDirPath, backslash)
;-----------------------------------------------------------------------------
MakeDirPath:
        push ecx
        push esi
        mov ecx, eax
        mov esi, edx
        mov byte [eax], 0
        test ebx, ebx
        je short .1
        mov edx, dword [DirPathTable]
        call strcat_
.1:
        imul edx, esi, byte 0Fh
        mov eax, ecx
        add edx, DataDirPath
        call strcat_
        mov edx, str_backslash2
        mov eax, ecx
        call strcat_
        pop esi
        pop ecx
        ret
jpt_1E633:
        dd SelectDataLibrary_54
        dd SelectDataLibrary_32
        dd SelectDataLibrary_3A
        dd SelectDataLibrary_40
;-----------------------------------------------------------------------------
; SelectDataLibrary                               1E643  96 PC, low confidence
; (index): builds the library path of a 16h-byte entry at unk_1151A7 (subdir
; by the optflags bits, then its name) and opens it (OpenResourceArchive) unless it is
; the current one
;-----------------------------------------------------------------------------
SelectDataLibrary:
        push ebx
        push ecx
        push edx
        enter 28h, 0
        mov byte [byte ebp-028h], 0
        test eax, eax
        je near SelectDataLibrary_54.6
        imul eax, byte 0FFFFFFEAh
        mov ebx, unk_1151A7
        add ebx, eax
        mov eax, dword [optflags]
        and eax, byte 3
        cmp eax, byte 3
        ja short SelectDataLibrary_54
        jmp dword [nosplit cs:eax*4+jpt_1E633]
SelectDataLibrary_32:
        test byte [byte ebx+012h], 1
.1:
        jne short SelectDataLibrary_54
        jmp short SelectDataLibrary_40.2
SelectDataLibrary_3A:
        test byte [byte ebx+012h], 2
        jmp short SelectDataLibrary_32.1
SelectDataLibrary_40:
        test byte [byte ebx+012h], 4
        jne short SelectDataLibrary_54
.2:
        lea eax, [byte ebp-028h]
        mov edx, dword [DirPathTable]
        call strcat_
SelectDataLibrary_54:
        mov eax, dword [byte ebx+0Eh]
        test eax, eax
        je short .5
        cmp eax, byte 8
        jge short .5
        test byte [optflags], 0Ch
        je short .3
        cmp byte [ebx], 0
        je short .3
        imul eax, byte 0Fh
        movsx edx, word [dword eax+word_11512D]
        imul edx, byte 0Fh
        lea eax, [byte ebp-028h]
        add edx, DataDirPath
        jmp short .4
.3:
        imul eax, byte 0Fh
        mov edx, DataDirPath
        add edx, eax
        lea eax, [byte ebp-028h]
.4:
        call strcat_
        mov edx, str_backslash2
        lea eax, [byte ebp-028h]
        call strcat_
.5:
        lea eax, [byte ebp-028h]
        lea edx, [byte ebx+01h]
        call strcat_
        call sub_B73C4
        lea edx, [byte ebp-028h]
        call stricmp_
        test eax, eax
        je short .7
        lea eax, [byte ebp-028h]
.6:
        push eax
        call OpenResourceArchive
        add esp, byte 4
.7:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadDataFile                                 1E715  96 PC, medium confidence
; (file id, flags): loads a game data file by id (MakeDataPath, then the
; loader)
;-----------------------------------------------------------------------------
LoadDataFile:
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call OpenArtArchiveErr
LoadDataFile_1B:
        add esp, byte 8
        mov edx, eax
        call SyncMusicStream
        mov eax, edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadDataFileFlag0                               1E73F  96 PC, low confidence
; LoadDataFile through the same loader with flag 0 (OpenArtArchive)
;-----------------------------------------------------------------------------
LoadDataFileFlag0:
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call OpenArtArchive
        jmp short LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadDataFileErr
        jmp short LoadDataFile_1B
;-----------------------------------------------------------------------------
; LoadDataFileHandle                              1E779  96 PC, low confidence
; LoadDataFile returning the loader's handle (LoadFileAllocQuiet), for the sound banks
; (sub_C04C3)
;-----------------------------------------------------------------------------
LoadDataFileHandle:
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadFileAllocQuiet
        jmp short LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadFileInto
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadFileToBlockShared
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadFileToBlockPlain
        jmp near LoadDataFile_1B
;-----------------------------------------------------------------------------
; LoadPackedFile                               1E7F6  96 PC, medium confidence
; (file id, flags): loads a game data file and unpacks it when packed
;-----------------------------------------------------------------------------
LoadPackedFile:
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        mov edi, edx
        mov edx, eax
        mov eax, DataFilePath
        xor esi, esi
        call MakeDataPath
        cmp edi, byte 20h
        jne short .2
        push esi
        push DataFilePath
        call OpenArtArchiveErr
        add esp, byte 8
        push eax
        mov edi, eax
        mov dword [byte ebp-08h], eax
        call sub_AFD00
        add esp, byte 4
        mov dword [byte ebp-04h], eax
        call sub_AC838
        cmp eax, dword [byte ebp-04h]
        jl short .1
        push byte 20h
        push dword [byte ebp-04h]
        push DataFilePath
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push eax
        push edi
        mov esi, eax
        call unpack
        add esp, byte 0Ch
.1:
        push dword [byte ebp-08h]
        call FreeMemBlock
        add esp, byte 4
.2:
        test esi, esi
        jne short .3
        push byte 20h
        push DataFilePath
        call sub_B7638
        add esp, byte 8
        mov esi, eax
.3:
        call SyncMusicStream
        mov eax, esi
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call sub_B7654
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call sub_B7690
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call sub_B76A8
        jmp near LoadDataFile_1B
;-----------------------------------------------------------------------------
; LoadDataFileLib                                 1E8E9  96 PC, low confidence
; LoadDataFile through the other library loader (LoadResourceDataShared -> sub_C4DE0, flag
; 1)
;-----------------------------------------------------------------------------
LoadDataFileLib:
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadResourceDataShared
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call sub_B049E
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadResourceData
        jmp near LoadDataFile_1B
        push ebx
        push ecx
        mov ebx, edx
        mov edx, eax
        mov eax, DataFilePath
        call MakeDataPath
        push ebx
        push DataFilePath
        call LoadResourceBlockShared
        jmp near LoadDataFile_1B
;-----------------------------------------------------------------------------
; MakeDatabasePath                             1E969  96 PC, medium confidence
; (id, out, drive): path of a saved database file: the save directory (or
; drive X:\) + the id as %07d + ".DB"
;-----------------------------------------------------------------------------
MakeDatabasePath:
        push esi
        enter 0Ch, 0
        push eax
        mov esi, edx
        push ebx
        push str_07d
        lea edx, [byte ebp-0Ch]
        push edx
        call sprintf_
        add esp, byte 0Ch
        cmp dword [byte ebp-010h], byte 0
        jne short .1
        mov edx, 4
        mov eax, esi
        xor ebx, ebx
        call MakeDirPath
        lea edx, [byte ebp-0Ch]
        mov eax, esi
        jmp short .2
.1:
        mov byte [byte esi+01h], 3Ah
        mov dl, byte [byte ebp-010h]
        mov byte [byte esi+02h], 5Ch
        add dl, 40h
        mov eax, esi
        mov byte [esi], dl
        lea edx, [byte ebp-0Ch]
        mov byte [byte esi+03h], 0
.2:
        call strcat_
        push ecx
        push str_D15
        lea edx, [byte ebp-0Ch]
        push edx
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        mov eax, esi
        call strcat_
        mov edx, str_dot3
        mov eax, esi
        call strcat_
        cmp dword [byte ebp+0Ch], byte 0FFFFFFFFh
        jne short .3
        mov edx, str_DB2
        jmp short .4
.3:
        push dword [byte ebp+0Ch]
        push str_02d
        lea edx, [byte ebp-0Ch]
        push edx
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
.4:
        mov eax, esi
        call strcat_
        leave
        pop esi
        ret 4
