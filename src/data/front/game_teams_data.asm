; Initialised data of front/game_teams (src/front/game_teams).
bits 32
%include "hockey.inc"
section s_117575 progbits alloc noexec write align=1
global RosterSlotOrder
RosterSlotOrder:                                ; roster slot order; used by FillTeamRoster
        db 07h,00h,04h,00h,03h,00h,06h,00h,01h,00h,08h,00h,02h,00h,00h,00h
        db 00h,00h,00h
