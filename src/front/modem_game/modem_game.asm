; Modem game session: open, connect and close a modem game, sync points, blocks, pad input exchange and the chat box (96 PC).
bits 32
%include "hockey.inc"
section s_122A6 progbits alloc exec nowrite align=1
extern addtimer, byte_114D96, byte_11FA2F, byte_1519A0, byte_151AD4, byte_151ADA, byte_151ADB, byte_17BDAE
extern DebugPrintf, dword_114B9C, dword_114CE2, dword_114D0E, dword_114D12, dword_114D1A, dword_114D1E, dword_114D36
extern dword_114D3A, dword_114D9A, dword_114D9E, dword_114DA2, dword_114DA6, dword_114DAA, dword_114DAE, dword_114DB2
extern dword_114DB6, dword_114DBA, dword_114DCA, dword_115008, dword_1150D4, dword_11BCE4, dword_11F5C0, dword_11F5C4
extern dword_1515B7, dword_1515BE, dword_1515C5, dword_1515CC, dword_15199C, dword_1519B4, dword_1519B8, dword_1519BC
extern dword_1519FC, dword_151A00, dword_151A40, dword_151A80, dword_151A84, dword_151A88, dword_151A8C, dword_151A90
extern dword_151AD0, dword_151AD5, dword_151ADE, dword_15291C, dword_17C9AA, dword_17C9F4, FillRect, fputchar
extern GameLoopActive, GetTicks, InputRecordCount, InputRecordHead, InputRecordRing, LinkClose, LinkConnect, LinkCopyBytes
extern LinkOpen, LinkSendMessage, LinkTimerTick, optblock_end, optflags, SetClipWindow, SetDrawBitmap, SetLinkAbortCheck
extern SetLinkMessageHandler, SetLinkSpareHook, SlotButtons, str_ABORT, str_HFwt, str_HGwt, str_LGwt, str_PAL22
extern str_SHAD, str_X3, strcpy_, MessageBox, HideMessage, ShowMessage, CopyBitmap, SetTextColors
extern DrawColorText, DrawColorTextCentred, DrawBox, StopMusic, QueueCurrentMusic, FillMusicStream, PlayMusic, FadeOutMusic
extern SoundSecondsToBytes, SoundIdle, GetLangText, RemoveTimerCallback, DrawShapeAtOwnPos, sub_AAA8C, sub_AADA4, AllocMemBlock
extern FreeMemBlock, sub_AD35C, sub_AD620, sub_ADA80, sub_ADBEC, SetScreenTarget, GetPaletteRange, FillRectColor
extern sub_DFE9C, KbdGetKey, sub_E04E0, unk_114CE6, unk_114D46, unk_114D6E, unk_15179C, unk_1519C0
extern unk_151A04, unk_151A44, unk_151A94, unk_151ADC, unk_17C9B8, unk_17C9CC, unk_17D272, word_114CE0
extern word_114CE4, word_114DBE, word_114DC0, word_151AE0, word_151AE2, word_17C9AC, word_17C9B0, word_17C9B2
global ModemGameOpen, LinkBlockStart, LinkBlockData, LinkSendBlock, LinkReceiveBlock, LinkSyncMessage, LinkGameMessage, jpt_1278E
global LinkGameMessage_18, LinkExchangeValues, ModemGameConnect, ShowLinkWaitBox, HideLinkWaitBox, LinkSyncTimedOut, LinkSyncPoint, LinkSync
global LinkSyncWithMessage, ModemGameClose, ModemGameQuit, LinkResyncInput, LinkExchangeInput, ModemChat, unk_144BD, unk_144C3
global unk_144C9, unk_144D5, unk_144ED
;-----------------------------------------------------------------------------
; ModemGameOpen                                                   122A6  96 PC
; (answer, settings): copies the modem settings (port, speed, numbers, init
; string) and opens the link with LinkOpen, showing a message while the modem
; starts (unless word_17C9B0); clears the message queues; 1 when open
; (byte_114D96 bit 1), else shows the error
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
        cmp dword [byte_114D96], byte 0
        je short .1
        mov dword [byte ebp-04h], 0
        jmp near .8
.1:
        mov eax, dword [dword_17C9AA]
        sar eax, 10h
        mov dword [dword_114D0E], eax
        mov eax, dword [word_17C9AC]
        sar eax, 10h
        add eax, eax
        mov eax, dword [dword eax+word_114DC0]
        sar eax, 10h
        mov dword [dword_114D36], eax
        mov eax, dword [word_17C9B2]
        sar eax, 10h
        mov dword [dword_114D3A], eax
        cmp word [word_17C9B0], byte 0
        je short .2
        mov dword [dword_114D1E], 1
        mov dword [dword_114D12], 9
        jmp short .3
.2:
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov eax, 55h
        call GetLangText
        call ShowMessage
        xor edx, edx
        mov eax, 50h
        call FadeOutMusic
        call StopMusic
        mov edx, unk_17C9B8
        mov eax, unk_114CE6
        call strcpy_
        mov edx, unk_17C9CC
        mov eax, unk_114D46
        call strcpy_
        mov edx, dword_17C9F4
        mov eax, unk_114D6E
        call strcpy_
        mov dword [dword_114D12], 9
        mov dword [dword_114D1E], 0
.3:
        mov eax, dword [byte ebp-010h]
        mov dword [dword_114D1A], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A94
        rep stosb
        mov dword [dword_151A88], 0
        mov eax, dword [dword_151A88]
        mov dword [dword_151A90], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A04
        rep stosb
        mov dword [dword_151A80], 0
        mov eax, dword [dword_151A80]
        mov dword [dword_151A8C], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A44
        rep stosb
        mov dword [dword_114D9A], 0
        mov eax, dword [dword_114D9A]
        mov dword [dword_1519FC], eax
        mov eax, dword [dword_1519FC]
        mov dword [dword_151A00], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_1519C0
        rep stosb
        mov dword [dword_151A40], 0
        mov eax, dword [dword_151A40]
        mov dword [dword_151A84], eax
        mov dword [dword_114DA6], 0
        mov dword [dword_114DAE], 0
        mov dword [dword_114DB2], 0
        mov dword [dword_114DB6], 0
        mov dword [dword_114DBA], 0
        mov word [word_114DBE], 0
        mov eax, dword [byte ebp-0Ch]
        call SetLinkAbortCheck
        mov eax, unk_114CE6
        call LinkOpen
        test eax, eax
        jne near .6
        cmp word [word_17C9B0], byte 0
        jne short .4
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.4:
        cmp word [word_17C9B0], byte 0
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
        mov ecx, byte_17BDAE
        lea ebx, [byte ebp-08h]
        mov edx, 1
        mov eax, 129h
        call GetLangText
        call MessageBox
        mov dword [byte_114D96], 0
        mov dword [byte ebp-04h], 0
        jmp short .8
.6:
        or byte [byte_114D96], 1
        mov eax, LinkTimerTick
        push eax
        call addtimer
        add esp, byte 4
        cmp word [word_17C9B0], byte 0
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
; unk_15179C)
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
        mov dword [dword_1519B8], eax
        mov dword [dword_114DBA], unk_15179C
        mov eax, dword [dword_1519B8]
        mov eax, dword [byte eax+01h]
        mov dword [dword_114DB6], eax
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
        mov dword [dword_1519BC], eax
        cmp dword [dword_114DBA], byte 0
        je short .1
        cmp dword [dword_114DB6], byte 0
        jg short .2
.1:
        jmp short .3
.2:
        mov eax, dword [dword_1519BC]
        movsx ebx, byte [byte eax+01h]
        mov eax, dword [dword_1519BC]
        lea edx, [byte eax+02h]
        mov eax, dword [dword_114DBA]
        call LinkCopyBytes
        mov eax, dword [dword_1519BC]
        movsx eax, byte [byte eax+01h]
        sub dword [dword_114DB6], eax
        mov eax, dword [dword_1519BC]
        movsx eax, byte [byte eax+01h]
        add dword [dword_114DBA], eax
        cmp dword [dword_114DB6], byte 0
        jne short .3
        inc dword [dword_114DAE]
        mov dword [dword_114DBA], 0
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
        mov word [word_114DC0], 0
        mov byte [byte_151AD4], 3
        mov eax, dword [byte ebp-010h]
        mov dword [dword_151AD5], eax
.1:
        mov edx, 6
        mov eax, byte_151AD4
        call LinkSendMessage
        test eax, eax
        jne short .2
        call SoundIdle
        jmp short .1
.2:
        mov dword [dword_114DBA], unk_15179C
        mov ebx, dword [byte ebp-010h]
        mov edx, dword [byte ebp-014h]
        mov eax, dword [dword_114DBA]
        call LinkCopyBytes
        mov eax, dword [byte ebp-010h]
        mov dword [dword_114DB6], eax
        mov byte [byte_151ADA], 4
.3:
        cmp dword [dword_114DB6], byte 4
        jle short .4
        mov dword [byte ebp-08h], 4
        jmp short .5
.4:
        mov eax, dword [dword_114DB6]
        mov dword [byte ebp-08h], eax
.5:
        mov al, byte [byte ebp-08h]
        mov byte [byte_151ADB], al
        mov ebx, dword [byte ebp-08h]
        mov edx, dword [dword_114DBA]
        mov eax, unk_151ADC
        call LinkCopyBytes
        mov edx, 6
        mov eax, byte_151ADA
        call LinkSendMessage
        test eax, eax
        je short .6
        mov eax, dword [byte ebp-08h]
        add dword [dword_114DBA], eax
        mov eax, dword [byte ebp-08h]
        sub dword [dword_114DB6], eax
        jmp short .7
.6:
        call SoundIdle
.7:
        cmp dword [dword_114DB6], byte 0
        jg short .3
        mov dword [dword_114DBA], 0
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
        inc dword [dword_114DB2]
.1:
        mov eax, dword [dword_114DAE]
        cmp eax, dword [dword_114DB2]
        jge short .2
        call SoundIdle
        jmp short .1
.2:
        mov ebx, dword [byte ebp-08h]
        mov edx, unk_15179C
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
; Received message type 5: the other side's sync point number (dword_114D9E);
; one from this side's own number means "quit" (word_114DBE)
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
        mov dword [dword_1519B4], eax
        mov eax, dword [dword_1519B4]
        movsx ax, byte [byte eax+05h]
        cmp ax, word [word_114CE4]
        je short .1
        mov eax, dword [dword_1519B4]
        mov eax, dword [byte eax+01h]
        mov dword [dword_114D9E], eax
        jmp short .2
.1:
        mov word [word_114DBE], 1
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
jpt_1278E:
        dd LinkGameMessage_18.4
        dd LinkGameMessage_18.2
        dd LinkGameMessage_18.6
        dd LinkGameMessage_18.7
        dd LinkGameMessage_18.8
        dd LinkGameMessage_18.1
LinkGameMessage_18:
        mov word [word_114DC0], 0
        mov eax, dword [byte ebp-04h]
        mov al, byte [eax]
        dec al
        mov byte [byte ebp-08h], al
        cmp byte [byte ebp-08h], 5
        ja near .9
        xor eax, eax
        mov al, byte [byte ebp-08h]
        shl eax, 2
        jmp dword [dword cs:eax+jpt_1278E]
.1:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [dword_151A40], byte 6
        mov ecx, unk_1519C0
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [dword_151A40]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A40], edx
        mov eax, dword [dword_151A40]
        cmp eax, dword [dword_151A84]
        jne short .2
        mov edx, dword [dword_151A84]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A84], edx
.2:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [dword_151A88], byte 6
        mov ecx, unk_151A94
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [dword_151A88]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A88], edx
        mov eax, dword [dword_151A88]
        cmp eax, dword [dword_151A90]
        jne short .3
        mov edx, dword [dword_151A90]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A90], edx
.3:
        jmp near .9
.4:
        mov ebx, 6
        mov edx, dword [byte ebp-04h]
        imul eax, dword [dword_151A80], byte 6
        mov ecx, unk_151A04
        add eax, ecx
        call LinkCopyBytes
        mov edx, dword [dword_151A80]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A80], edx
        mov eax, dword [dword_151A80]
        cmp eax, dword [dword_151A8C]
        jne short .5
        mov edx, dword [dword_151A80]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A8C], edx
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
        test byte [byte_114D96], 2
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
        mov word [word_114DC0], 0
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
        mov eax, dword [dword_151A8C]
        cmp eax, dword [dword_151A80]
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
        imul eax, dword [dword_151A8C], byte 6
        mov edx, unk_151A04
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
        mov edx, dword [dword_151A8C]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A8C], edx
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
; the side (word_114CE4: 1 dialler), syncs, and the answering side sends its
; game options (optblock, 0B9h bytes) and option bits to the dialler; 1 when
; connected (byte_114D96 bit 2, word_114CE0 bit 1)
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
        cmp dword [byte_114D96], byte 1
        je short .2
        mov dword [byte ebp-04h], 0
        jmp near .17
.2:
        cmp dword [dword_114D1A], byte 0
        je short .3
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov eax, 56h
        call GetLangText
        call ShowMessage
        jmp short .4
.3:
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov eax, 57h
        call GetLangText
        call ShowMessage
.4:
        mov eax, dword [byte ebp-014h]
        call SetLinkAbortCheck
        mov dword [dword_114DA6], 0
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A94
        rep stosb
        mov dword [dword_151A88], 0
        mov eax, dword [dword_151A88]
        mov dword [dword_151A90], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A04
        rep stosb
        mov dword [dword_151A80], 0
        mov eax, dword [dword_151A80]
        mov dword [dword_151A8C], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_151A44
        rep stosb
        mov dword [dword_114D9A], 0
        mov eax, dword [dword_114D9A]
        mov dword [dword_1519FC], eax
        mov eax, dword [dword_1519FC]
        mov dword [dword_151A00], eax
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_1519C0
        rep stosb
        mov dword [dword_151A40], 0
        mov eax, dword [dword_151A40]
        mov dword [dword_151A84], eax
        mov dword [dword_114DAE], 0
        mov dword [dword_114DB2], 0
        mov dword [dword_114DB6], 0
        mov dword [dword_114DBA], 0
        mov eax, LinkGameMessage
        call SetLinkMessageHandler
        call LinkConnect
        test eax, eax
        jne short .6
        xor eax, eax
        call SetLinkAbortCheck
        cmp word [word_17C9B0], byte 0
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
        mov ecx, byte_17BDAE
        lea ebx, [byte ebp-0Ch]
        mov edx, 1
        mov eax, 58h
        call GetLangText
        call MessageBox
        mov dword [byte ebp-04h], 0
        jmp near .17
.6:
        cmp dword [dword_114D1A], byte 0
        je short .7
        mov word [word_114CE4], 1
        jmp short .8
.7:
        mov word [word_114CE4], 0
.8:
        call HideMessage
        mov dword [byte ebp-020h], 0F0h
        mov dword [byte ebp-01Ch], 140h
        mov eax, byte_17BDAE
        mov dword [byte ebp-018h], eax
        cmp word [word_17C9B0], byte 0
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
        cmp word [word_17C9B0], byte 0
        jne short .11
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.11:
        mov word [word_114DBE], 0
        mov edx, 1
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
        call LinkSyncPoint
        test eax, eax
        jne short .14
        call HideMessage
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-0Ch], eax
        cmp word [word_114DBE], byte 0
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
        mov ecx, byte_17BDAE
        lea ebx, [byte ebp-0Ch]
        mov edx, 1
        mov eax, dword [byte ebp-08h]
        call MessageBox
        mov word [word_114DBE], 0
        mov dword [byte ebp-04h], 0
        jmp near .17
.14:
        mov word [word_114DBE], 0
        call HideMessage
        xor eax, eax
        call SetLinkAbortCheck
        or byte [byte_114D96], 2
        or byte [word_114CE0], 1
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov eax, 59h
        call GetLangText
        call ShowMessage
        cmp word [word_114CE4], byte 0
        jne short .15
        mov edx, 0B9h
        mov eax, unk_17D272
        call LinkReceiveBlock
        xor edx, edx
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
        call LinkSyncPoint
        mov edx, 4
        mov eax, dword_114DCA
        call LinkReceiveBlock
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        mov dword [byte ebp-010h], eax
        mov eax, dword [dword_114DCA]
        and eax, byte 3
        and word [optflags], 0FE7Fh
        shl eax, 7
        or dword [optflags], eax
        mov eax, dword [byte ebp-010h]
        mov dword [dword_114DCA], eax
        xor edx, edx
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
        call LinkSyncPoint
        jmp short .16
.15:
        mov ecx, 0B9h
        mov esi, optblock_end
        mov edi, unk_17D272
        rep movsb
        mov edx, 0B9h
        mov eax, unk_17D272
        call LinkSendBlock
        xor edx, edx
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
        call LinkSyncPoint
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        mov dword [dword_114DCA], eax
        mov edx, 4
        mov eax, dword_114DCA
        call LinkSendBlock
        xor edx, edx
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
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
        cmp dword [dword_151AD0], byte 0
        jne near .5
        cmp dword [dword_11F5C0], 140h
        jle short .3
        cmp dword [dword_11BCE4], byte 0
        jne short .1
        mov eax, str_HGwt
        push eax
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-04h], eax
        jmp short .2
.1:
        mov eax, str_HFwt
        push eax
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.2:
        jmp short .4
.3:
        mov eax, str_LGwt
        push eax
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.4:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        sar eax, 1
        mov edx, dword [dword_11F5C0]
        sar edx, 1
        sub edx, eax
        mov eax, dword [byte ebp-04h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        sar eax, 10h
        sar eax, 1
        mov edx, dword [dword_11F5C4]
        sar edx, 1
        sub edx, eax
        mov eax, dword [byte ebp-04h]
        mov word [byte eax+0Eh], dx
        xor edx, edx
        mov eax, dword [byte ebp-04h]
        call CopyBitmap
        mov dword [dword_151AD0], eax
        push dword [dword_151AD0]
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp-04h]
        push eax
        call sub_AAA8C
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
        cmp dword [dword_151AD0], byte 0
        je short .1
        push dword [dword_151AD0]
        call sub_AADA4
        add esp, byte 4
        push dword [dword_151AD0]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword_151AD0], 0
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
; (dword_114DA2) has passed
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
        cmp eax, dword [dword_114DA2]
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
        mov word [word_114DC0], 0
        mov byte [byte ebp-018h], 5
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-017h], eax
        mov al, byte [word_114CE4]
        mov byte [byte ebp-013h], al
        mov eax, dword [dword_114CE2]
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
        mov ax, word [word_114DBE]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .4
        cmp dword [dword_15291C], byte 0
        jne short .5
.4:
        jmp short .6
.5:
        cmp word [byte ebp-04h], byte 0
        je short .7
.6:
        jmp short .8
.7:
        call dword [dword_15291C]
        mov dword [byte ebp-04h], eax
.8:
        call SoundIdle
        jmp short .1
.9:
        mov eax, dword [dword_114D9E]
        cmp eax, dword [byte ebp-0Ch]
        je short .10
        cmp word [byte ebp-04h], byte 0
        je short .11
.10:
        jmp short .17
.11:
        mov ax, word [word_114DBE]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .12
        cmp dword [dword_15291C], byte 0
        jne short .13
.12:
        jmp short .14
.13:
        cmp word [byte ebp-04h], byte 0
        je short .15
.14:
        jmp short .16
.15:
        call dword [dword_15291C]
        mov dword [byte ebp-04h], eax
.16:
        call SoundIdle
        jmp short .9
.17:
        jmp near .34
.18:
        mov eax, dword [dword_114D9E]
        cmp eax, dword [byte ebp-0Ch]
        je short .19
        cmp word [byte ebp-04h], byte 0
        je short .20
.19:
        jmp short .26
.20:
        mov ax, word [word_114DBE]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .21
        cmp dword [dword_15291C], byte 0
        jne short .22
.21:
        jmp short .23
.22:
        cmp word [byte ebp-04h], byte 0
        je short .24
.23:
        jmp short .25
.24:
        call dword [dword_15291C]
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
        mov ax, word [word_114DBE]
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-010h], byte 0
        je short .29
        cmp dword [dword_15291C], byte 0
        jne short .30
.29:
        jmp short .31
.30:
        cmp word [byte ebp-04h], byte 0
        je short .32
.31:
        jmp short .33
.32:
        call dword [dword_15291C]
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
        test byte [byte_114D96], 2
        je near .6
        call GetTicks
        add eax, 1770h
        mov dword [dword_114DA2], eax
        mov eax, LinkSyncTimedOut
        call SetLinkAbortCheck
        cmp dword [byte ebp-08h], byte 0
        je short .1
        call ShowLinkWaitBox
.1:
        mov edx, 1
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
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
        test byte [byte_114D96], 2
        je near .4
        mov eax, LinkSyncTimedOut
        call SetLinkAbortCheck
        call GetTicks
        add eax, 1770h
        mov dword [dword_114DA2], eax
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov eax, dword [byte ebp-08h]
        call ShowMessage
.1:
        mov edx, 1
        inc dword [dword_114DA6]
        mov eax, dword [dword_114DA6]
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
        mov ax, word [word_114CE0]
        and eax, 1
        cwde
        test eax, eax
        je short .1
        mov eax, dword [dword_114DCA]
        and eax, byte 3
        and word [optflags], 0FE7Fh
        shl eax, 7
        or dword [optflags], eax
        xor eax, eax
        call SetLinkMessageHandler
        xor eax, eax
        call SetLinkSpareHook
.1:
        test byte [byte_114D96], 1
        je short .2
        mov eax, LinkTimerTick
        push eax
        call RemoveTimerCallback
        add esp, byte 4
        call LinkClose
.2:
        mov word [word_114CE0], 0
        mov dword [byte_114D96], 0
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
        mov ax, word [word_114CE0]
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
        cmp word [word_114DC0], byte 0
        jne near .1
        test byte [byte_114D96], 2
        je near .1
        mov eax, dword [dword_114DAA]
        mov dword [byte ebp-04h], eax
        mov dword [dword_114DAA], 0
        xor eax, eax
        call LinkSync
        mov dword [dword_151A88], 0
        mov eax, dword [dword_151A88]
        mov dword [dword_151A90], eax
        mov dword [dword_1519FC], 0
        mov eax, dword [dword_1519FC]
        mov dword [dword_151A00], eax
        mov dword [dword_114D9A], 0
        mov ecx, 5Ah
        xor eax, eax
        mov edi, InputRecordRing
        rep stosb
        mov dword [InputRecordCount], 0
        mov dword [dword_114B9C], 0
        mov dword [InputRecordHead], 0
        mov ecx, 10h
        xor eax, eax
        mov edi, SlotButtons
        rep stosb
        xor eax, eax
        call LinkSync
        mov eax, dword [byte ebp-04h]
        mov dword [dword_114DAA], eax
        mov word [word_114DC0], 1
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
        test byte [byte_114D96], 2
        je short .1
        cmp dword [dword_114DAA], byte 0
        jne short .2
.1:
        jmp near .23
.2:
        mov dword [dword_114DAA], 0
        mov eax, dword [dword_115008]
        inc dword [dword_115008]
        cmp dword [dword_114D9A], byte 4
        jge short .3
        cmp dword [byte ebp-01Ch], byte 0
        je short .4
.3:
        jmp near .7
.4:
        imul eax, dword [dword_1519FC], byte 6
        mov edx, unk_151A44
        add edx, eax
        mov dword [byte ebp-018h], edx
        mov eax, dword [byte ebp-018h]
        mov byte [eax], 2
        mov eax, dword [dword_114CE2]
        sar eax, 10h
        cmp eax, byte 1
        jne short .5
        mov eax, dword [dword_1515B7]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_1515BE]
        mov dword [byte ebp-08h], eax
        jmp short .6
.5:
        mov eax, dword [dword_1515C5]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_1515CC]
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
        mov word [word_114DC0], 0
        mov edx, 6
        mov eax, dword [byte ebp-018h]
        call LinkSendMessage
        test eax, eax
        je short .7
        inc dword [dword_114D9A]
        mov edx, dword [dword_1519FC]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_1519FC], edx
.7:
        cmp dword [dword_114D9A], byte 1
        jle short .8
        mov eax, dword [dword_151A90]
        cmp eax, dword [dword_151A88]
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
        imul eax, dword [dword_151A00], byte 6
        mov edx, unk_151A44
        add edx, eax
        mov dword [byte ebp-018h], edx
        mov edx, dword [dword_151A00]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A00], edx
        dec dword [dword_114D9A]
        imul eax, dword [dword_151A90], byte 6
        mov edx, unk_151A94
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [dword_151A90]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A90], edx
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
        mov eax, dword [dword_114CE2]
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
        mov eax, dword [dword_114CE2]
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
        mov eax, dword [dword_114CE2]
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
        mov eax, dword [dword_114CE2]
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
        mov dword [dword_114DAA], 1
        mov eax, dword [dword_115008]
        dec dword [dword_115008]
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
        mov ax, word [word_114CE0]
        and eax, 1
        cwde
        test eax, eax
        je near .57
        mov eax, dword [dword_11F5C0]
        sar eax, 2
        mov edx, dword [dword_11F5C0]
        sub edx, eax
        mov dword [byte ebp-04Ch], edx
        mov eax, dword [dword_11F5C4]
        sar eax, 2
        mov edx, dword [dword_11F5C4]
        sub edx, eax
        mov dword [byte ebp-048h], edx
        mov eax, dword [dword_11F5C0]
        sub eax, dword [byte ebp-04Ch]
        sar eax, 1
        mov dword [byte ebp-044h], eax
        mov eax, dword [dword_11F5C4]
        sub eax, dword [byte ebp-048h]
        sar eax, 1
        mov dword [byte ebp-040h], eax
        mov ax, word [str_X3]
        mov dword [byte ebp-04h], eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
        add eax, byte 6
        mov edx, dword [byte ebp-048h]
        sub edx, eax
        mov eax, edx
        sar eax, 1
        sub eax, byte 3
        mov dword [byte ebp-03Ch], eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        call sub_AD35C
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
        call sub_AD620
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
        mov al, byte [byte_11FA2F]
        add eax, byte 5
        push eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        call sub_AADA4
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
        call sub_ADA80
        add esp, byte 14h
        movsx eax, word [byte ebp-0Ch]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
        add eax, dword [byte ebp-040h]
        add eax, byte 5
        push eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-04Ch]
        sub eax, byte 3
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov word [word_151AE0], 0
        mov ax, word [word_151AE0]
        mov word [word_151AE2], ax
        mov byte [byte ebp-06Ch], 6
        mov ecx, 3Ch
        xor eax, eax
        mov edi, unk_1519C0
        rep stosb
        mov dword [dword_151A40], 0
        mov eax, dword [dword_151A40]
        mov dword [dword_151A84], eax
.3:
        push byte 1Ch
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        jne short .4
        push byte 1
        call sub_DFE9C
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
        mov dword [dword_15199C], 0
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
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov eax, dword [word_151AE0]
        sar eax, 10h
        cmp edx, eax
        je near .25
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        mov al, byte [byte ebp-020h]
        mov byte [dword edx+byte_1519A0], al
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [word_151AE0], dx
        cmp word [byte ebp-024h], byte 0
        je near .15
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-074h]
        movsx edx, word [byte ebp-034h]
        add eax, edx
        xor edx, edx
        mov dl, byte [byte_11FA2F]
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
        call fputchar
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .16
.15:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        call fputchar
        add esp, byte 4
        add word [byte ebp-05Ch], ax
.17:
        movsx eax, word [byte ebp-020h]
        cmp eax, byte 0Dh
        je short .18
        mov eax, str_X3
        push eax
        call fputchar
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
        mov al, byte [byte_11FA2F]
        add eax, 3
        add word [byte ebp-034h], ax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov dl, byte [byte_11FA2F]
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .21
.20:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov al, byte [byte_11FA2F]
        add eax, dword [byte ebp-034h]
        add eax, 3
        mov dword [byte ebp-018h], eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov dl, byte [byte_11FA2F]
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .24
.23:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        call sub_DFE9C
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
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov eax, dword [word_151AE0]
        sar eax, 10h
        cmp edx, eax
        je short .28
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        mov al, byte [byte ebp-020h]
        mov byte [dword edx+byte_1519A0], al
        mov edx, dword [dword_151ADE]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [word_151AE0], dx
.28:
        call GetTicks
        cmp eax, dword [byte ebp-058h]
        jle near .35
        mov ax, word [word_151AE2]
        cmp ax, word [word_151AE0]
        je near .35
        mov dword [byte ebp-054h], 0
.29:
        mov ax, word [word_151AE2]
        cmp ax, word [word_151AE0]
        je short .30
        cmp dword [byte ebp-054h], byte 4
        jl short .31
.30:
        jmp short .32
.31:
        mov edx, dword [word_151AE0]
        sar edx, 10h
        mov bl, byte [dword edx+byte_1519A0]
        mov edx, dword [byte ebp-054h]
        mov byte [byte edx+ebp-06Ah], bl
        mov edx, dword [word_151AE0]
        sar edx, 10h
        inc edx
        mov ebx, 14h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov word [word_151AE2], dx
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
        mov eax, dword [dword_151A84]
        cmp eax, dword [dword_151A40]
        je near .54
        mov eax, dword [dword_151A40]
        mov dword [byte ebp-060h], eax
        mov dword [byte ebp-08h], 0
.36:
        mov eax, dword [dword_151A84]
        cmp eax, dword [byte ebp-060h]
        je short .37
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 1Bh
        jne short .38
.37:
        jmp near .54
.38:
        imul eax, dword [dword_151A84], byte 6
        mov edx, unk_1519C0
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
        mov dl, byte [byte_11FA2F]
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
        call fputchar
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .43
.42:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        call fputchar
        add esp, byte 4
        add word [byte ebp-05Ah], ax
.44:
        movsx eax, word [byte ebp-08h]
        cmp eax, byte 0Dh
        je short .45
        movsx esi, word [byte ebp-05Ah]
        mov eax, str_X3
        push eax
        call fputchar
        add esp, byte 4
        add esi, eax
        mov eax, dword [byte ebp-04Ch]
        sub eax, byte 5
        cmp esi, eax
        jle near .51
.45:
        mov word [byte ebp-05Ah], 0
        xor eax, eax
        mov al, byte [byte_11FA2F]
        add eax, 3
        add word [byte ebp-032h], ax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov dl, byte [byte_11FA2F]
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .48
.47:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov al, byte [byte_11FA2F]
        add eax, dword [byte ebp-032h]
        add eax, 3
        mov dword [byte ebp-018h], eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov dl, byte [byte_11FA2F]
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
        call sub_AADA4
        add esp, byte 4
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        jmp short .51
.50:
        movsx eax, word [byte ebp+010h]
        push eax
        xor eax, eax
        mov al, byte [byte_11FA2F]
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
        mov al, byte [byte_11FA2F]
        dec eax
        push eax
        mov eax, str_X3
        push eax
        call fputchar
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
        mov edx, dword [dword_151A84]
        inc edx
        mov ebx, 0Ah
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword_151A84], edx
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
        call sub_AADA4
        add esp, byte 4
        mov eax, dword [byte ebp-030h]
        push eax
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp-02Ch]
        push eax
        call sub_ADBEC
        add esp, byte 4
.57:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        ret 4
unk_144BD:
        db 09Eh,00h,086h,00h,071h,00h
unk_144C3:
        db 0AEh,00h,095h,00h,07Bh,00h
unk_144C9:
        db 070h,0FDh,00h,00h,0Ah,0D7h,00h,00h,0C2h,0B5h,00h,00h
unk_144D5:
        db 04Eh,00h,00h,00h,08h,01h,00h,00h,074h,01h,00h,00h,04Fh,00h,00h,00h
        db 0B0h,01h,00h,00h,048h,01h,00h,00h
unk_144ED:
        db 0Fh,01h,00h,00h,062h,01h,00h,00h,019h,01h,00h,00h,05Bh,01h,00h,00h
        db 089h,01h,00h,00h,05Bh,01h,00h,00h,095h,01h,00h,00h,062h,01h,00h,00h
        db 095h,01h,00h,00h,06Bh,01h,00h,00h,087h,01h,00h,00h,071h,01h,00h,00h
        db 019h,01h,00h,00h,071h,01h,00h,00h,0Fh,01h,00h,00h,06Ah,01h,00h,00h
        db 011h,01h,00h,00h,099h,01h,00h,00h,01Ah,01h,00h,00h,091h,01h,00h,00h
        db 08Ch,01h,00h,00h,091h,01h,00h,00h,097h,01h,00h,00h,098h,01h,00h,00h
        db 097h,01h,00h,00h,0A1h,01h,00h,00h,08Dh,01h,00h,00h,0A7h,01h,00h,00h
        db 019h,01h,00h,00h,0A7h,01h,00h,00h,010h,01h,00h,00h,0A1h,01h,00h,00h
