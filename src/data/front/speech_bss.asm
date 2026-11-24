; BSS of front/speech (src/front/speech).
bits 32
%include "hockey.inc"
section s_17C49C nobits alloc noexec write align=1
global SpeechClipQueue, SpeechBankPtrs, SpeechChannels, SpeechVolume, SpeechBankFiles, MusicVolume, ArenaClipHandle, SpeechBankNames
global SpeechActiveCount, SpeechPlaying
SpeechClipQueue:                                ; Speech clip queue entries; used by InitSpeech,
                                                ; OpenSpeechBanks, QueueSpeechClip ...
        resb 2
        resb 2
        resb 4
        resb 280
SpeechBankPtrs:                                 ; pointers to the loaded speech banks; used by InitSpeech,
                                                ; OpenSpeechBanks, ShutdownSpeech
        resb 4
SpeechChannels:                                 ; speech channel handles; used by ResetSpeechChannels,
                                                ; StopSpeech
        resb 4
        resb 4
        resb 4
        resb 4
        resb 44
SpeechVolume:                                   ; speech volume level; used by OpenSpeechBanks, StopSpeech
        resb 4
SpeechBankFiles:                                ; open speech bank file handles; used by InitSpeech,
                                                ; OpenSpeechBanks, QueueSpeechClip ...
        resb 4
MusicVolume:                                    ; music volume level; used by CloseMusic, FadeOutMusic,
                                                ; FeedMusicStream ...
        resb 4
ArenaClipHandle:                                ; handle of the arena sound clip that is playing; used by
                                                ; ArenaClipService, PlayArenaClip, StartArenaClip ...
        resb 4
SpeechBankNames:                                ; speech bank file name buffer; used by InitSpeech,
                                                ; OpenSpeechBanks, ShutdownSpeech
        resb 50
SpeechActiveCount:                              ; number of speech clips playing; used by ResetSpeechChannels,
                                                ; StopSpeech
        resb 2
SpeechPlaying:                                  ; non-zero while a speech clip plays; used by
                                                ; ResetSpeechChannels, SpeechService, StopSpeech
        resb 4
