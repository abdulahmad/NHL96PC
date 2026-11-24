; BSS of pc/modem_setup (src/pc/modem_setup).
bits 32
%include "hockey.inc"
section s_17D590 nobits alloc noexec write align=1
global ControlPicksArt, ControlPicksBmp, ControlPicksItems, ControlPickFlags, ControlPickKeys, DialCursor, DialLength, DialDigitsBmp
global DialAbort
ControlPicksArt:                                ; control picks screen art; used by ControlPicksScreen,
                                                ; PollOptionKeys
        resb 4
ControlPicksBmp:                                ; control picks screen bitmap; used by ControlPicksScreen,
                                                ; PollOptionKeys
        resb 4
ControlPicksItems:                              ; control picks screen items; used by ControlPicksScreen
        resb 184
ControlPickFlags:                               ; control picks option flags; used by ControlPicksScreen,
                                                ; PollOptionKeys
        resb 1
        resb 3
ControlPickKeys:                                ; control picks key table; used by ControlPicksScreen,
                                                ; PollOptionKeys
        resb 36
DialCursor:                                     ; cursor in the dial number field; used by DrawPhoneNumber,
                                                ; ModemDialScreen
        resb 4
DialLength:                                     ; length of the number typed; used by DrawPhoneNumber,
                                                ; ModemDialScreen
        resb 4
DialDigitsBmp:                                  ; dial digits bitmap; used by DrawPhoneNumber, ModemDialScreen
        resb 4
DialAbort:                                      ; used by ModemDialScreen
        resb 4
