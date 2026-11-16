; Playoff series: the Cup or a series clinched (96 PC).
bits 32
%include "hockey.inc"
section s_1E33C progbits alloc exec nowrite align=1
extern byte_17D262, dword_17D263, optflags, word_1656E8, word_16581E
global IsCupClinched, HomeClinchesSeries, HomeClinchesSeries_21, AwayClinchesSeries
;-----------------------------------------------------------------------------
; IsCupClinched                                1E33C  95 PC, medium confidence
; (score1, score2): with cupseries loaded, puts this game's score into the
; first unplayed final game, asks CupSeriesWinner (best-of from gameopts in
; Play-Off mode, else SeriesLength), restores the slot; returns 1 when this
; game wins the Cup; called from the engine end-of-game code
;-----------------------------------------------------------------------------
IsCupClinched:
        push ebx
        cmp eax, edx
        jle short .1
        mov ebx, dword [dword_17D263]
        and ebx, byte 3
        test bl, 2
        jne short .2
.1:
        cmp edx, eax
        jle short .3
        mov eax, dword [dword_17D263]
        and eax, byte 3
        test al, 1
        je short .3
.2:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        jne short .3
        movsx eax, byte [byte_17D262]
        cmp eax, byte 3
        jne short .3
        mov eax, 1
        pop ebx
        ret
.3:
        xor eax, eax
        pop ebx
        ret
;-----------------------------------------------------------------------------
; HomeClinchesSeries                           1E383  96 PC, medium confidence
; 1 when the home team is ahead and one win from taking the series
; (dword_17D263 bit 2)
;-----------------------------------------------------------------------------
HomeClinchesSeries:
        mov ax, word [word_1656E8]
        cmp ax, word [word_16581E]
        jle short HomeClinchesSeries_21
        mov eax, dword [dword_17D263]
        and eax, byte 3
        test al, 2
        je short HomeClinchesSeries_21
        mov eax, 1
        ret
HomeClinchesSeries_21:
        xor eax, eax
        ret
;-----------------------------------------------------------------------------
; AwayClinchesSeries                           1E3A7  96 PC, medium confidence
; 1 when the away team is ahead and one win from taking the series
; (dword_17D263 bit 1)
;-----------------------------------------------------------------------------
AwayClinchesSeries:
        mov ax, word [word_16581E]
        cmp ax, word [word_1656E8]
        jle short HomeClinchesSeries_21
        mov eax, dword [dword_17D263]
        and eax, byte 3
        test al, 1
        je short HomeClinchesSeries_21
        mov eax, 1
        ret
