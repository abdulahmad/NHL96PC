; TGV movies: open the movie and its audio stream, decode and show the frames, play a movie file between screens (96 PC).
bits 32
%include "hockey.inc"
section s_69B1E progbits alloc exec nowrite align=1
extern TgvStatus, CdStreamFreePacket, CdStreamNextPacket, CdStreamOpenDefault, CdStreamOpenSecondary, CdStreamStart, CloseMusic, delstream
extern TgvFpsSetting, TgvFlags, TgvStartTick, TgvPauseTick, dword_11F5C0, dword_11F5C4, TgvBufSize, TgvFrameCallback
extern MovieSkipped, TgvFrame, TgvHeaderRead, TgvState, TgvChunkLen, TgvAudioOn, TgvVideoOn, TgvDataPtr
extern TgvDataEnd, TgvChunkType, TgvLastFrame, TgvFramesDecoded, TgvAborted, TgvFileHandle, TgvAudioBuf, TgvAudioPos
extern TgvVideoBmp, TgvFrameTime, TgvMemBlock, FadeOutMusic, FillMusicStream, GetPressedDevice, GetSoundCard, GetTicks
extern globalset, MakeDataPath, OpenMusicStream, PlayMusic, QueueCurrentMusic, SetClipWindow, SetCrtcStart, setstreamspeed
extern SoundSecondsToBytes, StopMusic, str_TEMP, FadeOut, SetGraphicsMode, SetScreenMode, AllocMemBlock, FreeMemBlock
extern StopSoundChannel, InitAudioStream, StartAudioStream, FeedAudioStream, AudioStreamActive, AudioStreamPosition, AudioStreamPacketsPlayed, TgvAllocDecoder
extern TgvDecodeFrame, TgvFreeDecoder, TgvResetFrameRate, TgvBlitFrame, DisableInterrupts, EnableInterrupts, SetPaletteEntries8, bcopy
extern tgvpalpending, TgvFrameBuf, WaitRetrace, WaitTicks
global TgvClock, TgvOpen, TgvOpen_F9, PlayTGV, TgvNextFrame, TgvPlayFrames, PlayMovie, PlayMovieFile
;-----------------------------------------------------------------------------
; TgvClock                                     69B1E  96 PC, medium confidence
; The movie clock in 1/100 ticks, synced to the audio when the movie has
; sound
;-----------------------------------------------------------------------------
TgvClock:
        push ebx
        push ecx
        push edx
        cmp dword [TgvAborted], byte 0
        je short .2
        cmp dword [TgvVideoOn], byte 0
        je short .1
        cmp dword [TgvAudioOn], byte 0
        jne short .1
        call AudioStreamActive
        test eax, eax
        je short .1
        call GetTicks
        mov dword [TgvPauseTick], eax
        call AudioStreamPacketsPlayed
        mov dword [TgvStartTick], eax
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        call GetTicks
        sub eax, dword [TgvPauseTick]
        imul eax, dword [TgvFpsSetting]
        mov ebx, 64h
        cdq
        idiv ebx
        add eax, dword [TgvStartTick]
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        call GetTicks
        imul eax, dword [TgvFpsSetting]
        mov ebx, 64h
        cdq
        idiv ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; TgvOpen                                      69B99  96 PC, medium confidence
; Opens a TGV movie: TEMP buffer, its CD stream and the audio stream
;-----------------------------------------------------------------------------
TgvOpen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edi, eax
        call TgvAllocDecoder
        push byte 20h
        push dword 35C60h
        push str_TEMP
        mov dword [TgvVideoBmp], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 2000h
        push dword 7A120h
        mov esi, eax
        call CdStreamOpenDefault
        add esp, byte 0Ch
        push esi
        mov dword [TgvFileHandle], eax
        call FreeMemBlock
        add esp, byte 4
        push byte 20h
        push dword 35C60h
        push dword 0FFh
        push byte 31h
        call CdStreamOpenSecondary
        add esp, byte 10h
        push edi
        push dword [TgvFileHandle]
        mov dword [TgvMemBlock], eax
        call CdStreamStart
        add esp, byte 8
        cmp dword [TgvAborted], byte 0
        je short .1
        mov eax, dword [TgvMemBlock]
        call InitAudioStream
.1:
        call TgvClock
        mov dword [TgvDataPtr], eax
        call TgvResetFrameRate
        mov dword [TgvFramesDecoded], 0
        mov dword [tgvpalpending], 0
        mov dword [TgvAudioOn], 0
        mov dword [TgvState], 0
        mov dword [TgvChunkLen], 0
        mov dword [TgvVideoOn], 0
        mov dword [TgvHeaderRead], 0
        mov dword [TgvFrame], 0
        mov dword [TgvBufSize], 0
        mov dword [TgvStatus], 0
TgvOpen_F9:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlayTGV                                      69C98  96 PC, medium confidence
; Plays a TGV movie (ends with WaitTicks(1))
;-----------------------------------------------------------------------------
PlayTGV:
        push ebx
        push ecx
        push edx
        push esi
        shl dword [TgvBufSize], 1
        cmp dword [TgvAborted], byte 0
        je near .9
        cmp dword [TgvAudioOn], byte 0
        je short .1
        cmp dword [TgvFrameCallback], byte 0
        je short .2
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        je short .2
.1:
        mov eax, dword [TgvDataEnd]
        call StopSoundChannel
        push byte 1
        call WaitTicks
        add esp, byte 4
.2:
        call GetTicks
        mov esi, eax
.3:
        call GetTicks
        sub eax, esi
        cmp eax, 640h
        setge al
        movzx edx, al
        call AudioStreamActive
        mov ebx, edx
        test eax, eax
        je short .7
        test edx, edx
        jne short .7
        cmp dword [TgvFrameCallback], byte 0
        je short .4
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        jne short .5
.4:
        mov eax, 1
        jmp short .6
.5:
        xor eax, eax
.6:
        test eax, eax
        jne short .3
.7:
        test ebx, ebx
        je short .8
        or byte [TgvStatus], 4
.8:
        mov eax, dword [TgvDataEnd]
        call StopSoundChannel
        push byte 1
        call WaitTicks
        add esp, byte 4
.9:
        push dword [TgvFileHandle]
        call delstream
        add esp, byte 4
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; TgvNextFrame                                 69D61  96 PC, medium confidence
; Reads TGV packets (TGVf, TGVk palette) up to the next frame and decodes it
;-----------------------------------------------------------------------------
TgvNextFrame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
.1:
        mov dword [TgvFramesDecoded], 0
        call GetTicks
        mov esi, eax
.2:
        push dword [TgvFileHandle]
        call CdStreamNextPacket
        add esp, byte 4
        mov dword [TgvAudioBuf], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .3
        mov dword [TgvState], 1
        jmp near .7
.3:
        test eax, eax
        jg short .4
        cmp eax, byte 0FFFFFFFDh
        jge near .7
.4:
        call GetTicks
        mov ecx, 4
        mov esi, eax
        mov eax, dword [TgvAudioBuf]
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [TgvChunkType], eax
        cmp eax, 54475666h
        jb short .6
        jbe short .5
        cmp eax, 5447566Bh
        jne short .6
        mov dword [tgvpalpending], 1
.5:
        push dword [TgvAudioBuf]
        push dword [TgvVideoBmp]
        call TgvDecodeFrame
        add esp, byte 8
        mov dword [TgvFramesDecoded], eax
        cmp dword [tgvpalpending], byte 0
        je short .6
        push dword 300h
        mov eax, dword [TgvVideoBmp]
        push TgvFrameBuf
        add eax, byte 44h
        push eax
        call bcopy
        add esp, byte 0Ch
.6:
        push dword [TgvAudioBuf]
        push dword [TgvFileHandle]
        call CdStreamFreePacket
        add esp, byte 8
.7:
        call GetTicks
        sub eax, esi
        cmp eax, 190h
        setge al
        movzx eax, al
        mov edi, eax
        cmp dword [TgvFramesDecoded], byte 0
        jne short .11
        test eax, eax
        jne short .11
        cmp dword [TgvState], byte 0
        jne short .11
        cmp dword [TgvFrameCallback], byte 0
        je short .8
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        jne short .9
.8:
        mov eax, 1
        jmp short .10
.9:
        xor eax, eax
.10:
        test eax, eax
        jne near .2
.11:
        test edi, edi
        je short .12
        mov dword [TgvState], 0FFFFFFFFh
        or byte [TgvStatus], 1
.12:
        mov eax, dword [TgvChunkLen]
        mov dword [TgvLastFrame], eax
        inc eax
        inc eax
        mov dword [TgvFrameTime], eax
        call GetTicks
        mov edi, eax
.13:
        push dword [TgvMemBlock]
        call CdStreamNextPacket
        add esp, byte 4
        mov dword [TgvAudioBuf], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .15
.14:
        mov dword [TgvAudioOn], 1
        jmp near .19
.15:
        cmp eax, byte 0FFFFFFFDh
        jl short .16
        cmp eax, byte 1
        jge short .16
        cmp dword [TgvState], byte 1
        jne near .19
        jmp short .14
.16:
        call GetTicks
        mov dword [TgvHeaderRead], 1
        mov edi, eax
        cmp dword [TgvAborted], byte 0
        je short .17
        mov eax, dword [TgvAudioBuf]
        call FeedAudioStream
        cmp dword [TgvVideoOn], byte 0
        jne short .19
        mov eax, 2
        call AudioStreamPosition
        cmp eax, 20000h
        jle short .19
        call StartAudioStream
        mov dword [TgvVideoOn], 1
        mov dword [TgvDataEnd], eax
        jmp short .18
.17:
        push dword [TgvAudioBuf]
        push dword [TgvMemBlock]
        call CdStreamFreePacket
        add esp, byte 8
        cmp dword [TgvVideoOn], byte 0
        jne short .19
        mov dword [TgvVideoOn], 1
.18:
        call TgvClock
        mov dword [TgvDataPtr], eax
.19:
        call TgvClock
        mov esi, dword [TgvDataPtr]
        sub eax, esi
        mov dword [TgvAudioPos], eax
        cmp dword [TgvVideoOn], byte 0
        jne short .20
        cmp dword [TgvHeaderRead], byte 0
        jne short .20
        sub eax, esi
        cmp eax, dword [TgvFpsSetting]
        jle short .20
        mov dword [TgvVideoOn], 1
        call TgvClock
        mov dword [TgvDataPtr], eax
.20:
        call GetTicks
        sub eax, edi
        cmp eax, 190h
        setge al
        movzx eax, al
        mov esi, eax
        mov eax, dword [TgvAudioPos]
        cmp eax, dword [TgvLastFrame]
        jl short .21
        cmp dword [TgvVideoOn], byte 0
        je short .21
        cmp dword [TgvState], byte 1
        jne short .28
.21:
        mov eax, dword [TgvAudioPos]
        cmp eax, dword [TgvLastFrame]
        jle short .22
        cmp dword [TgvAudioOn], byte 0
        jne short .23
.22:
        mov eax, 1
        jmp short .24
.23:
        xor eax, eax
.24:
        test eax, eax
        je short .28
        test esi, esi
        jne short .28
        cmp dword [TgvFrameCallback], byte 0
        je short .25
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        jne short .26
.25:
        mov eax, 1
        jmp short .27
.26:
        xor eax, eax
.27:
        test eax, eax
        jne near .13
.28:
        test esi, esi
        je short .29
        mov dword [TgvAudioOn], 1
        or byte [TgvStatus], 2
.29:
        cmp dword [TgvFramesDecoded], byte 0
        je short .30
        inc dword [TgvChunkLen]
.30:
        mov eax, dword [TgvAudioPos]
        cmp eax, dword [TgvFrameTime]
        jl short .37
        cmp dword [TgvFlags], byte 0
        jne short .37
        cmp dword [TgvState], byte 0
        je short .31
        cmp dword [TgvAudioOn], byte 0
        jne short .32
.31:
        mov eax, 1
        jmp short .33
.32:
        xor eax, eax
.33:
        test eax, eax
        je short .37
        cmp dword [TgvFrameCallback], byte 0
        je short .34
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        jne short .35
.34:
        mov eax, 1
        jmp short .36
.35:
        xor eax, eax
.36:
        test eax, eax
        jne near .1
.37:
        mov eax, dword [TgvFramesDecoded]
        inc dword [TgvFrame]
        jmp near TgvOpen_F9
;-----------------------------------------------------------------------------
; TgvPlayFrames                                6A0D4  96 PC, medium confidence
; Plays the opened TGV movie frame by frame, centred, until it ends or is
; skipped
;-----------------------------------------------------------------------------
TgvPlayFrames:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        call TgvOpen
        mov dword [byte ebp-04h], 0
        mov edi, 1
.1:
        call TgvNextFrame
        mov esi, eax
        test eax, eax
        je near .6
        mov edx, dword [dword_11F5C0]
        movsx eax, word [byte eax+04h]
        sub edx, eax
        mov eax, edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        add eax, byte 3
        and al, 0FCh
        mov edx, dword [dword_11F5C4]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+06h]
        sub edx, eax
        mov eax, edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        add eax, byte 3
        and al, 0FCh
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-04h]
        inc eax
        imul eax, dword [dword_11F5C4]
        push eax
        mov eax, dword [byte ebp-04h]
        imul eax, dword [dword_11F5C4]
        push eax
        push dword 140h
        push byte 0
        call SetClipWindow
        mov eax, dword [byte ebp-04h]
        imul eax, dword [dword_11F5C4]
        add esp, byte 10h
        add eax, dword [byte ebp-0Ch]
        push eax
        push dword [byte ebp-08h]
        push esi
        call TgvBlitFrame
        add esp, byte 0Ch
        cmp dword [tgvpalpending], byte 0
        je short .2
        call DisableInterrupts
.2:
        mov eax, dword [byte ebp-04h]
        imul eax, dword [dword_11F5C4]
        imul eax, dword 140h
        cdq
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        push eax
        call SetCrtcStart
        add esp, byte 4
        cmp dword [tgvpalpending], byte 0
        je short .3
        call WaitRetrace
        push TgvFrameBuf
        push dword 100h
        push byte 0
        call SetPaletteEntries8
        add esp, byte 0Ch
        call EnableInterrupts
        mov dword [tgvpalpending], 0
.3:
        xor byte [byte ebp-04h], 1
        cmp dword [TgvFrameCallback], byte 0
        je short .4
        call dword [TgvFrameCallback]
        or dword [TgvFlags], eax
        jne short .5
.4:
        cmp dword [TgvFlags], byte 0
        je short .7
.5:
        mov edi, 0FFFFFFFFh
        jmp short .7
.6:
        cmp dword [TgvFlags], byte 0
        jne short .5
        xor edi, edi
.7:
        test edi, edi
        jg near .1
        call PlayTGV
        mov eax, 2
        call FadeOut
        mov eax, edi
        leave
        jmp near TgvOpen_F9
;-----------------------------------------------------------------------------
; PlayMovie                                    6A229  96 PC, medium confidence
; (path, ..., skip fn): plays a TGV movie with sound if there is a card; 1 if
; skipped
;-----------------------------------------------------------------------------
PlayMovie:
        push esi
        mov esi, eax
        call GetSoundCard
        test eax, eax
        setge al
        movzx eax, al
        mov dword [TgvAborted], eax
        test eax, eax
        sete al
        movzx eax, al
        mov dword [MovieSkipped], eax
        mov eax, 2
        call SetGraphicsMode
        mov dword [TgvFrameCallback], ecx
        test ecx, ecx
        je short .2
.1:
        call dword [TgvFrameCallback]
        test eax, eax
        jne short .1
.2:
        mov eax, esi
        mov dword [TgvFlags], 0
        call TgvPlayFrames
        test eax, eax
        setl al
        movzx esi, al
        mov eax, 1
        mov dword [TgvFrameCallback], 0
        call SetGraphicsMode
        push dword [TgvVideoBmp]
        call TgvFreeDecoder
        add esp, byte 4
        mov eax, esi
        pop esi
        ret
;-----------------------------------------------------------------------------
; PlayMovieFile                                                   6A2A8  96 PC
; (file id): stops the music, plays the movie (any pressed device skips) and
; restarts the music
;-----------------------------------------------------------------------------
PlayMovieFile:
        push ebx
        push ecx
        push edx
        enter 34h, 0
        mov ebx, eax
        mov eax, 3
        call FadeOut
        test byte [globalset], 10h
        je short .1
        mov eax, 50h
        xor edx, edx
        call FadeOutMusic
        call StopMusic
.1:
        call CloseMusic
        lea eax, [byte ebp-034h]
        mov edx, ebx
        call MakeDataPath
        lea eax, [byte ebp-034h]
        push eax
        push eax
        call setstreamspeed
        add esp, byte 8
        cmp byte [byte ebp-034h], 0
        je short .2
        mov ecx, GetPressedDevice
        mov ebx, 1
        lea eax, [byte ebp-034h]
        mov edx, ebx
        call PlayMovie
.2:
        call OpenMusicStream
        mov eax, 1
        call SetScreenMode
        test byte [globalset], 10h
        je short .3
        call QueueCurrentMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
.3:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
