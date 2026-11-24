; Initialised data of pc/link (src/pc/link).
bits 32
%include "hockey.inc"
section s_114F1C progbits alloc noexec write align=1
extern str_0, str_0_ModemResultCodeTable, str_1, str_10, str_102, str_13, str_132, str_17
extern str_172, str_2, str_23, str_232, str_25, str_252, str_26, str_262
extern str_27, str_272, str_3, str_35, str_352, str_36, str_362, str_4
extern str_5, str_6, str_6_ModemResultCodeTable, str_7, str_8, str_BUSY, str_CONNECT, str_CONNECT1200
extern str_CONNECT14400, str_CONNECT14400ARQ, str_CONNECT14400ARQHST, str_CONNECT14400HST, str_CONNECT2400, str_CONNECT9600, str_CONNECT9600ARQ, str_CONNECT9600ARQHST
extern str_CONNECT9600HST, str_ERROR, str_fe1, str_fe2, str_fe3, str_fe4, str_fe5, str_fe7
extern str_fe8, str_NOANSWER, str_NOCARRIER, str_NODIALTONE, str_NODIALTONE2, str_OK, str_RING
global ModemResultTextTable, ModemResultCodeTable, ModemResultCount, ModemLastResult, LinkTickCount, LinkPortHandle, LinkBaudSetting, LinkOpenFlags
global LinkRetryOn, LinkCarrierCheck, LinkPollOn, LinkIsOpen, LinkWindowSize, LinkAckOn, LinkResendOn, LinkOpenMode
global LinkErrorCount, LinkSpareHook, LinkMessageHandler, LinkTickHandler, LinkResendHandler, LinkTxSeq, LinkRxDeliverSeq, LinkAckedSeq
global LinkRxSeq, LinkPacketLen, LinkTxPending, LinkState, LinkCheckPeriod, LinkRetryLimit, LinkCopyLow, LinkCopyHigh
global LinkCopyStep, LinkRxHead, LinkRxCount, LinkChannelTimers, LinkPollState, str_0123456789abcdefghijklmn
ModemResultTextTable:                           ; modem result text string table; used by ModemReadResult
        dd str_OK
        dd str_0
ModemResultCodeTable:                           ; modem result code string table; used by ModemReadResult
        dd str_0_ModemResultCodeTable
        dd str_CONNECT
        dd str_1
        dd str_fe1
        dd str_RING
        dd str_2
        dd str_fe2
        dd str_NOCARRIER
        dd str_3
        dd str_fe3
        dd str_ERROR
        dd str_4
        dd str_fe4
        dd str_CONNECT1200
        dd str_5
        dd str_fe5
        dd str_NODIALTONE
        dd str_6
        dd str_6_ModemResultCodeTable
        dd str_NODIALTONE2
        dd str_6
        dd str_6_ModemResultCodeTable
        dd str_BUSY
        dd str_7
        dd str_fe7
        dd str_NOANSWER
        dd str_8
        dd str_fe8
        dd str_CONNECT2400
        dd str_10
        dd str_102
        dd str_CONNECT9600
        dd str_13
        dd str_132
        dd str_CONNECT9600ARQ
        dd str_17
        dd str_172
        dd str_CONNECT9600HST
        dd str_23
        dd str_232
        dd str_CONNECT9600ARQHST
        dd str_27
        dd str_272
        dd str_CONNECT14400
        dd str_25
        dd str_252
        dd str_CONNECT14400ARQ
        dd str_26
        dd str_262
        dd str_CONNECT14400HST
        dd str_35
        dd str_352
        dd str_CONNECT14400ARQHST
        dd str_36
        dd str_362
ModemResultCount:                               ; number of modem result codes; used by ModemReadResult
        db 013h,00h,00h,00h
ModemLastResult:                                ; last modem result code; used by ModemReadResult
        db 00h,00h,00h,00h
LinkTickCount:                                  ; Link: timer ticks; used by LinkDefaults, LinkExchangeInput,
                                                ; LinkTimerTick
        db 00h,00h,00h,00h
LinkPortHandle:                                 ; Link: serial port handle; used by LinkCarrierOK, LinkClose,
                                                ; LinkConnect ...
        db 00h,00h,00h,00h
LinkBaudSetting:                                ; link baud rate setting; used by LinkDefaults, LinkOpen
        db 09h,00h,00h,00h
LinkOpenFlags:                                  ; Link: open flags; used by LinkDefaults, LinkOpen
        db 00h,00h,00h,00h
LinkRetryOn:                                    ; Link: retries on; used by LinkConnect, LinkDefaults,
                                                ; LinkOpen
        db 01h,00h,00h,00h
LinkCarrierCheck:                               ; Link: check the carrier; used by LinkCarrierOK, LinkClose,
                                                ; LinkConnect ...
        db 01h,00h,00h,00h
LinkPollOn:                                     ; Link: timer polling on; used by LinkDefaults, LinkOpen,
                                                ; LinkPoll ...
        db 01h,00h,00h,00h
LinkIsOpen:                                     ; Link: port open; used by LinkClose, LinkDefaults, LinkOpen
        db 00h,00h,00h,00h
LinkWindowSize:                                 ; Link: packets in flight (4); used by LinkDefaults, LinkOpen
        db 04h,00h,00h,00h
LinkAckOn:                                      ; Link: acknowledges on; used by LinkConnect, LinkDefaults,
                                                ; LinkOpen ...
        db 01h,00h,00h,00h
LinkResendOn:                                   ; Link: resends on; used by LinkDefaults, LinkOpen
        db 01h,00h,00h,00h
LinkOpenMode:                                   ; Link: open mode; used by LinkOpen
        db 01h,00h,00h,00h
LinkErrorCount:                                 ; Link: errors; used by LinkDefaults, LinkOpen
        db 00h,00h,00h,00h
LinkSpareHook:                                  ; Link: spare hook; used by SetLinkSpareHook
        db 00h,00h,00h,00h
LinkMessageHandler:                             ; Link: message handler; used by LinkDeliverMessages,
                                                ; SetLinkMessageHandler
        db 00h,00h,00h,00h
LinkTickHandler:                                ; Link: per-tick handler; used by LinkPoll, LinkReceive,
                                                ; LinkTimerTick ...
        db 00h,00h,00h,00h
LinkResendHandler:                              ; Link: resend handler; used by LinkParsePacket,
                                                ; LinkRequestResend, SetLinkMessageHandler
        db 00h,00h,00h,00h
LinkTxSeq:                                      ; Link: next transmit sequence; used by LinkDefaults,
                                                ; LinkSendMessage
        db 00h,00h,00h,00h
LinkRxDeliverSeq:                               ; Link: next sequence to deliver; used by LinkDefaults,
                                                ; LinkDeliverMessages
        db 00h,00h,00h,00h
LinkAckedSeq:                                   ; Link: last acknowledged sequence, -1 for none; used by
                                                ; LinkAckThrough, LinkDefaults
        db 0FFh,0FFh,0FFh,0FFh
LinkRxSeq:                                      ; Link: last received sequence, -1 for none; used by
                                                ; LinkCheckTimeouts, LinkDefaults, LinkFirstMissingRx ...
        db 0FFh,0FFh,0FFh,0FFh
LinkPacketLen:                                  ; Link: length of the packet being parsed; used by
                                                ; LinkParsePacket, LinkReceive
        db 00h,00h,00h,00h
LinkTxPending:                                  ; Link: packets waiting for an acknowledge; used by
                                                ; LinkAckThrough, LinkDefaults, LinkSendMessage
        db 00h,00h,00h,00h
LinkState:                                      ; Link: connection state; used by LinkClose, LinkConnect,
                                                ; LinkDefaults ...
        db 00h,00h,00h,00h
LinkCheckPeriod:                                ; Link: ticks between checks; used by LinkDefaults, LinkOpen,
                                                ; LinkPoll ...
        db 00h,00h,00h,00h
LinkRetryLimit:                                 ; link retry limit; used by LinkDefaults, LinkOpen, LinkPoll
                                                ; ...
        db 06h,00h,00h,00h
LinkCopyLow:                                    ; link copy lower limit; used by LinkCheckTimeouts,
                                                ; LinkCopyBytes
        db 032h,00h,00h,00h
LinkCopyHigh:                                   ; link copy upper limit; used by LinkCheckTimeouts,
                                                ; LinkCopyBytes, LinkRequestMissing ...
        db 064h,00h,00h,00h
LinkCopyStep:                                   ; link copy step; used by LinkCheckTimeouts, LinkCopyBytes
        db 0Ah,00h,00h,00h
LinkRxHead:                                     ; Link: receive ring head; used by LinkDefaults,
                                                ; LinkParsePacket, LinkReceive ...
        db 00h,00h,00h,00h
LinkRxCount:                                    ; Link: bytes in the receive ring; used by LinkDefaults,
                                                ; LinkParsePacket, LinkReceive ...
        db 00h,00h,00h,00h
LinkChannelTimers:                              ; link channel timers; used by LinkTimerTick
        db 03Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h
LinkPollState:                                  ; link poll state; used by LinkPoll
        db 00h,00h,00h,00h
str_0123456789abcdefghijklmn:                   ; string '0123456789abcdefghijklmnopqrstuvwxyz '; used by
                                                ; LinkRequestMissing
        db 030h,031h,032h,033h,034h,035h,036h,037h,038h,039h,061h,062h,063h,064h,065h,066h
        db 067h,068h,069h,06Ah,06Bh,06Ch,06Dh,06Eh,06Fh,070h,071h,072h,073h,074h,075h,076h
        db 077h,078h,079h,07Ah,0Ah,00h,00h,00h
