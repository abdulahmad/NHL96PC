; Initialised data of pc/cdstream (src/pc/cdstream).
bits 32
%include "hockey.inc"
section s_1150E8 progbits alloc noexec write align=1
global StreamBlockSize, StreamTimeout, CdStreamReadTime, CdStreamFilled, CdStreamTicks
StreamBlockSize:                                ; stream block size; used by CdStreamInit, CdStreamService,
                                                ; setstreamspeed
        db 0DAh,00h,00h,00h
StreamTimeout:                                  ; stream timeout; used by CdStreamService, CdStreamSyncTime,
                                                ; setstreamspeed
        db 02Ch,01h,00h,00h
CdStreamReadTime:                               ; time spent on CD stream reads; used by CdStreamService
        db 00h,00h,00h,00h
CdStreamFilled:                                 ; CD stream bytes read; used by CdStreamService
        db 00h,00h,00h,00h
CdStreamTicks:                                  ; ticks counted during a CD stream read; used by
                                                ; CdStreamService, CdStreamTimerTick
        db 00h,00h,00h,00h
