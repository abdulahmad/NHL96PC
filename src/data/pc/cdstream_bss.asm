; BSS of pc/cdstream (src/pc/cdstream).
bits 32
%include "hockey.inc"
section s_152FD8 nobits alloc noexec write align=1
global StreamSpeed, StreamRate, StreamWalk, StreamHandle
StreamSpeed:                                    ; CD stream ticks per block; used by setstreamspeed
        resb 4
StreamRate:                                     ; CD stream rate; used by setstreamspeed
        resb 4
StreamWalk:                                     ; stream entry being walked; used by CdStreamInit,
                                                ; CdStreamService
        resb 4
StreamHandle:                                   ; CD stream handle; used by CdStreamInit,
                                                ; CdStreamInitSecondary, CdStreamService ...
        resb 4
