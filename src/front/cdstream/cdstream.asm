; EA CD stream: ring-buffered data streams off the CD (EA library, names from its debug messages).
bits 32
%include "hockey.inc"
section s_1C627 progbits alloc exec nowrite align=1
extern addtimer, StreamBlockSize, StreamTimeout, CdStreamReadTime, CdStreamFilled, CdStreamTicks, StreamSpeed, StreamRate
extern StreamWalk, StreamHandle, FatalError, str_CDSTREAM, str_DelstreamSTREAMNOTFOUND, str_SECCDSTREAM, str_SetstreamspeedSFILEISTOO, str_STREAM
extern str_StreamreaderILLEGALCHUNK, strcmp_, strncpy_, RemoveTimerCallback, AllocMemBlock, FreeMemBlock, CdOpenStream, CdCloseFile
extern CdRead, CdSeek, DriveLetterIndex, IsCdDrive, DetectMscdex, TicksSinceLast, bcopy
global CdStreamInit, CdStreamOpen, CdStreamOpen_2B, CdStreamOpenDefault, setstreamspeed, delstream, CdStreamStart, CdStreamQueue
global CdStreamSeek, CdStreamSyncTime, CdStreamInitSecondary, CdStreamOpenSecondary, CdStreamServiceJumpTable, CdStreamService, CdStreamService_18, CdStreamService_2E
global CdStreamService_3C, CdStreamService_95, CdStreamService_EC, CdStreamService_129, CdStreamService_34E, CdStreamService_456, CdStreamService_5F4, CdStreamService_6BE
global CdStreamService_7C1, CdStreamService_914, CdStreamTimerTick, CdStreamSkipMarks, CdStreamContigData, CdStreamSpaceLeft, CdStreamNextPacket, CdStreamFreePacket
;-----------------------------------------------------------------------------
; CdStreamInit                                 1C627  96 PC, medium confidence
; (stream, buffer size, ...): sets up a CD stream's ring buffer and state and
; starts its timer
;-----------------------------------------------------------------------------
CdStreamInit:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+0Ch]
        mov dword [byte esi+020h], 0
        mov eax, dword [byte ebp+010h]
        mov dword [byte esi+018h], 0
        sub eax, 100h
        mov dword [byte esi+028h], eax
        lea eax, [dword esi+0100h]
        mov dword [esi], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte esi+05Ch], 0
        add eax, esi
        mov dword [byte esi+04h], eax
        mov eax, dword [byte ebp+018h]
        mov dword [byte esi+024h], eax
        mov eax, dword [esi]
        mov dword [byte esi+014h], eax
        mov dword [byte esi+010h], eax
        mov dword [byte esi+08h], eax
        mov dword [byte esi+0Ch], eax
        mov eax, dword [byte ebp+014h]
        mov dword [byte esi+02Ch], eax
        mov dword [StreamWalk], esi
        mov dword [StreamHandle], esi
        mov dword [byte esi+01Ch], 7
        mov edx, dword [StreamBlockSize]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+0EFh], 0
        push CdStreamTimerTick
        mov dword [dword esi+0F3h], eax
        call addtimer
        add esp, byte 4
        mov eax, esi
        pop ebp
        pop esi
        ret
        push ebp
        mov ebp, esp
        push byte 0
.1:
        push dword [byte ebp+010h]
        push dword [byte ebp+0Ch]
        push dword [byte ebp+08h]
        call CdStreamInit
        add esp, byte 10h
        pop ebp
        ret
        push ebp
        mov ebp, esp
        push byte 1
        jmp short .1
;-----------------------------------------------------------------------------
; CdStreamOpen                                 1C6E0  96 PC, medium confidence
; Allocates a CDSTREAM buffer and CdStreamInit
;-----------------------------------------------------------------------------
CdStreamOpen:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+0Ch]
        push dword [byte ebp+014h]
        add esi, 100h
        push esi
        push str_CDSTREAM
        call AllocMemBlock
        add esp, byte 0Ch
        push dword [byte ebp+018h]
        push dword [byte ebp+010h]
        push esi
        push eax
        call CdStreamInit
CdStreamOpen_2B:
        add esp, byte 10h
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdStreamOpenDefault                          1C711  96 PC, medium confidence
; CdStreamOpen with no options
;-----------------------------------------------------------------------------
CdStreamOpenDefault:
        push ebp
        mov ebp, esp
        push byte 0
        push dword [byte ebp+010h]
        push dword [byte ebp+0Ch]
        push dword [byte ebp+08h]
        call CdStreamOpen
        add esp, byte 10h
        pop ebp
        ret
;-----------------------------------------------------------------------------
; setstreamspeed                                                  1C729  96 PC
; EA CD stream: measures the read speed of the stream files for the data
; stream rate; name from its debug message
;-----------------------------------------------------------------------------
setstreamspeed:
        push esi
        push edi
        enter 24h, 0
        mov edx, dword [byte ebp+014h]
        mov eax, dword [byte ebp+010h]
        call strcmp_
        mov esi, eax
        mov dword [byte ebp-08h], eax
        lea eax, [byte ebp-024h]
        push eax
        lea eax, [byte ebp-014h]
        push eax
        lea eax, [byte ebp-01Ch]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [byte ebp+010h]
        call CdOpenStream
        add esp, byte 14h
        test esi, esi
        je short .1
        lea eax, [byte ebp-024h]
        push eax
        lea eax, [byte ebp-018h]
        push eax
        lea eax, [byte ebp-020h]
        push eax
        lea eax, [byte ebp-010h]
        push eax
        push dword [byte ebp+014h]
        call CdOpenStream
        add esp, byte 14h
        jmp short .2
.1:
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-010h], eax
        mov eax, dword [byte ebp-01Ch]
        mov dword [byte ebp-020h], eax
        mov eax, dword [byte ebp-014h]
        mov dword [byte ebp-018h], eax
.2:
        mov eax, dword [byte ebp-014h]
        sub eax, 2000h
        and ax, 0E000h
        mov dword [byte ebp-014h], eax
        cmp eax, 80000h
        jle short .3
        mov dword [byte ebp-014h], 80000h
.3:
        cmp dword [byte ebp-014h], 4E20h
        jge short .4
        push dword 4E20h
        push dword [byte ebp-014h]
        push dword [byte ebp+010h]
        push str_SetstreamspeedSFILEISTOO
        call FatalError
        add esp, byte 10h
.4:
        push byte 0
        push dword 2000h
        push str_STREAM
        call AllocMemBlock
        add esp, byte 0Ch
        push dword 2000h
        push eax
        push dword [byte ebp-0Ch]
        mov edi, eax
        call CdRead
        add esp, byte 0Ch
        call TicksSinceLast
        mov esi, dword [byte ebp-014h]
.5:
        test esi, esi
        jle short .6
        push dword 2000h
        push edi
        push dword [byte ebp-0Ch]
        sub esi, 2000h
        call CdRead
        add esp, byte 0Ch
        jmp short .5
.6:
        call TicksSinceLast
        push byte 1
        push edi
        push dword [byte ebp-010h]
        mov dword [byte ebp-04h], eax
        call CdRead
        add esp, byte 0Ch
        call TicksSinceLast
        push dword [byte ebp-0Ch]
        mov esi, eax
        call CdCloseFile
        add esp, byte 4
        cmp dword [byte ebp-08h], byte 0
        je short .7
        push dword [byte ebp-010h]
        call CdCloseFile
        add esp, byte 4
.7:
        push edi
        call FreeMemBlock
        imul ebx, dword [byte ebp-04h], byte 0Ah
        shl ebx, 10h
        mov eax, ebx
        cdq
        idiv dword [byte ebp-014h]
        mov edi, dword [byte ebp-014h]
        sar edi, 2
        mov dword [StreamSpeed], eax
        mov eax, ebx
        add edi, dword [byte ebp-014h]
        cdq
        idiv edi
        add esp, byte 4
        mov dword [StreamBlockSize], eax
        cmp dword [StreamSpeed], byte 0
        jg short .8
        mov dword [StreamSpeed], 1
.8:
        cmp dword [StreamBlockSize], 0DAh
        jle short .9
        mov dword [StreamBlockSize], 0DAh
.9:
        cmp dword [StreamBlockSize], byte 0
        jg short .10
        mov dword [StreamBlockSize], 1
.10:
        push dword [byte ebp+010h]
        call DriveLetterIndex
        add esp, byte 4
        push eax
        call IsCdDrive
        add esp, byte 4
        test eax, eax
        je short .11
        call DetectMscdex
        test eax, eax
        jne short .11
        mov dword [StreamBlockSize], 1
.11:
        imul eax, esi, byte 0Ah
        mov dword [StreamTimeout], eax
        cmp dword [StreamSpeed], byte 0
        je short .12
        mov eax, 3E80000h
        mov ebx, dword [StreamSpeed]
        cdq
        idiv ebx
        mov dword [StreamRate], eax
.12:
        mov eax, dword [StreamRate]
        leave
        pop edi
        pop esi
        ret
        mov dword [StreamBlockSize], 0DAh
        mov dword [StreamTimeout], 12Ch
        ret
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+0Ch]
        cmp esi, dword [StreamHandle]
        jne short .13
        push CdStreamTimerTick
        call RemoveTimerCallback
        add esp, byte 4
        cmp dword [byte esi+018h], byte 0
        je short .13
        push dword [byte esi+018h]
        call CdCloseFile
        add esp, byte 4
.13:
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; delstream                                                       1C957  96 PC
; EA CD stream: removes a stream (stops its timer, closes its file, frees
; it); name from its debug message ("STREAM NOT FOUND")
;-----------------------------------------------------------------------------
delstream:
        push esi
        push edi
        push ebp
        mov ebp, esp
        mov edi, dword [byte ebp+010h]
        cmp edi, dword [StreamHandle]
        jne short .3
        cmp edi, edi
        jne short .1
        push CdStreamTimerTick
        call RemoveTimerCallback
        add esp, byte 4
        cmp dword [byte edi+018h], byte 0
        je short .1
        push dword [byte edi+018h]
        call CdCloseFile
        add esp, byte 4
.1:
        mov esi, edi
.2:
        push edi
        mov esi, dword [byte esi+05Ch]
        call FreeMemBlock
        add esp, byte 4
        mov edi, esi
        test esi, esi
        jne short .2
        pop ebp
        pop edi
        pop esi
        ret
.3:
        mov esi, dword [StreamHandle]
.4:
        cmp dword [byte esi+05Ch], byte 0
        je short .5
        cmp edi, dword [byte esi+05Ch]
        je short .5
        mov esi, dword [byte esi+05Ch]
        jmp short .4
.5:
        cmp edi, dword [byte esi+05Ch]
        je short .6
        push str_DelstreamSTREAMNOTFOUND
        call FatalError
        add esp, byte 4
.6:
        mov eax, dword [byte edi+05Ch]
        push edi
        mov dword [byte esi+05Ch], eax
        call FreeMemBlock
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdStreamStart                                   1C9DC  96 PC, low confidence
; (stream, file): sets the stream's file name and state 1 (open and start
; reading)
;-----------------------------------------------------------------------------
CdStreamStart:
        push ebp
        mov ebp, esp
        mov ecx, dword [byte ebp+08h]
        mov ebx, 8Fh
        mov edx, dword [byte ebp+0Ch]
        lea eax, [byte ecx+060h]
        call strncpy_
        mov byte [dword ecx+0EEh], 0
        mov dword [byte ecx+01Ch], 1
        pop ebp
        ret
;-----------------------------------------------------------------------------
; CdStreamQueue                                   1CA02  96 PC, low confidence
; (stream, file): sets the stream's file name and state 0Dh (open the next
; file)
;-----------------------------------------------------------------------------
CdStreamQueue:
        push ebp
        mov ebp, esp
        mov ecx, dword [byte ebp+08h]
        mov ebx, 8Fh
        mov edx, dword [byte ebp+0Ch]
        lea eax, [byte ecx+060h]
        call strncpy_
        mov byte [dword ecx+0EEh], 0
        mov dword [byte ecx+01Ch], 0Dh
        pop ebp
        ret
;-----------------------------------------------------------------------------
; CdStreamSeek                                    1CA28  96 PC, low confidence
; (stream, offset): state 2, read position = file start + offset
;-----------------------------------------------------------------------------
CdStreamSeek:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov edx, dword [byte eax+03Ch]
        mov dword [byte eax+01Ch], 2
.1:
        add edx, dword [byte ebp+0Ch]
        mov dword [byte eax+04Ch], edx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov edx, dword [byte eax+03Ch]
        mov dword [byte eax+01Ch], 0Bh
        jmp short .1
;-----------------------------------------------------------------------------
; CdStreamSyncTime                                1CA52  96 PC, low confidence
; Stores the current stream's play position (CdSeek) in the stream
;-----------------------------------------------------------------------------
CdStreamSyncTime:
        push ebp
        mov ebp, esp
        mov eax, dword [StreamHandle]
        push dword [byte eax+048h]
        push dword [byte eax+018h]
        call CdSeek
        mov edx, dword [byte ebp+08h]
        mov eax, dword [StreamTimeout]
        add esp, byte 8
        mov dword [dword edx+0EFh], eax
        pop ebp
        ret
;-----------------------------------------------------------------------------
; CdStreamInitSecondary                           1CA78  96 PC, low confidence
; Sets up the secondary CD stream's ring buffer and state
;-----------------------------------------------------------------------------
CdStreamInitSecondary:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [byte eax+020h], 0
        mov dword [byte eax+02Ch], 0
        mov ebx, dword [byte ebp+014h]
        mov dword [byte eax+048h], 0
        sub ebx, 100h
        mov edx, eax
        mov dword [byte eax+028h], ebx
        lea ebx, [dword eax+0100h]
        mov dword [eax], ebx
        mov ebx, dword [byte ebp+014h]
        mov dword [byte eax+040h], 1
        add ebx, eax
        mov dword [byte eax+04h], ebx
        mov ebx, dword [eax]
        mov dword [byte eax+014h], ebx
        mov dword [byte eax+010h], ebx
        mov dword [byte eax+08h], ebx
        mov dword [byte eax+0Ch], ebx
        mov ebx, dword [byte ebp+010h]
        mov dword [byte eax+058h], ebx
        mov ebx, dword [byte ebp+0Ch]
        mov dword [byte eax+054h], ebx
        mov eax, dword [StreamHandle]
.1:
        cmp dword [byte eax+05Ch], byte 0
        je short .2
        mov eax, dword [byte eax+05Ch]
        jmp short .1
.2:
        mov dword [byte eax+05Ch], edx
        mov eax, edx
        mov dword [byte edx+05Ch], 0
        pop ebp
        ret
;-----------------------------------------------------------------------------
; CdStreamOpenSecondary                           1CAF0  96 PC, low confidence
; Allocates a SECCDSTREAM buffer and CdStreamInitSecondary
;-----------------------------------------------------------------------------
CdStreamOpenSecondary:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+014h]
        push dword [byte ebp+018h]
        add esi, 100h
        push esi
        push str_SECCDSTREAM
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword [byte ebp+010h]
        push dword [byte ebp+0Ch]
        push eax
        call CdStreamInitSecondary
        jmp near CdStreamOpen_2B
CdStreamServiceJumpTable:
        dd CdStreamService_3C
        dd CdStreamService_129
        dd CdStreamService_34E
        dd CdStreamService_456
        dd CdStreamService_5F4
        dd CdStreamService_6BE
        dd CdStreamService_2E
        dd CdStreamService_18
        dd CdStreamService_914
        dd CdStreamService_7C1
        dd CdStreamService_EC
        dd CdStreamService_18
        dd CdStreamService_95
;-----------------------------------------------------------------------------
; CdStreamService                              1CB54  96 PC, medium confidence
; The current CD stream's state machine (open, read, refill, wrap, next
; file), driven by its read budget
;-----------------------------------------------------------------------------
CdStreamService:
        push esi
        push edi
        enter 4, 0
        mov eax, dword [StreamHandle]
        cmp dword [dword eax+0EFh], byte 0
        jg near CdStreamService_914.52
CdStreamService_18:
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+01Ch]
        dec edx
        cmp edx, byte 0Ch
        ja short CdStreamService_18
        jmp dword [nosplit cs:edx*4+CdStreamServiceJumpTable]
CdStreamService_2E:
        mov dword [dword eax+0EFh], 0
        leave
        pop edi
        pop esi
        ret
CdStreamService_3C:
        cmp dword [byte eax+018h], byte 0
        je short .1
        push dword [byte eax+018h]
        call CdCloseFile
        add esp, byte 4
.1:
        lea eax, [byte ebp-04h]
        push eax
        mov eax, dword [StreamHandle]
        lea edx, [byte eax+044h]
        push edx
        lea edx, [byte eax+03Ch]
        push edx
        lea edx, [byte eax+018h]
        push edx
        add eax, byte 60h
        push eax
        call CdOpenStream
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+03Ch]
        add edx, dword [byte eax+044h]
        mov dword [byte eax+040h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+03Ch]
        mov dword [byte eax+04Ch], edx
        mov eax, dword [StreamHandle]
        add esp, byte 14h
        mov dword [byte eax+01Ch], 2
        jmp short CdStreamService_18
CdStreamService_95:
        cmp dword [byte eax+018h], byte 0
        je short .2
        push dword [byte eax+018h]
        call CdCloseFile
        add esp, byte 4
.2:
        lea eax, [byte ebp-04h]
        push eax
        mov eax, dword [StreamHandle]
        lea edx, [byte eax+044h]
        push edx
        lea edx, [byte eax+03Ch]
        push edx
        lea edx, [byte eax+018h]
        push edx
        add eax, byte 60h
        push eax
        call CdOpenStream
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+03Ch]
        add edx, dword [byte eax+044h]
        mov dword [byte eax+040h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+03Ch]
        mov dword [byte eax+04Ch], edx
        mov eax, dword [StreamHandle]
        add esp, byte 14h
        mov dword [byte eax+01Ch], 2
CdStreamService_EC:
        mov eax, dword [StreamHandle]
        mov dword [StreamWalk], eax
.3:
        mov eax, dword [StreamWalk]
        mov edx, dword [eax]
        mov dword [byte eax+014h], edx
        mov eax, dword [StreamWalk]
        mov dword [byte eax+010h], edx
        mov eax, dword [StreamWalk]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamWalk]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+05Ch]
        mov dword [StreamWalk], eax
        test eax, eax
        jne short .3
CdStreamService_129:
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+010h]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamHandle]
        mov dword [byte eax+08h], edx
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, dword [StreamHandle]
        cmp eax, dword [byte edx+02Ch]
        jg short .4
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        mov eax, dword [StreamHandle]
        call CdStreamContigData
        cmp edx, eax
        jne near CdStreamService_914.52
        mov eax, dword [StreamHandle]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFFh
        mov eax, dword [StreamHandle]
        mov edx, dword [eax]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamHandle]
        mov dword [byte eax+08h], edx
.4:
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .6
.5:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        jmp short .8
.6:
        jne short .7
        cmp eax, dword [byte edx+010h]
        je short .5
.7:
        mov edx, dword [byte ebx+014h]
        sub edx, dword [byte ebx+08h]
.8:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+02Ch]
        jle near CdStreamService_914.52
        mov dword [byte eax+01Ch], 3
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+0Ch]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+04Ch]
        mov dword [byte eax+048h], edx
        mov eax, dword [StreamHandle]
        push dword [byte eax+048h]
        push dword [byte eax+018h]
        call CdSeek
        mov edx, eax
        mov eax, dword [StreamHandle]
        mov dword [byte eax+050h], edx
        mov eax, dword [StreamHandle]
        mov dword [byte eax+038h], 0
        mov eax, dword [StreamHandle]
        mov edx, dword [StreamTimeout]
        add esp, byte 8
        mov dword [dword eax+0EFh], edx
        leave
        pop edi
        pop esi
        ret
.9:
        xor edx, edx
.10:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+038h]
        jle near CdStreamService_914.52
        push dword [byte eax+038h]
        push dword [eax]
        push dword [byte eax+0Ch]
        call bcopy
        mov eax, dword [StreamHandle]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFFh
        mov eax, dword [StreamHandle]
        mov edx, dword [eax]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamHandle]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+038h]
        add esp, byte 0Ch
        add dword [byte eax+08h], edx
.11:
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .13
.12:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        jmp short .15
.13:
        jne short .14
        cmp eax, dword [byte edx+010h]
        je short .12
.14:
        mov edx, dword [byte ebx+014h]
        sub edx, dword [byte ebx+08h]
.15:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+02Ch]
        jle near CdStreamService_914.52
        cmp dword [dword eax+0EFh], byte 0
        jg near CdStreamService_914.52
        mov esi, dword [byte eax+02Ch]
        sub esi, dword [byte eax+050h]
        mov dword [byte eax+050h], 0
        mov eax, dword [StreamHandle]
        push esi
        mov edi, dword [dword eax+0EFh]
        mov dword [CdStreamTicks], 0
        push dword [byte eax+08h]
        push dword [byte eax+018h]
        call CdRead
        mov eax, dword [CdStreamTicks]
        add dword [CdStreamReadTime], eax
        mov eax, dword [StreamHandle]
        add dword [CdStreamFilled], esi
        mov dword [dword eax+0EFh], edi
        mov ebx, dword [StreamHandle]
        add esp, byte 0Ch
        mov edx, dword [StreamBlockSize]
        mov eax, dword [byte ebx+02Ch]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword ebx+0EFh], eax
        mov eax, dword [StreamHandle]
        add dword [byte eax+08h], esi
        mov eax, dword [StreamHandle]
        add dword [byte eax+048h], esi
        mov eax, dword [StreamHandle]
        add dword [byte eax+038h], esi
CdStreamService_34E:
        mov edx, dword [StreamHandle]
        cmp dword [byte edx+038h], byte 8
        jge short .16
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, dword [StreamHandle]
        cmp eax, dword [byte edx+02Ch]
        jg near CdStreamService_129.11
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        mov eax, dword [StreamHandle]
        call CdStreamContigData
        cmp edx, eax
        jne near CdStreamService_914.52
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        ja near CdStreamService_129.9
        sub eax, dword [edx]
        mov edx, eax
        jmp near CdStreamService_129.10
.16:
        mov eax, dword [byte edx+0Ch]
        mov eax, dword [byte eax+04h]
        mov dword [byte edx+034h], eax
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+034h]
        sub edx, dword [byte eax+038h]
        mov dword [byte eax+030h], edx
        mov eax, dword [StreamHandle]
        mov dword [StreamWalk], eax
.17:
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+05Ch]
        mov dword [StreamWalk], eax
        test eax, eax
        jne short .18
        mov eax, dword [StreamHandle]
        mov dword [StreamWalk], eax
        jmp short .19
.18:
        mov eax, dword [StreamHandle]
        mov ebx, dword [byte eax+0Ch]
        mov eax, dword [StreamWalk]
        mov edx, dword [byte eax+058h]
        and edx, dword [ebx]
        cmp edx, dword [byte eax+054h]
        jne short .17
.19:
        mov eax, dword [StreamHandle]
        cmp dword [byte eax+034h], byte 8
        jl short .20
        mov edx, dword [StreamWalk]
        mov eax, dword [byte eax+034h]
        cmp eax, dword [byte edx+028h]
        jle short CdStreamService_456
.20:
        mov eax, dword [StreamHandle]
        cmp dword [byte eax+024h], byte 0
        jne short .21
        mov dword [byte eax+01Ch], 0Eh
        leave
        pop edi
        pop esi
        ret
.21:
        mov edx, dword [StreamWalk]
        push dword [byte edx+028h]
        push dword [byte eax+034h]
        push str_StreamreaderILLEGALCHUNK
        call FatalError
        add esp, byte 0Ch
CdStreamService_456:
        mov eax, dword [StreamWalk]
        cmp eax, dword [StreamHandle]
        je near CdStreamService_5F4
        mov eax, dword [StreamHandle]
        mov dword [byte eax+01Ch], 4
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov ebx, dword [byte edx+04h]
        mov eax, dword [StreamHandle]
        sub ebx, dword [byte edx+08h]
        mov edx, dword [byte eax+034h]
        add edx, dword [byte eax+02Ch]
        add edx, byte 8
        cmp ebx, edx
        ja short .24
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        mov eax, dword [StreamWalk]
        call CdStreamContigData
        cmp edx, eax
        jne near CdStreamService_914.52
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        ja short .22
        sub eax, dword [edx]
        mov edx, eax
        jmp short .23
.22:
        xor edx, edx
.23:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+038h]
        jle near CdStreamService_914.52
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFFh
        mov eax, dword [StreamWalk]
        mov edx, dword [eax]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamWalk]
        mov dword [byte eax+08h], edx
.24:
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .26
.25:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        jmp short .28
.26:
        jne short .27
        cmp eax, dword [byte edx+010h]
        je short .25
.27:
        mov edx, dword [byte ebx+014h]
        sub edx, dword [byte ebx+08h]
.28:
        mov eax, dword [StreamHandle]
        mov ebx, dword [byte eax+02Ch]
        add ebx, byte 8
        cmp edx, ebx
        jbe near CdStreamService_914.52
        cmp dword [byte eax+030h], byte 0
        jl short .29
        mov edx, dword [StreamWalk]
        push dword [byte eax+038h]
        push dword [byte edx+0Ch]
        push dword [byte eax+0Ch]
        call bcopy
        mov eax, dword [StreamWalk]
        mov edx, dword [StreamHandle]
        mov ebx, dword [byte eax+0Ch]
        add ebx, dword [byte edx+038h]
        mov dword [byte eax+08h], ebx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+0Ch]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamHandle]
        add esp, byte 0Ch
        mov dword [byte eax+038h], 0
        jmp short CdStreamService_5F4
.29:
        mov edx, dword [StreamWalk]
        push dword [byte eax+034h]
        push dword [byte edx+0Ch]
        push dword [byte eax+0Ch]
        call bcopy
        mov eax, dword [StreamWalk]
        mov edx, dword [StreamHandle]
        mov ebx, dword [byte eax+0Ch]
        mov edx, dword [byte edx+034h]
        add edx, ebx
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+030h]
        neg edx
        mov dword [byte eax+038h], edx
        add esp, byte 0Ch
        mov eax, dword [StreamHandle]
        push dword [byte eax+038h]
        mov edx, dword [byte eax+0Ch]
        push dword [byte eax+0Ch]
        add edx, dword [byte eax+034h]
        push edx
        call bcopy
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+034h]
        add esp, byte 0Ch
        sub dword [byte eax+08h], edx
CdStreamService_5F4:
        mov eax, dword [StreamHandle]
        cmp dword [byte eax+030h], byte 0
        jle near CdStreamService_6BE
        mov edx, dword [byte eax+030h]
        add edx, dword [byte eax+02Ch]
        mov eax, dword [StreamWalk]
        add edx, byte 8
        call CdStreamSpaceLeft
        cmp eax, edx
        ja near CdStreamService_6BE
        mov eax, dword [StreamHandle]
        mov dword [byte eax+01Ch], 5
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        mov eax, dword [StreamWalk]
        call CdStreamContigData
        cmp edx, eax
        jne near CdStreamService_914.52
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        ja short .30
        sub eax, dword [edx]
        mov edx, eax
        jmp short .31
.30:
        xor edx, edx
.31:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+038h]
        jle near CdStreamService_914.52
        push dword [byte eax+038h]
        mov eax, dword [StreamWalk]
        push dword [eax]
        push dword [byte eax+0Ch]
        call bcopy
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFFh
        mov eax, dword [StreamWalk]
        mov edx, dword [StreamHandle]
        mov ebx, dword [eax]
        mov edx, dword [byte edx+038h]
        add edx, ebx
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamWalk]
        mov edx, dword [eax]
        add esp, byte 0Ch
        mov dword [byte eax+0Ch], edx
CdStreamService_6BE:
        mov eax, dword [StreamHandle]
        mov dword [byte eax+01Ch], 6
.32:
        mov edx, dword [StreamHandle]
        cmp dword [byte edx+030h], byte 0
        jle near .37
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .34
.33:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        jmp short .36
.34:
        jne short .35
        cmp eax, dword [byte edx+010h]
        je short .33
.35:
        mov edx, dword [byte ebx+014h]
        sub edx, dword [byte ebx+08h]
.36:
        mov eax, dword [StreamHandle]
        cmp edx, dword [byte eax+02Ch]
        jle near CdStreamService_914.52
        cmp dword [dword eax+0EFh], byte 0
        jg near CdStreamService_914.52
        mov esi, dword [byte eax+02Ch]
        sub esi, dword [byte eax+050h]
        mov dword [byte eax+050h], 0
        mov eax, dword [StreamHandle]
        push esi
        mov edx, dword [StreamWalk]
        mov edi, dword [dword eax+0EFh]
        mov dword [CdStreamTicks], 0
        push dword [byte edx+08h]
        push dword [byte eax+018h]
        call CdRead
        mov eax, dword [CdStreamTicks]
        add dword [CdStreamReadTime], eax
        mov eax, dword [StreamHandle]
        add dword [CdStreamFilled], esi
        mov dword [dword eax+0EFh], edi
        mov ebx, dword [StreamHandle]
        add esp, byte 0Ch
        mov edx, dword [StreamBlockSize]
        mov eax, dword [byte ebx+02Ch]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [dword ebx+0EFh], eax
        mov eax, dword [StreamHandle]
        add dword [byte eax+048h], esi
        mov eax, dword [StreamWalk]
        add dword [byte eax+08h], esi
        mov eax, dword [StreamHandle]
        sub dword [byte eax+030h], esi
        jmp near .32
.37:
        mov eax, dword [StreamWalk]
        mov edx, dword [byte edx+034h]
        add dword [byte eax+0Ch], edx
CdStreamService_7C1:
        mov eax, dword [StreamWalk]
        cmp eax, dword [StreamHandle]
        je near .44
        mov eax, dword [StreamHandle]
        mov dword [byte eax+01Ch], 0Ah
        mov edx, dword [StreamHandle]
        cmp dword [byte edx+038h], byte 0
        jne near CdStreamService_914
        mov eax, edx
        call CdStreamSkipMarks
        mov ebx, dword [byte edx+04h]
        mov eax, dword [StreamWalk]
        sub ebx, dword [byte edx+08h]
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte eax+0Ch]
        cmp ebx, edx
        jg near .40
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        mov eax, dword [StreamHandle]
        call CdStreamContigData
        cmp edx, eax
        jne near CdStreamService_914.52
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        ja short .38
        mov ebx, eax
        sub ebx, dword [edx]
        jmp short .39
.38:
        xor ebx, ebx
.39:
        mov eax, dword [StreamWalk]
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte eax+0Ch]
        cmp ebx, edx
        jle near CdStreamService_914.52
        mov eax, dword [StreamHandle]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFFh
        mov eax, dword [StreamHandle]
        mov edx, dword [eax]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [StreamHandle]
        mov dword [byte eax+08h], edx
.40:
        mov edx, dword [StreamHandle]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .41
        mov ebx, dword [byte edx+04h]
        sub ebx, dword [byte edx+08h]
        jmp short .43
.41:
        jne short .42
        cmp eax, dword [byte edx+010h]
        jne short .42
        mov ebx, dword [byte edx+04h]
        sub ebx, eax
        jmp short .43
.42:
        mov eax, dword [byte ebx+014h]
        sub eax, dword [byte ebx+08h]
        mov ebx, eax
.43:
        mov eax, dword [StreamWalk]
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte eax+0Ch]
        cmp ebx, edx
        jle near CdStreamService_914.52
        mov eax, dword [StreamHandle]
        mov dword [byte eax+038h], edx
        mov eax, dword [StreamHandle]
        push dword [byte eax+038h]
        push dword [byte eax+0Ch]
        mov eax, dword [StreamWalk]
        push dword [byte eax+0Ch]
        call bcopy
        mov eax, dword [StreamWalk]
        mov edx, dword [byte eax+0Ch]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+0Ch]
        add edx, dword [byte eax+038h]
        add esp, byte 0Ch
        mov dword [byte eax+08h], edx
        jmp short CdStreamService_914
.44:
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte eax+0Ch]
        mov dword [byte eax+038h], edx
CdStreamService_914:
        mov eax, dword [StreamHandle]
        mov edx, dword [byte eax+048h]
        sub edx, dword [byte eax+038h]
        cmp edx, dword [byte eax+040h]
        jl near .51
        mov dword [byte eax+01Ch], 9
        mov eax, dword [StreamHandle]
        mov dword [StreamWalk], eax
.45:
        mov edx, dword [StreamWalk]
        mov eax, edx
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        mov ebx, edx
        cmp eax, dword [byte edx+08h]
        jae short .47
.46:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        mov edx, eax
        jmp short .49
.47:
        jne short .48
        cmp eax, dword [byte edx+010h]
        je short .46
.48:
        mov edx, dword [byte ebx+014h]
        sub edx, dword [byte ebx+08h]
.49:
        mov eax, dword [StreamWalk]
        add edx, dword [byte eax+038h]
        cmp edx, byte 8
        jbe short .52
        mov eax, dword [byte eax+05Ch]
        mov dword [StreamWalk], eax
        test eax, eax
        jne short .45
        mov eax, dword [StreamHandle]
        mov dword [StreamWalk], eax
.50:
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+0Ch]
        mov dword [eax], 0FFFFFFFDh
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+0Ch]
        mov dword [byte eax+04h], 8
        mov eax, dword [StreamWalk]
        add dword [byte eax+0Ch], byte 8
        mov eax, dword [StreamWalk]
        mov edx, dword [byte eax+0Ch]
        mov dword [byte eax+08h], edx
        mov eax, dword [StreamWalk]
        mov eax, dword [byte eax+05Ch]
        mov dword [StreamWalk], eax
        test eax, eax
        jne short .50
        mov eax, dword [StreamHandle]
        mov dword [byte eax+01Ch], 7
        leave
        pop edi
        pop esi
        ret
.51:
        mov dword [byte eax+01Ch], 3
.52:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdStreamTimerTick                            1D53B  96 PC, medium confidence
; CD stream timer callback: adds to the current stream's read budget
;-----------------------------------------------------------------------------
CdStreamTimerTick:
        mov eax, dword [StreamHandle]
        sub dword [dword eax+0EFh], byte 0Ah
        inc dword [CdStreamTicks]
        ret
;-----------------------------------------------------------------------------
; CdStreamSkipMarks                            1D54E  96 PC, medium confidence
; Moves a stream's read pointer over skip (-2) and wrap (-1) marks in its
; ring buffer
;-----------------------------------------------------------------------------
CdStreamSkipMarks:
        push ebx
        push edx
.1:
        mov edx, dword [byte eax+014h]
        cmp edx, dword [byte eax+010h]
        je short .5
        cmp edx, dword [byte eax+0Ch]
        je short .5
        cmp dword [edx], byte 0FFFFFFFEh
        jne short .3
        mov ebx, dword [byte edx+04h]
        add edx, ebx
.2:
        mov dword [byte eax+014h], edx
        jmp short .1
.3:
        cmp dword [edx], byte 0FFFFFFFFh
        jne short .5
        cmp edx, dword [byte eax+010h]
        jne short .4
        mov edx, dword [eax]
        mov dword [byte eax+010h], edx
.4:
        mov edx, dword [eax]
        jmp short .2
.5:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CdStreamContigData                              1D582  96 PC, low confidence
; Bytes readable in one piece from the stream's ring buffer
;-----------------------------------------------------------------------------
CdStreamContigData:
        push edx
        mov edx, eax
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        jae short .2
.1:
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        pop edx
        ret
.2:
        jne short .3
        cmp eax, dword [byte edx+010h]
        je short .1
.3:
        mov eax, dword [byte edx+014h]
        sub eax, dword [byte edx+08h]
        pop edx
        ret
;-----------------------------------------------------------------------------
; CdStreamSpaceLeft                               1D5A9  96 PC, low confidence
; Room left at the end of the stream's ring buffer
;-----------------------------------------------------------------------------
CdStreamSpaceLeft:
        push edx
        mov edx, eax
        call CdStreamSkipMarks
        mov eax, dword [byte edx+04h]
        sub eax, dword [byte edx+08h]
        pop edx
        ret
        push edx
        mov edx, eax
        call CdStreamSkipMarks
        mov eax, dword [byte edx+014h]
        cmp eax, dword [byte edx+08h]
        ja short .1
        sub eax, dword [edx]
        pop edx
        ret
.1:
        xor eax, eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; CdStreamNextPacket                           1D5D1  96 PC, medium confidence
; Services the stream and returns its next packet (-2 at the end of the
; stream)
;-----------------------------------------------------------------------------
CdStreamNextPacket:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebp+0Ch]
        call CdStreamService
        cmp dword [byte esi+01Ch], byte 2
        je short .4
        cmp dword [byte esi+01Ch], byte 1
        je short .4
        cmp dword [byte esi+01Ch], byte 0Eh
        jne short .1
        mov eax, 0FFFFFFFEh
        pop ebp
        pop esi
        ret
.1:
        mov eax, dword [byte esi+0Ch]
        cmp eax, dword [byte esi+010h]
        je short .4
        mov eax, dword [byte esi+010h]
        cmp dword [eax], byte 0FFFFFFFFh
        jne short .2
        mov eax, dword [esi]
        mov dword [byte esi+010h], eax
        mov eax, dword [byte esi+0Ch]
        cmp eax, dword [byte esi+010h]
        je short .4
.2:
        mov eax, dword [byte esi+010h]
        mov edx, dword [byte eax+04h]
        cmp eax, dword [byte esi+0Ch]
        jbe short .5
        mov ebx, dword [byte esi+04h]
.3:
        sub ebx, eax
        cmp ebx, edx
        jge short .6
.4:
        xor eax, eax
        pop ebp
        pop esi
        ret
.5:
        mov ebx, dword [byte esi+0Ch]
        jmp short .3
.6:
        mov eax, dword [byte esi+010h]
        lea ebx, [eax+edx]
        mov dword [byte esi+010h], ebx
        cmp dword [eax], byte 0FFFFFFFDh
        jne short .9
        cmp eax, dword [byte esi+014h]
        jne short .7
        mov dword [byte esi+014h], ebx
        jmp short .8
.7:
        mov dword [eax], 0FFFFFFFEh
.8:
        mov eax, 0FFFFFFFFh
.9:
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; CdStreamFreePacket                           1D658  96 PC, medium confidence
; Marks a packet as used (-2), so the ring buffer space comes back
;-----------------------------------------------------------------------------
CdStreamFreePacket:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+0Ch]
        mov dword [eax], 0FFFFFFFEh
        pop ebp
        ret
        push ebp
        mov ebp, esp
        mov edx, dword [byte ebp+08h]
        mov eax, dword [byte edx+010h]
        xor ebx, ebx
.1:
        cmp eax, dword [byte edx+0Ch]
        je short .3
        cmp dword [eax], byte 0FFFFFFFFh
        jne short .2
        mov eax, dword [edx]
        jmp short .1
.2:
        mov ecx, dword [byte eax+04h]
        sub ecx, byte 8
        add eax, dword [byte eax+04h]
        add ebx, ecx
        jmp short .1
.3:
        mov eax, ebx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        mov edx, dword [byte ebp+08h]
        mov eax, dword [byte edx+014h]
        xor ebx, ebx
        cmp eax, dword [byte edx+010h]
        jne short .4
        xor eax, eax
        pop ebp
        ret
.4:
        cmp dword [eax], byte 0FFFFFFFFh
        jne short .5
        mov eax, dword [edx]
        jmp short .6
.5:
        mov ecx, dword [byte eax+04h]
        sub ecx, byte 8
        add eax, dword [byte eax+04h]
        add ebx, ecx
.6:
        cmp eax, dword [byte edx+010h]
        jne short .4
        mov eax, ebx
        pop ebp
        ret
