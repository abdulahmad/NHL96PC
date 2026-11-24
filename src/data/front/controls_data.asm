; Initialised data of front/controls (src/front/controls).
bits 32
%include "hockey.inc"
section s_114B40 progbits alloc noexec write align=1
global InputDevicesFound, InputDevicesReady, MouseReady, InputDeviceMask, SlotJoyMap, KeyPollTick, MousePollTick, KeyRepeatTick
global JoyPollTicks, KeyPadActive, JoyPadActive, MousePadActive, SimSlotButtons, SlotButtons, InputRecordIndex, InputRecordHead
global InputRecordCount, KeyBindings, KeyBindingsAlt, EscReplayKeyMap, Joy1NeedsCalib, Joy2NeedsCalib, str_GRIPGLL, str_GRIP
global str_CGRIP, GripLinked, GripLibHandle, GripSlotsScanned, GripPadBitsPrev, GripBufferSide, SlotsTwoPlayer
InputDevicesFound:                              ; Input devices found by GetInputDevices; used by
                                                ; GetInputDevices, InitInputDevices
        db 00h,00h
InputDevicesReady:                              ; Input devices initialised; used by GetInputDevices,
                                                ; InitInputDevices
        db 00h,00h
MouseReady:                                     ; Mouse driver found and set up; used by InitInputDevices
        db 00h,00h,00h,00h
InputDeviceMask:                                ; Input device bits (bit 0 keyboard, then mouse, joysticks,
                                                ; GrIP); used by InitSlotTable, ResetInputSlots
        db 00h,00h,00h,00h
SlotJoyMap:                                     ; SlotToJoy: joystick number per slot code; used by SlotToJoy
        db 08h,00h,04h,08h,02h,01h,03h,08h,06h,07h,05h,08h,08h,08h,08h,00h
KeyPollTick:                                    ; Tick of the last keyboard read; used by InitSlotTable,
                                                ; ReadJoyPad, ReadKeyboardPad ...
        db 00h,00h,00h,00h
MousePollTick:                                  ; Tick of the last mouse read; used by InitSlotTable,
                                                ; ReadJoyPad, ReadKeyboardPad ...
        db 00h,00h,00h,00h
KeyRepeatTick:                                  ; Keyboard pad repeat tick; used by ReadKeyboardPad
        db 00h,00h,00h,00h
JoyPollTicks:                                   ; Tick of the last read per joystick; used by ReadJoyPad
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
KeyPadActive:                                   ; Keyboard pad in use this frame; used by InitSlotTable,
                                                ; ReadKeyboardPad
        db 00h,00h,00h,00h
JoyPadActive:                                   ; Joystick pad in use, per joystick; used by InitSlotTable,
                                                ; ReadJoyPad
        db 00h,00h,00h,00h
MousePadActive:                                 ; Mouse pad in use; used by InitSlotTable
        db 00h,00h,00h,00h,00h,00h,00h,00h
SimSlotButtons:                                 ; Slot buttons used while simulating frames; used by
                                                ; RunSimFrames
        db 00h,00h,00h,00h
SlotButtons:                                    ; the 4 slot button dwords of the current frame; used by
                                                ; Gameloop_inputcheck, HandleSlotButtons, InitSlotTable ...
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
InputRecordIndex:                               ; Input record ring index being replayed; used by
                                                ; Gameloop_inputcheck, InitSlotTable, LineupLoopFrame ...
        db 00h,00h,00h,00h
InputRecordHead:                                ; ring write index; used by InitSlotTable, InputRecordTimer,
                                                ; LinkExchangeInput ...
        db 00h,00h,00h,00h
InputRecordCount:                               ; records in ring (max 5); used by Gameloop_inputcheck,
                                                ; InitSlotTable, InputRecordTimer ...
        db 00h,00h,00h,00h
KeyBindings:                                    ; Default keyboard binding set; used by InitSlotTable
        db 00h,00h,01h,00h,00h,00h,013h,00h,00h,01h,038h,00h,00h,00h,039h,00h
        db 00h,00h,047h,00h,00h,00h,048h,00h,00h,00h,049h,00h,00h,00h,04Bh,00h
        db 00h,00h,04Dh,00h,00h,00h,04Fh,00h,00h,00h,050h,00h,00h,00h,051h,00h
        db 00h,00h,03Bh,00h,00h,00h,03Ch,00h,00h,00h,03Dh,00h,00h,00h,03Eh,00h
        db 00h,00h,03Fh,00h,00h,00h,040h,00h,00h,00h,041h,00h,00h,00h,042h,00h
        db 00h,00h,043h,00h,00h,00h,044h,00h
KeyBindingsAlt:                                 ; Alternate keyboard binding set; used by InitSlotTable
        db 00h,00h,01h,00h,00h,00h,013h,00h,00h,00h,027h,00h,00h,00h,028h,00h
        db 00h,00h,010h,00h,00h,00h,011h,00h,00h,00h,012h,00h,00h,00h,01Eh,00h
        db 00h,00h,020h,00h,00h,00h,02Ch,00h,00h,00h,02Dh,00h,00h,00h,02Eh,00h
        db 00h,00h,03Bh,00h,00h,00h,03Ch,00h,00h,00h,03Dh,00h,00h,00h,03Eh,00h
        db 00h,00h,03Fh,00h,00h,00h,040h,00h,00h,00h,041h,00h,00h,00h,042h,00h
        db 00h,00h,043h,00h,00h,00h,044h,00h
EscReplayKeyMap:                                ; ReadEscReplayKeys / PollControllers: key to pad bit map;
                                                ; used by PollControllers, ReadEscReplayKeys
        db 00h,01h,02h,00h,04h,05h,06h,00h,08h,09h,0Ah,00h,09h,06h,00h,05h
        db 01h,04h,00h,0Ah,08h,02h,00h,08h,04h,00h,01h,09h,05h,00h,02h,0Ah
        db 06h,00h,0Ah,05h,00h,09h,08h,01h,00h,06h,02h,04h,00h,02h,01h,00h
        db 08h,0Ah,09h,00h,04h,06h,05h,00h,06h,09h,00h,0Ah,02h,08h,00h,05h
        db 04h,01h,00h,04h,08h,00h,02h,06h,0Ah,00h,01h,05h,09h,00h,05h,0Ah
        db 00h,06h,04h,02h,00h,09h,01h,08h
Joy1NeedsCalib:                                 ; Joystick 1 calibration not done yet; used by
                                                ; GripSetupScreen, InitGrip, JoystickTestScreen ...
        db 01h,00h,00h,00h
Joy2NeedsCalib:                                 ; Joystick 2 calibration not done yet; used by
                                                ; GripSetupScreen, InitGrip, ReadAnalogJoysticks
        db 01h,00h,00h,00h
str_GRIPGLL:                                    ; string 'GRIP.GLL'; used by LoadGripLibrary
        db 047h,052h,049h,050h,02Eh,047h,04Ch,04Ch,00h
str_GRIP:                                       ; string 'GRIP'; used by LoadGripLibrary
        db 047h,052h,049h,050h,00h
str_CGRIP:                                      ; string 'C:\GRIP\'; used by LoadGripLibrary
        db 043h,03Ah,05Ch,047h,052h,049h,050h,05Ch,00h
GripLinked:                                     ; Gravis GrIP library linked; used by GripLinkLibrary,
                                                ; GripUnlinkLibrary
        db 00h,00h,00h,00h
GripLibHandle:                                  ; GrIP library handle, -1 when not loaded; used by
                                                ; ControlSetupScreen, GripShutdown, InitGrip ...
        db 0FFh,0FFh,0FFh,0FFh
GripSlotsScanned:                               ; GrIP slots have been scanned; used by GripReadPadBits,
                                                ; GripReadSlots, GripScanSlots ...
        db 00h,00h
GripPadBitsPrev:                                ; GrIP pad bits of the previous read; used by GripReadPadBits
        db 00h,00h
GripBufferSide:                                 ; GrIP pad bits buffer side (toggled each read); used by
                                                ; GripReadSlots
        db 00h,00h,00h,00h,00h
SlotsTwoPlayer:                                 ; Controller screen: two-player slot mode; used by
                                                ; ControllerScreen, DrawPauseButtons, GameOptionsScreen ...
        db 00h,00h
