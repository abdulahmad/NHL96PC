; BSS of front/team_ranks (src/front/team_ranks).
bits 32
%include "hockey.inc"
section s_152A6C nobits alloc noexec write align=1
global PenaltyKillRanks, PowerPlayRanks
PenaltyKillRanks:                               ; penalty kill rank per team; used by ComparePenaltyKillPct,
                                                ; GetSpecialTeamsRanks
        resb 104
PowerPlayRanks:                                 ; power play rank per team; used by ComparePowerPlayPct,
                                                ; GetSpecialTeamsRanks
        resb 104
