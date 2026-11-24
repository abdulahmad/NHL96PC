; Initialised data of front/season_menu (src/front/season_menu).
bits 32
%include "hockey.inc"
section s_11E39C progbits alloc noexec write align=1
global SeasonMenuLast
SeasonMenuLast:                                 ; last season menu choice; used by SeasonMenuScreen
        db 0FFh,0FFh,0FFh,0FFh
