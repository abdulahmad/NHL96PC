; BSS of pc/modem_game (src/pc/modem_game).
bits 32
%include "hockey.inc"
section s_15179C nobits alloc noexec write align=1
global LinkBlockBuffer, ChatActive, ChatLine, LinkSyncValue, LinkBlockLen, LinkBlockPos, LinkMsgQueue, LinkInputHead
global LinkInputTail, LinkValueQueue, LinkMsgHead, LinkInputQueue, LinkValueHead, LinkMsgTail, LinkRemoteHead, LinkValueTail
global LinkRemoteTail, LinkRemoteQueue, LinkWaitBoxBmp, LinkBlockHeader, LinkBlockAck, LinkAckReply, ChatLocalLen, ChatRemoteLen
LinkBlockBuffer:                                ; Link: 512-byte block transfer buffer; used by
                                                ; LinkBlockStart, LinkReceiveBlock, LinkSendBlock
        resb 512
ChatActive:                                     ; Modem chat running; used by ModemChat
        resb 4
ChatLine:                                       ; Modem chat line being typed; used by ModemChat
        resb 20
LinkSyncValue:                                  ; Link: last sync value received; used by LinkSyncMessage
        resb 4
LinkBlockLen:                                   ; Link: length of the block being sent or received; used by
                                                ; LinkBlockStart
        resb 4
LinkBlockPos:                                   ; Link: position in the block; used by LinkBlockData
        resb 4
LinkMsgQueue:                                   ; Link: message queue, 10 entries of 6 bytes; used by
                                                ; LinkGameMessageJumpTable, ModemChat, ModemGameConnect ...
        resb 60
LinkInputHead:                                  ; Link: input queue head; used by LinkExchangeInput,
                                                ; LinkResyncInput, ModemGameConnect ...
        resb 4
LinkInputTail:                                  ; Link: input queue tail; used by LinkExchangeInput,
                                                ; LinkResyncInput, ModemGameConnect ...
        resb 4
LinkValueQueue:                                 ; Link: value queue, 10 entries of 6 bytes; used by
                                                ; LinkExchangeValues, LinkGameMessageJumpTable,
                                                ; ModemGameConnect ...
        resb 60
LinkMsgHead:                                    ; Link: message queue head; used by LinkGameMessageJumpTable,
                                                ; ModemChat, ModemGameConnect ...
        resb 4
LinkInputQueue:                                 ; Link: input queue, 10 entries of 6 bytes; used by
                                                ; LinkExchangeInput, ModemGameConnect, ModemGameOpen
        resb 60
LinkValueHead:                                  ; Link: value queue head; used by LinkExchangeValues,
                                                ; LinkGameMessageJumpTable, ModemGameConnect ...
        resb 4
LinkMsgTail:                                    ; Link: message queue tail; used by LinkGameMessageJumpTable,
                                                ; ModemChat, ModemGameConnect ...
        resb 4
LinkRemoteHead:                                 ; Link: remote queue head; used by LinkExchangeInput,
                                                ; LinkGameMessageJumpTable, LinkResyncInput ...
        resb 4
LinkValueTail:                                  ; Link: value queue tail; used by LinkExchangeValues,
                                                ; LinkGameMessageJumpTable, ModemGameConnect ...
        resb 4
LinkRemoteTail:                                 ; Link: remote queue tail; used by LinkExchangeInput,
                                                ; LinkGameMessageJumpTable, LinkResyncInput ...
        resb 4
LinkRemoteQueue:                                ; Link: remote queue, 10 entries of 6 bytes; used by
                                                ; LinkExchangeInput, LinkGameMessageJumpTable,
                                                ; ModemGameConnect ...
        resb 60
LinkWaitBoxBmp:                                 ; Link: saved screen under the wait box; used by
                                                ; HideLinkWaitBox, ShowLinkWaitBox
        resb 4
LinkBlockHeader:                                ; Link: block header packet (type 3, then the length); used by
                                                ; LinkSendBlock
        resb 1
        resb 5
LinkBlockAck:                                   ; Link: block acknowledge packet (type 4, then the status);
                                                ; used by LinkSendBlock
        resb 1
        resb 1
LinkAckReply:                                   ; Link: reply to the block acknowledge; used by LinkSendBlock
        resb 2
        resb 2
ChatLocalLen:                                   ; Modem chat: length of the local line; used by ModemChat
        resb 2
ChatRemoteLen:                                  ; Modem chat: length of the remote line; used by ModemChat
        resb 2
