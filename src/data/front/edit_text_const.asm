; Strings and constants of front/edit_text (src/front/edit_text), in link order.
bits 32
%include "hockey.inc"
section s_1102F8 progbits alloc noexec write align=1
global str_Temp3, str_Disp, str_W, str_X, str_space4
str_Temp3:                                      ; string 'temp'; used by EditText
        db 074h,065h,06Dh,070h,00h
str_Disp:                                       ; string 'disp'; used by EditText
        db 064h,069h,073h,070h,00h
str_W:                                          ; string 'W'; used by EditText
        db 057h,00h
str_X:                                          ; string 'X'; used by DrawBoxButton, EditText, MessageBox ...
        db 058h,00h
str_space4:                                     ; string ' '; used by EditText
        db 020h,00h
