; Strings and constants of front/play_game (src/front/play_game), in link order.
bits 32
%include "hockey.inc"
section s_1100F7 progbits alloc noexec write align=1
global str_GloL5, str_GloR5, str_GhiL, str_GhiR, str_FhiL2, str_FhiR2, str_PAL, str_OK
global str_0, str_0_ModemResultCodeTable, str_CONNECT, str_1, str_fe1, str_RING, str_2, str_fe2
global str_NOCARRIER, str_3, str_fe3, str_ERROR, str_4, str_fe4, str_CONNECT1200, str_5
global str_fe5, str_NODIALTONE, str_6, str_6_ModemResultCodeTable, str_NODIALTONE2, str_BUSY, str_7, str_fe7
global str_NOANSWER, str_8, str_fe8, str_CONNECT2400, str_10, str_102, str_CONNECT9600, str_13
global str_132, str_CONNECT9600ARQ, str_17, str_172, str_CONNECT9600HST, str_23, str_232, str_CONNECT9600ARQHST
global str_27, str_272, str_CONNECT14400, str_25, str_252, str_CONNECT14400ARQ, str_26, str_262
global str_CONNECT14400HST, str_35, str_352, str_CONNECT14400ARQHST, str_36, str_362
str_GloL5:                                      ; string 'GloL'; used by PlayMenuGame
        db 047h,06Ch,06Fh,04Ch,00h
str_GloR5:                                      ; string 'GloR'; used by PlayMenuGame
        db 047h,06Ch,06Fh,052h,00h
str_GhiL:                                       ; string 'GhiL'; used by PlayMenuGame
        db 047h,068h,069h,04Ch,00h
str_GhiR:                                       ; string 'GhiR'; used by PlayMenuGame
        db 047h,068h,069h,052h,00h
str_FhiL2:                                      ; string 'FhiL'; used by PlayMenuGame
        db 046h,068h,069h,04Ch,00h
str_FhiR2:                                      ; string 'FhiR'; used by PlayMenuGame
        db 046h,068h,069h,052h,00h
str_PAL:                                        ; string 'PAL'; used by PlayMenuGame
        db 050h,041h,04Ch,00h,00h,00h,00h
str_OK:                                         ; string '_OK'
        db 05Fh,04Fh,04Bh,00h
str_0:                                          ; string '_0_'
        db 05Fh,030h,05Fh,00h
str_0_ModemResultCodeTable:                     ; string "0"
        db 030h,00h
str_CONNECT:                                    ; string '_CONNECT'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,00h
str_1:                                          ; string '_1_'
        db 05Fh,031h,05Fh,00h
str_fe1:                                        ; string '1'
        db 031h,00h
str_RING:                                       ; string '_RING'
        db 05Fh,052h,049h,04Eh,047h,00h
str_2:                                          ; string '_2_'
        db 05Fh,032h,05Fh,00h
str_fe2:                                        ; string '2'
        db 032h,00h
str_NOCARRIER:                                  ; string '_NO CARRIER'
        db 05Fh,04Eh,04Fh,020h,043h,041h,052h,052h,049h,045h,052h,00h
str_3:                                          ; string '_3_'
        db 05Fh,033h,05Fh,00h
str_fe3:                                        ; string '3'
        db 033h,00h
str_ERROR:                                      ; string '_ERROR'
        db 05Fh,045h,052h,052h,04Fh,052h,00h
str_4:                                          ; string '_4_'
        db 05Fh,034h,05Fh,00h
str_fe4:                                        ; string '4'
        db 034h,00h
str_CONNECT1200:                                ; string '_CONNECT 1200'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,031h,032h,030h,030h,00h
str_5:                                          ; string '_5_'
        db 05Fh,035h,05Fh,00h
str_fe5:                                        ; string '5'
        db 035h,00h
str_NODIALTONE:                                 ; string '_NO DIALTONE'
        db 05Fh,04Eh,04Fh,020h,044h,049h,041h,04Ch,054h,04Fh,04Eh,045h,00h
str_6:                                          ; string '_6_'
        db 05Fh,036h,05Fh,00h
str_6_ModemResultCodeTable:                     ; string "6"
        db 036h,00h
str_NODIALTONE2:                                ; string '_NO DIAL TONE'
        db 05Fh,04Eh,04Fh,020h,044h,049h,041h,04Ch,020h,054h,04Fh,04Eh,045h,00h
str_BUSY:                                       ; string '_BUSY'
        db 05Fh,042h,055h,053h,059h,00h
str_7:                                          ; string '_7_'
        db 05Fh,037h,05Fh,00h
str_fe7:                                        ; string '7'
        db 037h,00h
str_NOANSWER:                                   ; string '_NO ANSWER'
        db 05Fh,04Eh,04Fh,020h,041h,04Eh,053h,057h,045h,052h,00h
str_8:                                          ; string '_8_'
        db 05Fh,038h,05Fh,00h
str_fe8:                                        ; string '8'
        db 038h,00h
str_CONNECT2400:                                ; string '_CONNECT 2400'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,032h,034h,030h,030h,00h
str_10:                                         ; string '_10_'
        db 05Fh,031h,030h,05Fh,00h
str_102:                                        ; string '10'
        db 031h,030h,00h
str_CONNECT9600:                                ; string '_CONNECT 9600'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,039h,036h,030h,030h,00h
str_13:                                         ; string '_13_'
        db 05Fh,031h,033h,05Fh,00h
str_132:                                        ; string '13'
        db 031h,033h,00h
str_CONNECT9600ARQ:                             ; string '_CONNECT 9600/ARQ'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,039h,036h,030h,030h,02Fh,041h,052h
        db 051h,00h
str_17:                                         ; string '_17_'
        db 05Fh,031h,037h,05Fh,00h
str_172:                                        ; string '17'
        db 031h,037h,00h
str_CONNECT9600HST:                             ; string '_CONNECT 9600/HST'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,039h,036h,030h,030h,02Fh,048h,053h
        db 054h,00h
str_23:                                         ; string '_23_'
        db 05Fh,032h,033h,05Fh,00h
str_232:                                        ; string '23'
        db 032h,033h,00h
str_CONNECT9600ARQHST:                          ; string '_CONNECT 9600/ARQ/HST'
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,039h,036h,030h,030h,02Fh,041h,052h
        db 051h,02Fh,048h,053h,054h,00h
str_27:                                         ; string '_27_'
        db 05Fh,032h,037h,05Fh,00h
str_272:                                        ; string '27'
        db 032h,037h,00h
str_CONNECT14400:                               ; string "_CONNECT 14400"; not referenced by name
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,031h,034h,034h,030h,030h,00h
str_25:                                         ; string '_25_'
        db 05Fh,032h,035h,05Fh,00h
str_252:                                        ; string '25'
        db 032h,035h,00h
str_CONNECT14400ARQ:                            ; string "_CONNECT 14400/ARQ"; not referenced by name
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,031h,034h,034h,030h,030h,02Fh,041h
        db 052h,051h,00h
str_26:                                         ; string '_26_'
        db 05Fh,032h,036h,05Fh,00h
str_262:                                        ; string '26'
        db 032h,036h,00h
str_CONNECT14400HST:                            ; string "_CONNECT 14400/HST"; not referenced by name
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,031h,034h,034h,030h,030h,02Fh,048h
        db 053h,054h,00h
str_35:                                         ; string '_35_'
        db 05Fh,033h,035h,05Fh,00h
str_352:                                        ; string '35'
        db 033h,035h,00h
str_CONNECT14400ARQHST:                         ; string "_CONNECT 14400/ARQ/HST"; not referenced by name
        db 05Fh,043h,04Fh,04Eh,04Eh,045h,043h,054h,020h,031h,034h,034h,030h,030h,02Fh,041h
        db 052h,051h,02Fh,048h,053h,054h,00h
str_36:                                         ; string '_36_'
        db 05Fh,033h,036h,05Fh,00h
str_362:                                        ; string '36'
        db 033h,036h,00h
