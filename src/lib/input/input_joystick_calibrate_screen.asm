; Input: JoystickCalibrateScreen.
bits 32
%include "hockey.inc"
section s_C540B progbits alloc exec nowrite align=1
extern BlitToScreenWindow, ClearClipRect, CreateBitmap, DefaultFont, DrawArtOpaqueAtOwnPos, DrawTextCentredBoxed, FillRect, FlushKeys
extern FreeBitmap, JoyButtonMap, joycalactive, JoyCalibArrowX, JoyCalibArrowY, joyenablemask, JoyResetCentres, KbdGetKey
extern MemLargestFreeLocked, ModalBeginHook, ModalEndHook, NearestColour, ReadJoystickPorts, ReadKeyPadBits, RestoreDrawState, SaveDrawState
extern SaveTextState, SetClipWindow, SetDrawBitmap, SetDrawTarget, SetScreenTarget, str_BelowToAllSquares, str_CalibrateYourJoystickByU, str_PressJoystickButtonWhenC
extern str_ToMoveTheJoystickPositio, TextSetColor, TextSetFont, ViewScreenHeight, ViewScreenWidth
global JoystickCalibrateScreen
        db 00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; JoystickCalibrateScreen                      C5410  96 PC, medium confidence
; Joystick calibration screen
;-----------------------------------------------------------------------------
JoystickCalibrateScreen:
        push esi
        push edi
        push ebp
        sub esp, 0A0h
        mov dword [joycalactive], 1
        call dword [ModalBeginHook]
        call MemLargestFreeLocked
        sar eax, 4
        cmp eax, 0FA0h
        jl near .4
        mov dword [joyenablemask], 1
        call ReadKeyPadBits
        test al, 10h
        jne near .5
        mov eax, esp
        push eax
        call SaveDrawState
        add esp, byte 4
        lea eax, [byte esp+060h]
        push eax
        call SaveTextState
        add esp, byte 4
        push DefaultFont
        call TextSetFont
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        shl eax, 3
        add edx, eax
        shl edx, 3
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        add esp, byte 4
        push byte 0
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        add edx, eax
        shl edx, 6
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov ebp, eax
        call SetDrawBitmap
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        shl eax, 3
        add edx, eax
        shl edx, 3
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        add esp, byte 4
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        add edx, eax
        shl edx, 6
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        push byte 0
        push byte 0
        push byte 0
        push byte 0
        call BlitToScreenWindow
        add esp, byte 18h
        call SetScreenTarget
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        shl eax, 3
        add edx, eax
        shl edx, 3
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        add edx, eax
        shl edx, 6
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push byte 0
        push eax
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        push byte 0
        call ClearClipRect
        add esp, byte 4
        push byte 0
        push dword 3FFFFFCh
        call NearestColour
        add esp, byte 4
        push eax
        call TextSetColor
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*8+00h]
        add eax, edx
        shl eax, 2
        sub eax, edx
        mov edx, eax
        mov ebx, 0C8h
        sar edx, 1Fh
        idiv ebx
        add esp, byte 8
        push eax
        push str_CalibrateYourJoystickByU
        call DrawTextCentredBoxed
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        mov edx, eax
        shl eax, 4
        sub eax, edx
        mov edx, eax
        mov ebx, 0C8h
        sar edx, 1Fh
        idiv ebx
        add esp, byte 8
        push eax
        push str_ToMoveTheJoystickPositio
        call DrawTextCentredBoxed
        mov edx, dword [ViewScreenHeight]
        lea eax, [nosplit edx*8+00h]
        sub eax, edx
        shl eax, 3
        sub eax, edx
        mov edx, eax
        mov ebx, 0C8h
        sar edx, 1Fh
        idiv ebx
        add esp, byte 8
        push eax
        push str_BelowToAllSquares
        call DrawTextCentredBoxed
        imul edx, dword [ViewScreenHeight], dword 0B9h
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        add esp, byte 8
        push eax
        push str_PressJoystickButtonWhenC
        call DrawTextCentredBoxed
        add esp, byte 8
        push dword 3FFFFFCh
        call NearestColour
        mov edi, dword [ViewScreenHeight]
        imul edx, edi, byte 5Bh
        add esp, byte 4
        mov ebx, 0C8h
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        mov eax, dword [ViewScreenWidth]
        mov edx, eax
        mov ebx, 140h
        sar edx, 1Fh
        idiv ebx
        push eax
        lea eax, [nosplit edi*8+00h]
        add eax, edi
        shl eax, 2
        sub eax, edi
        lea edx, [eax+eax]
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        mov eax, edx
        shl eax, 6
        add edx, eax
        add edx, edx
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        call FillRect
        add esp, byte 14h
        push dword 3FFFFFCh
        call NearestColour
        add esp, byte 4
        push eax
        imul edx, dword [ViewScreenHeight], byte 5Bh
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        mov eax, dword [ViewScreenWidth]
        mov edx, eax
        mov ebx, 140h
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenHeight]
        push eax
        lea eax, [nosplit edx*8+00h]
        add eax, edx
        shl eax, 2
        sub eax, edx
        lea edx, [eax+eax]
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        add eax, edx
        add eax, eax
        mov edx, eax
        shl eax, 4
        add edx, eax
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        call FillRect
        add esp, byte 14h
        push dword 3FFFFFCh
        call NearestColour
        add esp, byte 4
        push eax
        mov eax, dword [ViewScreenHeight]
        mov edx, eax
        mov ebx, 0C8h
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        mov eax, edx
        shl eax, 4
        sub eax, edx
        shl eax, 3
        add edx, eax
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenHeight]
        push eax
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        shl eax, 3
        add edx, eax
        shl edx, 2
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        add eax, eax
        mov edx, eax
        shl eax, 4
        sub eax, edx
        mov edx, eax
        mov ebx, 140h
        sar edx, 1Fh
        idiv ebx
        push eax
        call FillRect
        add esp, byte 14h
        push dword 3FFFFFCh
        call NearestColour
        add esp, byte 4
        push eax
        mov eax, dword [ViewScreenHeight]
        mov edx, eax
        mov ebx, 0C8h
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        mov eax, edx
        shl eax, 4
        sub eax, edx
        shl eax, 3
        add edx, eax
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenHeight]
        push eax
        mov eax, edx
        shl eax, 6
        add edx, eax
        add edx, edx
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        push eax
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        add eax, eax
        mov edx, eax
        shl eax, 4
        sub eax, edx
        mov edx, eax
        mov ebx, 140h
        sar edx, 1Fh
        idiv ebx
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        mov esi, 0FFFFFFFFh
        call JoyResetCentres
        add esp, byte 4
.1:
        call KbdGetKey
        test eax, eax
        jne near .3
        call ReadJoystickPorts
        test al, 30h
        jne near .3
        push eax
        call JoyButtonMap
        add esp, byte 4
        mov edi, eax
        cmp eax, esi
        je short .1
        xor esi, esi
.2:
        imul edx, dword [ViewScreenHeight], byte 18h
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push byte 0
        mov edx, dword [ViewScreenWidth]
        mov ebx, 140h
        shl edx, 5
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ecx, dword [ViewScreenHeight]
        mov edx, dword [dword esi+JoyCalibArrowY]
        imul edx, ecx
        mov ebx, 0C8h
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        mov edx, dword [dword esi+JoyCalibArrowX]
        imul edx, dword [ViewScreenWidth]
        mov ebx, 140h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        add esi, byte 4
        call FillRect
        add esp, byte 14h
        cmp esi, byte 24h
        jne short .2
        push dword 2A00000h
        call NearestColour
        imul edx, dword [ViewScreenHeight], byte 18h
        add esp, byte 4
        push eax
        mov ebx, 0C8h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [ViewScreenWidth]
        mov ebx, 140h
        shl edx, 5
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ecx, dword [ViewScreenHeight]
        mov edx, dword [nosplit edi*4+JoyCalibArrowY]
        imul edx, ecx
        mov ebx, 0C8h
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov esi, dword [ViewScreenWidth]
        mov edx, dword [nosplit edi*4+JoyCalibArrowX]
        imul edx, esi
        mov ebx, 140h
        push eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        push eax
        mov esi, edi
        call FillRect
        add esp, byte 14h
        jmp near .1
.3:
        mov edx, dword [byte ebp+02Ch]
        push edx
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push ebp
        call FreeBitmap
        add esp, byte 4
        lea eax, [byte esp+060h]
        push eax
        call SetDrawTarget
        add esp, byte 4
        mov eax, esp
        push eax
        call RestoreDrawState
        add esp, byte 4
        jmp short .5
.4:
        xor ebx, ebx
        mov dword [joyenablemask], ebx
.5:
        call FlushKeys
        xor edi, edi
        call dword [ModalEndHook]
        mov dword [joycalactive], edi
        add esp, 0A0h
        pop ebp
        pop edi
        pop esi
        ret
