; Strings and constants of src/lib/input/input_joystick_calibrate_screen.asm, in link order.
bits 32
%include "hockey.inc"
section s_113EE0 progbits alloc noexec write align=1
global str_CalibrateYourJoystickByU, str_ToMoveTheJoystickPositio, str_BelowToAllSquares, str_PressJoystickButtonWhenC
str_CalibrateYourJoystickByU:                   ; string 'Calibrate your joystick by using it'; used by
                                                ; JoystickCalibrateScreen
        db 043h,061h,06Ch,069h,062h,072h,061h,074h,065h,020h,079h,06Fh,075h,072h,020h,06Ah
        db 06Fh,079h,073h,074h,069h,063h,06Bh,020h,062h,079h,020h,075h,073h,069h,06Eh,067h
        db 020h,069h,074h,00h
str_ToMoveTheJoystickPositio:                   ; string 'to move the joystick position indicator'; used by
                                                ; JoystickCalibrateScreen
        db 074h,06Fh,020h,06Dh,06Fh,076h,065h,020h,074h,068h,065h,020h,06Ah,06Fh,079h,073h
        db 074h,069h,063h,06Bh,020h,070h,06Fh,073h,069h,074h,069h,06Fh,06Eh,020h,069h,06Eh
        db 064h,069h,063h,061h,074h,06Fh,072h,00h
str_BelowToAllSquares:                          ; string "below, to all squares"; used by
                                                ; JoystickCalibrateScreen
        db 062h,065h,06Ch,06Fh,077h,02Ch,020h,074h,06Fh,020h,061h,06Ch,06Ch,020h,073h,071h
        db 075h,061h,072h,065h,073h,00h,020h,079h
str_PressJoystickButtonWhenC:                   ; string 'Press joystick button when complete'; used by
                                                ; JoystickCalibrateScreen
        db 050h,072h,065h,073h,073h,020h,06Ah,06Fh,079h,073h,074h,069h,063h,06Bh,020h,062h
        db 075h,074h,074h,06Fh,06Eh,020h,077h,068h,065h,06Eh,020h,063h,06Fh,06Dh,070h,06Ch
        db 065h,074h,065h,00h
