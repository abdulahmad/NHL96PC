; Input: DispatchHotkey, SetHotkey.
bits 32
%include "hockey.inc"
section s_E22DB progbits alloc exec nowrite align=1
extern HotkeyFuncTable, HotkeyModTable, HotkeyNesting, HotkeyScanTable, MusicOffHook, MusicOnHook, MusicToggleHook, PrintfSavedEbx
extern PrintfSavedEcx, PrintfSavedEdi, PrintfSavedEdx, PrintfSavedEsi, PrintfSavedReturn, ShowMessageBox, SoundOffHook, SoundOnHook
extern SoundToggleHook, sprintf_, str_MUSICOFF, str_MUSICON, str_SOUNDOFF, str_SOUNDON
global DispatchHotkey, SetHotkey, SetHotkey_5B, SetHotkey_81
        db 00h
;-----------------------------------------------------------------------------
; DispatchHotkey                               E22DC  96 PC, medium confidence
; Looks up the handler registered for a key (ASCII or extended scan code) and
; calls it
;-----------------------------------------------------------------------------
DispatchHotkey:
        push ebp
        LD mov, ebp, esp
        dec dword [HotkeyNesting]
        jne short .4
        mov ebx, dword [byte ebp+08h]
        LD or, bl, bl
        je short .2
        and ebx, byte 7Fh
        mov dword [byte ebp+08h], ebx
        mov bl, byte [dword ebx+HotkeyScanTable]
.1:
        dec ebx
        jl short .4
        push edi
        push esi
        call dword [nosplit ebx*4+HotkeyFuncTable]
        pop esi
        pop edi
        LD xor, eax, eax
        inc dword [HotkeyNesting]
        leave
        ret
.2:
        movzx ebx, bh
        cmp ebx, 84h
        jl short .3
        mov ebx, 84h
.3:
        mov bl, byte [dword ebx+HotkeyModTable]
        jmp short .1
.4:
        mov eax, dword [byte ebp+08h]
        inc dword [HotkeyNesting]
        leave
        ret
;-----------------------------------------------------------------------------
; SetHotkey                                       E2335  96 PC, low confidence
; Sets the routine run for a hotkey, adding it to the hotkey list
;-----------------------------------------------------------------------------
SetHotkey:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+0Ch]
        mov ecx, 40h
        mov ebx, HotkeyFuncTable
.1:
        cmp dword [ebx], eax
        je short .3
        cmp word [ebx], byte 0
        je short .2
        add ebx, byte 4
        dec ecx
        jne short .1
        leave
        ret
.2:
        mov dword [ebx], eax
.3:
        mov eax, 41h
        LD sub, eax, ecx
.4:
        mov ebx, dword [byte ebp+08h]
        LD or, bl, bl
        je short .6
        cmp ebx, byte 7Fh
        jg short .5
        mov byte [dword ebx+HotkeyScanTable], al
.5:
        leave
        ret
.6:
        movzx ebx, bh
        cmp ebx, 84h
        jg short .5
        mov byte [dword ebx+HotkeyModTable], al
        leave
        ret
        push ebp
        LD mov, ebp, esp
        LD xor, eax, eax
        jmp short .4
        db 00h,00h
SetHotkey_5B:
        call dword [SoundToggleHook]
        LD or, al, al
        jne short .7
        jmp short .8
        call dword [SoundOnHook]
.7:
        mov eax, str_SOUNDON
        jmp short SetHotkey_81.11
        call dword [SoundOffHook]
.8:
        mov eax, str_SOUNDOFF
        jmp short SetHotkey_81.11
SetHotkey_81:
        call dword [MusicToggleHook]
        LD or, al, al
        jne short .9
        jmp short .10
        call dword [MusicOnHook]
.9:
        mov eax, str_MUSICON
        jmp short .11
        call dword [MusicOffHook]
.10:
        mov eax, str_MUSICOFF
.11:
        push byte 8
        push eax
        call ShowMessageBox
        add sp, byte 8
        ret
        db 00h
        mov dword [PrintfSavedEbx], ebx
        mov dword [PrintfSavedEcx], ecx
        mov dword [PrintfSavedEdx], edx
        mov dword [PrintfSavedEsi], esi
        mov dword [PrintfSavedEdi], edi
        pop dword [PrintfSavedReturn]
        call sprintf_
        push dword [PrintfSavedReturn]
        mov ebx, dword [PrintfSavedEbx]
        mov ecx, dword [PrintfSavedEcx]
        mov edx, dword [PrintfSavedEdx]
        mov esi, dword [PrintfSavedEsi]
        mov edi, dword [PrintfSavedEdi]
        ret
