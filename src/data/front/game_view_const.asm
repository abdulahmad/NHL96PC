; Strings and constants of front/game_view (src/front/game_view), in link order.
bits 32
%include "hockey.inc"
section s_111008 progbits alloc noexec write align=1
global str_LUT, str_Logo, str_Priority, str_B001, str_B000, str_Empty, str_DS, str_Goal0
global str_Goal1, str_2d02d2, str_2d01d, str_DDD2, str_DDD3, str_3s, str_2d, str_12s
global str_SS2, str_12, str_24, str_32, str_42
str_LUT:                                        ; string "LUT"; used by AllocShadeLut
        db 04Ch,055h,054h,00h
str_Logo:                                       ; string 'logo'; used by LoadIceLogo
        db 06Ch,06Fh,067h,06Fh,00h
str_Priority:                                   ; string 'priority'; used by InitGameView
        db 070h,072h,069h,06Fh,072h,069h,074h,079h,00h
str_B001:                                       ; string 'b001'; used by InitGameView
        db 062h,030h,030h,031h,00h
str_B000:                                       ; string 'b000'; used by InitGameView
        db 062h,030h,030h,030h,00h
str_Empty:                                      ; Empty string; used by DrawPlayerNamePanel, DrawRosterNumber
        db 00h
str_DS:                                         ; string '%d %s'; used by DrawRosterNumber
        db 025h,064h,020h,025h,073h,00h
str_Goal0:                                      ; string 'goal0'; used by PlaceGoalNets
        db 067h,06Fh,061h,06Ch,030h,00h
str_Goal1:                                      ; string 'goal1'; used by PlaceGoalNets
        db 067h,06Fh,061h,06Ch,031h,00h
str_2d02d2:                                     ; string '%2d:%02d'; used by DrawGameClock, DrawPenaltyClock
        db 025h,032h,064h,03Ah,025h,030h,032h,064h,00h
str_2d01d:                                      ; string '%2d.%01d'; used by DrawGameClock
        db 025h,032h,064h,02Eh,025h,030h,031h,064h,00h
str_DDD2:                                       ; string '%d.%d%% (%d)'; used by DrawPlayerPctPanel
        db 025h,064h,02Eh,025h,064h,025h,025h,020h,028h,025h,064h,029h,00h
str_DDD3:                                       ; string '%d.%d%% (%d)'; used by DrawPlayerPctPanel
        db 025h,064h,02Eh,025h,064h,025h,025h,020h,020h,028h,025h,064h,029h,00h
str_3s:                                         ; string '%-3s'; used by DrawScorePanel, DrawTimeLeftPanel
        db 025h,02Dh,033h,073h,00h
str_2d:                                         ; string '%2d'; used by DrawScorePanel, DrawTimeLeftPanel
        db 025h,032h,064h,00h
str_12s:                                        ; string '%-12s'; used by DrawScorePanel
        db 025h,02Dh,031h,032h,073h,00h
str_SS2:                                        ; string '%s %s'; used by DrawGoalEventPanel
        db 025h,073h,020h,025h,073h,00h
str_12:                                         ; string '1'; used by DrawLineChangeBox
        db 031h,00h
str_24:                                         ; string '2'; used by DrawLineChangeBox
        db 032h,00h
str_32:                                         ; string '3'; used by DrawLineChangeBox
        db 033h,00h
str_42:                                         ; string '4'; used by DrawLineChangeBox
        db 034h,00h,00h,00h,00h
