; Modem game session: open, connect and close a modem game, sync points, blocks, pad input exchange and the chat box (96 PC).
bits 32
%include "hockey.inc"
section s_122A6 progbits alloc exec nowrite align=1
extern addtimer, LinkFlags, TextCharH, ChatLine, LinkBlockHeader, LinkBlockAck, TitleTextStyle
extern DebugPrintf, InputRecordIndex, LinkSyncInput, LinkCfgPort, LinkCfgMode, LinkCfgAnswer, LinkCfgDirect, LinkCfgBaud
extern LinkCfgOption, LinkInputFrame, LinkSyncTarget, LinkSyncTimeout, LinkSyncCount, LinkInputDelay, LinkRxBlockCount, LinkRxBlockTicks
extern LinkRxBlockOffset, LinkBlockPtr, ModemReplyBuf, LinkTickCount, FrontShapesFile, WaitBoxArt, ViewScreenWidth, ViewScreenHeight
extern SlotInput, ChatActive, LinkSyncValue, LinkBlockLen, LinkBlockPos
extern LinkInputHead, LinkInputTail, LinkMsgHead, LinkValueHead, LinkMsgTail, LinkRemoteHead, LinkValueTail, LinkRemoteTail
extern LinkWaitBoxBmp, LinkAbortCheck, GsModemDial, FillRect, TextStringWidth
extern GameLoopActive, GetTicks, InputRecordCount, InputRecordHead, InputRecordRing, LinkClose, LinkConnect, LinkCopyBytes
extern LinkOpen, LinkSendMessage, LinkTimerTick, optblock_end, optflags, SetClipWindow, SetDrawBitmap, SetLinkAbortCheck
extern SetLinkMessageHandler, SetLinkSpareHook, SlotButtons, str_ABORT, str_HFwt, str_HGwt, str_LGwt, str_PAL22
extern str_SHAD, str_X3, strcpy_, MessageBox, HideMessage, ShowMessage, CopyBitmap, SetTextColors
extern DrawColorText, DrawColorTextCentred, DrawBox, StopMusic, QueueCurrentMusic, FillMusicStream, PlayMusic, FadeOutMusic
extern SoundSecondsToBytes, SoundIdle, GetLangText, RemoveTimerCallback, DrawShapeAtOwnPos, DrawShape, PutBlockAtOwnPos, AllocMemBlock
extern FreeMemBlock, CreateBitmap, TintRect, DrawRectOutline, FreeBitmap, SetScreenTarget, GetPaletteRange, FillRectColor
extern KeyIsDown, KbdGetKey, FindShape, LinkConfig, LinkCfgInit, LinkCfgDial, LinkBlockBuffer, LinkMsgQueue
extern LinkValueQueue, LinkInputQueue, LinkRemoteQueue, LinkAckReply, GsPhoneNumber, GsModemInit, ModemGameOpts, SlotsTwoPlayer
extern ControllerScreenMode, LinkSyncWord, BaudRateTable, ChatLocalLen, ChatRemoteLen, GsComPort, GsDirectLink, GsWaitForCall
global ModemGameOpen, LinkBlockStart, LinkBlockData, LinkSendBlock, LinkReceiveBlock, LinkSyncMessage, LinkGameMessage, LinkGameMessageJumpTable
global LinkGameMessage_18, LinkExchangeValues, ModemGameConnect, ShowLinkWaitBox, HideLinkWaitBox, LinkSyncTimedOut, LinkSyncPoint, LinkSync
global LinkSyncWithMessage, ModemGameClose, ModemGameQuit, LinkResyncInput, LinkExchangeInput, ModemChat, ThreeStarsRowY, ThreeStarsNameY
global ThreeStarsScales, str_N, ThreeStarsHotspots
;-----------------------------------------------------------------------------
; ModemGameOpen                                                   122A6  96 PC
; (answer, settings): copies the modem settings (port, speed, numbers, init
; string) and opens the link with LinkOpen, showing a message while the modem
; starts (unless GsDirectLink); clears the message queues; 1 when open
; (LinkFlags bit 1), else shows the error
;-----------------------------------------------------------------------------
ModemGameOpen:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 10h
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-0Ch], edx
        cmp dword [LinkFlags], byte 0
        je short .1
        mov dword [byte ebp-04h], 0
        jmp near .8
.1:
        mov eax, dword [GsComPort-2]
        sar eax, 10h
        mov dword [LinkCfgPort], eax
        mov eax, dword [GsComPort]
        sar eax, 10h
        add eax, eax
        mov eax, dword [dword eax+BaudRateTable]
        sar eax, 10h
        mov dword [LinkCfgBaud], eax
        mov eax, dword [GsWaitForCall]
        sar eax, 10h
        mov dword [LinkCfgOption], eax
        cmp word [GsDirectLink], byte 0
        je short .2
        mov dword [LinkCfgDirect], 1
        mov dword [LinkCfgMode], 9
        jmp short .3
.2:
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        mov eax, 55h
        call GetLangText
        call ShowMessage
        xor edx, edx
        mov eax, 50h
        call FadeOutMusic
        call StopMusic
        mov edx, GsPhoneNumber
        mov eax, LinkConfig
        call strcpy_
        mov edx, GsModemInit
        mov eax, LinkCfgInit
        call strcpy_
        mov edx, GsModemDial
        mov eax, LinkCfgDial
        call strcpy_
        mov dword [LinkCfgMode], 9
        mov dword [LinkCfgDirect], 0
.3:
        mov eax, dword [byte ebp-010h]
        mov dword [LinkCfgAnswer], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkRemoteQueue
        rep stosb
        mov dword [LinkRemoteHead], 0
        mov eax, dword [LinkRemoteHead]
        mov dword [LinkRemoteTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkValueQueue
        rep stosb
        mov dword [LinkValueHead], 0
        mov eax, dword [LinkValueHead]
        mov dword [LinkValueTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkInputQueue
        rep stosb
        mov dword [LinkInputFrame], 0
        mov eax, dword [LinkInputFrame]
        mov dword [LinkInputHead], eax
        mov eax, dword [LinkInputHead]
        mov dword [LinkInputTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkMsgQueue
        rep stosb
        mov dword [LinkMsgHead], 0
        mov eax, dword [LinkMsgHead]
        mov dword [LinkMsgTail], eax
        mov dword [LinkSyncCount], 0
        mov dword [LinkRxBlockCount], 0
        mov dword [LinkRxBlockTicks], 0
        mov dword [LinkRxBlockOffset], 0
        mov dword [LinkBlockPtr], 0
        mov word [LinkSyncWord], 0
        mov eax, dword [byte ebp-0Ch]
        call SetLinkAbortCheck
        mov eax, LinkConfig
        call LinkOpen
        test eax, eax
        jne near .6
        cmp word [GsDirectLink], byte 0
        jne short .4
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.4:
        cmp word [GsDirectLink], byte 0
        jne short .5
        call HideMessage
.5:
        xor eax, eax
        call SetLinkAbortCheck
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-08h], eax
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        push byte 0
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-08h]
        mov edx, 1
        mov eax, 129h
        call GetLangText
        call MessageBox
        mov dword [LinkFlags], 0
        mov dword [byte ebp-04h], 0
        jmp short .8
.6:
        or byte [LinkFlags], 1
        mov eax, LinkTimerTick
        push eax
        call addtimer
        add esp, byte 4
        cmp word [GsDirectLink], byte 0
        jne short .7
        call HideMessage
.7:
        xor eax, eax
        call SetLinkAbortCheck
        mov dword [byte ebp-04h], 1
.8:
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkBlockStart                                                  1253E  96 PC
; Received message type 3: a block of the given length follows (into
; LinkBlockBuffer)
;-----------------------------------------------------------------------------
LinkBlockStart:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [LinkBlockLen], eax
        mov dword [LinkBlockPtr], LinkBlockBuffer
        mov eax, dword [LinkBlockLen]
        mov eax, dword [byte eax+01h]
        mov dword [LinkRxBlockOffset], eax
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkBlockData                                                   12577  96 PC
; Received message type 4: appends its bytes to the block being received;
; counts the block done when it is complete
;-----------------------------------------------------------------------------
LinkBlockData:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [LinkBlockPos], eax
        cmp dword [LinkBlockPtr], byte 0
        je short .1
        cmp dword [LinkRxBlockOffset], byte 0
        jg short .2
.1:
        jmp short .3
.2:
        mov eax, dword [LinkBlockPos]
        movsx ebx, byte [byte eax+01h]
        mov eax, dword [LinkBlockPos]
        lea edx, [byte eax+02h]
        mov eax, dword [LinkBlockPtr]
        call LinkCopyBytes
        mov eax, dword [LinkBlockPos]
        movsx eax, byte [byte eax+01h]
        sub dword [LinkRxBlockOffset], eax
        mov eax, dword [LinkBlockPos]
        movsx eax, byte [byte eax+01h]
        add dword [LinkBlockPtr], eax
        cmp dword [LinkRxBlockOffset], byte 0
        jne short .3
        inc dword [LinkRxBlockCount]
        mov dword [LinkBlockPtr], 0
.3:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSendBlock                                                   125FF  96 PC
; (data, length): sends a block to the other side as a type 3 header and type
; 4 messages of 4 bytes, idling while the link is busy
;-----------------------------------------------------------------------------
LinkSendBlock:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 14h
        mov dword [byte ebp-014h], eax
        mov dword [byte ebp-010h], edx
        mov word [BaudRateTable], 0
        mov byte [LinkBlockHeader], 3
        mov eax, dword [byte ebp-010h]
        mov dword [LinkBlockHeader+1], eax
.1:
        mov edx, 6
        mov eax, LinkBlockHeader
        call LinkSendMessage
        test eax, eax
        jne short .2
        call SoundIdle
        jmp short .1
.2:
        mov dword [LinkBlockPtr], LinkBlockBuffer
        mov ebx, dword [byte ebp-010h]
        mov edx, dword [byte ebp-014h]
        mov eax, dword [LinkBlockPtr]
        call LinkCopyBytes
        mov eax, dword [byte ebp-010h]
        mov dword [LinkRxBlockOffset], eax
        mov byte [LinkBlockAck], 4
.3:
        cmp dword [LinkRxBlockOffset], byte 4
        jle short .4
        mov dword [byte ebp-08h], 4
        jmp short .5
.4:
        mov eax, dword [LinkRxBlockOffset]
        mov dword [byte ebp-08h], eax
.5:
        mov al, byte [byte ebp-08h]
        mov byte [LinkBlockAck+1], al
        mov ebx, dword [byte ebp-08h]
        mov edx, dword [LinkBlockPtr]
        mov eax, LinkAckReply
        call LinkCopyBytes
        mov edx, 6
        mov eax, LinkBlockAck
        call LinkSendMessage
        test eax, eax
        je short .6
        mov eax, dword [byte ebp-08h]
        add dword [LinkBlockPtr], eax
        mov eax, dword [byte ebp-08h]
        sub dword [LinkRxBlockOffset], eax
        jmp short .7
.6:
        call SoundIdle
.7:
        cmp dword [LinkRxBlockOffset], byte 0
        jg short .3
        mov dword [LinkBlockPtr], 0
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkReceiveBlock                                                126E9  96 PC
; (dest, length): waits (idling) for the next block from the other side and
; copies it out
;-----------------------------------------------------------------------------
LinkReceiveBlock:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0Ch
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-08h], edx
        inc dword [LinkRxBlockTicks]
.1:
        mov eax, dword [LinkRxBlockCount]
        cmp eax, dword [LinkRxBlockTicks]
        jge short .2
        call SoundIdle
        jmp short .1
.2:
        mov ebx, dword [byte ebp-08h]
        mov edx, LinkBlockBuffer
        mov eax, dword [byte ebp-0Ch]
        call LinkCopyBytes
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSyncMessage                                                 1272E  96 PC
; Received message type 5: the other side's sync point number (LinkSyncTarget);
; one from this side's own number means "quit" (LinkSyncWord)
;-----------------------------------------------------------------------------
LinkSyncMessage:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [LinkSyncValue], eax
        mov eax, dword [LinkSyncValue]
        movsx ax, byte [byte eax+05h]
        cmp ax, word [ControllerScreenMode]
        je short .1
        mov eax, dword [LinkSyncValue]
        mov eax, dword [byte eax+01h]
        mov dword [LinkSyncTarget], eax
        jmp short .2
.1:
        mov word [LinkSyncWord], 1
.2:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkGameMessage                                                 1277B  96 PC
; Message handler of a modem game: by type 1 menu values, 2 pad input, 3/4
; block, 5 sync point, 6 chat text, into their queues of 10
;-----------------------------------------------------------------------------
LinkGameMessage:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 8
        mov dword [byte ebp-04h], eax
        jmp short LinkGameMessage_18
LinkGameMessageJumpTable:
        dd LinkGameMessage_18.4
        dd LinkGameMessage_18.2
        dd LinkGameMessage_18.6
        dd LinkGameMessage_18.7
        dd LinkGameMessage_18.8
        dd LinkGameMessage_18.1
LinkGameMessage_18:
        mov word [BaudRateTable], 0
        mov eax, dword [byte ebp-04h]
        mov al, byte [eax]
        dec al
        mov byte [byte ebp-08h], al
        cmp byte [byte ebp-08h], 5
        ja near .9
        xor eax, eax
        mov al, byte [byte ebp-08h]
        shl eax, 2
        jmp dword [dword cs:eax+LinkGameMessageJumpTable]
.1:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [LinkMsgHead], byte 6
        mov ecx, LinkMsgQueue
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [LinkMsgHead]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkMsgHead], edx
        mov eax, dword [LinkMsgHead]
        cmp eax, dword [LinkMsgTail]
        jne short .2
        mov edx, dword [LinkMsgTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkMsgTail], edx
.2:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [LinkRemoteHead], byte 6
        mov ecx, LinkRemoteQueue
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [LinkRemoteHead]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkRemoteHead], edx
        mov eax, dword [LinkRemoteHead]
        cmp eax, dword [LinkRemoteTail]
        jne short .3
        mov edx, dword [LinkRemoteTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkRemoteTail], edx
.3:
        jmp near .9
.4:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [LinkValueHead], byte 6
        mov ecx, LinkValueQueue
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [LinkValueHead]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkValueHead], edx
        mov eax, dword [LinkValueHead]
        cmp eax, dword [LinkValueTail]
        jne short .5
        mov edx, dword [LinkValueHead]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkValueTail], edx
.5:
        jmp short .9
.6:
        mov eax, dword [byte ebp-04h]
        call LinkBlockStart
        jmp short .9
.7:
        mov eax, dword [byte ebp-04h]
        call LinkBlockData
        jmp short .9
.8:
        mov eax, dword [byte ebp-04h]
        call LinkSyncMessage
.9:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkExchangeValues                           1290C  96 PC, medium confidence
; (a, b, flag, &a2, &b2, &flag2): sends a type 1 message with three packed
; values and waits (wait box after 25 ticks) for the other side's; used by a
; front-end screen to keep both menus in step
;-----------------------------------------------------------------------------
LinkExchangeValues:
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 24h
        mov dword [byte ebp-01Ch], eax
        mov dword [byte ebp-014h], edx
        mov dword [byte ebp-018h], ebx
        mov dword [byte ebp-0Ch], ecx
        test byte [LinkFlags], 2
        je near .9
        mov byte [byte ebp-024h], 1
        mov eax, dword [byte ebp-01Ch]
        shl eax, 0Bh
        mov dword [byte ebp-023h], eax
        mov eax, dword [byte ebp-014h]
        add eax, eax
        or dword [byte ebp-023h], eax
        cmp dword [byte ebp-018h], byte 0
        je short .1
        or dword [byte ebp-023h], byte 1
.1:
        mov word [BaudRateTable], 0
.2:
        mov edx, 6
        lea eax, [byte ebp-024h]
        call LinkSendMessage
        test eax, eax
        jne short .3
        call SoundIdle
        jmp short .2
.3:
        call GetTicks
        add eax, byte 19h
        mov dword [byte ebp-08h], eax
        mov dword [byte ebp-04h], 0
.4:
        mov eax, dword [LinkValueTail]
        cmp eax, dword [LinkValueHead]
        jne short .8
        call GetTicks
        cmp eax, dword [byte ebp-08h]
        jle short .5
        cmp dword [byte ebp-04h], byte 0
        je short .6
.5:
        jmp short .7
.6:
        mov dword [byte ebp-04h], 1
        call ShowLinkWaitBox
.7:
        call SoundIdle
        jmp short .4
.8:
        imul eax, dword [LinkValueTail], byte 6
        mov edx, LinkValueQueue
        add edx, eax
        mov dword [byte ebp-010h], edx
        mov edx, dword [byte ebp-010h]
        mov eax, dword [byte edx+01h]
        and eax, 1FF800h
        mov edx, dword [byte ebp-0Ch]
        sar eax, 0Bh
        mov dword [edx], eax
        mov edx, dword [byte ebp-010h]
        mov eax, dword [byte edx+01h]
        and eax, 7FEh
        mov edx, dword [byte ebp+010h]
        sar eax, 1
        mov dword [edx], eax
        mov edx, dword [byte ebp-010h]
        mov edx, dword [byte edx+01h]
        and edx, byte 1
        mov eax, dword [byte ebp+014h]
        mov dword [eax], edx
        mov edx, dword [LinkValueTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkValueTail], edx
        cmp dword [byte ebp-04h], byte 0
        je short .9
        call HideLinkWaitBox
.9:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; ModemGameConnect                                                12A24  96 PC
; (abort check): connects (LinkConnect) with a message up; on success sets
; the side (ControllerScreenMode: 1 dialler), syncs, and the answering side sends its
; game options (optblock, 0B9h bytes) and option bits to the dialler; 1 when
; connected (LinkFlags bit 2, SlotsTwoPlayer bit 1)
;-----------------------------------------------------------------------------
ModemGameConnect:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 24h
        mov dword [byte ebp-014h], eax
        cmp dword [byte ebp-014h], byte 0
        jne short .1
        mov dword [byte ebp-04h], 0
        jmp near .17
.1:
        cmp dword [LinkFlags], byte 1
        je short .2
        mov dword [byte ebp-04h], 0
        jmp near .17
.2:
        cmp dword [LinkCfgAnswer], byte 0
        je short .3
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        mov eax, 56h
        call GetLangText
        call ShowMessage
        jmp short .4
.3:
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        mov eax, 57h
        call GetLangText
        call ShowMessage
.4:
        mov eax, dword [byte ebp-014h]
        call SetLinkAbortCheck
        mov dword [LinkSyncCount], 0
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkRemoteQueue
        rep stosb
        mov dword [LinkRemoteHead], 0
        mov eax, dword [LinkRemoteHead]
        mov dword [LinkRemoteTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkValueQueue
        rep stosb
        mov dword [LinkValueHead], 0
        mov eax, dword [LinkValueHead]
        mov dword [LinkValueTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkInputQueue
        rep stosb
        mov dword [LinkInputFrame], 0
        mov eax, dword [LinkInputFrame]
        mov dword [LinkInputHead], eax
        mov eax, dword [LinkInputHead]
        mov dword [LinkInputTail], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkMsgQueue
        rep stosb
        mov dword [LinkMsgHead], 0
        mov eax, dword [LinkMsgHead]
        mov dword [LinkMsgTail], eax
        mov dword [LinkRxBlockCount], 0
        mov dword [LinkRxBlockTicks], 0
        mov dword [LinkRxBlockOffset], 0
        mov dword [LinkBlockPtr], 0
        mov eax, LinkGameMessage
        call SetLinkMessageHandler
        call LinkConnect
        test eax, eax
        jne short .6
        xor eax, eax
        call SetLinkAbortCheck
        cmp word [GsDirectLink], byte 0
        jne short .5
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.5:
        call HideMessage
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-0Ch], eax
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        push byte 0
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-0Ch]
        mov edx, 1
        mov eax, 58h
        call GetLangText
        call MessageBox
        mov dword [byte ebp-04h], 0
        jmp near .17
.6:
        cmp dword [LinkCfgAnswer], byte 0
        je short .7
        mov word [ControllerScreenMode], 1
        jmp short .8
.7:
        mov word [ControllerScreenMode], 0
.8:
        call HideMessage
        mov dword [byte ebp-020h], 0F0h
        mov dword [byte ebp-01Ch], 140h
        mov eax, TitleTextStyle
        mov dword [byte ebp-018h], eax
        cmp word [GsDirectLink], byte 0
        je short .9
        mov eax, 20Ah
        call GetLangText
        mov dword [byte ebp-024h], eax
        jmp short .10
.9:
        mov eax, 209h
        call GetLangText
        mov dword [byte ebp-024h], eax
.10:
        mov eax, dword [byte ebp-024h]
        mov ecx, dword [byte ebp-020h]
        mov ebx, dword [byte ebp-01Ch]
        mov edx, dword [byte ebp-018h]
        call ShowMessage
        cmp word [GsDirectLink], byte 0
        jne short .11
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.11:
        mov word [LinkSyncWord], 0
        mov edx, 1
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        test eax, eax
        jne short .14
        call HideMessage
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-0Ch], eax
        cmp word [LinkSyncWord], byte 0
        je short .12
        mov eax, 261h
        call GetLangText
        mov dword [byte ebp-08h], eax
        jmp short .13
.12:
        mov eax, 58h
        call GetLangText
        mov dword [byte ebp-08h], eax
.13:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        push byte 0
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-0Ch]
        mov edx, 1
        mov eax, dword [byte ebp-08h]
        call MessageBox
        mov word [LinkSyncWord], 0
        mov dword [byte ebp-04h], 0
        jmp near .17
.14:
        mov word [LinkSyncWord], 0
        call HideMessage
        xor eax, eax
        call SetLinkAbortCheck
        or byte [LinkFlags], 2
        or byte [SlotsTwoPlayer], 1
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        mov eax, 59h
        call GetLangText
        call ShowMessage
        cmp word [ControllerScreenMode], byte 0
        jne short .15
        mov edx, 0B9h
        mov eax, ModemGameOpts
        call LinkReceiveBlock
        xor edx, edx
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        mov edx, 4
        mov eax, ModemReplyBuf
        call LinkReceiveBlock
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        mov dword [byte ebp-010h], eax
        mov eax, dword [ModemReplyBuf]
        and eax, byte 3
        and word [optflags], 0FE7Fh
        shl eax, 7
        or dword [optflags], eax
        mov eax, dword [byte ebp-010h]
        mov dword [ModemReplyBuf], eax
        xor edx, edx
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        jmp short .16
.15:
        mov ecx, 0B9h
        mov esi, optblock_end
        mov edi, ModemGameOpts
        rep movsb
        mov edx, 0B9h
        mov eax, ModemGameOpts
        call LinkSendBlock
        xor edx, edx
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        mov dword [ModemReplyBuf], eax
        mov edx, 4
        mov eax, ModemReplyBuf
        call LinkSendBlock
        xor edx, edx
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
.16:
        call HideMessage
        mov dword [byte ebp-04h], 1
.17:
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShowLinkWaitBox                                                 12E50  96 PC
; Puts up the "waiting for the other player" sprite (HGwt/HFwt in hi-res,
; LGwt in low-res) centred on the screen, once
;-----------------------------------------------------------------------------
ShowLinkWaitBox:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        cmp dword [LinkWaitBoxBmp], byte 0
        jne near .5
        cmp dword [ViewScreenWidth], 140h
        jle short .3
        cmp dword [WaitBoxArt], byte 0
        jne short .1
        mov eax, str_HGwt
        push eax
        push dword [FrontShapesFile]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-04h], eax
        jmp short .2
.1:
        mov eax, str_HFwt
        push eax
        push dword [FrontShapesFile]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.2:
        jmp short .4
.3:
        mov eax, str_LGwt
        push eax
        push dword [FrontShapesFile]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.4:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        sar eax, 1
        mov edx, dword [ViewScreenWidth]
        sar edx, 1
        sub edx, eax
        mov eax, dword [byte ebp-04h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        sar eax, 10h
        sar eax, 1
        mov edx, dword [ViewScreenHeight]
        sar edx, 1
        sub edx, eax
        mov eax, dword [byte ebp-04h]
        mov word [byte eax+0Eh], dx
        xor edx, edx
        mov eax, dword [byte ebp-04h]
        call CopyBitmap
        mov dword [LinkWaitBoxBmp], eax
        push dword [LinkWaitBoxBmp]
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp-04h]
        push eax
        call DrawShape
        add esp, byte 4
.5:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; HideLinkWaitBox                                                 12F33  96 PC
; Takes the waiting sprite down again
;-----------------------------------------------------------------------------
HideLinkWaitBox:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        cmp dword [LinkWaitBoxBmp], byte 0
        je short .1
        push dword [LinkWaitBoxBmp]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [LinkWaitBoxBmp]
        call FreeMemBlock
        add esp, byte 4
        mov dword [LinkWaitBoxBmp], 0
.1:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSyncTimedOut                                                12F77  96 PC
; Abort check used while syncing: idles, 1 once the sync deadline
; (LinkSyncTimeout) has passed
;-----------------------------------------------------------------------------
LinkSyncTimedOut:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        call SoundIdle
        call GetTicks
        cmp eax, dword [LinkSyncTimeout]
        jle short .1
        mov dword [byte ebp-04h], 1
        jmp short .2
.1:
        mov dword [byte ebp-04h], 0
.2:
        mov eax, dword [byte ebp-04h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSyncPoint                                                   12FB3  96 PC
; (number, abortable): sync point: sends a type 5 message with the number and
; side and waits for the other side's (the dialler sends first), idling; the
; abort check can stop the wait
;-----------------------------------------------------------------------------
LinkSyncPoint:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 18h
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], 0
        mov word [BaudRateTable], 0
        mov byte [byte ebp-018h], 5
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-017h], eax
        mov al, byte [ControllerScreenMode]
        mov byte [byte ebp-013h], al
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne near .18
.1:
        cmp word [byte ebp-04h], byte 0
        jne short .2
        mov edx, 6
        lea eax, [byte ebp-018h]
        call LinkSendMessage
        test eax, eax
        je short .3
.2:
        jmp short .9
.3:
        mov ax, word [LinkSyncWord]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .4
        cmp dword [LinkAbortCheck], byte 0
        jne short .5
.4:
        jmp short .6
.5:
        cmp word [byte ebp-04h], byte 0
        je short .7
.6:
        jmp short .8
.7:
        call dword [LinkAbortCheck]
        mov dword [byte ebp-04h], eax
.8:
        call SoundIdle
        jmp short .1
.9:
        mov eax, dword [LinkSyncTarget]
        cmp eax, dword [byte ebp-0Ch]
        je short .10
        cmp word [byte ebp-04h], byte 0
        je short .11
.10:
        jmp short .17
.11:
        mov ax, word [LinkSyncWord]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .12
        cmp dword [LinkAbortCheck], byte 0
        jne short .13
.12:
        jmp short .14
.13:
        cmp word [byte ebp-04h], byte 0
        je short .15
.14:
        jmp short .16
.15:
        call dword [LinkAbortCheck]
        mov dword [byte ebp-04h], eax
.16:
        call SoundIdle
        jmp short .9
.17:
        jmp near .34
.18:
        mov eax, dword [LinkSyncTarget]
        cmp eax, dword [byte ebp-0Ch]
        je short .19
        cmp word [byte ebp-04h], byte 0
        je short .20
.19:
        jmp short .26
.20:
        mov ax, word [LinkSyncWord]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .21
        cmp dword [LinkAbortCheck], byte 0
        jne short .22
.21:
        jmp short .23
.22:
        cmp word [byte ebp-04h], byte 0
        je short .24
.23:
        jmp short .25
.24:
        call dword [LinkAbortCheck]
        mov dword [byte ebp-04h], eax
.25:
        call SoundIdle
        jmp short .18
.26:
        cmp word [byte ebp-04h], byte 0
        jne short .27
        mov edx, 6
        lea eax, [byte ebp-018h]
        call LinkSendMessage
        test eax, eax
        je short .28
.27:
        jmp short .34
.28:
        mov ax, word [LinkSyncWord]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .29
        cmp dword [LinkAbortCheck], byte 0
        jne short .30
.29:
        jmp short .31
.30:
        cmp word [byte ebp-04h], byte 0
        je short .32
.31:
        jmp short .33
.32:
        call dword [LinkAbortCheck]
        mov dword [byte ebp-04h], eax
.33:
        call SoundIdle
        jmp short .26
.34:
        cmp word [byte ebp-04h], byte 0
        je short .35
        mov dword [byte ebp-08h], 0
        jmp short .36
.35:
        mov dword [byte ebp-08h], 1
.36:
        mov eax, dword [byte ebp-08h]
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSync                                                        13146  96 PC
; (show wait box): syncs with the other side at the next sync point
; (100-second deadline per try, "ABORT!" to the debug log on a timeout,
; retried), with the wait box
;-----------------------------------------------------------------------------
LinkSync:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0Ch
        mov dword [byte ebp-08h], eax
        test byte [LinkFlags], 2
        je near .6
        call GetTicks
        add eax, 1770h
        mov dword [LinkSyncTimeout], eax
        mov eax, LinkSyncTimedOut
        call SetLinkAbortCheck
        cmp dword [byte ebp-08h], byte 0
        je short .1
        call ShowLinkWaitBox
.1:
        mov edx, 1
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        test eax, eax
        jge short .2
        mov dword [byte ebp-0Ch], 1
        jmp short .3
.2:
        mov dword [byte ebp-0Ch], 0
.3:
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-04h], byte 0
        je short .4
        mov eax, str_ABORT
        push eax
        call DebugPrintf
        add esp, byte 4
.4:
        cmp dword [byte ebp-04h], byte 0
        jl short .1
        cmp dword [byte ebp-08h], byte 0
        je short .5
        call HideLinkWaitBox
.5:
        xor eax, eax
        call SetLinkAbortCheck
.6:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSyncWithMessage                                             131EC  96 PC
; (message): LinkSync with a message box instead of the wait box
;-----------------------------------------------------------------------------
LinkSyncWithMessage:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0Ch
        mov dword [byte ebp-08h], eax
        test byte [LinkFlags], 2
        je near .4
        mov eax, LinkSyncTimedOut
        call SetLinkAbortCheck
        call GetTicks
        add eax, 1770h
        mov dword [LinkSyncTimeout], eax
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        mov eax, dword [byte ebp-08h]
        call ShowMessage
.1:
        mov edx, 1
        inc dword [LinkSyncCount]
        mov eax, dword [LinkSyncCount]
        call LinkSyncPoint
        test eax, eax
        jge short .2
        mov dword [byte ebp-0Ch], 1
        jmp short .3
.2:
        mov dword [byte ebp-0Ch], 0
.3:
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-04h], byte 0
        cmp dword [byte ebp-04h], byte 0
        jl short .1
        call HideMessage
        xor eax, eax
        call SetLinkAbortCheck
.4:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ModemGameClose                                                  13288  96 PC
; Ends a modem game: puts the option bits back, clears the message handlers,
; stops the link timer and closes the link (LinkClose); clears the modem game
; flags
;-----------------------------------------------------------------------------
ModemGameClose:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        mov ax, word [SlotsTwoPlayer]
        and eax, 1
        cwde
        test eax, eax
        je short .1
        mov eax, dword [ModemReplyBuf]
        and eax, byte 3
        and word [optflags], 0FE7Fh
        shl eax, 7
        or dword [optflags], eax
        xor eax, eax
        call SetLinkMessageHandler
        xor eax, eax
        call SetLinkSpareHook
.1:
        test byte [LinkFlags], 1
        je short .2
        mov eax, LinkTimerTick
        push eax
        call RemoveTimerCallback
        add esp, byte 4
        call LinkClose
.2:
        mov word [SlotsTwoPlayer], 0
        mov dword [LinkFlags], 0
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ModemGameQuit                                                   13304  96 PC
; On a modem game: wait box, ModemGameClose, box down
;-----------------------------------------------------------------------------
ModemGameQuit:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 0
        mov ax, word [SlotsTwoPlayer]
        and eax, 1
        cwde
        test eax, eax
        je short .1
        call ShowLinkWaitBox
        call ModemGameClose
        call HideLinkWaitBox
.1:
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkResyncInput                                                 13338  96 PC
; On a modem game: syncs, empties the pad input queues, the input record ring
; and SlotButtons, syncs again
;-----------------------------------------------------------------------------
LinkResyncInput:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        cmp word [BaudRateTable], byte 0
        jne near .1
        test byte [LinkFlags], 2
        je near .1
        mov eax, dword [LinkInputDelay]
        mov dword [byte ebp-04h], eax
        mov dword [LinkInputDelay], 0
        xor eax, eax
        call LinkSync
        mov dword [LinkRemoteHead], 0
        mov eax, dword [LinkRemoteHead]
        mov dword [LinkRemoteTail], eax
        mov dword [LinkInputHead], 0
        mov eax, dword [LinkInputHead]
        mov dword [LinkInputTail], eax
        mov dword [LinkInputFrame], 0
        mov ecx, 5Ah
        xor eax, eax
        mov edi, InputRecordRing
        rep stosb
        mov dword [InputRecordCount], 0
        mov dword [InputRecordIndex], 0
        mov dword [InputRecordHead], 0
        mov ecx, 10h
        xor eax, eax
        mov edi, SlotButtons
        rep stosb
        xor eax, eax
        call LinkSync
        mov eax, dword [byte ebp-04h]
        mov dword [LinkInputDelay], eax
        mov word [BaudRateTable], 1
.1:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkExchangeInput                                               13407  96 PC
; From InputRecordTimer on a modem game: sends this side's two pads as a type
; 2 message (packed) and, once both sides' pads for a frame are in, pushes
; the frame's input record into InputRecordRing
;-----------------------------------------------------------------------------
LinkExchangeInput:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 1Ch
        mov dword [byte ebp-01Ch], eax
        test byte [LinkFlags], 2
        je short .1
        cmp dword [LinkInputDelay], byte 0
        jne short .2
.1:
        jmp near .23
.2:
        mov dword [LinkInputDelay], 0
        mov eax, dword [LinkTickCount]
        inc dword [LinkTickCount]
        cmp dword [LinkInputFrame], byte 4
        jge short .3
        cmp dword [byte ebp-01Ch], byte 0
        je short .4
.3:
        jmp near .7
.4:
        imul eax, dword [LinkInputHead], byte 6
        mov edx, LinkInputQueue
        add edx, eax
        mov dword [byte ebp-018h], edx
        mov eax, dword [byte ebp-018h]
        mov byte [eax], 2
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne short .5
        mov eax, dword [SlotInput]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [SlotInput+7]
        mov dword [byte ebp-08h], eax
        jmp short .6
.5:
        mov eax, dword [SlotInput+0Eh]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [SlotInput+15h]
        mov dword [byte ebp-08h], eax
.6:
        mov edx, dword [byte ebp-0Ch]
        and edx, byte 3
        mov eax, dword [byte ebp-08h]
        and eax, byte 3
        or edx, eax
        mov dword [byte ebp-04h], edx
        mov edx, dword [byte ebp-0Ch]
        shl edx, 6
        and edx, 3FF0000h
        mov eax, dword [byte ebp-08h]
        shl eax, 6
        and eax, 3FF0000h
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-0Ch]
        sar eax, 0Ch
        and eax, 100h
        mov edx, eax
        mov eax, dword [byte ebp-0Ch]
        and eax, 0FCh
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-08h]
        and eax, 0FCh
        shl eax, 7
        mov edx, eax
        mov eax, dword [byte ebp-08h]
        sar eax, 5
        and eax, 8000h
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-018h]
        mov dword [byte edx+01h], eax
        mov word [BaudRateTable], 0
        mov edx, 6
        mov eax, dword [byte ebp-018h]
        call LinkSendMessage
        test eax, eax
        je short .7
        inc dword [LinkInputFrame]
        mov edx, dword [LinkInputHead]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkInputHead], edx
.7:
        cmp dword [LinkInputFrame], byte 1
        jle short .8
        mov eax, dword [LinkRemoteTail]
        cmp eax, dword [LinkRemoteHead]
        jne short .9
.8:
        jmp short .10
.9:
        cmp dword [GameLoopActive], byte 1
        je short .11
.10:
        jmp short .12
.11:
        cmp dword [InputRecordCount], byte 5
        jl short .13
.12:
        jmp near .22
.13:
        imul edx, dword [InputRecordHead], byte 12h
        mov eax, InputRecordRing
        add eax, edx
        mov dword [byte ebp-010h], eax
        mov edx, dword [InputRecordHead]
        inc edx
        mov ebx, 5
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [InputRecordHead], edx
        inc dword [InputRecordCount]
        imul eax, dword [LinkInputTail], byte 6
        mov edx, LinkInputQueue
        add edx, eax
        mov dword [byte ebp-018h], edx
        mov edx, dword [LinkInputTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkInputTail], edx
        dec dword [LinkInputFrame]
        imul eax, dword [LinkRemoteTail], byte 6
        mov edx, LinkRemoteQueue
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [LinkRemoteTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkRemoteTail], edx
        mov eax, dword [byte ebp-018h]
        mov eax, dword [byte eax+01h]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-014h]
        mov eax, dword [byte eax+01h]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-0Ch]
        sar eax, 6
        and eax, 0FFC00h
        mov edx, dword [byte ebp-0Ch]
        and edx, byte 3
        or edx, eax
        mov dword [byte ebp-04h], edx
        mov eax, dword [byte ebp-0Ch]
        shl eax, 0Ch
        and eax, 100000h
        mov edx, dword [byte ebp-0Ch]
        and edx, 0FCh
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne short .14
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [edx], eax
        jmp short .15
.14:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+08h], eax
.15:
        mov eax, dword [byte ebp-0Ch]
        sar eax, 6
        and eax, 0FFC00h
        mov edx, dword [byte ebp-0Ch]
        and edx, byte 3
        or edx, eax
        mov dword [byte ebp-04h], edx
        mov eax, dword [byte ebp-0Ch]
        sar eax, 7
        and eax, 0FCh
        mov edx, eax
        mov eax, dword [byte ebp-0Ch]
        and eax, 8000h
        shl eax, 5
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne short .16
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+04h], eax
        jmp short .17
.16:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+0Ch], eax
.17:
        mov eax, dword [byte ebp-08h]
        sar eax, 6
        and eax, 0FFC00h
        mov edx, dword [byte ebp-08h]
        and edx, byte 3
        or edx, eax
        mov dword [byte ebp-04h], edx
        mov eax, dword [byte ebp-08h]
        shl eax, 0Ch
        and eax, 100000h
        mov edx, dword [byte ebp-08h]
        and edx, 0FCh
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne short .18
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+08h], eax
        jmp short .19
.18:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [edx], eax
.19:
        mov eax, dword [byte ebp-08h]
        sar eax, 6
        and eax, 0FFC00h
        mov edx, dword [byte ebp-08h]
        and edx, byte 3
        or edx, eax
        mov dword [byte ebp-04h], edx
        mov eax, dword [byte ebp-08h]
        sar eax, 7
        and eax, 0FCh
        mov edx, eax
        mov eax, dword [byte ebp-08h]
        and eax, 8000h
        shl eax, 5
        or eax, edx
        or dword [byte ebp-04h], eax
        mov eax, dword [LinkSyncInput]
        sar eax, 10h
        cmp eax, byte 1
        jne short .20
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+0Ch], eax
        jmp short .21
.20:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-010h]
        mov dword [byte edx+04h], eax
.21:
        mov eax, dword [byte ebp-010h]
        mov word [byte eax+010h], 4
.22:
        mov dword [LinkInputDelay], 1
        mov eax, dword [LinkTickCount]
        dec dword [LinkTickCount]
.23:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ModemChat                                    1377E  96 PC, medium confidence
; The modem chat box over a front-end screen: typed characters (1Fh-7Eh),
; Enter sends the line as type 6 messages, lines from the other side show up;
; Esc leaves
;-----------------------------------------------------------------------------
ModemChat:
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 74h
        mov dword [byte ebp-024h], eax
        mov dword [byte ebp-014h], edx
        mov dword [byte ebp-010h], ebx
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-01Ch], 0
        mov dword [byte ebp-030h], 0
        mov dword [byte ebp-02Ch], 0
        mov ax, word [SlotsTwoPlayer]
        and eax, 1
        cwde
        test eax, eax
        je near .57
        mov eax, dword [ViewScreenWidth]
        sar eax, 2
        mov edx, dword [ViewScreenWidth]
        sub edx, eax
        mov dword [byte ebp-04Ch], edx
        mov eax, dword [ViewScreenHeight]
        sar eax, 2
        mov edx, dword [ViewScreenHeight]
        sub edx, eax
        mov dword [byte ebp-048h], edx
        mov eax, dword [ViewScreenWidth]
        sub eax, dword [byte ebp-04Ch]
        sar eax, 1
        mov dword [byte ebp-044h], eax
        mov eax, dword [ViewScreenHeight]
        sub eax, dword [byte ebp-048h]
        sar eax, 1
        mov dword [byte ebp-040h], eax
        mov ax, word [str_X3]
        mov dword [byte ebp-04h], eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, byte 6
        mov edx, dword [byte ebp-048h]
        sub edx, eax
        mov eax, edx
        sar eax, 1
        sub eax, byte 3
        mov dword [byte ebp-03Ch], eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, byte 6
        mov dword [byte ebp-074h], eax
        mov eax, dword [byte ebp-074h]
        add eax, dword [byte ebp-03Ch]
        add eax, byte 3
        mov dword [byte ebp-070h], eax
        movsx edx, word [byte ebp+010h]
        movsx eax, word [byte ebp-0Ch]
        call SetTextColors
        cmp word [byte ebp-024h], byte 0
        je near .1
        push byte 0
        mov eax, dword [byte ebp-048h]
        push eax
        mov eax, dword [byte ebp-04Ch]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp-02Ch], eax
        mov edx, dword [byte ebp-02Ch]
        mov edx, dword [byte edx+02Ch]
        mov eax, dword [byte ebp-044h]
        mov word [byte edx+0Ch], ax
        mov eax, dword [byte ebp-02Ch]
        mov edx, dword [byte eax+02Ch]
        mov eax, dword [byte ebp-040h]
        mov word [byte edx+0Eh], ax
        call SetScreenTarget
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        xor edx, edx
        mov eax, dword [byte ebp-02Ch]
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov dword [byte ebp-030h], eax
        push byte 20h
        push dword 100h
        mov eax, str_SHAD
        push eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp-038h], eax
        push byte 20h
        push dword 300h
        mov eax, str_PAL22
        push eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-028h]
        push eax
        push dword 100h
        push byte 0
        call GetPaletteRange
        add esp, byte 0Ch
        mov eax, dword [byte ebp-038h]
        push eax
        mov eax, dword [byte ebp-028h]
        push eax
        push dword 851Eh
        call TintRect
        add esp, byte 0Ch
        mov eax, dword [byte ebp-02Ch]
        push eax
        call SetDrawBitmap
        add esp, byte 4
        movsx eax, word [byte ebp+010h]
        push eax
        movsx eax, word [byte ebp-0Ch]
        push eax
        push byte 2
        mov eax, dword [byte ebp-048h]
        dec eax
        push eax
        mov ecx, dword [byte ebp-04Ch]
        dec ecx
        xor ebx, ebx
        xor edx, edx
        mov eax, dword [byte ebp-038h]
        call DrawBox
        mov eax, dword [byte ebp-028h]
        push eax
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp-038h]
        push eax
        call FreeMemBlock
        add esp, byte 4
        mov ebx, 3
        mov edx, dword [byte ebp-04Ch]
        sar edx, 1
        mov eax, 20Bh
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [byte ebp-0Ch]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, byte 5
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, byte 5
        push eax
        push byte 1
        call FillRectColor
        add esp, byte 14h
        movsx eax, word [byte ebp-0Ch]
        push eax
        mov eax, dword [byte ebp-070h]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        mov eax, dword [byte ebp-070h]
        sub eax, byte 2
        push eax
        push byte 1
        call FillRectColor
        add esp, byte 14h
        call SetScreenTarget
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        jmp near .2
.1:
        call SetScreenTarget
        movsx eax, word [byte ebp+010h]
        push eax
        mov eax, dword [byte ebp-048h]
        push eax
        mov eax, dword [byte ebp-04Ch]
        push eax
        mov eax, dword [byte ebp-040h]
        push eax
        mov eax, dword [byte ebp-044h]
        push eax
        call FillRect
        add esp, byte 14h
        mov ebx, dword [byte ebp-040h]
        add ebx, byte 3
        mov edx, dword [byte ebp-04Ch]
        sar edx, 1
        add edx, dword [byte ebp-044h]
        mov eax, 20Bh
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [byte ebp-0Ch]
        push eax
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-048h]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-040h]
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        inc eax
        push eax
        call DrawRectOutline
        add esp, byte 14h
        movsx eax, word [byte ebp-0Ch]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, dword [byte ebp-040h]
        add eax, byte 5
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, dword [byte ebp-040h]
        add eax, byte 5
        push eax
        mov eax, dword [byte ebp-044h]
        inc eax
        push eax
        call FillRectColor
        add esp, byte 14h
        movsx eax, word [byte ebp-0Ch]
        push eax
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-070h]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-070h]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        inc eax
        push eax
        call FillRectColor
        add esp, byte 14h
.2:
        mov word [ChatLocalLen], 0
        mov ax, word [ChatLocalLen]
        mov word [ChatRemoteLen], ax
        mov byte [byte ebp-06Ch], 6
        mov ecx, 3Ch
        xor eax, eax
        mov edi, LinkMsgQueue
        rep stosb
        mov dword [LinkMsgHead], 0
        mov eax, dword [LinkMsgHead]
        mov dword [LinkMsgTail], eax
.3:
        push byte 1Ch
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        jne short .4
        push byte 1
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .5
.4:
        jmp short .6
.5:
        call KbdGetKey
        cmp eax, byte 1Bh
        jne short .7
.6:
        jmp short .8
.7:
        call KbdGetKey
        cmp eax, byte 0Dh
        jne short .9
.8:
        call SoundIdle
        jmp short .3
.9:
        mov dword [ChatActive], 0
        mov eax, 1
        call LinkSync
        mov word [byte ebp-032h], 0
        mov eax, dword [byte ebp-032h]
        mov word [byte ebp-034h], ax
        mov eax, dword [byte ebp-034h]
        mov word [byte ebp-05Ah], ax
        mov eax, dword [byte ebp-05Ah]
        mov word [byte ebp-05Ch], ax
        movsx eax, word [byte ebp-014h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov eax, dword [byte ebp-040h]
        inc eax
        add eax, dword [byte ebp-074h]
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
        movsx eax, word [byte ebp-010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov eax, dword [byte ebp-040h]
        inc eax
        add eax, dword [byte ebp-070h]
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
        call SoundIdle
        call GetTicks
        add eax, byte 4
        mov dword [byte ebp-064h], eax
        call GetTicks
        mov dword [byte ebp-058h], eax
.10:
        call KbdGetKey
        mov dword [byte ebp-020h], eax
        cmp word [byte ebp-020h], byte 0
        je short .11
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 1Bh
        jne short .12
.11:
        jmp near .26
.12:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 1Fh
        jle short .13
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 7Eh
        jl short .14
.13:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 0Dh
        jne near .25
.14:
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov eax, dword [ChatLocalLen]
        sar eax, 10h
        cmp edx, eax
        je near .25
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        mov al, byte [byte ebp-020h]
        mov byte [dword edx+ChatLine], al
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [ChatLocalLen], dx
        cmp word [byte ebp-024h], byte 0
        je near .15
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-074h]
        movsx edx, word [byte ebp-034h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ch]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        lea esi, [edx+eax]
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        add eax, esi
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ch]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .16
.15:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ch]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call FillRect
        add esp, byte 14h
.16:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 0Dh
        je short .17
        mov al, byte [byte ebp-020h]
        mov byte [byte ebp-04h], al
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        lea ebx, [byte eax+01h]
        movsx edx, word [byte ebp-05Ch]
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        add edx, eax
        lea eax, [byte ebp-04h]
        call DrawColorText
        lea eax, [byte ebp-04h]
        push eax
        call TextStringWidth
        add esp, byte 4
        add word [byte ebp-05Ch], ax
.17:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 0Dh
        je short .18
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        movsx edx, word [byte ebp-05Ch]
        add edx, eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        cmp edx, eax
        jle near .24
.18:
        mov word [byte ebp-05Ch], 0
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, 3
        add word [byte ebp-034h], ax
        xor eax, eax
        mov al, byte [TextCharH]
        mov edx, dword [byte ebp-03Ch]
        sub edx, eax
        mov eax, edx
        movsx edx, word [byte ebp-034h]
        cmp edx, eax
        jl short .19
        mov word [byte ebp-034h], 0
.19:
        cmp word [byte ebp-024h], byte 0
        je short .20
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .21
.20:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-034h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
.21:
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, dword [byte ebp-034h]
        add eax, 3
        mov dword [byte ebp-018h], eax
        xor eax, eax
        mov al, byte [TextCharH]
        mov edx, dword [byte ebp-03Ch]
        sub edx, eax
        mov eax, edx
        movsx edx, word [byte ebp-018h]
        cmp edx, eax
        jl short .22
        mov dword [byte ebp-018h], 0
.22:
        cmp word [byte ebp-024h], byte 0
        je short .23
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .24
.23:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-074h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
.24:
        movsx eax, word [byte ebp-014h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov eax, dword [byte ebp-040h]
        inc eax
        mov edx, dword [byte ebp-074h]
        add edx, eax
        movsx eax, word [byte ebp-034h]
        add eax, edx
        push eax
        movsx eax, word [byte ebp-05Ch]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call FillRect
        add esp, byte 14h
.25:
        jmp near .28
.26:
        push byte 1
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .27
        mov dword [byte ebp-01Ch], 1
        mov word [byte ebp-020h], 0
        jmp short .28
.27:
        cmp word [byte ebp-01Ch], byte 0
        je short .28
        mov word [byte ebp-020h], 1Bh
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov eax, dword [ChatLocalLen]
        sar eax, 10h
        cmp edx, eax
        je short .28
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        mov al, byte [byte ebp-020h]
        mov byte [dword edx+ChatLine], al
        mov edx, dword [ChatLocalLen-2]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [ChatLocalLen], dx
.28:
        call GetTicks
        cmp eax, dword [byte ebp-058h]
        jle near .35
        mov ax, word [ChatRemoteLen]
        cmp ax, word [ChatLocalLen]
        je near .35
        mov dword [byte ebp-054h], 0
.29:
        mov ax, word [ChatRemoteLen]
        cmp ax, word [ChatLocalLen]
        je short .30
        cmp dword [byte ebp-054h], byte 4
        jl short .31
.30:
        jmp short .32
.31:
        mov edx, dword [ChatLocalLen]
        sar edx, 10h
        mov bl, byte [dword edx+ChatLine]
        mov edx, dword [byte ebp-054h]
        mov byte [byte edx+ebp-06Ah], bl
        mov edx, dword [ChatLocalLen]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [ChatRemoteLen], dx
        mov edx, dword [byte ebp-054h]
        inc dword [byte ebp-054h]
        jmp short .29
.32:
        mov al, byte [byte ebp-054h]
        mov byte [byte ebp-06Bh], al
.33:
        mov edx, 6
        lea eax, [byte ebp-06Ch]
        call LinkSendMessage
        test eax, eax
        jne short .34
        call SoundIdle
        jmp short .33
.34:
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-058h], eax
.35:
        mov eax, dword [LinkMsgTail]
        cmp eax, dword [LinkMsgHead]
        je near .54
        mov eax, dword [LinkMsgHead]
        mov dword [byte ebp-060h], eax
        mov dword [byte ebp-08h], 0
.36:
        mov eax, dword [LinkMsgTail]
        cmp eax, dword [byte ebp-060h]
        je short .37
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 1Bh
        jne short .38
.37:
        jmp near .54
.38:
        imul eax, dword [LinkMsgTail], byte 6
        mov edx, LinkMsgQueue
        add edx, eax
        mov dword [byte ebp-050h], edx
        mov dword [byte ebp-054h], 0
.39:
        mov eax, dword [byte ebp-050h]
        movsx eax, byte [byte eax+01h]
        cmp eax, dword [byte ebp-054h]
        jle short .40
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 1Bh
        jne short .41
.40:
        jmp near .53
.41:
        mov eax, dword [byte ebp-050h]
        add eax, dword [byte ebp-054h]
        movsx ax, byte [byte eax+02h]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 1Bh
        je near .52
        cmp word [byte ebp-024h], byte 0
        je near .42
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-070h]
        movsx edx, word [byte ebp-032h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ah]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        lea esi, [edx+eax]
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        add eax, esi
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ah]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .43
.42:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        inc eax
        push eax
        movsx eax, word [byte ebp-05Ah]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call FillRect
        add esp, byte 14h
.43:
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 0Dh
        je short .44
        mov al, byte [byte ebp-08h]
        mov byte [byte ebp-04h], al
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        lea ebx, [byte eax+01h]
        movsx edx, word [byte ebp-05Ah]
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        add edx, eax
        lea eax, [byte ebp-04h]
        call DrawColorText
        lea eax, [byte ebp-04h]
        push eax
        call TextStringWidth
        add esp, byte 4
        add word [byte ebp-05Ah], ax
.44:
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 0Dh
        je short .45
        movsx esi, word [byte ebp-05Ah]
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        add esi, eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        cmp esi, eax
        jle near .51
.45:
        mov word [byte ebp-05Ah], 0
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, 3
        add word [byte ebp-032h], ax
        xor eax, eax
        mov al, byte [TextCharH]
        mov edx, dword [byte ebp-03Ch]
        sub edx, eax
        mov eax, edx
        movsx edx, word [byte ebp-032h]
        cmp edx, eax
        jl short .46
        mov word [byte ebp-032h], 0
.46:
        cmp word [byte ebp-024h], byte 0
        je short .47
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .48
.47:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-032h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
.48:
        xor eax, eax
        mov al, byte [TextCharH]
        add eax, dword [byte ebp-032h]
        add eax, 3
        mov dword [byte ebp-018h], eax
        xor eax, eax
        mov al, byte [TextCharH]
        mov edx, dword [byte ebp-03Ch]
        sub edx, eax
        mov eax, edx
        movsx edx, word [byte ebp-018h]
        cmp edx, eax
        jl short .49
        mov dword [byte ebp-018h], 0
.49:
        cmp word [byte ebp-024h], byte 0
        je short .50
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        xor edx, edx
        mov dl, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 2
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call SetClipWindow
        add esp, byte 10h
        mov eax, dword [byte ebp-02Ch]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .51
.50:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        push eax
        mov edx, dword [byte ebp-040h]
        add edx, dword [byte ebp-070h]
        movsx eax, word [byte ebp-018h]
        add eax, edx
        inc eax
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, byte 3
        push eax
        call FillRect
        add esp, byte 14h
.51:
        movsx eax, word [byte ebp-010h]
        push eax
        xor eax, eax
        mov al, byte [TextCharH]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call TextStringWidth
        add esp, byte 4
        push eax
        mov eax, dword [byte ebp-040h]
        inc eax
        mov edx, dword [byte ebp-070h]
        add edx, eax
        movsx eax, word [byte ebp-032h]
        add eax, edx
        push eax
        movsx eax, word [byte ebp-05Ah]
        mov edx, dword [byte ebp-044h]
        add edx, byte 3
        add eax, edx
        push eax
        call FillRect
        add esp, byte 14h
.52:
        mov eax, dword [byte ebp-054h]
        inc dword [byte ebp-054h]
        jmp near .39
.53:
        mov edx, dword [LinkMsgTail]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [LinkMsgTail], edx
        jmp near .36
.54:
        call GetTicks
        cmp eax, dword [byte ebp-064h]
        jle short .55
        call SoundIdle
        call GetTicks
        add eax, byte 4
        mov dword [byte ebp-064h], eax
.55:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 1Bh
        je short .56
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 1Bh
        jne near .10
.56:
        mov eax, 1
        call LinkSync
        cmp word [byte ebp-024h], byte 0
        je short .57
        mov eax, dword [byte ebp-030h]
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp-030h]
        push eax
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp-02Ch]
        push eax
        call FreeBitmap
        add esp, byte 4
.57:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        ret 4
ThreeStarsRowY:
        db 09Eh,00h,086h,00h,071h,00h
ThreeStarsNameY:
        db 0AEh,00h,095h,00h,07Bh,00h
ThreeStarsScales:
        db 070h,0FDh,00h,00h,0Ah,0D7h,00h,00h,0C2h,0B5h,00h,00h
str_N:
        db 04Eh,00h,00h,00h,08h,01h,00h,00h,074h,01h,00h,00h,04Fh,00h,00h,00h
        db 0B0h,01h,00h,00h,048h,01h,00h,00h
ThreeStarsHotspots:
        db 0Fh,01h,00h,00h,062h,01h,00h,00h,019h,01h,00h,00h,05Bh,01h,00h,00h
        db 089h,01h,00h,00h,05Bh,01h,00h,00h,095h,01h,00h,00h,062h,01h,00h,00h
        db 095h,01h,00h,00h,06Bh,01h,00h,00h,087h,01h,00h,00h,071h,01h,00h,00h
        db 019h,01h,00h,00h,071h,01h,00h,00h,0Fh,01h,00h,00h,06Ah,01h,00h,00h
        db 011h,01h,00h,00h,099h,01h,00h,00h,01Ah,01h,00h,00h,091h,01h,00h,00h
        db 08Ch,01h,00h,00h,091h,01h,00h,00h,097h,01h,00h,00h,098h,01h,00h,00h
        db 097h,01h,00h,00h,0A1h,01h,00h,00h,08Dh,01h,00h,00h,0A7h,01h,00h,00h
        db 019h,01h,00h,00h,0A7h,01h,00h,00h,010h,01h,00h,00h,0A1h,01h,00h,00h
