; Music on the CD stream: queue, play, fade, stop and feed it (96 PC).
bits 32
%include "hockey.inc"
section s_689D1 progbits alloc exec nowrite align=1
extern MusicFlags, MusicFileName, CdStreamNextPacket, CdStreamOpenDefault, CdStreamQueue, CdStreamSyncTime, delstream, MusicStream
extern CurrentMusicTrack, SoundCardOn, MusicVolume, FindClipIndex_56, globalset, MakeDataPath, SetTickDeadline, sndcard
extern FadeChannelVolume, SetChannelVolume, StopSoundChannel, ChannelIdle, InitAudioStream, StartAudioStream, FeedAudioStream, AudioStreamPosition
extern TicksSinceLast, TickDeadlinePassed
global StopMusic, QueueCurrentMusic, QueueMusic, FillMusicStream, CloseMusic, OpenMusicStream, SetMusicVolume, PlayMusic
global FadeOutMusic, MusicDone, FeedMusicStream, SyncMusicStream
;-----------------------------------------------------------------------------
; StopMusic                                                       689D1  96 PC
; Stops the music voice if playing (MusicFlags bits 1, 4) and clears the
; music flags
;-----------------------------------------------------------------------------
StopMusic:
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 1
        je short .1
        test byte [MusicFlags], 4
        je short .1
        mov eax, dword [MusicVolume]
        call StopSoundChannel
        mov dword [MusicFlags], 0FFFFFFFBh
.1:
        mov dword [MusicFlags], 0
        ret
;-----------------------------------------------------------------------------
; QueueCurrentMusic                            68A0B  96 PC, medium confidence
; QueueMusic with the current music file (CurrentMusicTrack)
;-----------------------------------------------------------------------------
QueueCurrentMusic:
        mov eax, dword [CurrentMusicTrack]
;-----------------------------------------------------------------------------
; QueueMusic                                                      68A10  96 PC
; (file id): with music on (globalset 10h) stops the music and queues the
; file on the music CD stream (CdStreamQueue)
;-----------------------------------------------------------------------------
QueueMusic:
        push ebx
        push ecx
        push edx
        cmp eax, dword [CurrentMusicTrack]
        je short .1
        mov dword [CurrentMusicTrack], eax
        mov edx, eax
        mov eax, MusicFileName
        call MakeDataPath
.1:
        cmp dword [sndcard], byte 0
        jl near .3
        test byte [globalset], 10h
        je short .3
        cmp byte [MusicFileName], 0
        je short .3
        cmp dword [sndcard], byte 0
        jl short .2
        test byte [MusicFlags], 1
        je short .2
        test byte [MusicFlags], 4
        je short .2
        mov eax, dword [MusicVolume]
        call StopSoundChannel
        mov dword [MusicFlags], 0FFFFFFFBh
.2:
        push MusicFileName
        push dword [MusicStream]
        mov dword [MusicFlags], 0
        call CdStreamQueue
        add esp, byte 8
        mov eax, dword [MusicStream]
        call InitAudioStream
        or byte [MusicFlags], 1
        mov dword [MusicVolume], eax
.3:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FillMusicStream                              68AB1  96 PC, medium confidence
; (bytes): before every DOS file call, reads music stream packets until the
; driver has that much buffered (200 tries)
;-----------------------------------------------------------------------------
FillMusicStream:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edi, eax
        cmp dword [SoundCardOn], byte 0
        je short .1
        xor eax, eax
        jmp near FindClipIndex_56
.1:
        cmp dword [sndcard], byte 0
        jl short .7
        test byte [MusicFlags], 1
        je short .7
        call TicksSinceLast
        xor esi, esi
.2:
        xor eax, eax
        call AudioStreamPosition
        cmp eax, edi
        jge short .5
        cmp esi, 0C8h
        jge short .5
        push dword [MusicStream]
        call CdStreamNextPacket
        add esp, byte 4
        mov edx, eax
        cmp eax, byte 0FFFFFFFDh
        jl short .3
        test eax, eax
        jle short .4
.3:
        mov eax, edx
        call FeedAudioStream
        xor esi, esi
.4:
        call TicksSinceLast
        add esi, eax
        jmp short .2
.5:
        cmp esi, 0C8h
        jge short .6
        xor esi, esi
.6:
        or byte [MusicFlags], 2
.7:
        mov eax, esi
        jmp near FindClipIndex_56
;-----------------------------------------------------------------------------
; CloseMusic                                                      68B37  96 PC
; Fades the music out (50h), stops it and deletes its stream (delstream)
;-----------------------------------------------------------------------------
CloseMusic:
        push ebx
        push ecx
        push edx
        mov eax, 50h
        xor edx, edx
        call FadeOutMusic
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 1
        je short .1
        test byte [MusicFlags], 4
        je short .1
        mov eax, dword [MusicVolume]
        call StopSoundChannel
        mov dword [MusicFlags], 0FFFFFFFBh
.1:
        mov dword [MusicFlags], 0
        cmp dword [MusicStream], byte 0
        je short .2
        push dword [MusicStream]
        call delstream
        add esp, byte 4
.2:
        mov dword [MusicStream], 0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; OpenMusicStream                                                 68BA4  96 PC
; Opens the music CD stream (35B60h bytes) if not open
;-----------------------------------------------------------------------------
OpenMusicStream:
        push ebx
        push ecx
        push edx
        cmp dword [MusicStream], byte 0
        jne short .1
        push byte 20h
        push dword 2000h
        push dword 35B60h
        call CdStreamOpenDefault
        add esp, byte 0Ch
        mov dword [MusicStream], eax
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetMusicVolume                                                  68BCD  96 PC
; Sets the music voice volume from globalset
;-----------------------------------------------------------------------------
SetMusicVolume:
        push edx
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 1
        je short .1
        mov eax, dword [globalset]
        shl eax, 14h
        shr eax, 19h
        lea edx, [byte eax+028h]
        mov eax, dword [MusicVolume]
        call SetChannelVolume
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; PlayMusic                                                       68BFA  96 PC
; Starts the queued music at the globalset volume (flags 6)
;-----------------------------------------------------------------------------
PlayMusic:
        push edx
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 1
        je short .1
        call StartAudioStream
        mov eax, dword [globalset]
        shl eax, 14h
        shr eax, 19h
        lea edx, [byte eax+028h]
        mov eax, dword [MusicVolume]
        call SetChannelVolume
        or byte [MusicFlags], 6
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; FadeOutMusic                                                    68C33  96 PC
; (ticks, idle fn): fades the music to 0 and waits, calling idle fn and
; feeding the stream
;-----------------------------------------------------------------------------
FadeOutMusic:
        push ebx
        push ecx
        enter 4, 0
        mov ecx, eax
        mov dword [byte ebp-04h], edx
        cmp dword [sndcard], byte 0
        jl short .3
        test byte [MusicFlags], 4
        je short .3
        mov ebx, 0FFFFFFFFh
        mov eax, dword [MusicVolume]
        mov edx, ecx
        add ecx, byte 0Ah
        call FadeChannelVolume
        push ecx
        call SetTickDeadline
        add esp, byte 4
.1:
        cmp dword [byte ebp-04h], byte 0
        je short .2
        call dword [byte ebp-04h]
.2:
        call FeedMusicStream
        call TickDeadlinePassed
        test eax, eax
        je short .1
        and byte [MusicFlags], 0FBh
.3:
        leave
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; MusicDone                                                       68C8F  96 PC
; 1 when the playing music has ended
;-----------------------------------------------------------------------------
MusicDone:
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 4
        je short .1
        mov eax, dword [MusicVolume]
        call ChannelIdle
        test eax, eax
        sete al
        movzx eax, al
        ret
.1:
        xor eax, eax
        ret
;-----------------------------------------------------------------------------
; FeedMusicStream                                                 68CB7  96 PC
; Gives the driver the next music stream packet when it needs one
;-----------------------------------------------------------------------------
FeedMusicStream:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl short .2
        test byte [MusicFlags], 1
        je short .2
        mov eax, dword [MusicVolume]
        call ChannelIdle
        test eax, eax
        jne short .2
        push dword [MusicStream]
        call CdStreamNextPacket
        add esp, byte 4
        mov edx, eax
        cmp eax, byte 0FFFFFFFDh
        jl short .1
        test eax, eax
        jle short .2
.1:
        mov eax, edx
        call FeedAudioStream
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SyncMusicStream                              68CFE  96 PC, medium confidence
; CdStreamSyncTime on the music stream while music plays (around data file
; loads)
;-----------------------------------------------------------------------------
SyncMusicStream:
        push ebx
        push ecx
        push edx
        cmp dword [sndcard], byte 0
        jl short .1
        test byte [MusicFlags], 4
        je short .1
        push dword [MusicStream]
        call CdStreamSyncTime
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
