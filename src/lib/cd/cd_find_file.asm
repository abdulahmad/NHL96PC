; CD-ROM: CdFindFile, DriveLetterIndex, IsCdDrive, AllocCdBuffer, DetectMscdex and 4 more.
bits 32
%include "hockey.inc"
section s_B69B6 progbits alloc exec nowrite align=1
extern AllocMemBlock, bcopy, CdBufferAddr, CdBufferAllocated, CdBufferSegment, CdBufferSelector, CdDirEntryBuf, CdDirSearch
extern CdDriveLetter, CdRegEax, CdRegEbx, CdRegEdi, CdRegEdx, CdRegEs, CdRegFlags, CdRegs
extern CdRegSegs, CdRequestCount, CdRequestSector, CdRequestSegment, CdRequestSelector, CdStreamSpeed, FatalError, FreeMemBlock
extern int386_, int386x_, segread_, str_CDROMBUFFER, str_CdromcheckCDROMSTATUSNOTRETU, str_CDROMDATA, str_CdromdirectoryentryERROR, str_CdromreadREADGREATERTHANMAXR
extern str_CdromreadREADSTATUSERRORX, str_CdromseekSEEKSTATUSX, ToUpperChar
global CdFindFile, DriveLetterIndex, IsCdDrive, AllocCdBuffer, DetectMscdex, CdPrefetch, CdReadRequest, CdSeekCmd
global CdDirEntry
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; CdFindFile                                   B69C0  96 PC, medium confidence
; Finds a file on the CD
;-----------------------------------------------------------------------------
CdFindFile:
        mov ecx, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
        mov eax, ecx
        call CdDirSearch
        mov edx, eax
        test eax, eax
        je short .1
        xor eax, eax
        mov al, byte [byte ecx+02h]
        cmp eax, byte 5Ch
        jne short .1
        mov byte [byte ecx+02h], 2Fh
.1:
        mov eax, edx
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DriveLetterIndex                                B69EC  96 PC, low confidence
; Returns the drive number of a path's drive letter
;-----------------------------------------------------------------------------
DriveLetterIndex:
        mov edx, dword [byte esp+04h]
        xor eax, eax
        mov al, byte [byte edx+01h]
        cmp eax, byte 3Ah
        je short .1
        mov eax, 0FFFFFFFFh
        ret
.1:
        xor eax, eax
        mov al, byte [edx]
        push eax
        call ToUpperChar
        add esp, byte 4
        sub eax, byte 41h
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; IsCdDrive                                       B6A14  96 PC, low confidence
; Returns whether a drive is a CD drive (MSCDEX)
;-----------------------------------------------------------------------------
IsCdDrive:
        sub esp, byte 38h
        cmp dword [CdStreamSpeed], byte 0
        jne short .1
        mov edx, 150Bh
        mov eax, dword [byte esp+03Ch]
        lea ebx, [byte esp+01Ch]
        mov word [esp], dx
        mov word [byte esp+08h], ax
        mov edx, esp
        mov eax, 2Fh
        call int386_
        cmp word [byte esp+01Ch], byte 0
        je short .1
        xor eax, eax
        mov ax, word [byte esp+020h]
        cmp eax, 0ADADh
        jne short .1
        mov eax, 1
        add esp, byte 38h
        ret
.1:
        xor eax, eax
        add esp, byte 38h
        ret
        db 090h
;-----------------------------------------------------------------------------
; AllocCdBuffer                                   B6A68  96 PC, low confidence
; Allocates the CD transfer buffer
;-----------------------------------------------------------------------------
AllocCdBuffer:
        cmp dword [CdBufferAllocated], byte 0
        jne short .1
        push dword 220h
        push dword 200h
        mov ebx, 1
        push str_CDROMDATA
        mov dword [CdBufferAllocated], ebx
        call AllocMemBlock
        add esp, byte 0Ch
        push dword 220h
        mov dword [CdDriveLetter], eax
        push dword 10000h
        shr eax, 4
        push str_CDROMBUFFER
        mov dword [CdRequestSelector], eax
        call AllocMemBlock
        mov dword [CdRequestSegment], eax
        shr eax, 4
        add esp, byte 0Ch
        mov dword [CdBufferSegment], eax
.1:
        mov eax, dword [byte esp+04h]
        mov dword [CdBufferSelector], eax
        mov eax, dword [byte esp+08h]
        sar eax, 0Bh
        mov dword [CdBufferAddr], eax
        ret
        db 08Bh,0C0h
        push esi
        cmp dword [CdBufferAllocated], byte 0
        je short .2
        mov ecx, dword [CdDriveLetter]
        xor ebx, ebx
        push ecx
        mov dword [CdBufferAllocated], ebx
        call FreeMemBlock
        add esp, byte 4
        mov esi, dword [CdRequestSegment]
        push esi
        call FreeMemBlock
        add esp, byte 4
.2:
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DetectMscdex                                    B6B10  96 PC, low confidence
; Finds MSCDEX and the CD drives
;-----------------------------------------------------------------------------
DetectMscdex:
        push esi
        push edi
        push ebp
        sub esp, byte 44h
        mov edx, 1501h
        mov ax, word [CdBufferSegment]
        xor ebx, ebx
        xor ecx, ecx
        mov dword [CdRegEdx], edx
        mov dword [CdRegEbx], ebx
        mov word [CdRegEs], ax
        lea eax, [byte esp+038h]
        mov edx, 300h
        mov ebx, 2Fh
        call segread_
        mov eax, CdRegs
        mov word [esp], dx
        mov word [byte esp+04h], bx
        mov word [byte esp+08h], cx
        mov ecx, CdRegs
        mov edx, ds
        lea ebx, [byte esp+01Ch]
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov dword [byte esp+014h], ecx
        lea ecx, [byte esp+038h]
        mov edx, esp
        call int386x_
        mov eax, dword [CdRequestSegment]
        xor edx, edx
        mov dx, word [byte eax+03h]
        shl edx, 4
        mov ax, word [byte eax+01h]
        and eax, 0FFFFh
        add eax, edx
        lea edx, [byte eax+0Ah]
        xor eax, eax
.1:
        xor ebx, ebx
        mov bl, byte [edx]
        cmp ebx, byte 20h
        je short .2
        mov ebx, dword [CdDriveLetter]
        inc eax
        mov cl, byte [edx]
        inc edx
        mov byte [byte ebx+eax-01h], cl
        cmp eax, byte 8
        jl short .1
.2:
        mov esi, 3D02h
        mov ebp, CdRegs
        lea ecx, [byte esp+038h]
        mov edx, dword [CdDriveLetter]
        lea ebx, [byte esp+01Ch]
        xor edi, edi
        mov byte [edx+eax], 0
        mov ax, word [CdRequestSelector]
        mov dword [CdRegEdx], esi
        mov dword [CdRegEdi], edi
        mov edx, ds
        mov esi, 300h
        mov word [CdRegSegs], ax
        lea eax, [byte esp+038h]
        mov edi, 21h
        call segread_
        xor eax, eax
        mov word [esp], si
        mov word [byte esp+08h], ax
        mov eax, CdRegs
        mov word [byte esp+04h], di
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov edx, esp
        mov dword [byte esp+014h], ebp
        call int386x_
        mov ax, word [CdRegFlags]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .3
        xor eax, eax
        jmp near .5
.3:
        mov ecx, 32h
        mov edx, 5
        mov eax, dword [CdDriveLetter]
        mov esi, dword [CdRegEdx]
        mov edi, ebp
        mov byte [eax], 6
        xor eax, eax
        xor ebx, ebx
        rep stosb
        mov eax, 4402h
        mov dword [CdRegEbx], esi
        mov dword [CdRegEax], edx
        mov dword [CdRegEdi], ebx
        xor ecx, ecx
        mov dword [CdRegEdx], eax
        mov ax, word [CdRequestSelector]
        mov edx, 300h
        mov word [CdRegSegs], ax
        lea eax, [byte esp+038h]
        mov ebx, 21h
        call segread_
        mov word [esp], dx
        mov word [byte esp+04h], bx
        mov word [byte esp+08h], cx
        mov eax, ebp
        lea ecx, [byte esp+038h]
        mov edx, ds
        lea ebx, [byte esp+01Ch]
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov edx, esp
        mov dword [byte esp+014h], ebp
        call int386x_
        mov ax, word [CdRegFlags]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .4
        push str_CdromcheckCDROMSTATUSNOTRETU
        call FatalError
        add esp, byte 4
.4:
        mov edi, 3E00h
        mov ecx, dword [CdDriveLetter]
        lea ebx, [byte esp+01Ch]
        mov edx, esp
        mov ecx, dword [byte ecx+01h]
        xor eax, eax
        and ecx, 80h
        mov word [esp], di
        mov word [byte esp+08h], ax
        mov eax, 21h
        mov word [byte esp+04h], si
        call int386_
        mov eax, ecx
.5:
        add esp, byte 44h
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; CdPrefetch                                      B6D2C  96 PC, low confidence
; Sends a read long prefetch request (82h) to the CD-ROM driver through
; MSCDEX
;-----------------------------------------------------------------------------
CdPrefetch:
        push edi
        sub esp, byte 44h
        mov eax, dword [CdDriveLetter]
        mov byte [eax], 1Bh
        mov byte [byte eax+01h], 0
        mov byte [byte eax+02h], 82h
        mov byte [byte eax+0Dh], 0
        mov word [byte eax+0Eh], 0
        mov word [byte eax+010h], 0
        mov byte [byte eax+018h], 0
        mov byte [byte eax+019h], 0
        mov edx, dword [byte esp+04Ch]
        mov byte [byte eax+01Ah], 0
        mov ecx, 32h
        mov word [byte eax+03h], 0
        mov edi, CdRegs
        mov dword [byte eax+014h], edx
        mov edx, dword [byte esp+050h]
        xor ebx, ebx
        mov word [byte eax+012h], dx
        xor eax, eax
        mov edx, 1510h
        rep stosb
        mov eax, dword [CdBufferSelector]
        mov dword [CdRegEdx], edx
        mov dword [CdRegEbx], ebx
        xor ecx, ecx
        mov dword [CdRegEax], eax
        mov ax, word [CdRequestSelector]
        mov edx, 300h
        mov word [CdRegEs], ax
        lea eax, [byte esp+038h]
        mov ebx, 2Fh
        call segread_
        mov eax, CdRegs
        mov word [byte esp+01Ch], dx
        mov word [byte esp+020h], bx
        mov word [byte esp+024h], cx
        mov ecx, CdRegs
        mov edx, ds
        mov ebx, esp
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov dword [byte esp+030h], ecx
        lea ecx, [byte esp+038h]
        lea edx, [byte esp+01Ch]
        call int386x_
        add esp, byte 44h
        pop edi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; CdReadRequest                                   B6DFC  96 PC, low confidence
; Reads CD-ROM sectors through MSCDEX into the low memory buffer and copies
; them out
;-----------------------------------------------------------------------------
CdReadRequest:
        push esi
        push edi
        push ebp
        sub esp, byte 4Ch
        mov eax, dword [byte esp+064h]
        sar eax, 0Bh
        mov dword [byte esp+048h], eax
        mov eax, dword [byte esp+064h]
        mov edx, dword [byte esp+068h]
        and eax, 7FFh
        add eax, edx
        add eax, 7FFh
        sar eax, 0Bh
        mov ebp, 3
        mov dword [byte esp+044h], eax
.1:
        mov esi, dword [CdDriveLetter]
        mov byte [esi], 1Bh
        mov ax, word [CdBufferSegment]
        mov byte [byte esi+01h], 0
        mov ebx, dword [byte esp+048h]
        mov word [byte esi+010h], ax
        mov eax, dword [byte esp+060h]
        mov byte [byte esi+02h], 80h
        add eax, ebx
        mov byte [byte esi+0Dh], 0
        mov dword [CdRequestSector], eax
        mov dword [byte esi+014h], eax
        mov eax, dword [byte esp+044h]
        mov word [byte esi+012h], ax
        mov eax, dword [byte esi+010h]
        mov word [byte esi+0Eh], 0
        sar eax, 10h
        mov dx, word [byte esi+012h]
        mov dword [CdRequestCount], eax
        test dx, dx
        je near .4
        cmp eax, byte 20h
        jle short .2
        push eax
        push str_CdromreadREADGREATERTHANMAXR
        call FatalError
        add esp, byte 8
.2:
        mov ecx, 32h
        mov byte [byte esi+018h], 0
        mov edi, CdRegs
        mov byte [byte esi+019h], 0
        mov ebx, 300h
        mov byte [byte esi+01Ah], 0
        xor eax, eax
        mov word [byte esi+03h], 0
        rep stosb
        mov edx, ds
        mov ecx, 1510h
        mov eax, dword [CdBufferSelector]
        xor edi, edi
        mov dword [CdRegEdx], ecx
        mov dword [CdRegEbx], edi
        mov dword [CdRegEax], eax
        mov ax, word [CdRequestSelector]
        mov ecx, 2Fh
        mov word [CdRegEs], ax
        lea eax, [byte esp+038h]
        xor edi, edi
        call segread_
        mov eax, CdRegs
        mov word [byte esp+01Ch], bx
        mov word [byte esp+020h], cx
        mov word [byte esp+024h], di
        mov eax, CdRegs
        lea ecx, [byte esp+038h]
        mov ebx, esp
        mov word [byte esp+038h], dx
        lea edx, [byte esp+01Ch]
        mov dword [byte esp+030h], eax
        mov eax, 31h
        call int386x_
        mov eax, dword [byte esi+01h]
        sar eax, 10h
        test ah, 80h
        je short .3
        mov edx, ebp
        dec ebp
        test edx, edx
        jg near .1
        push eax
        push str_CdromreadREADSTATUSERRORX
        call FatalError
        add esp, byte 8
        jmp near .1
.3:
        mov edx, dword [byte esp+068h]
        mov ebx, dword [byte esp+05Ch]
        mov eax, dword [byte esp+064h]
        push edx
        and eax, 7FFh
        mov edx, dword [CdRequestSegment]
        push ebx
        add eax, edx
        push eax
        call bcopy
        mov ecx, dword [CdBufferAddr]
        add esp, byte 0Ch
        test ecx, ecx
        je short .4
        mov eax, dword [byte esi+010h]
        mov ebp, dword [byte esi+014h]
        sar eax, 10h
        push ecx
        add eax, ebp
        push eax
        call CdPrefetch
        add esp, byte 8
.4:
        add esp, byte 4Ch
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdSeekCmd                                    B6FA0  96 PC, medium confidence
; Sends a seek to the CD driver
;-----------------------------------------------------------------------------
CdSeekCmd:
        push esi
        push edi
        sub esp, byte 44h
        mov esi, dword [CdDriveLetter]
        mov byte [esi], 1Bh
        mov byte [byte esi+01h], 0
        mov byte [byte esi+02h], 83h
        mov byte [byte esi+0Dh], 0
        mov word [byte esi+0Eh], 0
        mov eax, dword [byte esp+054h]
        mov word [byte esi+010h], 0
        mov edx, dword [byte esp+050h]
        mov word [byte esi+012h], 0
        mov ecx, 32h
        mov byte [byte esi+018h], 0
        mov edi, CdRegs
        mov byte [byte esi+019h], 0
        xor ebx, ebx
        mov byte [byte esi+01Ah], 0
        sar eax, 0Bh
        mov word [byte esi+03h], 0
        add edx, eax
        xor eax, eax
        mov dword [byte esi+014h], edx
        rep stosb
        mov edx, 1510h
        mov eax, dword [CdBufferSelector]
        mov dword [CdRegEbx], ebx
        xor ecx, ecx
        mov ebx, 2Fh
        mov dword [CdRegEax], eax
        mov ax, word [CdRequestSelector]
        mov dword [CdRegEdx], edx
        mov word [CdRegEs], ax
        lea eax, [byte esp+038h]
        mov edx, 300h
        call segread_
        mov eax, CdRegs
        mov word [byte esp+01Ch], dx
        mov word [byte esp+020h], bx
        mov word [byte esp+024h], cx
        mov ecx, CdRegs
        mov edx, ds
        mov ebx, esp
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov dword [byte esp+030h], ecx
        lea ecx, [byte esp+038h]
        lea edx, [byte esp+01Ch]
        call int386x_
        mov eax, dword [byte esi+01h]
        sar eax, 10h
        test ah, 80h
        je short .1
        push eax
        push str_CdromseekSEEKSTATUSX
        call FatalError
        add esp, byte 8
.1:
        add esp, byte 44h
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; CdDirEntry                                   B7094  96 PC, medium confidence
; Reads the directory entry of a CD file
;-----------------------------------------------------------------------------
CdDirEntry:
        push esi
        push edi
        push ebp
        sub esp, byte 44h
        mov esi, dword [byte esp+054h]
        xor eax, eax
        mov al, byte [byte esi+01h]
        cmp eax, byte 3Ah
        jne short .1
        add esi, byte 2
.1:
        mov ecx, 32h
        mov edi, dword [CdRequestSegment]
        mov edx, 150Fh
        push edi
.2:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .3
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .2
.3:
        pop edi
        xor ebx, ebx
        mov edi, CdRegs
        xor eax, eax
        mov esi, CdRegs
        rep stosb
        mov eax, dword [CdBufferSelector]
        mov dword [CdRegEdx], edx
        mov dword [CdRegEbx], ebx
        mov dword [CdRegs], ebx
        mov dword [CdRegEax], eax
        mov ax, word [CdBufferSegment]
        xor ecx, ecx
        mov word [CdRegEs], ax
        mov eax, dword [CdRequestSelector]
        mov edx, 300h
        mov dword [CdDirEntryBuf], eax
        lea eax, [byte esp+038h]
        mov ebx, 2Fh
        call segread_
        mov eax, CdRegs
        mov word [esp], dx
        mov word [byte esp+04h], bx
        mov word [byte esp+08h], cx
        lea ecx, [byte esp+038h]
        mov edx, ds
        lea ebx, [byte esp+01Ch]
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov edx, esp
        mov dword [byte esp+014h], esi
        call int386x_
        mov ax, word [CdRegFlags]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .4
        mov edi, dword [CdRequestSegment]
        push edi
        mov ebp, dword [CdRegEdx]
        push ebp
        push str_CdromdirectoryentryERROR
        call FatalError
        add esp, byte 0Ch
.4:
        mov eax, dword [CdDriveLetter]
        mov ebx, dword [byte esp+058h]
        mov edx, dword [byte eax+02h]
        mov dword [ebx], edx
        mov edx, dword [byte esp+05Ch]
        mov eax, dword [byte eax+0Ah]
        mov dword [edx], eax
        add esp, byte 44h
        pop ebp
        pop edi
        pop esi
        ret
