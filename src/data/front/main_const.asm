; Strings and constants of front/main (src/front/main), in link order.
bits 32
%include "hockey.inc"
section s_110331 progbits alloc noexec write align=1
global str_dbgL, str_LNPA, str_LNHL, str_LDON, str_LNEW, str_LSTA, str_LEAS, str_0_LoadTeamLogo
global str_Dot, str_Punct_CheckGameDirs, str_CLEARER, str_YouMustFirstUseTheSETUPP, str_HardwareBeforeRunningHOC, str_spPressESCToReturnToDOS, str_Punct_StartUp, str_RunSetupFirstDe
global str_IhreHardwareZuKonfigurie, str_EscToDosDe, str_FhiL4, str_FhiR4, str_LOGOPACK, str_Lgo
str_dbgL:                                       ; string 'L'; used by LoadTeamLogo
        db 04Ch,00h
str_LNPA:                                       ; string 'LNPA'; used by LoadTeamLogo
        db 04Ch,04Eh,050h,041h,00h
str_LNHL:                                       ; string 'LNHL'; used by LoadTeamLogo
        db 04Ch,04Eh,048h,04Ch,00h
str_LDON:                                       ; string 'LDON'; used by LoadTeamLogo
        db 04Ch,044h,04Fh,04Eh,00h
str_LNEW:                                       ; string 'LNEW'; used by LoadTeamLogo
        db 04Ch,04Eh,045h,057h,00h
str_LSTA:                                       ; string 'LSTA'; used by LoadTeamLogo
        db 04Ch,053h,054h,041h,00h
str_LEAS:                                       ; string 'LEAS'; used by LoadTeamLogo
        db 04Ch,045h,041h,053h,00h
str_0_LoadTeamLogo:                             ; string "0"; used by LoadTeamLogo
        db 030h,00h
str_Dot:                                        ; string '.'; used by CheckGameDirs
        db 02Eh,00h
str_Punct_CheckGameDirs:                        ; string ".."; used by CheckGameDirs
        db 02Eh,02Eh,00h
str_CLEARER:                                    ; string 'CLEARER'; used by InitHardware
        db 043h,04Ch,045h,041h,052h,045h,052h,00h
str_YouMustFirstUseTheSETUPP:                   ; string 'You must first use the SETUP program to configure
                                                ; your '; used by StartUp
        db 059h,06Fh,075h,020h,06Dh,075h,073h,074h,020h,066h,069h,072h,073h,074h,020h,075h
        db 073h,065h,020h,074h,068h,065h,020h,053h,045h,054h,055h,050h,020h,070h,072h,06Fh
        db 067h,072h,061h,06Dh,020h,074h,06Fh,020h,063h,06Fh,06Eh,066h,069h,067h,075h,072h
        db 065h,020h,079h,06Fh,075h,072h,0Ah,00h
str_HardwareBeforeRunningHOC:                   ; string 'hardware before running HOCKEY. '; used by StartUp
        db 068h,061h,072h,064h,077h,061h,072h,065h,020h,062h,065h,066h,06Fh,072h,065h,020h
        db 072h,075h,06Eh,06Eh,069h,06Eh,067h,020h,048h,04Fh,043h,04Bh,045h,059h,02Eh,0Ah
        db 00h
str_spPressESCToReturnToDOS:                    ; string ' Press ESC to return to DOS. '; used by StartUp
        db 0Ah,050h,072h,065h,073h,073h,020h,045h,053h,043h,020h,074h,06Fh,020h,072h,065h
        db 074h,075h,072h,06Eh,020h,074h,06Fh,020h,044h,04Fh,053h,02Eh,0Ah,0Ah,00h
str_Punct_StartUp:                              ; string
                                                ; "\n---------------------------------------------------------
                                                ; -----\n\n"; used by StartUp
        db 0Ah,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,0Ah
        db 0Ah,00h
str_RunSetupFirstDe:                            ; German message: run the set-up program first; used by
                                                ; StartUp
        db 053h,069h,065h,020h,04Dh,09Ah,073h,073h,065h,06Eh,020h,065h,072h,073h,074h,020h
        db 064h,061h,073h,020h,053h,045h,054h,055h,050h,020h,02Dh,020h,050h,072h,06Fh,067h
        db 072h,061h,06Dh,06Dh,020h,06Ch,061h,075h,066h,065h,06Eh,020h,06Ch,061h,073h,073h
        db 065h,06Eh,02Ch,020h,075h,06Dh,0Ah,00h
str_IhreHardwareZuKonfigurie:                   ; string 'Ihre Hardware zu konfigurieren, bevor Sie HOCKEY
                                                ; starten. '; used by StartUp
        db 049h,068h,072h,065h,020h,048h,061h,072h,064h,077h,061h,072h,065h,020h,07Ah,075h
        db 020h,06Bh,06Fh,06Eh,066h,069h,067h,075h,072h,069h,065h,072h,065h,06Eh,02Ch,020h
        db 062h,065h,076h,06Fh,072h,020h,053h,069h,065h,020h,048h,04Fh,043h,04Bh,045h,059h
        db 020h,073h,074h,061h,072h,074h,065h,06Eh,02Eh,0Ah,00h
str_EscToDosDe:                                 ; German message: press Esc to return to DOS; used by StartUp
        db 0Ah,045h,053h,043h,020h,064h,072h,09Ah,063h,06Bh,065h,06Eh,02Ch,020h,075h,06Dh
        db 020h,07Ah,075h,06Dh,020h,044h,04Fh,053h,020h,07Ah,075h,072h,09Ah,063h,06Bh,07Ah
        db 075h,06Bh,065h,068h,072h,065h,06Eh,02Eh,0Ah,00h
str_FhiL4:                                      ; string 'FhiL'; used by StartUp
        db 046h,068h,069h,04Ch,00h
str_FhiR4:                                      ; string 'FhiR'; used by StartUp
        db 046h,068h,069h,052h,00h
str_LOGOPACK:                                   ; string 'LOGOPACK'; used by StartUp
        db 04Ch,04Fh,047h,04Fh,050h,041h,043h,04Bh,00h
str_Lgo:                                        ; string '!lgo'; used by StartUp
        db 021h,06Ch,067h,06Fh,00h,00h
