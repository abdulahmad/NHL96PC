; Strings and constants of src/lib/sound/snd_speech_queue_service.asm, in link order.
bits 32
%include "hockey.inc"
section s_113B10 progbits alloc noexec write align=1
global str_UnknownError, str_EnvironmentVariableNotSe, str_ErrorInEnvironmentVariab, str_InvalidDriver, str_CardNotDetected, str_ErrorAllocatingMemory, str_ErrorInitializingCard, str_ErrorInitializingSoftwar
global str_ErrorInDMAChannel, str_ErrorNotAnEACSFormatFile, str_ErrorInvalidChannel, str_ErrorInvalidVolume, str_ErrorInvalidHandle, str_ErrorInvalidPan, str_ErrorUnsupportedAudioTyp, str_ErrorInvalidBend
global str_ErrorCouldNotResolveSfxB, str_ErrorInvalidBankNumber, str_ErrorInvalidSfxNumber, str_NoFreeChannelToPlayOn, str_spEACSNDFLIB32BitSoundLibr, str_NoCardInstalled, str_SoundBlaster10, str_SoundBlaster15
global str_SoundBlaster20, str_SoundBlasterPro10, str_SoundBlasterPro20, str_SoundBlaster16, str_GravisUltraSound, str_WindowsSoundSystem
str_UnknownError:                               ; string 'Unknown error'; used by SndErrorTextJumpTable
        db 055h,06Eh,06Bh,06Eh,06Fh,077h,06Eh,020h,065h,072h,072h,06Fh,072h,00h
str_EnvironmentVariableNotSe:                   ; string 'Environment variable not set'; used by
                                                ; SndErrorTextJumpTable
        db 045h,06Eh,076h,069h,072h,06Fh,06Eh,06Dh,065h,06Eh,074h,020h,076h,061h,072h,069h
        db 061h,062h,06Ch,065h,020h,06Eh,06Fh,074h,020h,073h,065h,074h,00h
str_ErrorInEnvironmentVariab:                   ; string 'Error in environment variable'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,020h,069h,06Eh,020h,065h,06Eh,076h,069h,072h,06Fh,06Eh
        db 06Dh,065h,06Eh,074h,020h,076h,061h,072h,069h,061h,062h,06Ch,065h,00h
str_InvalidDriver:                              ; string 'Invalid driver'; used by SndErrorTextJumpTable
        db 049h,06Eh,076h,061h,06Ch,069h,064h,020h,064h,072h,069h,076h,065h,072h,00h
str_CardNotDetected:                            ; string 'Card not detected'; used by SndErrorTextJumpTable
        db 043h,061h,072h,064h,020h,06Eh,06Fh,074h,020h,064h,065h,074h,065h,063h,074h,065h
        db 064h,00h
str_ErrorAllocatingMemory:                      ; string 'Error allocating memory'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,020h,061h,06Ch,06Ch,06Fh,063h,061h,074h,069h,06Eh,067h
        db 020h,06Dh,065h,06Dh,06Fh,072h,079h,00h
str_ErrorInitializingCard:                      ; string 'Error initializing card'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,020h,069h,06Eh,069h,074h,069h,061h,06Ch,069h,07Ah,069h
        db 06Eh,067h,020h,063h,061h,072h,064h,00h
str_ErrorInitializingSoftwar:                   ; string 'Error initializing software mixer'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,020h,069h,06Eh,069h,074h,069h,061h,06Ch,069h,07Ah,069h
        db 06Eh,067h,020h,073h,06Fh,066h,074h,077h,061h,072h,065h,020h,06Dh,069h,078h,065h
        db 072h,00h
str_ErrorInDMAChannel:                          ; string 'Error in DMA channel'; used by SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,020h,069h,06Eh,020h,044h,04Dh,041h,020h,063h,068h,061h
        db 06Eh,06Eh,065h,06Ch,00h
str_ErrorNotAnEACSFormatFile:                   ; string 'Error: not an EACS format file'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,06Eh,06Fh,074h,020h,061h,06Eh,020h,045h,041h
        db 043h,053h,020h,066h,06Fh,072h,06Dh,061h,074h,020h,066h,069h,06Ch,065h,00h
str_ErrorInvalidChannel:                        ; string 'Error: invalid channel'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,063h
        db 068h,061h,06Eh,06Eh,065h,06Ch,00h
str_ErrorInvalidVolume:                         ; string 'Error: invalid volume'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,076h
        db 06Fh,06Ch,075h,06Dh,065h,00h
str_ErrorInvalidHandle:                         ; string 'Error: invalid handle'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,068h
        db 061h,06Eh,064h,06Ch,065h,00h
str_ErrorInvalidPan:                            ; string 'Error: invalid pan'; used by SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,070h
        db 061h,06Eh,00h
str_ErrorUnsupportedAudioTyp:                   ; string 'Error: unsupported audio type this function'; used
                                                ; by SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,075h,06Eh,073h,075h,070h,070h,06Fh,072h,074h
        db 065h,064h,020h,061h,075h,064h,069h,06Fh,020h,074h,079h,070h,065h,020h,074h,068h
        db 069h,073h,020h,066h,075h,06Eh,063h,074h,069h,06Fh,06Eh,00h
str_ErrorInvalidBend:                           ; string 'Error: invalid bend'; used by SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,062h
        db 065h,06Eh,064h,00h
str_ErrorCouldNotResolveSfxB:                   ; string 'Error: could not resolve sfx bank'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,063h,06Fh,075h,06Ch,064h,020h,06Eh,06Fh,074h
        db 020h,072h,065h,073h,06Fh,06Ch,076h,065h,020h,073h,066h,078h,020h,062h,061h,06Eh
        db 06Bh,00h
str_ErrorInvalidBankNumber:                     ; string 'Error: invalid bank number'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,062h
        db 061h,06Eh,06Bh,020h,06Eh,075h,06Dh,062h,065h,072h,00h
str_ErrorInvalidSfxNumber:                      ; string 'Error: invalid sfx number'; used by
                                                ; SndErrorTextJumpTable
        db 045h,072h,072h,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,073h
        db 066h,078h,020h,06Eh,075h,06Dh,062h,065h,072h,00h
str_NoFreeChannelToPlayOn:                      ; string 'No free channel to play on'; used by
                                                ; SndErrorTextJumpTable
        db 04Eh,06Fh,020h,066h,072h,065h,065h,020h,063h,068h,061h,06Eh,06Eh,065h,06Ch,020h
        db 074h,06Fh,020h,070h,06Ch,061h,079h,020h,06Fh,06Eh,00h
str_spEACSNDFLIB32BitSoundLibr:                 ; string ' EACSNDF.LIB 32 Bit Sound Library - Build: Aug 28
                                                ; 1995 18:29:01 (c)1994-95, EAC Inc. by DM, AS, PC, IM, KH,
                                                ; BP, et al. '
        db 0Ah,045h,041h,043h,053h,04Eh,044h,046h,02Eh,04Ch,049h,042h,020h,033h,032h,020h
        db 042h,069h,074h,020h,053h,06Fh,075h,06Eh,064h,020h,04Ch,069h,062h,072h,061h,072h
        db 079h,020h,02Dh,020h,042h,075h,069h,06Ch,064h,03Ah,020h,041h,075h,067h,020h,032h
        db 038h,020h,031h,039h,039h,035h,020h,031h,038h,03Ah,032h,039h,03Ah,030h,031h,0Dh
        db 0Ah,028h,063h,029h,031h,039h,039h,034h,02Dh,039h,035h,02Ch,020h,045h,041h,043h
        db 020h,049h,06Eh,063h,02Eh,020h,062h,079h,020h,044h,04Dh,02Ch,020h,041h,053h,02Ch
        db 020h,050h,043h,02Ch,020h,049h,04Dh,02Ch,020h,04Bh,048h,02Ch,020h,042h,050h,02Ch
        db 020h,065h,074h,020h,061h,06Ch,02Eh,0Dh,00h
str_NoCardInstalled:                            ; string 'No card installed'
        db 04Eh,06Fh,020h,063h,061h,072h,064h,020h,069h,06Eh,073h,074h,061h,06Ch,06Ch,065h
        db 064h,00h
str_SoundBlaster10:                             ; string 'SoundBlaster 1.0'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,031h,02Eh,030h
        db 00h
str_SoundBlaster15:                             ; string 'SoundBlaster 1.5'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,031h,02Eh,035h
        db 00h
str_SoundBlaster20:                             ; string 'SoundBlaster 2.0'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,032h,02Eh,030h
        db 00h
str_SoundBlasterPro10:                          ; string 'SoundBlaster Pro 1.0'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,050h,072h,06Fh
        db 020h,031h,02Eh,030h,00h
str_SoundBlasterPro20:                          ; string 'SoundBlaster Pro 2.0'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,050h,072h,06Fh
        db 020h,032h,02Eh,030h,00h
str_SoundBlaster16:                             ; string 'SoundBlaster 16'
        db 053h,06Fh,075h,06Eh,064h,042h,06Ch,061h,073h,074h,065h,072h,020h,031h,036h,00h
str_GravisUltraSound:                           ; string 'Gravis UltraSound'
        db 047h,072h,061h,076h,069h,073h,020h,055h,06Ch,074h,072h,061h,053h,06Fh,075h,06Eh
        db 064h,00h
str_WindowsSoundSystem:                         ; string 'Windows Sound System'
        db 057h,069h,06Eh,064h,06Fh,077h,073h,020h,053h,06Fh,075h,06Eh,064h,020h,053h,079h
        db 073h,074h,065h,06Dh,00h,00h
