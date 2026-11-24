; Initialised data of front/movie (src/front/movie).
bits 32
%include "hockey.inc"
section s_11D3B8 progbits alloc noexec write align=1
global TgvFpsSetting, TgvFlags, TgvStartTick, TgvPauseTick
TgvFpsSetting:                                  ; movie frame rate; used by TgvClock, TgvNextFrame
        db 0Fh,00h,00h,00h
TgvFlags:                                       ; movie player flags; used by PlayMovie, PlayTGV, TgvNextFrame
                                                ; ...
        db 00h,00h,00h,00h
TgvStartTick:                                   ; tick count when the movie started; used by TgvClock
        db 00h,00h,00h,00h
TgvPauseTick:                                   ; tick count when the movie paused; used by TgvClock
        db 00h,00h,00h,00h
