; BSS of front/playoff (src/front/playoff).
bits 32
%include "hockey.inc"
section s_1846FC nobits alloc noexec write align=1
global PlayoffTreeLines, PlayoffSlotLogos, PlayoffSlotFlags, TreeBackBmp, TreeScrollStep, statspalshape, TreeViewBmp, TreeScrollY
global TreeScrollTarget, TreeScrollPos, PlayoffSlotOn, PlayoffTeamIn
PlayoffTreeLines:                               ; playoff tree lines, copied from the template; used by
                                                ; DrawPlayoffTree, PlayoffTreeScreen
        resb 4
        resb 12
        resb 4
        resb 940
PlayoffSlotLogos:                               ; logo in each playoff setup slot; used by PickPlayoffTeam,
                                                ; PlayoffSetupScreen
        resb 32
PlayoffSlotFlags:                               ; flags of each playoff setup slot; used by PlayoffSetupScreen
        resb 32
TreeBackBmp:                                    ; playoff tree background bitmap; used by DrawPlayoffTree,
                                                ; DrawTreeLine, PlayoffTreeScreen
        resb 4
TreeScrollStep:                                 ; playoff tree scroll step; used by DrawTreeLine,
                                                ; PlayoffTreeScreen
        resb 4
statspalshape:                                  ; stats palette shape; used by DrawTreeLine, PlayoffTreeScreen
        resb 4
TreeViewBmp:                                    ; playoff tree view bitmap; used by DrawTreeLine,
                                                ; PlayoffTreeScreen
        resb 4
TreeScrollY:                                    ; playoff tree scroll position; used by DrawPlayoffTree,
                                                ; DrawTreeLine, PlayoffTreeScreen
        resb 4
TreeScrollTarget:                               ; playoff tree scroll target; used by DrawTreeLine,
                                                ; PlayoffTreeScreen
        resb 4
TreeScrollPos:                                  ; playoff tree scroll positions; used by DrawTreeLine,
                                                ; PickPlayoffTeam, PlayoffTreeScreen ...
        resb 8
        resb 4
        resb 4
PlayoffSlotOn:                                  ; playoff slot is in use; used by PlayoffTreeScreen
        resb 4
PlayoffTeamIn:                                  ; team is in the playoffs; used by ClearPlayoffTree,
                                                ; DrawPlayoffTree, PlayoffRound1 ...
        resb 16
