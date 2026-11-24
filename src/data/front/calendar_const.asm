; Strings and constants of front/calendar (src/front/calendar), in link order.
bits 32
%include "hockey.inc"
section s_112308 progbits alloc noexec write align=1
global str_MonthChoice, str_CalendarChoices, str_Regions, str_Monthregions, str_DK00, str_Bkgd12, str_Pal17, str_DK02d
global str_LFDK, str_RTDK, str_LT02d, str_LFLT, str_RTLT, str_Sim1, str_Sim2, str_Sim3
global str_Hmaw, str_WhtD, str_Rd, str_Bl, str_Disk, str_SD, str_Octo, str_Aprl
global str_Junn, str_Bar, str_Tttt, str_Llll, str_Wwww, str_Punct_DrawCalendar, str_DarD, str_Dashes
global F32_65536
str_MonthChoice:                                ; string 'Month Choice'; used by CalendarScreen
        db 04Dh,06Fh,06Eh,074h,068h,020h,043h,068h,06Fh,069h,063h,065h,00h
str_CalendarChoices:                            ; string 'Calendar Choices'; used by CalendarScreen
        db 043h,061h,06Ch,065h,06Eh,064h,061h,072h,020h,043h,068h,06Fh,069h,063h,065h,073h
        db 00h
str_Regions:                                    ; string 'regions'; used by CalendarScreen
        db 072h,065h,067h,069h,06Fh,06Eh,073h,00h
str_Monthregions:                               ; string 'monthregions'; used by CalendarScreen
        db 06Dh,06Fh,06Eh,074h,068h,072h,065h,067h,069h,06Fh,06Eh,073h,00h
str_DK00:                                       ; string 'DK00'; used by CalendarScreen
        db 044h,04Bh,030h,030h,00h
str_Bkgd12:                                     ; string 'bkgd'; used by CalendarScreen, DrawCalendar
        db 062h,06Bh,067h,064h,00h
str_Pal17:                                      ; string '!pal'; used by CalendarScreen
        db 021h,070h,061h,06Ch,00h
str_DK02d:                                      ; string 'DK%02d'; used by CalendarScreen
        db 044h,04Bh,025h,030h,032h,064h,00h
str_LFDK:                                       ; string 'LFDK'; used by CalendarScreen
        db 04Ch,046h,044h,04Bh,00h
str_RTDK:                                       ; string 'RTDK'; used by CalendarScreen
        db 052h,054h,044h,04Bh,00h
str_LT02d:                                      ; string 'LT%02d'; used by CalendarScreen
        db 04Ch,054h,025h,030h,032h,064h,00h
str_LFLT:                                       ; string 'LFLT'; used by CalendarScreen
        db 04Ch,046h,04Ch,054h,00h
str_RTLT:                                       ; string 'RTLT'; used by CalendarScreen
        db 052h,054h,04Ch,054h,00h
str_Sim1:                                       ; string 'sim1'; used by CalendarScreen
        db 073h,069h,06Dh,031h,00h
str_Sim2:                                       ; string 'sim2'; used by CalendarScreen
        db 073h,069h,06Dh,032h,00h
str_Sim3:                                       ; string 'sim3'; used by CalendarScreen
        db 073h,069h,06Dh,033h,00h
str_Hmaw:                                       ; string 'hmaw'; used by CalendarScreen
        db 068h,06Dh,061h,077h,00h
str_WhtD:                                       ; string 'wht%d'; used by DrawCalendar
        db 077h,068h,074h,025h,064h,00h
str_Rd:                                         ; string 'rd-'; used by DrawCalendar
        db 072h,064h,02Dh,00h
str_Bl:                                         ; string 'bl-'; used by DrawCalendar
        db 062h,06Ch,02Dh,00h
str_Disk:                                       ; string 'disk'; used by DrawCalendar
        db 064h,069h,073h,06Bh,00h
str_SD:                                         ; string '%s%d'; used by DrawCalendar
        db 025h,073h,025h,064h,00h
str_Octo:                                       ; string 'octo'; used by DrawCalendar
        db 06Fh,063h,074h,06Fh,00h
str_Aprl:                                       ; string 'aprl'; used by DrawCalendar
        db 061h,070h,072h,06Ch,00h
str_Junn:                                       ; string 'junn'; used by DrawCalendar
        db 06Ah,075h,06Eh,06Eh,00h
str_Bar:                                        ; string 'bar '; used by DrawCalendar
        db 062h,061h,072h,020h,00h
str_Tttt:                                       ; string 'tttt'; used by DrawCalendar
        db 074h,074h,074h,074h,00h
str_Llll:                                       ; string 'llll'; used by DrawCalendar
        db 06Ch,06Ch,06Ch,06Ch,00h
str_Wwww:                                       ; string 'wwww'; used by DrawCalendar
        db 077h,077h,077h,077h,00h
str_Punct_DrawCalendar:                         ; string "::::"; used by DrawCalendar
        db 03Ah,03Ah,03Ah,03Ah,00h
str_DarD:                                       ; string 'dar%d'; used by DrawCalendar
        db 064h,061h,072h,025h,064h,00h
str_Dashes:                                     ; "----": calendar placeholder text; used by DrawCalendar
        db 02Dh,02Dh,02Dh,02Dh,00h
F32_65536:                                      ; float constant 65536; used by DrawCalendar
        db 00h,00h,080h,047h,00h
