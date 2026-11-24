; BSS of front/ingame_menu (src/front/ingame_menu).
bits 32
%include "hockey.inc"
section s_1843F8 nobits alloc noexec write align=1
global PlayoffTreeLabels, InGameMenuArt, InGameMenuShapes, InGameMenuState, InGameBoxXs, InGameBoxYs, InGameScaleStep, InGameItemList
global InGameTitleItems, InGameFrameBmp, InGameTimeText, InGameScoreText, InGameTitleText

global InGameBoxRight, InGameBoxBottom, InGameBoxLeft, InGameBoxTop, InterRegBuffer



global InGameMenuWork
InGameBoxRight:                                 ; in-game menu box right edge; used by InGameMenu,
                                                ; OpenFrontEndFromGame, ReturnToGameView
        resb 4
InGameBoxBottom:                                ; in-game menu box bottom edge; used by InGameMenu,
                                                ; OpenFrontEndFromGame, ReturnToGameView
        resb 4
InGameBoxLeft:                                  ; in-game menu box left edge; used by InGameMenu,
                                                ; OpenFrontEndFromGame, ReturnToGameView
        resb 4
InGameBoxTop:                                   ; in-game menu box top edge; used by InGameMenu,
                                                ; OpenFrontEndFromGame, ReturnToGameView
        resb 4
InterRegBuffer:                                 ; intermission register buffer; used by InGameMenu,
                                                ; InGameReturnMenu
        resb 4
InGameMenuWork:                                 ; in-game menu work area; used by InGameMenu, RedrawInGameMenu
        resb 16
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 4
        resb 3
        resb 49
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 4
        resb 2
        resb 60
        resb 4
        resb 37
        resb 61
        resb 4
        resb 36
        resb 1
        resb 2
        resb 59
        resb 4
        resb 36
        resb 1
        resb 1
        resb 20
PlayoffTreeLabels:                              ; playoff tree label positions; used by PlayoffTreeScreen
        resb 4
        resb 12
        resb 4
        resb 20
InGameMenuArt:                                  ; in-game menu art; used by InGameMenu
        resb 4
InGameMenuShapes:                               ; in-game menu shapes; used by InGameMenu
        resb 36
InGameMenuState:                                ; in-game menu state bytes; used by InGameMenu
        resb 2
        resb 1
        resb 33
InGameBoxXs:                                    ; in-game menu box x positions in use; used by
                                                ; DrawInGameMenuFrame, InGameMenu, InGameReturnMenu
        resb 4
InGameBoxYs:                                    ; in-game menu box y positions in use; used by
                                                ; DrawInGameMenuFrame, InGameMenu, InGameReturnMenu
        resb 4
InGameScaleStep:                                ; in-game menu scale step; used by DrawInGameMenuFrame,
                                                ; InGameMenu
        resb 4
InGameItemList:                                 ; in-game menu items in use; used by DrawInGameMenuFrame,
                                                ; InGameMenu
        resb 4
InGameTitleItems:                               ; in-game menu title items in use; used by
                                                ; DrawInGameMenuFrame, InGameMenu
        resb 4
InGameFrameBmp:                                 ; in-game menu frame bitmap; used by DrawInGameMenuFrame,
                                                ; InGameMenu
        resb 4
InGameTimeText:                                 ; in-game menu time text; used by InGameMenu
        resb 10
InGameScoreText:                                ; in-game menu score text; used by DrawInGameMenuFrame,
                                                ; InGameMenu
        resb 50
InGameTitleText:                                ; in-game menu title text; used by InGameMenu
        resb 44
