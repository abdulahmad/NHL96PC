; The intro at start-up (screens and movies) and the slide shows, the credits at shut-down (96 PC).
bits 32
%include "hockey.inc"
section s_62FD8 progbits alloc exec nowrite align=1
extern __STOSD, byte_11FA2F, CloseMusic, DrawColorText, dword_17BDD4, dword_17BDD8, dword_17BDDC, FadeOut
extern FadeOutMusic, FadePalette, FillMusicStream, FillRect, fputchar, GetPressedDevice, GetTicks, LoadPackedFile
extern MakeDataPath, off_11BDA8, OpenMusicStream, PaEvent, PlayMovie, PlayMusic, PutBlock, QueueMusic
extern rand_, SetScreenColors, SetScreenMode, SetTextColors, SetTickDeadline, SoundIdle, SoundSecondsToBytes, StopMusic
extern str_Bkgd3, str_Nhll, str_Nhlp, str_Pal2, str_Pal8, str_Pal9, str_Pl0, str_Pl1
extern str_Scr1, str_Scr2, RunAttractMode, GetLangText, sub_AADA4, AllocMemBlock, FreeMemBlock, sub_AD35C
extern sub_ADBEC, SaveTextState, SetDrawTarget, sub_BF120, sub_BF2C4, SetScreenTarget, sub_DD7B8, KbdGetKey
extern sub_E04E0, sub_E0584, TextSetFont, TickDeadlinePassed, unk_11BFA4, word_11D1D0
global PlayIntroMovies, RunIntro, WaitOrSkip, LoadSlideImage, RunSlideEvents, jpt_634F9, RunSlideShow, RunSlideShow_78
global RunSlideShow_A3, RunSlideShow_C7, RunSlideShow_E2, RunSlideShow_118, RunSlideShow_127, RunSlideShow_145, RunSlideShow_180, RunSlideShow_1A1
global RunSlideShow_1B2, RunSlideShow_1D3, RunSlideShow_206, RunSlideShow_215, RunSlideShow_248, RunSlideShow_27C, RunSlideShow_2C3, RunSlideShow_2E0
global RunCredits
;-----------------------------------------------------------------------------
; PlayIntroMovies                              62FD8  96 PC, medium confidence
; The intro movies (data 0BEh + CD speed) with music stopped; a pressed
; device skips
;-----------------------------------------------------------------------------
PlayIntroMovies:
        push ebx
        push ecx
        push edx
        enter 34h, 0
        xor eax, eax
        call SetScreenMode
.1:
        call CloseMusic
        mov ax, word [word_11D1D0]
        xor ah, ah
        and al, 1
        mov ecx, GetPressedDevice
        movsx edx, ax
        lea eax, [byte ebp-034h]
        add edx, 0BEh
        xor ebx, ebx
        call MakeDataPath
        mov edx, 1
        lea eax, [byte ebp-034h]
        call PlayMovie
        mov edx, eax
        test eax, eax
        jne short .2
        mov ax, word [word_11D1D0]
        xor ah, ah
        and al, 1
        mov ecx, GetPressedDevice
        movsx edx, ax
        lea eax, [byte ebp-034h]
        add edx, 0C0h
        mov ebx, 1
        call MakeDataPath
        lea eax, [byte ebp-034h]
        xor edx, edx
        call PlayMovie
        mov edx, eax
.2:
        call OpenMusicStream
        test edx, edx
        jne short .3
        call RunAttractMode
        mov edx, eax
.3:
        test edx, edx
        je short .1
        mov eax, 1
        call SetScreenMode
        mov eax, edx
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunIntro                                     63076  96 PC, medium confidence
; From StartUp: the intro screens (scr1, scr2, !pl0, !pl1, backgrounds) with
; music, then the movies
;-----------------------------------------------------------------------------
RunIntro:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 2Ch, 0
        mov dword [byte ebp-010h], 0
.1:
        call GetPressedDevice
        test eax, eax
        jne short .1
        mov eax, 0BDh
        xor edx, edx
        call LoadPackedFile
        push byte 20h
        push dword 300h
        push str_Scr1
        mov dword [byte ebp-04h], eax
        mov dword [byte ebp-020h], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 300h
        push str_Scr2
        mov dword [byte ebp-08h], eax
        mov dword [byte ebp-0Ch], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 300h
        push str_Pal2
        mov dword [byte ebp-014h], eax
        mov dword [byte ebp-01Ch], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push str_Pl0
        mov edi, dword [byte ebp-08h]
        mov dword [byte ebp-018h], eax
        push dword [byte ebp-04h]
        mov dword [byte ebp-02Ch], eax
        call sub_E04E0
        add esp, byte 8
        mov ecx, 300h
        lea esi, [byte eax+010h]
        rep movsb
        push str_Pl1
        push dword [byte ebp-04h]
        mov edi, dword [byte ebp-014h]
        call sub_E04E0
        add esp, byte 8
        mov ecx, 300h
        lea esi, [byte eax+010h]
        rep movsb
        mov eax, 0BCh
        mov edi, dword [byte ebp-08h]
        call QueueMusic
        mov eax, 2
        mov ecx, 3
        call SoundSecondsToBytes
        call FillMusicStream
        add edi, byte 6
        mov eax, 3Fh
        rep stosb
        mov edi, dword [byte ebp-08h]
        mov ecx, 3
        xor eax, eax
        add edi, byte 9
        rep stosb
        mov edi, dword [byte ebp-014h]
        mov ecx, 3
        xor eax, eax
        add edi, byte 6
        rep stosb
        mov edi, dword [byte ebp-014h]
        mov ecx, 3
        mov eax, 3Fh
        add edi, byte 9
        rep stosb
        mov ecx, 300h
        mov eax, 3Fh
        mov edi, dword [byte ebp-018h]
        rep stosb
        push dword [byte ebp-018h]
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push str_Bkgd3
        push dword [byte ebp-04h]
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AADA4
        add esp, byte 4
        push str_Nhll
        push dword [byte ebp-04h]
        call sub_E04E0
        add esp, byte 8
        push eax
        mov esi, eax
        call sub_AADA4
        add esp, byte 4
        mov ebx, 2
        mov edx, dword [byte ebp-08h]
        call PlayMusic
        xor eax, eax
        call FadePalette
        push dword 136h
        call SetTickDeadline
        add esp, byte 4
.2:
        call TickDeadlinePassed
        test eax, eax
        jne short .4
        cmp dword [byte ebp-010h], byte 0
        jne short .3
        call GetPressedDevice
        mov dword [byte ebp-010h], eax
.3:
        call SoundIdle
        jmp short .2
.4:
        mov edi, dword [byte ebp-0Ch]
        mov ecx, 25Bh
        mov ebx, 2
        xor eax, eax
        add edi, byte 0Ch
        mov edx, dword [byte ebp-0Ch]
        rep stosb
        xor eax, eax
        call FadePalette
        push byte 0
        movsx eax, word [byte esi+06h]
        push eax
        movsx eax, word [byte esi+04h]
        push eax
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        call FillRect
        add esp, byte 14h
        push str_Nhlp
        push dword [byte ebp-020h]
        call sub_E04E0
        add esp, byte 8
        push eax
        mov edi, dword [byte ebp-0Ch]
        mov esi, dword [byte ebp-01Ch]
        call sub_AADA4
        mov ecx, 0Ch
        add esp, byte 4
        mov ebx, 3
        mov edx, dword [byte ebp-0Ch]
        rep movsb
        xor eax, eax
        call FadePalette
        mov ebx, 2
        mov edx, dword [byte ebp-01Ch]
        xor eax, eax
        call FadePalette
        push dword 136h
        call SetTickDeadline
        add esp, byte 4
.5:
        call TickDeadlinePassed
        test eax, eax
        jne short .7
        cmp dword [byte ebp-010h], byte 0
        jne short .6
        call GetPressedDevice
        mov dword [byte ebp-010h], eax
.6:
        call SoundIdle
        jmp short .5
.7:
        mov eax, 2
        call FadeOut
        push dword [byte ebp-02Ch]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-01Ch]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-0Ch]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-020h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 14h
        xor edx, edx
        call FadeOutMusic
        call StopMusic
        cmp dword [byte ebp-010h], byte 0
        jne short .8
        call PlayIntroMovies
.8:
        call GetTicks
        lea esi, [byte eax+0Ah]
        xor edi, edi
.9:
        call GetTicks
        cmp eax, esi
        jge short .10
        call KbdGetKey
        jmp short .9
.10:
        mov eax, 0B8h
        xor edx, edx
        call LoadPackedFile
        push str_Bkgd3
        push eax
        mov esi, eax
        mov dword [byte ebp-024h], eax
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AADA4
        add esp, byte 4
        push str_Pal8
        push esi
        call sub_E04E0
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov ebx, 32h
        call rand_
        cdq
        idiv ebx
        cmp edx, byte 19h
        jle short .11
        mov eax, 41h
        jmp short .12
.11:
        mov eax, 42h
.12:
        call QueueMusic
        mov eax, 6
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
        push dword 1000h
        mov ebx, 2
        call PaEvent
        add esp, byte 4
        mov edx, esi
        xor eax, eax
        call FadePalette
        call GetTicks
        add eax, 0C8h
        mov dword [byte ebp-028h], eax
        call GetTicks
        lea esi, [dword eax+03E8h]
.13:
        call SoundIdle
        call GetTicks
        cmp eax, esi
        jle short .14
        mov edi, 1
        jmp short .15
.14:
        call GetTicks
        cmp eax, dword [byte ebp-028h]
        jle short .15
        call GetPressedDevice
        mov edi, eax
.15:
        test edi, edi
        je short .13
        mov eax, 3
        call FadeOut
        push dword [byte ebp-024h]
        call FreeMemBlock
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; WaitOrSkip                                   63418  96 PC, medium confidence
; (ticks): waits, running the slide events, until the time is up or a device
; is pressed; returns the device
;-----------------------------------------------------------------------------
WaitOrSkip:
        push ebx
        push ecx
        push edx
        push esi
        push eax
        call SetTickDeadline
        xor esi, esi
        add esp, byte 4
.1:
        call TickDeadlinePassed
        test eax, eax
        jne short .3
        test esi, esi
        jne short .3
        test eax, eax
        jne short .2
        call GetPressedDevice
        mov esi, eax
.2:
        call RunSlideEvents
        call SoundIdle
        jmp short .1
.3:
        mov eax, esi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadSlideImage                                  63452  96 PC, low confidence
; (file id): loads a slide show image unless it is the current one (fills the
; music stream first)
;-----------------------------------------------------------------------------
LoadSlideImage:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp eax, dword [dword_17BDD8]
        je short .2
        cmp dword [dword_17BDD4], byte 0
        je short .1
        push dword [dword_17BDD4]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        xor edx, edx
        mov eax, esi
        call LoadPackedFile
        mov dword [dword_17BDD4], eax
        mov dword [dword_17BDD8], esi
.2:
        mov eax, dword [dword_17BDD4]
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunSlideEvents                                  634A4  96 PC, low confidence
; Runs the slide show's timed events (handler table off_11BDA8)
;-----------------------------------------------------------------------------
RunSlideEvents:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, dword [dword_17BDDC]
        test esi, esi
        je short .2
        call GetTicks
        sub eax, dword [byte esi+014h]
        cmp eax, dword [byte esi+018h]
        jl short .2
        push dword [byte esi+08h]
        mov ebx, dword [byte esi+0Ch]
        mov edx, dword [byte esi+028h]
        push dword [byte esi+04h]
        mov eax, dword [esi]
        push dword [edx+ebx*4]
        call dword [nosplit eax*4+off_11BDA8]
        inc dword [byte esi+0Ch]
        mov eax, dword [byte esi+0Ch]
        add esp, byte 0Ch
        cmp eax, dword [byte esi+010h]
        jl short .1
        mov dword [byte esi+0Ch], 0
.1:
        call GetTicks
        mov dword [byte esi+014h], eax
.2:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
jpt_634F9:
        dd RunSlideShow_78
        dd RunSlideShow_A3
        dd RunSlideShow_C7
        dd RunSlideShow_E2
        dd RunSlideShow_118
        dd RunSlideShow_127
        dd RunSlideShow_145
        dd RunSlideShow_180
        dd RunSlideShow_1A1
        dd RunSlideShow_1B2
        dd RunSlideShow_1D3
        dd RunSlideShow_1D3
        dd RunSlideShow_206
        dd RunSlideShow_215
        dd RunSlideShow_248
        dd RunSlideShow_27C
        dd RunSlideShow_2C3
        dd RunSlideShow_2E0
;-----------------------------------------------------------------------------
; RunSlideShow                                 63541  96 PC, medium confidence
; (script): runs a slide show script (13h ends)
;-----------------------------------------------------------------------------
RunSlideShow:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 5Ch, 0
        mov esi, eax
        mov ecx, 1
        mov eax, dword_17BDDC
        mov dword [byte ebp-010h], 0
        xor edx, edx
        mov dword [byte ebp-08h], 0
        call __STOSD
        lea eax, [byte ebp-05Ch]
        mov dword [byte ebp-04h], 0
        push eax
        mov dword [dword_17BDD8], 0FFFFFFFFh
        mov dword [dword_17BDD4], 0
        call SaveTextState
        add esp, byte 4
.1:
        cmp dword [esi], byte 13h
        je near RunSlideShow_2E0.13
        cmp dword [byte ebp-010h], byte 0
        jne near RunSlideShow_2E0.13
        mov eax, dword [esi]
        dec eax
        cmp eax, byte 11h
        ja near RunSlideShow_2E0.12
        jmp dword [nosplit cs:eax*4+jpt_634F9]
RunSlideShow_78:
        cmp dword [byte ebp-04h], byte 0
        je short .2
        push dword [byte ebp-04h]
        call sub_ADBEC
        add esp, byte 4
.2:
        push byte 0
        mov eax, dword [byte esi+08h]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte ebp-04h], eax
        jmp near RunSlideShow_2E0.12
RunSlideShow_A3:
        mov eax, dword [byte esi+04h]
        call LoadSlideImage
        mov dword [dword_17BDD4], eax
        push dword [byte esi+08h]
        push eax
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AADA4
        jmp near RunSlideShow_2E0.11
RunSlideShow_C7:
        mov eax, dword [byte esi+08h]
        push dword [byte eax+04h]
        push dword [eax]
        mov eax, dword [byte ebp-04h]
        push dword [byte eax+02Ch]
        call sub_BF120
.3:
        add esp, byte 0Ch
        jmp near RunSlideShow_2E0.12
RunSlideShow_E2:
        mov eax, dword [byte esi+04h]
        call LoadSlideImage
        push str_Pal9
        push eax
        mov dword [dword_17BDD4], eax
        call sub_E04E0
        lea edx, [byte eax+010h]
        add esp, byte 8
        mov eax, edx
        mov ebx, 3
        call SetScreenColors
        xor eax, eax
        call FadePalette
        jmp near RunSlideShow_2E0.12
RunSlideShow_118:
        mov eax, 3
        call FadeOut
        jmp near RunSlideShow_2E0.12
RunSlideShow_127:
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte esi+04h]
        sar eax, 8
        and edx, 0FFh
        and eax, 0FFh
        call SetTextColors
        jmp near RunSlideShow_2E0.12
RunSlideShow_145:
        cmp dword [byte ebp-08h], byte 0
        je short .4
        push dword [byte ebp-08h]
        call FreeMemBlock
        add esp, byte 4
.4:
        mov eax, 2
        mov edx, 20h
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [byte esi+04h]
        call LoadPackedFile
        push eax
        mov dword [byte ebp-08h], eax
        call TextSetFont
        jmp near RunSlideShow_2E0.11
RunSlideShow_180:
        mov eax, dword [byte esi+04h]
        call QueueMusic
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call PlayMusic
        jmp near RunSlideShow_2E0.12
RunSlideShow_1A1:
        mov eax, 32h
        xor edx, edx
        call FadeOutMusic
        jmp near RunSlideShow_2E0.12
RunSlideShow_1B2:
        movzx eax, byte [byte_11FA2F]
        mov edx, dword [byte esi+04h]
        imul eax, edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov edx, 0F0h
        sub edx, eax
        mov dword [byte ebp-0Ch], edx
        jmp near RunSlideShow_2E0.12
RunSlideShow_1D3:
        cmp dword [esi], byte 0Bh
        jne short .5
        mov edi, dword [byte esi+08h]
        jmp short .6
.5:
        mov eax, dword [byte esi+04h]
        call GetLangText
        mov edi, eax
.6:
        push edi
        call fputchar
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov ebx, dword [byte ebp-0Ch]
        mov edx, 140h
        add esp, byte 4
        sub edx, eax
        mov eax, edi
        call DrawColorText
RunSlideShow_206:
        movzx eax, byte [byte_11FA2F]
        add dword [byte ebp-0Ch], eax
        jmp near RunSlideShow_2E0.12
RunSlideShow_215:
        mov edi, dword [byte esi+08h]
        mov eax, dword [byte edi+0Ch]
        call LoadSlideImage
        mov dword [dword_17BDD4], eax
        push dword [byte edi+010h]
        push eax
        call sub_E04E0
        add esp, byte 8
        push dword [byte edi+08h]
        mov edx, eax
        push dword [byte edi+04h]
        mov eax, dword [edi]
        push edx
        call dword [nosplit eax*4+off_11BDA8]
        jmp near RunSlideShow_C7.3
RunSlideShow_248:
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte esi+08h]
        call WaitOrSkip
        test eax, eax
        je short .8
.7:
        call GetPressedDevice
        test eax, eax
        jne short .7
        mov dword [byte ebp-010h], 0FFFFFFFFh
.8:
        push dword [byte edx+04h]
        mov eax, dword [byte ebp-04h]
        push dword [edx]
        push dword [byte eax+02Ch]
        call PutBlock
        jmp near RunSlideShow_C7.3
RunSlideShow_27C:
        cmp dword [byte esi+04h], byte 1
        jge near RunSlideShow_2E0.12
        mov eax, dword [byte esi+04h]
        mov edi, dword [byte esi+08h]
        mov dword [nosplit eax*4+dword_17BDDC], edi
        mov dword [byte edi+0Ch], 0
        call GetTicks
        mov edx, dword [byte edi+018h]
        sub eax, edx
        mov dword [byte edi+014h], eax
        mov eax, dword [byte edi+01Ch]
        call LoadSlideImage
        push dword [byte edi+028h]
        push dword [byte edi+024h]
        push eax
        mov dword [byte edi+020h], eax
        call sub_BF2C4
        jmp near RunSlideShow_C7.3
RunSlideShow_2C3:
        cmp dword [byte esi+04h], byte 1
        jge near RunSlideShow_2E0.12
        mov eax, dword [byte esi+04h]
        mov dword [nosplit eax*4+dword_17BDDC], 0
        jmp near RunSlideShow_2E0.12
RunSlideShow_2E0:
        mov edi, dword [byte esi+08h]
        mov eax, dword [byte edi+0Ch]
        call LoadSlideImage
        mov dword [dword_17BDD4], eax
        push dword [byte edi+010h]
        push eax
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-01Ch], eax
        mov dword [byte ebp-018h], eax
        push byte 0
        movsx eax, word [byte eax+06h]
        push eax
        mov eax, dword [byte ebp-01Ch]
        movsx eax, word [byte eax+04h]
        push eax
        call sub_AD35C
        mov edx, dword [byte ebp-01Ch]
        add esp, byte 0Ch
        movsx edx, word [byte edx+0Eh]
        push edx
        mov edx, dword [byte ebp-01Ch]
        movsx edx, word [byte edx+0Ch]
        push edx
        push dword [byte eax+02Ch]
        mov dword [byte ebp-014h], eax
        call sub_BF120
        add esp, byte 0Ch
        push dword [byte edi+08h]
        push dword [byte edi+04h]
        mov eax, dword [edi]
        push dword [byte ebp-01Ch]
        call dword [nosplit eax*4+off_11BDA8]
        add esp, byte 0Ch
        mov eax, dword [byte esi+04h]
        call WaitOrSkip
        test eax, eax
        je short .10
.9:
        call GetPressedDevice
        test eax, eax
        jne short .9
        mov dword [byte ebp-010h], 0FFFFFFFFh
.10:
        mov eax, dword [byte ebp-018h]
        movsx eax, word [byte eax+0Eh]
        push eax
        mov eax, dword [byte ebp-018h]
        movsx eax, word [byte eax+0Ch]
        push eax
        mov eax, dword [byte ebp-014h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp-014h]
        call sub_ADBEC
.11:
        add esp, byte 4
.12:
        call RunSlideEvents
        call SoundIdle
        add esi, byte 0Ch
        jmp near RunSlideShow.1
.13:
        mov eax, 3
        call FadeOut
        xor edx, edx
        mov eax, 32h
        call FadeOutMusic
        lea eax, [byte ebp-05Ch]
        push eax
        call SetDrawTarget
        add esp, byte 4
        cmp dword [dword_17BDD4], byte 0
        je short .14
        push dword [dword_17BDD4]
        call FreeMemBlock
        add esp, byte 4
.14:
        cmp dword [byte ebp-04h], byte 0
        je short .15
        push dword [byte ebp-04h]
        call sub_ADBEC
        add esp, byte 4
.15:
        cmp dword [byte ebp-08h], byte 0
        je short .16
        push dword [byte ebp-08h]
        call FreeMemBlock
        add esp, byte 4
.16:
        call SetScreenTarget
        push byte 0
        call sub_E0584
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunCredits                                      63955  96 PC, low confidence
; From ShutDown: waits for no device pressed, then the slide show unk_11BFA4
;-----------------------------------------------------------------------------
RunCredits:
        call GetPressedDevice
        test eax, eax
        jne short RunCredits
        mov eax, unk_11BFA4
        jmp near RunSlideShow
