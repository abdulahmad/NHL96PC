; Tables of penalty countdowns, penalty minutes and delays, and the assignment routine table (asstab).
bits 32
%include "hockey.inc"
section s_117938 progbits alloc noexec write align=1
extern assbench, assbenchside, assbenchwait, assboxenter, asscenterd, asscentero, asscoverdefd, asscoverdefo
extern asscupfollow, asscupleave, asscuptake, assdefd, assdefo, assdopen, asseben, assepen
extern assextra1, assfaceoff, assfaceoffpl, assfight, assfwatch, assgoalie, assgoalietopuck, assintroline
extern assintrostand, assleavebox, assleaveice, assnearest, asspassrec, asspenalty, asspenshooter, asspsclear
extern asspuckc, assrefatdot, assrefdrop, assreffollow, assrefgoalline, assrefgoalpa, assrefpenshot, assrefsignal
extern assrefwhistle, assscore, assshoot, assstanley, asstakeposition, asswingd, asswingo, puckfaceoff
extern puckfaceoff2, pucknorm, pucknothing, puckshadow, rtss
global PenCountdownOptTab, PenShotCountdownOpt, PenCountdownTab, PenShotCountdown, penmintab, pendelaytab, PenShotDelay, asstab
PenCountdownOptTab:                             ; Penalty countdown per penalty type with the game option set
                                                ; (gameopts+2 bit 3); used by checkfornewpen
        db 00h,0Ah,0Ah,03h,01h,00h,01h,01h,01h,0Ah,0Ah,04h,04h
PenShotCountdownOpt:                            ; Penalty shot countdown with the game option set; used by
                                                ; checkfornewpen
        db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,01h,00h
        db 01h,01h,01h,028h,028h,028h
PenCountdownTab:                                ; Penalty countdown per penalty type; used by checkfornewpen
        db 00h,0Ah,0Ah,06h,05h,00h,05h,05h,05h,0Ah,0Ah,07h,07h
PenShotCountdown:                               ; Penalty shot countdown; used by checkfornewpen
        db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,05h,00h
        db 05h,05h,05h,028h,028h,028h
penmintab:                                      ; used by AddPenalty2, InProgress, PenGoalStuff ...
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,00h,02h,02h,02h,02h,02h
        db 02h,02h,02h,02h,02h,02h,0FFh,05h,05h,05h,00h,00h,00h,00h,00h,02h
        db 05h,05h,02h
pendelaytab:                                    ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,02h,02h,02h
PenShotDelay:                                   ; Penalty shot delay; used by checkfornewpen
        db 02h,00h,02h,04h,02h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h
        db 02h,02h,02h,02h,02h,02h,02h,00h,02h,02h,02h,02h,00h,00h,00h
asstab:                                         ; used by updateplayers
        dd rtss
        dd assdefo
        dd assdefd
        dd asswingd
        dd asswingo
        dd asscenterd
        dd asscentero
        dd assscore
        dd assstanley
        dd asseben
        dd assepen
        dd assbench
        dd asspenalty
        dd assdopen
        dd assgoalie
        dd assgoalietopuck
        dd asspuckc
        dd assnearest
        dd assshoot
        dd asspassrec
        dd assextra1
        dd assextra1
        dd assfaceoff
        dd assfaceoffpl
        dd pucknorm
        dd puckshadow
        dd pucknothing
        dd puckfaceoff
        dd puckfaceoff2
        dd assleaveice
        dd assrefatdot
        dd assreffollow
        dd assrefsignal
        dd assrefgoalpa
        dd assrefdrop
        dd assrefgoalline
        dd assrefwhistle
        dd assintrostand
        dd assintroline
        dd asstakeposition
        dd assleavebox
        dd assbenchwait
        dd assboxenter
        dd assbenchside
        dd assrefpenshot
        dd asspsclear
        dd asspenshooter
        dd asscoverdefd
        dd asscoverdefo
        dd assfight
        dd assfwatch
        dd asscupfollow
        dd asscuptake
        dd asscupleave
