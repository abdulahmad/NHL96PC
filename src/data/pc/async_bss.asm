; BSS of pc/async (src/pc/async).
bits 32
%include "hockey.inc"
section s_152F60 nobits alloc noexec write align=1
global AsyncRequests, AsyncCurFile, AsyncCurOffset, AsyncFreeList, AsyncCurRequest, AsyncCdFile, AsyncOpenFile, AsyncMemFlags
global AsyncState, AsyncFileHandle, AsyncBytesLeft, AsyncFileStart, AsyncFileSize, AsyncDestBlock, AsyncReqUser, AsyncSkip
global AsyncDestPos, AsyncHeader, AsyncBudget, AsyncStreamFile, AsyncWaitTimer, AsyncTicksPerRead, AsyncReadResult, AsyncMeasuredSpeed
global AsyncReadTime, AsyncBytesRead, AsyncBaseTicks
AsyncRequests:                                  ; pool of async file requests; used by AsyncClose, AsyncInit
        resb 4
AsyncCurFile:                                   ; file of the request being serviced; used by AsyncClose,
                                                ; AsyncRequestOpen, AsyncRequestSection ...
        resb 4
AsyncCurOffset:                                 ; file offset of the request being serviced; used by
                                                ; AsyncClose, AsyncRequestOpen, AsyncRequestSection ...
        resb 4
AsyncFreeList:                                  ; free list of async file requests; used by AsyncInit,
                                                ; AsyncRequestDone, AsyncTimerTick ...
        resb 4
AsyncCurRequest:                                ; async request being serviced; used by asyncreader
        resb 4
AsyncCdFile:                                    ; CD file the async reader has open; used by AsyncClose,
                                                ; AsyncInit, asyncreader
        resb 4
AsyncOpenFile:                                  ; file opened for the async reader; used by AsyncClose,
                                                ; AsyncInit, asyncreader
        resb 4
AsyncMemFlags:                                  ; memory flags for async read buffers; used by asyncreader
        resb 4
AsyncState:                                     ; async reader state; used by AsyncInit, asyncreader
        resb 8
AsyncFileHandle:                                ; DOS handle of the file being streamed; used by AsyncInit,
                                                ; asyncreader, setasyncspeed ...
        resb 4
AsyncBytesLeft:                                 ; bytes left to read for the request; used by asyncreader
        resb 4
AsyncFileStart:                                 ; start offset of the file being read; used by asyncreader
        resb 4
AsyncFileSize:                                  ; size of the file being read; used by asyncreader
        resb 4
AsyncDestBlock:                                 ; memory block the async reader fills; used by asyncreader
        resb 4
AsyncReqUser:                                   ; user word of the request being serviced; used by asyncreader
        resb 4
AsyncSkip:                                      ; bytes to skip before the next read; used by asyncreader
        resb 4
AsyncDestPos:                                   ; write position in the destination block; used by asyncreader
        resb 4
AsyncHeader:                                    ; header read at the start of an async file; used by
                                                ; asyncreader
        resb 4
        resb 4
AsyncBudget:                                    ; read budget left this tick; used by AsyncInit,
                                                ; AsyncTimerTick, asyncreader
        resb 4
AsyncStreamFile:                                ; file the speech stream reads from; used by AsyncInit,
                                                ; setasyncspeed, setasyncspeed_ret
        resb 4
AsyncWaitTimer:                                 ; countdown before the next async step; used by AsyncInit,
                                                ; asyncreader, setasyncspeed ...
        resb 4
AsyncTicksPerRead:                              ; ticks one async read takes; used by AsyncInit, asyncreader,
                                                ; setasyncspeed ...
        resb 8
AsyncReadResult:                                ; result of the last async read; used by asyncreader
        resb 4
AsyncMeasuredSpeed:                             ; measured async read speed; used by setasyncspeed
        resb 4
AsyncReadTime:                                  ; time spent on async reads; used by asyncreader
        resb 4
AsyncBytesRead:                                 ; bytes read by the async reader; used by asyncreader
        resb 4
AsyncBaseTicks:                                 ; ticks measured when the reader started; used by
                                                ; setasyncspeed
        resb 4
