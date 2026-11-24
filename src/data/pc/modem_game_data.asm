; Initialised data of pc/modem_game (src/pc/modem_game).
bits 32
%include "hockey.inc"
section s_114CE2 progbits alloc noexec write align=1
global LinkSyncInput, ControllerScreenMode, LinkConfig, LinkCfgPort, LinkCfgMode, LinkCfgAnswer, LinkCfgDirect, LinkCfgBaud
global LinkCfgOption, LinkCfgInit, LinkCfgDial, LinkFlags, LinkInputFrame, LinkSyncTarget, LinkSyncTimeout, LinkSyncCount
global LinkInputDelay, LinkRxBlockCount, LinkRxBlockTicks, LinkRxBlockOffset, LinkBlockPtr, LinkSyncWord, BaudRateTable, ModemReplyBuf
LinkSyncInput:                                  ; Link: input value at the sync point; used by
                                                ; LinkExchangeInput, LinkSyncPoint
        db 00h,00h
ControllerScreenMode:                           ; Controller screen mode (icons and columns); used by
                                                ; ControllerScreen, DeviceIconShape, DrawControllerColumns ...
        db 01h,00h
LinkConfig:                                     ; Link set-up block passed to LinkOpen; used by ModemGameOpen
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h
LinkCfgPort:                                    ; Link set-up: serial port; used by ModemGameOpen
        db 00h,00h,00h,00h
LinkCfgMode:                                    ; Link set-up: connection mode (9 for a direct link); used by
                                                ; ModemGameOpen
        db 09h,00h,00h,00h,00h,00h,00h,00h
LinkCfgAnswer:                                  ; Link set-up: answer an incoming call; used by
                                                ; ModemGameConnect, ModemGameOpen
        db 01h,00h,00h,00h
LinkCfgDirect:                                  ; Link set-up: direct (null-modem) link; used by ModemGameOpen
        db 00h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,01h,00h,00h,00h
LinkCfgBaud:                                    ; Link set-up: baud rate; used by ModemGameOpen
        db 00h,00h,00h,00h
LinkCfgOption:                                  ; Link set-up: link option from GLOBAL.SET; used by
                                                ; ModemGameOpen
        db 01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
LinkCfgInit:                                    ; Link set-up: modem init string; used by ModemGameOpen
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h
LinkCfgDial:                                    ; Link set-up: modem dial string; used by ModemGameOpen
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h
LinkFlags:                                      ; Link: status bits (bit 1 connected); used by
                                                ; LinkExchangeInput, LinkExchangeValues, LinkResyncInput ...
        db 00h,00h,00h,00h
LinkInputFrame:                                 ; Link: input frame number; used by LinkExchangeInput,
                                                ; LinkResyncInput, ModemGameConnect ...
        db 00h,00h,00h,00h
LinkSyncTarget:                                 ; Link: sync point being waited for; used by LinkSyncMessage,
                                                ; LinkSyncPoint
        db 00h,00h,00h,00h
LinkSyncTimeout:                                ; Link: tick when the sync wait times out; used by LinkSync,
                                                ; LinkSyncTimedOut, LinkSyncWithMessage
        db 00h,00h,00h,00h
LinkSyncCount:                                  ; Link: sync points passed; used by LinkSync,
                                                ; LinkSyncWithMessage, ModemGameConnect ...
        db 00h,00h,00h,00h
LinkInputDelay:                                 ; Link: input delay in frames; used by LinkExchangeInput,
                                                ; LinkResyncInput
        db 01h,00h,00h,00h
LinkRxBlockCount:                               ; Link: blocks received; used by LinkBlockData,
                                                ; LinkReceiveBlock, ModemGameConnect ...
        db 00h,00h,00h,00h
LinkRxBlockTicks:                               ; Link: ticks spent receiving the block; used by
                                                ; LinkReceiveBlock, ModemGameConnect, ModemGameOpen
        db 00h,00h,00h,00h
LinkRxBlockOffset:                              ; offset into the received link block; used by LinkBlockData,
                                                ; LinkBlockStart, LinkSendBlock ...
        db 00h,00h,00h,00h
LinkBlockPtr:                                   ; Link: pointer into the block being sent or received; used by
                                                ; LinkBlockData, LinkBlockStart, LinkSendBlock ...
        db 00h,00h,00h,00h
LinkSyncWord:                                   ; Link: sync word; used by LinkSyncMessage, LinkSyncPoint,
                                                ; ModemGameConnect ...
        db 00h,00h
BaudRateTable:                                  ; Baud rate per GsBaudIndex; used by LinkExchangeInput,
                                                ; LinkExchangeValues, LinkGameMessageJumpTable ...
        db 00h,00h,02h,00h,03h,00h,04h,00h,07h,00h
ModemReplyBuf:                                  ; Modem reply buffer; used by ModemGameClose, ModemGameConnect
        db 00h,00h,00h,00h,00h,00h,075h,02h
