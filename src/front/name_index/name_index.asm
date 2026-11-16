; NAMEINDEX files: the index of saved files in a directory (names, titles, ids).
bits 32
%include "hockey.inc"
section s_19382 progbits alloc exec nowrite align=1
extern TextStringWidth, str_backslash3, str_NAMEINDEX, strcat_, strcmp_, strcpy_, strlen_, AllocMemBlock
extern FreeMemBlock, OpenArtArchive, SaveDataFile
global TwoSpaces, NameIndexNew, NameIndexLoad, NameIndexLoad_ret, NameIndexSave, NameIndexFree, NameIndexAdd, NameIndexRemove
global NameIndexId, NameIndexPath, NameIndexFirstId
TwoSpaces:                                      ; used by EditText
        db 020h,020h
;-----------------------------------------------------------------------------
; NameIndexNew                                                    19384  96 PC
; (name, dir): a new NAMEINDEX block (magic 2C093h, directory, title, no
; entries, first id 1000)
;-----------------------------------------------------------------------------
NameIndexNew:
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, edx
        push byte 20h
        push dword 0A4h
        push str_NAMEINDEX
        call AllocMemBlock
        mov ebx, eax
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov dword [eax], 2C093h
        add eax, byte 8
        mov edx, esi
        mov dword [byte eax-04h], 0
        call strcpy_
        lea eax, [byte ebx+015h]
        mov edx, edi
        mov ecx, 36h
        call strcpy_
        lea edi, [byte ebx+06Eh]
        mov dword [byte ebx+066h], 0
        xor eax, eax
        mov dword [byte ebx+06Ah], 3E8h
        rep stosb
        mov eax, ebx
.1:
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NameIndexLoad                                                   193E8  96 PC
; (dir, file): loads a NAMEINDEX file (dir\file), checks its magic; 0 when
; missing or bad
;-----------------------------------------------------------------------------
NameIndexLoad:
        push ebx
        push ecx
        push esi
        push edi
        enter 64h, 0
        mov esi, eax
        mov edi, edx
        mov edx, eax
        lea eax, [byte ebp-064h]
        call strcpy_
        lea eax, [byte ebp-064h]
        call strlen_
        movsx eax, byte [byte eax+ebp-065h]
        cmp eax, byte 5Ch
        je short .1
        mov edx, str_backslash3
        lea eax, [byte ebp-064h]
        call strcat_
.1:
        lea eax, [byte ebp-064h]
        mov edx, edi
        call strcat_
        push byte 20h
        lea eax, [byte ebp-064h]
        push eax
        call OpenArtArchive
        add esp, byte 8
        mov ecx, eax
        test eax, eax
        je short NameIndexLoad_ret
        cmp dword [eax], 2C093h
        je short .2
        push eax
        call FreeMemBlock
        add esp, byte 4
        xor eax, eax
        jmp short NameIndexLoad_ret
.2:
        lea ebx, [byte eax+015h]
        mov edx, esi
        mov dword [byte eax+04h], 1
        mov eax, ebx
        call strcmp_
        test eax, eax
        je short .3
        mov edx, esi
        mov eax, ebx
        call strcpy_
.3:
        lea ebx, [byte ecx+08h]
        mov edx, edi
        mov eax, ebx
        call strcmp_
        test eax, eax
        je short .4
        mov edx, edi
        mov eax, ebx
        call strcpy_
.4:
        mov eax, ecx
NameIndexLoad_ret:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NameIndexSave                                                   19491  96 PC
; Writes a changed NAMEINDEX block back to its file (header plus 36h-byte
; entries)
;-----------------------------------------------------------------------------
NameIndexSave:
        push ebx
        push ecx
        push edx
        enter 64h, 0
        mov ebx, eax
        test eax, eax
        je near .6
        cmp dword [eax], 2C093h
        je short .1
        xor eax, eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        cmp dword [byte eax+04h], byte 0
        je short .2
        mov eax, 1
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        lea edx, [byte eax+015h]
        lea eax, [byte ebp-064h]
        call strcpy_
        lea eax, [byte ebp-064h]
        call strlen_
        movsx eax, byte [byte eax+ebp-065h]
        cmp eax, byte 5Ch
        je short .3
        mov edx, str_backslash3
        lea eax, [byte ebp-064h]
        call strcat_
.3:
        lea eax, [byte ebp-064h]
        lea edx, [byte ebx+08h]
        call strcat_
        cmp dword [byte ebx+066h], byte 0
        jle short .4
        mov eax, dword [byte ebx+066h]
        dec eax
        imul eax, byte 36h
        add eax, 0A4h
        push eax
        jmp short .5
.4:
        push dword 0A4h
.5:
        push ebx
        lea eax, [byte ebp-064h]
        push eax
        call SaveDataFile
        add esp, byte 0Ch
.6:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NameIndexFree                                                   19522  96 PC
; (save, index): saves the index when asked and changed, then frees it
;-----------------------------------------------------------------------------
NameIndexFree:
        push ebx
        push ecx
        test edx, edx
        jne short .2
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
.2:
        cmp dword [edx], 2C093h
        jne short .1
        cmp dword [byte edx+04h], byte 0
        jne short .3
        test eax, eax
        je short .3
        mov eax, edx
        call NameIndexSave
        test eax, eax
        je short .4
.3:
        push edx
        call FreeMemBlock
        mov eax, 1
        add esp, byte 4
.4:
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NameIndexAdd                                                    1955B  96 PC
; (index, file name, title): adds an entry (grows the block); returns the new
; block
;-----------------------------------------------------------------------------
NameIndexAdd:
        push ecx
        push esi
        push edi
        enter 4, 0
        push eax
        push edx
        push ebx
        test edx, edx
        je near .3
        test ebx, ebx
        je near .3
        test eax, eax
        je near .3
        cmp dword [eax], 2C093h
        jne near .4
        cmp dword [byte eax+066h], byte 0
        je short .1
        imul eax, dword [byte eax+066h], byte 36h
        push byte 20h
        add eax, 0A4h
        push eax
        push str_NAMEINDEX
        call AllocMemBlock
        mov ebx, dword [byte ebp-08h]
        mov ebx, dword [byte ebx+066h]
        dec ebx
        imul ebx, byte 36h
        mov esi, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edi, eax
        lea ecx, [dword ebx+0A4h]
        mov dword [byte ebp-04h], eax
        rep movsb
        push dword [byte ebp-08h]
        call FreeMemBlock
        add esp, byte 4
        jmp short .2
.1:
        mov dword [byte ebp-04h], eax
.2:
        mov eax, dword [byte ebp-04h]
        mov dword [byte eax+04h], 0
        mov eax, dword [byte eax+066h]
        imul eax, byte 36h
        mov ebx, dword [byte ebp-04h]
        add ebx, byte 6Eh
        mov ecx, dword [byte ebp-04h]
        inc dword [byte ebx-04h]
        add ebx, eax
        mov edx, dword [byte ebp-0Ch]
        mov eax, ebx
        inc dword [byte ecx+066h]
        call strcpy_
        mov edx, dword [byte ebp-010h]
        lea eax, [byte ebx+0Dh]
        call strcpy_
        mov eax, ecx
        leave
        pop edi
        pop esi
        pop ecx
        ret
.3:
        mov eax, dword [byte ebp-08h]
.4:
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push ecx
        test eax, eax
        je short .7
        cmp dword [eax], 2C093h
        jne short .5
        cmp dword [byte eax+066h], byte 0
        jne short .6
.5:
        xor eax, eax
        pop ecx
        ret
.6:
        sub edx, 3E8h
        test edx, edx
        jl short .5
        mov ecx, dword [byte eax+066h]
        dec ecx
        cmp edx, ecx
        jg short .5
        imul edx, byte 36h
        add eax, byte 6Eh
        add eax, edx
        add eax, byte 0Dh
        mov edx, ebx
        call strcpy_
        mov eax, 1
.7:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; NameIndexRemove                                                 19659  96 PC
; (index, id): removes the entry with that id (1000 + n); returns the new
; block
;-----------------------------------------------------------------------------
NameIndexRemove:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        push edx
        test eax, eax
        je near NameIndexLoad_ret
        cmp dword [eax], 2C093h
        jne near NameIndexLoad_ret
        cmp dword [byte eax+066h], byte 1
        jne short .1
        mov dword [byte ebp-04h], eax
        jmp short .5
.1:
        mov eax, dword [byte eax+066h]
        dec eax
        imul eax, dword 0A4h
        push byte 20h
        push eax
        push str_NAMEINDEX
        mov esi, dword [byte ebp-010h]
        call AllocMemBlock
        mov ecx, 0A4h
        mov ebx, dword [byte ebp-010h]
        mov edx, eax
        add esp, byte 0Ch
        mov edi, eax
        mov dword [byte ebp-04h], eax
        rep movsb
        mov eax, dword [byte ebp-014h]
        add edx, byte 6Eh
        add ebx, byte 6Eh
        sub eax, 3E8h
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-0Ch], eax
        xor edx, edx
.2:
        mov eax, dword [byte ebp-04h]
        cmp edx, dword [byte eax+066h]
        jge short .4
        cmp edx, dword [byte ebp-0Ch]
        je short .3
        mov ecx, 36h
        mov edi, dword [byte ebp-08h]
        mov esi, ebx
        rep movsb
        add dword [byte ebp-08h], byte 36h
.3:
        add ebx, byte 36h
        inc edx
        jmp short .2
.4:
        push dword [byte ebp-010h]
        call FreeMemBlock
        add esp, byte 4
.5:
        mov eax, dword [byte ebp-04h]
        mov dword [byte eax+04h], 0
        dec dword [byte eax+066h]
        jmp near NameIndexLoad_ret
;-----------------------------------------------------------------------------
; NameIndexId                                                     19706  96 PC
; (index, n): the id of entry n (1000 + n), -1 when out of range
;-----------------------------------------------------------------------------
NameIndexId:
        test eax, eax
        jne short .2
.1:
        mov eax, 0FFFFFFFFh
        ret
.2:
        cmp dword [eax], 2C093h
        jne short .1
        cmp dword [byte eax+066h], byte 0
        je short .1
        test edx, edx
        jl short .1
        mov eax, dword [byte eax+066h]
        dec eax
        cmp edx, eax
        jg short .1
        lea eax, [dword edx+03E8h]
        ret
;-----------------------------------------------------------------------------
; NameIndexPath                                                   19731  96 PC
; (index, id, out): dir\file of an entry; 0 when the id is not in the index
;-----------------------------------------------------------------------------
NameIndexPath:
        push ecx
        test eax, eax
        je short .4
        cmp dword [eax], 2C093h
        jne short .1
        cmp dword [byte eax+066h], byte 0
        jne short .2
.1:
        xor eax, eax
        pop ecx
        ret
.2:
        sub edx, 3E8h
        test edx, edx
        jl short .1
        mov ecx, dword [byte eax+066h]
        dec ecx
        cmp edx, ecx
        jg short .1
        imul edx, byte 36h
        lea ecx, [byte eax+06Eh]
        add ecx, edx
        lea edx, [byte eax+015h]
        mov eax, ebx
        call strcpy_
        mov eax, ebx
        call strlen_
        movsx eax, byte [byte ebx+eax-01h]
        cmp eax, byte 5Ch
        je short .3
        mov edx, str_backslash3
        mov eax, ebx
        call strcat_
.3:
        mov edx, ecx
        mov eax, ebx
        call strcat_
        mov eax, 1
.4:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; NameIndexFirstId                             19799  96 PC, medium confidence
; The index's first id field (1000 for no index, -1 for a bad one)
;-----------------------------------------------------------------------------
NameIndexFirstId:
        test eax, eax
        jne short .1
        mov eax, 3E8h
        ret
.1:
        cmp dword [eax], 2C093h
        je short .2
        mov eax, 0FFFFFFFFh
        ret
.2:
        mov eax, dword [byte eax+06Ah]
        ret
        push ebx
        push ecx
        push edx
        push esi
        enter 4, 0
        mov edx, eax
        xor eax, eax
        cmp byte [edx], 0
        je short .3
        mov eax, edx
        call strlen_
        dec eax
        lea esi, [edx+eax]
        mov al, byte [esi]
        push edx
        mov byte [byte ebp-04h], al
        mov byte [esi], 0
        call TextStringWidth
        mov dl, byte [byte ebp-04h]
        add esp, byte 4
        mov byte [esi], dl
.3:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
