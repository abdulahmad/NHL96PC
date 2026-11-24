; BSS of front/screen_art (src/front/screen_art).
bits 32
%include "hockey.inc"
section s_17BA7C nobits alloc noexec write align=1
global FrontEndBarShapes, FrontEndArtFiles, ScreenColorMap, SideBarBmp, BottomBarBmp, ScreenPaletteBuf, TitleBarBmp, FrontEndScreenBmp
global MatchupLayer, TeamStatsBitmap, SideBarArt, MenuBoxStyle, BottomBarArt, TitleBarArt, TitleTextStyle, SlideImageNames
FrontEndBarShapes:                              ; Front end bar shapes: side, bottom and title (34h bytes each
                                                ; with a count); used by LoadFrontEndArt, OpenScreen
        resb 52
        resb 4
        resb 52
        resb 4
        resb 52
        resb 4
FrontEndArtFiles:                               ; Front end art files; used by FreeFrontEndArt,
                                                ; LoadFrontEndArt
        resb 64
ScreenColorMap:                                 ; Front end screen colour map; used by CopyArtRows,
                                                ; SetScreenColors
        resb 256
SideBarBmp:                                     ; Front end side bar bitmap; used by FreeFrontEndArt,
                                                ; LoadFrontEndArt, OpenScreen ...
        resb 4
BottomBarBmp:                                   ; Front end bottom bar bitmap; used by FreeFrontEndArt,
                                                ; LoadFrontEndArt, OpenScreen ...
        resb 4
ScreenPaletteBuf:                               ; Front end screen palette; used by LoadFrontEndArt,
                                                ; SetScreenColors
        resb 4
TitleBarBmp:                                    ; Front end title bar bitmap; used by FreeFrontEndArt,
                                                ; LoadFrontEndArt, OpenScreen ...
        resb 4
FrontEndScreenBmp:                              ; Front end screen bitmap; used by ControllerScreen,
                                                ; DrawControllerColumns, DrawPlayoffTeamList ...
        resb 4
MatchupLayer:                                   ; matchup draw layer; used by ControllerScreen,
                                                ; DrawControllerColumns, DrawPlayoffTeamList ...
        resb 4
TeamStatsBitmap:                                ; team stats bitmap; used by CalendarScreen,
                                                ; ControlPicksScreen, ControllerScreen ...
        resb 16
SideBarArt:                                     ; Front end side bar art record; used by DrawLinesPanel,
                                                ; DrawUserRecords, LoadFrontEndArt ...
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 8
        resb 8
        resb 4
        resb 4
        resb 1
        resb 1
        resb 1
        resb 33
MenuBoxStyle:                                   ; Front end menu box style; used by ControllerScreen,
                                                ; FreeFrontEndArt, GameStatsScreen ...
        resb 16
BottomBarArt:                                   ; Front end bottom bar art record; used by CalendarScreen,
                                                ; ControlPicksScreen, ControlSetupScreen ...
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 8
        resb 8
        resb 4
        resb 4
        resb 1
        resb 1
        resb 1
        resb 33
        resb 16
TitleBarArt:                                    ; Front end title bar art record; used by LoadFrontEndArt,
                                                ; OpenScreen, SlideInTitleBar
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 8
        resb 8
        resb 4
        resb 4
        resb 1
        resb 1
        resb 1
        resb 33
TitleTextStyle:                                 ; Front end title text style; used by CalendarScreen,
                                                ; CheckExportName, ConfirmTrade ...
        resb 1
        resb 1
        resb 4
SlideImageNames:                                ; Slide show image names
        resb 32
