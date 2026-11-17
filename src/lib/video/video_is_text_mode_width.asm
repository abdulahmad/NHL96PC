; Video: IsTextModeWidth, SaveTextScreen, RestoreTextScreen.
bits 32
%include "hockey.inc"
section s_D06A6 progbits alloc exec nowrite align=1
extern AllocMemBlockLockedChecked, bcopy, MemDescPtr, PushMemDescriptorLocked, RestoreVideoState, SaveVideoState, str_SaveText
global IsTextModeWidth, SaveTextScreen, RestoreTextScreen
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; IsTextModeWidth                                 D06B0  96 PC, low confidence
; Returns whether the saved video state is a text mode of 40, 80, 100, 128 or
; 132 columns
;-----------------------------------------------------------------------------
IsTextModeWidth:
        push ebx
        push edx
        push esi
        mov ebx, dword [eax]
        xor edx, edx
        cmp ebx, byte 28h
        je short .1
        cmp ebx, byte 50h
        je short .1
        cmp ebx, byte 64h
        je short .1
        cmp ebx, 80h
        je short .1
        cmp ebx, 84h
        jne short .2
.1:
        mov ebx, dword [byte eax+04h]
        cmp ebx, byte 18h
        jl short .2
        cmp ebx, byte 42h
        jg short .2
        mov esi, dword [byte eax+08h]
        test esi, esi
        jl short .2
        cmp esi, dword [eax]
        jg short .2
        mov edx, 1
.2:
        mov eax, edx
        pop esi
        pop edx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; SaveTextScreen                                  D06FC  96 PC, low confidence
; Saves the text mode screen and video state at start-up ("Save Text")
;-----------------------------------------------------------------------------
SaveTextScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 10h
        mov eax, esp
        call SaveVideoState
        mov eax, esp
        xor ebp, ebp
        call IsTextModeWidth
        test eax, eax
        je short .1
        mov edi, dword [esp]
        imul edi, dword [byte esp+04h]
        add edi, edi
        push ebp
        lea eax, [byte edi+018h]
        push eax
        push str_SaveText
        call AllocMemBlockLockedChecked
        add esp, byte 0Ch
        push eax
        mov ebp, eax
        call MemDescPtr
        add esp, byte 4
        mov esi, eax
        push byte 10h
        mov dword [eax], 10h
        add eax, byte 8
        push eax
        mov dword [byte eax-04h], edi
        lea eax, [byte esp+08h]
        push eax
        call bcopy
        add esp, byte 0Ch
        push edi
        add esi, byte 18h
        push esi
        push dword 0B8000h
        call bcopy
        add esp, byte 0Ch
.1:
        mov eax, ebp
        add esp, byte 10h
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RestoreTextScreen                               D077C  96 PC, low confidence
; Restores the text mode screen and video state at shutdown
;-----------------------------------------------------------------------------
RestoreTextScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 24h
        mov esi, eax
        test eax, eax
        je short .2
        push eax
        call MemDescPtr
        add esp, byte 4
        mov edi, dword [eax]
        mov edx, dword [byte eax+04h]
        push edi
        mov dword [byte esp+024h], edx
        lea edx, [byte esp+014h]
        push edx
        mov ebp, eax
        add eax, byte 8
        push eax
        call bcopy
        add esp, byte 0Ch
        mov eax, esp
        call SaveVideoState
        mov eax, dword [byte esp+01Ch]
        mov edx, dword [byte esp+04h]
        cmp eax, edx
        jle short .1
        mov dword [byte esp+01Ch], edx
.1:
        lea eax, [byte esp+010h]
        mov ebx, dword [byte esp+020h]
        call RestoreVideoState
        push ebx
        add ebp, byte 8
        push dword 0B8000h
        add edi, ebp
        push edi
        call bcopy
        add esp, byte 0Ch
        push esi
        call PushMemDescriptorLocked
        add esp, byte 4
.2:
        add esp, byte 24h
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
