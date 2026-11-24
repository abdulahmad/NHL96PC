; BSS of front/settings (src/front/settings).
bits 32
%include "hockey.inc"
section s_17C9A0 nobits alloc noexec write align=1
global gameopts, GlobalSetData, optflags, GsModemFlags
gameopts:                                       ; used by AddPenalty, AutoSwitchPlayer, Bcheck ...
        resb 4
GlobalSetData:                                  ; GLOBAL.SET settings; used by ControlPicksScreen,
                                                ; ReadGlobalSet, WriteGlobalSet
        resb 4
optflags:                                       ; game option flags (bits 7-8 the skill level: 0 Rookie, 80h
                                                ; Pro, 100h All-Star); used by BuildEventLines,
                                                ; BurstDrainEnergy, CalendarScreen ...
        resb 1
GsModemFlags:                                   ; GLOBAL.SET: modem flag bits (bit 0 cleared on defaults);
                                                ; used by ReadGlobalSet
        resb 1
