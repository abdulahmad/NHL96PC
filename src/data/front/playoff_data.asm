; Initialised data of front/playoff (src/front/playoff).
bits 32
%include "hockey.inc"
section s_11ED78 progbits alloc noexec write align=1
extern GraphicsReady, joyenablemask, MenuScreenBitmap, MouseButtons, MouseButtonState, MouseDeltaX, MouseForceTwoButtons, mousemaxx
extern mousemaxy, mouseminx, mouseminy, MouseMoved, MousePresent, MouseSavedSensX, MouseSavedSensY, MouseSavedThreshold
extern mousex, mousey, PlayoffLeaderLists, PointerCount, ScreenBuffer, ScreenModeHeight, ScreenModeWidth, ScreenPitch
extern ViewScreenHeight, ViewScreenWidth
global PlayoffMode, PlayoffSlotX, PlayoffSlotY, PlayoffSetupTextIds, PlayoffRoundTextIds, PlayoffSeriesWins, PlayoffTreeY, PlayoffTreeColumnsX
global PlayoffSeriesLayout, FinalGameNum, PlayoffSparkleSoundOn, PlayoffTreeNavLinks, PlayoffTreeTemplate, TreeShapeLeft, TreeShapeRight, TreeShapeCentre
global TreeShapeFinal, PlayoffBracketOrder
PlayoffMode:                                    ; playoff menus mode; used by PlayoffSetupScreen,
                                                ; RunPlayoffMenus
        db 00h,00h,00h,00h
PlayoffSlotX:                                   ; playoff setup slot x positions; used by DrawPlayoffSlotLogo,
                                                ; DrawPlayoffTeamList, PlayoffSetupScreen
        db 035h,00h,00h,00h,039h,00h,00h,00h,03Eh,00h,00h,00h,041h,00h,00h,00h
        db 046h,00h,00h,00h,04Ah,00h,00h,00h,04Eh,00h,00h,00h,052h,00h,00h,00h
PlayoffSlotY:                                   ; playoff setup slot y positions; used by DrawPlayoffSlotLogo,
                                                ; DrawPlayoffTeamList, PlayoffSetupScreen
        db 087h,00h,00h,00h,0A8h,00h,00h,00h,0D4h,00h,00h,00h,0F4h,00h,00h,00h
        db 01Fh,01h,00h,00h,041h,01h,00h,00h,06Eh,01h,00h,00h,08Eh,01h,00h,00h
PlayoffSetupTextIds:                            ; playoff setup text ids; used by PlayoffSetupScreen
        db 026h,02h,00h,00h,021h,02h,00h,00h,01Eh,02h,00h,00h,01Ah,02h,00h,00h
PlayoffRoundTextIds:                            ; playoff round text ids; used by PlayoffTreeScreen
        db 016h,02h,00h,00h,013h,02h,00h,00h,011h,02h,00h,00h,0Ch,02h,00h,00h
PlayoffSeriesWins:                              ; wins needed in each playoff series; used by DrawPlayoffTree
        db 04h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h
        db 08h,00h,00h,00h,08h,00h,00h,00h,010h,00h,00h,00h,020h,00h,00h,00h
        db 020h,00h,00h,00h,020h,00h,00h,00h,020h,00h,00h,00h,040h,00h,00h,00h
        db 040h,00h,00h,00h,080h,00h,00h,00h,00h,01h,00h,00h
PlayoffTreeY:                                   ; playoff tree y positions; used by DrawPlayoffTree
        db 01Eh,00h,00h,00h,020h,00h,00h,00h,023h,00h,00h,00h,025h,00h,00h,00h
        db 027h,00h,00h,00h,02Ah,00h,00h,00h,02Dh,00h,00h,00h,030h,00h,00h,00h
        db 0BBh,03h,00h,00h,0B7h,03h,00h,00h,0B5h,03h,00h,00h,0B1h,03h,00h,00h
        db 0ACh,03h,00h,00h,0A8h,03h,00h,00h,0A2h,03h,00h,00h,09Fh,03h,00h,00h
        db 0B2h,00h,00h,00h,0B4h,00h,00h,00h,0BAh,00h,00h,00h,0BDh,00h,00h,00h
        db 024h,03h,00h,00h,01Eh,03h,00h,00h,018h,03h,00h,00h,014h,03h,00h,00h
        db 04Ah,01h,00h,00h,04Ch,01h,00h,00h,085h,02h,00h,00h,081h,02h,00h,00h
        db 0C6h,01h,00h,00h,0C6h,01h,00h,00h,0C7h,01h,00h,00h
PlayoffTreeColumnsX:                            ; playoff tree column positions; used by DrawPlayoffTree
        db 0Dh,00h,00h,00h,02Fh,00h,00h,00h,05Bh,00h,00h,00h,07Bh,00h,00h,00h
        db 0A8h,00h,00h,00h,0C8h,00h,00h,00h,0F6h,00h,00h,00h,016h,01h,00h,00h
        db 0Dh,00h,00h,00h,02Fh,00h,00h,00h,05Bh,00h,00h,00h,07Bh,00h,00h,00h
        db 0A8h,00h,00h,00h,0C8h,00h,00h,00h,0F6h,00h,00h,00h,016h,01h,00h,00h
        db 078h,00h,00h,00h,098h,00h,00h,00h,0C4h,00h,00h,00h,0E8h,00h,00h,00h
        db 078h,00h,00h,00h,098h,00h,00h,00h,0C4h,00h,00h,00h,0E8h,00h,00h,00h
        db 0AEh,00h,00h,00h,0D1h,00h,00h,00h,0AEh,00h,00h,00h,0D1h,00h,00h,00h
        db 040h,00h,00h,00h,081h,00h,00h,00h,0EDh,00h,00h,00h
PlayoffSeriesLayout:                            ; playoff series layout; used by ClearPlayoffTree,
                                                ; DrawPlayoffTree, PlayoffRound1 ...
        db 00h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h
        db 02h,00h,00h,00h,02h,00h,00h,00h,03h,00h,00h,00h,03h,00h,00h,00h
        db 07h,00h,00h,00h,07h,00h,00h,00h,08h,00h,00h,00h,08h,00h,00h,00h
        db 09h,00h,00h,00h,09h,00h,00h,00h,0Ah,00h,00h,00h,0Ah,00h,00h,00h
        db 04h,00h,00h,00h,04h,00h,00h,00h,05h,00h,00h,00h,05h,00h,00h,00h
        db 0Bh,00h,00h,00h,0Bh,00h,00h,00h,0Ch,00h,00h,00h,0Ch,00h,00h,00h
        db 06h,00h,00h,00h,06h,00h,00h,00h,0Dh,00h,00h,00h,0Dh,00h,00h,00h
FinalGameNum:                                   ; final game number; used by PlayoffFinal
        db 0Eh,00h,00h,00h,0Eh,00h,00h,00h,063h,00h,00h,00h
PlayoffSparkleSoundOn:                          ; set once the playoff sparkle sound plays; used by
                                                ; DrawPlayoffTree, DrawTreeLine, PlayoffTreeScreen
        db 00h,00h,00h,00h
PlayoffTreeNavLinks:                            ; playoff tree button neighbours; used by PlayoffTreeScreen
        db 09h,00h,07h,02h,0Fh,01h,03h,0Eh,08h,02h,00h,013h,011h,03h,013h,01h
        db 04h,05h,04h,08h,04h,06h,05h,08h,05h,07h,06h,09h,06h,00h,07h,09h
        db 08h,00h,05h,0Ah,08h,00h,06h,0Ah,012h,02h,06h,011h,0Bh,0Ch,0Fh,0Bh
        db 0Bh,0Dh,0Fh,0Ch,0Ch,0Eh,010h,0Dh,0Dh,01h,010h,0Eh,0Fh,010h,011h,0Ch
        db 0Fh,01h,011h,0Dh,012h,03h,0Ah,0Dh,012h,03h,05h,0Ch
PlayoffTreeTemplate:                            ; playoff tree line template; used by PlayoffTreeScreen
        db 062h,0FFh,0FFh,0FFh,076h,00h,00h,00h,0CDh,0FFh,0FFh,0FFh,076h,00h,00h,00h
        db 0D3h,0FFh,0FFh,0FFh,0ADh,00h,00h,00h,069h,0FFh,0FFh,0FFh,0ACh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06Bh,0FFh,0FFh,0FFh,0C2h,00h,00h,00h,0D7h,0FFh,0FFh,0FFh,0C2h,00h,00h,00h
        db 0DDh,0FFh,0FFh,0FFh,0FAh,00h,00h,00h,070h,0FFh,0FFh,0FFh,0FAh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 073h,0FFh,0FFh,0FFh,0Fh,01h,00h,00h,0DEh,0FFh,0FFh,0FFh,0Fh,01h,00h,00h
        db 0E6h,0FFh,0FFh,0FFh,046h,01h,00h,00h,078h,0FFh,0FFh,0FFh,046h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07Dh,0FFh,0FFh,0FFh,05Eh,01h,00h,00h,0E7h,0FFh,0FFh,0FFh,05Eh,01h,00h,00h
        db 0EEh,0FFh,0FFh,0FFh,095h,01h,00h,00h,082h,0FFh,0FFh,0FFh,094h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,00h,00h,00h,0E0h,00h,00h,00h,06Fh,00h,00h,00h,0E0h,00h,00h,00h
        db 075h,00h,00h,00h,019h,01h,00h,00h,0Ah,00h,00h,00h,019h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,00h,00h,00h,02Dh,01h,00h,00h,076h,00h,00h,00h,02Dh,01h,00h,00h
        db 07Dh,00h,00h,00h,065h,01h,00h,00h,012h,00h,00h,00h,065h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 099h,00h,00h,00h,019h,01h,00h,00h,04h,01h,00h,00h,018h,01h,00h,00h
        db 0Dh,01h,00h,00h,052h,01h,00h,00h,0A0h,00h,00h,00h,051h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0B1h,02h,00h,00h,075h,00h,00h,00h,01Eh,03h,00h,00h,075h,00h,00h,00h
        db 015h,03h,00h,00h,0ADh,00h,00h,00h,0A7h,02h,00h,00h,0ADh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A7h,02h,00h,00h,0C1h,00h,00h,00h,014h,03h,00h,00h,0C1h,00h,00h,00h
        db 0Eh,03h,00h,00h,0FBh,00h,00h,00h,09Eh,02h,00h,00h,0FBh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A0h,02h,00h,00h,0Dh,01h,00h,00h,0Ch,03h,00h,00h,0Dh,01h,00h,00h
        db 05h,03h,00h,00h,046h,01h,00h,00h,098h,02h,00h,00h,046h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 097h,02h,00h,00h,05Dh,01h,00h,00h,01h,03h,00h,00h,05Ch,01h,00h,00h
        db 0FBh,02h,00h,00h,095h,01h,00h,00h,08Eh,02h,00h,00h,095h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 014h,02h,00h,00h,0DFh,00h,00h,00h,081h,02h,00h,00h,0DFh,00h,00h,00h
        db 07Ah,02h,00h,00h,018h,01h,00h,00h,0Ch,02h,00h,00h,017h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Eh,02h,00h,00h,02Bh,01h,00h,00h,078h,02h,00h,00h,02Bh,01h,00h,00h
        db 071h,02h,00h,00h,063h,01h,00h,00h,06h,02h,00h,00h,063h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07Ah,01h,00h,00h,018h,01h,00h,00h,0E6h,01h,00h,00h,018h,01h,00h,00h
        db 0DEh,01h,00h,00h,04Fh,01h,00h,00h,071h,01h,00h,00h,050h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,00h,00h,09Fh,00h,00h,00h,07Ah,01h,00h,00h,09Fh,00h,00h,00h
        db 079h,01h,00h,00h,0FFh,00h,00h,00h,08h,01h,00h,00h,0FEh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
TreeShapeLeft:                                  ; tree shape table, left side; used by PlayoffTreeScreen
        db 03h,01h,00h,00h,0C1h,01h,00h,00h,0Ah,01h,00h,00h,0B6h,01h,00h,00h
        db 084h,01h,00h,00h,0B6h,01h,00h,00h,08Ch,01h,00h,00h,0C3h,01h,00h,00h
        db 082h,01h,00h,00h,0CFh,01h,00h,00h,0Bh,01h,00h,00h,0CEh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
TreeShapeRight:                                 ; tree shape table, right side; used by PlayoffTreeScreen
        db 060h,00h,00h,00h,0C0h,01h,00h,00h,067h,00h,00h,00h,0B4h,01h,00h,00h
        db 0E5h,00h,00h,00h,0B5h,01h,00h,00h,0EAh,00h,00h,00h,0C2h,01h,00h,00h
        db 0E1h,00h,00h,00h,0CBh,01h,00h,00h,06Bh,00h,00h,00h,0CBh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
TreeShapeCentre:                                ; tree shape table, centre; used by PlayoffTreeScreen
        db 09Ah,01h,00h,00h,0BFh,01h,00h,00h,0A3h,01h,00h,00h,0B3h,01h,00h,00h
        db 01Ah,02h,00h,00h,0B4h,01h,00h,00h,022h,02h,00h,00h,0C2h,01h,00h,00h
        db 01Bh,02h,00h,00h,0CBh,01h,00h,00h,0A3h,01h,00h,00h,0CCh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
TreeShapeFinal:                                 ; tree shape table, final; used by PlayoffTreeScreen
        db 03h,01h,00h,00h,0C1h,01h,00h,00h,0Ah,01h,00h,00h,0B6h,01h,00h,00h
        db 084h,01h,00h,00h,0B6h,01h,00h,00h,08Ch,01h,00h,00h,0C3h,01h,00h,00h
        db 082h,01h,00h,00h,0CFh,01h,00h,00h,0Bh,01h,00h,00h,0CEh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
PlayoffBracketOrder:                            ; playoff bracket order; used by PlayoffRound1, PlayoffRound2,
                                                ; PlayoffRound3
        db 00h,02h,04h,06h,07h,05h,03h,01h
        db 08h,0Ah,0Ch,0Eh,0Fh,0Dh,0Bh,09h
        db 010h,012h,013h,011h
        db 014h,016h,017h,015h
        db 018h,019h
        db 01Ah,01Bh
        db 01Ch
        db 01Dh,00h,00h


global LeaderCardFlags, LeadersBuilt, LeaderCardTextIds, LeaderColTextIds, mouseminx, mouseminy, mousemaxx, mousemaxy
global MouseDeltaX, MouseButtonState, MouseForceTwoButtons, GraphicsReady, MousePresent, mousex, mousey, MouseMoved
global PointerCount, MouseButtons, ViewScreenWidth, ViewScreenHeight, MenuScreenBitmap, ScreenPitch, ScreenBuffer, ScreenModeWidth
global ScreenModeHeight, joyenablemask, LeaderListPtrs
global MouseSavedSensX, MouseSavedSensY, MouseSavedThreshold
LeaderCardTextIds:                              ; playoff leader card text ids; used by ShowPlayoffLeaderCard
        db 040h,01h,00h,00h,043h,01h,00h,00h,042h,01h,00h,00h,044h,01h,00h,00h
        db 046h,01h,00h,00h,041h,01h,00h,00h,03Eh,01h,00h,00h,048h,01h,00h,00h
        db 045h,01h,00h,00h,03Fh,01h,00h,00h,047h,01h,00h,00h,04Ah,01h,00h,00h
        db 049h,01h,00h,00h
LeaderColTextIds:                               ; playoff leader column text ids; used by
                                                ; ShowPlayoffLeaderCard
        db 03Ch,01h,00h,00h,03Dh,01h,00h,00h,03Eh,01h,00h,00h,03Fh,01h,00h,00h
        db 040h,01h,00h,00h,041h,01h,00h,00h,042h,01h,00h,00h,043h,01h,00h,00h
        db 044h,01h,00h,00h,045h,01h,00h,00h,046h,01h,00h,00h,047h,01h,00h,00h
        db 048h,01h,00h,00h
LeaderCardFlags:                                ; playoff leader card flags; used by ShowPlayoffLeaderCard
        db 01h,01h,01h,01h,00h,00h,01h,02h,01h
LeadersBuilt:                                   ; playoff leaders have been built; used by BuildPlayoffLeaders
        db 01h,02h,02h,02h
LeaderListPtrs:                                 ; pointers to the playoff leader lists; used by
                                                ; BuildPlayoffLeaders, ShowPlayoffLeaderCard
        dd PlayoffLeaderLists+0AC2h
        dd PlayoffLeaderLists+0A93h
        dd PlayoffLeaderLists+3A1h
        dd PlayoffLeaderLists+0A35h
        dd PlayoffLeaderLists+33Ch
        dd PlayoffLeaderLists+306h
        dd PlayoffLeaderLists+0A64h
        db 00h,00h,00h,00h
        dd PlayoffLeaderLists+372h
        dd PlayoffLeaderLists+3D0h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
