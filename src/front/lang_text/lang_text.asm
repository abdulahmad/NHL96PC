; The language text: the Localize buffer, the text index and blocks, GetLangText (96 PC).
bits 32
%include "hockey.inc"
section s_771F0 progbits alloc exec nowrite align=1
extern dword_11E2C0, dword_11E2C4, dword_17D690, dword_17D694, dword_17D6A0, dword_17D6A4, dword_17D6B0, dword_17D6B4
extern dword_17D6C4, fclose_, fopen_, fread_, fseek_, LoadDataFile, MakeDataPath, str_LFERROR
extern str_Localize, str_Rb, sub_AB758, sub_ABF4C
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
        mov dword [dword_17D6C4], eax
        cmp dword [dword_11E2C0], byte 0
        je short .1
        push dword [dword_11E2C0]
        call sub_ABF4C
        add esp, byte 4
.1:
        mov edx, 20h
        lea eax, [dword esi+0136h]
        call LoadDataFile
        mov dword [dword_11E2C0], eax
        cmp dword [dword_11E2C4], byte 0
        je short .2
        push dword [dword_11E2C4]
        call sub_ABF4C
        add esp, byte 4
.2:
        push byte 20h
        push dword 800h
        push str_Localize
        call sub_AB758
        mov edx, 3
        add esp, byte 0Ch
        mov dword [dword_11E2C4], eax
        xor ebx, ebx
        xor eax, eax
.3:
        add eax, byte 4
        mov esi, dword [dword_11E2C4]
        mov dword [dword eax+dword_17D690], edx
        mov dword [dword eax+dword_17D6B0], 0FFFFFFFFh
        dec edx
        add esi, ebx
        add ebx, 200h
        mov dword [dword eax+dword_17D6A0], esi
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
        cmp dword [dword_11E2C0], byte 0
        je short .1
        push dword [dword_11E2C0]
        call sub_ABF4C
        mov dword [dword_11E2C0], 0
        add esp, byte 4
.1:
        cmp dword [dword_11E2C4], byte 0
        je short .2
        push dword [dword_11E2C4]
        call sub_ABF4C
        mov dword [dword_11E2C4], 0
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
        mov dword [dword esi+dword_17D6B4], edx
        mov edx, dword [dword_17D6C4]
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
        mov eax, dword [dword esi+dword_17D6A4]
        call fread_
        test eax, eax
        jg short .2
.1:
        mov dword [dword esi+dword_17D6B4], 0FFFFFFFFh
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
        mov eax, dword [dword_11E2C0]
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
        cmp esi, dword [dword ecx+dword_17D6B4]
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
        cmp dword [dword edi+dword_17D6B4], byte 0
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
        cmp dword [dword eax+dword_17D694], byte 3
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
        cmp dword [dword ecx+dword_17D6B4], byte 0
        jge short .12
        mov ecx, str_LFERROR
        jmp short .13
.12:
        mov eax, dword [byte ebp-04h]
        mov esi, 200h
        cdq
        idiv esi
        mov ecx, dword [dword ecx+dword_17D6A4]
        add ecx, edx
.13:
        mov dword [nosplit ebx*4+dword_17D694], 0FFFFFFFFh
        xor eax, eax
.14:
        cmp dword [dword eax+dword_17D694], byte 3
        jge short .15
        inc dword [dword eax+dword_17D694]
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
