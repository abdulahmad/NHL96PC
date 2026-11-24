; Initialised data of front/roster (src/front/roster).
bits 32
%include "hockey.inc"
section s_11E8D4 progbits alloc noexec write align=1
extern str_LFT, str_PosCEN, str_PosDEF, str_PosGOL, str_RHT
global TradeTextIds, RosterFirstRun, RatingsGoalieShown, RatingsSkaterShown, LoadingArtFrame, PositionTags
TradeTextIds:                                   ; trade screen text ids; used by ConfirmTrade
        db 0EFh,01h,00h,00h,0F0h,01h,00h,00h,0F1h,01h,00h,00h,0F2h,01h,00h,00h
        db 0F3h,01h,00h,00h,0F4h,01h,00h,00h,0F5h,01h,00h,00h,0F6h,01h,00h,00h
        db 02Bh,02h,00h,00h
RosterFirstRun:                                 ; roster screens not opened yet; used by RosterScreen,
                                                ; RunRosterScreens
        db 01h,00h,00h,00h
RatingsGoalieShown:                             ; goalie shown on the ratings page; used by
                                                ; PlayerRatingsScreen, RosterScreen
        db 0FFh,0FFh,0FFh,0FFh
RatingsSkaterShown:                             ; skater shown on the ratings page; used by
                                                ; PlayerRatingsScreen, RosterScreen
        db 0FFh,0FFh,0FFh,0FFh
LoadingArtFrame:                                ; loading art animation frame; used by CycleLoadingArt
        db 01h,00h,00h,00h
PositionTags:                                   ; position tags for the create player screen; used by
                                                ; CreatePlayerScreen
        dd str_PosCEN
        dd str_LFT
        dd str_RHT
        dd str_PosDEF
        dd str_PosGOL
