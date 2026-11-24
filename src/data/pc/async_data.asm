; Initialised data of pc/async (src/pc/async).
bits 32
%include "hockey.inc"
section s_1150E0 progbits alloc noexec write align=1
global AsyncTicks, AsyncQueueTail
AsyncTicks:                                     ; ticks counted during an async read; used by AsyncTimerTick,
                                                ; asyncreader
        db 00h,00h,00h,00h
AsyncQueueTail:                                 ; last request in the async queue; used by AsyncInit,
                                                ; AsyncRequestDone, AsyncTimerTick ...
        db 00h,00h,00h,00h
