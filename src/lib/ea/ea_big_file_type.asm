; EA library: BigFileType, LocateBigEntry, LocateBigData, LocateBigs, WalkBigFile.
bits 32
%include "hockey.inc"
section s_C6084 progbits alloc exec nowrite align=1
extern BigEntryLength, BigEntryNamePtr, FatalError, str_LocatebigFILEISNOTAUNITFILE, str_LocatebigNOBIGFILESETNUL, str_LocatebigsFILENOTFOUNDS, stricmp_
global BigFileType, LocateBigEntry, LocateBigEntry_168, LocateBigData, LocateBigs, WalkBigFile
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; BigFileType                                  C6090  96 PC, medium confidence
; Checks a BIG archive header: 1 or 2 for the two formats
;-----------------------------------------------------------------------------
BigFileType:
        push ebx
        push ecx
        push esi
        xor esi, esi
        test eax, eax
        jne short .1
        test edx, edx
        je short .5
        push str_LocatebigNOBIGFILESETNUL
        jmp short .4
.1:
        mov ecx, 2
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        cmp eax, 0C0FBh
        jne short .2
        mov esi, 1
        jmp short .5
.2:
        cmp eax, 4249h
        jne short .3
        mov esi, 2
        jmp short .5
.3:
        test edx, edx
        je short .5
        push str_LocatebigFILEISNOTAUNITFILE
.4:
        call FatalError
        add esp, byte 4
.5:
        mov eax, esi
        pop esi
        pop ecx
        pop ebx
        ret
        db 090h
;-----------------------------------------------------------------------------
; LocateBigEntry                               C60EC  96 PC, medium confidence
; Finds a file's entry in a BIG archive
;-----------------------------------------------------------------------------
LocateBigEntry:
        push esi
        push edi
        push ebp
        mov ebx, dword [byte esp+010h]
        mov esi, dword [byte esp+014h]
        mov edx, dword [byte esp+018h]
        mov eax, ebx
        call BigFileType
        cmp eax, byte 1
        jb near .7
        jbe short .1
        cmp eax, byte 2
        je near .4
        jmp near .7
.1:
        lea eax, [byte ebx+02h]
        mov ecx, 2
        lea ebp, [byte ebx+04h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        add ebx, byte 6
        add ebp, eax
        cmp ebx, ebp
        jae near .7
.2:
        lea edi, [byte ebx+06h]
        mov edx, esi
        mov eax, edi
        call stricmp_
        test eax, eax
        jne short .3
        mov ecx, 3
        mov eax, ebx
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 3
        mov esi, eax
        lea eax, [byte ebx+03h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [BigEntryLength], eax
        mov eax, esi
        pop ebp
        pop edi
        pop esi
        ret
.3:
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        add ecx, byte 7
        add ebx, ecx
        cmp ebx, ebp
        jb short .2
        xor edx, edx
        xor eax, eax
        mov dword [BigEntryLength], edx
        pop ebp
        pop edi
        pop esi
        ret
.4:
        mov ecx, 4
        lea eax, [byte ebx+0Ch]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        lea ebp, [ebx+eax]
        add ebx, byte 10h
        cmp ebx, ebp
        jae short .7
.5:
        lea edi, [byte ebx+08h]
        mov edx, esi
        mov eax, edi
        call stricmp_
        test eax, eax
        jne short .6
        mov ecx, 4
        mov eax, ebx
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 4
        mov esi, eax
        lea eax, [byte ebx+04h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [BigEntryLength], eax
        mov eax, esi
        pop ebp
        pop edi
        pop esi
        ret
.6:
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        add ecx, byte 9
        add ebx, ecx
        cmp ebx, ebp
        jb short .5
.7:
        xor edx, edx
        xor eax, eax
        mov dword [BigEntryLength], edx
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LocateBigEntry
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
LocateBigEntry_168:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LocateBigEntry
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; LocateBigData                                C626C  96 PC, medium confidence
; Returns a pointer to a file's data in a BIG archive
;-----------------------------------------------------------------------------
LocateBigData:
        push esi
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        mov ecx, dword [byte esp+010h]
        push ecx
        xor esi, esi
        call LocateBigEntry
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov esi, dword [byte esp+08h]
        add esi, eax
.1:
        mov eax, esi
        pop esi
        ret
        push esi
        push byte 1
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        xor esi, esi
        call LocateBigEntry
        add esp, byte 0Ch
        test eax, eax
        je short .2
        mov esi, dword [byte esp+08h]
        add esi, eax
.2:
        mov eax, esi
        pop esi
        ret
        db 08Dh,040h,00h
        push esi
        xor esi, esi
        push esi
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        call LocateBigEntry
        add esp, byte 0Ch
        test eax, eax
        je short .3
        mov esi, dword [byte esp+08h]
        add esi, eax
.3:
        mov eax, esi
        pop esi
        ret
;-----------------------------------------------------------------------------
; LocateBigs                                   C62E0  96 PC, medium confidence
; Finds a file in a BIG archive, stopping when it is not there
;-----------------------------------------------------------------------------
LocateBigs:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov edi, dword [byte esp+018h]
        mov ebp, dword [byte esp+01Ch]
.1:
        mov dl, 2Ch
        mov esi, edi
.2:
        mov al, byte [esi]
        LD cmp, al, dl
        je short .4
        cmp al, 0
        je short .3
        inc esi
        mov al, byte [esi]
        LD cmp, al, dl
        je short .4
        inc esi
        cmp al, 0
        jne short .2
.3:
        LD sub, esi, esi
.4:
        mov eax, esi
        test esi, esi
        je short .5
        mov byte [esi], 0
.5:
        push byte 0
        push edi
        mov edx, dword [byte esp+01Ch]
        push edx
        call LocateBigData
        add esp, byte 0Ch
        mov dword [esp], eax
        test eax, eax
        jne short .6
        cmp dword [byte esp+020h], byte 0
        je short .6
        push edi
        push str_LocatebigsFILENOTFOUNDS
        call FatalError
        add esp, byte 8
.6:
        add ebp, byte 4
        mov eax, dword [esp]
        mov dword [byte ebp-04h], eax
        test esi, esi
        je short .7
        mov byte [esi], 2Ch
        inc esi
        mov edi, esi
.7:
        test esi, esi
        jne short .1
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        push byte 1
        mov edx, dword [byte esp+010h]
        push edx
        mov ebx, dword [byte esp+010h]
        push ebx
        mov ecx, dword [byte esp+010h]
        push ecx
        call LocateBigs
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
        call LocateBigs
        add esp, byte 10h
        ret
        db 08Bh,0C0h
        mov ebx, dword [byte esp+04h]
        mov eax, ebx
        xor edx, edx
        call BigFileType
        xor ecx, ecx
        cmp eax, byte 1
        jb short .11
        jbe short .8
        cmp eax, byte 2
        je short .9
        mov eax, ecx
        ret
.8:
        mov ecx, 2
        lea eax, [byte ebx+04h]
        jmp short .10
.9:
        mov ecx, 4
        lea eax, [byte ebx+08h]
.10:
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, eax
.11:
        mov eax, ecx
        ret
;-----------------------------------------------------------------------------
; WalkBigFile                                     C63DC  96 PC, low confidence
; Walks the entries of a BIG archive
;-----------------------------------------------------------------------------
WalkBigFile:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov eax, dword [byte esp+010h]
        xor edx, edx
        call BigFileType
        xor ebx, ebx
        cmp eax, byte 1
        jb near .7
        jbe short .1
        cmp eax, byte 2
        je near .4
        jmp near .7
.1:
        mov eax, dword [byte esp+010h]
        mov ecx, 2
        mov ebp, dword [byte esp+010h]
        add eax, byte 2
        mov edx, dword [byte esp+010h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        add ebp, byte 4
        add edx, byte 6
        add ebp, eax
        cmp edx, ebp
        jae near .7
.2:
        lea edi, [byte edx+06h]
        cmp ebx, esi
        jne short .3
        mov ecx, 3
        mov eax, edx
        mov dword [BigEntryNamePtr], edi
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 3
        mov ebx, eax
        lea eax, [byte edx+03h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [BigEntryLength], eax
        mov eax, dword [byte esp+010h]
        add eax, ebx
        pop ebp
        pop edi
        pop esi
        ret
.3:
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        add ecx, byte 7
        add edx, ecx
        inc ebx
        cmp edx, ebp
        jb short .2
        xor edx, edx
        xor eax, eax
        mov dword [BigEntryLength], edx
        pop ebp
        pop edi
        pop esi
        ret
.4:
        mov eax, dword [byte esp+010h]
        mov ecx, 4
        mov ebp, dword [byte esp+010h]
        add eax, byte 0Ch
        mov edx, dword [byte esp+010h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        add edx, byte 10h
        add ebp, eax
        cmp edx, ebp
        jae short .7
.5:
        lea edi, [byte edx+08h]
        cmp ebx, esi
        jne short .6
        mov ecx, 4
        mov eax, edx
        mov dword [BigEntryNamePtr], edi
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 4
        mov ebx, eax
        lea eax, [byte edx+04h]
        mov eax, dword [eax]
        bswap eax
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [BigEntryLength], eax
        mov eax, dword [byte esp+010h]
        add eax, ebx
        pop ebp
        pop edi
        pop esi
        ret
.6:
        sub ecx, ecx
        dec ecx
        xor eax, eax
        repne scasb
        not ecx
        dec ecx
        add ecx, byte 9
        add edx, ecx
        inc ebx
        cmp edx, ebp
        jb short .5
.7:
        xor edx, edx
        xor eax, eax
        mov dword [BigEntryLength], edx
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        push ebp
        mov ebp, dword [byte esp+018h]
        mov edx, dword [byte esp+014h]
        push edx
        mov ebx, dword [byte esp+014h]
        push ebx
        call WalkBigFile
        add esp, byte 8
        test eax, eax
        je short .10
        mov esi, dword [BigEntryNamePtr]
        mov edi, ebp
        push edi
.8:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .9
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .8
.9:
        pop edi
        mov eax, ebp
        pop ebp
        pop edi
        pop esi
        ret
.10:
        mov byte [byte ebp+00h], 0
        pop ebp
        pop edi
        pop esi
        ret
