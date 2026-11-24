; BSS of front/season_menu (src/front/season_menu).
bits 32
%include "hockey.inc"
section s_17D7CC nobits alloc noexec write align=1
global statsbgshapes, SeasonMenuActive
statsbgshapes:                                  ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 4
SeasonMenuActive:                               ; season menu is active; used by CreateSeason, RunSeasonMenus
        resb 4
