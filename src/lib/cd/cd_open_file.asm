; CD-ROM: CdOpenFile, CdOpenStream, CdHandleEntry, CdCloseFile, CdReadSectors and 3 more.
bits 32
%include "hockey.inc"
section s_B65DD progbits alloc exec nowrite align=1
extern AllocCdBuffer, CdDirEntry, CdDriveCount, CdFileBuffer, CdFileHandle, CdFileMode, CdFilePos, CdFileSize
extern CdFileStart, CdFileTable, CdFindFile, CdReadRequest, CdSectorSize, CdSeekCmd, DosCloseFile, DosOpenFile
extern DosReadFile, DosSeekFile, DriveLetterIndex, FatalError, IsCdDrive, str_OpenblockhandleSNOHANDLESLEF, str_OpenblockhandleSPATHNAME, strncpy_
global __saved_DS, CdOpenFile, CdOpenStream, CdHandleEntry, CdCloseFile, CdReadSectors, CdRead, CdSeekSectors
global CdSeek
__saved_DS:                                     ; used by RestoreDS, start
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; CdOpenFile                                   B65E0  96 PC, medium confidence
; Opens a file on the CD
;-----------------------------------------------------------------------------
CdOpenFile:
        push esi
        push edi
        push ebp
        sub esp, 94h
        mov eax, dword [dword esp+0A8h]
        mov dword [eax], 0
        mov eax, dword [dword esp+0ACh]
        mov dword [eax], 0
        mov eax, dword [dword esp+0B0h]
        mov dword [eax], 0
        mov esi, 1
        mov edx, dword [CdDriveCount]
        mov eax, 24h
        test edx, edx
        je short .2
.1:
        add eax, byte 24h
        inc esi
        cmp eax, 480h
        jge short .2
        cmp dword [dword eax+CdFileMode], byte 0
        jne short .1
.2:
        cmp esi, byte 20h
        jne short .3
        mov ecx, dword [dword esp+0A4h]
        push ecx
        push str_OpenblockhandleSNOHANDLESLEF
        call FatalError
        add esp, byte 8
.3:
        push dword 8Fh
        mov edi, dword [dword esp+0A8h]
        push edi
        lea eax, [byte esp+08h]
        push eax
        call CdFindFile
        add esp, byte 0Ch
        test eax, eax
        jne short .4
        push edi
        push str_OpenblockhandleSPATHNAME
        call FatalError
        add esp, byte 8
.4:
        mov eax, esp
        push eax
        lea edi, [nosplit esi*8+00h]
        call DriveLetterIndex
        add esp, byte 4
        add edi, esi
        mov ebp, eax
        push eax
        shl edi, 2
        call IsCdDrive
        mov edx, CdFileTable
        add esp, byte 4
        add edx, edi
        mov dword [dword esp+090h], edx
        test eax, eax
        je near .8
        push byte 0
        push ebp
        call AllocCdBuffer
        add esp, byte 8
        mov eax, dword [dword esp+0B0h]
        push eax
        mov eax, dword [dword esp+094h]
        add eax, byte 20h
        push eax
        lea eax, [byte esp+08h]
        push eax
        call CdDirEntry
        xor edx, edx
        mov ecx, 1
        mov dword [dword edi+CdFileSize], edx
        mov eax, dword [CdSectorSize]
        mov dword [dword edi+CdFilePos], edx
        add esp, byte 0Ch
        mov dword [dword edi+CdFileMode], ecx
        mov edx, dword [dword esp+0B4h]
        mov dword [dword edi+CdFileStart], eax
        mov ecx, esp
        mov dword [edx], eax
        mov eax, esp
.5:
        mov edx, eax
        mov bl, byte [edx]
        inc eax
        test bl, bl
        je short .7
        xor edx, edx
        mov dl, byte [eax]
        cmp edx, byte 2Fh
        je short .6
        cmp edx, byte 3Ah
        jne short .5
.6:
        lea ecx, [byte eax+01h]
        jmp short .5
.7:
        lea eax, [nosplit esi*8+00h]
        add eax, esi
        mov ebx, 0Ch
        shl eax, 2
        mov edx, ecx
        add eax, CdFileTable
        call strncpy_
        jmp short .9
.8:
        mov eax, dword [dword esp+0B8h]
        push eax
        mov edx, dword [dword esp+0B4h]
        push edx
        mov ebx, dword [dword esp+0B4h]
        mov eax, dword [dword esp+098h]
        push ebx
        add eax, byte 10h
        push eax
        mov ecx, dword [dword esp+0B4h]
        push ecx
        call DosOpenFile
        add esp, byte 14h
        mov eax, dword [dword esp+0ACh]
        mov eax, dword [eax]
        mov ebp, 2
        mov dword [dword edi+CdFileSize], eax
        mov eax, dword [dword esp+0B4h]
        mov dword [dword edi+CdFileMode], ebp
        mov dword [eax], 1
.9:
        mov eax, dword [dword esp+0A8h]
        mov dword [eax], esi
        xor eax, eax
        add esp, 94h
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdOpenStream                                    B67BC  96 PC, low confidence
; Opens a stream on the CD
;-----------------------------------------------------------------------------
CdOpenStream:
        push esi
        push edi
        push byte 1
        mov edx, dword [byte esp+020h]
        push edx
        mov ebx, dword [byte esp+020h]
        push ebx
        mov ecx, dword [byte esp+020h]
        push ecx
        mov esi, dword [byte esp+020h]
        push esi
        mov edi, dword [byte esp+020h]
        push edi
        call CdOpenFile
        add esp, byte 18h
        pop edi
        pop esi
        ret
        push esi
        push edi
        push byte 0
        mov edx, dword [byte esp+020h]
        push edx
        mov ebx, dword [byte esp+020h]
        push ebx
        mov ecx, dword [byte esp+020h]
        push ecx
        mov esi, dword [byte esp+020h]
        push esi
        mov edi, dword [byte esp+020h]
        push edi
        call CdOpenFile
        add esp, byte 18h
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdHandleEntry                                   B680C  96 PC, low confidence
; Returns the entry of a CD file handle
;-----------------------------------------------------------------------------
CdHandleEntry:
        mov edx, dword [byte esp+04h]
        lea eax, [nosplit edx*8+00h]
        add eax, edx
        shl eax, 2
        add eax, CdFileTable
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; CdCloseFile                                     B6824  96 PC, low confidence
; Closes a CD file
;-----------------------------------------------------------------------------
CdCloseFile:
        mov edx, dword [byte esp+04h]
        lea eax, [nosplit edx*8+00h]
        add eax, edx
        shl eax, 2
        cmp dword [dword eax+CdFileMode], byte 2
        jne short .1
        mov ebx, dword [dword eax+CdFileHandle]
        push ebx
        call DosCloseFile
        add esp, byte 4
.1:
        mov edx, dword [byte esp+04h]
        lea eax, [nosplit edx*8+00h]
        add eax, edx
        xor ecx, ecx
        mov dword [nosplit eax*4+CdFileMode], ecx
        ret
        db 090h
;-----------------------------------------------------------------------------
; CdReadSectors                                B6864  96 PC, medium confidence
; Reads sectors of a CD file
;-----------------------------------------------------------------------------
CdReadSectors:
        push esi
        push edi
        push ebp
        mov edx, dword [byte esp+014h]
        mov edi, dword [byte esp+018h]
        mov esi, dword [byte esp+010h]
        lea eax, [nosplit esi*8+00h]
        add esi, eax
        shl esi, 2
        cmp dword [dword esi+CdFileMode], byte 2
        jne short .1
        push edi
        push edx
        mov edx, dword [dword esi+CdFileHandle]
        push edx
        call DosReadFile
        add esp, byte 0Ch
        jmp short .2
.1:
        push edi
        mov ecx, dword [dword esi+CdFilePos]
        push ecx
        mov ebp, dword [dword esi+CdFileBuffer]
        push ebp
        push edx
        call CdReadRequest
        mov eax, dword [dword esi+CdFilePos]
        add eax, edi
        add esp, byte 10h
        mov dword [dword esi+CdFilePos], eax
.2:
        mov eax, edi
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; CdRead                                          B68C8  96 PC, low confidence
; Reads from a CD file
;-----------------------------------------------------------------------------
CdRead:
        push byte 1
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        mov ecx, dword [byte esp+010h]
        push ecx
        call CdReadSectors
        add esp, byte 10h
        ret
        db 08Bh,0C0h
        push byte 0
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        mov ecx, dword [byte esp+010h]
        push ecx
        call CdReadSectors
        add esp, byte 10h
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; CdSeekSectors                                B6900  96 PC, medium confidence
; Seeks in a CD file
;-----------------------------------------------------------------------------
CdSeekSectors:
        push esi
        push edi
        push ebp
        mov edx, dword [byte esp+014h]
        mov eax, dword [byte esp+010h]
        lea esi, [nosplit eax*8+00h]
        add esi, eax
        shl esi, 2
        cmp dword [dword esi+CdFileMode], byte 2
        jne short .1
        push edx
        mov ebp, dword [dword esi+CdFileHandle]
        push ebp
        call DosSeekFile
        add esp, byte 8
        xor eax, eax
        pop ebp
        pop edi
        pop esi
        ret
.1:
        mov eax, dword [dword esi+CdFileSize]
        add eax, edx
        push eax
        mov edi, dword [dword esi+CdFileBuffer]
        push edi
        mov dword [dword esi+CdFilePos], eax
        call CdSeekCmd
        mov eax, dword [dword esi+CdFilePos]
        add esp, byte 8
        and eax, 7FFh
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; CdSeek                                          B6964  96 PC, low confidence
; Seeks in a CD file and waits
;-----------------------------------------------------------------------------
CdSeek:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call CdSeekSectors
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call CdSeekSectors
        add esp, byte 0Ch
        ret
