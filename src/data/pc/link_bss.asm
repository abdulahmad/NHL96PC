; BSS of pc/link (src/pc/link).
bits 32
%include "hockey.inc"
section s_151B87 nobits alloc noexec write align=1
global LinkRxPayload, LinkRxMsgs, LinkRxSlots, LinkTxSlots, LinkTxTimers, LinkPortName, LinkModemString, LinkRxRing
global LinkAbortCheck, LinkResendPkt, LinkAckPkt, LinkRxHeader, LinkRxBuffer, LinkMissingList
LinkRxPayload:                                  ; Link: payload bytes of LinkRxMsgs, indexed from 1; used by
                                                ; LinkStoreRxMessage
        resb 1
LinkRxMsgs:                                     ; Link: received messages, 7 bytes each (6 payload bytes, then
                                                ; a full flag); used by LinkClearRxSlot, LinkDeliverMessages,
                                                ; LinkRequestResend ...
        resb 6
        resb 442
LinkRxSlots:                                    ; Link: receive slots, 16 bytes each (state, length, sequence,
                                                ; time); used by LinkCheckTimeouts, LinkClearRxSlot,
                                                ; LinkFirstMissingRx ...
        resb 4
        resb 4
        resb 4
        resb 988
        resb 4
        resb 4
        resb 16
LinkTxSlots:                                    ; Link: transmit slots, 24 bytes each (state, length,
                                                ; sequence, then the packet); used by LinkAckThrough,
                                                ; LinkCheckTimeouts, LinkClearRxSlot ...
        resb 4
        resb 4
        resb 7
        resb 1521
LinkTxTimers:                                   ; Link: transmit retry timers; used by LinkCheckTimeouts,
                                                ; LinkOpen
        resb 80
LinkPortName:                                   ; Link: serial port settings string; used by LinkConnect,
                                                ; LinkOpen, LinkReceive
        resb 40
LinkModemString:                                ; Link: modem command string; used by LinkConnect, LinkOpen,
                                                ; LinkReceive
        resb 79
        resb 1
LinkRxRing:                                     ; Link: serial receive ring buffer; used by LinkParsePacket,
                                                ; LinkRxCopy, LinkRxPut
        resb 268
LinkAbortCheck:                                 ; Link: callback that aborts a link wait; used by LinkConnect,
                                                ; LinkSyncPoint, SetLinkAbortCheck
        resb 4

LinkResendPkt:                                  ; link packet asking the other side to resend; used by
                                                ; LinkRequestResend
        resb 1
        resb 1
        resb 1
        resb 9
LinkAckPkt:                                     ; link acknowledge packet; used by LinkSendAck
        resb 1
        resb 1
        resb 1
        resb 9
LinkRxHeader:                                   ; header of the link packet being received; used by
                                                ; LinkReceive
        resb 2
        resb 10
LinkRxBuffer:                                   ; link receive buffer; used by LinkReceive
        resb 256
LinkMissingList:                                ; list of missing link packets; used by LinkRequestMissing
        resb 40
