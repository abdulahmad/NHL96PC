; Announcer speech: SPEECHBUF, the speech bank files, the 24-clip speech queue and the play-by-play events PaEvent queues clips for (96 PC).
bits 32
%include "hockey.inc"
section s_67000 progbits alloc exec nowrite align=1
extern _dos_gettime_, AsyncCancelRequest, AsyncClose, AsyncInit, asyncreader, AsyncRequestDone, AsyncRequestOpen, AsyncRequestSection
extern byte_17C60C, byte_17CA1D, dword_11D23E, dword_11D242, dword_11D376, dword_11D37A, dword_11D37E, dword_11D38A
extern dword_11D38E, dword_17C4A0, dword_17C4A4, dword_17C5BC, dword_17C5C0, dword_17C5C4, dword_17C5C8, dword_17C5CC
extern dword_17C5D0, dword_17C5FC, dword_17C600, GetTicks, globalset, MakeDataPath, optflags, rand_
extern setasyncspeed, sndcard, srand_, str_SPEECHBUF, sub_AB758, sub_ABF4C, sub_BFA45, sub_BFA45_90
extern sub_BFAF5, sub_BFB53, sub_BFB74, sub_BFB7C, sub_BFBE3, sub_E0686, sub_E07B8, sub_E07CC
extern sub_E081C, word_11D23A, word_11D356, word_11D382, word_11D384, word_11D386, word_11D388, word_17C49C
extern word_17C49E, word_17C63E, word_17C640
global FindClipIndex, FindClipIndex_55, FindClipIndex_56, FindTeamPairClip, FindTeamPairClip_85, ResetSpeechChannels, OpenSpeechBanks, InitSpeech
global ShutdownSpeech, FreeSpeechBuffer, RestoreSpeechBuffer, RestoreSpeechBuffer_32, SetSpeechVolume, SpeechBusy, QueueSpeechClip, CountRecordGame
global RecordPctClip, RecordStreakClips, unk_67981, jpt_6799B, unk_679D3, jpt_679E7, jpt_67A13, jpt_67A43
global PaEvent, PaEvent_50, PaEvent_64, PaEvent_CD, PaEvent_1B4, PaEvent_1C6, PaEvent_1D8, PaEvent_1DF
global PaEvent_1E6, PaEvent_1ED, PaEvent_1F4, PaEvent_1FB, PaEvent_202, PaEvent_209, PaEvent_20E, PaEvent_231
global PaEvent_2AD, PaEvent_2B7, PaEvent_2C1, PaEvent_2CB, PaEvent_2DC, PaEvent_307, PaEvent_31C, PaEvent_334
global PaEvent_34C, PaEvent_388, PaEvent_3B0, PaEvent_3D8, PaEvent_47B, PaEvent_492, PaEvent_4A9, PaEvent_5BD
global PaEvent_61F, PaEvent_6BB, PaEvent_71D, PaEvent_757, PaEvent_768, PaEvent_779, PaEvent_78A, PaEvent_79B
global PaEvent_7AC, PaEvent_7DE, PaEvent_965, PaEvent_AAB, StopSpeech, StopSpeech_1FA, StopSpeech_207
;-----------------------------------------------------------------------------
; FindClipIndex                                   67000  96 PC, low confidence
; Binary search of the 45h-entry table dword_11D242 for [eax]; stores the
; index (or -1) back
;-----------------------------------------------------------------------------
FindClipIndex:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        mov ecx, 0FFFFFFFFh
        mov esi, 45h
        xor ebx, ebx
.1:
        movsx edx, bx
        mov dword [byte ebp-0Ch], edx
        movsx edx, si
        add edx, dword [byte ebp-0Ch]
        sar edx, 1
        mov dword [byte ebp-04h], edx
        movsx edx, dx
        mov edi, dword [eax]
        mov dword [byte ebp-08h], edx
        shl edx, 2
        cmp edi, dword [dword edx+dword_11D242]
        jle short .2
        mov ebx, dword [byte ebp-04h]
        jmp short .4
.2:
        jge short .3
        mov esi, dword [byte ebp-04h]
        dec esi
        jmp short .5
.3:
        mov ebx, esi
        mov ecx, dword [byte ebp-08h]
.4:
        inc ebx
.5:
        cmp bx, si
        jle short .1
        mov dword [eax], ecx
        mov eax, ecx
FindClipIndex_55:
        leave
FindClipIndex_56:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FindTeamPairClip                             6705C  96 PC, medium confidence
; (a, b): finds the pair a<<8|b or b<<8|a in the 16-entry table word_11D356
; (two teams 0-1Ch from the event 8 call); the play-by-play adds 81h to the
; index
;-----------------------------------------------------------------------------
FindTeamPairClip:
        push ebx
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov ebx, eax
        mov ecx, edx
        shl ecx, 8
        mov dword [byte ebp-010h], 0FFFFFFFFh
        add ecx, ebx
        shl ebx, 8
        xor eax, eax
        add ebx, edx
        mov dword [byte ebp-08h], ecx
        mov dword [byte ebp-04h], ebx
.1:
        movsx edx, ax
        cmp edx, byte 2
        jge short .9
        inc eax
        cmp ax, 1
        je short .2
        mov edx, dword [byte ebp-08h]
        jmp short .3
.2:
        mov edx, dword [byte ebp-04h]
.3:
        mov dword [byte ebp-0Ch], edx
        mov ebx, 10h
        mov edi, dword [byte ebp-0Ch]
        xor ecx, ecx
.4:
        movsx edx, cx
        movsx esi, bx
        add edx, esi
        sar edx, 1
        mov esi, edx
        movsx edx, dx
        mov dword [byte ebp-014h], edx
        add edx, edx
        cmp di, word [dword edx+word_11D356]
        jle short .5
        mov ecx, esi
        jmp short .7
.5:
        jge short .6
        mov ebx, esi
        dec ebx
        jmp short .8
.6:
        mov edx, dword [byte ebp-014h]
        inc eax
        mov ecx, ebx
        mov dword [byte ebp-010h], edx
.7:
        inc ecx
.8:
        cmp cx, bx
        jle short .4
        jmp short .1
.9:
        mov eax, dword [byte ebp-010h]
FindTeamPairClip_85:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ResetSpeechChannels                                             670E7  96 PC
; Clears the 3 speech play channels (3 x 14h at dword_17C5C0, request -1) and
; their counters
;-----------------------------------------------------------------------------
ResetSpeechChannels:
        push ecx
        push edi
        mov ecx, 3Ch
        mov edi, dword_17C5C0
        xor eax, eax
        rep stosb
        mov word [word_17C63E], 0
        jmp short .2
.1:
        imul eax, byte 14h
        inc word [word_17C63E]
        mov dword [dword eax+dword_17C5D0], 0FFFFFFFFh
.2:
        movsx eax, word [word_17C63E]
        cmp eax, byte 3
        jl short .1
        mov word [word_17C63E], 0
        mov word [word_17C640], 0
        mov word [word_11D388], 0
        pop edi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; OpenSpeechBanks                              67140  96 PC, medium confidence
; (game): stops speech, clears the clip queue, opens the speech bank files
; (front-end or game list, MakeDataPath) with AsyncRequestOpen and reads
; their clip tables
;-----------------------------------------------------------------------------
OpenSpeechBanks:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 14h, 0
        push eax
        cmp dword [sndcard], byte 0
        jl near FindClipIndex_55
        cmp dword [dword_11D37E], byte 0FFFFFFFFh
        jl near FindClipIndex_55
        call StopSpeech
        cmp dword [dword_11D37E], byte 0
        jl short .2
        mov dword [dword_11D37E], 0FFFFFFFFh
        cmp byte [byte_17C60C], 0
        je short .1
        mov byte [byte_17C60C], 0
        push dword [dword_17C600]
        mov dword [dword_17C5BC], 0
        call sub_ABF4C
        add esp, byte 4
.1:
        mov ecx, 120h
        mov edi, word_17C49C
        xor eax, eax
        rep stosb
        mov word [word_11D386], 0
        mov word [word_11D382], 0
        mov word [word_11D384], 0
        call ResetSpeechChannels
.2:
        cmp dword [byte ebp-018h], byte 0
        je short .3
        mov dword [dword_11D38A], 1
        mov dword [dword_17C5FC], 64h
        jmp short .4
.3:
        mov dword [dword_11D38A], 1
        mov dword [dword_17C5FC], 0
.4:
        mov dword [byte ebp-04h], 0
        mov edi, byte_17C60C
        mov dword [byte ebp-08h], dword_17C5BC
        jmp near .11
.5:
        shl eax, 2
        cmp dword [byte ebp-018h], byte 0
        je short .6
        mov edx, dword [dword eax+dword_11D376]
        jmp short .7
.6:
        mov edx, dword [dword eax+dword_11D23E]
.7:
        mov eax, edi
        call MakeDataPath
        imul esi, dword [byte ebp-04h], byte 32h
        lea eax, [byte ebp-014h]
        push eax
        lea eax, [byte ebp-010h]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        push edi
        call sub_E0686
        add esp, byte 10h
        cmp dword [byte ebp-0Ch], byte 0
        jne short .8
        cmp dword [byte ebp-010h], byte 0
        jne short .8
        cmp dword [byte ebp-014h], byte 0
        je short .9
.8:
        push byte 0
        push dword [byte ebp-0Ch]
        call sub_E081C
        add esp, byte 8
        push byte 4
        push dword [byte ebp-08h]
        push dword [byte ebp-0Ch]
        mov esi, dword [byte ebp-04h]
        call sub_E07CC
        add esp, byte 0Ch
        mov eax, dword [nosplit esi*4+dword_17C5BC]
        push byte 20h
        shl eax, 2
        push eax
        push edi
        call sub_AB758
        mov dword [nosplit esi*4+dword_17C600], eax
        mov eax, dword [nosplit esi*4+dword_17C5BC]
        add esp, byte 0Ch
        shl eax, 2
        push eax
        push dword [nosplit esi*4+dword_17C600]
        push dword [byte ebp-0Ch]
        call sub_E07CC
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call sub_E07B8
        mov eax, dword [byte ebp-018h]
        add esp, byte 4
        mov dword [dword_11D37E], eax
        jmp short .10
.9:
        mov dword [dword_11D37E], 0FFFFFFFFh
        mov byte [dword esi+byte_17C60C], 0
.10:
        add dword [byte ebp-08h], byte 4
        inc dword [byte ebp-04h]
        add edi, byte 32h
.11:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [dword_11D38A]
        jl near .5
        call AsyncClose
        push byte 20h
        push dword 2000h
        push byte 18h
        call AsyncInit
        add esp, byte 0Ch
        push byte_17C60C
        call AsyncRequestOpen
        add esp, byte 4
        call asyncreader
        jmp near FindClipIndex_55
;-----------------------------------------------------------------------------
; InitSpeech                                                      67329  96 PC
; Called from StartSoundCard: seeds rand from the DOS time, sets the speech
; volume from globalset, allocates SPEECHBUF (56AEAh), opens the front-end
; banks, setasyncspeed once
;-----------------------------------------------------------------------------
InitSpeech:
        push ebx
        push ecx
        push edx
        push edi
        enter 6Ch, 0
        cmp dword [sndcard], byte 0
        jl near .1
        lea eax, [byte ebp-04h]
        call _dos_gettime_
        movzx ebx, byte [byte ebp-03h]
        movzx eax, byte [byte ebp-04h]
        imul ebx, eax
        movzx eax, byte [byte ebp-02h]
        imul eax, ebx
        call srand_
        mov eax, dword [globalset]
        shl eax, 0Ch
        shr eax, 19h
        mov edx, 0Fh
        lea ebx, [byte eax+028h]
        mov ecx, 120h
        mov eax, 0Eh
        mov edi, word_17C49C
        call sub_BFA45
        mov dword [dword_11D37E], 0FFFFFFFFh
        mov byte [byte_17C60C], 0
        mov dword [dword_17C5BC], 0
        xor eax, eax
        mov dword [dword_17C600], 0
        rep stosb
        mov word [word_11D386], 0
        mov word [word_11D382], 0
        mov word [word_11D384], 0
        call ResetSpeechChannels
        push byte 0
        push dword 56AEAh
        push str_SPEECHBUF
        call sub_AB758
        add esp, byte 0Ch
        mov dword [dword_11D37A], eax
        xor eax, eax
        call OpenSpeechBanks
        cmp dword [dword_11D38E], byte 0
        jne short .1
        mov edx, 5Bh
        lea eax, [byte ebp-038h]
        call MakeDataPath
        mov edx, 5Ah
        lea eax, [byte ebp-06Ch]
        call MakeDataPath
        lea eax, [byte ebp-06Ch]
        push eax
        lea eax, [byte ebp-038h]
        push eax
        call setasyncspeed
        mov dword [dword_11D38E], 1
        add esp, byte 8
.1:
        leave
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShutdownSpeech                                                  67430  96 PC
; Called from the sound shutdown: stops speech if busy, frees the bank table
; and SPEECHBUF
;-----------------------------------------------------------------------------
ShutdownSpeech:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl near .5
        xor edx, edx
        cmp dword [sndcard], byte 0
        jl short .2
        cmp dword [dword_11D37E], byte 0
        jl short .2
        call sub_BFB53
        test eax, eax
        jne short .1
        cmp word [word_11D386], byte 0
        je short .2
.1:
        mov edx, 1
.2:
        test edx, edx
        je short .3
        call StopSpeech
.3:
        cmp byte [byte_17C60C], 0
        je short .4
        mov byte [byte_17C60C], 0
        push dword [dword_17C600]
        mov dword [dword_17C5BC], 0
        call sub_ABF4C
        add esp, byte 4
.4:
        call sub_BFBE3
        cmp dword [dword_11D37A], byte 0
        je short .5
        push dword [dword_11D37A]
        call sub_ABF4C
        mov dword [dword_11D37A], 0
        add esp, byte 4
.5:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeSpeechBuffer                             674C7  96 PC, medium confidence
; Frees SPEECHBUF (state 1 -> -2), around the in-game menu and other screens
; that need the memory
;-----------------------------------------------------------------------------
FreeSpeechBuffer:
        push ebx
        push ecx
        push edx
        cmp dword [dword_11D37E], byte 1
        jne short .1
        call StopSpeech
        push dword [dword_11D37A]
        call sub_ABF4C
        mov dword [dword_11D37A], 0
        mov dword [dword_11D37E], 0FFFFFFFEh
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RestoreSpeechBuffer                          674FE  96 PC, medium confidence
; Allocates SPEECHBUF again after FreeSpeechBuffer (state -2 -> 1)
;-----------------------------------------------------------------------------
RestoreSpeechBuffer:
        push ebx
        push ecx
        push edx
        cmp dword [dword_11D37E], byte 0FFFFFFFEh
        jne short .1
        push byte 0
        push dword 56AEAh
        push str_SPEECHBUF
        call sub_AB758
        mov dword [dword_11D37E], 1
        add esp, byte 0Ch
        mov dword [dword_11D37A], eax
.1:
        pop edx
        pop ecx
        pop ebx
RestoreSpeechBuffer_32:
        ret
;-----------------------------------------------------------------------------
; SetSpeechVolume                              67531  96 PC, medium confidence
; (vol): clamps 0-57h, adds 28h and sets it in the sound driver (the volume
; InitSpeech sets from globalset)
;-----------------------------------------------------------------------------
SetSpeechVolume:
        cmp dword [sndcard], byte 0
        jl short RestoreSpeechBuffer_32
        cmp dword [dword_11D37E], byte 0
        jl short RestoreSpeechBuffer_32
        test eax, eax
        jge short .1
        xor eax, eax
.1:
        cmp eax, byte 57h
        jle short .2
        mov eax, 57h
.2:
        add eax, byte 28h
        jmp near sub_BFA45_90
;-----------------------------------------------------------------------------
; SpeechBusy                                                      6755B  96 PC
; 1 while the driver plays speech or clips are queued (word_11D386)
;-----------------------------------------------------------------------------
SpeechBusy:
        push edx
        xor edx, edx
        cmp dword [sndcard], byte 0
        jl short .2
        cmp dword [dword_11D37E], byte 0
        jl short .2
        call sub_BFB53
        test eax, eax
        jne short .1
        cmp word [word_11D386], byte 0
        je short .2
.1:
        mov edx, 1
.2:
        mov eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; QueueSpeechClip                                                 6758C  96 PC
; (bank, clip): adds the clip's file offset and length (from the bank's table
; at dword_17C600) to the 24-entry clip queue
;-----------------------------------------------------------------------------
QueueSpeechClip:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov ecx, edx
        movsx eax, word [word_11D384]
        inc eax
        mov esi, 18h
        cdq
        idiv esi
        mov word [word_11D384], dx
        cmp dx, word [word_11D382]
        jne short .1
        movsx eax, dx
        inc eax
        cdq
        idiv esi
        mov word [word_11D382], dx
.1:
        movsx eax, word [word_11D384]
        imul eax, byte 0Ch
        mov word [dword eax+word_17C49C], bx
        mov edx, dword [nosplit ebx*4+dword_17C600]
        mov word [dword eax+word_17C49E], cx
        mov ebx, dword [edx+ecx*4]
        mov dword [dword eax+dword_17C4A0], ebx
        mov edx, dword [byte edx+ecx*4+04h]
        sub edx, ebx
        inc word [word_11D386]
        mov dword [dword eax+dword_17C4A4], edx
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CountRecordGame                                 67600  96 PC, low confidence
; Counts one game of a W/L/T byte string (1, 2, 3) into the counters the
; caller passes
;-----------------------------------------------------------------------------
CountRecordGame:
        push esi
        push edi
        push ebp
        mov ebp, esp
        mov esi, eax
        mov edi, ebx
        mov eax, dword [byte ebp+010h]
        mov ebx, dword [esi]
        movsx ebx, byte [ebx]
        cmp ebx, byte 3
        jne short .2
        inc dword [edx]
.1:
        inc dword [eax]
        jmp short .4
.2:
        cmp ebx, byte 2
        jne short .3
        inc dword [edi]
        jmp short .1
.3:
        cmp ebx, byte 1
        jne short .4
        add dword [eax], ebx
        add dword [ecx], ebx
.4:
        inc dword [esi]
        pop ebp
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; RecordPctClip                                   67636  96 PC, low confidence
; Picks clip 9-0Ch from three 16.16 ratios (>= .5, >= .65, >= .6)
;-----------------------------------------------------------------------------
RecordPctClip:
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        mov esi, ecx
        mov eax, ebx
        shl esi, 10h
        shl eax, 10h
        mov ebx, esi
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        cmp eax, 8000h
        jl short .1
        mov eax, 0Ah
        leave
        pop edi
        pop esi
        ret
.1:
        mov eax, edi
        mov ebx, esi
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        cmp eax, 0A666h
        jl short .2
        mov eax, 0Ch
        leave
        pop edi
        pop esi
        ret
.2:
        mov eax, dword [byte ebp-04h]
        mov ebx, esi
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        cmp eax, 9999h
        jl short .3
        mov eax, 0Bh
        leave
        pop edi
        pop esi
        ret
.3:
        mov eax, 9
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; RecordStreakClips                               676D4  96 PC, low confidence
; Reads a team's W/L/T byte string (streak or record) for the play-by-play
; event 4 clips
;-----------------------------------------------------------------------------
RecordStreakClips:
        push esi
        push edi
        enter 30h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-01Ch], 0
        mov dword [byte ebp-020h], 0
        mov dword [byte ebp-010h], eax
        add eax, byte 0Bh
        mov word [edx], 0
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-010h]
        cmp byte [byte eax+01h], 0
        jne short .3
        movsx eax, byte [eax]
        cmp eax, byte 1
        jne short .1
        mov word [edx], 3
        leave
        pop edi
        pop esi
        ret
.1:
        cmp eax, byte 3
        jne short .2
        mov word [edx], 2
        leave
        pop edi
        pop esi
        ret
.2:
        mov word [edx], 1
        leave
        pop edi
        pop esi
        ret
.3:
        movsx eax, byte [eax]
        cmp eax, byte 1
        jne short .5
        mov eax, dword [byte ebp-010h]
        movsx eax, byte [byte eax+01h]
        cmp eax, byte 1
        jne short .5
        mov word [edx], 4
        add dword [byte ebp-010h], byte 2
        mov word [ebx], 0
.4:
        mov eax, dword [byte ebp-010h]
        movsx eax, byte [eax]
        cmp eax, byte 1
        jne near .27
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-04h]
        jae near .27
        movsx eax, word [edi]
        cmp eax, byte 2
        jge near .27
        inc word [edi]
        inc dword [byte ebp-010h]
        jmp short .4
.5:
        mov eax, dword [byte ebp-010h]
        mov dl, byte [eax]
        cmp dl, byte [byte eax+01h]
        jne short .8
        cmp dl, byte [byte eax+02h]
        jne short .8
        movsx eax, dl
        cmp eax, byte 3
        sete al
        movzx ax, al
        add eax, 5
        mov word [esi], ax
        mov edx, dword [byte ebp-010h]
        add dword [byte ebp-010h], byte 3
        mov word [edi], 1
.6:
        mov eax, dword [byte ebp-010h]
        mov al, byte [eax]
        cmp al, byte [edx]
        jne short .7
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-04h]
        jae short .7
        movsx eax, word [edi]
        cmp eax, byte 9
        jge short .7
        inc dword [byte ebp-010h]
        inc word [edi]
        jmp short .6
.7:
        movsx eax, word [edi]
        cmp eax, byte 9
        jne near .27
        add word [esi], byte 2
        leave
        pop edi
        pop esi
        ret
.8:
        mov eax, dword [byte ebp-010h]
        cmp byte [byte eax+02h], 0
        jne short .13
        movsx eax, byte [eax]
        cmp eax, byte 1
        jne short .10
.9:
        mov word [esi], 3
        leave
        pop edi
        pop esi
        ret
.10:
        cmp eax, byte 3
        jne short .12
.11:
        mov word [esi], 2
        leave
        pop edi
        pop esi
        ret
.12:
        mov word [esi], 1
        leave
        pop edi
        pop esi
        ret
.13:
        mov dword [byte ebp-08h], 0
.14:
        lea eax, [byte ebp-020h]
        lea ecx, [byte ebp-01Ch]
        lea ebx, [byte ebp-018h]
        lea edx, [byte ebp-014h]
        push eax
        lea eax, [byte ebp-010h]
        inc dword [byte ebp-08h]
        call CountRecordGame
        cmp dword [byte ebp-08h], byte 3
        jl short .14
        mov ecx, dword [byte ebp-020h]
        mov ebx, dword [byte ebp-01Ch]
        mov edx, dword [byte ebp-018h]
        mov eax, dword [byte ebp-014h]
        dec dword [byte ebp-04h]
        call RecordPctClip
        mov word [esi], ax
.15:
        mov eax, dword [byte ebp-010h]
        cmp byte [eax], 0
        je near .19
        cmp eax, dword [byte ebp-04h]
        jae near .19
        movsx eax, word [esi]
        cmp eax, byte 9
        jne short .16
        lea eax, [byte ebp-020h]
        lea ecx, [byte ebp-01Ch]
        lea ebx, [byte ebp-018h]
        push eax
        lea edx, [byte ebp-014h]
        lea eax, [byte ebp-010h]
        call CountRecordGame
.16:
        mov ecx, dword [byte ebp-020h]
        mov ebx, dword [byte ebp-01Ch]
        mov edx, dword [byte ebp-018h]
        mov eax, dword [byte ebp-014h]
        call RecordPctClip
        mov edx, eax
        cmp eax, byte 9
        je short .15
        mov word [esi], ax
.17:
        mov eax, dword [byte ebp-010h]
        cmp byte [eax], 0
        je short .15
        cmp eax, dword [byte ebp-04h]
        jae short .15
        mov eax, dword [byte ebp-014h]
        mov dword [byte ebp-024h], eax
        mov eax, dword [byte ebp-018h]
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-01Ch]
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-020h]
        lea ecx, [byte ebp-02Ch]
        mov dword [byte ebp-030h], eax
        lea eax, [byte ebp-030h]
        lea ebx, [byte ebp-028h]
        push eax
        lea edx, [byte ebp-024h]
        lea eax, [byte ebp-010h]
        call CountRecordGame
        mov ecx, dword [byte ebp-030h]
        mov ebx, dword [byte ebp-02Ch]
        mov edx, dword [byte ebp-028h]
        mov eax, dword [byte ebp-024h]
        call RecordPctClip
        movsx edx, word [esi]
        cmp eax, edx
        jne short .18
        mov eax, dword [byte ebp-024h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-028h]
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-02Ch]
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte ebp-030h]
        mov dword [byte ebp-020h], eax
        jmp short .17
.18:
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-010h], eax
        jmp short .17
.19:
        movsx eax, word [esi]
        cmp eax, byte 9
        jne short .20
        mov eax, dword [byte ebp-034h]
        movsx eax, byte [eax]
        cmp eax, byte 1
        je near .9
        cmp eax, byte 3
        je near .11
        jmp near .12
.20:
        mov ax, word [esi]
        cmp ax, 0Bh
        jb short .21
        jbe short .23
        cmp ax, 0Ch
        je short .22
        jmp short .26
.21:
        cmp ax, 0Ah
        je short .24
        jmp short .26
.22:
        mov eax, dword [byte ebp-014h]
        jmp short .25
.23:
        mov eax, dword [byte ebp-018h]
        jmp short .25
.24:
        mov eax, dword [byte ebp-01Ch]
.25:
        dec eax
        mov word [edi], ax
.26:
        mov eax, dword [byte ebp-020h]
        mov edx, dword [byte ebp-0Ch]
        dec eax
        dec eax
        mov word [edx], ax
.27:
        leave
        pop edi
        pop esi
        ret
unk_67981:
        db 0FFh,0Fh,0FFh,07h,0FFh,03h,0FFh,01h,0FFh,00h,07Fh,00h,03Fh,00h,01Fh,00h
        db 0Fh,00h,07h,00h,03h,00h,01h,00h,00h,00h
jpt_6799B:
        dd FindClipIndex_55
        dd PaEvent_47B
        dd PaEvent_5BD
        dd PaEvent_231
        dd PaEvent_CD
        dd PaEvent_AAB
        dd PaEvent_965
        dd PaEvent_7DE
        dd PaEvent_492
        dd PaEvent_7AC
        dd PaEvent_3D8
        dd PaEvent_4A9
        dd PaEvent_64
        dd PaEvent_50
unk_679D3:
        db 0FFh,01h,0FFh,00h,07Fh,00h,03Fh,00h,01Fh,00h,0Fh,00h,07h,00h,03h,00h
        db 01h,00h,00h,00h
jpt_679E7:
        dd PaEvent_20E
        dd PaEvent_1B4
        dd PaEvent_1C6
        dd PaEvent_1DF
        dd PaEvent_1E6
        dd PaEvent_1ED
        dd PaEvent_1F4
        dd PaEvent_1FB
        dd PaEvent_202
        dd PaEvent_209
        dd PaEvent_1D8
jpt_67A13:
        dd PaEvent_2AD
        dd PaEvent_2B7
        dd PaEvent_2C1
        dd PaEvent_2CB
        dd PaEvent_2DC
        dd PaEvent_307
        dd PaEvent_31C
        dd PaEvent_334
        dd FindClipIndex_55
        dd PaEvent_34C
        dd PaEvent_388
        dd PaEvent_3B0
jpt_67A43:
        dd PaEvent_61F
        dd PaEvent_6BB
        dd PaEvent_71D
        dd PaEvent_757
        dd PaEvent_768
        dd PaEvent_779
        dd PaEvent_78A
        dd PaEvent_79B
;-----------------------------------------------------------------------------
; PaEvent                                                         67A63  96 PC
; The play-by-play announcer: (event bit, args...) from PostGoalEvent,
; PostPenaltyEvent, ClockTick (100h, end of period), the three stars and the
; screens; jump table jpt_6799B by event, each case queues clips
;-----------------------------------------------------------------------------
PaEvent:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 28h, 0
        cmp dword [sndcard], byte 0
        jl near FindClipIndex_55
        test byte [byte_17CA1D], 10h
        je near FindClipIndex_55
        mov eax, dword [byte ebp+01Ch]
        dec eax
        lea edx, [byte ebp+020h]
        cmp eax, 0FFFh
        ja near FindClipIndex_55
        mov ecx, 0Eh
        mov edi, unk_67981
        repne scasw
        lea eax, [byte ebp+020h]
        add eax, byte 4
        jmp dword [nosplit cs:ecx*4+jpt_6799B]
PaEvent_50:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        xor edx, edx
        jmp near PaEvent_965.91
PaEvent_64:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        xor eax, eax
.1:
        add eax, byte 4
        mov ebx, dword [edx]
        add edx, byte 4
        mov dword [byte eax+ebp-02Ch], ebx
        cmp eax, byte 8
        jne short .1
        mov eax, 2
        cmp dword [byte ebp-028h], byte 0
        jl short .2
        cmp dword [byte ebp-028h], byte 1Ah
        jl short .3
.2:
        xor eax, eax
.3:
        cmp dword [byte ebp-024h], byte 0
        jl short .4
        cmp dword [byte ebp-024h], byte 6
        jle short .5
.4:
        xor eax, eax
.5:
        test eax, eax
        je near FindClipIndex_55
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 10Eh
        call QueueSpeechClip
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, 21Bh
        jmp near PaEvent_965.92
PaEvent_CD:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        xor eax, eax
.6:
        add eax, byte 4
        mov ebx, dword [edx]
        add edx, byte 4
        mov dword [byte eax+ebp-02Ch], ebx
        cmp eax, byte 14h
        jne short .6
        mov eax, 5
        cmp dword [byte ebp-028h], byte 0
        jl short .7
        cmp dword [byte ebp-028h], byte 1Ah
        jl short .8
.7:
        xor eax, eax
.8:
        cmp dword [byte ebp-024h], byte 0
        jl short .9
        cmp dword [byte ebp-024h], byte 7
        jle short .10
.9:
        xor eax, eax
.10:
        cmp dword [byte ebp-020h], byte 1
        jl short .11
        cmp dword [byte ebp-020h], 200h
        jle short .12
.11:
        xor eax, eax
.12:
        cmp dword [byte ebp-01Ch], byte 0
        jl short .13
        cmp dword [byte ebp-01Ch], byte 1Ch
        jle short .14
.13:
        xor eax, eax
.14:
        cmp dword [byte ebp-018h], byte 0
        jl short .15
        cmp dword [byte ebp-018h], byte 1Ch
        jle short .16
.15:
        xor eax, eax
.16:
        test eax, eax
        je near FindClipIndex_55
        mov edx, dword [byte ebp-018h]
        mov eax, dword [byte ebp-01Ch]
        call FindTeamPairClip
        mov ebx, eax
        test eax, eax
        jl short .17
        lea edx, [dword eax+081h]
        jmp near PaEvent_965.91
.17:
        mov esi, dword [byte ebp-028h]
        mov ecx, 2
        call rand_
        cdq
        idiv ecx
        add esi, esi
        lea eax, [byte esi+01h]
        add edx, eax
        xor eax, eax
        call QueueSpeechClip
        cmp dword [byte ebp-024h], byte 0
        jle short .18
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, byte 34h
        call QueueSpeechClip
.18:
        mov eax, dword [byte ebp-020h]
        dec eax
        cmp eax, 1FFh
        ja near PaEvent_20E
        mov ecx, 0Bh
        mov edi, unk_679D3
        repne scasw
        jmp dword [nosplit cs:ecx*4+jpt_679E7]
PaEvent_1B4:
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        lea ebx, [byte edx+043h]
        jmp short PaEvent_20E
PaEvent_1C6:
        call rand_
        mov ebx, 3
        cdq
        idiv ebx
        lea ebx, [byte edx+046h]
        jmp short PaEvent_20E
PaEvent_1D8:
        mov ebx, 45h
        jmp short PaEvent_20E
PaEvent_1DF:
        mov ebx, 41h
        jmp short PaEvent_20E
PaEvent_1E6:
        mov ebx, 3Fh
        jmp short PaEvent_20E
PaEvent_1ED:
        mov ebx, 3Dh
        jmp short PaEvent_20E
PaEvent_1F4:
        mov ebx, 42h
        jmp short PaEvent_20E
PaEvent_1FB:
        mov ebx, 40h
        jmp short PaEvent_20E
PaEvent_202:
        mov ebx, 3Eh
        jmp short PaEvent_20E
PaEvent_209:
        mov ebx, 3Ch
PaEvent_20E:
        mov edx, ebx
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-01Ch]
        xor eax, eax
        add edx, byte 49h
        call QueueSpeechClip
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, byte 65h
        jmp near PaEvent_965.92
PaEvent_231:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-028h], eax
        test eax, eax
        jl short .19
        cmp eax, byte 1Ah
        jl short .20
.19:
        xor eax, eax
        jmp short .21
.20:
        mov eax, 1
.21:
        test eax, eax
        je short .23
        mov esi, dword [edx]
        add edx, byte 4
        test esi, esi
        je short .22
        cmp byte [esi], 0
        jne short .23
.22:
        xor eax, eax
.23:
        test eax, eax
        je near FindClipIndex_55
        lea ecx, [byte ebp-04h]
        lea ebx, [byte ebp-08h]
        lea edx, [byte ebp-0Ch]
        mov eax, esi
        call RecordStreakClips
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 10Eh
        call QueueSpeechClip
        mov eax, dword [byte ebp-0Ch]
        dec eax
        cmp ax, 0Bh
        ja near FindClipIndex_55
        movzx eax, ax
        jmp dword [nosplit cs:eax*4+jpt_67A13]
PaEvent_2AD:
        mov edx, 140h
        jmp near PaEvent_965.91
PaEvent_2B7:
        mov edx, 13Fh
        jmp near PaEvent_965.91
PaEvent_2C1:
        mov edx, 141h
        jmp near PaEvent_965.91
PaEvent_2CB:
        movsx edx, word [byte ebp-08h]
        xor eax, eax
        add edx, 133h
        jmp near PaEvent_965.92
PaEvent_2DC:
        call rand_
        mov ebx, 3
        cdq
        idiv ebx
        add edx, 130h
.24:
        xor eax, eax
        call QueueSpeechClip
        movsx edx, word [byte ebp-08h]
        xor eax, eax
        add edx, 142h
        jmp near PaEvent_965.92
PaEvent_307:
        call rand_
        mov ebx, 4
        cdq
        idiv ebx
        add edx, 12Ch
        jmp short PaEvent_2DC.24
PaEvent_31C:
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        add edx, 12Ah
        jmp near PaEvent_965.91
PaEvent_334:
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        add edx, 128h
        jmp near PaEvent_965.91
PaEvent_34C:
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        add edx, 13Dh
        xor eax, eax
        call QueueSpeechClip
        movsx edx, word [byte ebp-08h]
        xor eax, eax
        add edx, 15Fh
.25:
        call QueueSpeechClip
        movsx edx, word [byte ebp-04h]
        xor eax, eax
        add edx, 169h
        jmp near PaEvent_965.92
PaEvent_388:
        call rand_
        mov ebx, 3
        cdq
        idiv ebx
        add edx, 13Ah
        xor eax, eax
        call QueueSpeechClip
        movsx edx, word [byte ebp-08h]
        xor eax, eax
        add edx, 155h
        jmp short PaEvent_34C.25
PaEvent_3B0:
        call rand_
        mov ebx, 4
        cdq
        idiv ebx
        add edx, 136h
        xor eax, eax
        call QueueSpeechClip
        movsx edx, word [byte ebp-08h]
        xor eax, eax
        add edx, 14Bh
        jmp short PaEvent_34C.25
PaEvent_3D8:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        xor eax, eax
.26:
        add eax, byte 4
        mov ebx, dword [edx]
        add edx, byte 4
        mov dword [byte eax+ebp-02Ch], ebx
        cmp eax, byte 8
        jne short .26
        mov eax, 2
        cmp dword [byte ebp-028h], byte 0
        jge short .27
        xor eax, eax
.27:
        cmp dword [byte ebp-024h], byte 0
        jge short .28
        xor eax, eax
.28:
        test eax, eax
        je near FindClipIndex_55
        lea eax, [byte ebp-028h]
        call FindClipIndex
        test eax, eax
        jl short .29
        lea eax, [byte ebp-024h]
        call FindClipIndex
        test eax, eax
        jge short .30
.29:
        mov dword [byte ebp-028h], 45h
.30:
        cmp dword [byte ebp-028h], byte 45h
        jge short .31
        cmp dword [byte ebp-024h], byte 45h
        jge short .31
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 18Fh
        call QueueSpeechClip
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, 1D4h
        jmp near PaEvent_965.92
.31:
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je near FindClipIndex_55
        mov edx, 18Eh
        jmp near PaEvent_965.91
PaEvent_47B:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        mov edx, 219h
        jmp near PaEvent_965.91
PaEvent_492:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        mov edx, 21Ah
        jmp near PaEvent_965.91
PaEvent_4A9:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        xor eax, eax
.32:
        add eax, byte 4
        mov ebx, dword [edx]
        add edx, byte 4
        mov dword [byte eax+ebp-02Ch], ebx
        cmp eax, byte 14h
        jne short .32
        mov eax, 5
        cmp dword [byte ebp-028h], byte 0FFFFFFFFh
        jge short .33
        xor eax, eax
.33:
        cmp dword [byte ebp-024h], byte 0
        jl short .34
        cmp dword [byte ebp-024h], byte 1Ch
        jle short .35
.34:
        xor eax, eax
.35:
        cmp dword [byte ebp-020h], byte 0
        jl short .36
        cmp dword [byte ebp-020h], byte 1Eh
        jle short .37
.36:
        xor eax, eax
.37:
        cmp dword [byte ebp-01Ch], byte 0
        jl short .38
        cmp dword [byte ebp-01Ch], byte 1Ch
        jle short .39
.38:
        xor eax, eax
.39:
        cmp dword [byte ebp-018h], byte 0
        jl short .40
        cmp dword [byte ebp-018h], byte 1Eh
        jle short .41
.40:
        xor eax, eax
.41:
        test eax, eax
        je near FindClipIndex_55
        cmp dword [byte ebp-028h], byte 0FFFFFFFFh
        jne short .43
        mov edx, 91h
.42:
        xor eax, eax
        jmp short .45
.43:
        cmp dword [byte ebp-028h], byte 4
        jle short .44
        mov edx, 97h
        jmp short .42
.44:
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 92h
.45:
        call QueueSpeechClip
        cmp dword [byte ebp-028h], byte 0FFFFFFFFh
        jne short .47
        mov edx, dword [byte ebp-01Ch]
        xor eax, eax
        add edx, 98h
        call QueueSpeechClip
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, 0B4h
        call QueueSpeechClip
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, 0D3h
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
.46:
        xor eax, eax
        add edx, 0EFh
        jmp near PaEvent_965.92
.47:
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, 98h
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, 0B4h
        call QueueSpeechClip
        mov edx, dword [byte ebp-01Ch]
        xor eax, eax
        add edx, 0D3h
        call QueueSpeechClip
        mov edx, dword [byte ebp-018h]
        jmp short .46
PaEvent_5BD:
        cmp dword [dword_11D37E], byte 0
        jne near FindClipIndex_55
        mov ebx, 1
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-028h], eax
        test eax, eax
        jl short .48
        cmp eax, byte 1Ah
        jl short .49
.48:
        xor ebx, ebx
.49:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-024h], eax
        cmp eax, byte 1
        jl short .50
        cmp eax, byte 8
        jle short .51
.50:
        xor ebx, ebx
.51:
        test ebx, ebx
        je near FindClipIndex_55
        mov esi, dword [byte ebp-024h]
        dec esi
        cmp esi, byte 7
        ja near FindClipIndex_55
        lea eax, [byte edx+04h]
        mov edx, dword [byte ebp-028h]
        add edx, 10Eh
        jmp dword [nosplit cs:esi*4+jpt_67A43]
PaEvent_61F:
        mov edx, eax
        mov eax, dword [byte eax-04h]
        mov dword [byte ebp-020h], eax
        cmp eax, byte 1
        jl short .52
        cmp eax, byte 3
        jle short .53
.52:
        xor ebx, ebx
.53:
        test ebx, ebx
        je near FindClipIndex_55
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-01Ch], eax
        test eax, eax
        jl near FindClipIndex_55
        cmp eax, dword [byte ebp-020h]
        jge near FindClipIndex_55
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 10Eh
        call QueueSpeechClip
        mov edx, 172h
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, 17Ah
        call QueueSpeechClip
        cmp dword [byte ebp-01Ch], byte 0
        jne short .55
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        test edx, edx
        je short .54
        mov edx, 7
.54:
        mov eax, dword [byte ebp-01Ch]
        add eax, 186h
        add edx, eax
        jmp near PaEvent_965.91
.55:
        mov edx, dword [byte ebp-01Ch]
        xor eax, eax
        add edx, 186h
        jmp near PaEvent_965.92
PaEvent_6BB:
        mov edx, eax
        mov eax, dword [byte eax-04h]
        mov dword [byte ebp-020h], eax
        test eax, eax
        jl short .56
        cmp eax, byte 2
        jle short .57
.56:
        xor ebx, ebx
.57:
        test ebx, ebx
        je near FindClipIndex_55
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-01Ch], eax
        test eax, eax
        jle near FindClipIndex_55
        cmp eax, dword [byte ebp-020h]
        jle near FindClipIndex_55
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, 10Eh
        call QueueSpeechClip
        mov edx, 173h
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, 17Ah
        call QueueSpeechClip
        jmp short PaEvent_61F.55
PaEvent_71D:
        mov eax, dword [byte eax-04h]
        mov dword [byte ebp-020h], eax
        test eax, eax
        jle near FindClipIndex_55
        cmp eax, byte 4
        jge near FindClipIndex_55
        xor eax, eax
        call QueueSpeechClip
        mov edx, 174h
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, 180h
        jmp near PaEvent_965.92
PaEvent_757:
        xor eax, eax
        call QueueSpeechClip
        mov edx, 175h
        jmp near PaEvent_965.91
PaEvent_768:
        xor eax, eax
        call QueueSpeechClip
        mov edx, 176h
        jmp near PaEvent_965.91
PaEvent_779:
        xor eax, eax
        call QueueSpeechClip
        mov edx, 177h
        jmp near PaEvent_965.91
PaEvent_78A:
        xor eax, eax
        call QueueSpeechClip
        mov edx, 178h
        jmp near PaEvent_965.91
PaEvent_79B:
        xor eax, eax
        call QueueSpeechClip
        mov edx, 179h
        jmp near PaEvent_965.91
PaEvent_7AC:
        cmp dword [dword_11D37E], byte 1
        jne near FindClipIndex_55
        mov eax, dword [byte eax-04h]
        mov dword [byte ebp-028h], eax
        test eax, eax
        jle near FindClipIndex_55
        cmp eax, byte 4
        jge short .58
        lea edx, [byte eax-01h]
        jmp near PaEvent_965.91
.58:
        mov edx, 3
        jmp near PaEvent_965.91
PaEvent_7DE:
        cmp dword [dword_11D37E], byte 1
        jne near FindClipIndex_55
        mov edx, eax
        mov eax, dword [byte eax-04h]
        mov ebx, 1
        mov dword [byte ebp-028h], eax
        test eax, eax
        jl short .59
        cmp eax, byte 1Ch
        jle short .60
.59:
        xor ebx, ebx
.60:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-024h], eax
        cmp eax, byte 1
        jl short .61
        cmp eax, byte 2
        jle short .62
.61:
        xor ebx, ebx
.62:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-020h], eax
        cmp eax, byte 1
        jl short .63
        cmp eax, byte 63h
        jle short .64
.63:
        xor ebx, ebx
.64:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-01Ch], eax
        test eax, eax
        jge short .65
        xor ebx, ebx
.65:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-018h], eax
        test eax, eax
        jl short .66
        cmp eax, byte 10h
        jle short .67
.66:
        xor ebx, ebx
.67:
        test ebx, ebx
        je short .72
        cmp dword [byte ebp-024h], byte 2
        jne short .72
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-014h], eax
        cmp eax, byte 1
        jl short .68
        cmp eax, byte 63h
        jle short .69
.68:
        xor ebx, ebx
.69:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-010h], eax
        test eax, eax
        jge short .70
        xor ebx, ebx
.70:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-0Ch], eax
        test eax, eax
        jl short .71
        cmp eax, byte 10h
        jle short .72
.71:
        xor ebx, ebx
.72:
        test ebx, ebx
        je near FindClipIndex_55
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, byte 20h
        call QueueSpeechClip
        cmp dword [byte ebp-024h], byte 1
        jne short .73
        mov edx, 58h
        jmp short .74
.73:
        mov edx, 59h
.74:
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, byte 59h
        call QueueSpeechClip
        cmp dword [byte ebp-01Ch], 0B16Ch
        jg short .75
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je short .75
        mov eax, dword [byte ebp-01Ch]
        mov ebx, 3Ch
        cdq
        idiv ebx
        lea edx, [dword eax+0BDh]
        xor eax, eax
        call QueueSpeechClip
.75:
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, 3B6h
        call QueueSpeechClip
        cmp dword [byte ebp-024h], byte 2
        jne near FindClipIndex_55
        mov edx, 3B4h
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-014h]
        xor eax, eax
        add edx, byte 59h
        call QueueSpeechClip
        cmp dword [byte ebp-010h], 0B16Ch
        jg short .76
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je short .76
        mov eax, dword [byte ebp-010h]
        mov ebx, 3Ch
        cdq
        idiv ebx
        lea edx, [dword eax+0BDh]
        xor eax, eax
        call QueueSpeechClip
.76:
        mov edx, dword [byte ebp-0Ch]
        xor eax, eax
        add edx, 3B6h
        jmp near PaEvent_965.92
PaEvent_965:
        cmp dword [dword_11D37E], byte 1
        jne near FindClipIndex_55
        mov edx, eax
        mov eax, dword [byte eax-04h]
        mov ebx, 1
        mov dword [byte ebp-028h], eax
        test eax, eax
        jl short .77
        cmp eax, byte 1Ch
        jle short .78
.77:
        xor ebx, ebx
.78:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-024h], eax
        test eax, eax
        jl short .79
        cmp eax, byte 1
        jle short .80
.79:
        xor ebx, ebx
.80:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-020h], eax
        test eax, eax
        jl short .81
        cmp eax, byte 63h
        jle short .82
.81:
        xor ebx, ebx
.82:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-01Ch], eax
        test eax, eax
        jge short .83
        xor ebx, ebx
.83:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-018h], eax
        test eax, eax
        jl short .84
        cmp eax, byte 63h
        jle short .85
.84:
        xor ebx, ebx
.85:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-014h], eax
        test eax, eax
        jge short .86
        xor ebx, ebx
.86:
        test ebx, ebx
        je near FindClipIndex_55
        mov edx, dword [byte ebp-028h]
        xor eax, eax
        add edx, byte 3Ch
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, byte 59h
        call QueueSpeechClip
        mov eax, dword [byte ebp-01Ch]
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov edx, dword [optflags]
        and edx, byte 0Ch
        cmp dword [byte ebp-024h], byte 0
        je near .94
        cmp dword [byte ebp-01Ch], 0B16Ch
        jg short .87
        cmp edx, byte 4
        je short .87
        lea edx, [dword eax+0BDh]
        xor eax, eax
        call QueueSpeechClip
.87:
        mov edx, 3B5h
        xor eax, eax
        call QueueSpeechClip
        cmp dword [byte ebp-014h], 0B16Ch
        jg short .93
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je short .93
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, 3C6h
        call QueueSpeechClip
.88:
        mov eax, dword [byte ebp-014h]
.89:
        mov ebx, 3Ch
        cdq
        idiv ebx
.90:
        lea edx, [dword eax+042Ah]
.91:
        xor eax, eax
.92:
        call QueueSpeechClip
        jmp near FindClipIndex_55
.93:
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, byte 59h
        jmp short .92
.94:
        cmp dword [byte ebp-01Ch], 0B16Ch
        jg near FindClipIndex_55
        cmp edx, byte 4
        je near FindClipIndex_55
        jmp short .90
PaEvent_AAB:
        cmp dword [dword_11D37E], byte 1
        jne near FindClipIndex_55
        mov edx, eax
        mov eax, dword [byte eax-04h]
        mov ebx, 1
        mov dword [byte ebp-028h], eax
        test eax, eax
        jl short .95
        cmp eax, byte 2
        jle short .96
.95:
        xor ebx, ebx
.96:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-024h], eax
        test eax, eax
        jl short .97
        cmp eax, byte 1Ch
        jle short .98
.97:
        xor ebx, ebx
.98:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-020h], eax
        cmp eax, byte 1
        jl short .99
        cmp eax, byte 63h
        jle short .100
.99:
        xor ebx, ebx
.100:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-01Ch], eax
        test eax, eax
        jge short .101
        xor ebx, ebx
.101:
        test ebx, ebx
        je short .107
        cmp dword [byte ebp-028h], byte 0
        jle short .107
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-018h], eax
        cmp eax, byte 1
        jl short .102
        cmp eax, byte 63h
        jle short .103
.102:
        xor ebx, ebx
.103:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-014h], eax
        test eax, eax
        jge short .104
        xor ebx, ebx
.104:
        cmp dword [byte ebp-028h], byte 1
        jle short .107
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-010h], eax
        cmp eax, byte 1
        jl short .105
        cmp eax, byte 63h
        jle short .106
.105:
        xor ebx, ebx
.106:
        mov eax, dword [edx]
        add edx, byte 4
        mov dword [byte ebp-0Ch], eax
        test eax, eax
        jge short .107
        xor ebx, ebx
.107:
        test ebx, ebx
        je near FindClipIndex_55
        mov edx, dword [byte ebp-024h]
        xor eax, eax
        add edx, byte 4
        call QueueSpeechClip
        mov edx, dword [byte ebp-020h]
        xor eax, eax
        add edx, 3C6h
        call QueueSpeechClip
        cmp dword [byte ebp-01Ch], 0B16Ch
        jg short .108
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je short .108
        mov eax, dword [byte ebp-01Ch]
        mov ebx, 3Ch
        cdq
        idiv ebx
        lea edx, [dword eax+042Ah]
        xor eax, eax
        call QueueSpeechClip
.108:
        cmp dword [byte ebp-028h], byte 0
        jle near FindClipIndex_55
        mov edx, 3B3h
        xor eax, eax
        call QueueSpeechClip
        cmp dword [byte ebp-028h], byte 1
        jle near .110
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, byte 59h
        call QueueSpeechClip
        cmp dword [byte ebp-014h], 0B16Ch
        jg short .109
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je short .109
        mov eax, dword [byte ebp-014h]
        mov ebx, 3Ch
        cdq
        idiv ebx
        lea edx, [dword eax+0BDh]
        xor eax, eax
        call QueueSpeechClip
.109:
        mov edx, 3B4h
        xor eax, eax
        call QueueSpeechClip
        mov edx, dword [byte ebp-010h]
        xor eax, eax
        add edx, 3C6h
        call QueueSpeechClip
        cmp dword [byte ebp-0Ch], 0B16Ch
        jg near FindClipIndex_55
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        je near FindClipIndex_55
        mov eax, dword [byte ebp-0Ch]
        jmp near PaEvent_965.89
.110:
        mov edx, dword [byte ebp-018h]
        xor eax, eax
        add edx, 3C6h
        call QueueSpeechClip
        cmp dword [byte ebp-014h], 0B16Ch
        jg near FindClipIndex_55
        mov eax, dword [optflags]
        and eax, byte 0Ch
        cmp eax, byte 4
        jne near PaEvent_965.88
        jmp near FindClipIndex_55
;-----------------------------------------------------------------------------
; StopSpeech                                                      686DF  96 PC
; Stops the driver's speech, clears the clip queue and cancels the channels'
; async reads; its tail (StopSpeech_207) starts the next queued clip
;-----------------------------------------------------------------------------
StopSpeech:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        cmp dword [sndcard], byte 0
        jl near FindClipIndex_56
        cmp dword [dword_11D37E], byte 0
        jl near FindClipIndex_56
        xor esi, esi
        cmp dword [sndcard], byte 0
        jl short .2
        cmp dword [dword_11D37E], byte 0
        jl short .2
        call sub_BFB53
        test eax, eax
        jne short .1
        cmp word [word_11D386], byte 0
        je short .2
.1:
        mov esi, 1
.2:
        test esi, esi
        je short .3
        call sub_BFB7C
.3:
        mov ecx, 120h
        mov edi, word_17C49C
        xor eax, eax
        rep stosb
        xor esi, esi
        mov word [word_11D386], 0
        mov word [word_11D382], 0
        mov word [word_11D384], 0
.4:
        cmp dword [dword esi+dword_17C5C4], byte 0
        je short .5
        push dword [dword esi+dword_17C5C4]
        call AsyncCancelRequest
        add esp, byte 4
        call asyncreader
.5:
        add esi, byte 14h
        cmp esi, byte 3Ch
        jne short .4
        call ResetSpeechChannels
        jmp near FindClipIndex_56
.6:
        imul esi, byte 14h
        cmp dword [dword esi+dword_17C5C4], byte 0
        je short .7
        push dword [dword esi+dword_17C5C4]
        mov word [word_11D23A], 1
        call AsyncRequestDone
        add esp, byte 4
        test eax, eax
        je near .11
        inc word [word_11D388]
        mov dword [dword esi+dword_17C5C4], 0
        jmp near .11
.7:
        cmp dword [dword esi+dword_17C5C8], byte 0
        je near .11
        cmp dword [dword esi+dword_17C5D0], byte 0
        jge near .10
        movsx eax, word [word_11D388]
        cmp eax, byte 3
        je short .8
        cmp word [word_11D386], byte 0
        je short .8
        call sub_BFB53
        test eax, eax
        je near .11
.8:
        movsx esi, word [byte ebp-04h]
        imul edi, esi, byte 14h
        imul eax, dword [dword edi+dword_17C5CC], byte 68h
        mov ebx, 2B11h
        mov cl, byte [dword_11D37E]
        shl ebx, cl
        cdq
        idiv ebx
        sub eax, dword [dword_17C5FC]
        add eax, byte 0Fh
        mov dword [dword edi+dword_17C5D0], eax
        lea eax, [byte esi+02h]
        mov ebx, 3
        cdq
        idiv ebx
        movsx esi, dx
        imul esi, byte 14h
        cmp dword [dword esi+dword_17C5C8], byte 0
        je short .9
        cmp dword [dword esi+dword_17C5D0], byte 0
        jle short .9
        call GetTicks
        cmp eax, dword [dword esi+dword_17C5D0]
        jge short .9
        call GetTicks
        mov edx, dword [dword esi+dword_17C5D0]
        sub edx, eax
        lea eax, [byte edx-0Fh]
        add dword [dword edi+dword_17C5D0], eax
.9:
        movsx esi, word [byte ebp-04h]
        imul esi, byte 14h
        mov edx, dword [dword_17C5FC]
        mov eax, dword [dword esi+dword_17C5C8]
        call sub_BFAF5
        call sub_BFB74
        call GetTicks
        add dword [dword esi+dword_17C5D0], eax
        jmp short .11
.10:
        call GetTicks
        cmp eax, dword [dword esi+dword_17C5D0]
        jle short .11
        dec word [word_17C640]
        mov dword [dword esi+dword_17C5C8], 0
        dec word [word_11D388]
        mov dword [dword esi+dword_17C5D0], 0FFFFFFFFh
.11:
        inc dword [byte ebp-04h]
StopSpeech_1FA:
        movsx esi, word [byte ebp-04h]
        cmp esi, byte 3
        jl near StopSpeech.6
StopSpeech_207:
        movsx eax, word [word_17C640]
        cmp eax, byte 3
        jge near FindClipIndex_55
        cmp word [word_11D386], byte 0
        je near FindClipIndex_55
        mov ebx, 3
        mov si, word [word_17C63E]
.12:
        movsx edx, si
        imul eax, edx, byte 14h
        cmp dword [dword eax+dword_17C5C4], byte 0
        je short .13
        cmp dword [dword eax+dword_17C5C8], byte 0
        je short .13
        lea eax, [byte edx+01h]
        cdq
        idiv ebx
        mov esi, edx
        jmp short .12
.13:
        movsx eax, word [word_11D382]
        inc eax
        mov ebx, 18h
        cdq
        idiv ebx
        movsx eax, dx
        imul eax, byte 0Ch
        mov word [word_11D382], dx
        movsx edx, si
        imul esi, edx, byte 14h
        movsx edi, word [dword eax+word_17C49C]
        mov dword [dword esi+dword_17C5C0], edi
        imul edi, edx, dword 1CE4Eh
        mov edx, dword [dword_11D37A]
        add edx, edi
        mov dword [dword esi+dword_17C5C8], edx
        mov edx, dword [dword eax+dword_17C4A4]
        push edx
        push dword [dword esi+dword_17C5C8]
        mov dword [dword esi+dword_17C5D0], 0FFFFFFFFh
        push dword [dword eax+dword_17C4A0]
        mov dword [dword esi+dword_17C5CC], edx
        call AsyncRequestSection
        mov dword [dword esi+dword_17C5C4], eax
        movsx eax, word [word_17C63E]
        inc eax
        mov ebx, 3
        cdq
        idiv ebx
        inc word [word_17C640]
        dec word [word_11D386]
        add esp, byte 0Ch
        mov word [word_17C63E], dx
        jmp near StopSpeech_207
