; Initialised data of pc/modem_teams (src/pc/modem_teams).
bits 32
%include "hockey.inc"
section s_11ED38 progbits alloc noexec write align=1
global ModemPanelY, ModemAwayPanelX, ModemPanelXs, ModemHomeBmp, ModemAwayBmp, ModemHomeLogo, ModemAwayLogo, ModemHomeName
global ModemAwayName, ModemHomeText, ModemAwayText
ModemPanelY:                                    ; modem team select panel y position; used by
                                                ; ModemTeamSelectScreen
        db 081h,00h,00h,00h
ModemAwayPanelX:                                ; modem away team panel x position; used by
                                                ; DrawModemAwayPanel, ModemTeamSelectScreen
        db 0FFh,01h,00h,00h
ModemPanelXs:                                   ; modem team select panel x positions; used by
                                                ; DrawModemAwayPanel, DrawModemHomePanel,
                                                ; ModemTeamSelectScreen
        db 020h,01h,00h,00h,03Ch,01h,00h,00h,058h,01h,00h,00h,074h,01h,00h,00h
        db 091h,01h,00h,00h,0ADh,01h,00h,00h
ModemHomeBmp:                                   ; modem home team panel bitmap; used by DrawModemHomePanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemAwayBmp:                                   ; modem away team panel bitmap; used by DrawModemAwayPanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemHomeLogo:                                  ; modem home team logo; used by DrawModemHomePanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemAwayLogo:                                  ; modem away team logo; used by DrawModemAwayPanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemHomeName:                                  ; modem home team name; used by DrawModemHomePanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemAwayName:                                  ; modem away team name; used by DrawModemAwayPanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemHomeText:                                  ; modem home team text; used by DrawModemHomePanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
ModemAwayText:                                  ; modem away team text; used by DrawModemAwayPanel,
                                                ; ModemTeamSelectScreen
        db 00h,00h,00h,00h
