; Strings and constants of engine/lines (src/engine/lines), in link order.
bits 32
%include "hockey.inc"
section s_110E44 progbits alloc noexec write align=1
global str_GloL, str_GloR, str_FhiL, str_FhiR, str_Pal30, str_ZONEMGR, str_ZM1ContactLance, str_ZM2ContactLance
global str_ZMOverflowContactLance
str_GloL:                                       ; string 'GloL'; used by RunAttractMode
        db 047h,06Ch,06Fh,04Ch,00h
str_GloR:                                       ; string 'GloR'; used by RunAttractMode
        db 047h,06Ch,06Fh,052h,00h
str_FhiL:                                       ; string 'FhiL'; used by RunAttractMode
        db 046h,068h,069h,04Ch,00h
str_FhiR:                                       ; string 'FhiR'; used by RunAttractMode
        db 046h,068h,069h,052h,00h
str_Pal30:                                      ; string '!pal'; used by LoadGamePalette
        db 021h,070h,061h,06Ch,00h,00h,00h,00h
str_ZONEMGR:                                    ; string "ZONEMGR"; used by InitZoneManager
        db 05Ah,04Fh,04Eh,045h,04Dh,047h,052h,00h
str_ZM1ContactLance:                            ; string 'ZM(1): Contact Lance!'; used by AddZonePiece
        db 05Ah,04Dh,028h,031h,029h,03Ah,020h,043h,06Fh,06Eh,074h,061h,063h,074h,020h,04Ch
        db 061h,06Eh,063h,065h,021h,00h
str_ZM2ContactLance:                            ; string 'ZM(2): Contact Lance!'; used by AddZonePiece
        db 05Ah,04Dh,028h,032h,029h,03Ah,020h,043h,06Fh,06Eh,074h,061h,063h,074h,020h,04Ch
        db 061h,06Eh,063h,065h,021h,00h
str_ZMOverflowContactLance:                     ; string 'ZM Overflow: Contact Lance!'; used by AddZone
        db 05Ah,04Dh,020h,04Fh,076h,065h,072h,066h,06Ch,06Fh,077h,03Ah,020h,043h,06Fh,06Eh
        db 074h,061h,063h,074h,020h,04Ch,061h,06Eh,063h,065h,021h,00h
