; Initialised data of front/play_game (src/front/play_game).
bits 32
%include "hockey.inc"
section s_114F04 progbits alloc noexec write align=1
global InputRecordTicks, GameLoopActive, InputRecordBusy, InputRecordPhase, PauseRequested, GameLoopFrames, PauseReplayPending
InputRecordTicks:                               ; ticks since last record, capped 0x3E8; used by
                                                ; InputRecordTimer, PlayGame_initslotscall, RunDemoGame
        db 00h,00h,00h,00h
GameLoopActive:                                 ; 1 while the in-game loop runs; used by EndGameCleanup,
                                                ; Gameloop, Gameloop_gameovercall ...
        db 00h,00h,00h,00h
InputRecordBusy:                                ; re-entry guard of the timer; used by InputRecordTimer
        db 00h,00h
InputRecordPhase:                               ; 3..0 down counter; record on 0; used by InputRecordTimer
        db 00h,00h,00h,00h,00h,00h
PauseRequested:                                 ; Pause requested from the game loop; used by InGameMenu,
                                                ; PauseGame, PlayGame ...
        db 00h,00h
GameLoopFrames:                                 ; Game loop frames (saved with the game state); used by
                                                ; Gameloop_inputcheck, Gameloop_nextperiodcall,
                                                ; LineupLoopFrame ...
        db 00h,00h,00h,00h
PauseReplayPending:                             ; bit0 pause, bit1 replay seen; used by HandleSlotButtons
        db 00h,00h
