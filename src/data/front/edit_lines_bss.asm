; BSS of front/edit_lines (src/front/edit_lines).
bits 32
%include "hockey.inc"
section s_183028 nobits alloc noexec write align=1
global LinesSlotTable, LinesWorkTable


global LinesSortedPlayers, LinesPanelItems

global LinesPanelPlayers
global LinesPlayerOrder, LinesPlayerScore, LinesCursorArt, LinesHoverArt
global LinesIntroTeam, LinesCardSource, LinesEditAway, LinesEditMode, LinesEditTeam
global EditLinesRecords
LinesSortedPlayers:                             ; players sorted for the line editor; used by EditLinesScreen
        resb 112
LinesSlotTable:                                 ; line editor slot table; used by EditLinesScreen,
                                                ; SortTeamPlayers
        resb 1
        resb 1
        resb 1614
LinesPanelItems:                                ; line editor panel items; used by DrawLinesPanel,
                                                ; EditLinesScreen
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 36
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 1152
LinesPanelPlayers:                              ; player shown in each line editor slot; used by
                                                ; DrawLinesPanel
        resb 100
LinesPlayerOrder:                               ; line editor players in position order; used by AutoSetLines,
                                                ; ComparePlayerPos, CountLineSlots ...
        resb 112
LinesPlayerScore:                               ; score of each player for automatic lines; used by
                                                ; AutoSetLines, CompareRosterOrder
        resb 112
EditLinesRecords:                               ; line editor player records (3Ch bytes each); used by
                                                ; EditLinesHoverPanel, EditLinesScreen
        resb 2
        resb 34
        resb 4
        resb 4
        resb 1636
        resb 4
LinesCursorArt:                                 ; line editor cursor art; used by EditLinesHoverPanel,
                                                ; EditLinesScreen
        resb 4
LinesHoverArt:                                  ; line editor hover cursor art; used by EditLinesHoverPanel,
                                                ; EditLinesScreen
        resb 4
LinesIntroTeam:                                 ; team shown in the lines intro; used by EditLinesHoverPanel,
                                                ; EditLinesScreen
        resb 4
LinesCardSource:                                ; player list the line editor opens cards from; used by
                                                ; EditLinesScreen, RunEditLines
        resb 4
LinesEditAway:                                  ; line editor is editing the away team; used by AutoSetLines,
                                                ; ControllerScreen, EditLinesScreen ...
        resb 4
LinesEditMode:                                  ; line editor mode; used by AutoSetLines, ControllerScreen,
                                                ; DrawLinesPanel ...
        resb 4
LinesEditTeam:                                  ; team the line editor is editing; used by ControllerScreen,
                                                ; EditLinesScreen, InGameMenu ...
        resb 4
LinesWorkTable:                                 ; line assignments being edited; used by AutoSetLines,
                                                ; CountLineSlots, DrawLinesPanel ...
        resb 1
        resb 1
        resb 6
        resb 4
        resb 1
        resb 5
        resb 1
        resb 1
        resb 1
        resb 1
        resb 2
        resb 4
        resb 1
        resb 1
        resb 1
        resb 5
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 3
        resb 2
        resb 1
        resb 1
        resb 4
        resb 1
        resb 1
        resb 10
