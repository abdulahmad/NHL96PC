; Strings and constants of pc/users (src/pc/users), in link order.
bits 32
%include "hockey.inc"
section s_110B48 progbits alloc noexec write align=1
global UserNameBuf, str_08d, str_LOCALNDX, str_Ulxn, str_Ulxh, str_Ulyn, str_Ulyh, str_Slid
global str_Ball, str_Slu1, str_Slu2, str_Sld1, str_Sld2, str_BKGD2, str_TXTD, str_D4
global str_dbgS, str_3d3d3d, str_3d3d, str_1000, str_fmtTenths, str_00, str_FL00, str_FL01
global str_wt, str_Punct_ExportUserRecords, str_ExportDashes, str_20s, str_sp3s, str_ExportSpacesWide, str_sp3d3d3d3d3d3d3d3d, str_sp3d3d2d2d2d
global str_sp3s2, str_ExportSpaces, str_sp00, str_sp1000, str_sp3d1d, str_sp002, str_sp10002, str_sp3d1d2
global str_spD, str_Uname, str_Urate, str_Upts, str_Ugf, str_Uga, str_Upp, str_Upk
global str_Uso, str_Ustreak, str_Ulstreak, str_Uteam, str_Uopp, str_Usort, str_Logname, str_Logbook
global str_Pal5, str_Shadtbl, str_BT002, str_BT012, str_BT022, str_BT10, str_BT11, str_BT12
global str_TB01, str_TB00, str_TB11, str_TB10
UserNameBuf:                                    ; User name being edited; used by DeleteUser, DrawUserRecords,
                                                ; ExportUserRecords ...
        db 00h
str_08d:                                        ; string '%08d'; used by LoadUserIndex, NewUser
        db 025h,030h,038h,064h,00h
str_LOCALNDX:                                   ; string 'LOCAL.NDX'; used by LoadUserIndex
        db 04Ch,04Fh,043h,041h,04Ch,02Eh,04Eh,044h,058h,00h
str_Ulxn:                                       ; string 'ulxn'; used by PickUsersScreen
        db 075h,06Ch,078h,06Eh,00h
str_Ulxh:                                       ; string 'ulxh'; used by PickUsersScreen
        db 075h,06Ch,078h,068h,00h
str_Ulyn:                                       ; string 'ulyn'; used by PickUsersScreen
        db 075h,06Ch,079h,06Eh,00h
str_Ulyh:                                       ; string 'ulyh'; used by PickUsersScreen
        db 075h,06Ch,079h,068h,00h
str_Slid:                                       ; string 'slid'; used by PickUsersScreen
        db 073h,06Ch,069h,064h,00h
str_Ball:                                       ; string 'ball'; used by PickUsersScreen
        db 062h,061h,06Ch,06Ch,00h
str_Slu1:                                       ; string 'slu1'; used by PickUsersScreen
        db 073h,06Ch,075h,031h,00h
str_Slu2:                                       ; string 'slu2'; used by PickUsersScreen
        db 073h,06Ch,075h,032h,00h
str_Sld1:                                       ; string 'sld1'; used by PickUsersScreen
        db 073h,06Ch,064h,031h,00h
str_Sld2:                                       ; string 'sld2'; used by PickUsersScreen
        db 073h,06Ch,064h,032h,00h
str_BKGD2:                                      ; string 'BKGD'; used by DrawUserRecords, UserRecordsScreen
        db 042h,04Bh,047h,044h,00h
str_TXTD:                                       ; string 'TXT%d'; used by DrawUserRecords
        db 054h,058h,054h,025h,064h,00h
str_D4:                                         ; string '%d'; used by DrawUserRecords
        db 025h,064h,00h
str_dbgS:                                       ; string '%s'; used by DrawUserRecords
        db 025h,073h,00h
str_3d3d3d:                                     ; string '%3d-%3d-%3d'; used by DrawUserRecords
        db 025h,033h,064h,02Dh,025h,033h,064h,02Dh,025h,033h,064h,00h
str_3d3d:                                       ; string '%3d-%3d'; used by DrawUserRecords
        db 025h,033h,064h,02Dh,025h,033h,064h,00h
str_1000:                                       ; string '100.0'; used by DrawUserRecords
        db 031h,030h,030h,02Eh,030h,00h
str_fmtTenths:                                  ; string "%3d.%1d"; used by DrawUserRecords
        db 025h,033h,064h,02Eh,025h,031h,064h,00h
str_00:                                         ; string '0.0'; used by DrawUserRecords
        db 030h,02Eh,030h,00h
str_FL00:                                       ; string 'FL00'; used by DrawUserRecords
        db 046h,04Ch,030h,030h,00h
str_FL01:                                       ; string 'FL01'; used by DrawUserRecords
        db 046h,04Ch,030h,031h,00h
str_wt:                                         ; string 'wt'; used by ExportUserRecords
        db 077h,074h,00h
str_Punct_ExportUserRecords:                    ; string "-------------------- ---- ----------- -----------
                                                ; -------"; used by ExportUserRecords
        db 02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,020h,020h,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,00h
str_ExportDashes:                               ; " ---": user records export placeholder; used by
                                                ; ExportUserRecords
        db 020h,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh
        db 020h,02Dh,02Dh,02Dh,02Dh,02Dh,020h,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh,02Dh
        db 0Ah,00h
str_20s:                                        ; string '%-20s'; used by ExportUserRecords
        db 025h,02Dh,032h,030h,073h,00h
str_sp3s:                                       ; string ' %3s'; used by ExportUserRecords
        db 020h,020h,025h,033h,073h,00h
str_ExportSpacesWide:                           ; Spaces: user records export padding; used by
                                                ; ExportUserRecords
        db 020h,020h,020h,020h,020h,00h
str_sp3d3d3d3d3d3d3d3d:                         ; string ' %3d-%3d-%3d %3d-%3d-%3d %3d-%3d'; used by
                                                ; ExportUserRecords
        db 020h,020h,025h,033h,064h,02Dh,025h,033h,064h,02Dh,025h,033h,064h,020h,025h,033h
        db 064h,02Dh,025h,033h,064h,02Dh,025h,033h,064h,020h,025h,033h,064h,02Dh,025h,033h
        db 064h,00h
str_sp3d3d2d2d2d:                               ; string ' %3d %3d %2d %2d %2d'; used by ExportUserRecords
        db 020h,025h,033h,064h,020h,025h,033h,064h,020h,020h,020h,020h,025h,032h,064h,020h
        db 020h,020h,020h,020h,020h,020h,025h,032h,064h,020h,020h,020h,020h,020h,020h,025h
        db 032h,064h,00h
str_sp3s2:                                      ; string ' %3s'; used by ExportUserRecords
        db 020h,020h,020h,020h,020h,020h,025h,033h,073h,00h
str_ExportSpaces:                               ; Spaces: user records export padding; used by
                                                ; ExportUserRecords
        db 020h,020h,020h,020h,020h,020h,020h,020h,020h,00h
str_sp00:                                       ; string ' 0.0'; used by ExportUserRecords
        db 020h,020h,020h,020h,020h,030h,02Eh,030h,00h
str_sp1000:                                     ; string ' 100.0'; used by ExportUserRecords
        db 020h,020h,020h,031h,030h,030h,02Eh,030h,00h
str_sp3d1d:                                     ; string ' %3d.%1d'; used by ExportUserRecords
        db 020h,020h,020h,025h,033h,064h,02Eh,025h,031h,064h,00h
str_sp002:                                      ; string ' 0.0'; used by ExportUserRecords
        db 020h,020h,020h,030h,02Eh,030h,00h
str_sp10002:                                    ; string ' 100.0'; used by ExportUserRecords
        db 020h,031h,030h,030h,02Eh,030h,00h
str_sp3d1d2:                                    ; string ' %3d.%1d'; used by ExportUserRecords
        db 020h,025h,033h,064h,02Eh,025h,031h,064h,00h
str_spD:                                        ; string ' %d '; used by ExportUserRecords
        db 020h,020h,020h,020h,025h,064h,0Ah,00h
str_Uname:                                      ; string 'uname'; used by UserRecordsScreen
        db 075h,06Eh,061h,06Dh,065h,00h
str_Urate:                                      ; string 'urate'; used by UserRecordsScreen
        db 075h,072h,061h,074h,065h,00h
str_Upts:                                       ; string 'upts'; used by UserRecordsScreen
        db 075h,070h,074h,073h,00h
str_Ugf:                                        ; string 'ugf'; used by UserRecordsScreen
        db 075h,067h,066h,00h
str_Uga:                                        ; string 'uga'; used by UserRecordsScreen
        db 075h,067h,061h,00h
str_Upp:                                        ; string 'upp'; used by UserRecordsScreen
        db 075h,070h,070h,00h
str_Upk:                                        ; string 'upk'; used by UserRecordsScreen
        db 075h,070h,06Bh,00h
str_Uso:                                        ; string 'uso'; used by UserRecordsScreen
        db 075h,073h,06Fh,00h
str_Ustreak:                                    ; string 'ustreak'; used by UserRecordsScreen
        db 075h,073h,074h,072h,065h,061h,06Bh,00h
str_Ulstreak:                                   ; string 'ulstreak'; used by UserRecordsScreen
        db 075h,06Ch,073h,074h,072h,065h,061h,06Bh,00h
str_Uteam:                                      ; string 'uteam'; used by UserRecordsScreen
        db 075h,074h,065h,061h,06Dh,00h
str_Uopp:                                       ; string 'uopp'; used by UserRecordsScreen
        db 075h,06Fh,070h,070h,00h
str_Usort:                                      ; string 'usort'; used by UserRecordsScreen
        db 075h,073h,06Fh,072h,074h,00h
str_Logname:                                    ; string 'logname'; used by UserRecordsScreen
        db 06Ch,06Fh,067h,06Eh,061h,06Dh,065h,00h
str_Logbook:                                    ; string 'logbook'; used by UserRecordsScreen
        db 06Ch,06Fh,067h,062h,06Fh,06Fh,06Bh,00h
str_Pal5:                                       ; string '!pal'; used by UserRecordsScreen
        db 021h,070h,061h,06Ch,00h
str_Shadtbl:                                    ; string 'shadtbl'; used by UserRecordsScreen
        db 073h,068h,061h,064h,074h,062h,06Ch,00h
str_BT002:                                      ; string 'BT00'; used by UserRecordsScreen
        db 042h,054h,030h,030h,00h
str_BT012:                                      ; string 'BT01'; used by UserRecordsScreen
        db 042h,054h,030h,031h,00h
str_BT022:                                      ; string 'BT02'; used by UserRecordsScreen
        db 042h,054h,030h,032h,00h
str_BT10:                                       ; string 'BT10'; used by UserRecordsScreen
        db 042h,054h,031h,030h,00h
str_BT11:                                       ; string 'BT11'; used by UserRecordsScreen
        db 042h,054h,031h,031h,00h
str_BT12:                                       ; string 'BT12'; used by UserRecordsScreen
        db 042h,054h,031h,032h,00h
str_TB01:                                       ; string 'TB01'; used by UserRecordsScreen
        db 054h,042h,030h,031h,00h
str_TB00:                                       ; string 'TB00'; used by UserRecordsScreen
        db 054h,042h,030h,030h,00h
str_TB11:                                       ; string 'TB11'; used by UserRecordsScreen
        db 054h,042h,031h,031h,00h
str_TB10:                                       ; string 'TB10'; used by UserRecordsScreen
        db 054h,042h,031h,030h,00h
