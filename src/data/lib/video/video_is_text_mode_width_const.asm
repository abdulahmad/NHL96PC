; Strings and constants of src/lib/video/video_is_text_mode_width.asm, in link order.
bits 32
%include "hockey.inc"
section s_114180 progbits alloc noexec write align=1
global str_SaveText, str_Mouse
str_SaveText:                                   ; string 'Save Text'; used by SaveTextScreen
        db 053h,061h,076h,065h,020h,054h,065h,078h,074h,00h,00h,00h
str_Mouse:                                      ; string "mouse"
        db 06Dh,06Fh,075h,073h,065h,00h,069h,064h
