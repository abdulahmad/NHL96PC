; Strings and constants of front/playoff (src/front/playoff), in link order.
bits 32
%include "hockey.inc"
section s_112F94 progbits alloc noexec write align=1
global str_PLAYOFFNDX, str_NYRangers, str_NYIslanders, str_S6, str_SD7, str_1GM0, str_Bkgd25, str_BT005
global str_BT019, str_BT027, str_BT107, str_BT117, str_BT123, str_BT205, str_BT212, str_BT22
global str_Pal18, str_S7, str_Nothing2, str_S05dCNZDB6, str_D17, str_D18, str_Choices, str_PTOP
global str_PBOT, str_AWD0, str_EXBG, str_BUMP, str_PLA0, str_PLA1, str_PLA2, str_SM10
global str_SM11, str_SM12, str_SM00, str_SM01, str_SM02, str_AWD1, str_AWD2, str_RUL0
global str_RUL14, str_RUL24, str_S05dCSGDB4, str_NUMD2, str_Pal19, str_Bkgd27, str_FSH6, str_Plyr4
global str_PROFILEFSH4, str_Card4, str_Ard4, str_DSS5, str_SD8, str_SDD, str_S0, str_SDD2
global str_0000
str_PLAYOFFNDX:                                 ; string 'PLAYOFF.NDX'; used by PlayoffSetupScreen,
                                                ; RunPlayoffMenus
        db 050h,04Ch,041h,059h,04Fh,046h,046h,02Eh,04Eh,044h,058h,00h
str_NYRangers:                                  ; string 'NY Rangers'; used by EditPlayoffName,
                                                ; PickPlayoffTeam, PlayoffSetupScreen
        db 04Eh,059h,020h,052h,061h,06Eh,067h,065h,072h,073h,00h
str_NYIslanders:                                ; string 'NY Islanders'; used by EditPlayoffName,
                                                ; PickPlayoffTeam, PlayoffSetupScreen
        db 04Eh,059h,020h,049h,073h,06Ch,061h,06Eh,064h,065h,072h,073h,00h
str_S6:                                         ; string '%s'; used by EditPlayoffName, PickPlayoffTeam
        db 025h,073h,00h
str_SD7:                                        ; string '%s%d'; used by PlayoffSetupScreen
        db 025h,073h,025h,064h,00h
str_1GM0:                                       ; string '1GM0'; used by PlayoffSetupScreen
        db 031h,047h,04Dh,030h,00h
str_Bkgd25:                                     ; string 'bkgd'; used by DrawPlayoffSlotLogo,
                                                ; DrawPlayoffTeamList, PlayoffSetupScreen
        db 062h,06Bh,067h,064h,00h
str_BT005:                                      ; string 'BT00'; used by PlayoffSetupScreen
        db 042h,054h,030h,030h,00h
str_BT019:                                      ; string 'BT01'; used by PlayoffSetupScreen
        db 042h,054h,030h,031h,00h
str_BT027:                                      ; string 'BT02'; used by PlayoffSetupScreen
        db 042h,054h,030h,032h,00h
str_BT107:                                      ; string 'BT10'; used by PlayoffSetupScreen
        db 042h,054h,031h,030h,00h
str_BT117:                                      ; string 'BT11'; used by PlayoffSetupScreen
        db 042h,054h,031h,031h,00h
str_BT123:                                      ; string 'BT12'; used by PlayoffSetupScreen
        db 042h,054h,031h,032h,00h
str_BT205:                                      ; string 'BT20'; used by PlayoffSetupScreen
        db 042h,054h,032h,030h,00h
str_BT212:                                      ; string 'BT21'; used by PlayoffSetupScreen
        db 042h,054h,032h,031h,00h
str_BT22:                                       ; string 'BT22'; used by PlayoffSetupScreen
        db 042h,054h,032h,032h,00h
str_Pal18:                                      ; string '!pal'; used by PlayoffSetupScreen, PlayoffTreeScreen
        db 021h,070h,061h,06Ch,00h
str_S7:                                         ; string '"%s"'; used by PlayoffSetupScreen
        db 022h,025h,073h,022h,00h
str_Nothing2:                                   ; string 'Nothing'; used by PlayoffSetupScreen
        db 04Eh,06Fh,074h,068h,069h,06Eh,067h,00h
str_S05dCNZDB6:                                 ; string '%s%05d%cNZ.DB'; used by PlayoffSetupScreen
        db 025h,073h,025h,030h,035h,064h,025h,063h,04Eh,05Ah,02Eh,044h,042h,00h
str_D17:                                        ; string '%d'; used by DrawPlayoffTree, PlayoffSetupScreen
        db 025h,064h,00h
str_D18:                                        ; string '%d.'; used by DrawPlayoffTeamList
        db 025h,064h,02Eh,00h
str_Choices:                                    ; string 'choices'; used by PlayoffTreeScreen
        db 063h,068h,06Fh,069h,063h,065h,073h,00h
str_PTOP:                                       ; string 'PTOP'; used by PlayoffTreeScreen
        db 050h,054h,04Fh,050h,00h
str_PBOT:                                       ; string 'PBOT'; used by PlayoffTreeScreen
        db 050h,042h,04Fh,054h,00h
str_AWD0:                                       ; string 'AWD0'; used by DrawPlayoffTree, PlayoffTreeScreen
        db 041h,057h,044h,030h,00h
str_EXBG:                                       ; string 'EXBG'; used by DrawPlayoffTree, PlayoffTreeScreen
        db 045h,058h,042h,047h,00h
str_BUMP:                                       ; string 'BUMP'; used by PlayoffTreeScreen
        db 042h,055h,04Dh,050h,00h
str_PLA0:                                       ; string 'PLA0'; used by PlayoffTreeScreen
        db 050h,04Ch,041h,030h,00h
str_PLA1:                                       ; string 'PLA1'; used by PlayoffTreeScreen
        db 050h,04Ch,041h,031h,00h
str_PLA2:                                       ; string 'PLA2'; used by PlayoffTreeScreen
        db 050h,04Ch,041h,032h,00h
str_SM10:                                       ; string 'SM10'; used by PlayoffTreeScreen
        db 053h,04Dh,031h,030h,00h
str_SM11:                                       ; string 'SM11'; used by PlayoffTreeScreen
        db 053h,04Dh,031h,031h,00h
str_SM12:                                       ; string 'SM12'; used by PlayoffTreeScreen
        db 053h,04Dh,031h,032h,00h
str_SM00:                                       ; string 'SM00'; used by PlayoffTreeScreen
        db 053h,04Dh,030h,030h,00h
str_SM01:                                       ; string 'SM01'; used by PlayoffTreeScreen
        db 053h,04Dh,030h,031h,00h
str_SM02:                                       ; string 'SM02'; used by PlayoffTreeScreen
        db 053h,04Dh,030h,032h,00h
str_AWD1:                                       ; string 'AWD1'; used by PlayoffTreeScreen
        db 041h,057h,044h,031h,00h
str_AWD2:                                       ; string 'AWD2'; used by PlayoffTreeScreen
        db 041h,057h,044h,032h,00h
str_RUL0:                                       ; string 'RUL0'; used by PlayoffTreeScreen
        db 052h,055h,04Ch,030h,00h
str_RUL14:                                      ; string 'RUL1'; used by PlayoffTreeScreen
        db 052h,055h,04Ch,031h,00h
str_RUL24:                                      ; string 'RUL2'; used by PlayoffTreeScreen
        db 052h,055h,04Ch,032h,00h
str_S05dCSGDB4:                                 ; string '%s%05d%cSG.DB'; used by SimPlayoffGame
        db 025h,073h,025h,030h,035h,064h,025h,063h,053h,047h,02Eh,044h,042h,00h
str_NUMD2:                                      ; string 'NUM%d'; used by DrawPlayoffTree
        db 04Eh,055h,04Dh,025h,064h,00h,00h,00h,00h
str_Pal19:                                      ; string '!pal'; used by ShowPlayoffLeaderCard
        db 021h,070h,061h,06Ch,00h
str_Bkgd27:                                     ; string 'bkgd'; used by ShowPlayoffLeaderCard
        db 062h,06Bh,067h,064h,00h
str_FSH6:                                       ; string '.FSH'; used by ShowPlayoffLeaderCard
        db 02Eh,046h,053h,048h,00h
str_Plyr4:                                      ; string 'plyr'; used by ShowPlayoffLeaderCard
        db 070h,06Ch,079h,072h,00h
str_PROFILEFSH4:                                ; string 'PROFILE.FSH'; used by ShowPlayoffLeaderCard
        db 050h,052h,04Fh,046h,049h,04Ch,045h,02Eh,046h,053h,048h,00h
str_Card4:                                      ; string 'card'; used by ShowPlayoffLeaderCard
        db 063h,061h,072h,064h,00h
str_Ard4:                                       ; string '!ard'; used by ShowPlayoffLeaderCard
        db 021h,061h,072h,064h,00h
str_DSS5:                                       ; string '%d %s %s'; used by ShowPlayoffLeaderCard
        db 025h,064h,020h,025h,073h,020h,025h,073h,00h
str_SD8:                                        ; string '%s %d'; used by ShowPlayoffLeaderCard
        db 025h,073h,020h,025h,064h,00h
str_SDD:                                        ; string '%s %d.%d%%'; used by ShowPlayoffLeaderCard
        db 025h,073h,020h,025h,064h,02Eh,025h,064h,025h,025h,00h
str_S0:                                         ; string '%s 0%%'; used by ShowPlayoffLeaderCard
        db 025h,073h,020h,030h,025h,025h,00h
str_SDD2:                                       ; string '%s %d.%d'; used by ShowPlayoffLeaderCard
        db 025h,073h,020h,025h,064h,02Eh,025h,064h,00h
str_0000:                                       ; string '0000'; used by ShowPlayoffLeaderCard
        db 030h,030h,030h,030h,00h,00h,00h,00h
