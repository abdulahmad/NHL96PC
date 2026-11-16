; Digital sound effects, crowd noise, arena clips, the sound card start-up, the game and front-end sound banks and the sound idle call (96 PC).
bits 32
%include "hockey.inc"
section s_68D25 progbits alloc exec nowrite align=1
extern AsyncClose, AsyncInit, asyncreader, byte_11D1DE, byte_11D392, byte_17CA1D, byte_17CA1E, byte_17CA1F
extern byte_17CA5D, CdStreamNextPacket, CdStreamOpenDefault, CdStreamQueue, delstream, dword_11D1C8, dword_11D1CC, dword_11D1D2
extern dword_11D1D6, SpeechStreamFile, SpeechStreamTimer, dword_11D1EA, dword_11D1EE, dword_11D1F2, dword_11D1F6, dword_11D1FA
extern dword_11D1FE, dword_11D202, dword_11D206, dword_11D236, dword_11D37E, dword_11D3A6, dword_11D3AA, dword_11D3AE
extern dword_11D3B2, dword_17C604, dword_17C608, FadeOutMusic, FeedMusicStream, FindClipIndex_55, FindTeamPairClip_85, GetTicks
extern globalset, InitSpeech, MakeDataPath, OpenSpeechBanks, optblock, setstreamspeed, SetTickDeadline, ShutdownSpeech
extern sndcard, SndSetDriver, StopSpeech, StopSpeech_1FA, StopSpeech_207, LoadDataFileFlag0, LoadDataFileHandle, FreeMemBlock
extern MemLargestFreeLocked, MemLargestFreeOfList, DriveLetterIndex, IsCdDrive, AllocCdBuffer, SpeechQueueBusy, FadeChannelVolume, SetChannelVolume
extern StopSoundChannel, InitAudioStream, StartAudioStream, FeedAudioStream, AudioStreamPosition, RegisterSfxBank, UnregisterSfxBank, PlaySfxVolume
extern PauseCrowdChannels, ResumeCrowdChannels, TriggerCrowdEvent, SetCrowdIntensity, CloseCrowdSound, LoadCrowdBank, SetCrowdVolume, StartCrowdSound
extern StopCrowdChannels, DetectSoundDriver, SetSoundMixMode, SndCloseDriver, TicksSinceLast, unk_17C474, WaitTickDeadline, word_11D1D0
extern word_11D23A, word_11D23C, word_11D386, lastsfx, word_11D3A4, word_11D3B6, word_17C640
global StopAllSfx, StopAllSfx_8D, StopAllSfx_BA, StopAllSfx_BF, StopAllSfx_F7, PlaySfxOr, PlaySfx, Crowd_Noise
global CrowdNoiseReset, GetCrowdTarget, SetCrowdTarget, CrowdPause, CrowdResume, CrowdFadeOut, sfx, sfx_3B
global CrowdReaction, PlayArenaClip, ArenaClipService, ArenaClipReady, StartArenaClip, StopArenaClip, GetSoundCard, jpt_693BF
global TestCdSpeed, jpt_694A1, StartSoundCard, StartSoundCard_23, StartSoundCard_2A, StartSoundCard_31, StartSoundCard_38, StartSoundCard_3F
global StartGameSound, EndGameSound, ShutdownSound, SoundSecondsToBytes, SoundIdle, SpeechService, SpeechService_58, SpeechService_6B
;-----------------------------------------------------------------------------
; StopAllSfx                                   68D25  96 PC, medium confidence
; With a sound effect bank loaded, stops every sound effect voice that is
; playing (16, byte_11D392)
;-----------------------------------------------------------------------------
StopAllSfx:
        push edx
        cmp dword [sndcard], byte 0
        jl short .4
        cmp dword [SpeechStreamFile], byte 0
        jge short .1
        cmp dword [SpeechStreamTimer], byte 0
        jge short .1
        cmp dword [dword_11D1EA], byte 0
        jge short .1
        cmp dword [dword_11D1EE], byte 0
        jl short .4
.1:
        xor edx, edx
.2:
        cmp byte [dword edx+byte_11D392], 0
        je short .3
        mov eax, edx
        call StopSoundChannel
        mov byte [dword edx+byte_11D392], 0
.3:
        inc edx
        cmp edx, byte 10h
        jl short .2
.4:
        pop edx
.5:
        ret
        cmp dword [sndcard], byte 0
        jl short .5
        cmp dword [SpeechStreamFile], byte 0
        jge near StopSoundChannel
        cmp dword [SpeechStreamTimer], byte 0
        jge near StopSoundChannel
        cmp dword [dword_11D1EA], byte 0
        jge near StopSoundChannel
        cmp dword [dword_11D1EE], byte 0
        jl short .5
        jmp near StopSoundChannel
StopAllSfx_8D:
        cmp dword [SpeechStreamFile], byte 0
        jge short .6
        cmp dword [SpeechStreamTimer], byte 0
        jge short .6
        cmp dword [dword_11D1EA], byte 0
        jge short .6
        cmp dword [dword_11D1EE], byte 0
        jl short StopAllSfx_BF
.6:
        test byte [byte_17CA1E], 10h
        je short StopAllSfx_BF
StopAllSfx_BA:
        mov eax, 1
StopAllSfx_BF:
        test eax, eax
        je short StopAllSfx_F7
        mov edx, dword [globalset]
        shl edx, 4
        shr edx, 19h
        mov eax, ebx
        add edx, byte 28h
        call PlaySfxVolume
        mov edx, eax
        test eax, eax
        jl short StopAllSfx_F7
        cmp eax, byte 10h
        jge short StopAllSfx_F7
        mov byte [dword eax+byte_11D392], 1
        cmp ebx, byte 2Eh
        jge short StopAllSfx_F7
        mov word [lastsfx], bx
StopAllSfx_F7:
        mov eax, edx
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlaySfxOr                                    68E21  96 PC, medium confidence
; (id, other): plays other instead of id when id is 40h+ and the extra bank
; (dword_11D1F2) is not loaded
;-----------------------------------------------------------------------------
PlaySfxOr:
        cmp eax, byte 40h
        jl short PlaySfx
        cmp dword [dword_11D1F2], byte 0
        jge short PlaySfx
        mov eax, edx
;-----------------------------------------------------------------------------
; PlaySfx                                                         68E31  96 PC
; (id 1-48h): plays a digital sound effect from the loaded banks on a free
; voice at the globalset volume; called from checkcheck, FallDown, CompPass,
; the faceoff and the menus
;-----------------------------------------------------------------------------
PlaySfx:
        push ebx
        push edx
        mov ebx, eax
        mov edx, 0FFFFFFFFh
        xor eax, eax
        cmp dword [sndcard], byte 0
        jl short StopAllSfx_F7
        test ebx, ebx
        jle short StopAllSfx_F7
        cmp ebx, byte 49h
        jge short StopAllSfx_F7
        cmp ebx, byte 40h
        jl near StopAllSfx_8D
        cmp dword [dword_11D1F2], byte 0
        jl short StopAllSfx_BF
        test byte [byte_17CA1E], 10h
        je near StopAllSfx_BF
        jmp near StopAllSfx_BA
;-----------------------------------------------------------------------------
; Crowd_Noise                                  68E72  96 PC, medium confidence
; (step): eases the crowd level (dword_11D1FE) toward its target by at most
; step and sets it in the crowd driver (the 95 PC Crowd_Noise job)
;-----------------------------------------------------------------------------
Crowd_Noise:
        push edx
        cmp dword [sndcard], byte 0
        jl short .5
        cmp dword [dword_11D1FA], byte 0
        je short .5
        mov edx, dword [dword_11D1FE]
        sub edx, dword [dword_11D202]
        test edx, edx
        jge short .1
        neg edx
.1:
        cmp edx, eax
        jge short .2
        mov eax, dword [dword_11D202]
        mov dword [dword_11D1FE], eax
        jmp short .4
.2:
        mov edx, dword [dword_11D202]
        cmp edx, dword [dword_11D1FE]
        jg short .3
        neg eax
.3:
        add dword [dword_11D1FE], eax
        mov eax, dword [dword_11D1FE]
.4:
        call SetCrowdVolume
.5:
        pop edx
        ret
;-----------------------------------------------------------------------------
; CrowdNoiseReset                              68EC9  95 PC, medium confidence
; Clears crowdsmooth, crowdvol8, crowdvol7 (called with crowdlevel = 0 at
; game start)
;-----------------------------------------------------------------------------
CrowdNoiseReset:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp dword [sndcard], byte 0
        jl near .4
        cmp dword [dword_11D1F6], byte 0
        je near .4
        cmp dword [dword_11D1FA], byte 0
        jne near .4
        test byte [byte_17CA1F], 10h
        je near .4
        cmp dword [dword_11D1FA], byte 0
        jne short .1
        mov eax, 1
        mov dword [dword_11D1FE], 1
        call StartCrowdSound
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        mov eax, 1
        call SetCrowdVolume
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        xor eax, eax
        call SetCrowdIntensity
        mov dword [dword_11D1FA], 1
.1:
        cmp esi, byte 1
        jge short .2
        mov esi, 1
.2:
        mov eax, dword [optblock]
        and eax, byte 7Fh
        cmp esi, eax
        jbe short .3
        mov esi, eax
.3:
        mov dword [dword_11D202], esi
.4:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetCrowdTarget                                                  68F7C  96 PC
; The crowd level target (dword_11D202)
;-----------------------------------------------------------------------------
GetCrowdTarget:
        mov eax, dword [dword_11D202]
        ret
;-----------------------------------------------------------------------------
; SetCrowdTarget                                                  68F82  96 PC
; (level): sets the crowd target, clamped 1 to the crowd volume (optblock &
; 7Fh)
;-----------------------------------------------------------------------------
SetCrowdTarget:
        push edx
        cmp dword [sndcard], byte 0
        jl short .3
        cmp dword [dword_11D1FA], byte 0
        je short .3
        cmp eax, byte 1
        jge short .1
        mov eax, 1
.1:
        mov edx, dword [optblock]
        and edx, byte 7Fh
        cmp eax, edx
        jbe short .2
        mov eax, edx
.2:
        mov dword [dword_11D202], eax
.3:
        pop edx
        ret
;-----------------------------------------------------------------------------
; CrowdPause                                   68FB5  96 PC, medium confidence
; Pauses the crowd noise once (word_11D3A4)
;-----------------------------------------------------------------------------
CrowdPause:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl short .1
        cmp dword [dword_11D1FA], byte 0
        je short .1
        cmp dword [dword_11D1FE], byte 0
        jl short .1
        cmp word [word_11D3A4], byte 0
        jne short .1
        mov word [word_11D3A4], 1
        call PauseCrowdChannels
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CrowdResume                                  68FFE  96 PC, medium confidence
; Resumes the crowd noise CrowdPause paused
;-----------------------------------------------------------------------------
CrowdResume:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl short .1
        cmp dword [dword_11D1FA], byte 0
        je short .1
        cmp dword [dword_11D1FE], byte 0
        jl short .1
        cmp word [word_11D3A4], byte 0
        je short .1
        mov eax, 1
        call ResumeCrowdChannels
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        mov word [word_11D3A4], 0
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CrowdFadeOut                                                    6904C  96 PC
; (ticks): fades the crowd from its level to 0 over ticks, then stops it
;-----------------------------------------------------------------------------
CrowdFadeOut:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        cmp dword [sndcard], byte 0
        jl near FindClipIndex_55
        cmp dword [dword_11D1FA], byte 0
        je near FindClipIndex_55
        test eax, eax
        je short .4
        call TicksSinceLast
        mov eax, dword [dword_11D1FE]
        xor edi, edi
        mov dword [byte ebp-04h], eax
.1:
        call TicksSinceLast
        add edi, eax
        mov eax, dword [byte ebp-04h]
        imul eax, edi
        cdq
        idiv esi
        mov edx, dword [byte ebp-04h]
        sub edx, eax
        test edx, edx
        jge short .2
        xor edx, edx
.2:
        mov eax, edx
        call SetCrowdVolume
        cmp edi, esi
        jge short .3
        test edx, edx
        jg short .1
.3:
        call StopCrowdChannels
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        mov dword [dword_11D1FA], 0
.4:
        call StopCrowdChannels
        mov dword [dword_11D1FA], 0
        mov dword [dword_11D1FE], 0
        jmp near FindClipIndex_55
        cmp dword [sndcard], byte 0
        jl short .5
        cmp dword [dword_11D1F6], byte 0
        je short .5
        mov eax, dword [dword_11D1FA]
        ret
.5:
        xor eax, eax
        ret
;-----------------------------------------------------------------------------
; sfx                               69105  94G middle94.asm, medium confidence
; Play sound effect id (remembered in lastsfx): while speech plays only 9Ch
; passes (and in a replay only with oneminsaid); A0h/A1h not on sound devices
; 4/8; 7Dh raises crowdlevel by 500; AAh on device 4 starts sample
; dword_ED7A4; 90h also plays 91h (both on device 4).
;-----------------------------------------------------------------------------
sfx:
        push ecx
        push edx
        test eax, eax
        jl short .1
        cmp eax, byte 0Dh
        jge short .1
        mov edx, 1
        mov cl, al
        shl edx, cl
        test dword [dword_11D3A6], edx
        jne short .1
        or dword [dword_11D3A6], edx
        cmp dword [sndcard], byte 0
        jl short .1
        cmp dword [dword_11D1FA], byte 0
        je short .1
        call TriggerCrowdEvent
.1:
        pop edx
        pop ecx
sfx_3B:
        ret
;-----------------------------------------------------------------------------
; CrowdReaction                                   69141  96 PC, low confidence
; (0-7Fh): passes a crowd reaction level to the crowd driver (goals, hits,
; shots)
;-----------------------------------------------------------------------------
CrowdReaction:
        cmp dword [sndcard], byte 0
        jl short sfx_3B
        cmp dword [dword_11D1FA], byte 0
        je short sfx_3B
        test eax, eax
        jl short sfx_3B
        cmp eax, byte 7Fh
        jg short sfx_3B
        jmp near SetCrowdIntensity
;-----------------------------------------------------------------------------
; PlayArenaClip                                69161  96 PC, medium confidence
; (file id): with arena music on (optblock 80h) queues an arena clip on its
; CD stream (stoppages, goals, penalty box); clips 3Ch, 3Dh, 40h cut speech
; off
;-----------------------------------------------------------------------------
PlayArenaClip:
        push ebx
        push ecx
        push edx
        mov edx, eax
        xor ebx, ebx
        cmp dword [dword_11D1D6], byte 0
        je near .6
        cmp dword [sndcard], byte 0
        jl near .6
        test byte [optblock], 80h
        je near .6
        cmp dword [dword_11D3AA], byte 0
        jne near .6
        mov ebx, 1
        xor ecx, ecx
        cmp dword [sndcard], byte 0
        jl short .2
        cmp dword [dword_11D37E], byte 0
        jl short .2
        call SpeechQueueBusy
        test eax, eax
        jne short .1
        cmp word [word_11D386], byte 0
        je short .2
.1:
        mov ecx, 1
.2:
        test ecx, ecx
        je short .5
        cmp edx, byte 40h
        je short .3
        cmp edx, byte 3Ch
        je short .3
        cmp edx, byte 3Dh
        jne short .4
.3:
        call StopSpeech
        jmp short .5
.4:
        xor ebx, ebx
.5:
        test ebx, ebx
        je short .6
        mov eax, unk_17C474
        mov dword [dword_11D3B2], edx
        call MakeDataPath
        push unk_17C474
        push dword [dword_11D1D6]
        call CdStreamQueue
        add esp, byte 8
        mov eax, dword [dword_11D1D6]
        mov ebx, 1
        call InitAudioStream
        mov dword [dword_11D3AA], 2
        mov dword [dword_17C608], eax
.6:
        mov eax, ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ArenaClipService                             69234  96 PC, medium confidence
; Runs the arena clip stream (start, feed, end), from SoundIdle
;-----------------------------------------------------------------------------
ArenaClipService:
        push ebx
        push ecx
        push edx
        push esi
        cmp dword [dword_11D3AA], byte 0
        jle near .5
        cmp dword [dword_11D3AA], byte 1
        jle near .4
        push dword [dword_11D1D6]
        call CdStreamNextPacket
        add esp, byte 4
        mov esi, eax
        cmp eax, byte 0FFFFFFFDh
        jl short .1
        test eax, eax
        jle short .2
.1:
        mov eax, esi
        call FeedAudioStream
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        cmp eax, byte 0FFFFFFFFh
        jne short .5
        cmp dword [dword_11D3AA], byte 4
        jge short .3
        mov dword [dword_11D3AA], 3
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        xor eax, eax
        mov dword [dword_11D3AA], 1
        call AudioStreamPosition
        imul eax, byte 64h
        mov esi, 55F0h
        cdq
        idiv esi
        mov esi, eax
        call GetTicks
        add eax, esi
        mov dword [dword_11D3AE], eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        call GetTicks
        cmp eax, dword [dword_11D3AE]
        jle short .5
        mov eax, dword [dword_17C608]
        call StopSoundChannel
        mov dword [dword_11D3AA], 0
.5:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ArenaClipReady                                  692E9  96 PC, low confidence
; 1 when the arena clip has 2AF8h bytes buffered
;-----------------------------------------------------------------------------
ArenaClipReady:
        cmp dword [dword_11D3AA], byte 2
        jl short .1
        cmp dword [dword_11D3AA], byte 4
        jge short .1
        xor eax, eax
        call AudioStreamPosition
        cmp eax, 2AF8h
        jl short .1
        mov eax, 1
        ret
.1:
        xor eax, eax
        ret
;-----------------------------------------------------------------------------
; StartArenaClip                               69312  96 PC, medium confidence
; Starts the buffered arena clip at the optblock volume (state 4)
;-----------------------------------------------------------------------------
StartArenaClip:
        push edx
        cmp dword [dword_11D3AA], byte 1
        jle short .1
        cmp dword [dword_11D3AA], byte 4
        jge short .1
        call StartAudioStream
        mov eax, dword [optblock]
        shl eax, 11h
        shr eax, 19h
        lea edx, [byte eax+028h]
        mov eax, dword [dword_17C608]
        call SetChannelVolume
        mov dword [dword_11D3AA], 4
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; StopArenaClip                                                   6934E  96 PC
; (ticks): stops the arena clip, or fades it over ticks
;-----------------------------------------------------------------------------
StopArenaClip:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp dword [dword_11D3AA], byte 1
        jle short .3
        cmp dword [dword_11D3AA], byte 4
        jl short .1
        test eax, eax
        jne short .2
.1:
        mov eax, dword [dword_17C608]
        call StopSoundChannel
        mov dword [dword_11D3AE], 0
        mov dword [dword_11D3AA], 0
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov ebx, 0FFFFFFFFh
        mov eax, dword [dword_17C608]
        mov edx, esi
        call FadeChannelVolume
        call GetTicks
        add eax, esi
        mov dword [dword_11D3AA], 1
        mov dword [dword_11D3AE], eax
.3:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetSoundCard                                                    693B9  96 PC
; Returns sndcard
;-----------------------------------------------------------------------------
GetSoundCard:
        mov eax, dword [sndcard]
        ret
jpt_693BF:
        dd .4
        dd .5
        dd .1
        dd .2
        dd .3
        push edx
        mov edx, eax
        mov eax, 1
        call DetectSoundDriver
        dec eax
        cmp eax, byte 4
        ja short .6
        jmp dword [nosplit cs:eax*4+jpt_693BF]
.1:
        mov dword [edx], 1
        pop edx
        ret
.2:
        mov dword [edx], 2
        pop edx
        ret
.3:
        mov dword [edx], 3
        pop edx
        ret
.4:
        mov dword [edx], 5
        pop edx
        ret
.5:
        mov dword [edx], 6
        pop edx
        ret
.6:
        mov dword [edx], 0
        pop edx
        ret
;-----------------------------------------------------------------------------
; TestCdSpeed                                     6941E  96 PC, low confidence
; At start-up: checks the CD drive and measures its read speed
; (setstreamspeed > 7A120h sets word_11D1D0)
;-----------------------------------------------------------------------------
TestCdSpeed:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        cmp word [word_11D3B6], byte 0
        jne near FindTeamPairClip_85
        push eax
        call DriveLetterIndex
        add esp, byte 4
        push eax
        mov esi, eax
        call IsCdDrive
        mov word [word_11D1D0], 0
        add esp, byte 4
        mov word [word_11D23C], ax
        test ax, ax
        je short .1
        push byte 0
        push esi
        call AllocCdBuffer
        add esp, byte 8
        jmp short .2
.1:
        mov word [word_11D1D0], 1
.2:
        push dword [byte ebp-04h]
        push edi
        call setstreamspeed
        add esp, byte 8
        cmp eax, 7A120h
        jle short .3
        mov word [word_11D1D0], 1
.3:
        mov word [word_11D3B6], 1
        jmp near FindTeamPairClip_85
jpt_694A1:
        dd StartSoundCard_23
        dd StartSoundCard_2A
        dd StartSoundCard_31
        dd StartSoundCard_31
        dd StartSoundCard_38
        dd StartSoundCard_3F
;-----------------------------------------------------------------------------
; StartSoundCard                               694B9  96 PC, medium confidence
; Picks the driver for the card in globalset and starts it through
; SndSetDriver
;-----------------------------------------------------------------------------
StartSoundCard:
        push ebx
        push ecx
        push esi
        push edi
        mov esi, eax
        mov edi, edx
        test eax, eax
        jle near StartSoundCard_3F.5
        mov dword [dword_11D1CC], eax
        dec eax
        cmp eax, byte 5
        ja short StartSoundCard_3F.1
        jmp dword [nosplit cs:eax*4+jpt_694A1]
StartSoundCard_23:
        mov esi, 3
        jmp short StartSoundCard_3F.1
StartSoundCard_2A:
        mov esi, 4
        jmp short StartSoundCard_3F.1
StartSoundCard_31:
        mov esi, 5
        jmp short StartSoundCard_3F.1
StartSoundCard_38:
        mov esi, 1
        jmp short StartSoundCard_3F.1
StartSoundCard_3F:
        mov esi, 2
.1:
        cmp edi, byte 1
        jne short .2
        mov eax, edi
        call SetSoundMixMode
.2:
        mov edx, 0FFFFFFFFh
        mov eax, esi
        call SndSetDriver
        test eax, eax
        jl near .5
        push byte 20h
        push dword 2000h
        push byte 18h
        call AsyncInit
        add esp, byte 0Ch
        mov dword [sndcard], esi
        mov dword [dword_11D1C8], edi
        cmp dword [SpeechStreamFile], byte 0
        jge short .3
        mov edx, 20h
        mov eax, 30h
        call LoadDataFileHandle
        test eax, eax
        je short .3
        call RegisterSfxBank
        mov dword [SpeechStreamFile], eax
.3:
        call InitSpeech
        push byte 20h
        push dword 2000h
        push dword 35B60h
        call CdStreamOpenDefault
        mov dword [byte_11D1DE], 0
        add esp, byte 0Ch
        mov dword [dword_11D1D2], eax
        cmp dword [SpeechStreamTimer], byte 0
        jge short .4
        mov eax, 31h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .4
        call RegisterSfxBank
        mov dword [SpeechStreamTimer], eax
.4:
        mov dword [dword_11D236], 0
        jmp short .6
.5:
        mov dword [sndcard], 0FFFFFFFFh
.6:
        mov eax, dword [sndcard]
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; StartGameSound                                                  695CB  96 PC
; Going into a game: drops the front-end music and banks, opens the game
; speech banks, the arena stream, the sound effect and crowd banks by free
; memory
;-----------------------------------------------------------------------------
StartGameSound:
        push ebx
        push ecx
        push edx
        push esi
        cmp dword [sndcard], byte 0
        jl near .22
        cmp dword [dword_11D236], byte 0
        jne near .22
        cmp dword [SpeechStreamTimer], byte 0
        jl short .1
        call StopAllSfx
        mov eax, dword [SpeechStreamTimer]
        call UnregisterSfxBank
        mov dword [SpeechStreamTimer], 0FFFFFFFFh
.1:
        mov eax, 50h
        xor edx, edx
        call FadeOutMusic
        cmp dword [sndcard], byte 0
        jl short .2
        test byte [byte_11D1DE], 1
        je short .2
        test byte [byte_11D1DE], 4
        je short .2
        mov eax, dword [dword_17C604]
        call StopSoundChannel
        mov dword [byte_11D1DE], 0FFFFFFFBh
.2:
        push dword [dword_11D1D2]
        mov dword [byte_11D1DE], 0
        call delstream
        add esp, byte 4
        mov dword [dword_11D1D2], 0
        call StopSpeech
        mov eax, 1
        call OpenSpeechBanks
        push byte 0
        push dword 2000h
        push dword 157C0h
        call CdStreamOpenDefault
        add esp, byte 0Ch
        push byte 0
        mov dword [dword_11D1D6], eax
        call MemLargestFreeOfList
        add esp, byte 4
        cmp eax, 600000h
        jle short .3
        mov esi, 2
        jmp short .5
.3:
        test byte [byte_17CA5D], 20h
        je short .4
        xor esi, esi
        jmp short .5
.4:
        mov esi, 1
.5:
        cmp esi, byte 2
        jne short .6
        mov eax, 34h
        jmp short .8
.6:
        cmp esi, byte 1
        jne short .7
        mov eax, 37h
        jmp short .8
.7:
        mov eax, 3Ah
.8:
        xor edx, edx
        call LoadDataFileFlag0
        mov dword [dword_11D206], eax
        call MemLargestFreeLocked
        cmp eax, 500000h
        jle short .9
        mov eax, 3Bh
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .9
        cmp dword [dword_11D1F2], byte 0FFFFFFFFh
        jne short .9
        call RegisterSfxBank
        mov dword [dword_11D1F2], eax
.9:
        cmp esi, byte 2
        jne short .12
        mov eax, 32h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .10
        cmp dword [dword_11D1EA], byte 0FFFFFFFFh
        jne short .10
        call RegisterSfxBank
        mov dword [dword_11D1EA], eax
.10:
        mov eax, 33h
.11:
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je near .17
        cmp dword [dword_11D1EE], byte 0FFFFFFFFh
        jne near .17
        jmp near .16
.12:
        cmp esi, byte 1
        jne short .14
        mov eax, 35h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .13
        cmp dword [dword_11D1EA], byte 0FFFFFFFFh
        jne short .13
        call RegisterSfxBank
        mov dword [dword_11D1EA], eax
.13:
        mov eax, 36h
        jmp short .11
.14:
        mov eax, 38h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .15
        cmp dword [dword_11D1EA], byte 0FFFFFFFFh
        jne short .15
        call RegisterSfxBank
        mov dword [dword_11D1EA], eax
.15:
        mov eax, 39h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .17
        cmp dword [dword_11D1EE], byte 0FFFFFFFFh
        jne short .17
.16:
        call RegisterSfxBank
        mov dword [dword_11D1EE], eax
.17:
        cmp dword [dword_11D206], byte 0
        je near .21
        mov eax, dword [dword_11D206]
        call LoadCrowdBank
        test eax, eax
        jl short .18
        mov dword [dword_11D1F6], 1
.18:
        mov esi, 1
        cmp dword [sndcard], byte 0
        jl short .20
        cmp dword [dword_11D1FA], byte 0
        je short .20
        mov eax, dword [optblock]
        and eax, byte 7Fh
        cmp eax, esi
        jae short .19
        mov esi, eax
.19:
        mov dword [dword_11D202], esi
.20:
        mov dword [dword_11D1FE], 1
        mov eax, 7Fh
        mov dword [dword_11D202], 2
        call Crowd_Noise
        push byte 5
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
.21:
        mov dword [byte_11D1DE], 0
        mov dword [dword_11D236], 1
.22:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; EndGameSound                                                    6986B  96 PC
; Back to the front end: frees the game sound banks and crowd, opens the
; front-end speech banks and the music stream
;-----------------------------------------------------------------------------
EndGameSound:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl near .8
        cmp dword [dword_11D236], byte 0
        je near .8
        cmp dword [dword_11D1D6], byte 0
        je short .1
        xor eax, eax
        call StopArenaClip
        push dword [dword_11D1D6]
        call delstream
        mov dword [dword_11D1D6], 0
        mov dword [byte_11D1DE], 0
        add esp, byte 4
.1:
        cmp dword [dword_11D1EE], byte 0
        jl short .2
        call StopAllSfx
        mov eax, dword [dword_11D1EE]
        call UnregisterSfxBank
        mov dword [dword_11D1EE], 0FFFFFFFFh
.2:
        cmp dword [dword_11D1EA], byte 0
        jl short .3
        call StopAllSfx
        mov eax, dword [dword_11D1EA]
        call UnregisterSfxBank
        mov dword [dword_11D1EA], 0FFFFFFFFh
.3:
        cmp dword [dword_11D206], byte 0
        je short .6
        cmp dword [dword_11D1FA], byte 0
        je short .4
        call StopCrowdChannels
        mov dword [dword_11D1FA], 0
.4:
        cmp dword [dword_11D1F6], byte 0
        je short .5
        call CloseCrowdSound
        mov dword [dword_11D1F6], 0
.5:
        push dword [dword_11D206]
        call FreeMemBlock
        mov dword [dword_11D206], 0
        add esp, byte 4
.6:
        cmp dword [dword_11D1F2], byte 0
        jl short .7
        call StopAllSfx
        mov eax, dword [dword_11D1F2]
        call UnregisterSfxBank
        mov dword [dword_11D1F2], 0FFFFFFFFh
.7:
        mov dword [dword_11D236], 0
        call StopSpeech
        xor eax, eax
        call OpenSpeechBanks
        push byte 20h
        push dword 2000h
        push dword 35B60h
        call CdStreamOpenDefault
        add esp, byte 0Ch
        mov dword [dword_11D1D2], eax
        cmp dword [SpeechStreamTimer], byte 0
        jge short .8
        mov eax, 31h
        xor edx, edx
        call LoadDataFileHandle
        test eax, eax
        je short .8
        cmp dword [SpeechStreamTimer], byte 0FFFFFFFFh
        jne short .8
        call RegisterSfxBank
        mov dword [SpeechStreamTimer], eax
.8:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShutdownSound                                                   699D0  96 PC
; From ShutDown: ShutdownSpeech, frees the sound effect banks, fades and
; stops the music, AsyncClose
;-----------------------------------------------------------------------------
ShutdownSound:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl near .4
        call ShutdownSpeech
        cmp dword [SpeechStreamTimer], byte 0
        jl short .1
        call StopAllSfx
        mov eax, dword [SpeechStreamTimer]
        call UnregisterSfxBank
        mov dword [SpeechStreamTimer], 0FFFFFFFFh
.1:
        cmp dword [SpeechStreamFile], byte 0
        jl short .2
        call StopAllSfx
        mov eax, dword [SpeechStreamFile]
        call UnregisterSfxBank
        mov dword [SpeechStreamFile], 0FFFFFFFFh
.2:
        mov eax, 50h
        xor edx, edx
        call FadeOutMusic
        cmp dword [sndcard], byte 0
        jl short .3
        test byte [byte_11D1DE], 1
        je short .3
        test byte [byte_11D1DE], 4
        je short .3
        mov eax, dword [dword_17C604]
        call StopSoundChannel
        mov dword [byte_11D1DE], 0FFFFFFFBh
.3:
        push dword [dword_11D1D2]
        mov dword [byte_11D1DE], 0
        call delstream
        add esp, byte 4
        mov dword [dword_11D1D2], 0
        call AsyncClose
        call SndCloseDriver
.4:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SoundSecondsToBytes                          69A94  96 PC, medium confidence
; Seconds x 55F0h (22000 bytes)
;-----------------------------------------------------------------------------
SoundSecondsToBytes:
        imul eax, dword 55F0h
        ret
;-----------------------------------------------------------------------------
; SoundIdle                                                       69A9B  96 PC
; The sound idle call made in every wait loop: arena clip, speech and music
; service
;-----------------------------------------------------------------------------
SoundIdle:
        cmp dword [dword_11D236], byte 0
        je short SpeechService_58
        call ArenaClipService
        cmp dword [dword_11D3AA], byte 0
        jne short SpeechService_6B
;-----------------------------------------------------------------------------
; SpeechService                                                   69AB2  96 PC
; Feeds the speech async reads and starts the next queued clip
;-----------------------------------------------------------------------------
SpeechService:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp dword [sndcard], byte 0
        jl near FindClipIndex_55
        test byte [byte_17CA1D], 10h
        je near FindClipIndex_55
        cmp dword [dword_11D37E], byte 0
        jl near FindClipIndex_55
        mov word [word_11D23A], 0
        cmp word [word_17C640], byte 0
        je near StopSpeech_207
        call asyncreader
        mov dword [byte ebp-04h], 0
        jmp near StopSpeech_1FA
SpeechService_58:
        call SpeechService
        cmp word [word_11D23A], byte 0
        je near FeedMusicStream
SpeechService_6B:
        ret
