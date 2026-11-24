; Strings and constants of pc/modem_game (src/pc/modem_game), in link order.
bits 32
%include "hockey.inc"
section s_11000C progbits alloc noexec write align=1
global str_HGwt, str_HFwt, str_LGwt, str_ABORT, str_X3, str_SHAD, str_PAL22
str_HGwt:                                       ; string 'HGwt'; used by ShowLinkWaitBox
        db 048h,047h,077h,074h,00h
str_HFwt:                                       ; string 'HFwt'; used by ShowLinkWaitBox
        db 048h,046h,077h,074h,00h
str_LGwt:                                       ; string 'LGwt'; used by ShowLinkWaitBox
        db 04Ch,047h,077h,074h,00h
str_ABORT:                                      ; string 'ABORT! '; used by LinkSync
        db 041h,042h,04Fh,052h,054h,021h,0Ah,00h
str_X3:                                         ; string 'X'; used by ModemChat
        db 058h,00h
str_SHAD:                                       ; string 'SHAD'; used by ModemChat
        db 053h,048h,041h,044h,00h
str_PAL22:                                      ; string 'PAL'; used by ModemChat
        db 050h,041h,04Ch,00h,00h,00h
