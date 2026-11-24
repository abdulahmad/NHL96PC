; Strings and constants of src/lib/ea/ea_debug_printf.asm, in link order.
bits 32
%include "hockey.inc"
section s_113438 progbits alloc noexec write align=1
global str_DBUGTXT, str_Wt, str_FILES, str_DATES, str_TIMES, str_CLOSED, str_TIMES2
str_DBUGTXT:                                    ; string "DBUG??.TXT"; used by DebugSetAttr
        db 044h,042h,055h,047h,03Fh,03Fh,02Eh,054h,058h,054h,00h,072h
str_Wt:                                         ; string "wt"; used by DebugSetAttr
        db 077h,074h,00h,06Eh
str_FILES:                                      ; string "FILE: %s "; used by DebugSetAttr
        db 046h,049h,04Ch,045h,03Ah,020h,025h,073h,0Ah,00h,069h,06Eh
str_DATES:                                      ; string "DATE: %s "; used by DebugSetAttr
        db 044h,041h,054h,045h,03Ah,020h,025h,073h,0Ah,00h,031h,02Ch
str_TIMES:                                      ; string "TIME: %s "; used by DebugSetAttr
        db 054h,049h,04Dh,045h,03Ah,020h,025h,073h,0Ah,0Ah,00h,079h
str_CLOSED:                                     ; string " CLOSED "; used by DebugSetAttr
        db 0Ah,043h,04Ch,04Fh,053h,045h,044h,0Ah,00h,069h,06Eh,074h
str_TIMES2:                                     ; string "TIME: %s "; used by DebugSetAttr
        db 054h,049h,04Dh,045h,03Ah,020h,025h,073h,0Ah,00h,02Ch,069h
