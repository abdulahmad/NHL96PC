; Controls: keyboard, mouse and joystick pads, the key bindings and the Gravis GrIP library (96 PC).
bits 32
%include "hockey.inc"
extern GsOptions
extern optblock
section s_10010 progbits alloc exec nowrite align=1
extern _nfree_, _nmalloc_, _searchenv_, InputDeviceMask, EscReplayKeyMap, JoyPortMask
extern GripSlotPresent, JoyPadBits, GripLinkByte, GripPadState
extern KeyPollTick, MousePollTick, KeyRepeatTick, JoyPollTicks, KeyPadActive, JoyPadActive
extern MousePadActive, InputRecordIndex, Joy1NeedsCalib, Joy2NeedsCalib, GripLinked, GripLibHandle, GripSlotsScanned, GripPadBitsPrev
extern dword_11D91F, dword_11F5C0, dword_11F5C4, SlotPollState, SlotWords, LastKeyPollTick, SlotInput, KeyBindingSet
extern GripPadBits, GripShootMap, GripPassMap, Joy1MinX, Joy1MinY
extern Joy1MaxX, Joy1X, Joy1Y, Joy1CentreX, Joy2MinX, Joy2MinY, Joy2MaxX
extern Joy2X, Joy2Y, Joy2CentreX, GripSlotMask, GripButtonsRaw, GripCurSlot, fclose_, fopen_
extern fread_, fseek_, ftell_, GameLoopActive, gameopts, GetTicks, InputRecordCount, InputRecordHead
extern InputRecordRing, kaufmfont, LinkResyncInput, mousepollfn, MouseRead, mousex, mousey, SetViewRect
extern SlotButtons, SlotTable, slotteam, str_CGRIP, str_GRIP, str_GRIPGLL, str_PATH, str_Rb2
extern strcat_, strcpy_, CameraFacing, InitMouse, KeyIsDown, KbdGetKey, CalibrateJoystick, JoyResetCentres
extern AddExitHandler, KeyBindings, KeyBindingsAlt, GripSlotNames, GripSlotTypes, GripFarCall, InputDevicesFound, InputDevicesReady
extern MouseReady, GripBufferSide, SlotsTwoPlayer, ControllerScreenMode, JoyAxisValues, word_11F914, word_11F918, word_11F91C
extern SlotDevice, GripAxisMin, GripAxisMax, Joy1MaxY, Joy1Present, Joy1CentreY
extern Joy1Buttons, Joy2MaxY, Joy2Present, Joy2CentreY, Joy2Buttons, Joy1RepeatState, Joy2RepeatState, GripSlotIds
extern GripLinkStatus, GripDriverSeg, GripLibSeg, GripDataSeg, GripResult, GripAxesRaw
global GetInputDevices, InitInputDevices, TestKeyBinding, ReadEscReplayKeys, ReadEscReplayKeys_52, ReadKeyboardPad, ReadKeyboardPad_2D7, ReadMousePad
global ReadJoyPad, InitSlotTable, ResetInputSlots, PollControllers, ResetSlotButtons, GetPressedDevice, GripLinkLibrary, GripUnlinkLibrary
global GripUnlinkLibrary_5, SetGripButtonMap, GetGripButtonMap, LoadGripLibrary, GripScanSlots, GripReadSlots, GripReadPadBits, ReadAnalogJoysticks
global ReadJoystickBits, GripShutdown, InitGrip
;-----------------------------------------------------------------------------
; GetInputDevices                                                 10010  96 PC
; Input device bitmask: 1 mouse present (InputDevicesReady), 2/4/8/10h joystick or
; GrIP pad 1-4 (InputDevicesFound bits); InitSlotTable keeps it in InputDeviceMask
;-----------------------------------------------------------------------------
GetInputDevices:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        mov dword [byte ebp-08h], 0
        cmp word [InputDevicesReady], byte 0
        je short .1
        or dword [byte ebp-08h], byte 1
.1:
        mov ax, word [InputDevicesFound]
        and eax, 1
        cwde
        test eax, eax
        je short .2
        or dword [byte ebp-08h], byte 2
.2:
        mov ax, word [InputDevicesFound]
        and eax, 2
        cwde
        test eax, eax
        je short .3
        or dword [byte ebp-08h], byte 4
.3:
        mov ax, word [InputDevicesFound]
        and eax, 4
        cwde
        test eax, eax
        je short .4
        or dword [byte ebp-08h], byte 8
.4:
        mov ax, word [InputDevicesFound]
        and eax, 8
        cwde
        test eax, eax
        je short .5
        or dword [byte ebp-08h], byte 10h
.5:
        mov eax, dword [byte ebp-08h]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InitInputDevices                                                10095  96 PC
; One-time device init: detects the mouse (int 33h, InitMouse) and polls it
; once, then InitGrip; stores the joystick mask in InputDevicesFound
;-----------------------------------------------------------------------------
InitInputDevices:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        mov word [InputDevicesFound], 0
        mov word [InputDevicesReady], 0
        cmp word [MouseReady], byte 0
        jne short .2
        call InitMouse
        test eax, eax
        je short .1
        mov word [InputDevicesReady], 1
        call dword [mousepollfn]
.1:
        mov word [MouseReady], 1
.2:
        call InitGrip
        mov word [InputDevicesFound], ax
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; TestKeyBinding                                                  100F2  96 PC
; (ctrl, alt, binding, bit, &out): binding table KeyBindingSet entries {need
; ctrl, need alt, scan code}; KeyDown on the scan code with the modifier
; state; ORs bit into *out
;-----------------------------------------------------------------------------
TestKeyBinding:
        push esi
        push edi
        enter 4, 0
        mov esi, dword [byte ebp+010h]
        mov dword [byte ebp-04h], eax
        mov edi, ecx
        mov eax, dword [KeyBindingSet]
        shl ebx, 2
        add eax, ebx
        cmp byte [eax], 0
        je short .2
        cmp dword [byte ebp-04h], byte 0
.1:
        je short .5
        movsx eax, word [byte eax+02h]
        push eax
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .5
        jmp short .4
.2:
        cmp byte [byte eax+01h], 0
        je short .3
        test edx, edx
        jmp short .1
.3:
        movsx eax, word [byte eax+02h]
        push eax
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .5
.4:
        or dword [esi], edi
.5:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; ReadEscReplayKeys                            1014B  96 PC, medium confidence
; Clears *out, then key bindings 0 (Esc) and 1 (R) -> bits 1 and 2;
; PollControllers calls it first for the shared key word
;-----------------------------------------------------------------------------
ReadEscReplayKeys:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        push byte 1Dh
        mov dword [eax], 0
        call KeyIsDown
        add esp, byte 4
        push byte 38h
        mov dword [byte ebp-04h], eax
        call KeyIsDown
        mov ecx, 1
        add esp, byte 4
        mov edi, eax
        mov edx, eax
        push esi
        xor ebx, ebx
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 2
        mov ebx, 1
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        leave
ReadEscReplayKeys_52:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push edx
        mov edx, eax
        mov ebx, dword [eax]
        sar ebx, 2
        and ebx, byte 0Fh
        and byte [eax], 0C3h
        cmp ebx, byte 0Ah
        jle short .1
        xor ebx, ebx
.1:
        call CameraFacing
        movsx eax, al
        imul eax, byte 0Bh
        movsx ebx, byte [dword ebx+eax+EscReplayKeyMap]
        mov eax, ebx
        and eax, byte 0Fh
        shl eax, 2
        or dword [edx], eax
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadKeyboardPad                                                 101D9  96 PC
; 96 keyboard pad through the key binding table: Space/Alt (or ;/') buttons
; 80h/40h, arrows/keypad (or QWE/AD/ZXC) direction bits 4 up 8 down 10h right
; 20h left, F1-F10 bits 400h-80000h with an 18-tick repeat; same job as 95 PC
; ReadKeyboardPad
;-----------------------------------------------------------------------------
ReadKeyboardPad:
        push ebx
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        push byte 1Dh
        call KeyIsDown
        add esp, byte 4
        push byte 38h
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-04h], eax
        call KeyIsDown
        mov ecx, 80h
        mov ebx, 3
        add esp, byte 4
        mov edi, eax
        mov dword [byte ebp-08h], eax
        push esi
        mov edx, eax
        mov eax, dword [byte ebp-010h]
        call TestKeyBinding
        mov ecx, 40h
        mov ebx, 2
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 20h
        mov ebx, 4
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 4
        mov eax, dword [byte ebp-010h]
        push esi
        mov edx, edi
        mov ebx, ecx
        call TestKeyBinding
        mov ecx, 4
        mov ebx, 5
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 4
        mov ebx, 6
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 10h
        mov ebx, 6
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 20h
        mov ebx, 7
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 10h
        mov ebx, 8
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 8
        mov ebx, 9
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 20h
        mov ebx, 9
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 8
        mov ebx, 0Ah
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 8
        mov ebx, 0Bh
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 10h
        mov ebx, 0Bh
        push esi
        mov eax, dword [byte ebp-010h]
        mov edx, edi
        call TestKeyBinding
        mov edi, dword [esi]
        sar edi, 2
        mov eax, dword [KeyPadActive]
        and edi, byte 0Fh
        test eax, eax
        jbe short .1
        cmp eax, byte 1
        je short .3
        jmp short .5
.1:
        test edi, edi
        je short .5
        call GetTicks
        cmp edi, dword [LastKeyPollTick]
        jne short .2
        cmp eax, dword [KeyRepeatTick]
        jge short .2
        or byte [byte esi+02h], 10h
        mov dword [KeyRepeatTick], eax
.2:
        mov dword [KeyPadActive], 1
        jmp short .4
.3:
        test edi, edi
        jne short .4
        mov dword [KeyPadActive], edi
        call GetTicks
        add eax, byte 0Ah
        mov dword [KeyRepeatTick], eax
        jmp short .5
.4:
        mov dword [LastKeyPollTick], edi
.5:
        cmp dword [byte ebp-0Ch], byte 0
        je near .6
        call GetTicks
        cmp eax, dword [KeyPollTick]
        jle near ReadKeyboardPad_2D7
        mov ecx, 400h
        mov ebx, 0Ch
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 800h
        mov ebx, 0Dh
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 1000h
        mov ebx, 0Eh
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 2000h
        mov ebx, 0Fh
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 40000h
        mov ebx, 14h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [KeyPollTick], eax
        jmp near ReadKeyboardPad_2D7
.6:
        call GetTicks
        cmp eax, dword [MousePollTick]
        jle short ReadKeyboardPad_2D7
        mov ecx, 4000h
        mov ebx, 10h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 8000h
        mov ebx, 11h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 10000h
        mov ebx, 12h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 20000h
        mov ebx, 13h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        mov ecx, 80000h
        mov ebx, 15h
        push esi
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [MousePollTick], eax
ReadKeyboardPad_2D7:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        mov edx, 1
        call ReadKeyboardPad
        push byte 1Ch
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .7
        or byte [esi], 80h
.7:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadMousePad                                                    104DC  96 PC
; Mouse pad: function keys as the keyboard pad, then mousepollfn; direction
; from the mouse position against the screen edges/centre, mouse buttons ->
; pad buttons; same job as 95 PC ReadMousePad
;-----------------------------------------------------------------------------
ReadMousePad:
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        push byte 1Dh
        call KeyIsDown
        add esp, byte 4
        push byte 38h
        mov dword [byte ebp-04h], eax
        call KeyIsDown
        mov edi, eax
        add esp, byte 4
        cmp dword [byte ebp-08h], byte 0
        je near .1
        call GetTicks
        cmp eax, dword [KeyPollTick]
        jle near .2
        mov ecx, 400h
        mov ebx, 0Ch
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 800h
        mov ebx, 0Dh
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 1000h
        mov ebx, 0Eh
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 2000h
        mov ebx, 0Fh
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 40000h
        mov ebx, 14h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [KeyPollTick], eax
        jmp near .2
.1:
        call GetTicks
        cmp eax, dword [MousePollTick]
        jle short .2
        mov ecx, 4000h
        mov ebx, 10h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 8000h
        mov ebx, 11h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 10000h
        mov ebx, 12h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 20000h
        mov ebx, 13h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        mov ecx, 80000h
        mov ebx, 15h
        push esi
        mov eax, dword [byte ebp-04h]
        mov edx, edi
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [MousePollTick], eax
.2:
        call dword [mousepollfn]
        test byte [GsOptions+1], 20h
        je short .7
        cmp dword [mousex], 0A0h
        jge short .3
        or byte [esi], 20h
        jmp short .4
.3:
        cmp dword [mousex], 1E0h
        jle short .4
        or byte [esi], 10h
.4:
        cmp dword [mousey], byte 78h
        jge short .6
.5:
        or byte [esi], 4
        jmp short .11
.6:
        cmp dword [mousey], 168h
        jle short .11
        jmp short .10
.7:
        cmp dword [mousex], byte 50h
        jge short .8
        or byte [esi], 20h
        jmp short .9
.8:
        cmp dword [mousex], 0F0h
        jle short .9
        or byte [esi], 10h
.9:
        cmp dword [mousey], byte 32h
        jl short .5
        cmp dword [mousey], 96h
        jle short .11
.10:
        or byte [esi], 8
.11:
        test byte [optblock+2], 1
        je short .13
        test al, 2
        je short .12
        or byte [esi], 40h
.12:
        test al, 1
        je near ReadKeyboardPad_2D7
        jmp short .15
.13:
        test al, 1
        je short .14
        or byte [esi], 40h
.14:
        test al, 2
        je near ReadKeyboardPad_2D7
.15:
        or byte [esi], 80h
        jmp near ReadKeyboardPad_2D7
;-----------------------------------------------------------------------------
; ReadJoyPad                                                      106CC  96 PC
; Joystick n (0-3) pad: function keys as the keyboard pad, then direction and
; buttons from the byte of joystick bits for pad n in JoyPadBits; same job
; as 95 PC ReadJoyPad
;-----------------------------------------------------------------------------
ReadJoyPad:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov esi, edx
        mov dword [byte ebp-0Ch], ebx
        push byte 1Dh
        call KeyIsDown
        add esp, byte 4
        push byte 38h
        mov edi, eax
        call KeyIsDown
        mov dword [byte ebp-04h], eax
        add esp, byte 4
        cmp dword [byte ebp-0Ch], byte 0
        je near .1
        call GetTicks
        cmp eax, dword [KeyPollTick]
        jle near .2
        mov ecx, 400h
        mov ebx, 0Ch
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 800h
        mov ebx, 0Dh
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 1000h
        mov ebx, 0Eh
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 2000h
        mov ebx, 0Fh
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 40000h
        mov ebx, 14h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [KeyPollTick], eax
        jmp near .2
.1:
        call GetTicks
        cmp eax, dword [MousePollTick]
        jle short .2
        mov ecx, 4000h
        mov ebx, 10h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 8000h
        mov ebx, 11h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 10000h
        mov ebx, 12h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 20000h
        mov ebx, 13h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        mov ecx, 80000h
        mov ebx, 15h
        push esi
        mov edx, dword [byte ebp-04h]
        mov eax, edi
        call TestKeyBinding
        call GetTicks
        add eax, byte 12h
        mov dword [MousePollTick], eax
.2:
        mov ecx, dword [byte ebp-010h]
        mov eax, dword [JoyPadBits]
        shl ecx, 3
        sar eax, cl
        and eax, byte 3Fh
        shl eax, 2
        or dword [esi], eax
        mov eax, dword [esi]
        sar eax, 2
        mov edi, dword [byte ebp-010h]
        and eax, byte 0Fh
        shl edi, 2
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword edi+JoyPadActive]
        test eax, eax
        jbe short .3
        cmp eax, byte 1
        je short .5
        leave
        pop edi
        pop esi
        pop ecx
        ret
.3:
        cmp dword [byte ebp-08h], byte 0
        je short .7
        call GetTicks
        mov ecx, dword [byte ebp-08h]
        cmp ecx, dword [dword edi+kaufmfont]
        jne short .4
        cmp eax, dword [dword edi+JoyPollTicks]
        jge short .4
        or byte [byte esi+02h], 10h
        mov dword [dword edi+JoyPollTicks], eax
.4:
        mov esi, dword [byte ebp-010h]
        mov eax, dword [byte ebp-08h]
        mov dword [nosplit esi*4+JoyPadActive], 1
        mov dword [nosplit esi*4+kaufmfont], eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
.5:
        cmp dword [byte ebp-08h], byte 0
        jne short .6
        mov dword [dword edi+JoyPadActive], 0
        call GetTicks
        add eax, byte 0Ch
        mov dword [dword edi+JoyPollTicks], eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
.6:
        mov eax, dword [byte ebp-08h]
        mov dword [dword edi+kaufmfont], eax
.7:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; InitSlotTable                                108BB  96 PC, medium confidence
; Builds the controller slot table (SlotTable) from the game set-up
;-----------------------------------------------------------------------------
InitSlotTable:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov dword [LastKeyPollTick], 0
        mov dword [KeyPadActive], 0
        mov dword [SlotPollState], 0
        mov dword [kaufmfont], 0
        mov dword [MousePadActive], 0
        mov dword [JoyPadActive], 0
        call GetTicks
        mov dword [KeyPollTick], eax
        call GetTicks
        mov dword [MousePollTick], eax
        call GetInputDevices
        mov dword [InputDeviceMask], eax
        test byte [optblock+1], 80h
        je short .1
        mov dword [KeyBindingSet], KeyBindingsAlt
        jmp short .2
.1:
        mov dword [KeyBindingSet], KeyBindings
.2:
        mov ecx, 1Ch
        mov edi, SlotTable
        xor eax, eax
        rep stosb
        xor ebx, ebx
        xor edx, edx
        mov di, word [SlotsTwoPlayer]
        mov esi, dword [gameopts]
        xor eax, eax
        and edi, byte 1
.3:
        mov ecx, dword [gameopts]
        mov cx, word [byte ecx+eax+09h]
        mov word [dword edx+SlotDevice], cx
        movsx ecx, di
        mov byte [dword edx+SlotTable], 1
        test ecx, ecx
        je short .5
        movsx ecx, word [ControllerScreenMode]
        cmp ecx, byte 1
        jne short .4
        mov byte [SlotTable+0Eh], 2
        mov byte [SlotTable+15h], 2
        jmp short .5
.4:
        mov byte [SlotTable], 2
        mov byte [SlotTable+7], 2
.5:
        movsx ecx, word [dword edx+SlotDevice]
        cmp ecx, byte 1
        jne short .6
        mov word [dword eax+slotteam], 0
        jmp short .8
.6:
        cmp byte [byte esi+ebx+05h], 0
        je short .7
        mov word [dword eax+slotteam], 1
        jmp short .8
.7:
        mov word [dword eax+slotteam], 2
.8:
        inc eax
        inc eax
        inc ebx
        add edx, byte 7
        cmp ebx, byte 4
        jl near .3
        test byte [InputDeviceMask], 1
        je short .9
        push dword 0C8h
        push dword 140h
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        push byte 64h
        push dword 0A0h
        call MouseRead
        add esp, byte 8
        call dword [mousepollfn]
.9:
        mov ecx, 10h
        mov edi, SlotButtons
        xor eax, eax
        rep stosb
        mov ecx, 5Ah
        mov edi, InputRecordRing
        xor eax, eax
        rep stosb
        mov dword [InputRecordCount], 0
        mov dword [InputRecordIndex], 0
        mov dword [InputRecordHead], 0
        mov dword [GameLoopActive], 0
        jmp near ReadEscReplayKeys_52
;-----------------------------------------------------------------------------
; ResetInputSlots                                                 10A65  96 PC
; Clears SlotTable, re-centres the mouse on the screen when present, clears
; the input record ring and stops the game loop flag
;-----------------------------------------------------------------------------
ResetInputSlots:
        push ebx
        push ecx
        push edx
        push edi
        mov ecx, 1Ch
        mov edi, SlotTable
        xor eax, eax
        rep stosb
        test byte [InputDeviceMask], 1
        je short .1
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        mov eax, dword [dword_11F5C4]
        add esp, byte 10h
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        call MouseRead
        add esp, byte 8
        call dword [mousepollfn]
.1:
        mov ecx, 5Ah
        mov edi, InputRecordRing
        xor eax, eax
        mov dword [GameLoopActive], 0
        rep stosb
        mov dword [InputRecordCount], 0
        mov dword [InputRecordIndex], 0
        mov dword [InputRecordHead], 0
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PollControllers                                                 10AF1  96 PC
; Fills 4-entry slot table (7 bytes each) from keyboard/joystick by device
; word and setup slot team
;-----------------------------------------------------------------------------
PollControllers:
        push ebx
        push ecx
        push edx
        push esi
        enter 4, 0
        cmp word [Joy1Present], byte 0
        jne short .1
        cmp word [Joy2Present], byte 0
        jne short .1
        cmp word [Joy1RepeatState], byte 0
        jne short .1
        cmp word [Joy2RepeatState], byte 0
        je short .2
.1:
        call ReadJoystickBits
.2:
        mov eax, SlotWords
        call ReadEscReplayKeys
        cmp dword [dword_11D91F], byte 0
        je short .3
        mov edx, 1
        mov eax, SlotWords
        call ReadKeyboardPad
        push byte 1Ch
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .3
        or byte [SlotWords], 80h
.3:
        mov eax, dword [SlotWords]
        xor esi, esi
        xor ecx, ecx
        mov dword [byte ebp-04h], eax
.4:
        mov eax, dword [byte ebp-04h]
        mov dword [SlotWords], eax
        movsx eax, byte [dword ecx+SlotTable]
        cmp eax, byte 1
        jne near .17
        mov ax, word [dword ecx+SlotDevice]
        cmp ax, 8
        jb short .6
        jbe near .10
        cmp ax, 20h
        jb short .5
        jbe near .12
        cmp ax, 40h
        je near .13
        jmp near .14
.5:
        cmp ax, 10h
        je short .11
        jmp near .14
.6:
        cmp ax, 2
        jb near .14
        jbe short .7
        cmp ax, 4
        je short .8
        jmp short .14
.7:
        mov edx, dword [gameopts]
        mov eax, SlotWords
        movsx edx, byte [byte edx+esi+05h]
        call ReadMousePad
        jmp short .14
.8:
        mov edx, dword [gameopts]
        xor eax, eax
.9:
        movsx ebx, byte [byte edx+esi+05h]
        mov edx, SlotWords
        call ReadJoyPad
        jmp short .14
.10:
        mov edx, dword [gameopts]
        mov eax, 1
        jmp short .9
.11:
        mov edx, dword [gameopts]
        mov eax, 2
        jmp short .9
.12:
        mov edx, dword [gameopts]
        mov eax, 3
        jmp short .9
.13:
        mov edx, dword [gameopts]
        mov eax, SlotWords
        movsx edx, byte [byte edx+esi+05h]
        call ReadKeyboardPad
.14:
        cmp dword [dword_11D91F], byte 0
        jne short .16
        mov ebx, dword [SlotWords]
        sar ebx, 2
        mov edx, SlotWords
        and ebx, byte 0Fh
        and byte [SlotWords], 0C3h
        cmp ebx, byte 0Ah
        jle short .15
        xor ebx, ebx
.15:
        call CameraFacing
        movsx eax, al
        imul eax, byte 0Bh
        movsx ebx, byte [dword ebx+eax+EscReplayKeyMap]
        and ebx, byte 0Fh
        shl ebx, 2
        or dword [edx], ebx
.16:
        mov eax, dword [SlotWords]
        mov dword [dword ecx+SlotInput], eax
.17:
        inc esi
        add ecx, byte 7
        cmp esi, byte 4
        jl near .4
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ResetSlotButtons                                                10C9B  96 PC
; Clears SlotButtons and each slot's last direction; on a link game hands
; over to LinkResyncInput, else clears the input record ring
;-----------------------------------------------------------------------------
ResetSlotButtons:
        push ecx
        push edx
        push edi
        mov ecx, 10h
        mov edi, SlotButtons
        xor eax, eax
        rep stosb
        xor eax, eax
.1:
        add eax, byte 7
        mov dword [dword eax+LastKeyPollTick], 0
        cmp eax, byte 1Ch
        jne short .1
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .2
        call LinkResyncInput
        pop edi
        pop edx
        pop ecx
        ret
.2:
        mov ecx, 5Ah
        mov edi, InputRecordRing
        mov edx, dword [GameLoopActive]
        mov dword [GameLoopActive], eax
        rep stosb
        mov dword [InputRecordCount], 0
        mov dword [InputRecordIndex], 0
        mov dword [InputRecordHead], 0
        mov dword [GameLoopActive], edx
        pop edi
        pop edx
        pop ecx
        ret
;-----------------------------------------------------------------------------
; GetPressedDevice                                                10D17  96 PC
; Which device has a button down: 1 mouse, 2 joystick (bits 30h of any pad in
; JoyPadBits), 3 keyboard (key waiting), 0 none
;-----------------------------------------------------------------------------
GetPressedDevice:
        push ebx
        push ecx
        push edx
        call dword [mousepollfn]
        test al, 3
        je short .1
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        call ReadJoystickBits
        xor eax, eax
.2:
        mov edx, dword [JoyPadBits]
        mov cl, al
        sar edx, cl
        test dl, 30h
        je short .3
        mov eax, 2
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        add eax, byte 8
        cmp eax, byte 20h
        jl short .2
        call KbdGetKey
        test eax, eax
        je short .4
        mov eax, 3
.4:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripLinkLibrary                                                 10D66  96 PC
; (image, size): checks the GrIP GLL image ("DB" header, sizes, xor
; checksum), copies it to DOS memory (DPMI 100h) and calls its init (8490h);
; 0 on failure
;-----------------------------------------------------------------------------
GripLinkLibrary:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 28h
        mov dword [byte ebp-028h], eax
        mov dword [byte ebp-010h], edx
        cmp dword [GripLinked], byte 0
        je short .1
        mov dword [byte ebp-014h], 0
        jmp near .32
.1:
        cmp dword [byte ebp-028h], byte 0
        je short .2
        xor eax, eax
        mov ax, word [byte ebp-010h]
        cmp eax, byte 10h
        jge short .3
.2:
        mov dword [byte ebp-014h], 0
        jmp near .32
.3:
        mov eax, dword [byte ebp-028h]
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [eax]
        and eax, 0FFh
        cmp eax, byte 44h
        jne short .4
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+01h]
        and eax, 0FFh
        cmp eax, byte 42h
        je short .5
.4:
        mov dword [byte ebp-014h], 0
        jmp near .32
.5:
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+02h]
        and al, 0Fh
        xor dh, dh
        mov dl, al
        shl edx, 0Ch
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+03h]
        and al, 0Fh
        xor ah, ah
        shl eax, 8
        or edx, eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+04h]
        and al, 0Fh
        xor ah, ah
        shl eax, 4
        or eax, edx
        mov edx, dword [byte ebp-018h]
        mov dl, byte [byte edx+05h]
        and dl, 0Fh
        xor dh, dh
        or eax, edx
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+06h]
        and al, 0Fh
        xor ah, ah
        shl eax, 0Ch
        mov edx, eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+07h]
        and al, 0Fh
        xor ah, ah
        shl eax, 8
        or edx, eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+08h]
        and al, 0Fh
        xor ah, ah
        shl eax, 4
        or edx, eax
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+09h]
        and al, 0Fh
        xor ah, ah
        or edx, eax
        mov dword [byte ebp-08h], edx
        mov eax, dword [byte ebp-018h]
        mov al, byte [byte eax+0Ah]
        and al, 0Fh
        shl al, 4
        mov ah, al
        mov edx, dword [byte ebp-018h]
        mov al, byte [byte edx+0Bh]
        and al, 0Fh
        or ah, al
        mov byte [byte ebp-04h], ah
        xor edx, edx
        mov dx, word [byte ebp-0Ch]
        xor eax, eax
        mov ax, word [byte ebp-08h]
        add eax, edx
        shl eax, 4
        xor edx, edx
        mov dx, word [byte ebp-010h]
        cmp edx, eax
        jge short .6
        mov dword [byte ebp-014h], 0
        jmp near .32
.6:
        xor eax, eax
        mov ax, word [byte ebp-0Ch]
        shl eax, 4
        mov edx, dword [byte ebp-018h]
        add edx, eax
        mov dword [byte ebp-024h], edx
        mov dword [byte ebp-01Ch], 0
.7:
        xor eax, eax
        mov ax, word [byte ebp-08h]
        shl eax, 4
        cmp eax, dword [byte ebp-01Ch]
        jg short .9
        jmp short .10
.8:
        mov eax, dword [byte ebp-01Ch]
        inc dword [byte ebp-01Ch]
        jmp short .7
.9:
        mov eax, dword [byte ebp-024h]
        add eax, dword [byte ebp-01Ch]
        mov al, byte [eax]
        xor byte [byte ebp-04h], al
        jmp short .8
.10:
        cmp byte [byte ebp-04h], 0
        je short .11
        mov dword [byte ebp-014h], 0
        jmp near .32
.11:
        mov ecx, GripDataSeg
        mov ebx, dword [byte ebp-08h]
        mov eax, 100h
        int 31h
        mov ebx, 0
        jb short .12
        mov ebx, eax
        shl ebx, 4
        mov word [ecx], dx
.12:
        mov dword [byte ebp-020h], ebx
        cmp dword [byte ebp-020h], byte 0
        jne short .13
        mov dword [byte ebp-014h], 0
        jmp near .32
.13:
        mov dword [byte ebp-01Ch], 0
.14:
        xor eax, eax
        mov ax, word [byte ebp-08h]
        shl eax, 2
        cmp eax, dword [byte ebp-01Ch]
        jg short .16
        jmp short .17
.15:
        mov eax, dword [byte ebp-01Ch]
        inc dword [byte ebp-01Ch]
        jmp short .14
.16:
        mov edx, dword [byte ebp-01Ch]
        shl edx, 2
        add edx, dword [byte ebp-024h]
        mov eax, dword [byte ebp-01Ch]
        shl eax, 2
        add eax, dword [byte ebp-020h]
        mov edx, dword [edx]
        mov dword [eax], edx
        jmp short .15
.17:
        mov eax, 0
        mov ecx, 1
        int 31h
        jae short .18
        xor eax, eax
.18:
        mov word [GripResult], ax
        cmp word [GripResult], byte 0
        jne short .20
        mov dx, word [GripDataSeg]
        mov eax, 101h
        int 31h
        jb short .19
        xor eax, eax
.19:
        mov dword [byte ebp-014h], 0
        jmp near .32
.20:
        mov esi, dword [byte ebp-08h]
        shl esi, 4
        mov edx, dword [byte ebp-020h]
        mov bx, word [GripResult]
        mov ecx, edx
        shr ecx, 10h
        mov eax, 7
        int 31h
        jb short .21
        mov edx, esi
        dec edx
        xor ecx, ecx
        mov eax, 8
        int 31h
        jb short .21
        xor eax, eax
.21:
        test al, al
        je short .23
        mov bx, word [GripResult]
        mov eax, 1
        int 31h
        setb al
        mov dx, word [GripDataSeg]
        mov eax, 101h
        int 31h
        jb short .22
        xor eax, eax
.22:
        mov dword [byte ebp-014h], 0
        jmp near .32
.23:
        mov bx, word [GripResult]
        mov cx, cs
        lar ecx, ecx
        shr cx, 8
        mov eax, 9
        int 31h
        setb al
        test al, al
        je short .25
        mov bx, word [GripResult]
        mov eax, 1
        int 31h
        setb al
        mov dx, word [GripDataSeg]
        mov eax, 101h
        int 31h
        jb short .24
        xor eax, eax
.24:
        mov dword [byte ebp-014h], 0
        jmp near .32
.25:
        mov dword [byte ebp-01Ch], 0
.26:
        cmp dword [byte ebp-01Ch], byte 0Eh
        jb short .28
        jmp short .29
.27:
        mov eax, dword [byte ebp-01Ch]
        inc dword [byte ebp-01Ch]
        jmp short .26
.28:
        mov eax, dword [byte ebp-024h]
        add eax, dword [byte ebp-01Ch]
        mov dl, byte [eax]
        mov eax, dword [byte ebp-01Ch]
        mov byte [dword eax+GripLinkByte], dl
        jmp short .27
.29:
        mov word [GripLinkStatus], 0
        mov ax, word [GripResult]
        mov word [GripDriverSeg], ax
        mov ax, word [GripResult]
        mov word [GripLibSeg], ax
        mov eax, dword [byte ebp-020h]
        mov word [byte eax+012h], 0
        mov eax, dword [byte ebp-020h]
        mov word [byte eax+016h], 0
        mov eax, dword [byte ebp-020h]
        mov word [byte eax+010h], 0
        mov dx, word [GripDataSeg]
        mov eax, dword [byte ebp-020h]
        mov word [byte eax+014h], dx
        mov ax, 8490h
        call far [GripFarCall]
        test ax, ax
        jne short .31
        mov bx, word [GripResult]
        mov eax, 1
        int 31h
        setb al
        mov dx, word [GripDataSeg]
        mov eax, 101h
        int 31h
        jb short .30
        xor eax, eax
.30:
        mov dword [byte ebp-014h], 0
        jmp short .32
.31:
        mov dword [GripLinked], 1
        mov dword [byte ebp-014h], 1
.32:
        mov eax, dword [byte ebp-014h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripUnlinkLibrary                                               11107  96 PC
; Calls the GrIP library's unlink (8491h) and frees its DOS memory (DPMI
; 101h); 1 when done
;-----------------------------------------------------------------------------
GripUnlinkLibrary:
        push ebx
        push ecx
        push edx
        push esi
        push edi
GripUnlinkLibrary_5:
        push ebp
        mov ebp, esp
        sub esp, 4
        cmp dword [GripLinked], byte 0
        jne short .1
        mov dword [byte ebp-04h], 0
        jmp short .5
.1:
        mov ax, 8491h
        call far [GripFarCall]
        mov bx, word [GripResult]
        mov eax, 1
        int 31h
        setb al
        test al, al
        je short .2
        mov dword [byte ebp-04h], 0
        jmp short .5
.2:
        mov dx, word [GripDataSeg]
        mov eax, 101h
        int 31h
        jb short .3
        xor eax, eax
.3:
        test al, al
        je short .4
        mov dword [byte ebp-04h], 0
        jmp short .5
.4:
        mov dword [GripLinked], 0
        mov dword [byte ebp-04h], 1
.5:
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetGripButtonMap                             1118B  96 PC, medium confidence
; Copies 4 pairs of button masks (bytes) into GripShootMap+4 / GripPassMap+4
; (shoot / pass masks per GrIP pad)
;-----------------------------------------------------------------------------
SetGripButtonMap:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        mov dword [byte ebp-08h], eax
        mov dword [byte ebp-04h], 0
.1:
        cmp dword [byte ebp-04h], byte 4
        jl short .3
        jmp short .4
.2:
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        jmp short .1
.3:
        mov eax, dword [byte ebp-04h]
        add eax, eax
        add eax, dword [byte ebp-08h]
        movsx edx, byte [eax]
        mov eax, dword [byte ebp-04h]
        shl eax, 2
        mov dword [dword eax+GripShootMap+4], edx
        mov eax, dword [byte ebp-04h]
        add eax, eax
        add eax, dword [byte ebp-08h]
        movsx edx, byte [byte eax+01h]
        mov eax, dword [byte ebp-04h]
        shl eax, 2
        mov dword [dword eax+GripPassMap+4], edx
        jmp short .2
.4:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetGripButtonMap                             111ED  96 PC, medium confidence
; Copies the 4 pairs of GrIP button masks back out to a byte array (inverse
; of SetGripButtonMap)
;-----------------------------------------------------------------------------
GetGripButtonMap:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        mov dword [byte ebp-08h], eax
        mov dword [byte ebp-04h], 0
.1:
        cmp dword [byte ebp-04h], byte 4
        jl short .3
        jmp short .4
.2:
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        jmp short .1
.3:
        mov edx, dword [byte ebp-04h]
        shl edx, 2
        mov eax, dword [byte ebp-04h]
        add eax, eax
        add eax, dword [byte ebp-08h]
        mov dl, byte [dword edx+GripShootMap+4]
        mov byte [eax], dl
        mov edx, dword [byte ebp-04h]
        shl edx, 2
        mov eax, dword [byte ebp-04h]
        add eax, eax
        add eax, dword [byte ebp-08h]
        mov dl, byte [dword edx+GripPassMap+4]
        mov byte [byte eax+01h], dl
        jmp short .2
.4:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadGripLibrary                                                 1124D  96 PC
; Finds GRIP.GLL on the GRIP and PATH environment variables or in C:\GRIP\,
; reads it (at most 32 KB) and links it with GripLinkLibrary; failure clears
; GripLibHandle
;-----------------------------------------------------------------------------
LoadGripLibrary:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 90h
        mov byte [dword ebp-090h], 0
        lea ebx, [dword ebp-090h]
        mov edx, str_GRIP
        mov eax, str_GRIPGLL
        call _searchenv_
        cmp byte [dword ebp-090h], 0
        jne short .1
        lea ebx, [dword ebp-090h]
        mov edx, str_PATH
        mov eax, str_GRIPGLL
        call _searchenv_
.1:
        cmp byte [dword ebp-090h], 0
        jne short .2
        mov edx, str_CGRIP
        lea eax, [dword ebp-090h]
        call strcpy_
        mov edx, str_GRIPGLL
        lea eax, [dword ebp-090h]
        call strcat_
.2:
        mov edx, str_Rb2
        lea eax, [dword ebp-090h]
        call fopen_
        mov dword [byte ebp-010h], eax
        cmp dword [byte ebp-010h], byte 0
        je near .6
        mov ebx, 2
        xor edx, edx
        mov eax, dword [byte ebp-010h]
        call fseek_
        mov eax, dword [byte ebp-010h]
        call ftell_
        mov dword [byte ebp-0Ch], eax
        cmp dword [byte ebp-0Ch], 8000h
        jle short .3
        mov eax, dword [byte ebp-010h]
        call fclose_
        jmp short .6
.3:
        mov eax, dword [byte ebp-0Ch]
        call _nmalloc_
        mov dword [byte ebp-08h], eax
        cmp dword [byte ebp-08h], byte 0
        jne short .4
        mov eax, dword [byte ebp-010h]
        call fclose_
        jmp short .6
.4:
        xor ebx, ebx
        xor edx, edx
        mov eax, dword [byte ebp-010h]
        call fseek_
        mov ecx, dword [byte ebp-010h]
        mov ebx, dword [byte ebp-0Ch]
        mov edx, 1
        mov eax, dword [byte ebp-08h]
        call fread_
        mov eax, dword [byte ebp-010h]
        call fclose_
        xor edx, edx
        mov dx, word [byte ebp-0Ch]
        mov eax, dword [byte ebp-08h]
        call GripLinkLibrary
        test ax, ax
        je short .5
        mov dword [GripLibHandle], 0
.5:
        mov eax, dword [byte ebp-08h]
        call _nfree_
.6:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripScanSlots                                                   11378  96 PC
; After the GrIP library is up: reads the connected-slot mask (84B0h) and for
; each slot its class/info (84D0h/84D1h, 84B1h/84B3h/84B4h): button counts
; and axis ranges
;-----------------------------------------------------------------------------
GripScanSlots:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 20h
        mov dword [byte ebp-08h], 0
.1:
        cmp dword [byte ebp-08h], byte 78h
        jl short .3
        jmp short .4
.2:
        mov eax, dword [byte ebp-08h]
        inc dword [byte ebp-08h]
        jmp short .1
.3:
        xor edx, edx
        mov ax, 84A0h
        call far [GripFarCall]
        jmp short .2
.4:
        mov dword [GripSlotsScanned], 0
        mov ax, 84B0h
        call far [GripFarCall]
        mov dword [GripSlotMask], eax
        mov dword [byte ebp-08h], 1
.5:
        cmp dword [byte ebp-08h], byte 5
        jl short .7
        jmp near .19
.6:
        mov eax, dword [byte ebp-08h]
        inc dword [byte ebp-08h]
        jmp short .5
.7:
        mov cl, byte [byte ebp-08h]
        mov eax, dword [GripSlotMask]
        shr eax, cl
        test al, 1
        je near .18
        mov eax, dword [byte ebp-08h]
        dec eax
        imul eax, byte 14h
        mov edi, GripSlotTypes
        add edi, eax
        mov bh, byte [byte ebp-08h]
        mov ax, 84D0h
        call far [GripFarCall]
        mov dword [edi], ebx
        mov dword [byte edi+04h], ecx
        mov dword [byte edi+08h], edx
        mov dword [byte edi+0Ch], esi
        mov eax, dword [byte ebp-08h]
        dec eax
        imul eax, byte 14h
        mov edi, GripSlotNames
        add edi, eax
        mov bh, byte [byte ebp-08h]
        mov ax, 84D1h
        call far [GripFarCall]
        mov dword [edi], ebx
        mov dword [byte edi+04h], ecx
        mov dword [byte edi+08h], edx
        mov dword [byte edi+0Ch], esi
        mov edi, dword [byte ebp-08h]
        add edi, edi
        mov word [dword edi+GripSlotIds], ax
        mov dword [byte ebp-0Ch], 1
        mov bh, byte [byte ebp-08h]
        mov ax, 84B1h
        call far [GripFarCall]
        test al, 2
        je short .10
        mov bl, 1
        mov bh, byte [byte ebp-08h]
        mov ax, 84B3h
        call far [GripFarCall]
        mov bl, al
        mov eax, dword [byte ebp-08h]
        inc bl
        mov byte [dword eax+GripSlotPresent-1], bl
        mov eax, dword [byte ebp-08h]
        mov al, byte [dword eax+GripSlotPresent-1]
        and eax, 0FFh
        cmp eax, byte 2
        jge short .8
        mov dword [byte ebp-0Ch], 0
        jmp short .9
.8:
        mov eax, dword [byte ebp-08h]
        shl eax, 2
        mov dword [dword eax+GripShootMap], 1
        mov eax, dword [byte ebp-08h]
        shl eax, 2
        mov dword [dword eax+GripPassMap], 2
.9:
        jmp short .11
.10:
        mov eax, dword [byte ebp-08h]
        mov byte [dword eax+GripSlotPresent-1], 0
        mov dword [byte ebp-0Ch], 0
.11:
        cmp dword [byte ebp-0Ch], byte 0
        je short .12
        mov bh, byte [byte ebp-08h]
        mov ax, 84B1h
        call far [GripFarCall]
        test al, 4
        jne short .13
.12:
        jmp short .16
.13:
        mov bl, 2
        mov bh, byte [byte ebp-08h]
        mov ax, 84B3h
        call far [GripFarCall]
        mov byte [byte ebp-04h], al
        xor eax, eax
        mov al, byte [byte ebp-04h]
        cmp eax, byte 1
        jge short .14
        mov dword [byte ebp-0Ch], 0
.14:
        cmp dword [byte ebp-0Ch], byte 0
        je short .15
        xor ch, ch
        mov bl, 2
        mov bh, byte [byte ebp-08h]
        mov ax, 84B4h
        call far [GripFarCall]
        mov edx, dword [byte ebp-08h]
        shl edx, 2
        mov word [dword edx+GripAxisMin], ax
        mov ch, 1
        mov bl, 2
        mov bh, byte [byte ebp-08h]
        mov ax, 84B4h
        call far [GripFarCall]
        mov edx, dword [byte ebp-08h]
        shl edx, 2
        mov word [dword edx+GripAxisMax], ax
.15:
        jmp short .17
.16:
        mov dword [byte ebp-0Ch], 0
.17:
        cmp dword [byte ebp-0Ch], byte 0
        je short .18
        mov ecx, dword [byte ebp-08h]
        dec ecx
        mov eax, 1
        shl eax, cl
        mov ecx, eax
        or dword [GripSlotsScanned], ecx
        mov ecx, dword [byte ebp-08h]
        dec ecx
        imul ecx, byte 18h
        mov word [dword ecx+Joy1Present], 1
.18:
        jmp near .6
.19:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripReadSlots                                                   11589  96 PC
; Reads every connected GrIP slot's buttons (84C1h, against the shoot/pass
; masks) and axes (84C0h, scaled by the axis range) into a direction+button
; byte per pad in GripPadBits (double buffered by GripBufferSide)
;-----------------------------------------------------------------------------
GripReadSlots:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        cmp dword [GripSlotsScanned], byte 0
        je near .11
        mov ax, word [GripBufferSide]
        xor al, 1
        cwde
        shl eax, 2
        mov dword [dword eax+GripPadBits], 0
        mov dword [GripCurSlot], 0
.1:
        cmp dword [GripCurSlot], byte 4
        jl short .3
        jmp near .10
.2:
        inc dword [GripCurSlot]
        jmp short .1
.3:
        mov edx, 1
        mov ax, 84A0h
        call far [GripFarCall]
        mov dword [GripPadState], 0
        mov cl, byte [GripCurSlot]
        mov edx, 1
        shl edx, cl
        test dword [GripSlotsScanned], edx
        je near .9
        mov eax, dword [GripCurSlot]
        mov cl, byte [dword eax+GripSlotPresent]
        dec cl
        xor ch, ch
        mov bl, 1
        mov bh, byte [GripCurSlot]
        inc bh
        mov ax, 84C1h
        call far [GripFarCall]
        mov dword [GripButtonsRaw], eax
        mov eax, dword [GripCurSlot]
        shl eax, 2
        mov edx, dword [GripButtonsRaw]
        test dword [dword eax+GripShootMap+4], edx
        je short .4
        or byte [GripPadState], 10h
.4:
        mov eax, dword [GripCurSlot]
        shl eax, 2
        mov edx, dword [GripButtonsRaw]
        test dword [dword eax+GripPassMap+4], edx
        je short .5
        or byte [GripPadState], 20h
.5:
        xor ch, ch
        mov bl, 2
        mov bh, byte [GripCurSlot]
        inc bh
        mov ax, 84C0h
        call far [GripFarCall]
        mov word [GripAxesRaw], ax
        mov edx, dword [GripCurSlot]
        shl edx, 2
        xor ebx, ebx
        mov bx, word [dword edx+GripAxisMin+4]
        xor edx, edx
        mov dx, word [GripAxesRaw]
        lea edx, [edx+edx*2]
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [GripAxesRaw], ax
        xor eax, eax
        mov ax, word [GripAxesRaw]
        cmp eax, byte 1
        jle short .6
        or byte [GripPadState], 4
        jmp short .7
.6:
        cmp word [GripAxesRaw], byte 0
        jne short .7
        or byte [GripPadState], 8
.7:
        mov ch, 1
        mov bl, 2
        mov bh, byte [GripCurSlot]
        inc bh
        mov ax, 84C0h
        call far [GripFarCall]
        mov word [GripAxesRaw], ax
        mov edx, dword [GripCurSlot]
        shl edx, 2
        xor ebx, ebx
        mov bx, word [dword edx+GripAxisMax+4]
        xor edx, edx
        mov dx, word [GripAxesRaw]
        lea edx, [edx+edx*2]
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [GripAxesRaw], ax
        xor eax, eax
        mov ax, word [GripAxesRaw]
        cmp eax, byte 1
        jle short .8
        or byte [GripPadState], 1
        jmp short .9
.8:
        cmp word [GripAxesRaw], byte 0
        jne short .9
        or byte [GripPadState], 2
.9:
        mov ax, word [GripBufferSide]
        xor al, 1
        cwde
        shl eax, 2
        mov ecx, dword [GripCurSlot]
        shl ecx, 3
        mov edx, dword [GripPadState]
        shl edx, cl
        mov ecx, edx
        or dword [dword eax+GripPadBits], ecx
        jmp near .2
.10:
        xor byte [GripBufferSide], 1
.11:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripReadPadBits                                                 11782  96 PC
; GripReadSlots, then copies the current buffer of GrIP pad bits to
; JoyPadBits (0 when no GrIP pads)
;-----------------------------------------------------------------------------
GripReadPadBits:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        call GripReadSlots
        cmp dword [GripSlotsScanned], byte 0
        je short .1
        mov eax, dword [GripPadBitsPrev]
        sar eax, 10h
        shl eax, 2
        mov eax, dword [dword eax+GripPadBits]
        mov dword [JoyPadBits], eax
        jmp short .2
.1:
        mov dword [JoyPadBits], 0
.2:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadAnalogJoysticks                          117C7  96 PC, medium confidence
; Reads the game-port joysticks (CalibrateJoystick), marks joystick 1/2 present
; (Joy1Present / Joy2Present), keeps calibration min/max/centre per axis on
; first use and while reading
;-----------------------------------------------------------------------------
ReadAnalogJoysticks:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        call CalibrateJoystick
        mov dword [byte ebp-04h], eax
        cmp dword [Joy1NeedsCalib], byte 0
        jne short .1
        cmp dword [Joy2NeedsCalib], byte 0
        je near .14
.1:
        mov eax, dword [JoyPortMask]
        and eax, byte 0Fh
        cmp eax, byte 0Fh
        jne short .2
        mov dword [byte ebp-08h], 2
        jmp short .3
.2:
        mov dword [byte ebp-08h], 1
.3:
        push dword [byte ebp-08h]
        call JoyResetCentres
        add esp, byte 4
        test byte [JoyPortMask], 3
        je short .5
        cmp dword [JoyAxisValues], byte 0
        jne short .4
        cmp dword [word_11F914], byte 0
        je short .5
.4:
        jmp short .6
.5:
        jmp short .7
.6:
        mov word [Joy1Present], 1
        jmp short .8
.7:
        mov word [Joy1Present], 0
.8:
        test byte [JoyPortMask], 0Ch
        je short .10
        cmp dword [word_11F918], byte 0
        jne short .9
        cmp dword [word_11F91C], byte 0
        je short .10
.9:
        jmp short .11
.10:
        jmp short .12
.11:
        mov word [Joy2Present], 1
        jmp short .13
.12:
        mov word [Joy2Present], 0
.13:
        mov word [Joy1RepeatState], 0
        mov word [Joy2RepeatState], 0
.14:
        cmp dword [Joy1NeedsCalib], byte 0
        je short .15
        mov ax, word [JoyAxisValues]
        mov word [Joy1MinX], ax
        mov ax, word [word_11F914]
        mov word [Joy1MinY], ax
        mov ax, word [JoyAxisValues]
        mov word [Joy1MaxX], ax
        mov ax, word [word_11F914]
        mov word [Joy1MaxY], ax
        mov ax, word [JoyAxisValues]
        mov word [Joy1CentreX], ax
        mov ax, word [word_11F914]
        mov word [Joy1CentreY], ax
        mov dword [Joy1NeedsCalib], 0
.15:
        cmp dword [Joy2NeedsCalib], byte 0
        je short .16
        mov ax, word [word_11F918]
        mov word [Joy2MinX], ax
        mov ax, word [word_11F91C]
        mov word [Joy2MinY], ax
        mov ax, word [word_11F918]
        mov word [Joy2MaxX], ax
        mov ax, word [word_11F91C]
        mov word [Joy2MaxY], ax
        mov ax, word [word_11F918]
        mov word [Joy2CentreX], ax
        mov ax, word [word_11F91C]
        mov word [Joy2CentreY], ax
        mov dword [Joy2NeedsCalib], 0
.16:
        mov eax, dword [Joy1MinX-2]
        sar eax, 10h
        cmp eax, dword [JoyAxisValues]
        jle short .17
        mov ax, word [JoyAxisValues]
        mov word [Joy1MinX], ax
.17:
        mov eax, dword [Joy1MinY]
        sar eax, 10h
        cmp eax, dword [JoyAxisValues]
        jge short .18
        mov ax, word [JoyAxisValues]
        mov word [Joy1MaxX], ax
.18:
        mov eax, dword [Joy1MinX]
        sar eax, 10h
        cmp eax, dword [word_11F914]
        jle short .19
        mov ax, word [word_11F914]
        mov word [Joy1MinY], ax
.19:
        mov eax, dword [Joy1MaxX]
        sar eax, 10h
        cmp eax, dword [word_11F914]
        jge short .20
        mov ax, word [word_11F914]
        mov word [Joy1MaxY], ax
.20:
        mov ax, word [JoyAxisValues]
        mov word [Joy1X], ax
        mov ax, word [word_11F914]
        mov word [Joy1Y], ax
        mov eax, dword [byte ebp-04h]
        or eax, 0FFFFFFFCh
        mov word [Joy1Buttons], ax
        not word [Joy1Buttons]
        mov eax, dword [Joy2MinX-2]
        sar eax, 10h
        cmp eax, dword [word_11F918]
        jle short .21
        mov ax, word [word_11F918]
        mov word [Joy2MinX], ax
.21:
        mov eax, dword [Joy2MinY]
        sar eax, 10h
        cmp eax, dword [word_11F918]
        jge short .22
        mov ax, word [word_11F918]
        mov word [Joy2MaxX], ax
.22:
        mov eax, dword [Joy2MinX]
        sar eax, 10h
        cmp eax, dword [word_11F91C]
        jle short .23
        mov ax, word [word_11F91C]
        mov word [Joy2MinY], ax
.23:
        mov eax, dword [Joy2MaxX]
        sar eax, 10h
        cmp eax, dword [word_11F91C]
        jge short .24
        mov ax, word [word_11F91C]
        mov word [Joy2MaxY], ax
.24:
        mov ax, word [word_11F918]
        mov word [Joy2X], ax
        mov ax, word [word_11F91C]
        mov word [Joy2Y], ax
        mov eax, dword [byte ebp-04h]
        sar eax, 2
        or eax, byte 0FFFFFFFCh
        not eax
        mov word [Joy2Buttons], ax
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadJoystickBits                                                11A88  96 PC
; The joystick bits of every pad in JoyPadBits: from GrIP (GripReadPadBits)
; when the GrIP library is up, else from the analog joysticks against their
; centre (+-7Ch dead zone)
;-----------------------------------------------------------------------------
ReadJoystickBits:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        cmp dword [GripLibHandle], byte 0
        jle short .1
        call GripReadPadBits
        jmp near .47
.1:
        call ReadAnalogJoysticks
        mov dword [JoyPadBits], 0
        cmp word [Joy1Present], byte 0
        je near .24
        mov dword [byte ebp-08h], 0
        mov ax, word [Joy1Present]
        or al, 6
        cwde
        cmp eax, byte 6
        jne short .2
        mov dword [byte ebp-08h], 1
        jmp near .10
.2:
        mov ax, word [Joy1Present]
        or al, 6
        cwde
        cmp eax, byte 2
        jne short .5
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .3
        or byte [Joy1Present], 4
        mov dword [byte ebp-08h], 1
        jmp short .4
.3:
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .4
        or byte [JoyPadBits], 8
.4:
        jmp near .10
.5:
        mov ax, word [Joy1Present]
        or al, 6
        cwde
        cmp eax, byte 4
        jne short .8
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .6
        or byte [Joy1Present], 2
        mov dword [byte ebp-08h], 1
        jmp short .7
.6:
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .7
        or byte [JoyPadBits], 4
.7:
        jmp short .10
.8:
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .9
        or byte [Joy1Present], 2
        or byte [JoyPadBits], 8
        jmp short .10
.9:
        mov eax, dword [Joy1Y]
        sar eax, 10h
        mov edx, dword [Joy1Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .10
        or byte [Joy1Present], 4
        or byte [JoyPadBits], 4
.10:
        cmp dword [byte ebp-08h], byte 0
        je short .12
        mov edx, dword [Joy1MinY]
        sar edx, 10h
        mov eax, dword [Joy1MinX-2]
        sar eax, 10h
        sub edx, eax
        cmp edx, 0F8h
        jle short .12
        mov edx, dword [Joy1MinY]
        sar edx, 10h
        mov eax, dword [Joy1MinX-2]
        sar eax, 10h
        add eax, edx
        sar eax, 1
        mov dword [byte ebp-08h], eax
        mov edx, dword [Joy1Present]
        sar edx, 10h
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        cmp edx, eax
        jge short .11
        or byte [JoyPadBits], 8
        jmp short .12
.11:
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        add eax, dword [byte ebp-08h]
        mov edx, dword [Joy1Present]
        sar edx, 10h
        cmp edx, eax
        jle short .12
        or byte [JoyPadBits], 4
.12:
        mov dword [byte ebp-08h], 0
        mov ax, word [Joy1Present]
        or al, 18h
        cwde
        cmp eax, byte 18h
        jne short .13
        mov dword [byte ebp-08h], 1
        jmp near .21
.13:
        mov ax, word [Joy1Present]
        or al, 18h
        cwde
        cmp eax, byte 8
        jne short .16
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .14
        or byte [Joy1Present], 10h
        mov dword [byte ebp-08h], 1
        jmp short .15
.14:
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .15
        or byte [JoyPadBits], 1
.15:
        jmp near .21
.16:
        mov ax, word [Joy1Present]
        or al, 18h
        cwde
        cmp eax, byte 10h
        jne short .19
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .17
        or byte [Joy1Present], 8
        mov dword [byte ebp-08h], 1
        jmp short .18
.17:
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .18
        or byte [JoyPadBits], 2
.18:
        jmp short .21
.19:
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .20
        or byte [Joy1Present], 8
        or byte [JoyPadBits], 1
        jmp short .21
.20:
        mov eax, dword [Joy1CentreX]
        sar eax, 10h
        mov edx, dword [Joy1X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .21
        or byte [Joy1Present], 10h
        or byte [JoyPadBits], 2
.21:
        cmp dword [byte ebp-08h], byte 0
        je short .23
        mov edx, dword [Joy1MaxX]
        sar edx, 10h
        mov eax, dword [Joy1MinX]
        sar eax, 10h
        sub edx, eax
        cmp edx, 0F8h
        jle short .23
        mov edx, dword [Joy1MaxX]
        sar edx, 10h
        mov eax, dword [Joy1MinX]
        sar eax, 10h
        add eax, edx
        sar eax, 1
        mov dword [byte ebp-08h], eax
        mov edx, dword [Joy1X]
        sar edx, 10h
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        cmp edx, eax
        jge short .22
        or byte [JoyPadBits], 1
        jmp short .23
.22:
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        add eax, dword [byte ebp-08h]
        mov edx, dword [Joy1X]
        sar edx, 10h
        cmp edx, eax
        jle short .23
        or byte [JoyPadBits], 2
.23:
        mov eax, dword [Joy1CentreY]
        sar eax, 10h
        shl eax, 4
        or dword [JoyPadBits], eax
.24:
        cmp word [Joy2Present], byte 0
        je near .47
        mov dword [byte ebp-08h], 0
        mov ax, word [Joy2Present]
        or al, 6
        cwde
        cmp eax, byte 6
        jne short .25
        mov dword [byte ebp-08h], 1
        jmp near .33
.25:
        mov ax, word [Joy2Present]
        or al, 6
        cwde
        cmp eax, byte 2
        jne short .28
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .26
        or byte [Joy2Present], 4
        mov dword [byte ebp-08h], 1
        jmp short .27
.26:
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .27
        or byte [JoyPadBits+1], 8
.27:
        jmp near .33
.28:
        mov ax, word [Joy2Present]
        or al, 6
        cwde
        cmp eax, byte 4
        jne short .31
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .29
        or byte [Joy2Present], 2
        mov dword [byte ebp-08h], 1
        jmp short .30
.29:
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .30
        or byte [JoyPadBits+1], 4
.30:
        jmp short .33
.31:
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .32
        or byte [Joy2Present], 2
        or byte [JoyPadBits+1], 8
        jmp short .33
.32:
        mov eax, dword [Joy2Y]
        sar eax, 10h
        mov edx, dword [Joy2Present]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .33
        or byte [Joy2Present], 4
        or byte [JoyPadBits+1], 4
.33:
        cmp dword [byte ebp-08h], byte 0
        je short .35
        mov edx, dword [Joy2MinY]
        sar edx, 10h
        mov eax, dword [Joy2MinX-2]
        sar eax, 10h
        sub edx, eax
        cmp edx, 0F8h
        jle short .35
        mov edx, dword [Joy2MinY]
        sar edx, 10h
        mov eax, dword [Joy2MinX-2]
        sar eax, 10h
        add eax, edx
        sar eax, 1
        mov dword [byte ebp-08h], eax
        mov edx, dword [Joy2Present]
        sar edx, 10h
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        cmp edx, eax
        jge short .34
        or byte [JoyPadBits+1], 8
        jmp short .35
.34:
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        add eax, dword [byte ebp-08h]
        mov edx, dword [Joy2Present]
        sar edx, 10h
        cmp edx, eax
        jle short .35
        or byte [JoyPadBits+1], 4
.35:
        mov dword [byte ebp-08h], 0
        mov ax, word [Joy2Present]
        or al, 18h
        cwde
        cmp eax, byte 18h
        jne short .36
        mov dword [byte ebp-08h], 1
        jmp near .44
.36:
        mov ax, word [Joy2Present]
        or al, 18h
        cwde
        cmp eax, byte 8
        jne short .39
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .37
        or byte [Joy2Present], 10h
        mov dword [byte ebp-08h], 1
        jmp short .38
.37:
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .38
        or byte [JoyPadBits+1], 1
.38:
        jmp near .44
.39:
        mov ax, word [Joy2Present]
        or al, 18h
        cwde
        cmp eax, byte 10h
        jne short .42
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .40
        or byte [Joy2Present], 8
        mov dword [byte ebp-08h], 1
        jmp short .41
.40:
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .41
        or byte [JoyPadBits+1], 2
.41:
        jmp short .44
.42:
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        sub eax, byte 7Ch
        cmp edx, eax
        jge short .43
        or byte [Joy2Present], 8
        or byte [JoyPadBits+1], 1
        jmp short .44
.43:
        mov eax, dword [Joy2CentreX]
        sar eax, 10h
        mov edx, dword [Joy2X]
        sar edx, 10h
        add eax, byte 7Ch
        cmp edx, eax
        jle short .44
        or byte [Joy2Present], 10h
        or byte [JoyPadBits+1], 2
.44:
        cmp dword [byte ebp-08h], byte 0
        je short .46
        mov edx, dword [Joy2MaxX]
        sar edx, 10h
        mov eax, dword [Joy2MinX]
        sar eax, 10h
        sub edx, eax
        cmp edx, 0F8h
        jle short .46
        mov edx, dword [Joy2MaxX]
        sar edx, 10h
        mov eax, dword [Joy2MinX]
        sar eax, 10h
        add eax, edx
        sar eax, 1
        mov dword [byte ebp-08h], eax
        mov edx, dword [Joy2X]
        sar edx, 10h
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        cmp edx, eax
        jge short .45
        or byte [JoyPadBits+1], 1
        jmp short .46
.45:
        mov eax, dword [byte ebp-08h]
        sar eax, 1
        add eax, dword [byte ebp-08h]
        mov edx, dword [Joy2X]
        sar edx, 10h
        cmp edx, eax
        jle short .46
        or byte [JoyPadBits+1], 2
.46:
        mov eax, dword [Joy2CentreY]
        sar eax, 10h
        shl eax, 0Ch
        or dword [JoyPadBits], eax
.47:
        mov eax, dword [JoyPadBits]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripShutdown                                                    1214A  96 PC
; Atexit handler: closes the GrIP library (84A2h), then GripUnlinkLibrary
;-----------------------------------------------------------------------------
GripShutdown:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        cmp dword [GripLibHandle], byte 0
        jle short .1
        mov ax, 84A2h
        call far [GripFarCall]
        mov dword [GripLibHandle], 0
.1:
        cmp dword [GripLibHandle], byte 0
        jne short .2
        call GripUnlinkLibrary
.2:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InitGrip                                                        1218A  96 PC
; Joystick init: opens the GrIP library (84A1h) and scans its slots when
; present (registering GripShutdown with atexit), else reads the analog
; joysticks; returns the present mask (1/2/4/8)
;-----------------------------------------------------------------------------
InitGrip:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        mov dword [byte ebp-08h], 0
        cmp dword [Joy1NeedsCalib], byte 0
        je short .1
        cmp dword [Joy2NeedsCalib], byte 0
        jne short .2
.1:
        jmp near .6
.2:
        mov word [Joy1Present], 0
        mov word [Joy2Present], 0
        mov word [Joy1RepeatState], 0
        mov word [Joy2RepeatState], 0
        mov eax, GripShutdown
        push eax
        call AddExitHandler
        add esp, byte 4
        mov dword [GripSlotsScanned], 0
        cmp dword [GripLibHandle], byte 0
        jle short .3
        mov ax, 84A2h
        call far [GripFarCall]
        mov dword [GripLibHandle], 0
.3:
        cmp dword [GripLibHandle], byte 0
        jl short .4
        mov ax, 84A1h
        call far [GripFarCall]
        and eax, 0FFFFh
        mov dword [GripLibHandle], eax
.4:
        cmp dword [GripLibHandle], byte 0
        jle short .5
        call GripScanSlots
        mov dword [Joy2NeedsCalib], 0
        mov eax, dword [Joy2NeedsCalib]
        mov dword [Joy1NeedsCalib], eax
        jmp short .6
.5:
        call ReadJoystickBits
.6:
        mov dword [byte ebp-08h], 0
        cmp word [Joy1Present], byte 0
        je short .7
        or dword [byte ebp-08h], byte 1
.7:
        cmp word [Joy2Present], byte 0
        je short .8
        or dword [byte ebp-08h], byte 2
.8:
        cmp word [Joy1RepeatState], byte 0
        je short .9
        or dword [byte ebp-08h], byte 4
.9:
        cmp word [Joy2RepeatState], byte 0
        je short .10
        or dword [byte ebp-08h], byte 8
.10:
        mov eax, dword [byte ebp-08h]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
