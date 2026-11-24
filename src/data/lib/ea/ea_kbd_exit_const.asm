; Strings and constants of src/lib/ea/ea_kbd_exit.asm, in link order.
bits 32
%include "hockey.inc"
section s_113E64 progbits alloc noexec write align=1
global str_EXITTODOSY, str_PAUSEPRESSANYKEY
str_EXITTODOSY:                                 ; string "EXIT TO DOS (Y/N)"; used by AskExitToDos
        db 045h,058h,049h,054h,020h,054h,04Fh,020h,044h,04Fh,053h,020h,028h,059h,02Fh,04Eh
        db 029h,00h,020h,020h
str_PAUSEPRESSANYKEY:                           ; string "PAUSE - PRESS ANY KEY TO RESUME"; used by
                                                ; PauseUntilKey
        db 050h,041h,055h,053h,045h,020h,02Dh,020h,050h,052h,045h,053h,053h,020h,041h,04Eh
        db 059h,020h,04Bh,045h,059h,020h,054h,04Fh,020h,052h,045h,053h,055h,04Dh,045h,00h
