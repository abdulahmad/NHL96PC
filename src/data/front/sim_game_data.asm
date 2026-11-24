; Initialised data of front/sim_game (src/front/sim_game).
bits 32
%include "hockey.inc"
section s_11E4B8 progbits alloc noexec write align=1
global SimStatWeights, SimTeamFactors, SimPlayerOrder
SimStatWeights:                                 ; stat weights for simulated games; used by ApplyDayResults,
                                                ; ApplyPlayoffDayResults, BuildPlayerStatRows ...
        db 0Fh,00h,00h,00h,01Eh,00h,00h,00h,03Ch,00h,00h,00h
SimTeamFactors:                                 ; team factors for simulated games; used by SimulateGame
        db 00h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h,03h,00h,00h,00h
        db 00h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db 02h,00h,00h,00h,03h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db 02h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
SimPlayerOrder:                                 ; player order for simulated games; used by SimulateGame
        db 00h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 044h,0FDh,0FFh,0FFh,0C8h,00h,00h,00h,070h,0FEh,0FFh,0FFh,090h,01h,00h,00h
        db 00h,00h,00h,00h,0Ch,0FEh,0FFh,0FFh,0F4h,01h,00h,00h,0D4h,0FEh,0FFh,0FFh
        db 0D4h,0FEh,0FFh,0FFh,032h,00h,00h,00h,044h,0FDh,0FFh,0FFh,02Ch,01h,00h,00h
        db 05Eh,01h,00h,00h,00h,00h,00h,00h,0D4h,0FEh,0FFh,0FFh,018h,0FCh,0FFh,0FFh
        db 0F4h,01h,00h,00h,0A8h,0FDh,0FFh,0FFh,064h,00h,00h,00h,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,064h,00h,00h,00h,090h,01h,00h,00h
        db 096h,00h,00h,00h,0A8h,0FDh,0FFh,0FFh
