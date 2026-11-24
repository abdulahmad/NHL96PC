; Strings and constants of front/pad_setup (src/front/pad_setup), in link order.
bits 32
%include "hockey.inc"
section s_110730 progbits alloc noexec write align=1
global str_A, str_feB, str_GRIPCON, str_RGRIPCON, str_D3, str_Pal4, str_BKGD, str_LTD0
global str_BT00, str_BT01, str_BT02
str_A:                                          ; string 'A'; used by DrawGripPads, GripSetupScreen
        db 041h,00h
str_feB:                                        ; string 'B'; used by DrawGripPads, GripSetupScreen
        db 042h,00h
str_GRIPCON:                                    ; string 'GRIPCON'; used by GripSetupScreen
        db 047h,052h,049h,050h,043h,04Fh,04Eh,00h
str_RGRIPCON:                                   ; string 'RGRIPCON'; used by GripSetupScreen
        db 052h,047h,052h,049h,050h,043h,04Fh,04Eh,00h
str_D3:                                         ; string '%d'; used by GripSetupScreen
        db 025h,064h,00h
str_Pal4:                                       ; string '!pal'; used by JoystickTestScreen
        db 021h,070h,061h,06Ch,00h
str_BKGD:                                       ; string 'BKGD'; used by JoystickTestScreen
        db 042h,04Bh,047h,044h,00h
str_LTD0:                                       ; string 'LT%d0'; used by JoystickTestScreen
        db 04Ch,054h,025h,064h,030h,00h
str_BT00:                                       ; string 'BT00'; used by JoystickTestScreen
        db 042h,054h,030h,030h,00h
str_BT01:                                       ; string 'BT01'; used by JoystickTestScreen
        db 042h,054h,030h,031h,00h
str_BT02:                                       ; string 'BT02'; used by JoystickTestScreen
        db 042h,054h,030h,032h,00h,00h
