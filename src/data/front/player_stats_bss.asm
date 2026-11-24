; BSS of front/player_stats (src/front/player_stats).
bits 32
%include "hockey.inc"
section s_17E9D0 nobits alloc noexec write align=1
extern BackgroundShapes, CardJerseyNumber, CardPhotoBmp, CardRemapIndex, CardRemapPlain, CardRemapTable, CardSlideBmp, CardSlideFrom
extern CardSlideStep, CardSlideTo, CardTitleTime, CardXlatTable
global PlayerStatsButtonArt, PlayerStatsTabArt, PlayerStatsTabLit, PlayerStatsButtonPos, PlayerPosCodes, RatingsPosCodes, PlayerRowTeam, PlayerRowShown
global PlayerStatsCompare, StatsFromGame
PlayerStatsButtonArt:                           ; player stats screen button bitmaps; used by
                                                ; AnimatePlayerStatsButton, AnimatePlayerStatsButtons,
                                                ; PlayerStatsScreen
        resb 4

global PlayerStatsButtonBmps
global PlayerStatsHeaderArt, PlayerRecPtrs
global PlayerHeightPtrs, PlayerWeightPtrs









global TitleBlinkTime, PlayerStatsShapes
global RatingsPlayerId, PlayerStatsRowCount, PlayerStatRowsUsed, PlayerStatsMode, TitleBlinkFrame, PlayerCardArt, EditLinesBuffer, RosterFirstNamePtrs
global RosterJerseyPtrs, StatColumnPtrs
global RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs
global CardRemapTable, CardPhotoBmp, CardRemapPlain, CardSlideFrom, CardSlideTo, CardJerseyNumber, BackgroundShapes, CardSlideBmp
global CardRemapIndex, CardTitleTime, CardXlatTable, CardSlideStep, PlayerStatsItems
global PlayerStatsHScroll, PlayerStatsVScroll, PlayerStatColFlags

        resb 4
        resb 4
        resb 116
PlayerStatsTabArt:                              ; player stats tab bitmap per column pair; used by
                                                ; AnimatePlayerStatsButton, AnimatePlayerStatsButtons,
                                                ; PlayerStatsColumnLabels ...
        resb 4
PlayerStatsTabLit:                              ; player stats tab bitmap, highlighted; used by
                                                ; AnimatePlayerStatsButton, AnimatePlayerStatsButtons,
                                                ; PlayerStatsColumnLabels ...
        resb 4
PlayerStatsButtonPos:                           ; player stats button positions; used by PlayerStatsScreen
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
PlayerStatsButtonBmps:                          ; player stats button bitmaps built for the screen; used by
                                                ; PlayerStatsScreen
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 228
PlayerStatsHeaderArt:                           ; player stats column header bitmaps; used by
                                                ; AnimatePlayerStatsButton, AnimatePlayerStatsButtons,
                                                ; PlayerStatsScreen
        resb 4
        resb 4
        resb 88
PlayerPosCodes:                                 ; position letter of each roster player; used by
                                                ; BuildPlayerStatRows, CountPlayerStatRows, DrawPlayerCardName
                                                ; ...
        resb 28
RatingsPosCodes:                                ; position letter of each player on the ratings screen; used
                                                ; by PlayerRatingsScreen
        resb 740
PlayerRecPtrs:                                  ; pointer to each roster player's record; used by
                                                ; BuildPlayerStatRows, CountPlayerStatRows,
                                                ; DrawPlayerStatsTable ...
        resb 3071
PlayerRowTeam:                                  ; team of each player stats row; used by BuildPlayerStatRows,
                                                ; FillGoalieStatRows, FillSkaterStatRows
        resb 1
PlayerRowShown:                                 ; player stats row is shown; used by CountPlayerStatRows
        resb 764
        resb 4
PlayerHeightPtrs:                               ; pointers to each player's height; used by
                                                ; BuildPlayerStatRows, ComparePlayerStatRows,
                                                ; DrawPlayerCardName ...
        resb 4
PlayerWeightPtrs:                               ; pointers to each player's weight; used by
                                                ; BuildPlayerStatRows, DrawPlayerCardName,
                                                ; DrawPlayerStatsTable ...
        resb 4
PlayerStatsItems:                               ; player stats screen items (66h bytes each); used by
                                                ; PlayerStatsScreen
        resb 16
        resb 4
        resb 6
        resb 12
        resb 4
        resb 16
        resb 4
        resb 40
        resb 16
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 40
        resb 16
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 16
        resb 4
        resb 40
        resb 16
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 16
        resb 4
        resb 40
        resb 16
        resb 4
        resb 6
        resb 4
        resb 8
        resb 4
        resb 16
        resb 4
        resb 7
        resb 49
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 56
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 56
        resb 4
        resb 6
        resb 4
        resb 4
        resb 4
        resb 4
        resb 16
        resb 4
        resb 40
PlayerStatsHScroll:                             ; player stats horizontal scroll bar; used by
                                                ; PlayerStatsScreen
        resb 26
        resb 4
        resb 8
        resb 4
        resb 290
        resb 4
        resb 8
        resb 4
        resb 60
PlayerStatsVScroll:                             ; player stats vertical scroll bar; used by PlayerStatsScreen
        resb 26
        resb 4
        resb 8
        resb 4
        resb 24
        resb 266
        resb 4
        resb 8
        resb 4
        resb 6792
TitleBlinkTime:                                 ; tick count for the next title frame; used by
                                                ; PlayerStatsScreen, ShowPlayerStatsTitle
        resb 4
PlayerStatsShapes:                              ; player stats screen shape file; used by PlayerStatsScreen,
                                                ; ShowPlayerStatsTitle
        resb 4
RatingsPlayerId:                                ; player shown on the ratings screen; used by
                                                ; PlayerRatingsScreen, PlayerStatsScreen, RunEditLines ...
        resb 4
PlayerStatsRowCount:                            ; number of player stats rows; used by PlayerStatsScreen,
                                                ; RunStatsMenu
        resb 4
PlayerStatColFlags:                             ; player stats column flags; used by BuildPlayerStatRows
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 464
PlayerStatRowsUsed:                             ; player stats rows filled; used by CountPlayerStatRows,
                                                ; FillSkaterStatRows, PlayerStatsScreen
        resb 4
PlayerStatsMode:                                ; player stats screen mode; used by ComparePlayerStatRows,
                                                ; DrawPlayerStatsTable, ExportPlayerStats ...
        resb 4
TitleBlinkFrame:                                ; current title frame; used by ShowPlayerCardTitle,
                                                ; ShowPlayerStatsTitle
        resb 4
PlayerCardArt:                                  ; player card art file; used by PlayerCardScreen,
                                                ; PlayerStatsScreen, ShowPlayerCardTitle ...
        resb 4
EditLinesBuffer:                                ; line editor work buffer; used by EditLinesScreen,
                                                ; FillGoalieStatRows, FillSkaterStatRows ...
        resb 4
RosterFirstNamePtrs:                            ; pointers to each roster player's first name; used by
                                                ; BuildPlayerStatRows, ComparePlayerStatRows,
                                                ; DrawPlayerCardName ...
        resb 4
RosterJerseyPtrs:                               ; pointers to each roster player's jersey field; used by
                                                ; ComparePlayerStatRows, DrawPlayerCardName,
                                                ; DrawPlayerStatsTable ...
        resb 4
StatColumnPtrs:                                 ; pointer arrays for each player stats column; used by
                                                ; BuildPlayerStatRows, ComparePlayerStatRows,
                                                ; DrawPlayerStatsTable ...
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
RosterPlayerPtrs:                               ; pointers to each roster player's entry; used by
                                                ; DrawPlayerCardName, DrawPlayerCardStats, DrawRatingBars ...
        resb 4
RosterProfilePtrs:                              ; pointers to each roster player's profile; used by
                                                ; BuildPlayerStatRows, ComparePlayerNames, DrawPlayerCardName
                                                ; ...
        resb 4
RosterLastNamePtrs:                             ; pointers to each roster player's last name; used by
                                                ; BuildPlayerStatRows, ComparePlayerNames, DrawPlayerCardName
                                                ; ...
        resb 4
PlayerStatsCompare:                             ; player stats compare button is shown; used by
                                                ; PlayerStatsScreen, ShowPlayerStatsTitle
        resb 1
StatsFromGame:                                  ; stats screens opened from a game; used by InGameMenu,
                                                ; PlayerStatsScreen, PostGameScreens
        resb 3
