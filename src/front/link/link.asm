; Modem commands (AT) and the serial link protocol: packets, acks and resends, the link timer (96 PC).
bits 32
%include "hockey.inc"
section s_17675 progbits alloc exec nowrite align=1
extern LinkRxPayload
extern addtimer, str_Punct2, str_Punct_LinkTimerTick, LinkRxRing
extern LinkResendPkt, LinkAckPkt
extern LinkMissingList, ModemResultCount, ModemLastResult, LinkTickCount, LinkPortHandle, str_Punct_LinkOpen, LinkOpenFlags
extern LinkRetryOn, LinkCarrierCheck, LinkPollOn, LinkIsOpen, LinkWindowSize, LinkAckOn, LinkResendOn, LinkOpenMode
extern LinkErrorCount, LinkSpareHook, LinkMessageHandler, LinkTickHandler, LinkResendHandler, LinkTxSeq, LinkRxDeliverSeq, LinkAckedSeq
extern LinkRxSeq, LinkPacketLen, LinkTxPending, LinkState, LinkCheckPeriod, str_D_LinkCopyBytes, LinkRxHead, LinkRxCount
extern LinkPollState, LinkRxSlots
extern LinkTxSlots, LinkAbortCheck, ModemResultTextTable, ModemResultCodeTable, str_0123456789abcdefghijklmn, str_22
extern str_ATA, str_ATD, str_ATE1, str_ATF1, str_ATH0, str_ATM0, str_ATQ0, str_ATS01
extern str_ATX3, str_ATX4, str_ATZS760S1155, str_ctl06, str_feP, str_newline, str_T, strcat_
extern strcpy_, strlen_, strncmp_, strstr_, RemoveTimerCallback, SerialConfigure, SerialOpen, SerialClose
extern SerialSetBaud, SerialRaiseDtr, SerialDropDtr, SerialCarrier, SerialWrite, SerialTxFree, SerialFlushTx, SerialWaitTxEmpty
extern SerialRead, SerialReadWait, SerialFlushRx, atoi_, LinkCrc16, str_Punct_ModemSendCommand, str_AT, LinkRxMsgs
extern LinkTxTimers, LinkPortName, LinkModemString, LinkRxHeader, LinkRxBuffer, WaitTicks
global ModemInitDefault, ModemInit, ModemHangup, ModemHangup_30, ModemHangup_54, ModemDial, ModemAutoAnswer, ModemWaitConnect
global ModemReadResult, ModemSendCommand, ModemAttention, LinkCopyBytes, LinkRxPut, LinkRxPeek_none, LinkRxCopy, LinkCheckPacket
global LinkParsePacket, LinkFirstMissingRx, LinkRxAckSeq, LinkDefaults, SetLinkAbortCheck, SetLinkSpareHook, SetLinkMessageHandler, SetLinkCheckPeriod
global LinkDeliverMessages_ret, LinkDeliverMessages, LinkStoreRxMessage, LinkCarrierOK, LinkTxRoom, LinkCheckTimeouts, LinkTimerTick, LinkClearTxSlot
global LinkClearRxSlot, LinkOpen, LinkConnect, LinkClose, LinkClose_53, LinkBuildDataPacket, LinkSetChecksum, LinkRequestResend
global LinkSendAck, LinkSendMessage, LinkResendSlot, LinkResendSlot_60, LinkAckThrough, LinkReceive, LinkPoll, LinkRequestMissing
;-----------------------------------------------------------------------------
; ModemInitDefault                             17675  96 PC, medium confidence
; Was a wrong FLIRT match: ModemInit(port, "ATZS7=60S11=55"); no caller (dead
; code)
;-----------------------------------------------------------------------------
ModemInitDefault:
        push ebp
        mov ebp, esp
        push str_ATZS760S1155
        push dword [byte ebp+08h]
        call ModemInit
        add esp, byte 8
        pop ebp
        ret
;-----------------------------------------------------------------------------
; ModemInit                                                       1768A  96 PC
; (port, init string): ModemAttention, then ATE1, ATQ0, ATX4, ATF1 and the
; user's init string, split at '~' (one second pause per '~'), each answered
; OK; 4 when the modem does not answer
;-----------------------------------------------------------------------------
ModemInit:
        push esi
        push edi
        enter 40h, 0
        mov edi, dword [byte ebp+010h]
        mov eax, edi
        mov dword [byte ebp-04h], 0
        call ModemAttention
        test eax, eax
        jne short .2
.1:
        mov eax, 4
        leave
        pop edi
        pop esi
        ret
.2:
        mov edx, str_ATE1
        mov eax, edi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .1
        push dword 96h
        push edi
        call ModemReadResult
        mov edx, str_ATQ0
        add esp, byte 8
        mov eax, edi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .1
        push dword 96h
        push edi
        call ModemReadResult
        mov edx, str_ATX4
        add esp, byte 8
        mov eax, edi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .1
        push dword 96h
        push edi
        call ModemReadResult
        mov edx, str_ATF1
        add esp, byte 8
        mov eax, edi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .1
        push dword 96h
        push edi
        mov esi, dword [byte ebp+014h]
        call ModemReadResult
        add esp, byte 8
.3:
        cmp byte [esi], 0
        je short .7
        lea eax, [byte ebp-040h]
.4:
        cmp byte [esi], 0
        je short .5
        movzx edx, byte [esi]
        cmp edx, byte 7Eh
        je short .5
        mov dl, byte [esi]
        inc esi
        mov byte [eax], dl
        inc eax
        jmp short .4
.5:
        lea edx, [byte ebp-040h]
        mov byte [eax], 0
        cmp eax, edx
        jbe short .6
        mov eax, edi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je near .1
        push dword 96h
        push edi
        call ModemReadResult
        add esp, byte 8
        cmp dword [byte ebp-04h], byte 0
        jne short .6
        mov dword [byte ebp-04h], eax
.6:
        movzx eax, byte [esi]
        cmp eax, byte 7Eh
        jne short .3
        push byte 64h
        call WaitTicks
        inc esi
        add esp, byte 4
        jmp short .3
.7:
        mov eax, dword [byte ebp-04h]
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; ModemHangup                                                     1779C  96 PC
; (port): ModemAttention, then ATH0 and its answer; 4 when the modem does not
; answer
;-----------------------------------------------------------------------------
ModemHangup:
        push ebp
        mov ebp, esp
        mov ecx, dword [byte ebp+08h]
        mov eax, ecx
        call ModemAttention
        test eax, eax
        jne short .2
.1:
        mov eax, 4
        pop ebp
        ret
.2:
        mov edx, str_ATH0
        mov eax, ecx
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .1
        push dword 96h
        push ecx
ModemHangup_30:
        call ModemReadResult
        add esp, byte 8
        pop ebp
        ret
        enter 50h, 0
        push dword [byte ebp+08h]
        call ModemHangup
        mov edx, dword [byte ebp+0Ch]
        mov eax, dword [str_ATD]
        add esp, byte 4
        mov dword [byte ebp-050h], eax
ModemHangup_54:
        lea eax, [byte ebp-050h]
        mov ebx, 1
        call strcat_
        lea edx, [byte ebp-050h]
        mov eax, dword [byte ebp+08h]
        call ModemSendCommand
        leave
        ret
;-----------------------------------------------------------------------------
; ModemDial                                                       1780A  96 PC
; (port, number, prefix, tone): hangs up, then sends ATD + prefix + T (tone)
; or P (pulse) + number
;-----------------------------------------------------------------------------
ModemDial:
        enter 50h, 0
        push dword [byte ebp+08h]
        call ModemHangup
        add esp, byte 4
        mov edx, dword [byte ebp+010h]
        lea eax, [byte ebp-050h]
        call strcpy_
        cmp dword [byte ebp+014h], byte 0
        je short .1
        mov edx, str_T
        jmp short .2
.1:
        mov edx, str_feP
.2:
        lea eax, [byte ebp-050h]
        call strcat_
        mov edx, dword [byte ebp+0Ch]
        jmp short ModemHangup_54
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+0Ch]
        push esi
        call ModemHangup
        mov ebx, 1
        add esp, byte 4
        mov edx, str_ATX3
        mov eax, esi
        call ModemSendCommand
        test eax, eax
        je short .3
        push dword 96h
        push esi
        call ModemReadResult
        mov edx, str_ATD
        add esp, byte 8
        mov eax, esi
        xor ebx, ebx
        call ModemSendCommand
.3:
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; ModemAutoAnswer                                                 17887  96 PC
; (port): hangs up, then ATS0=1 (answer on the first ring)
;-----------------------------------------------------------------------------
ModemAutoAnswer:
        push ebp
        mov ebp, esp
        push dword [byte ebp+08h]
        call ModemHangup
        mov ebx, 1
        add esp, byte 4
        mov edx, str_ATS01
        mov eax, dword [byte ebp+08h]
        call ModemSendCommand
        pop ebp
        ret
        push ebp
        mov ebp, esp
        push str_ATA
        push byte 4
        push dword [byte ebp+08h]
        call SerialWrite
        add esp, byte 0Ch
        pop ebp
        ret
;-----------------------------------------------------------------------------
; ModemWaitConnect                                                178C0  96 PC
; (port): reads one modem result: 0 for none / NO CARRIER-type results, 4 for
; an error, else the result code (1 / 5 / 10+ = CONNECT at some speed)
;-----------------------------------------------------------------------------
ModemWaitConnect:
        push ebp
        mov ebp, esp
        push byte 19h
        push dword [byte ebp+08h]
        call ModemReadResult
        add esp, byte 8
        mov edx, eax
        test eax, eax
        je short .1
        cmp eax, byte 2
        je short .1
        cmp eax, byte 0FFFFFFFFh
        jne short .2
.1:
        xor eax, eax
        pop ebp
        ret
.2:
        cmp eax, byte 1
        je short .3
        cmp eax, byte 5
        je short .3
        cmp eax, byte 0Ah
        setl al
        movzx eax, al
        test eax, eax
        je short .3
        mov eax, 4
        pop ebp
        ret
.3:
        mov eax, edx
        pop ebp
        ret
;-----------------------------------------------------------------------------
; ModemReadResult                                                 17906  96 PC
; (port, timeout): reads a line from the modem (at most 41 characters) and
; matches it against the result string table ModemResultTextTable; returns its code, -1
; for none
;-----------------------------------------------------------------------------
ModemReadResult:
        push esi
        push edi
        enter 40h, 0
        lea eax, [byte ebp-040h]
        xor edi, edi
        dec eax
        xor esi, esi
        mov dword [byte ebp-08h], eax
.1:
        cmp esi, byte 29h
        jge near .11
        lea eax, [byte ebp-040h]
        push dword [byte ebp+014h]
        add eax, esi
        push eax
        push byte 1
        push dword [byte ebp+010h]
        call SerialWaitTxEmpty
        add esp, byte 10h
        test eax, eax
        je near .11
        inc dword [byte ebp-08h]
        movzx eax, byte [byte esi+ebp-040h]
        inc esi
        cmp eax, byte 20h
        jge short .2
        mov byte [byte esi+ebp-041h], 5Fh
.2:
        movzx eax, byte [byte esi+ebp-041h]
        cmp eax, byte 30h
        jl short .3
        cmp eax, byte 39h
        jg short .3
        mov eax, 1
        jmp short .4
.3:
        xor eax, eax
.4:
        mov dword [byte ebp-010h], eax
        test edi, edi
        jne short .5
        test eax, eax
        je short .5
        mov edi, dword [byte ebp-08h]
.5:
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-04h], 0
        mov byte [byte esi+ebp-040h], 0
.6:
        mov ebx, dword [ModemResultCount]
        dec ebx
        imul ecx, ebx, byte 0Ch
        add ecx, dword [byte ebp-04h]
        jmp short .9
.7:
        imul eax, ebx, byte 0Ch
        mov edx, dword [dword ecx+ModemResultTextTable]
        mov dword [byte ebp-0Ch], eax
        lea eax, [byte ebp-040h]
        call strstr_
        test eax, eax
        je short .8
        cmp dword [byte ebp-014h], byte 0
        setg al
        movzx eax, al
        or dword [ModemLastResult], eax
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [dword eax+ModemResultCodeTable]
        call atoi_
        mov edi, eax
        jmp short .12
.8:
        sub ecx, byte 0Ch
        dec ebx
.9:
        test ebx, ebx
        jge short .7
        add dword [byte ebp-04h], byte 4
        inc dword [byte ebp-014h]
        cmp dword [byte ebp-04h], byte 8
        jl short .6
        test edi, edi
        je near .1
        cmp dword [byte ebp-010h], byte 0
        jne near .1
        cmp dword [ModemLastResult], byte 0
        je near .1
        mov eax, edi
        call atoi_
        mov edi, eax
        cmp eax, byte 0Ah
        jl short .10
        mov edi, 1
        jmp short .12
.10:
        test eax, eax
        jge short .12
        mov edi, 0FFFFFFFFh
        jmp short .12
.11:
        mov edi, 0FFFFFFFFh
.12:
        mov eax, edi
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; ModemSendCommand                                                17A32  96 PC
; (port, command, flush): sends command + CR (at most 79 characters) and
; checks the modem echoes it; 1 when it does
;-----------------------------------------------------------------------------
ModemSendCommand:
        push ecx
        push esi
        push edi
        enter 54h, 0
        mov esi, eax
        mov edi, edx
        mov eax, edx
        call strlen_
        mov dword [byte ebp-04h], eax
        cmp eax, byte 4Fh
        jle short .1
        xor eax, eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
.1:
        test ebx, ebx
        je short .2
        push esi
        call SerialRaiseDtr
        add esp, byte 4
        push esi
        call SerialFlushTx
        add esp, byte 4
.2:
        push byte 14h
        lea eax, [byte ebp-054h]
        push eax
        push byte 1
        push esi
        call SerialWaitTxEmpty
        add esp, byte 10h
        test eax, eax
        jne short .2
        push edi
        push dword [byte ebp-04h]
        push esi
        call SerialWrite
        add esp, byte 0Ch
        push str_Punct_ModemSendCommand
        push byte 1
        push esi
        call SerialWrite
        add esp, byte 0Ch
        push byte 19h
        lea eax, [byte ebp-054h]
        push eax
        push dword [byte ebp-04h]
        push esi
        call SerialWaitTxEmpty
        mov ebx, dword [byte ebp-04h]
        add esp, byte 10h
        lea edx, [byte ebp-054h]
        mov eax, edi
        call strncmp_
        test eax, eax
        sete al
        movzx eax, al
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ModemAttention                                                  17AC7  96 PC
; (port): flushes, waits, sends "+++" (escape to command mode), waits, sends
; AT and reads the answer; 1 when the modem answers
;-----------------------------------------------------------------------------
ModemAttention:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        mov edi, 1
.1:
        dec edi
        cmp edi, byte 0FFFFFFFFh
        je near .3
        push esi
        call SerialFlushTx
        add esp, byte 4
        push esi
        call SerialRaiseDtr
        add esp, byte 4
        push byte 69h
        call WaitTicks
        add esp, byte 4
        push str_Punct2
        push byte 3
        push esi
        call SerialWrite
        add esp, byte 0Ch
        push byte 69h
        call WaitTicks
        mov edx, str_AT
        add esp, byte 4
        mov eax, esi
        xor ebx, ebx
        call ModemSendCommand
        test eax, eax
        je short .2
        push byte 19h
        push esi
        call ModemReadResult
        add esp, byte 8
        test eax, eax
        jne short .2
        mov eax, 1
        jmp short .4
.2:
        test edi, edi
        je short .1
        push byte 64h
        call WaitTicks
        add esp, byte 4
        jmp short .1
.3:
        xor eax, eax
.4:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        push ebp
        mov ebp, esp
        mov edx, str_ATM0
        mov eax, dword [byte ebp+08h]
        xor ebx, ebx
        call ModemSendCommand
        push dword 96h
        push dword [byte ebp+08h]
        jmp near ModemHangup_30
;-----------------------------------------------------------------------------
; LinkCopyBytes                                                   17B72  96 PC
; (dest, src, count): byte copy
;-----------------------------------------------------------------------------
LinkCopyBytes:
        push ecx
        push esi
        mov esi, ebx
        xor ebx, ebx
        jmp short .2
.1:
        inc ebx
        mov cl, byte [edx]
        inc edx
        mov byte [eax], cl
        inc eax
.2:
        cmp ebx, esi
        jl short .1
        pop esi
        pop ecx
        ret
        mov dword [str_22], ebx
        mov dword [str_D_LinkCopyBytes], eax
        mov dword [str_newline], edx
        ret
;-----------------------------------------------------------------------------
; LinkRxPut                                                       17B9A  96 PC
; (bytes, count): appends received bytes to the receive ring (10Ch bytes,
; LinkRxRing, head LinkRxHead, length LinkRxCount)
;-----------------------------------------------------------------------------
LinkRxPut:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov esi, edx
        mov eax, dword [LinkRxHead]
        xor edx, edx
        add eax, dword [LinkRxCount]
        jmp short .3
.1:
        cmp eax, 10Ch
        jb short .2
        sub eax, 10Ch
.2:
        inc eax
        inc edx
        mov cl, byte [ebx]
        inc dword [LinkRxCount]
        inc ebx
        mov byte [dword eax+LinkRxRing-1], cl
.3:
        cmp edx, esi
        jl short .1
        pop esi
        pop ecx
        pop ebx
        ret
        cmp eax, dword [LinkRxCount]
        jge short LinkRxPeek_none
        add eax, dword [LinkRxHead]
        cmp eax, 10Ch
        jb short .4
        sub eax, 10Ch
.4:
        movzx eax, byte [dword eax+LinkRxRing]
        and eax, 0FFh
        ret
;-----------------------------------------------------------------------------
; LinkRxPeek_none                                                 17BFC  96 PC
;-----------------------------------------------------------------------------
LinkRxPeek_none:
        mov eax, 0FFFFFFFFh
        ret
;-----------------------------------------------------------------------------
; LinkRxCopy                                                      17C02  96 PC
; (offset, count, dest): copies count bytes from the receive ring at offset;
; 0 when not all have arrived
;-----------------------------------------------------------------------------
LinkRxCopy:
        push ecx
        push esi
        mov ecx, eax
        mov esi, edx
        mov eax, dword [LinkRxHead]
        add eax, ecx
        add ecx, edx
        cmp ecx, dword [LinkRxCount]
        jle short .1
        xor eax, eax
        pop esi
        pop ecx
        ret
.1:
        xor edx, edx
        jmp short .4
.2:
        cmp eax, 10Ch
        jb short .3
        sub eax, 10Ch
.3:
        mov cl, byte [dword eax+LinkRxRing]
        inc eax
        inc edx
        mov byte [ebx], cl
        inc ebx
.4:
        cmp edx, esi
        jl short .2
        mov eax, 1
        pop esi
        pop ecx
        ret
        add dword [LinkRxHead], eax
        sub dword [LinkRxCount], eax
        cmp dword [LinkRxHead], 10Ch
        jb short .5
        sub dword [LinkRxHead], 10Ch
.5:
        ret
;-----------------------------------------------------------------------------
; LinkCheckPacket                                                 17C68  96 PC
; Checks a received packet's sequence fields and its checksum (bytes 4-5,
; LinkCrc16 over the packet); 1 when good
;-----------------------------------------------------------------------------
LinkCheckPacket:
        push ebx
        push ecx
        push esi
        movzx ebx, byte [byte eax+02h]
        cmp ebx, byte 40h
        jl short .1
        movzx ecx, byte [byte eax+01h]
        cmp ecx, byte 43h
        jne short .3
        cmp ebx, 0FFh
        jne short .3
.1:
        movzx ebx, byte [byte eax+03h]
        cmp ebx, 0FFh
        je short .2
        cmp ebx, byte 40h
        jge short .3
.2:
        push edx
        movzx ebx, byte [byte eax+05h]
        movzx esi, byte [byte eax+04h]
        shl ebx, 8
        mov byte [byte eax+04h], 0
        push eax
        mov byte [byte eax+05h], 0
        or esi, ebx
        call LinkCrc16
        add esp, byte 8
        cmp esi, eax
        jne short .3
        mov eax, 1
        pop esi
        pop ecx
        pop ebx
        ret
.3:
        xor eax, eax
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkParsePacket                              17CC8  96 PC, medium confidence
; Parses the packet at the head of the receive ring: sync byte 0BDh, then 'd'
; (64h, 12-byte data packet) or 'C' (43h, 6-byte control packet: ack / resend
; request); the result goes to LinkPacketLen (0 good, 4 bad); returns the
; bytes used
;-----------------------------------------------------------------------------
LinkParsePacket:
        push ebx
        push ecx
        push edx
        enter 8, 0
        mov ecx, eax
        mov dword [LinkPacketLen], 5
        cmp dword [LinkRxCount], byte 0
        jle short .2
        mov eax, dword [LinkRxHead]
        cmp eax, 10Ch
        jb short .1
        sub eax, 10Ch
.1:
        movzx eax, byte [dword eax+LinkRxRing]
        and eax, 0FFh
        jmp short .3
.2:
        mov eax, 0FFFFFFFFh
.3:
        mov dword [byte ebp-04h], eax
        cmp eax, 0BDh
        jne near .16
        cmp dword [LinkRxCount], byte 1
        jle short .5
        mov eax, dword [LinkRxHead]
        inc eax
        cmp eax, 10Ch
        jb short .4
        sub eax, 10Ch
.4:
        movzx eax, byte [dword eax+LinkRxRing]
        and eax, 0FFh
        jmp short .6
.5:
        mov eax, 0FFFFFFFFh
.6:
        mov dword [byte ebp-08h], eax
        lea ebx, [byte ecx+02h]
        cmp eax, byte 64h
        jne short .10
        mov edx, 0Ah
        mov eax, 2
        call LinkRxCopy
        test eax, eax
        je short .9
        mov al, byte [byte ebp-04h]
        mov byte [ecx], al
        mov al, byte [byte ebp-08h]
        mov edx, 0Ch
        mov byte [byte ecx+01h], al
        mov eax, ecx
        call LinkCheckPacket
        test eax, eax
        je short .7
        mov dword [LinkPacketLen], 0
        movzx eax, byte [byte ecx+03h]
        call LinkAckThrough
        mov eax, 0Ch
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.7:
        mov dword [LinkPacketLen], 4
.8:
        mov eax, 2
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.9:
        mov dword [LinkPacketLen], eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.10:
        cmp eax, byte 43h
        jne near .14
        mov edx, 4
        mov eax, 2
        call LinkRxCopy
        test eax, eax
        je short .9
        mov al, byte [byte ebp-04h]
        mov byte [ecx], al
        mov al, byte [byte ebp-08h]
        mov edx, 6
        mov byte [byte ecx+01h], al
        mov eax, ecx
        call LinkCheckPacket
        test eax, eax
        je short .13
        movzx eax, byte [byte ecx+03h]
        call LinkAckThrough
        movzx eax, byte [byte ecx+02h]
        cmp eax, 0FFh
        je short .12
        cmp dword [LinkResendHandler], byte 0
        je short .11
        mov eax, 72h
        call dword [LinkResendHandler]
.11:
        movzx eax, byte [byte ecx+02h]
        call LinkResendSlot
.12:
        mov dword [LinkPacketLen], 0FFFFFFFFh
        mov eax, 6
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.13:
        mov dword [LinkPacketLen], 2
        jmp near .8
.14:
        cmp eax, byte 0FFFFFFFFh
        jne short .15
        mov dword [LinkPacketLen], 0
        xor eax, eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.15:
        mov dword [LinkPacketLen], 3
        cmp eax, 0BDh
        setne al
        movzx eax, al
        inc eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.16:
        cmp eax, byte 0FFFFFFFFh
        setne al
        movzx eax, al
        mov dword [LinkPacketLen], eax
        mov eax, dword [LinkPacketLen]
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkFirstMissingRx                           17E8C  96 PC, medium confidence
; The first receive slot after the last acknowledged one that has not arrived
; (state != 1); -1 when none
;-----------------------------------------------------------------------------
LinkFirstMissingRx:
        push ebx
        push edx
        mov eax, dword [LinkRxSeq]
        inc eax
        mov ebx, dword [LinkRxSeq]
        and ebx, byte 3Fh
        mov eax, dword [LinkRxSeq]
        jmp short .2
.1:
        mov edx, eax
        shl edx, 4
        cmp dword [dword edx+LinkRxSlots], byte 1
        jne short .3
.2:
        inc eax
        and eax, byte 3Fh
        cmp eax, ebx
        jne short .1
        mov eax, 0FFFFFFFFh
.3:
        pop edx
        pop ebx
        ret
        push ebx
        push ecx
        push eax
        push edx
        push dword [LinkPortHandle]
        call SerialRead
        add esp, byte 0Ch
        mov edx, eax
        test eax, eax
        jge short .4
        neg edx
.4:
        mov eax, edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkRxAckSeq                                 17EE1  96 PC, medium confidence
; Advances the acknowledged receive sequence (LinkRxSeq) over the slots
; that have arrived, marking them acknowledged (state 4); returns it (0FFh
; none) for the packet's ack byte
;-----------------------------------------------------------------------------
LinkRxAckSeq:
        push ebx
        push edx
        mov bl, 0FFh
        cmp dword [LinkRxSeq], byte 0FFFFFFFFh
        jne short .1
        xor edx, edx
        jmp short .3
.1:
        mov edx, dword [LinkRxSeq]
.2:
        and edx, byte 3Fh
.3:
        mov eax, edx
        shl eax, 4
        cmp dword [dword eax+LinkRxSlots], byte 1
        je short .4
        cmp dword [dword eax+LinkRxSlots], byte 4
        jne short .5
.4:
        mov eax, edx
        shl eax, 4
        mov bl, dl
        mov dword [dword eax+LinkRxSlots], 4
        movzx eax, dl
        mov dword [LinkRxSeq], eax
        inc edx
        jmp short .2
.5:
        cmp dword [LinkRxSeq], byte 0
        jl short .6
        mov eax, dword [LinkRxSeq]
        shl eax, 4
        mov dword [dword eax+LinkRxSlots], 4
.6:
        mov al, bl
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkDefaults                                                    17F4E  96 PC
; Resets the link settings and state to their defaults (port 0, 9600-type
; speed code 9, modem, answer, timer on, ...) and empties the receive ring
;-----------------------------------------------------------------------------
LinkDefaults:
        mov dword [LinkPortHandle], 0
        mov dword [str_Punct_LinkOpen], 9
        mov dword [LinkOpenFlags], 0
        mov dword [LinkRetryOn], 1
        mov dword [LinkCarrierCheck], 1
        mov dword [LinkPollOn], 1
        mov dword [LinkIsOpen], 0
        mov dword [LinkWindowSize], 4
        mov dword [LinkAckOn], 1
        mov dword [LinkResendOn], 1
        mov dword [LinkErrorCount], 0
        mov dword [LinkAckedSeq], 0FFFFFFFFh
        mov dword [LinkRxSeq], 0FFFFFFFFh
        mov dword [LinkState], 0
        mov dword [LinkCheckPeriod], 0
        mov dword [str_ctl06], 6
        mov dword [LinkTickCount], 0
        mov dword [LinkTxSeq], 0
        mov dword [LinkRxDeliverSeq], 0
        mov dword [LinkTxPending], 0
        mov dword [LinkRxHead], 0
        mov dword [LinkRxCount], 0
        ret
;-----------------------------------------------------------------------------
; SetLinkAbortCheck                                               1802B  96 PC
; Sets the callback (LinkAbortCheck) the connect loop polls to give up (e.g.
; Esc); returns the old one
;-----------------------------------------------------------------------------
SetLinkAbortCheck:
        push edx
        mov edx, eax
        mov eax, dword [LinkAbortCheck]
        mov dword [LinkAbortCheck], edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; SetLinkSpareHook                                1803B  96 PC, low confidence
; Swaps LinkSpareHook, a hook the library never calls; returns the old one
;-----------------------------------------------------------------------------
SetLinkSpareHook:
        push edx
        mov edx, eax
        mov eax, dword [LinkSpareHook]
        mov dword [LinkSpareHook], edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; SetLinkMessageHandler                                           1804B  96 PC
; Sets the callback (LinkMessageHandler) each received message is handed to, in
; order; returns the old one
;-----------------------------------------------------------------------------
SetLinkMessageHandler:
        push edx
        mov edx, eax
        mov eax, dword [LinkMessageHandler]
        mov dword [LinkMessageHandler], edx
        pop edx
        ret
        push edx
        mov edx, eax
        mov eax, dword [LinkTickHandler]
        mov dword [LinkTickHandler], edx
        pop edx
        ret
        push edx
        mov edx, eax
        mov eax, dword [LinkResendHandler]
        mov dword [LinkResendHandler], edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; SetLinkCheckPeriod                           1807B  96 PC, medium confidence
; Sets the countdown (ticks) between carrier checks / the periodic hook
; (LinkCheckPeriod and its reload); returns the old count
;-----------------------------------------------------------------------------
SetLinkCheckPeriod:
        push edx
        mov edx, dword [LinkCheckPeriod]
        mov dword [LinkCheckPeriod], eax
        mov dword [str_ctl06], eax
        mov eax, edx
        pop edx
LinkDeliverMessages_ret:
        ret
;-----------------------------------------------------------------------------
; LinkDeliverMessages                                             18090  96 PC
; Hands the received messages that are next in sequence (64-entry ring of 7
; bytes) to the message handler and frees their slots
;-----------------------------------------------------------------------------
LinkDeliverMessages:
        imul eax, dword [LinkRxDeliverSeq], byte 7
        movzx eax, byte [dword eax+LinkRxMsgs+6]
        cmp eax, byte 1
        jne short LinkDeliverMessages_ret
        cmp dword [LinkMessageHandler], byte 0
        je short .1
        imul eax, dword [LinkRxDeliverSeq], byte 7
        add eax, LinkRxMsgs
        call dword [LinkMessageHandler]
.1:
        imul eax, dword [LinkRxDeliverSeq], byte 7
        mov byte [dword eax+LinkRxMsgs+6], 0
        mov eax, dword [LinkRxDeliverSeq]
        inc eax
        and eax, byte 3Fh
        mov dword [LinkRxDeliverSeq], eax
        jmp short LinkDeliverMessages
;-----------------------------------------------------------------------------
; LinkStoreRxMessage                                              180DC  96 PC
; Stores a data packet's 6-byte payload in its receive slot (by sequence
; byte); 0 when the slot already holds one
;-----------------------------------------------------------------------------
LinkStoreRxMessage:
        push ebx
        push ecx
        push edx
        push esi
        movzx edx, byte [byte eax+02h]
        imul edx, byte 7
        movzx edx, byte [dword edx+LinkRxMsgs+6]
        cmp edx, byte 1
        jne short .1
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov edx, eax
        xor ebx, ebx
.2:
        movzx esi, byte [byte eax+02h]
        imul esi, byte 7
        inc ebx
        mov cl, byte [byte edx+06h]
        inc edx
        mov byte [dword esi+ebx+LinkRxPayload], cl
        cmp ebx, byte 6
        jl short .2
        movzx eax, byte [byte eax+02h]
        imul eax, byte 7
        mov byte [dword eax+LinkRxMsgs+6], 1
        mov eax, 1
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkCarrierOK                                                   1812E  96 PC
; 1 on a direct (null-modem) link, else the modem's carrier detect
; (SerialCarrier)
;-----------------------------------------------------------------------------
LinkCarrierOK:
        push ebx
        push ecx
        push edx
        cmp dword [LinkCarrierCheck], byte 0
        je short .1
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        push eax
        call SerialCarrier
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push eax
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkTxRoom                                                      18165  96 PC
; (count): 1 when the serial transmit buffer has room for count bytes
;-----------------------------------------------------------------------------
LinkTxRoom:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push dword [LinkPortHandle]
        call SerialTxFree
        add esp, byte 4
        cmp eax, esi
        setge al
        movzx eax, al
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkCheckTimeouts                            18186  96 PC, medium confidence
; Timer side of the protocol: resends data packets not acknowledged in time
; (str_22 ticks), asks again for receive slots still missing (str_D_LinkCopyBytes),
; sends an ack when one is due
;-----------------------------------------------------------------------------
LinkCheckTimeouts:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, LinkTxSlots
        xor ecx, ecx
        xor ebx, ebx
        jmp short .3
.1:
        cmp dword [edx], byte 3
        jne short .2
        inc dword [byte edx+04h]
        mov eax, dword [byte edx+04h]
        cmp eax, dword [str_22]
        jle short .2
        mov eax, ebx
        call LinkResendSlot
.2:
        add edx, byte 18h
        inc ebx
.3:
        cmp edx, LinkTxTimers
        jb short .1
        mov ebx, dword [LinkRxSeq]
        inc ebx
        and ebx, byte 3Fh
        mov esi, dword [LinkRxSeq]
        and esi, byte 3Fh
.4:
        cmp ebx, esi
        je short .8
        mov eax, ebx
        shl eax, 4
        add eax, LinkRxSlots
        cmp dword [eax], byte 2
        jne short .5
        inc dword [byte eax+08h]
        mov eax, dword [byte eax+08h]
        cmp eax, dword [str_D_LinkCopyBytes]
        jle short .7
        mov edx, 74h
        mov eax, ebx
        call LinkRequestResend
        jmp short .7
.5:
        cmp dword [eax], byte 1
        jne short .7
        inc dword [byte eax+04h]
        mov edx, dword [byte eax+04h]
        cmp edx, dword [str_newline]
        jg short .6
        test ecx, ecx
        je short .7
.6:
        mov ecx, 1
        mov dword [byte eax+04h], 0
.7:
        inc ebx
        and ebx, byte 3Fh
        jmp short .4
.8:
        test ecx, ecx
        je short .9
        call LinkSendAck
.9:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkTimerTick                                                   18234  96 PC
; The link's timer callback (addtimer): when connected, runs
; LinkCheckTimeouts, LinkReceive and LinkDeliverMessages, and every check
; period the periodic hook and the carrier check (a lost carrier drops the
; link)
;-----------------------------------------------------------------------------
LinkTimerTick:
        push ebx
        push ecx
        push edx
        cmp dword [LinkState], byte 2
        jne near .9
        cmp dword [LinkTickCount], byte 0
        jne near .9
        mov eax, dword [LinkTickCount]
        inc dword [LinkTickCount]
        mov eax, dword [LinkTickCount]
        mov byte [dword eax+str_Punct_LinkTimerTick], 63h
        cmp dword [LinkPollOn], byte 0
        je short .1
        call LinkCheckTimeouts
        call LinkReceive
        call LinkDeliverMessages
.1:
        add dword [LinkCheckPeriod], byte 0FFFFFFFFh
        cmp dword [LinkCheckPeriod], byte 0
        je short .2
        mov eax, dword [LinkTickCount]
        mov byte [dword eax+str_Punct_LinkTimerTick], 0
        jmp short .8
.2:
        cmp dword [LinkPollOn], byte 0
        je short .7
        cmp dword [LinkTickHandler], byte 0
        je short .3
        call dword [LinkTickHandler]
.3:
        mov eax, dword [LinkPortHandle]
        cmp dword [LinkCarrierCheck], byte 0
        je short .4
        mov eax, 1
        jmp short .5
.4:
        push eax
        call SerialCarrier
        add esp, byte 4
.5:
        test eax, eax
        jne short .6
        mov dword [LinkState], eax
.6:
        mov eax, dword [str_ctl06]
        mov edx, dword [LinkCheckPeriod]
        mov dword [LinkCheckPeriod], eax
        mov dword [str_ctl06], eax
.7:
        mov eax, dword [LinkTickCount]
        mov byte [dword eax+str_Punct_LinkTimerTick], 30h
.8:
        mov eax, dword [LinkTickCount]
        dec dword [LinkTickCount]
.9:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkClearTxSlot                                                 1830D  96 PC
; (slot): empties one transmit slot (24-byte entries at LinkTxSlots)
;-----------------------------------------------------------------------------
LinkClearTxSlot:
        imul eax, byte 18h
        mov dword [dword eax+LinkTxSlots], 0
        mov dword [dword eax+LinkTxSlots+4], 0
        mov dword [dword eax+LinkTxSlots+8], 0
        ret
;-----------------------------------------------------------------------------
; LinkClearRxSlot                                                 1832F  96 PC
; (slot): empties one receive slot (LinkRxSlots state and the message ring
; entry)
;-----------------------------------------------------------------------------
LinkClearRxSlot:
        push edx
        mov edx, eax
        imul eax, byte 7
        mov byte [dword eax+LinkRxMsgs+6], 0
        mov eax, edx
        shl eax, 4
        mov dword [dword eax+LinkRxSlots], 0
        mov dword [dword eax+LinkRxSlots+4], 0
        mov dword [dword eax+LinkRxSlots+8], 0
        mov dword [dword eax+LinkRxSlots+0Ch], 0
        pop edx
        ret
        push ebx
        push edx
        xor ebx, ebx
        xor edx, edx
.1:
        mov dword [dword edx+LinkTxSlots], 0
        mov dword [dword edx+LinkTxSlots+4], 0
        mov eax, ebx
        mov dword [dword edx+LinkTxSlots+8], 0
        call LinkClearRxSlot
        inc ebx
        add edx, byte 18h
        cmp ebx, byte 40h
        jl short .1
        pop edx
        pop ebx
        ret
        xor eax, eax
.2:
        add eax, byte 18h
        mov dword [dword eax+LinkTxSlots-18h], 0
        mov dword [dword eax+LinkTxSlots-14h], 0
        mov dword [dword eax+LinkTxSlots-10h], 0
        cmp eax, 600h
        jne short .2
        ret
;-----------------------------------------------------------------------------
; LinkOpen                                                        183CD  96 PC
; (settings): LinkDefaults, copies the settings (port, speed, answer/dial,
; direct, timer, IRQ, tone, init string, number), clears all slots, opens the
; serial port; on a modem link ModemInit (fails -> port closed, 0); starts
; LinkTimerTick; 1 when open
;-----------------------------------------------------------------------------
LinkOpen:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        call LinkDefaults
        mov eax, LinkPortName
        mov edx, ebx
        call strcpy_
        mov eax, dword [byte ebx+028h]
        mov dword [LinkPortHandle], eax
        mov eax, dword [byte ebx+02Ch]
        mov dword [str_Punct_LinkOpen], eax
        mov eax, dword [byte ebx+030h]
        mov dword [LinkOpenFlags], eax
        mov eax, dword [byte ebx+034h]
        mov dword [LinkRetryOn], eax
        mov eax, dword [byte ebx+038h]
        mov dword [LinkCarrierCheck], eax
        mov eax, dword [byte ebx+048h]
        mov dword [LinkOpenMode], eax
        mov eax, dword [byte ebx+03Ch]
        mov dword [LinkPollOn], eax
        mov eax, dword [byte ebx+044h]
        mov dword [LinkIsOpen], eax
        mov eax, dword [byte ebx+058h]
        mov dword [LinkResendOn], eax
        mov eax, dword [byte ebx+050h]
        mov dword [LinkWindowSize], eax
        mov eax, dword [byte ebx+054h]
        lea edx, [byte ebx+060h]
        mov dword [LinkAckOn], eax
        mov eax, LinkTxTimers
        mov dword [LinkErrorCount], 0
        call strcpy_
        mov eax, LinkModemString
        lea edx, [dword ebx+088h]
        call strcpy_
        xor ebx, ebx
.1:
        mov eax, ebx
        call LinkClearTxSlot
        mov eax, ebx
        inc ebx
        call LinkClearRxSlot
        cmp ebx, byte 40h
        jl short .1
        cmp dword [LinkWindowSize], byte 0
        je short .2
        mov eax, 1
        mov cl, byte [LinkWindowSize]
        shl eax, cl
        push eax
        push dword [LinkPortHandle]
        call SerialSetBaud
        add esp, byte 8
.2:
        push dword [LinkPortHandle]
        call SerialOpen
        add esp, byte 4
        push byte 3
        push byte 0
        push byte 0
        push dword [str_Punct_LinkOpen]
        push dword [LinkPortHandle]
        call SerialConfigure
        add esp, byte 14h
        cmp dword [LinkCarrierCheck], byte 0
        jne short .3
        push LinkTxTimers
        push dword [LinkPortHandle]
        call ModemInit
        add esp, byte 8
        cmp eax, byte 4
        jne short .3
        push dword [LinkPortHandle]
        call SerialClose
        add esp, byte 4
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        push dword [LinkPortHandle]
        call SerialFlushRx
        add esp, byte 4
        mov eax, dword [LinkCheckPeriod]
        mov dword [LinkCheckPeriod], 64h
        mov dword [str_ctl06], 64h
        cmp dword [LinkIsOpen], byte 0
        je short .4
        push LinkTimerTick
        call addtimer
        add esp, byte 4
.4:
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkConnect                                                     18540  96 PC
; Direct link: connected at once; modem: ModemAutoAnswer (answer) or
; ModemDial (dial), then waits for the connect result until the abort check
; says stop; 1 when connected
;-----------------------------------------------------------------------------
LinkConnect:
        push ebx
        push ecx
        push edx
        mov dword [LinkState], 0
        cmp dword [LinkCarrierCheck], byte 0
        jne near .8
        cmp dword [LinkRetryOn], byte 0
        je near .4
        push dword [LinkPortHandle]
        call ModemAutoAnswer
        add esp, byte 4
        mov dword [LinkState], 1
.1:
        cmp dword [LinkState], byte 1
        jne near .9
        cmp dword [LinkState], byte 1
        jne short .3
        push dword [LinkPortHandle]
        call ModemWaitConnect
        add esp, byte 4
        test eax, eax
        jle short .2
        mov dword [LinkState], 2
        jmp short .3
.2:
        jge short .3
        mov dword [LinkState], 0
.3:
        mov eax, dword [LinkState]
        cmp dword [LinkAbortCheck], byte 0
        je short .1
        call dword [LinkAbortCheck]
        test eax, eax
        je short .1
        push str_Punct_ModemSendCommand
        push byte 1
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
        mov dword [LinkState], 0
        jmp short .1
.4:
        push dword [LinkAckOn]
        push LinkModemString
        push LinkPortName
        push dword [LinkPortHandle]
        call ModemDial
        add esp, byte 10h
        mov dword [LinkState], 1
.5:
        cmp dword [LinkState], byte 1
        jne near .9
        cmp dword [LinkState], byte 1
        jne short .7
        push dword [LinkPortHandle]
        call ModemWaitConnect
        add esp, byte 4
        test eax, eax
        jle short .6
        mov dword [LinkState], 2
        jmp short .7
.6:
        jge short .7
        mov dword [LinkState], 0
.7:
        mov eax, dword [LinkState]
        cmp dword [LinkAbortCheck], byte 0
        je short .5
        call dword [LinkAbortCheck]
        test eax, eax
        je short .5
        push str_Punct_ModemSendCommand
        push byte 1
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
        mov dword [LinkState], 0
        jmp short .5
.8:
        mov dword [LinkState], 2
.9:
        cmp dword [LinkState], byte 0
        setne al
        movzx eax, al
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        mov dword [LinkState], 0
        cmp dword [LinkCarrierCheck], byte 0
        jne short .10
        push dword [LinkPortHandle]
        call ModemHangup
        add esp, byte 4
.10:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkClose                                                       186DC  96 PC
; Drops the link: ModemHangup on a modem link, closes the serial port,
; removes LinkTimerTick
;-----------------------------------------------------------------------------
LinkClose:
        push ebx
        push ecx
        push edx
        mov dword [LinkState], 0
        cmp dword [LinkCarrierCheck], byte 0
        jne short .1
        push dword [LinkPortHandle]
        call ModemHangup
        add esp, byte 4
.1:
        push dword [LinkPortHandle]
        call SerialDropDtr
        add esp, byte 4
        push dword [LinkPortHandle]
        call SerialClose
        add esp, byte 4
        cmp dword [LinkIsOpen], byte 0
        je short LinkClose_53.2
        push LinkTimerTick
        call RemoveTimerCallback
LinkClose_53:
        add esp, byte 4
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkBuildDataPacket                                             18736  96 PC
; (data, length, seq, packet): 12-byte data packet: 0BDh, 'd', seq, ack
; (LinkRxAckSeq), checksum, 6 bytes of data (zero padded)
;-----------------------------------------------------------------------------
LinkBuildDataPacket:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-04h], ebx
        mov edx, ecx
        xor eax, eax
        jmp short .2
.1:
        mov edi, esi
        inc edx
        inc eax
        mov bl, byte [edi]
        inc esi
        mov byte [byte edx+05h], bl
.2:
        cmp eax, dword [byte ebp-08h]
        jge short .4
        jmp short .1
.3:
        inc edx
        inc eax
        mov byte [byte edx+05h], 0
        jmp short .5
.4:
        lea edx, [eax+ecx]
.5:
        cmp eax, byte 6
        jl short .3
        mov byte [ecx], 0BDh
        mov al, byte [byte ebp-04h]
        mov byte [byte ecx+01h], 64h
        mov edx, 0Ch
        mov byte [byte ecx+02h], al
        call LinkRxAckSeq
        mov byte [byte ecx+03h], al
        mov eax, ecx
        call LinkSetChecksum
        leave
        pop edi
        pop esi
        ret
        mov byte [ebx], 0BDh
        mov byte [byte ebx+01h], al
        mov byte [byte ebx+02h], dl
        call LinkRxAckSeq
        mov edx, 6
        mov byte [byte ebx+03h], al
        mov eax, ebx
;-----------------------------------------------------------------------------
; LinkSetChecksum                                                 187A8  96 PC
; (packet, length): writes the packet checksum (LinkCrc16) into bytes 4-5
;-----------------------------------------------------------------------------
LinkSetChecksum:
        push ebx
        push ecx
        push esi
        mov esi, eax
        push edx
        mov byte [byte eax+04h], 0
        push eax
        mov byte [byte eax+05h], 0
        call LinkCrc16
        mov byte [byte esi+04h], al
        movzx eax, ax
        sar eax, 8
        add esp, byte 8
        mov byte [byte esi+05h], al
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkRequestResend                            187CF  96 PC, medium confidence
; (slot, reason): asks the other side to send receive slot again with a 'C'
; control packet (unless asked recently), marks the slot requested (state 2)
; and calls the resend hook LinkResendHandler
;-----------------------------------------------------------------------------
LinkRequestResend:
        push ebx
        push ecx
        push esi
        enter 4, 0
        mov byte [byte ebp-04h], dl
        and eax, byte 3Fh
        mov esi, eax
        shl eax, 4
        cmp dword [dword eax+LinkRxSlots], byte 2
        jne short .1
        mov edx, dword [str_D_LinkCopyBytes]
        sar edx, 1
        cmp edx, dword [dword eax+LinkRxSlots+8]
        jg near .2
.1:
        mov eax, esi
        shl eax, 4
        cmp dword [dword eax+LinkRxSlots], byte 1
        je near .2
        imul edx, esi, byte 7
        mov dword [dword eax+LinkRxSlots], 2
        mov dword [dword eax+LinkRxSlots+8], 0
        push dword [LinkPortHandle]
        inc dword [dword eax+LinkRxSlots+0Ch]
        mov byte [dword edx+LinkRxMsgs+6], 0
        call SerialTxFree
        add esp, byte 4
        cmp eax, byte 6
        setge al
        movzx eax, al
        test eax, eax
        je short .2
        mov eax, 43h
        mov byte [LinkResendPkt], 0BDh
        mov edx, esi
        mov byte [LinkResendPkt+1], al
        mov byte [LinkResendPkt+2], dl
        call LinkRxAckSeq
        mov edx, 6
        mov byte [LinkResendPkt+3], al
        mov eax, LinkResendPkt
        call LinkSetChecksum
        push LinkResendPkt
        push byte 6
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
        cmp dword [LinkResendHandler], byte 0
        je short .2
        movzx eax, byte [byte ebp-04h]
        call dword [LinkResendHandler]
.2:
        leave
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSendAck                                                     188AE  96 PC
; Sends a 6-byte 'C' control packet with no slot (0FFh) that only carries the
; ack sequence
;-----------------------------------------------------------------------------
LinkSendAck:
        push ebx
        push ecx
        push edx
        push dword [LinkPortHandle]
        call SerialTxFree
        add esp, byte 4
        cmp eax, byte 6
        setge al
        movzx eax, al
        test eax, eax
        je short .1
        mov edx, 43h
        mov eax, 0FFh
        mov byte [LinkAckPkt], 0BDh
        mov byte [LinkAckPkt+1], dl
        mov byte [LinkAckPkt+2], al
        call LinkRxAckSeq
        mov edx, 6
        mov byte [LinkAckPkt+3], al
        mov eax, LinkAckPkt
        call LinkSetChecksum
        push LinkAckPkt
        push byte 6
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkSendMessage                                                 1891A  96 PC
; (data, length): puts a message in the next transmit slot (state 3, waiting
; for its ack) and sends it as a data packet; 0 when the transmit buffer or
; the window (31 slots) is full
;-----------------------------------------------------------------------------
LinkSendMessage:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        push dword [LinkPortHandle]
        call SerialTxFree
        add esp, byte 4
        cmp eax, byte 0Ch
        setge al
        movzx eax, al
        test eax, eax
        je near .3
        mov eax, dword [LinkTxSeq]
        and eax, byte 3Fh
        imul eax, byte 18h
        cmp dword [dword eax+LinkTxSlots], byte 0
        jne short .1
        cmp dword [LinkTxPending], byte 1Fh
        jl short .2
.1:
        xor eax, eax
        jmp short .3
.2:
        mov ebx, dword [LinkTxSeq]
        and ebx, byte 3Fh
        inc dword [LinkTxSeq]
        inc dword [LinkTxPending]
        imul eax, ebx, byte 18h
        mov dword [dword eax+LinkTxSlots], 3
        mov dword [dword eax+LinkTxSlots+4], 0
        mov dword [dword eax+LinkTxSlots+8], 0
        add eax, LinkTxSlots
        lea esi, [byte eax+0Ch]
        mov edx, dword [byte ebp-04h]
        mov ecx, esi
        mov eax, edi
        call LinkBuildDataPacket
        push esi
        push byte 0Ch
        push dword [LinkPortHandle]
        call SerialWrite
        mov eax, 1
        add esp, byte 0Ch
.3:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkResendSlot                                                  189CD  96 PC
; (slot): sends transmit slot again (fresh ack byte and checksum) when it
; still waits for its ack and there is room
;-----------------------------------------------------------------------------
LinkResendSlot:
        push ebx
        push ecx
        push edx
        push esi
        cmp eax, byte 40h
        jge short .1
        imul esi, eax, byte 18h
        cmp dword [dword esi+LinkTxSlots], byte 3
        jne short .1
        mov eax, 0Ch
        call LinkTxRoom
        test eax, eax
        je short .1
        mov ebx, LinkTxSlots
        call LinkRxAckSeq
        add ebx, esi
        mov edx, 0Ch
        add ebx, byte 0Ch
        mov byte [dword esi+LinkTxSlots+0Fh], al
        mov eax, ebx
        call LinkSetChecksum
        push ebx
        push byte 0Ch
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
        mov dword [dword esi+LinkTxSlots+4], 0
.1:
        pop esi
LinkResendSlot_60:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkAckThrough                                                  18A31  96 PC
; (seq): frees the transmit slots up to the acknowledged sequence
;-----------------------------------------------------------------------------
LinkAckThrough:
        push ebx
        push edx
        mov edx, eax
        cmp eax, dword [LinkAckedSeq]
        je short .3
        cmp eax, 0FFh
        je short .3
        mov ebx, dword [LinkAckedSeq]
.1:
        inc ebx
        and ebx, byte 3Fh
        imul eax, ebx, byte 18h
        cmp dword [dword eax+LinkTxSlots], byte 3
        jne short .2
        mov dword [dword eax+LinkTxSlots], 0
        cmp dword [LinkTxPending], byte 0
        je short .2
        add dword [LinkTxPending], byte 0FFFFFFFFh
.2:
        cmp ebx, edx
        jne short .1
        mov dword [LinkAckedSeq], edx
.3:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkReceive                                                     18A81  96 PC
; Reads what the serial port has (up to 256 bytes) into the receive ring,
; parses every complete packet: data packets are stored and acknowledged, bad
; ones ask for a resend, acks free transmit slots
;-----------------------------------------------------------------------------
LinkReceive:
        push ebx
        push ecx
        push edx
        push LinkRxBuffer
        push dword 100h
        push dword [LinkPortHandle]
        call SerialRead
        add esp, byte 0Ch
        mov edx, eax
        test eax, eax
        jge short .1
        neg edx
.1:
        test edx, edx
        jle short LinkResendSlot_60
        mov eax, LinkRxBuffer
        call LinkRxPut
.2:
        mov eax, LinkRxHeader
        call LinkParsePacket
        test eax, eax
        je near LinkResendSlot_60
        add dword [LinkRxHead], eax
        sub dword [LinkRxCount], eax
        cmp dword [LinkRxHead], 10Ch
        jb short .3
        sub dword [LinkRxHead], 10Ch
.3:
        cmp dword [LinkPacketLen], byte 1
        jle short .4
        call LinkFirstMissingRx
        cmp eax, byte 0FFFFFFFFh
        je short .2
        mov edx, 65h
        call LinkRequestResend
        jmp short .2
.4:
        cmp dword [LinkPacketLen], byte 0
        jne short .2
        movzx eax, byte [LinkRxHeader+2]
        shl eax, 4
        cmp dword [dword eax+LinkRxSlots], byte 0
        je short .5
        cmp dword [dword eax+LinkRxSlots], byte 2
        jne short .2
.5:
        mov eax, LinkRxHeader
        call LinkStoreRxMessage
        test eax, eax
        je short .6
        movzx edx, byte [LinkRxHeader+2]
        mov eax, edx
        shl eax, 4
        mov dword [dword eax+LinkRxSlots], 1
        mov dword [dword eax+LinkRxSlots+4], 0
        mov dword [dword eax+LinkRxSlots+8], 0
        mov dword [dword eax+LinkRxSlots+0Ch], 0
        lea eax, [byte edx+01Fh]
        and eax, byte 3Fh
        shl eax, 4
        mov dword [dword eax+LinkRxSlots], 0
.6:
        movzx eax, byte [LinkRxHeader+2]
        call LinkRequestMissing
        jmp near .2
        push ebx
        push ecx
        push edx
        push dword [LinkPortHandle]
        call ModemAutoAnswer
        add esp, byte 4
.7:
        mov dword [LinkState], 1
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push dword [LinkAckOn]
        push LinkModemString
        push LinkPortName
        push dword [LinkPortHandle]
        call ModemDial
        add esp, byte 10h
        jmp short .7
        push ebx
        push ecx
        push edx
        cmp dword [LinkCheckPeriod], byte 0
        jg short .11
        mov eax, dword [str_ctl06]
        mov edx, dword [LinkCheckPeriod]
        mov dword [LinkCheckPeriod], eax
        mov dword [str_ctl06], eax
        cmp dword [LinkTickHandler], byte 0
        je short .8
        call dword [LinkTickHandler]
.8:
        mov eax, dword [LinkPortHandle]
        cmp dword [LinkCarrierCheck], byte 0
        je short .9
        mov eax, 1
        jmp short .10
.9:
        push eax
        call SerialCarrier
        add esp, byte 4
.10:
        test eax, eax
        jne short .11
        mov dword [LinkState], eax
.11:
        pop edx
        pop ecx
        pop ebx
        ret
        cmp dword [LinkCheckPeriod], byte 0
        jg short .13
        cmp dword [LinkCarrierCheck], byte 0
        jne short .12
        cmp dword [LinkState], byte 1
        je short .12
        mov eax, dword [LinkPortHandle]
        call LinkCarrierOK
        test eax, eax
        jne short .12
        mov dword [LinkState], eax
.12:
        mov eax, dword [LinkCheckPeriod]
        mov dword [LinkCheckPeriod], 64h
        mov dword [str_ctl06], 64h
.13:
        ret
;-----------------------------------------------------------------------------
; LinkPoll                                     18C75  96 PC, medium confidence
; Without the timer: every third call LinkReceive, LinkDeliverMessages, and
; when the check period runs out the periodic hook and the carrier check; 1
; while connected
;-----------------------------------------------------------------------------
LinkPoll:
        cmp dword [LinkPollOn], byte 0
        jne short .4
        cmp dword [LinkPollState], byte 0
        jne short .3
        call LinkReceive
        call LinkDeliverMessages
        cmp dword [LinkCheckPeriod], byte 0
        jg short .2
        mov eax, dword [str_ctl06]
        call SetLinkCheckPeriod
        cmp dword [LinkTickHandler], byte 0
        je short .1
        call dword [LinkTickHandler]
.1:
        mov eax, dword [LinkPortHandle]
        call LinkCarrierOK
        test eax, eax
        jne short .2
        mov dword [LinkState], eax
.2:
        mov dword [LinkPollState], 3
        jmp short .4
.3:
        dec dword [LinkPollState]
.4:
        cmp dword [LinkState], byte 0
        setne al
        movzx eax, al
        ret
        push ebx
        push ecx
        push edx
        cmp dword [LinkState], byte 2
        jne short .5
        call LinkPoll
        pop edx
        pop ecx
        pop ebx
        ret
.5:
        cmp dword [LinkCheckPeriod], byte 0
        jg short .7
        cmp dword [LinkCarrierCheck], byte 0
        jne short .6
        cmp dword [LinkState], byte 1
        je short .6
        mov eax, dword [LinkPortHandle]
        call LinkCarrierOK
        test eax, eax
        jne short .6
        mov dword [LinkState], eax
.6:
        mov eax, 64h
        call SetLinkCheckPeriod
.7:
        cmp dword [LinkState], byte 1
        jne short .9
        push dword [LinkPortHandle]
        call ModemWaitConnect
        add esp, byte 4
        test eax, eax
        jle short .8
        mov dword [LinkState], 2
        jmp short .9
.8:
        jge short .9
        mov dword [LinkState], 0
.9:
        mov eax, dword [LinkState]
        test eax, eax
        je short .10
        mov eax, 1
.10:
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        cmp dword [LinkState], byte 1
        jne short .12
        push dword [LinkPortHandle]
        call ModemWaitConnect
        add esp, byte 4
        test eax, eax
        jle short .11
        mov dword [LinkState], 2
        jmp short .12
.11:
        jge short .12
        mov dword [LinkState], 0
.12:
        mov eax, dword [LinkState]
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinkRequestMissing                           18DB7  96 PC, medium confidence
; (upto): asks again for every receive slot from the last acknowledged one up
; to upto that has not arrived or was asked for too long ago
;-----------------------------------------------------------------------------
LinkRequestMissing:
        push ebx
        push ecx
        push edx
        mov ecx, eax
        cmp dword [LinkState], byte 2
        jne short .5
        mov ebx, dword [LinkRxSeq]
        jmp short .4
.1:
        mov eax, ebx
        shl eax, 4
        cmp dword [dword eax+LinkRxSlots], byte 2
        jne short .2
        mov eax, dword [dword eax+LinkRxSlots+8]
        cmp eax, dword [str_D_LinkCopyBytes]
        setg al
        jmp short .3
.2:
        cmp dword [dword eax+LinkRxSlots], byte 0
        sete al
.3:
        movzx eax, al
        test eax, eax
        je short .4
        mov edx, 6Dh
        mov eax, ebx
        call LinkRequestResend
.4:
        inc ebx
        and ebx, byte 3Fh
        cmp ebx, ecx
        jne short .1
.5:
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push eax
        mov dword [LinkPortHandle], eax
        call SerialOpen
        jmp near LinkClose_53
        push ebx
        push ecx
        push edx
        push dword [LinkPortHandle]
        call SerialTxFree
        add esp, byte 4
        cmp eax, byte 25h
        jl short .6
        push str_0123456789abcdefghijklmn
        push byte 25h
        push dword [LinkPortHandle]
        call SerialWrite
        add esp, byte 0Ch
.6:
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push LinkMissingList
        push byte 25h
        push dword [LinkPortHandle]
        call SerialReadWait
        add esp, byte 0Ch
        mov byte [dword eax+LinkMissingList], 0
        pop edx
        pop ecx
        pop ebx
        ret
        mov eax, 1
        ret
