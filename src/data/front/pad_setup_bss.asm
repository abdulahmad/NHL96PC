; BSS of front/pad_setup (src/front/pad_setup).
bits 32
%include "hockey.inc"
section s_158CBA nobits alloc noexec write align=1
global JoyTestButtonsLit, JoyTestAxisVals, JoyTestBmps, JoyTestDotX, JoyTestDotY, JoyTestArt, GripSetupSlots, GripSetupHeld
global GripSetupCounts, GripSetupTimers, GripSetupLastBits, JoyTestLastTick, JoyTestFrame, GripSetupTick, GripSetupCursor, LastButtonCode
global GripSetupSlot
JoyTestButtonsLit:                              ; Joystick test screen: lit flag per button; used by
                                                ; JoystickTestScreen, UpdateJoystickTest
        resb 2
JoyTestAxisVals:                                ; Joystick test screen: axis values shown; used by
                                                ; UpdateJoystickTest
        resb 4
JoyTestBmps:                                    ; Joystick test screen: bitmaps; used by JoystickTestScreen
        resb 12
JoyTestDotX:                                    ; Joystick test screen: x of the stick dot; used by
                                                ; JoystickTestScreen, UpdateJoystickTest
        resb 4
JoyTestDotY:                                    ; Joystick test screen: y of the stick dot; used by
                                                ; JoystickTestScreen, UpdateJoystickTest
        resb 4
JoyTestArt:                                     ; Joystick test screen: art pieces; used by JoystickTestScreen
        resb 86
GripSetupSlots:                                 ; GrIP set-up screen: per-slot state bytes; used by
                                                ; DrawGripPads, GripSetupScreen
        resb 1
        resb 1
        resb 1
        resb 7
GripSetupHeld:                                  ; GrIP set-up screen: button held per slot; used by
                                                ; DrawGripPads, GripSetupScreen
        resb 8
GripSetupCounts:                                ; GrIP set-up screen: press counts per slot; used by
                                                ; DrawGripPads, GripSetupScreen
        resb 8
GripSetupTimers:                                ; GrIP set-up screen: timers per slot; used by DrawGripPads,
                                                ; GripSetupScreen
        resb 2
        resb 14
GripSetupLastBits:                              ; GrIP set-up screen: last pad bits per slot; used by
                                                ; DrawGripPads, GripSetupScreen
        resb 16
JoyTestLastTick:                                ; Joystick test screen: tick of the last update; used by
                                                ; JoystickTestScreen, UpdateJoystickTest
        resb 4
JoyTestFrame:                                   ; Joystick test screen: frame counter; used by
                                                ; JoystickTestScreen, UpdateJoystickTest
        resb 4
GripSetupTick:                                  ; GrIP set-up screen: tick of the last update; used by
                                                ; GripSetupScreen
        resb 4
GripSetupCursor:                                ; GrIP set-up screen: cursor; used by DrawGripPads,
                                                ; GripSetupScreen
        resb 4
LastButtonCode:                                 ; Last button code seen by the set-up screen and the goal
                                                ; light start; used by GripSetupScreen, StartGoalLight
        resb 2
GripSetupSlot:                                  ; GrIP set-up screen: slot being set up; used by DrawGripPads,
                                                ; GripSetupScreen
        resb 2
