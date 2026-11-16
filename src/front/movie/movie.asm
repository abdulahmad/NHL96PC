; TGV movies: open the movie and its audio stream, decode and show the frames, play a movie file between screens (96 PC).
bits 32
%include "hockey.inc"
section s_69B1E progbits alloc exec nowrite align=1
extern byte_17C95C, CdStreamFreePacket, CdStreamNextPacket, CdStreamOpenDefault, CdStreamOpenSecondary, CdStreamStart, CloseMusic, delstream
extern dword_11D3B8, dword_11D3BC, dword_11D3C0, dword_11D3C4, dword_11F5C0, dword_11F5C4, dword_17C944, dword_17C948
extern dword_17C94C, dword_17C950, dword_17C954, dword_17C958, dword_17C960, dword_17C964, dword_17C968, dword_17C970
extern dword_17C974, dword_17C978, dword_17C97C, dword_17C980, dword_17C984, dword_17C988, dword_17C98C, dword_17C990
extern dword_17C994, dword_17C998, dword_17C99C, FadeOutMusic, FillMusicStream, GetPressedDevice, GetSoundCard, GetTicks
extern globalset, MakeDataPath, OpenMusicStream, PlayMusic, QueueCurrentMusic, SetClipWindow, SetCrtcStart, setstreamspeed
extern SoundSecondsToBytes, StopMusic, str_TEMP, FadeOut, SetGraphicsMode, SetScreenMode, sub_AB758, FreeMemBlock
extern sub_BFE4C, sub_C0252, sub_C02D6, sub_C032E, sub_C03EA, sub_C0423, sub_C04AE, sub_C1FC0
extern sub_C1FEC, sub_C204C, sub_C2268, sub_C2290, sub_C2440, sub_C2442, sub_DD830, bcopy
extern tgvpalpending, unk_17C644, WaitRetrace, WaitTicks
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
        cmp dword [dword_17C984], byte 0
        je short .2
        cmp dword [dword_17C968], byte 0
        je short .1
        cmp dword [dword_17C964], byte 0
        jne short .1
        call sub_C03EA
        test eax, eax
        je short .1
        call GetTicks
        mov dword [dword_11D3C4], eax
        call sub_C04AE
        mov dword [dword_11D3C0], eax
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        call GetTicks
        sub eax, dword [dword_11D3C4]
        imul eax, dword [dword_11D3B8]
        mov ebx, 64h
        cdq
        idiv ebx
        add eax, dword [dword_11D3C0]
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        call GetTicks
        imul eax, dword [dword_11D3B8]
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
        call sub_C1FC0
        push byte 20h
        push dword 35C60h
        push str_TEMP
        mov dword [dword_17C994], eax
        call sub_AB758
        add esp, byte 0Ch
        push byte 20h
        push dword 2000h
        push dword 7A120h
        mov esi, eax
        call CdStreamOpenDefault
        add esp, byte 0Ch
        push esi
        mov dword [dword_17C988], eax
        call FreeMemBlock
        add esp, byte 4
        push byte 20h
        push dword 35C60h
        push dword 0FFh
        push byte 31h
        call CdStreamOpenSecondary
        add esp, byte 10h
        push edi
        push dword [dword_17C988]
        mov dword [dword_17C99C], eax
        call CdStreamStart
        add esp, byte 8
        cmp dword [dword_17C984], byte 0
        je short .1
        mov eax, dword [dword_17C99C]
        call sub_C0252
.1:
        call TgvClock
        mov dword [dword_17C970], eax
        call sub_C2268
        mov dword [dword_17C980], 0
        mov dword [tgvpalpending], 0
        mov dword [dword_17C964], 0
        mov dword [dword_17C958], 0
        mov dword [dword_17C960], 0
        mov dword [dword_17C968], 0
        mov dword [dword_17C954], 0
        mov dword [dword_17C950], 0
        mov dword [dword_17C944], 0
        mov dword [byte_17C95C], 0
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
        shl dword [dword_17C944], 1
        cmp dword [dword_17C984], byte 0
        je near .9
        cmp dword [dword_17C964], byte 0
        je short .1
        cmp dword [dword_17C948], byte 0
        je short .2
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
        je short .2
.1:
        mov eax, dword [dword_17C974]
        call sub_BFE4C
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
        call sub_C03EA
        mov ebx, edx
        test eax, eax
        je short .7
        test edx, edx
        jne short .7
        cmp dword [dword_17C948], byte 0
        je short .4
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
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
        or byte [byte_17C95C], 4
.8:
        mov eax, dword [dword_17C974]
        call sub_BFE4C
        push byte 1
        call WaitTicks
        add esp, byte 4
.9:
        push dword [dword_17C988]
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
        mov dword [dword_17C980], 0
        call GetTicks
        mov esi, eax
.2:
        push dword [dword_17C988]
        call CdStreamNextPacket
        add esp, byte 4
        mov dword [dword_17C98C], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .3
        mov dword [dword_17C958], 1
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
        mov eax, dword [dword_17C98C]
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [dword_17C978], eax
        cmp eax, 54475666h
        jb short .6
        jbe short .5
        cmp eax, 5447566Bh
        jne short .6
        mov dword [tgvpalpending], 1
.5:
        push dword [dword_17C98C]
        push dword [dword_17C994]
        call sub_C1FEC
        add esp, byte 8
        mov dword [dword_17C980], eax
        cmp dword [tgvpalpending], byte 0
        je short .6
        push dword 300h
        mov eax, dword [dword_17C994]
        push unk_17C644
        add eax, byte 44h
        push eax
        call bcopy
        add esp, byte 0Ch
.6:
        push dword [dword_17C98C]
        push dword [dword_17C988]
        call CdStreamFreePacket
        add esp, byte 8
.7:
        call GetTicks
        sub eax, esi
        cmp eax, 190h
        setge al
        movzx eax, al
        mov edi, eax
        cmp dword [dword_17C980], byte 0
        jne short .11
        test eax, eax
        jne short .11
        cmp dword [dword_17C958], byte 0
        jne short .11
        cmp dword [dword_17C948], byte 0
        je short .8
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
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
        mov dword [dword_17C958], 0FFFFFFFFh
        or byte [byte_17C95C], 1
.12:
        mov eax, dword [dword_17C960]
        mov dword [dword_17C97C], eax
        inc eax
        inc eax
        mov dword [dword_17C998], eax
        call GetTicks
        mov edi, eax
.13:
        push dword [dword_17C99C]
        call CdStreamNextPacket
        add esp, byte 4
        mov dword [dword_17C98C], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .15
.14:
        mov dword [dword_17C964], 1
        jmp near .19
.15:
        cmp eax, byte 0FFFFFFFDh
        jl short .16
        cmp eax, byte 1
        jge short .16
        cmp dword [dword_17C958], byte 1
        jne near .19
        jmp short .14
.16:
        call GetTicks
        mov dword [dword_17C954], 1
        mov edi, eax
        cmp dword [dword_17C984], byte 0
        je short .17
        mov eax, dword [dword_17C98C]
        call sub_C032E
        cmp dword [dword_17C968], byte 0
        jne short .19
        mov eax, 2
        call sub_C0423
        cmp eax, 20000h
        jle short .19
        call sub_C02D6
        mov dword [dword_17C968], 1
        mov dword [dword_17C974], eax
        jmp short .18
.17:
        push dword [dword_17C98C]
        push dword [dword_17C99C]
        call CdStreamFreePacket
        add esp, byte 8
        cmp dword [dword_17C968], byte 0
        jne short .19
        mov dword [dword_17C968], 1
.18:
        call TgvClock
        mov dword [dword_17C970], eax
.19:
        call TgvClock
        mov esi, dword [dword_17C970]
        sub eax, esi
        mov dword [dword_17C990], eax
        cmp dword [dword_17C968], byte 0
        jne short .20
        cmp dword [dword_17C954], byte 0
        jne short .20
        sub eax, esi
        cmp eax, dword [dword_11D3B8]
        jle short .20
        mov dword [dword_17C968], 1
        call TgvClock
        mov dword [dword_17C970], eax
.20:
        call GetTicks
        sub eax, edi
        cmp eax, 190h
        setge al
        movzx eax, al
        mov esi, eax
        mov eax, dword [dword_17C990]
        cmp eax, dword [dword_17C97C]
        jl short .21
        cmp dword [dword_17C968], byte 0
        je short .21
        cmp dword [dword_17C958], byte 1
        jne short .28
.21:
        mov eax, dword [dword_17C990]
        cmp eax, dword [dword_17C97C]
        jle short .22
        cmp dword [dword_17C964], byte 0
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
        cmp dword [dword_17C948], byte 0
        je short .25
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
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
        mov dword [dword_17C964], 1
        or byte [byte_17C95C], 2
.29:
        cmp dword [dword_17C980], byte 0
        je short .30
        inc dword [dword_17C960]
.30:
        mov eax, dword [dword_17C990]
        cmp eax, dword [dword_17C998]
        jl short .37
        cmp dword [dword_11D3BC], byte 0
        jne short .37
        cmp dword [dword_17C958], byte 0
        je short .31
        cmp dword [dword_17C964], byte 0
        jne short .32
.31:
        mov eax, 1
        jmp short .33
.32:
        xor eax, eax
.33:
        test eax, eax
        je short .37
        cmp dword [dword_17C948], byte 0
        je short .34
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
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
        mov eax, dword [dword_17C980]
        inc dword [dword_17C950]
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
        call sub_C2290
        add esp, byte 0Ch
        cmp dword [tgvpalpending], byte 0
        je short .2
        call sub_C2440
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
        push unk_17C644
        push dword 100h
        push byte 0
        call sub_DD830
        add esp, byte 0Ch
        call sub_C2442
        mov dword [tgvpalpending], 0
.3:
        xor byte [byte ebp-04h], 1
        cmp dword [dword_17C948], byte 0
        je short .4
        call dword [dword_17C948]
        or dword [dword_11D3BC], eax
        jne short .5
.4:
        cmp dword [dword_11D3BC], byte 0
        je short .7
.5:
        mov edi, 0FFFFFFFFh
        jmp short .7
.6:
        cmp dword [dword_11D3BC], byte 0
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
        mov dword [dword_17C984], eax
        test eax, eax
        sete al
        movzx eax, al
        mov dword [dword_17C94C], eax
        mov eax, 2
        call SetGraphicsMode
        mov dword [dword_17C948], ecx
        test ecx, ecx
        je short .2
.1:
        call dword [dword_17C948]
        test eax, eax
        jne short .1
.2:
        mov eax, esi
        mov dword [dword_11D3BC], 0
        call TgvPlayFrames
        test eax, eax
        setl al
        movzx esi, al
        mov eax, 1
        mov dword [dword_17C948], 0
        call SetGraphicsMode
        push dword [dword_17C994]
        call sub_C204C
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
