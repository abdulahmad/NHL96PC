; Initialised data of engine/lines (src/engine/lines).
bits 32
%include "hockey.inc"
section s_11A310 progbits alloc noexec write align=1
global dressbystatus, lineslotgroups, lineslotgroupstart, DemoMode, SortFrameCount, SortLastIndex, SortSpriteCount
dressbystatus:                                  ; used by BuildDefaultLines, CanFillLineSlot, PickExtraSkater
                                                ; ...
        db 00h,00h,02h,01h,01h,00h,00h,01h,00h
lineslotgroups:                                 ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,03h,06h,09h,0FFh,01h,04h,07h,0Ah,0FFh,02h,05h,08h,0Bh,0FFh,0Ch
        db 0Eh,010h,0FFh,0Dh,0Fh,011h,0FFh,012h,017h,01Ch,020h,00h,03h,06h,09h,0FFh
        db 013h,018h,01Dh,021h,01h,04h,07h,0Ah,0FFh,014h,019h,02h,05h,08h,0Bh,0FFh
        db 015h,01Ah,01Eh,022h,0Ch,0Eh,010h,0FFh,016h,01Bh,01Fh,023h,0Dh,0Fh,011h,0FFh
        db 01Ch,020h,012h,017h,00h,03h,06h,09h,0FFh,01Dh,021h,013h,018h,01h,04h,07h
        db 0Ah,0FFh,01Eh,022h,015h,01Ah,0Ch,0Eh,010h,0FFh,01Fh,023h,016h,01Bh,0Dh,0Fh
        db 011h,0FFh,026h,02Ah,00h,03h,06h,09h,0FFh,027h,02Bh,02Eh,031h,01h,04h,07h
        db 0Ah,0FFh,028h,02Ch,02Fh,032h,0Ch,0Eh,010h,0FFh,029h,02Dh,030h,033h,0Dh,0Fh
        db 011h,0FFh,02Eh,031h,027h,02Bh,01h,04h,07h,0Ah,0FFh,02Fh,032h,028h,02Ch,0Ch
        db 0Eh,010h,0FFh,030h,033h,029h,02Dh,0Dh,0Fh,011h,0FFh
lineslotgroupstart:                             ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,05h,0Ah,00h,05h,0Ah,00h,05h,0Ah,00h,05h,0Ah,0Fh,013h,0Fh,013h
        db 0Fh,013h,017h,020h,029h,030h,038h,017h,020h,029h,030h,038h,040h,049h,052h,05Ah
        db 040h,049h,052h,05Ah,05h,05h,062h,069h,072h,07Ah,062h,069h,072h,07Ah,082h,08Bh
        db 093h,082h,08Bh,093h
DemoMode:                                       ; 1 during the attract demo; used by CamShotNetShake,
                                                ; CrowdOnStoppage, Gameloop_gameovercall ...
        db 00h,00h,00h,00h,0FFh,0FFh
SortFrameCount:                                 ; Sprite sort frame counter; used by ResetPeriodState,
                                                ; SortSpritesForDraw
        db 01h,00h
SortLastIndex:                                  ; Last sprite sort index, -1 for none; used by
                                                ; ResetPeriodState, SortSpritesForDraw
        db 0FFh,0FFh
SortSpriteCount:                                ; Sprites in the sort list; used by SortSpritesForDraw
        db 00h,00h,00h,00h,00h,00h
