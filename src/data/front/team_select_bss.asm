; BSS of front/team_select (src/front/team_select).
bits 32
%include "hockey.inc"
section s_17D688 nobits alloc noexec write align=1
global TeamSelectCursor, HomePanelArt, TeamPanelFont
TeamSelectCursor:                               ; team select cursor; used by TeamSelectScreen
        resb 4
HomePanelArt:                                   ; home team panel art; used by DrawAwayTeamPanel,
                                                ; DrawHomeTeamPanel, TeamSelectScreen
        resb 4
TeamPanelFont:                                  ; team panel font; used by DrawAwayTeamPanel,
                                                ; DrawHomeTeamPanel, LoadLangText ...
        resb 4
