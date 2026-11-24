; Initialised data of front/pad_setup (src/front/pad_setup).
bits 32
%include "hockey.inc"
section s_117588 progbits alloc noexec write align=1
global JoyTestTime, JoyTestButtonMap
JoyTestTime:                                    ; joystick test time; used by UpdateJoystickTest
        db 00h,00h,00h,00h
JoyTestButtonMap:                               ; joystick test button map; used by UpdateJoystickTest
        db 00h,00h,01h,00h,05h,00h,00h,00h,03h,00h,02h,00h,04h,00h,00h,00h
        db 07h,00h,08h,00h,06h,00h,00h,00h
