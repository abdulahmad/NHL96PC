; NHL 96 PC structure field offsets: the player structure (SortCords entries, A0h bytes each) and the team structure
; (hmtmstruct / awtmstruct, 136h bytes), with the NHL95PC names (src/inc/structs.inc there), then 96G / 95G / 94G.
; Equates only; operands keep their displacement size, so the bytes do not change.
; Player structure: below 66h the layout is 95PC's (setplayer writes the roster bytes to the same offsets in the same
; order; defaultsprites_0 / updateplayers / check4bench match field for field). 96 inserts 1Ch bytes after handed
; (65h): radiusx .. OldZpos are 95PC + 1Ch (defaultsprites_0 writes radiusx / radiusy / SCnum / tmptr / optmptr at
; 82h / 84h / 86h / 88h / 8Ch, updateplayers saves Xpos / Ypos / Zpos to 90h / 94h / 98h), and 63h is new (fighting).
; Team structure: offsets from the hmtm* data names (hmtmstruct + n); 95PC field names where the role is the same.
; A 16.16 field (size d) is read as words too: Name (fraction) and Name+2 (integer).

; ---- player structure
Xpos       equ 00h   ; size d
Ypos       equ 04h   ; size d
Zpos       equ 08h   ; size d
Xvel       equ 0Ch   ; size w
Yvel       equ 0Eh   ; size w
Zvel       equ 10h   ; size w
frame      equ 12h   ; size w
impactp    equ 14h   ; size w
limpact    equ 16h   ; size w
impact     equ 18h   ; size w
position   equ 1Ah   ; size w
assnum     equ 1Ch   ; size w
asslist    equ 1Eh   ; size b
temp1      equ 26h   ; size w
temp2      equ 28h   ; size w
temp3      equ 2Ah   ; size w
temp4      equ 2Ch   ; size w
temp5      equ 2Eh   ; size w
Wallcos    equ 30h   ; size w
Wallsin    equ 32h   ; size w
facedir    equ 36h   ; size w
SPA        equ 38h   ; size w
SPAnum     equ 3Ah   ; size w
SPAcnt     equ 3Ch   ; size w
nopuck     equ 3Eh   ; size w
newpos     equ 42h   ; size b
newpnum    equ 43h   ; size b
pflags     equ 44h   ; size b
pflags2    equ 45h   ; size b
pnum       equ 47h   ; size b; setplayer: byte [x+47h] = roster number (edx)
puckdist   equ 4Eh   ; size w; updateplayers: vecdist(puck - player)
puckdir    equ 52h   ; size b; updateplayers: vtoa(puck - player)
passlane   equ 53h   ; size b; setplayer clears it, as in 95PC
attrlo     equ 54h   ; size b; low byte of the attribute word (defaultsprites_0 writes word [x+54h])
attribute  equ 55h   ; size b; setplayer: bit 3 from handed
weight     equ 56h   ; size b; setplayer writes the ratings in 95PC's order and offsets (56h-65h)
legstr     equ 57h   ; size b
legspd     equ 58h   ; size b
aioff      equ 59h   ; size b
aidef      equ 5Ah   ; size b
shotspd    equ 5Bh   ; size b
shotacc    equ 5Ch   ; size b
passacc    equ 5Dh   ; size b
rostnum    equ 5Eh   ; size b; jersey number
spodds     equ 5Fh   ; size b
stickhand  equ 60h   ; size b
endurance  equ 61h   ; size b
aggress    equ 62h   ; size b
fighting   equ 63h   ; size b; 96G name (fight rating): SetInst tests it on both players, assfight scales the fight strength by (fighting & 7) + 8, a check adds 1 more to GameHitCount when it is 0 (96G: 2 more to ChkCnt)
checking   equ 64h   ; size b
handed     equ 65h   ; size b
radiusx    equ 82h   ; size w; 95PC 66h
radiusy    equ 84h   ; size w; 95PC 68h
SCnum      equ 86h   ; size w; 95PC 6Ah
tmptr      equ 88h   ; size d; 95PC 6Ch: the player's own team structure (defaultsprites_0 by pflags bit 6)
optmptr    equ 8Ch   ; size d; 95PC 70h: the other team's structure
OldXpos    equ 90h   ; size d; 95PC 74h (updateplayers)
OldYpos    equ 94h   ; size d; 95PC 78h
OldZpos    equ 98h   ; size d; 95PC 7Ch

; ---- team structure (hmtmstruct + n; the hm / aw data names give the offsets)
tmPwrGoals equ 02h   ; tsize w; hmtmPwrGoals
tmPwrPlays equ 04h   ; tsize w; hmtmPwrPlays
tmPPShots  equ 06h   ; tsize w; hmtmPPShots
tmpptime   equ 08h   ; tsize w; hmtmPwrPlayTime (95PC tmpptime)
tmPenalties equ 0Ah  ; tsize w; hmtmPenalties
tmPenmin   equ 0Ch   ; tsize w; hmtmPenMin
tmATOP     equ 0Eh   ; tsize w; hmtmATOP; chkatop adds 1 as in 95PC
tmscore    equ 10h   ; tsize w; hmscore
tmSHGoals  equ 12h   ; tsize w; hmtmSHGoals
tmfowon    equ 14h   ; tsize w; hmtmFaceoffsWon (95PC tmfowon)
tmOneTimers equ 1Ah  ; tsize w; hmtmOneTimers
tmOneTimerGoals equ 1Ch ; tsize w; hmtmOneTimerGoals
tmBreakaways equ 1Eh ; tsize w; hmtmBreakaways
tmBreakawayGoals equ 20h ; tsize w; hmtmBreakawayGoals
tmPenShots equ 22h   ; tsize w; hmtmPenShots
tmPenShotGoals equ 24h ; tsize w; hmtmPenShotGoals
tmChecks   equ 26h   ; tsize w; hmtmChecks
tmpasses   equ 28h   ; tsize w; hmpassatt (95PC tmpasses)
tmpasscomp equ 2Ah   ; tsize w; hmpasscmp (95PC tmpasscomp)
tmline     equ 2Ch   ; tsize w; hmtmline (95PC 2Ah)
tmlcnt     equ 2Eh   ; tsize w; hmtmlcnt (95PC 2Ch)
tmextra    equ 30h   ; tsize w; hmtmextra (95PC 2Eh)
tmap       equ 38h   ; tsize w; hmtmap (95PC 36h); releasepl adds 1 as in 95PC
tmgoalie   equ 3Ah   ; tsize w; hmtmgoalie (95PC 38h)
tmpde      equ 48h   ; tsize w array; energy word per roster player (95PC 46h): assfight reads [tmptr+pnum*2+48h]
tmpdst     equ 80h   ; tsize w array; hmtmpdst (95PC 7Eh): setplayer writes -1 at [team+pnum*2+80h]
tmboxlist  equ 0B8h  ; tsize b array; hmtmpbox (95PC 0B6h)
tmlines    equ 112h  ; tsize d; hmtmlines (95PC 0DAh)
tmplstats  equ 11Eh  ; tsize d; hmtmplstats (95PC 0E6h)
tmglstats  equ 122h  ; tsize d; hmtmglstats (95PC 0EAh)
tmroster   equ 126h  ; tsize d; hmtmroster (95PC 0EEh): setplayer marks the player on the ice (4)
tmsort     equ 12Eh  ; tsize d; hmtmsort (95PC 0F6h)
