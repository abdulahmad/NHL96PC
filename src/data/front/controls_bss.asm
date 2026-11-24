; BSS of front/controls (src/front/controls).
bits 32
%include "hockey.inc"
section s_151598 nobits alloc noexec write align=1
global kaufmfont, SlotPollState, SlotWords, LastKeyPollTick, SlotTable, SlotDevice, SlotInput, KeyBindingSet
global InputRecordRing, GripPadBits, GripAxisMin, GripAxisMax, GripSlotNames, GripShootMap, GripPassMap, GripSlotTypes
global Joy1State, Joy1MinX, Joy1MinY, Joy1MaxX, Joy1MaxY, Joy1Present, Joy1X, Joy1Y
global Joy1CentreX, Joy1CentreY, Joy1Buttons, Joy2State, Joy2MinX, Joy2MinY, Joy2MaxX, Joy2MaxY
global Joy2Present, Joy2X, Joy2Y, Joy2CentreX, Joy2CentreY, Joy2Buttons, Joy1RepeatState, Joy2RepeatState
global GripSlotIds, GripSlotMask, GripSlotPresent, JoyPadBits, GripLinkByte, GripLinkStatus, GripDriverSeg, GripFarCall
global GripLibSeg, GripDataSeg, GripResult, GripButtonsRaw, GripAxesRaw, GripPadState, GripCurSlot
kaufmfont:                                      ; used by GusRunInitTable, InitSlotTable, ReadJoyPad ...
        resb 4
SlotPollState:                                  ; Controller slot poll state, cleared by InitSlotTable; used
                                                ; by InitSlotTable
        resb 12
SlotWords:                                      ; 8 words: high byte device (bits 0-2) and team (bit 7), low
                                                ; byte buttons; used by PollControllers
        resb 8
LastKeyPollTick:                                ; Tick of the last keyboard pad read; used by InitSlotTable,
                                                ; ReadKeyboardPad, ResetSlotButtons
        resb 4
SlotTable:                                      ; 4 entries x 7 bytes: on byte, device word, buttons dword;
                                                ; used by InitSlotTable, PollControllers, ResetInputSlots
        resb 1
SlotDevice:                                     ; SlotTable record +1: controller device of the slot (7-byte
                                                ; records); used by DrawGameFrame, InitSlotTable,
                                                ; PollControllers
        resb 2
SlotInput:                                      ; SlotTable record +3: the slot's input bits for this frame
                                                ; (sent over the link); used by InputRecordTimer,
                                                ; LinkExchangeInput, PollControllers
        resb 4
        resb 3
        resb 4
        resb 3
        resb 4
        resb 3
        resb 4
KeyBindingSet:                                  ; Active keyboard binding set (KeyBindingsAlt with the
                                                ; alternate option, else KeyBindings); used by InitSlotTable,
                                                ; TestKeyBinding
        resb 4
InputRecordRing:                                ; ring of 5 records x 0x12 bytes; used by Gameloop_inputcheck,
                                                ; InitSlotTable, InputRecordTimer ...
        resb 4
        resb 4
        resb 4
        resb 4
        resb 76
GripPadBits:                                    ; GrIP: direction and button bits per pad; used by
                                                ; GripReadPadBits, GripReadSlots
        resb 4
GripAxisMin:                                    ; GrIP: axis range low word per slot (4 bytes per slot); used
                                                ; by GripReadSlots, GripScanSlots
        resb 2
GripAxisMax:                                    ; GrIP: axis range high word per slot; used by GripReadSlots,
                                                ; GripScanSlots
        resb 2
        resb 2
        resb 14
GripSlotNames:                                  ; GrIP: slot name strings, shown on the pad setup screen; used
                                                ; by GripScanSlots, GripSetupScreen
        resb 76
GripShootMap:                                   ; GrIP: shoot button map per slot; used by GetGripButtonMap,
                                                ; GripReadSlots, GripScanSlots ...
        resb 4
        resb 12
GripPassMap:                                    ; GrIP: pass button map per slot; used by GetGripButtonMap,
                                                ; GripReadSlots, GripScanSlots ...
        resb 4
        resb 16
GripSlotTypes:                                  ; GrIP: slot type strings, shown on the pad setup screen; used
                                                ; by GripScanSlots, GripSetupScreen
        resb 80
Joy1State:                                      ; Joystick 1 state block (18h bytes); used by GripSetupScreen,
                                                ; JoystickTestScreen
        resb 2
        resb 2
Joy1MinX:                                       ; Joystick 1 calibration: minimum x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy1MinY:                                       ; Joystick 1 calibration: minimum y; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy1MaxX:                                       ; Joystick 1 calibration: maximum x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy1MaxY:                                       ; Joystick 1 calibration: maximum y; used by
                                                ; ReadAnalogJoysticks
        resb 2
Joy1Present:                                    ; Joystick 1 connected; used by GripScanSlots, InitGrip,
                                                ; PollControllers ...
        resb 2
Joy1X:                                          ; Joystick 1 x reading; used by ReadAnalogJoysticks,
                                                ; ReadJoystickBits
        resb 2
Joy1Y:                                          ; Joystick 1 y reading; used by ReadAnalogJoysticks,
                                                ; ReadJoystickBits
        resb 2
Joy1CentreX:                                    ; Joystick 1 calibration: centre x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy1CentreY:                                    ; Joystick 1 calibration: centre y; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy1Buttons:                                    ; Joystick 1 buttons; used by ReadAnalogJoysticks
        resb 2
Joy2State:                                      ; Joystick 2 state block (18h bytes); used by GripSetupScreen
        resb 2
        resb 2
Joy2MinX:                                       ; Joystick 2 calibration: minimum x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy2MinY:                                       ; Joystick 2 calibration: minimum y; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy2MaxX:                                       ; Joystick 2 calibration: maximum x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy2MaxY:                                       ; Joystick 2 calibration: maximum y; used by
                                                ; ReadAnalogJoysticks
        resb 2
Joy2Present:                                    ; Joystick 2 connected; used by InitGrip, PollControllers,
                                                ; ReadAnalogJoysticks ...
        resb 2
Joy2X:                                          ; Joystick 2 x reading; used by ReadAnalogJoysticks,
                                                ; ReadJoystickBits
        resb 2
Joy2Y:                                          ; Joystick 2 y reading; used by ReadAnalogJoysticks,
                                                ; ReadJoystickBits
        resb 2
Joy2CentreX:                                    ; Joystick 2 calibration: centre x; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy2CentreY:                                    ; Joystick 2 calibration: centre y; used by
                                                ; ReadAnalogJoysticks, ReadJoystickBits
        resb 2
Joy2Buttons:                                    ; Joystick 2 buttons; used by ReadAnalogJoysticks
        resb 14
Joy1RepeatState:                                ; Joystick 1 button repeat state, cleared on calibration; used
                                                ; by InitGrip, PollControllers, ReadAnalogJoysticks
        resb 24
Joy2RepeatState:                                ; Joystick 2 button repeat state, cleared on calibration; used
                                                ; by InitGrip, PollControllers, ReadAnalogJoysticks
        resb 10
GripSlotIds:                                    ; GrIP: device id word per slot; used by GripScanSlots,
                                                ; GripSetupScreen
        resb 2
        resb 8
GripSlotMask:                                   ; GrIP: connected slots mask (84B0h); used by GripScanSlots
        resb 3
        resb 1
GripSlotPresent:                                ; GrIP: slot present byte per slot; used by DrawGripPads,
                                                ; GripReadSlots, GripScanSlots ...
        resb 4
JoyPadBits:                                     ; Combined pad bits of the joystick and GrIP pads; used by
                                                ; DrawGripPads, GetPressedDevice, GripReadPadBits ...
        resb 1
        resb 3
GripLinkByte:                                   ; Gravis GrIP link scratch byte; used by GripLinkLibrary
        resb 2
GripLinkStatus:                                 ; GrIP: library link status; used by GripLinkLibrary
        resb 4
GripDriverSeg:                                  ; Gravis GrIP driver segment; used by GripLinkLibrary
        resb 2
GripFarCall:                                    ; Gravis GrIP far call pointer; used by GripLinkLibrary,
                                                ; GripReadSlots, GripScanSlots ...
        resb 4
GripLibSeg:                                     ; GrIP: library segment; used by GripLinkLibrary
        resb 2
GripDataSeg:                                    ; Gravis GrIP data segment; used by GripLinkLibrary,
                                                ; GripUnlinkLibrary
        resb 2
GripResult:                                     ; Gravis GrIP call result; used by GripLinkLibrary,
                                                ; GripUnlinkLibrary
        resb 2
GripButtonsRaw:                                 ; GrIP: raw button bits of the slot being read (84C1h); used
                                                ; by GripReadSlots
        resb 4
GripAxesRaw:                                    ; GrIP: raw axis bits of the slot being read (84C0h); used by
                                                ; GripReadSlots
        resb 2
GripPadState:                                   ; GrIP: pad state bits of the slot being read; used by
                                                ; GripReadSlots
        resb 4
GripCurSlot:                                    ; GrIP: slot being read; used by GripReadSlots
        resb 4
