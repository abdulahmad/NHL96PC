; Strings and constants of engine/gamelog (src/engine/gamelog), in link order.
bits 32
%include "hockey.inc"
section s_110DC0 progbits alloc noexec write align=1
global str_FmtNumFirstLast, str_FmtNumInitialLast, str_FmtNumNameSuffix, str_FmtNumName, str_SSS, str_CSS, str_SS, str_CS
global str_CSCS, str_CS2, str_spCS, str_GoneForTheGame, str_S8, str_FmtParenD, str_D, str_2d02d
str_FmtNumFirstLast:                            ; string "%s#%d %s %s%s"; used by FormatPlayerName
        db 025h,073h,023h,025h,064h,020h,025h,073h,020h,025h,073h,025h,073h,00h
str_FmtNumInitialLast:                          ; string "%s#%d %c. %s%s"; used by FormatPlayerName
        db 025h,073h,023h,025h,064h,020h,025h,063h,02Eh,020h,025h,073h,025h,073h,00h
str_FmtNumNameSuffix:                           ; string "%s#%d %s%s"; used by FormatPlayerName
        db 025h,073h,023h,025h,064h,020h,025h,073h,025h,073h,00h
str_FmtNumName:                                 ; string "%s#%d %s"; used by FormatPlayerName
        db 025h,073h,023h,025h,064h,020h,025h,073h,00h
str_SSS:                                        ; string '%s %s%s'; used by FormatScorerName
        db 025h,073h,020h,025h,073h,025h,073h,00h
str_CSS:                                        ; string '%c. %s%s'; used by FormatScorerName
        db 025h,063h,02Eh,020h,025h,073h,025h,073h,00h
str_SS:                                         ; string '%s%s'; used by FormatScorerName
        db 025h,073h,025h,073h,00h
str_CS:                                         ; string '(%c. %s)'; used by FormatAssistNames
        db 028h,025h,063h,02Eh,020h,025h,073h,029h,00h
str_CSCS:                                       ; string '(%c.%s,%c.%s)'; used by FormatAssistNames
        db 028h,025h,063h,02Eh,025h,073h,02Ch,025h,063h,02Eh,025h,073h,029h,00h
str_CS2:                                        ; string '(%c.%s'; used by FormatAssistNames
        db 028h,025h,063h,02Eh,025h,073h,00h
str_spCS:                                       ; string ' %c.%s)'; used by FormatAssistNames
        db 020h,025h,063h,02Eh,025h,073h,029h,00h
str_GoneForTheGame:                             ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h
str_S8:                                         ; string '%s'; used by BuildEventLines
        db 025h,073h,00h
str_FmtParenD:                                  ; string " (%d)"; used by BuildEventLines
        db 020h,028h,025h,064h,029h,00h
str_D:                                          ; string '#%d'; used by BuildEventLines
        db 023h,025h,064h,00h
str_2d02d:                                      ; string '%2d:%02d'; used by BuildEventLines
        db 025h,032h,064h,03Ah,025h,030h,032h,064h,00h
