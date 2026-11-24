; BSS of front/play_game (src/front/play_game).
bits 32
%include "hockey.inc"
section s_151B80 nobits alloc noexec write align=1
global fadeinpending, GameFrameCount
fadeinpending:                                  ; used by BlankForFadeIn, Gameloop_hotkeyscall,
                                                ; Gameloop_inputcheck ...
        resb 4
GameFrameCount:                                 ; Game frames run (saved with the game state); used by
                                                ; Gameloop_inputcheck, Gameloop_nextperiodcall, LoadGameState
                                                ; ...
        resb 3
