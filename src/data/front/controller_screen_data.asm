; Initialised data of front/controller_screen (src/front/controller_screen).
bits 32
%include "hockey.inc"
section s_11D92C progbits alloc noexec write align=1
global ControllerPreGame, ControllerColumnsDrawn, ControllerSlotStates, ControllerSlotItems, ControllerColumnInfo, ControllerLayout, ControllerButtonOutline, ControllerTextIds
global ControllerSlotPositions, ControllerOptionRows, ControllerTitlePos

ControllerPreGame:                              ; controller screen opened before a game; used by
                                                ; ControllerScreen, RunControllerScreen
        db 00h,00h
ControllerColumnsDrawn:                         ; controller columns have been drawn; used by
                                                ; ControllerScreen, DrawControllerColumns
        db 01h,00h
ControllerSlotStates:                           ; state of each controller slot; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
ControllerSlotItems:                            ; item shown in each controller slot; used by
                                                ; ControllerScreen, DrawControllerColumns
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
ControllerColumnInfo:                           ; controller screen column info; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 04Fh,00h,00h,00h
ControllerLayout:                               ; controller screen layout table; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 0F5h,00h,00h,00h,077h,00h,00h,00h,0F5h,00h,00h,00h,077h,00h,00h,00h
        db 023h,01h,00h,00h
        db 04Fh,00h,00h,00h
        db 023h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,07Ch,00h,00h,00h,0Ch,01h,00h,00h,086h,00h,00h,00h
        db 0F7h,00h,00h,00h,0BCh,00h,00h,00h,0F7h,00h,00h,00h
        db 0C6h,00h,00h,00h
        db 0Ch,01h,00h,00h,0BCh,00h,00h,00h,021h,01h,00h,00h,087h,00h,00h,00h
        db 021h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,01Ah,01h,00h,00h,0Ch,01h,00h,00h,024h,01h,00h,00h
        db 0F7h,00h,00h,00h,05Ah,01h,00h,00h,0F7h,00h,00h,00h,064h,01h,00h,00h
        db 0Ch,01h,00h,00h,05Ah,01h,00h,00h,020h,01h,00h,00h,025h,01h,00h,00h
        db 020h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 0B7h,01h,00h,00h
        db 0Dh,01h,00h,00h,0C1h,01h,00h,00h,0F7h,00h,00h,00h,0F7h,01h,00h,00h
        db 0F7h,00h,00h,00h,01h,02h,00h,00h,0Dh,01h,00h,00h,0F7h,01h,00h,00h
        db 021h,01h,00h,00h,0C3h,01h,00h,00h,021h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,02h,00h,00h
        db 0F5h,00h,00h,00h,031h,02h,00h,00h,0F5h,00h,00h,00h,031h,02h,00h,00h
        db 023h,01h,00h,00h,09h,02h,00h,00h,023h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04Fh,00h,00h,00h
        db 025h,01h,00h,00h,077h,00h,00h,00h,025h,01h,00h,00h,077h,00h,00h,00h
        db 053h,01h,00h,00h,04Fh,00h,00h,00h,053h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07Ch,00h,00h,00h
        db 03Ch,01h,00h,00h,087h,00h,00h,00h,026h,01h,00h,00h,0BCh,00h,00h,00h
        db 026h,01h,00h,00h,0C6h,00h,00h,00h,03Bh,01h,00h,00h,0BDh,00h,00h,00h
        db 051h,01h,00h,00h,088h,00h,00h,00h,051h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01Ah,01h,00h,00h
        db 03Bh,01h,00h,00h,025h,01h,00h,00h,027h,01h,00h,00h,05Bh,01h,00h,00h
        db 027h,01h,00h,00h,064h,01h,00h,00h,03Dh,01h,00h,00h,05Ah,01h,00h,00h
        db 050h,01h,00h,00h,026h,01h,00h,00h,050h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0B8h,01h,00h,00h
        db 03Ch,01h,00h,00h,0C1h,01h,00h,00h,027h,01h,00h,00h,0F7h,01h,00h,00h
        db 027h,01h,00h,00h,02h,02h,00h,00h,03Ch,01h,00h,00h,0F7h,01h,00h,00h
        db 050h,01h,00h,00h,0C2h,01h,00h,00h,050h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,02h,00h,00h
        db 025h,01h,00h,00h,031h,02h,00h,00h,025h,01h,00h,00h,031h,02h,00h,00h
        db 053h,01h,00h,00h,09h,02h,00h,00h,053h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04Fh,00h,00h,00h
        db 056h,01h,00h,00h,077h,00h,00h,00h,056h,01h,00h,00h,077h,00h,00h,00h
        db 084h,01h,00h,00h,04Fh,00h,00h,00h,084h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07Ch,00h,00h,00h
        db 06Dh,01h,00h,00h,087h,00h,00h,00h,058h,01h,00h,00h,0BDh,00h,00h,00h
        db 058h,01h,00h,00h,0C6h,00h,00h,00h,06Dh,01h,00h,00h,0BCh,00h,00h,00h
        db 082h,01h,00h,00h,088h,00h,00h,00h,082h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01Bh,01h,00h,00h
        db 06Dh,01h,00h,00h,024h,01h,00h,00h,058h,01h,00h,00h,05Ah,01h,00h,00h
        db 058h,01h,00h,00h,064h,01h,00h,00h,06Ch,01h,00h,00h,05Ah,01h,00h,00h
        db 081h,01h,00h,00h,025h,01h,00h,00h,081h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0B7h,01h,00h,00h
        db 06Dh,01h,00h,00h,0C1h,01h,00h,00h,058h,01h,00h,00h,0F7h,01h,00h,00h
        db 058h,01h,00h,00h,01h,02h,00h,00h,06Ch,01h,00h,00h,0F8h,01h,00h,00h
        db 081h,01h,00h,00h,0C1h,01h,00h,00h,081h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,02h,00h,00h
        db 056h,01h,00h,00h,031h,02h,00h,00h,056h,01h,00h,00h,031h,02h,00h,00h
        db 084h,01h,00h,00h,09h,02h,00h,00h,084h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04Fh,00h,00h,00h
        db 086h,01h,00h,00h,077h,00h,00h,00h,086h,01h,00h,00h,077h,00h,00h,00h
        db 0B4h,01h,00h,00h,04Fh,00h,00h,00h,0B4h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07Ch,00h,00h,00h
        db 09Dh,01h,00h,00h,087h,00h,00h,00h,087h,01h,00h,00h,0BCh,00h,00h,00h
        db 087h,01h,00h,00h,0C6h,00h,00h,00h,09Ch,01h,00h,00h,0BDh,00h,00h,00h
        db 0B1h,01h,00h,00h,086h,00h,00h,00h,0B1h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01Ah,01h,00h,00h
        db 09Dh,01h,00h,00h,025h,01h,00h,00h,088h,01h,00h,00h,05Bh,01h,00h,00h
        db 088h,01h,00h,00h,064h,01h,00h,00h,09Dh,01h,00h,00h,05Ah,01h,00h,00h
        db 0B1h,01h,00h,00h,025h,01h,00h,00h,0B1h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0B7h,01h,00h,00h
        db 09Dh,01h,00h,00h,0C2h,01h,00h,00h,088h,01h,00h,00h,0F7h,01h,00h,00h
        db 088h,01h,00h,00h,02h,02h,00h,00h,09Eh,01h,00h,00h,0F8h,01h,00h,00h
        db 0B2h,01h,00h,00h,0C2h,01h,00h,00h,0B2h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,09h,02h,00h,00h
        db 086h,01h,00h,00h,031h,02h,00h,00h,086h,01h,00h,00h,031h,02h,00h,00h
        db 0B4h,01h,00h,00h,09h,02h,00h,00h,0B4h,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
ControllerButtonOutline:                        ; controller screen button outline; used by ControllerScreen
        db 07Eh,00h,00h,00h,0C4h,01h,00h,00h,08Ah,00h,00h,00h,0BEh,01h,00h,00h
        db 0FAh,00h,00h,00h,0BEh,01h,00h,00h,05h,01h,00h,00h,0C5h,01h,00h,00h
        db 05h,01h,00h,00h,0CFh,01h,00h,00h,0FAh,00h,00h,00h,0D4h,01h,00h,00h
        db 08Ah,00h,00h,00h,0D4h,01h,00h,00h,07Eh,00h,00h,00h,0CDh,01h,00h,00h
ControllerTextIds:                              ; controller screen text ids; used by ControllerScreen
        db 07Eh,01h,00h,00h,0C4h,01h,00h,00h,089h,01h,00h,00h,0BDh,01h,00h,00h
        db 0F7h,01h,00h,00h,0BDh,01h,00h,00h,03h,02h,00h,00h,0C5h,01h,00h,00h
        db 03h,02h,00h,00h,0CFh,01h,00h,00h,0F5h,01h,00h,00h,0D5h,01h,00h,00h
        db 088h,01h,00h,00h,0D5h,01h,00h,00h,07Eh,01h,00h,00h,0CDh,01h,00h,00h
ControllerSlotPositions:                        ; controller slot positions; used by ControllerScreen
        db 067h,00h,00h,00h
ControllerOptionRows:                           ; controller option rows; used by ControllerScreen
        db 011h,01h,00h,00h,0A5h,00h,00h,00h,011h,01h,00h,00h,043h,01h,00h,00h
        db 011h,01h,00h,00h,0E0h,01h,00h,00h,011h,01h,00h,00h,020h,02h,00h,00h
        db 011h,01h,00h,00h,067h,00h,00h,00h,042h,01h,00h,00h,0A5h,00h,00h,00h
        db 042h,01h,00h,00h,043h,01h,00h,00h,042h,01h,00h,00h,0E0h,01h,00h,00h
        db 042h,01h,00h,00h,020h,02h,00h,00h,042h,01h,00h,00h,067h,00h,00h,00h
        db 072h,01h,00h,00h,0A5h,00h,00h,00h,072h,01h,00h,00h,043h,01h,00h,00h
        db 072h,01h,00h,00h,0E0h,01h,00h,00h,072h,01h,00h,00h,020h,02h,00h,00h
        db 072h,01h,00h,00h,067h,00h,00h,00h,0A3h,01h,00h,00h,0A5h,00h,00h,00h
        db 0A3h,01h,00h,00h,043h,01h,00h,00h,0A3h,01h,00h,00h,0E0h,01h,00h,00h
        db 0A3h,01h,00h,00h,020h,02h,00h,00h,0A3h,01h,00h,00h
ControllerTitlePos:                             ; controller screen title position; used by ControllerScreen
        db 0BDh,00h,00h,00h
        db 0CAh,01h,00h,00h
        db 0BCh,01h,00h,00h
        db 0CAh,01h,00h,00h
