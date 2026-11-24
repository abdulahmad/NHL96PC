; Initialised data of front/sound (src/front/sound).
bits 32
%include "hockey.inc"
section s_11D1C8 progbits alloc noexec write align=1
global SoundCardPort, SoundCardIrq, CdSpeedTested, MusicStream, ArenaClipStream, sndcard, MusicFlags, SpeechStreamFile
global SpeechStreamTimer, CrowdSfxHandle, AmbientSfxHandle, LastSfxHandle, CrowdFading, CrowdActive, CrowdVolumeLevel, CrowdTarget
global GameSoundOn, MusicFileName, CurrentMusicTrack, SoundCardOn, SpeechStarting, CdSpeed, SpeechBankPaths, ClipIndexTable
global TeamPairClips, SpeechBankAltPaths, speechq, SpeechBankHandle, SpeechQueueHead, SpeechQueueTail, SpeechOpen, SpeechChannelCount
global SpeechBanksOpen, speechinit, SfxChannelBusy, lastsfx, CrowdHeld, SfxMask, ArenaClipState, ArenaClipTime
global ArenaClipId, CdSpeedChecked
SoundCardPort:                                  ; sound card I/O port; used by StartSoundCard
        db 00h,00h,00h,00h
SoundCardIrq:                                   ; sound card IRQ; used by StartSoundCard
        db 00h,00h,00h,00h
CdSpeedTested:                                  ; set once the CD speed test has run; used by PlayIntroMovies,
                                                ; PlayTeamMovie, RunStatsMenu ...
        db 00h,00h
MusicStream:                                    ; music stream handle; used by CloseMusic, EndGameSound,
                                                ; FeedMusicStream ...
        db 00h,00h,00h,00h
ArenaClipStream:                                ; arena clip stream handle; used by ArenaClipService,
                                                ; EndGameSound, PlayArenaClip ...
        db 00h,00h,00h,00h
sndcard:                                        ; the sound driver StartSoundCard started (-1: none); used by
                                                ; CloseMusic, CrowdFadeOut, CrowdNoiseReset ...
        db 0FFh,0FFh,0FFh,0FFh
MusicFlags:                                     ; music playback flags; used by CloseMusic, EndGameSound,
                                                ; FadeOutMusic ...
        db 00h,00h,00h,00h
SpeechStreamFile:                               ; speech stream file; used by ShutdownSound, StartSoundCard,
                                                ; StopAllSfx
        db 0FFh,0FFh,0FFh,0FFh
SpeechStreamTimer:                              ; speech stream timer handle (-1 none); used by EndGameSound,
                                                ; ShutdownSound, StartGameSound ...
        db 0FFh,0FFh,0FFh,0FFh
CrowdSfxHandle:                                 ; crowd sound effect handle; used by EndGameSound,
                                                ; StartGameSound, StopAllSfx
        db 0FFh,0FFh,0FFh,0FFh
AmbientSfxHandle:                               ; ambient sound effect handle; used by EndGameSound,
                                                ; StartGameSound, StopAllSfx
        db 0FFh,0FFh,0FFh,0FFh
LastSfxHandle:                                  ; handle of the last sound effect started; used by
                                                ; EndGameSound, PlaySfx, PlaySfxOr ...
        db 0FFh,0FFh,0FFh,0FFh
CrowdFading:                                    ; set while the crowd sound fades; used by CrowdFadeOut,
                                                ; CrowdNoiseReset, EndGameSound ...
        db 00h,00h,00h,00h
CrowdActive:                                    ; crowd sound is playing; used by CrowdFadeOut,
                                                ; CrowdNoiseReset, CrowdPause ...
        db 00h,00h,00h,00h
CrowdVolumeLevel:                                     ; current crowd volume level; used by CrowdFadeOut,
                                                ; CrowdNoiseReset, CrowdPause ...
        db 00h,00h,00h,00h
CrowdTarget:                                    ; crowd volume the fade is heading to; used by
                                                ; CrowdNoiseReset, Crowd_Noise, GetCrowdTarget ...
        db 00h,00h,00h,00h
GameSoundOn:                                    ; in-game sound enabled; used by EndGameSound, StartGameSound
        db 00h,00h,00h,00h
MusicFileName:                                  ; music file name buffer; used by QueueMusic
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h
CurrentMusicTrack:                              ; music track that is playing; used by QueueCurrentMusic,
                                                ; QueueMusic
        db 0FFh,0FFh,0FFh,0FFh
SoundCardOn:                                    ; used by EndGameSound, FillMusicStream, SoundIdle ...
        db 00h,00h,00h,00h
SpeechStarting:                                 ; set while speech is being started; used by SpeechService,
                                                ; StopSpeech
        db 00h,00h
CdSpeed:                                        ; measured CD speed; used by TestCdSpeed
        db 00h,00h
SpeechBankPaths:                                ; data path of the speech banks; used by OpenSpeechBanks
        db 05Ah,00h,00h,00h
ClipIndexTable:                                 ; index of sound clips by id; used by FindClipIndex
        db 00h,00h,00h,00h,03Ch,00h,00h,00h,054h,06h,00h,00h,090h,06h,00h,00h
        db 0CCh,06h,00h,00h,0E4h,0Ch,00h,00h,020h,0Dh,00h,00h,038h,013h,00h,00h
        db 074h,013h,00h,00h,0B0h,013h,00h,00h,0C8h,019h,00h,00h,04h,01Ah,00h,00h
        db 040h,01Ah,00h,00h,058h,020h,00h,00h,094h,020h,00h,00h,0D0h,020h,00h,00h
        db 0ACh,026h,00h,00h,0E8h,026h,00h,00h,00h,02Dh,00h,00h,03Ch,02Dh,00h,00h
        db 078h,02Dh,00h,00h,090h,033h,00h,00h,0CCh,033h,00h,00h,0E4h,039h,00h,00h
        db 020h,03Ah,00h,00h,038h,040h,00h,00h,074h,040h,00h,00h,0B0h,040h,00h,00h
        db 0C8h,046h,00h,00h,04h,047h,00h,00h,01Ch,04Dh,00h,00h,058h,04Dh,00h,00h
        db 034h,053h,00h,00h,070h,053h,00h,00h,0ACh,053h,00h,00h,0C4h,059h,00h,00h
        db 00h,05Ah,00h,00h,0DCh,05Fh,00h,00h,018h,060h,00h,00h,054h,060h,00h,00h
        db 06Ch,066h,00h,00h,0A8h,066h,00h,00h,0C0h,06Ch,00h,00h,0FCh,06Ch,00h,00h
        db 038h,06Dh,00h,00h,050h,073h,00h,00h,08Ch,073h,00h,00h,0C8h,073h,00h,00h
        db 0E0h,079h,00h,00h,01Ch,07Ah,00h,00h,034h,080h,00h,00h,070h,080h,00h,00h
        db 088h,086h,00h,00h,0C4h,086h,00h,00h,0A0h,08Ch,00h,00h,0DCh,08Ch,00h,00h
        db 0F4h,092h,00h,00h,030h,093h,00h,00h,048h,099h,00h,00h,084h,099h,00h,00h
        db 0C0h,099h,00h,00h,0D8h,09Fh,00h,00h,014h,0A0h,00h,00h,0F0h,0A5h,00h,00h
        db 02Ch,0A6h,00h,00h,068h,0A6h,00h,00h,0CCh,0ABh,00h,00h,08h,0ACh,00h,00h
        db 044h,0ACh,00h,00h
TeamPairClips:                                  ; used by FindTeamPairClip
        db 09h,01h,0Bh,01h,017h,03h,06h,04h,013h,04h,016h,06h,03h,07h,00h,0Ah
        db 012h,0Bh,016h,0Bh,0Ch,0Eh,0Dh,0Eh,010h,011h,08h,015h,0Eh,016h,0Eh,017h
SpeechBankAltPaths:                             ; data path of the speech banks when the alternate set is
                                                ; used; used by OpenSpeechBanks
        db 05Bh,00h,00h,00h
speechq:                                        ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
SpeechBankHandle:                               ; speech bank file handle; used by FreeSpeechBuffer,
                                                ; InitSpeech, OpenSpeechBanks ...
        db 0FFh,0FFh,0FFh,0FFh
SpeechQueueHead:                                ; speech queue read index; used by InitSpeech,
                                                ; OpenSpeechBanks, QueueSpeechClip ...
        db 00h,00h
SpeechQueueTail:                                ; speech queue write index; used by InitSpeech,
                                                ; OpenSpeechBanks, QueueSpeechClip ...
        db 00h,00h
SpeechOpen:                                     ; speech system is open; used by InitSpeech, OpenSpeechBanks,
                                                ; PlayArenaClip ...
        db 00h,00h
SpeechChannelCount:                             ; number of speech channels; used by ResetSpeechChannels,
                                                ; StopSpeech
        db 00h,00h
SpeechBanksOpen:                                ; number of open speech banks; used by OpenSpeechBanks
        db 00h,00h,00h,00h
speechinit:                                     ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
SfxChannelBusy:                                 ; busy flag per sound effect channel; used by StopAllSfx
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
lastsfx:                                        ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 0FFh,0FFh
CrowdHeld:                                      ; crowd sound is held; used by CrowdPause, CrowdResume
        db 00h,00h
SfxMask:                                        ; mask of sound effects allowed; used by InGameMenu,
                                                ; RunSimFrames, StartPer ...
        db 00h,00h,00h,00h
ArenaClipState:                                 ; arena clip playback state; used by ArenaClipReady,
                                                ; ArenaClipService, PlayArenaClip ...
        db 00h,00h,00h,00h
ArenaClipTime:                                  ; time the arena clip started; used by ArenaClipService,
                                                ; StopArenaClip
        db 00h,00h,00h,00h
ArenaClipId:                                    ; id of the arena clip; used by PlayArenaClip
        db 00h,00h,00h,00h
CdSpeedChecked:                                 ; used by TestCdSpeed
        db 00h,00h
