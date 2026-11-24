; BSS of front/sim_game (src/front/sim_game).
bits 32
%include "hockey.inc"
section s_17D928 nobits alloc noexec write align=1
global SimWork, SimGoalieBufs, SimPlayerBufs, AwayShotTotals, SimAwayStatsBufs, SimAwaySetBufs, SimLineCounts




SimWork:                                        ; simulated game work area; used by PreGameTeamsScreen,
                                                ; SimulateGame
        resb 8
        resb 8
SimGoalieBufs:                                  ; goalie stat buffers for simulated games; used by
                                                ; SimulateGame
        resb 24
SimPlayerBufs:                                  ; player stat buffers for simulated games; used by
                                                ; SimulateGame
        resb 200
        resb 8
        resb 8
        resb 8
        resb 8
        resb 8
        resb 8
        resb 8
AwayShotTotals:                                 ; away shot totals; used by SimulateGame
        resb 4
        resb 4
SimAwayStatsBufs:                               ; away stat buffers for simulated games; used by SimulateGame
        resb 4
        resb 4
SimAwaySetBufs:                                 ; away game set buffers for simulated games; used by
                                                ; SimulateGame
        resb 8
        resb 4
        resb 4
        resb 4
        resb 4
        resb 8
        resb 4
        resb 4
        resb 8
        resb 8
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 3
        resb 1
SimLineCounts:                                  ; line appearance counts for simulated games; used by
                                                ; SimulateGame
        resb 50
        resb 50
        resb 50
        resb 2
        resb 4
