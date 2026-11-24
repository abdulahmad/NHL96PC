; Strings and constants of front/screen_art (src/front/screen_art), in link order.
bits 32
%include "hockey.inc"
section s_111248 progbits alloc noexec write align=1
global str_Pal7, str_CHECK, str_XBUT, str_MODEM, str_Y03d, str_Yhil, str_X03d, str_Xhil
global str_M03d, str_Mhil, str_TN02d
str_Pal7:                                       ; string '!pal'; used by LoadFrontEndArt
        db 021h,070h,061h,06Ch,00h
str_CHECK:                                      ; string 'CHECK'; used by LoadFrontEndArt
        db 043h,048h,045h,043h,04Bh,00h
str_XBUT:                                       ; string 'XBUT'; used by LoadFrontEndArt
        db 058h,042h,055h,054h,00h
str_MODEM:                                      ; string 'MODEM'; used by LoadFrontEndArt
        db 04Dh,04Fh,044h,045h,04Dh,00h
str_Y03d:                                       ; string 'y%03d'; used by LoadFrontEndArt
        db 079h,025h,030h,033h,064h,00h
str_Yhil:                                       ; string 'yhil'; used by LoadFrontEndArt
        db 079h,068h,069h,06Ch,00h
str_X03d:                                       ; string 'x%03d'; used by LoadFrontEndArt
        db 078h,025h,030h,033h,064h,00h
str_Xhil:                                       ; string 'xhil'; used by LoadFrontEndArt
        db 078h,068h,069h,06Ch,00h
str_M03d:                                       ; string 'm%03d'; used by LoadFrontEndArt
        db 06Dh,025h,030h,033h,064h,00h
str_Mhil:                                       ; string 'mhil'; used by LoadFrontEndArt
        db 06Dh,068h,069h,06Ch,00h
str_TN02d:                                      ; string 'TN%02d'; used by GetTeamNameArt
        db 054h,04Eh,025h,030h,032h,064h,00h,00h,00h
