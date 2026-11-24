; BSS of front/roster (src/front/roster).
bits 32
%include "hockey.inc"
section s_1821B4 nobits alloc noexec write align=1
global LineForwardOrder, LineDefenceOrder, RosterRecords, CreatePlayerShapes, TeamRatingScore, LineForwardCount, RosterBackFile, LineDefenceCount
LineForwardOrder:                               ; forwards sorted for automatic lines; used by ResetTeamLines
        resb 112
LineDefenceOrder:                               ; defencemen sorted for automatic lines; used by
                                                ; ResetTeamLines
        resb 112
RosterRecords:                                  ; roster screen player records (3Ch bytes each); used by
                                                ; RosterScreen
        resb 2
        resb 34
        resb 4
        resb 3320
CreatePlayerShapes:                             ; create player screen shape file; used by CreatePlayerScreen,
                                                ; CycleLoadingArt, DrawCreatePlayerRow
        resb 4
TeamRatingScore:                                ; rating score per team for the team rankings; used by
                                                ; CompareTeamRating, SortTeamRatings, TeamRankDefence ...
        resb 100
LineForwardCount:                               ; number of forwards sorted for automatic lines; used by
                                                ; ResetTeamLines
        resb 4
RosterBackFile:                                 ; roster back art file; used by CreatePlayerScreen,
                                                ; FormatRosterLine, ListRosterPlayers ...
        resb 4
LineDefenceCount:                               ; number of defencemen sorted for automatic lines; used by
                                                ; ResetTeamLines
        resb 4
