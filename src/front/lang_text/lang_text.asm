; The language text: the Localize buffer, the text index and blocks, GetLangText.
bits 32
%include "hockey.inc"
section s_771F0 progbits alloc exec nowrite align=1
extern LangTextHandle, LangTextLoaded, TeamPanelFont, LangBlockState, LangBlockText, LangBlockPtrs, LangBlockLastId, LangBlockIds
extern LangFileHandle, fclose_, fopen_, fread_, fseek_, LoadDataFile, MakeDataPath, str_LFERROR
extern str_Localize, str_Rb, AllocMemBlock, FreeMemBlock
global LoadLangText, FreeLangText, LoadLangBlock, GetLangText
;-----------------------------------------------------------------------------
; LoadLangText                                                    771F0  96 PC
; At start-up: the language text index (data file) and the Localize buffer
; (800h) for the language
;-----------------------------------------------------------------------------
LoadLangText:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        mov dword [LangFileHandle], eax
        cmp dword [LangTextHandle], byte 0
        je short .1
        push dword [LangTextHandle]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov edx, 20h
        lea eax, [dword esi+0136h]
        call LoadDataFile
        mov dword [LangTextHandle], eax
        cmp dword [LangTextLoaded], byte 0
        je short .2
        push dword [LangTextLoaded]
        call FreeMemBlock
        add esp, byte 4
.2:
        push byte 20h
        push dword 800h
        push str_Localize
        call AllocMemBlock
        mov edx, 3
        add esp, byte 0Ch
        mov dword [LangTextLoaded], eax
        xor ebx, ebx
        xor eax, eax
.3:
        add eax, byte 4
        mov esi, dword [LangTextLoaded]
        mov dword [dword eax+TeamPanelFont], edx
        mov dword [dword eax+LangBlockLastId], 0FFFFFFFFh
        dec edx
        add esi, ebx
        add ebx, 200h
        mov dword [dword eax+LangBlockText], esi
        cmp eax, byte 10h
        jne short .3
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeLangText                                                    77292  96 PC
; At shut-down: frees the language text index and buffer
;-----------------------------------------------------------------------------
FreeLangText:
        push ebx
        push ecx
        push edx
        cmp dword [LangTextHandle], byte 0
        je short .1
        push dword [LangTextHandle]
        call FreeMemBlock
        mov dword [LangTextHandle], 0
        add esp, byte 4
.1:
        cmp dword [LangTextLoaded], byte 0
        je short .2
        push dword [LangTextLoaded]
        call FreeMemBlock
        mov dword [LangTextLoaded], 0
        add esp, byte 4
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadLangBlock                                                   772DB  96 PC
; (slot, block): reads a 200h-byte block of the language text file into a
; slot
;-----------------------------------------------------------------------------
LoadLangBlock:
        push ebx
        push ecx
        push esi
        push edi
        enter 34h, 0
        mov ebx, edx
        mov esi, eax
        shl esi, 2
        mov dword [dword esi+LangBlockIds], edx
        mov edx, dword [LangFileHandle]
        lea eax, [byte ebp-034h]
        add edx, 134h
        call MakeDataPath
        mov edx, str_Rb
        lea eax, [byte ebp-034h]
        call fopen_
        mov ecx, eax
        mov edi, eax
        test eax, eax
        je short .1
        mov edx, ebx
        shl edx, 9
        xor ebx, ebx
        call fseek_
        mov ebx, 200h
        mov edx, 1
        mov eax, dword [dword esi+LangBlockPtrs]
        call fread_
        test eax, eax
        jg short .2
.1:
        mov dword [dword esi+LangBlockIds], 0FFFFFFFFh
.2:
        mov eax, edi
        call fclose_
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetLangText                                                     77355  96 PC
; (text id): the text for an id from the language file (cached blocks);
; "LFERROR!!!" if missing
;-----------------------------------------------------------------------------
GetLangText:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov edx, eax
        mov eax, dword [LangTextHandle]
        shl edx, 2
        mov eax, dword [edx+eax]
        mov dword [byte ebp-04h], eax
        cdq
        shl edx, 9
        LD sbb, eax, edx
        sar eax, 9
        mov ebx, 0FFFFFFFFh
        xor edi, edi
        xor ecx, ecx
        mov esi, eax
        jmp short .3
.1:
        cmp esi, dword [dword ecx+LangBlockIds]
        jne short .2
        mov ebx, edi
.2:
        add ecx, byte 4
        inc edi
.3:
        cmp edi, byte 4
        jge short .4
        test ebx, ebx
        jl short .1
.4:
        test ebx, ebx
        jge short .8
        xor ecx, ecx
        xor edi, edi
        jmp short .7
.5:
        cmp dword [dword edi+LangBlockIds], byte 0
        jge short .6
        mov edx, esi
        mov eax, ecx
        mov ebx, ecx
        call LoadLangBlock
.6:
        add edi, byte 4
        inc ecx
.7:
        cmp ecx, byte 4
        jge short .8
        test ebx, ebx
        jl short .5
.8:
        test ebx, ebx
        jge short .11
        xor ebx, ebx
        xor ecx, ecx
        xor eax, eax
.9:
        cmp dword [dword eax+LangBlockState], byte 3
        jne short .10
        mov ebx, ecx
.10:
        inc ecx
        add eax, byte 4
        cmp ecx, byte 4
        jl short .9
        mov edx, esi
        mov eax, ebx
        call LoadLangBlock
.11:
        mov ecx, ebx
        shl ecx, 2
        cmp dword [dword ecx+LangBlockIds], byte 0
        jge short .12
        mov ecx, str_LFERROR
        jmp short .13
.12:
        mov eax, dword [byte ebp-04h]
        mov esi, 200h
        cdq
        idiv esi
        mov ecx, dword [dword ecx+LangBlockPtrs]
        add ecx, edx
.13:
        mov dword [nosplit ebx*4+LangBlockState], 0FFFFFFFFh
        xor eax, eax
.14:
        cmp dword [dword eax+LangBlockState], byte 3
        jge short .15
        inc dword [dword eax+LangBlockState]
.15:
        add eax, byte 4
        cmp eax, byte 10h
        jne short .14
        mov eax, ecx
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
