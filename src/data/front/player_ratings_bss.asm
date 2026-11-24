; BSS of front/player_ratings (src/front/player_ratings).
bits 32
%include "hockey.inc"
section s_182128 nobits alloc noexec write align=1
global RatingsCardBmp, RatingsGoalieOrder, GoalieCardRemap, SkaterCardRemap, RatingsDimRemap, RatingsShownId, TeamScoringScore
RatingsCardBmp:                                 ; ratings card bitmap; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        resb 4
RatingsGoalieOrder:                             ; goalie order on the ratings page; used by
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        resb 4
GoalieCardRemap:                                ; goalie card colour remap; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        resb 4
SkaterCardRemap:                                ; skater card colour remap; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        resb 4
RatingsDimRemap:                                ; ratings screen dimming remap; used by PlayerRatingsScreen,
                                                ; SwitchRatingsCard
        resb 4
RatingsShownId:                                 ; player shown on the ratings card; used by
                                                ; PlayerRatingsScreen, SwitchRatingsCard
        resb 4
        resb 4
TeamScoringScore:                               ; scoring score per team for the team rankings; used by
                                                ; CompareTeamScoring, ComputeTeamRanks, PlayerRatingsScreen
                                                ; ...
        resb 112
