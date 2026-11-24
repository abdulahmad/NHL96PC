; BSS of pc/modem_teams (src/pc/modem_teams).
bits 32
%include "hockey.inc"
section s_1846F0 nobits alloc noexec write align=1
global ModemPanelArt, TreeLineShift, ModemPanelShapes
ModemPanelArt:                                  ; modem team panel art; used by ModemTeamSelectScreen
        resb 4
TreeLineShift:                                  ; tree line shift per entry; used by DrawModemAwayPanel,
                                                ; DrawModemHomePanel, DrawTreeLine ...
        resb 4
ModemPanelShapes:                               ; modem team panel shapes; used by DrawModemAwayPanel,
                                                ; DrawModemHomePanel, ModemTeamSelectScreen
        resb 4
