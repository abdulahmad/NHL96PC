; BSS of front/new_season (src/front/new_season).
bits 32
%include "hockey.inc"
section s_17D6C8 nobits alloc noexec write align=1
global GreyColorOrder, NewSeasonChoice
GreyColorOrder:                                 ; grey colour order table; used by CompareGrey, SortGreyColors
        resb 256
NewSeasonChoice:                                ; choice on the new season screen; used by NewSeasonScreen
        resb 4
