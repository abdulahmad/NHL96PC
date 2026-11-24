; Initialised data of front/game_setup (src/front/game_setup).
bits 32
%include "hockey.inc"
section s_1150FC progbits alloc noexec write align=1
global gameresult, gsumheader, GamePad1Dev, GamePad2Dev, GameUserTeam, GameModeFlags, GameStarted, gsumtail
global HomeGoalCount
gameresult:                                     ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h,0FFh,0FFh,0FFh,0FFh,0FEh,0FFh,0FFh,0FFh
gsumheader:                                     ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h
GamePad1Dev:                                    ; controller device for pad 1 at game start; used by
                                                ; InitGameTeams
        db 00h
GamePad2Dev:                                    ; controller device for pad 2 at game start; used by
                                                ; InitGameTeams
        db 00h
GameUserTeam:                                   ; user team at game start; used by InitGameTeams
        db 00h
GameModeFlags:                                  ; game mode flags at game start; used by InitGameTeams
        db 00h
GameStarted:                                    ; game has started; used by InitGameTeams
        db 00h,00h,00h,00h,00h,00h
gsumtail:                                       ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 04h
HomeGoalCount:                                  ; goals counted for the home team; used by InitGameTeams,
                                                ; PostGoalEvent
        db 00h
