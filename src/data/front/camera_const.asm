; Strings and constants of front/camera (src/front/camera), in link order.
bits 32
%include "hockey.inc"
section s_111084 progbits alloc noexec write align=1
global F64_0p00277778, F64_65536_PressCamOneView, F64_0p00277778_PressCamOneView, CamViewScale, F64_0p00277778_PressCamThreeView, F64_65536_PressCamThreeView, F64_0p00277778_PressCamFourView, F64_65536_PressCamFourView
global str_Priority2, str_Anh, str_Ana, str_Bsh, str_Bsa, str_Bfh, str_Bfa, str_Cgh
global str_Cga, str_Chh, str_Cha, str_Dlh, str_Dla, str_Dth, str_Dta, str_Edh
global str_Eda, str_Flh, str_Fla, str_Hrh, str_Hra, str_Lah, str_Laa, str_Mth
global str_Mta, str_Njh, str_Nja, str_Ilh, str_Ila, str_Rgh, str_Rga, str_Oth
global str_Ota, str_Phh, str_Pha, str_Pth, str_Pta, str_Quh, str_Qua, str_Slh
global str_Sla, str_Sjh, str_Sja, str_Tbh, str_Tba, str_Trh, str_Tra, str_Vnh
global str_Vna, str_Wsh, str_Wsa, str_Wnh, str_Wna, str_Asw, str_Ase
F64_0p00277778:                                 ; double constant 0.00277778; used by PressCamOneView
        db 016h,06Ch,0C1h,016h,06Ch,0C1h,066h,03Fh
F64_65536_PressCamOneView:                      ; double constant 65536; used by PressCamOneView
        db 00h,00h,00h,00h,00h,00h,0F0h,040h
F64_0p00277778_PressCamOneView:                 ; double constant 0.00277778; used by PressCamTwoView
        db 016h,06Ch,0C1h,016h,06Ch,0C1h,066h,03Fh
CamViewScale:                                   ; Camera view scale (double); used by PressCamTwoView
        db 00h,00h,00h,00h,00h,00h,0F0h,040h
F64_0p00277778_PressCamThreeView:               ; double constant 0.00277778; used by PressCamThreeView
        db 016h,06Ch,0C1h,016h,06Ch,0C1h,066h,03Fh
F64_65536_PressCamThreeView:                    ; double constant 65536; used by PressCamThreeView
        db 00h,00h,00h,00h,00h,00h,0F0h,040h
F64_0p00277778_PressCamFourView:                ; double constant 0.00277778; used by PressCamFourView
        db 016h,06Ch,0C1h,016h,06Ch,0C1h,066h,03Fh
F64_65536_PressCamFourView:                     ; double constant 65536; used by PressCamFourView
        db 00h,00h,00h,00h,00h,00h,0F0h,040h
str_Priority2:                                  ; string 'priority'; used by CloseTextOverlay
        db 070h,072h,069h,06Fh,072h,069h,074h,079h,00h,00h,00h,00h
str_Anh:                                        ; string '!anh'
        db 021h,061h,06Eh,068h,00h
str_Ana:                                        ; string '!ana'
        db 021h,061h,06Eh,061h,00h
str_Bsh:                                        ; string '!bsh'
        db 021h,062h,073h,068h,00h
str_Bsa:                                        ; string '!bsa'
        db 021h,062h,073h,061h,00h
str_Bfh:                                        ; string '!bfh'
        db 021h,062h,066h,068h,00h
str_Bfa:                                        ; string '!bfa'
        db 021h,062h,066h,061h,00h
str_Cgh:                                        ; string '!cgh'
        db 021h,063h,067h,068h,00h
str_Cga:                                        ; string '!cga'
        db 021h,063h,067h,061h,00h
str_Chh:                                        ; string '!chh'
        db 021h,063h,068h,068h,00h
str_Cha:                                        ; string '!cha'
        db 021h,063h,068h,061h,00h
str_Dlh:                                        ; string '!dlh'
        db 021h,064h,06Ch,068h,00h
str_Dla:                                        ; string '!dla'
        db 021h,064h,06Ch,061h,00h
str_Dth:                                        ; string '!dth'
        db 021h,064h,074h,068h,00h
str_Dta:                                        ; string '!dta'
        db 021h,064h,074h,061h,00h
str_Edh:                                        ; string '!edh'
        db 021h,065h,064h,068h,00h
str_Eda:                                        ; string '!eda'
        db 021h,065h,064h,061h,00h
str_Flh:                                        ; string '!flh'
        db 021h,066h,06Ch,068h,00h
str_Fla:                                        ; string '!fla'
        db 021h,066h,06Ch,061h,00h
str_Hrh:                                        ; string '!hrh'
        db 021h,068h,072h,068h,00h
str_Hra:                                        ; string '!hra'
        db 021h,068h,072h,061h,00h
str_Lah:                                        ; string '!lah'
        db 021h,06Ch,061h,068h,00h
str_Laa:                                        ; string '!laa'
        db 021h,06Ch,061h,061h,00h
str_Mth:                                        ; string '!mth'
        db 021h,06Dh,074h,068h,00h
str_Mta:                                        ; string '!mta'
        db 021h,06Dh,074h,061h,00h
str_Njh:                                        ; string '!njh'
        db 021h,06Eh,06Ah,068h,00h
str_Nja:                                        ; string '!nja'
        db 021h,06Eh,06Ah,061h,00h
str_Ilh:                                        ; string '!ilh'
        db 021h,069h,06Ch,068h,00h
str_Ila:                                        ; string '!ila'
        db 021h,069h,06Ch,061h,00h
str_Rgh:                                        ; string '!rgh'
        db 021h,072h,067h,068h,00h
str_Rga:                                        ; string '!rga'
        db 021h,072h,067h,061h,00h
str_Oth:                                        ; string '!oth'
        db 021h,06Fh,074h,068h,00h
str_Ota:                                        ; string '!ota'
        db 021h,06Fh,074h,061h,00h
str_Phh:                                        ; string '!phh'
        db 021h,070h,068h,068h,00h
str_Pha:                                        ; string '!pha'
        db 021h,070h,068h,061h,00h
str_Pth:                                        ; string '!pth'
        db 021h,070h,074h,068h,00h
str_Pta:                                        ; string '!pta'
        db 021h,070h,074h,061h,00h
str_Quh:                                        ; string '!quh'
        db 021h,071h,075h,068h,00h
str_Qua:                                        ; string '!qua'
        db 021h,071h,075h,061h,00h
str_Slh:                                        ; string '!slh'
        db 021h,073h,06Ch,068h,00h
str_Sla:                                        ; string '!sla'
        db 021h,073h,06Ch,061h,00h
str_Sjh:                                        ; string '!sjh'
        db 021h,073h,06Ah,068h,00h
str_Sja:                                        ; string '!sja'
        db 021h,073h,06Ah,061h,00h
str_Tbh:                                        ; string '!tbh'
        db 021h,074h,062h,068h,00h
str_Tba:                                        ; string '!tba'
        db 021h,074h,062h,061h,00h
str_Trh:                                        ; string '!trh'
        db 021h,074h,072h,068h,00h
str_Tra:                                        ; string '!tra'
        db 021h,074h,072h,061h,00h
str_Vnh:                                        ; string '!vnh'
        db 021h,076h,06Eh,068h,00h
str_Vna:                                        ; string '!vna'
        db 021h,076h,06Eh,061h,00h
str_Wsh:                                        ; string '!wsh'
        db 021h,077h,073h,068h,00h
str_Wsa:                                        ; string '!wsa'
        db 021h,077h,073h,061h,00h
str_Wnh:                                        ; string '!wnh'
        db 021h,077h,06Eh,068h,00h
str_Wna:                                        ; string '!wna'
        db 021h,077h,06Eh,061h,00h
str_Asw:                                        ; string '!asw'
        db 021h,061h,073h,077h,00h
str_Ase:                                        ; string '!ase'
        db 021h,061h,073h,065h,00h
