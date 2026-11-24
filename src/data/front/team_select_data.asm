; Initialised data of front/team_select (src/front/team_select).
bits 32
%include "hockey.inc"
section s_11E280 progbits alloc noexec write align=1
global TeamSelectY, AwayPanelX, HomePanelX, HomePanelBmp, AwayPanelBmp, HomePanelLogo, AwayPanelLogo, TeamSelectDrawn
global AwayPanelName, PanelTeamNameShift, AwayPanelText
TeamSelectY:                                    ; team select panel y position; used by TeamSelectScreen
        db 081h,00h,00h,00h
AwayPanelX:                                     ; away team panel x position; used by DrawAwayTeamPanel,
                                                ; TeamSelectScreen
        db 04h,02h,00h,00h
HomePanelX:                                     ; home team panel x position; used by DrawAwayTeamPanel,
                                                ; DrawHomeTeamPanel, TeamSelectScreen
        db 038h,01h,00h,00h,04Eh,01h,00h,00h,064h,01h,00h,00h,07Ah,01h,00h,00h
        db 090h,01h,00h,00h,0A6h,01h,00h,00h
HomePanelBmp:                                   ; home team panel bitmap; used by DrawHomeTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
AwayPanelBmp:                                   ; away team panel bitmap; used by DrawAwayTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
HomePanelLogo:                                  ; home team panel logo; used by DrawHomeTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
AwayPanelLogo:                                  ; away team panel logo; used by DrawAwayTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
TeamSelectDrawn:                                ; set once the team select screen is drawn; used by
                                                ; DrawHomeTeamPanel, TeamSelectScreen
        db 00h,00h,00h,00h
AwayPanelName:                                  ; away team panel name; used by DrawAwayTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
PanelTeamNameShift:                             ; team name shift on the team panels; used by
                                                ; DrawHomeTeamPanel, TeamSelectScreen
        db 00h,00h,00h,00h
AwayPanelText:                                  ; away team panel text; used by DrawAwayTeamPanel,
                                                ; TeamSelectScreen
        db 00h,00h,00h,00h
