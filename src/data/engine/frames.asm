; Sprite animation tables: SPAlist and one sequence per animation.
bits 32
%include "hockey.inc"
section s_117A9C progbits alloc noexec write align=1
global SPAlist, CheckHitAnims, LinePickOrderFrom1
SPAlist:                                        ; the SPA table: every sprite animation sequence (flags,
                                                ; pair count, frame/time pairs); a sequence number is its
                                                ; word offset from here; used by HotSpotFrame, BenchSprite
        db 00h,00h
SPAstand:                                       ; SPA 0x1: standing still, facing the player direction
                                                ; (assfwatch, resetplstuff, asspenshooter) (confidence low)
        db 00h,00h,01h,00h
CheckHitAnims:                                  ; chkhit: hit animation per check type; used by chkhit
        db 00h,00h,0F6h,0FFh
SPAcoast:                                       ; SPA 0x5: coasting pose, first frame of the skate cycle held
                                                ; (RunPreGameSkate) (confidence low)
        db 00h,00h,01h,00h,08h,00h,0F6h,0FFh
SPAskate:                                       ; SPA 0x9: skating, no puck (noturn0 picks it when the player
                                                ; is not the puck carrier) (confidence medium)
        db 00h,00h,08h,00h,10h,00h,04h,00h,18h,00h,04h,00h,20h,00h,04h,00h
        db 28h,00h,04h,00h,30h,00h,04h,00h,38h,00h,04h,00h,40h,00h,04h,00h
        db 48h,00h,0FCh,0FFh
SPAskatewp:                                     ; SPA 0x1B: skating with the puck (noturn0 when the player is
                                                ; the puck carrier) (confidence medium)
        db 00h,00h,08h,00h,50h,00h,04h,00h,58h,00h,04h,00h,60h,00h,04h,00h
        db 68h,00h,04h,00h,70h,00h,04h,00h,78h,00h,04h,00h,80h,00h,04h,00h
        db 88h,00h,0FCh,0FFh
SPAskatewp2:                                    ; SPA 0x2D: skating with the puck, second pose set; the second
                                                ; sequence of the SPAskatewp pair (confidence medium)
        db 00h,00h,08h,00h,90h,00h,04h,00h,98h,00h,04h,00h,0A0h,00h,04h,00h
        db 0A8h,00h,04h,00h,0B0h,00h,04h,00h,0B8h,00h,04h,00h,0C0h,00h,04h,00h
        db 0C8h,00h,0FCh,0FFh
SPAstop:                                        ; SPA 0x3F: stop (dostop, not the puck carrier) (confidence
                                                ; medium)
        db 00h,00h,02h,00h,0B0h,04h,08h,00h,0B8h,04h,0E4h,0FFh
SPAstophold:                                    ; SPA 0x45: stop, held end frame (dostop switches to it when
                                                ; SPAstop ends) (confidence medium)
        db 01h,00h,01h,00h,0B8h,04h,0F0h,0FFh
SPAstopwp:                                      ; SPA 0x49: stop with the puck (dostop when the player is the
                                                ; puck carrier) (confidence medium)
        db 00h,00h,02h,00h,0D0h,00h,08h,00h,0D8h,00h,0E4h,0FFh
SPAstopwphold:                                  ; SPA 0x4F: stop with the puck, held end frame (confidence
                                                ; medium)
        db 01h,00h,01h,00h,0D8h,00h,0F0h,0FFh
SPAstopfast:                                    ; SPA 0x53: stop without the puck when dostop does not pick
                                                ; SPAstop (dostop) (confidence low)
        db 00h,00h,02h,00h,0C0h,03h,08h,00h,0C8h,03h,0E4h,0FFh
SPAstopfasthold:                                ; SPA 0x59: stop, held end frame of SPAstopfast (dostop)
                                                ; (confidence low)
        db 01h,00h,01h,00h,0C8h,03h,0F0h,0FFh
SPAturnlwp:                                     ; SPA 0x5D: turning left with the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,0F8h,00h,0F8h,0FFh
SPAturnl:                                       ; SPA 0x61: turning left without the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,0E8h,03h,0F8h,0FFh
SPAturnlwpin:                                   ; SPA 0x65: turning left with the puck, start of the turn (two
                                                ; frames; doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,0F0h,00h,08h,00h,0F8h,00h,0F8h,0FFh
SPAturnlin:                                     ; SPA 0x6B: turning left without the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,0E0h,03h,08h,00h,0E8h,03h,0F8h,0FFh
SPAturnrwp:                                     ; SPA 0x71: turning right with the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,0E8h,00h,0F8h,0FFh
SPAturnr:                                       ; SPA 0x75: turning right without the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,0D8h,03h,0F8h,0FFh
SPAturnrwpin:                                   ; SPA 0x79: turning right with the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,0E0h,00h,08h,00h,0E8h,00h,0F8h,0FFh
SPAturnrin:                                     ; SPA 0x7F: turning right without the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,0D0h,03h,08h,00h,0D8h,03h,0F8h,0FFh
SPAcheckswingl:                                 ; SPA 0x85: check swing to the left, not flagged as a check
                                                ; animation (DoCheckInput) (confidence low)
        db 00h,00h,04h,00h,10h,02h,08h,00h,18h,02h,08h,00h,20h,02h,08h,00h
        db 28h,02h,0F8h,0FFh
SPAcheckswingr:                                 ; SPA 0x8F: check swing to the right, not flagged as a check
                                                ; animation (DoCheckInput) (confidence low)
        db 00h,00h,04h,00h,0F0h,01h,08h,00h,0F8h,01h,08h,00h,00h,02h,08h,00h
        db 08h,02h,0F8h,0FFh
SPAskatefast:                                   ; SPA 0x99: skating fast without the puck (PickSkateAnim when
                                                ; speed is 0FA0h or more) (confidence medium)
        db 00h,00h,04h,00h,70h,01h,0Ah,00h,58h,01h,0Ah,00h,60h,01h,0Ah,00h
        db 68h,01h,0F6h,0FFh
SPAcoastl:                                      ; SPA 0xA3: coasting stride, left (FallDown tests it; two
                                                ; frames held) (confidence low)
        db 00h,00h,02h,00h,58h,01h,1Ch,00h,60h,01h,0E4h,0FFh
SPAcoastr:                                      ; SPA 0xA9: coasting stride, right (CrowdOnStoppage picks it
                                                ; at random) (confidence low)
        db 00h,00h,02h,00h,68h,01h,1Ch,00h,70h,01h,0E4h,0FFh
SPApassf:                                       ; SPA 0xAF: pass, forward side (dopass) (confidence medium)
        db 00h,00h,02h,00h,10h,01h,06h,00h,40h,01h,0ECh,0FFh
SPApassb:                                       ; SPA 0xB5: pass, backward side (dopass) (confidence medium)
        db 00h,00h,03h,00h,0C8h,04h,04h,00h,0D8h,04h,08h,00h,0E0h,04h,0F8h,0FFh
SPAshotf:                                       ; SPA 0xBD: shot, forward side (SetShotMode) (confidence
                                                ; medium)
        db 00h,00h,07h,00h,10h,01h,04h,00h,18h,01h,04h,00h,20h,01h,04h,00h
        db 28h,01h,04h,00h,30h,01h,04h,00h,48h,01h,04h,00h,50h,01h,0ECh,0FFh
SPAshotfquick:                                  ; SPA 0xCD: forward shot with the quick-release ending
                                                ; (ShotMode replaces SPAshotf by it, regd2 bit 5) (confidence
                                                ; low)
        db 00h,00h,07h,00h,10h,01h,04h,00h,18h,01h,04h,00h,20h,01h,04h,00h
        db 28h,01h,04h,00h,30h,01h,04h,00h,38h,01h,04h,00h,40h,01h,0ECh,0FFh
SPAshotb:                                       ; SPA 0xDD: shot, backward side (ShotMode) (confidence medium)
        db 00h,00h,07h,00h,0C0h,04h,02h,00h,0C8h,04h,02h,00h,0C8h,04h,02h,00h
        db 0D0h,04h,02h,00h,0D0h,04h,02h,00h,0D8h,04h,08h,00h,0E0h,04h,0F8h,0FFh
SPAfakeshotf:                                   ; SPA 0xED: faked shot, forward side (ShotMode) (confidence
                                                ; medium)
        db 00h,00h,07h,00h,10h,01h,04h,00h,18h,01h,04h,00h,20h,01h,04h,00h
        db 28h,01h,04h,00h,30h,01h,04h,00h,20h,01h,04h,00h,10h,01h,0FCh,0FFh
SPAfakeshotb:                                   ; SPA 0xFD: faked shot, backward side (ShotMode) (confidence
                                                ; medium)
        db 00h,00h,07h,00h,0C0h,04h,02h,00h,0C8h,04h,02h,00h,0C8h,04h,02h,00h
        db 0D0h,04h,02h,00h,0D0h,04h,02h,00h,0C8h,04h,04h,00h,0C0h,04h,0FCh,0FFh
SPAonetimef:                                    ; SPA 0x10D: one-timer, forward side (assonetimer) (confidence
                                                ; medium)
        db 00h,00h,04h,00h,28h,01h,18h,00h,38h,01h,02h,00h,38h,01h,02h,00h
        db 40h,01h,0ECh,0FFh
SPAonetimeb:                                    ; SPA 0x117: one-timer, backward side (assonetimer)
                                                ; (confidence medium)
        db 00h,00h,04h,00h,0D0h,04h,18h,00h,0D8h,04h,02h,00h,0D8h,04h,02h,00h
        db 0E0h,04h,0F8h,0FFh
SPAfakeonetimef:                                ; SPA 0x121: faked one-timer, forward side (assonetimer,
                                                ; ShotMode) (confidence medium)
        db 00h,00h,03h,00h,28h,01h,18h,00h,18h,01h,04h,00h,10h,01h,0FCh,0FFh
SPAfakeonetimeb:                                ; SPA 0x129: faked one-timer, backward side (assonetimer,
                                                ; ShotMode) (confidence medium)
        db 00h,00h,03h,00h,0D0h,04h,18h,00h,0C8h,04h,04h,00h,0C0h,04h,0FCh,0FFh
SPAboardback:                                   ; SPA 0x131: falling against the boards with the back to them
                                                ; (FallFrameByDir) (confidence medium)
        db 20h,00h,0Ch,00h,0F0h,05h,06h,00h,0F8h,05h,06h,00h,00h,06h,06h,00h
        db 08h,06h,06h,00h,10h,06h,06h,00h,18h,06h,06h,00h,0C0h,05h,14h,00h
        db 0F0h,06h,08h,00h,0F8h,06h,08h,00h,00h,07h,08h,00h,08h,07h,08h,00h
        db 10h,07h,0F8h,0FFh
SPAboardfront:                                  ; SPA 0x14B: falling against the boards facing them
                                                ; (FallFrameByDir) (confidence medium)
        db 20h,00h,0Ch,00h,20h,06h,06h,00h,28h,06h,06h,00h,30h,06h,06h,00h
        db 38h,06h,06h,00h,40h,06h,06h,00h,48h,06h,06h,00h,88h,05h,14h,00h
        db 18h,07h,08h,00h,20h,07h,08h,00h,28h,07h,08h,00h,30h,07h,08h,00h
        db 38h,07h,0F8h,0FFh
SPAboardleft:                                   ; SPA 0x165: falling against the boards, side-on, mirrored
                                                ; (FallFrameByDir) (confidence low)
        db 28h,00h,0Ch,00h,80h,06h,06h,00h,88h,06h,06h,00h,90h,06h,06h,00h
        db 98h,06h,06h,00h,0A0h,06h,06h,00h,0A8h,06h,06h,00h,0C0h,05h,14h,00h
        db 0F0h,06h,08h,00h,0F8h,06h,08h,00h,00h,07h,08h,00h,08h,07h,08h,00h
        db 10h,07h,0F8h,0FFh
SPAboardright:                                  ; SPA 0x17F: falling against the boards, side-on
                                                ; (FallFrameByDir) (confidence low)
        db 28h,00h,0Ch,00h,50h,06h,06h,00h,58h,06h,06h,00h,60h,06h,06h,00h
        db 68h,06h,06h,00h,70h,06h,06h,00h,78h,06h,06h,00h,88h,05h,14h,00h
        db 18h,07h,08h,00h,20h,07h,08h,00h,28h,07h,08h,00h,30h,07h,08h,00h
        db 38h,07h,0F8h,0FFh
SPAboardbackglass:                              ; SPA 0x199: falling back into the glass hard enough to break
                                                ; it (FallDown, FallFrameByFacing) (confidence low)
        db 18h,00h,08h,00h,0B0h,06h,06h,00h,0B8h,06h,06h,00h,0C0h,06h,06h,00h
        db 0C8h,06h,06h,00h,0F8h,06h,1Ch,00h,00h,07h,08h,00h,08h,07h,08h,00h
        db 10h,07h,0F8h,0FFh
SPAboardfrontglass:                             ; SPA 0x1AB: falling forward into the glass hard enough to
                                                ; break it (FallDown, FallFrameByFacing) (confidence low)
        db 18h,00h,08h,00h,0D0h,06h,06h,00h,0D8h,06h,06h,00h,0E0h,06h,06h,00h
        db 0E8h,06h,06h,00h,0F8h,06h,1Ch,00h,00h,07h,08h,00h,08h,07h,08h,00h
        db 10h,07h,0F8h,0FFh
SPAfallback:                                    ; SPA 0x1BD: falling backward after a check from the front
                                                ; (FallDown) (confidence medium)
        db 20h,00h,0Bh,00h,60h,05h,06h,00h,68h,05h,06h,00h,70h,05h,06h,00h
        db 78h,05h,06h,00h,80h,05h,06h,00h,88h,05h,14h,00h,18h,07h,08h,00h
        db 20h,07h,08h,00h,28h,07h,08h,00h,30h,07h,08h,00h,38h,07h,0F8h,0FFh
SPAfallfwd:                                     ; SPA 0x1D5: falling forward after a check from behind or the
                                                ; side (FallDown) (confidence medium)
        db 20h,00h,0Ch,00h,90h,05h,06h,00h,98h,05h,06h,00h,0A0h,05h,06h,00h
        db 0A8h,05h,06h,00h,0B0h,05h,06h,00h,0B8h,05h,06h,00h,0C0h,05h,14h,00h
        db 0F0h,06h,08h,00h,0F8h,06h,08h,00h,00h,07h,08h,00h,08h,07h,08h,00h
        db 10h,07h,0F8h,0FFh
SPAflip:                                        ; SPA 0x1EF: flipped over by a hard check (FallDown)
                                                ; (confidence medium)
        db 20h,00h,0Eh,00h,58h,07h,06h,00h,60h,07h,06h,00h,68h,07h,06h,00h
        db 70h,07h,06h,00h,78h,07h,06h,00h,80h,07h,06h,00h,88h,07h,06h,00h
        db 90h,07h,06h,00h,88h,05h,14h,00h,18h,07h,08h,00h,20h,07h,08h,00h
        db 28h,07h,08h,00h,30h,07h,08h,00h,38h,07h,0F8h,0FFh
SPAflipfwd:                                     ; SPA 0x20D: flipped over forward by a hard check from behind
                                                ; (FallDown) (confidence low)
        db 20h,00h,0Eh,00h,98h,07h,06h,00h,0A0h,07h,06h,00h,0A8h,07h,06h,00h
        db 0B0h,07h,06h,00h,0B8h,07h,06h,00h,0C0h,07h,06h,00h,0C8h,07h,06h,00h
        db 0D0h,07h,06h,00h,0C0h,05h,14h,00h,0F0h,06h,08h,00h,0F8h,06h,08h,00h
        db 00h,07h,08h,00h,08h,07h,08h,00h,10h,07h,0F8h,0FFh
SPAinjury1:                                     ; SPA 0x22B: injured player lying on the ice, held (FallDown)
                                                ; (confidence medium)
        db 20h,00h,36h,00h,60h,05h,06h,00h,68h,05h,06h,00h,70h,05h,06h,00h
        db 78h,05h,06h,00h,80h,05h,06h,00h,88h,05h,06h,00h,0C8h,05h,08h,00h
        db 0D0h,05h,08h,00h,0D8h,05h,08h,00h,0D0h,05h,08h,00h,0C8h,05h,09h,00h
        db 0D0h,05h,09h,00h,0D8h,05h,0Ah,00h,0D0h,05h,0Ah,00h,0C8h,05h,0Bh,00h
        db 0D0h,05h,0Bh,00h,0D8h,05h,0Ch,00h,0D0h,05h,32h,00h,0C8h,05h,08h,00h
        db 0D0h,05h,08h,00h,0D8h,05h,08h,00h,0D0h,05h,08h,00h,0C8h,05h,09h,00h
        db 0D0h,05h,09h,00h,0D8h,05h,0Ah,00h,0D0h,05h,0Ah,00h,0C8h,05h,0Bh,00h
        db 0D0h,05h,0Bh,00h,0D8h,05h,0Ch,00h,0D0h,05h,46h,00h,0C8h,05h,08h,00h
        db 0D0h,05h,08h,00h,0D8h,05h,08h,00h,0D0h,05h,08h,00h,0C8h,05h,09h,00h
        db 0D0h,05h,09h,00h,0D8h,05h,0Ah,00h,0D0h,05h,0Ah,00h,0C8h,05h,0Bh,00h
        db 0D0h,05h,0Bh,00h,0D8h,05h,0Ch,00h,0D0h,05h,3Ch,00h,0C8h,05h,08h,00h
        db 0D0h,05h,08h,00h,0D8h,05h,08h,00h,0D0h,05h,08h,00h,0C8h,05h,09h,00h
        db 0D0h,05h,09h,00h,0D8h,05h,0Ah,00h,0D0h,05h,0Ah,00h,0C8h,05h,0Bh,00h
        db 0D0h,05h,0Bh,00h,0D8h,05h,0Ch,00h,0D0h,05h,60h,0F0h
SPAstumble:                                     ; SPA 0x299: strong player stumbles instead of falling
                                                ; (FallDown) (confidence medium)
        db 00h,00h,04h,00h,60h,02h,07h,00h,68h,02h,07h,00h,70h,02h,07h,00h
        db 78h,02h,0F9h,0FFh
SPAblockleft:                                   ; SPA 0x2A3: skater dives to block a shot, left
                                                ; (BlockShotDive) (confidence medium)
        db 00h,00h,05h,00h,50h,02h,08h,00h,58h,02h,14h,00h,00h,07h,08h,00h
        db 08h,07h,08h,00h,10h,07h,0F8h,0FFh
SPAblockright:                                  ; SPA 0x2AF: skater dives to block a shot, right
                                                ; (BlockShotDive) (confidence medium)
        db 00h,00h,05h,00h,40h,02h,08h,00h,48h,02h,14h,00h,00h,07h,08h,00h
        db 08h,07h,08h,00h,10h,07h,0F8h,0FFh
SPAblockfront:                                  ; SPA 0x2BB: skater stands to block a high shot
                                                ; (BlockShotDive) (confidence medium)
        db 00h,00h,01h,00h,30h,02h,0ECh,0FFh
SPAblockknee:                                   ; SPA 0x2BF: skater drops to block a low shot (BlockShotDive)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,38h,02h,0ECh,0FFh
SPAburst:                                       ; SPA 0x2C3: burst of speed; the burst routine sets it
        db 18h,00h,08h,00h,10h,00h,04h,00h,18h,00h,04h,00h,20h,00h,04h,00h
        db 28h,00h,04h,00h,30h,00h,04h,00h,38h,00h,04h,00h,40h,00h,04h,00h
        db 48h,00h,0FCh,0FFh
SPAcrosscheck:                                  ; SPA 0x2D5: cross check; checkcheck penalty test
        db 00h,00h,02h,00h,0E0h,05h,06h,00h,0E8h,05h,0F6h,0FFh
SPAsweepchk:                                    ; SPA 0x2DB: sweep check; checkcheck sends it to Bcheck
        db 00h,00h,03h,00h,00h,01h,06h,00h,08h,01h,0Ah,00h,00h,01h,0FAh,0FFh
SPAhook:                                        ; SPA 0x2E3: hook check; Holdplayer
        db 00h,00h,03h,00h,40h,07h,04h,00h,48h,07h,14h,00h,50h,07h,0FCh,0FFh
SPAhook2:                                       ; SPA 0x2EB: player held by a hook check (holdcheck)
        db 00h,00h,06h,00h,40h,07h,08h,00h,48h,07h,08h,00h,50h,07h,08h,00h
        db 40h,07h,08h,00h,48h,07h,08h,00h,50h,07h,0F8h,0FFh
SPAHold:                                        ; SPA 0x2F9: hold check, stick out; input sets it, checkcheck
                                                ; sends it to holdcheck
        db 00h,00h,01h,00h,0D8h,07h,0E2h,0FFh
SPAHold2:                                       ; SPA 0x2FD: player held by a hold check (holdcheck)
        db 00h,00h,01h,00h,0D8h,07h,0E2h,0FFh
SPAshoulderchkr:                                ; SPA 0x301: shoulder check right, windup and hit (not set by
                                                ; an immediate) (confidence low)
        db 00h,00h,02h,00h,0E0h,01h,08h,00h,0E8h,01h,0F0h,0FFh
SPAshoulderchkl:                                ; SPA 0x307: shoulder check left, windup and hit (not set by
                                                ; an immediate) (confidence low)
        db 00h,00h,02h,00h,0D0h,01h,08h,00h,0D8h,01h,0F0h,0FFh
SPAhipchkr:                                     ; SPA 0x30D: hip check right, windup and hit (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,02h,00h,0C0h,01h,08h,00h,0C8h,01h,0F0h,0FFh
SPAhipchkl:                                     ; SPA 0x313: hip check left, windup and hit (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,02h,00h,0B0h,01h,08h,00h,0B8h,01h,0F0h,0FFh
SPAchecktarget:                                 ; SPA 0x319: check on a target ahead, shoulder side
                                                ; (DoCheckInput, checkcheck) (confidence medium)
        db 00h,00h,02h,00h,38h,04h,08h,00h,40h,04h,0F0h,0FFh
SPAchecktargetl:                                ; SPA 0x31F: check on a target at the left hip (DoCheckInput,
                                                ; checkcheck; left hip) (confidence medium)
        db 00h,00h,02h,00h,58h,04h,08h,00h,60h,04h,0F0h,0FFh
SPAchecktargetr:                                ; SPA 0x325: check on a target at the right hip (DoCheckInput,
                                                ; checkcheck; right hip) (confidence medium)
        db 00h,00h,02h,00h,48h,04h,08h,00h,50h,04h,0F0h,0FFh
SPAcheckslidel:                                 ; SPA 0x32B: fast check slide, left (DoCheckInput plays sfx
                                                ; 21h first) (confidence low)
        db 00h,00h,05h,00h,00h,05h,0Ah,00h,08h,05h,0Ah,00h,10h,05h,0Ah,00h
        db 08h,05h,0Ah,00h,00h,05h,0F6h,0FFh
SPAcheckslider:                                 ; SPA 0x337: fast check slide, right (DoCheckInput plays sfx
                                                ; 21h first) (confidence low)
        db 00h,00h,05h,00h,0E8h,04h,0Ah,00h,0F0h,04h,0Ah,00h,0F8h,04h,0Ah,00h
        db 0F0h,04h,0Ah,00h,0E8h,04h,0F6h,0FFh
SPAcheckskate:                                  ; SPA 0x343: skating with a check pending, no target, no puck
                                                ; (DoCheckInput; 343-36Fh is the check range) (confidence
                                                ; medium)
        db 00h,00h,08h,00h,10h,00h,04h,00h,18h,00h,04h,00h,20h,00h,04h,00h
        db 28h,00h,04h,00h,30h,00h,04h,00h,38h,00h,04h,00h,40h,00h,04h,00h
        db 48h,00h,0FCh,0FFh
SPAcheckmissl:                                  ; SPA 0x355: check swing with no target, left (DoCheckInput)
                                                ; (confidence low)
        db 00h,00h,04h,00h,10h,02h,08h,00h,18h,02h,08h,00h,20h,02h,08h,00h
        db 28h,02h,0F8h,0FFh
SPAcheckmissr:                                  ; SPA 0x35F: check swing with no target, right (DoCheckInput)
                                                ; (confidence low)
        db 00h,00h,04h,00h,0F0h,01h,08h,00h,0F8h,01h,08h,00h,00h,02h,08h,00h
        db 08h,02h,0F8h,0FFh
SPAcheckburstl:                                 ; SPA 0x369: check while burst is held, left (DoCheckInput)
                                                ; (confidence low)
        db 00h,00h,02h,00h,0C0h,01h,08h,00h,0C8h,01h,0F0h,0FFh
SPAcheckburstr:                                 ; SPA 0x36F: check while burst is held, right (DoCheckInput)
                                                ; (confidence low)
        db 00h,00h,02h,00h,0B0h,01h,08h,00h,0B8h,01h,0F0h,0FFh
SPAcheckskatewp:                                ; SPA 0x375: skating with a check pending, puck carrier
                                                ; (DoCheckInput) (confidence medium)
        db 00h,00h,08h,00h,50h,00h,04h,00h,58h,00h,04h,00h,60h,00h,04h,00h
        db 68h,00h,04h,00h,70h,00h,04h,00h,78h,00h,04h,00h,80h,00h,04h,00h
        db 88h,00h,0FCh,0FFh
SPAfaceoff:                                     ; SPA 0x387: faceoff stance (puckcarrier) (confidence medium)
        db 00h,00h,01h,00h,78h,01h,0F8h,0FFh
SPAfaceoffr:                                    ; SPA 0x38B: alternate faceoff stance after the wait runs out,
                                                ; one in 8 (faceoffinput) (confidence medium)
        db 00h,00h,01h,00h,80h,01h,0FBh,0FFh
SPAfaceoffpokel:                                ; SPA 0x38F: faceoff stick swing, left side (faceoffinput)
                                                ; (confidence medium)
        db 00h,00h,02h,00h,88h,01h,08h,00h,90h,01h,0F8h,0FFh
SPAfaceoffpokelhold:                            ; SPA 0x395: faceoff stick swing, left side, late press
                                                ; (faceoffinput) (confidence low)
        db 00h,00h,01h,00h,88h,01h,0F8h,0FFh
SPAfaceoffpoker:                                ; SPA 0x399: faceoff stick swing, right side (faceoffinput)
                                                ; (confidence medium)
        db 00h,00h,02h,00h,98h,01h,08h,00h,0A0h,01h,0F8h,0FFh
SPAfaceoffpokerhold:                            ; SPA 0x39F: faceoff stick swing, right side, late press
                                                ; (faceoffinput) (confidence low)
        db 00h,00h,01h,00h,98h,01h,0F8h,0FFh
SPAfaceoffpokeend:                              ; SPA 0x3A3: faceoff stick swing, end pose (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,01h,00h,0A8h,01h,0F8h,0FFh
SPApuckhit:                                     ; SPA 0x3A7: skater reacts to being hit by a fast puck
                                                ; (puckbody) (confidence low)
        db 00h,00h,02h,00h,0E0h,07h,08h,00h,0E8h,07h,0F8h,0FFh
SPAwallleft:                                    ; SPA 0x3AD: skater against the wall left (TakePlayerFromBox,
                                                ; assepen family) (confidence medium)
        db 08h,00h,08h,00h,0F0h,07h,04h,00h,0F8h,07h,04h,00h,00h,08h,04h,00h
        db 08h,08h,04h,00h,10h,08h,04h,00h,18h,08h,04h,00h,20h,08h,04h,00h
        db 28h,08h,0FCh,0FFh
SPAwallright:                                   ; SPA 0x3BF: skater against the wall right (asseben)
                                                ; (confidence medium)
        db 18h,00h,08h,00h,0F0h,07h,04h,00h,0F8h,07h,04h,00h,00h,08h,04h,00h
        db 08h,08h,04h,00h,10h,08h,04h,00h,18h,08h,04h,00h,20h,08h,04h,00h
        db 28h,08h,0FCh,0FFh
SPAglide:                                       ; SPA 0x3D1: glide; dostop, doplayeracc and noturn0 fall back
                                                ; to it (confidence medium)
        db 00h,00h,01h,00h,18h,05h,0F6h,0FFh
SPAstandrest:                                   ; SPA 0x3D5: standing at rest off the play: penalty box,
                                                ; bench, leaving the ice (assleavebox, assboxenter, assbench)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,18h,05h,0F6h,0FFh
SPAcelebrate:                                   ; SPA 0x3D9: scorer celebrates, first of the four picks
                                                ; (ScoreCelebrateAnims) (confidence medium)
        db 00h,00h,04h,00h,50h,08h,08h,00h,58h,08h,08h,00h,60h,08h,1Ch,00h
        db 50h,08h,0FBh,0FFh
SPAcelebrate2:                                  ; SPA 0x3E3: scorer celebrates, second pick
                                                ; (ScoreCelebrateAnims) (confidence medium)
        db 00h,00h,06h,00h,50h,08h,08h,00h,58h,08h,08h,00h,60h,08h,18h,00h
        db 58h,08h,08h,00h,60h,08h,1Ch,00h,50h,08h,0FBh,0FFh
SPApump:                                        ; SPA 0x3F1: scorer pumps the arm, first (ScoreCelebrateAnims)
                                                ; (confidence medium)
        db 00h,00h,03h,00h,68h,08h,08h,00h,70h,08h,1Ch,00h,68h,08h,0FBh,0FFh
SPApump2:                                       ; SPA 0x3F9: scorer pumps the arm, second
                                                ; (ScoreCelebrateAnims) (confidence medium)
        db 00h,00h,05h,00h,68h,08h,08h,00h,70h,08h,18h,00h,68h,08h,08h,00h
        db 70h,08h,1Ch,00h,68h,08h,0FBh,0FFh
SPAcelebratevis:                                ; SPA 0x405: celebration picked for the visiting team, first
                                                ; (assscore) (confidence low)
        db 00h,00h,06h,00h,30h,08h,08h,00h,38h,08h,10h,00h,40h,08h,08h,00h
        db 48h,08h,14h,00h,40h,08h,08h,00h,30h,08h,0FBh,0FFh
SPAcelebratevis2:                               ; SPA 0x413: celebration picked for the visiting team, second
                                                ; (assscore) (confidence low)
        db 00h,00h,08h,00h,30h,08h,08h,00h,38h,08h,10h,00h,40h,08h,08h,00h
        db 48h,08h,14h,00h,40h,08h,08h,00h,48h,08h,14h,00h,40h,08h,08h,00h
        db 30h,08h,0FBh,0FFh
SPAboxsit:                                      ; SPA 0x425: penalized player sitting in the box (asspenalty,
                                                ; assdopen) (confidence medium)
        db 02h,00h,0Dh,00h,0B8h,08h,06h,00h,0C0h,08h,06h,00h,0C8h,08h,06h,00h
        db 0D0h,08h,06h,00h,0D8h,08h,06h,00h,0E0h,08h,06h,00h,0E8h,08h,06h,00h
        db 0F0h,08h,06h,00h,08h,00h,08h,00h,09h,00h,08h,00h,0Ah,00h,08h,00h
        db 0Bh,00h,08h,00h,0Ch,00h,0F8h,0FFh
SPAboxsitep:                                    ; SPA 0x441: sitting in the box for a second penalty (assepen)
                                                ; (confidence medium)
        db 00h,00h,09h,00h,08h,00h,08h,00h,0B8h,08h,06h,00h,0C0h,08h,06h,00h
        db 0C8h,08h,06h,00h,0D0h,08h,06h,00h,0D8h,08h,06h,00h,0E0h,08h,06h,00h
        db 0E8h,08h,06h,00h,0F0h,08h,0FAh,0FFh
SPAskatebox:                                   ; SPA 0x455: player skating to the penalty box after a fight (doplayeracc, dostop, noturn0)
                                                ; (confidence medium)
        db 00h,00h,08h,00h,0Dh,0Bh,04h,00h,15h,0Bh,04h,00h,1Dh,0Bh,04h,00h
        db 25h,0Bh,04h,00h,2Dh,0Bh,04h,00h,35h,0Bh,04h,00h,3Dh,0Bh,04h,00h
        db 45h,0Bh,0FCh,0FFh
SPAglidebox:                                   ; SPA 0x467: the same skate to the penalty box as one held frame (doplayeracc, noturn0)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,0Dh,0Bh,0FCh,0FFh
SPAfightdrop:                                   ; SPA 0x46B: gloves drop and the fighters take their stance;
                                                ; chkhit tests its last frame (checkfight) (confidence low)
        db 0Ch,00h,09h,00h,4Dh,0Bh,1Ah,00h,4Fh,0Bh,06h,00h,51h,0Bh,06h,00h
        db 53h,0Bh,06h,00h,55h,0Bh,06h,00h,57h,0Bh,06h,00h,59h,0Bh,06h,00h
        db 5Bh,0Bh,06h,00h,5Dh,0Bh,0FAh,0FFh
SPAfight:                                       ; SPA 0x47F: fight stance, set when the fight starts
                                                ; (assfight) (confidence medium)
        db 04h,00h,01h,00h,63h,0Bh,0FAh,0FFh
SPAfightstance:                                 ; SPA 0x483: fight stance, circling (assfight, chkhit)
                                                ; (confidence low)
        db 05h,00h,08h,00h,63h,0Bh,04h,00h,65h,0Bh,04h,00h,67h,0Bh,04h,00h
        db 69h,0Bh,04h,00h,6Bh,0Bh,04h,00h,6Dh,0Bh,04h,00h,6Fh,0Bh,04h,00h
        db 71h,0Bh,0FCh,0FFh
SPAfightweavel:                                 ; SPA 0x495: fight footwork, left (assfight) (confidence low)
        db 04h,00h,06h,00h,73h,0Bh,04h,00h,75h,0Bh,04h,00h,77h,0Bh,04h,00h
        db 79h,0Bh,04h,00h,7Bh,0Bh,04h,00h,7Dh,0Bh,0FCh,0FFh
SPAfightweaver:                                 ; SPA 0x4A3: fight footwork, right (assfight) (confidence low)
        db 04h,00h,06h,00h,7Fh,0Bh,04h,00h,81h,0Bh,04h,00h,83h,0Bh,04h,00h
        db 85h,0Bh,04h,00h,87h,0Bh,04h,00h,89h,0Bh,0FCh,0FFh
SPAfhigh:                                       ; SPA 0x4B1: high punch (fightinput, FightAnimTab) (confidence
                                                ; medium)
        db 04h,00h,06h,00h,8Bh,0Bh,06h,00h,8Dh,0Bh,06h,00h,8Fh,0Bh,06h,00h
        db 91h,0Bh,06h,00h,93h,0Bh,06h,00h,95h,0Bh,0FAh,0FFh
SPAfhith:                                       ; SPA 0x4BF: hit by a high punch (chkhit) (confidence medium)
        db 04h,00h,05h,00h,97h,0Bh,06h,00h,99h,0Bh,06h,00h,9Bh,0Bh,06h,00h
        db 9Dh,0Bh,06h,00h,9Fh,0Bh,0FAh,0FFh
SPAflow:                                        ; SPA 0x4CB: low punch (fightinput, FightAnimTab) (confidence
                                                ; medium)
        db 04h,00h,03h,00h,0A1h,0Bh,08h,00h,0A3h,0Bh,08h,00h,0A5h,0Bh,0F8h,0FFh
SPAfhitl:                                       ; SPA 0x4D3: hit by a low punch (chkhit) (confidence medium)
        db 04h,00h,02h,00h,0A7h,0Bh,06h,00h,0A9h,0Bh,0FAh,0FFh
SPAffall:                                       ; SPA 0x4D9: loser falls after the fight is decided (chkhit)
                                                ; (confidence medium)
        db 24h,00h,0Eh,00h,0BDh,0Bh,06h,00h,0BFh,0Bh,06h,00h,0C1h,0Bh,06h,00h
        db 0C3h,0Bh,06h,00h,0C5h,0Bh,06h,00h,0C7h,0Bh,06h,00h,0C9h,0Bh,06h,00h
        db 0CBh,0Bh,06h,00h,0CDh,0Bh,1Eh,00h,0CFh,0Bh,06h,00h,0D1h,0Bh,06h,00h
        db 0D3h,0Bh,06h,00h,0D5h,0Bh,06h,00h,0D7h,0Bh,0FAh,0FFh
SPAffall2:                                      ; SPA 0x4F7: loser falls, the other side (chkhit) (confidence
                                                ; medium)
        db 2Ch,00h,0Fh,00h,0ABh,0Bh,06h,00h,0ADh,0Bh,06h,00h,0AFh,0Bh,06h,00h
        db 0B1h,0Bh,06h,00h,0B3h,0Bh,06h,00h,0B5h,0Bh,06h,00h,0B7h,0Bh,06h,00h
        db 0B9h,0Bh,06h,00h,0BBh,0Bh,1Eh,00h,0D9h,0Bh,06h,00h,0DBh,0Bh,06h,00h
        db 0DDh,0Bh,06h,00h,0DFh,0Bh,06h,00h,0E1h,0Bh,06h,00h,0E3h,0Bh,0FAh,0FFh
SPAfinjury:                                     ; SPA 0x517: injured loser, copy of SPAffall (not set by an
                                                ; immediate) (confidence low)
        db 24h,00h,0Eh,00h,0BDh,0Bh,06h,00h,0BFh,0Bh,06h,00h,0C1h,0Bh,06h,00h
        db 0C3h,0Bh,06h,00h,0C5h,0Bh,06h,00h,0C7h,0Bh,06h,00h,0C9h,0Bh,06h,00h
        db 0CBh,0Bh,06h,00h,0CDh,0Bh,0C8h,00h,0CFh,0Bh,06h,00h,0D1h,0Bh,06h,00h
        db 0D3h,0Bh,06h,00h,0D5h,0Bh,06h,00h,0D7h,0Bh,0FAh,0FFh
SPAfinjury2:                                    ; SPA 0x535: injured loser, copy of SPAffall2 (not set by an
                                                ; immediate) (confidence low)
        db 2Ch,00h,0Fh,00h,0ABh,0Bh,06h,00h,0ADh,0Bh,06h,00h,0AFh,0Bh,06h,00h
        db 0B1h,0Bh,06h,00h,0B3h,0Bh,06h,00h,0B5h,0Bh,06h,00h,0B7h,0Bh,06h,00h
        db 0B9h,0Bh,06h,00h,0BBh,0Bh,0C8h,00h,0D9h,0Bh,06h,00h,0DBh,0Bh,06h,00h
        db 0DDh,0Bh,06h,00h,0DFh,0Bh,06h,00h,0E1h,0Bh,06h,00h,0E3h,0Bh,0FAh,0FFh
SPAfwin:                                        ; SPA 0x555: winner stands over the loser (chkhit) (confidence
                                                ; low)
        db 04h,00h,02h,00h,0F1h,0Bh,06h,00h,63h,0Bh,0FAh,0FFh
SPAfswing:                                      ; SPA 0x55B: big swing punch (FightAnimTab, chkhit)
                                                ; (confidence low)
        db 04h,00h,08h,00h,0E5h,0Bh,06h,00h,0F5h,0Bh,06h,00h,0F7h,0Bh,06h,00h
        db 0F9h,0Bh,06h,00h,0FBh,0Bh,06h,00h,0FDh,0Bh,06h,00h,0FFh,0Bh,06h,00h
        db 01h,0Ch,0FAh,0FFh
SPAfswinghit:                                   ; SPA 0x56D: hit by the big swing punch (chkhit) (confidence
                                                ; low)
        db 04h,00h,08h,00h,1Bh,0Ch,06h,00h,1Dh,0Ch,06h,00h,1Fh,0Ch,06h,00h
        db 21h,0Ch,06h,00h,23h,0Ch,06h,00h,25h,0Ch,06h,00h,27h,0Ch,06h,00h
        db 0E7h,0Bh,0FAh,0FFh
SPAfgrab:                                       ; SPA 0x57F: grab (FightAnimTab, chkhit) (confidence medium)
        db 04h,00h,04h,00h,0E9h,0Bh,08h,00h,0EBh,0Bh,08h,00h,03h,0Ch,08h,00h
        db 05h,0Ch,0F8h,0FFh
SPAfgrabend:                                    ; SPA 0x589: grab ends without a hold (chkhit) (confidence
                                                ; low)
        db 04h,00h,05h,00h,0E9h,0Bh,08h,00h,0EBh,0Bh,08h,00h,0EDh,0Bh,08h,00h
        db 0EFh,0Bh,08h,00h,0F1h,0Bh,0F8h,0FFh
SPAfheld:                                       ; SPA 0x595: held by a grab (chkhit) (confidence medium)
        db 04h,00h,02h,00h,29h,0Ch,08h,00h,2Bh,0Ch,0F8h,0FFh
SPAfhighwaitl:                                  ; SPA 0x59B: left fighter waits with the high punch ready
                                                ; (assfight) (confidence low)
        db 04h,00h,01h,00h,05h,0Ch,0F4h,0FFh
SPAfhighwaitr:                                  ; SPA 0x59F: right fighter waits with the high punch ready
                                                ; (assfight) (confidence low)
        db 04h,00h,01h,00h,2Bh,0Ch,0F4h,0FFh
SPAfhighl:                                      ; SPA 0x5A3: left fighter high punch for the computer
                                                ; (assfight, chkhit) (confidence low)
        db 04h,00h,04h,00h,07h,0Ch,07h,00h,09h,0Ch,07h,00h,0Bh,0Ch,07h,00h
        db 0Dh,0Ch,0F9h,0FFh
SPAfhighr:                                      ; SPA 0x5AD: right fighter high punch for the computer
                                                ; (assfight) (confidence low)
        db 04h,00h,04h,00h,2Dh,0Ch,07h,00h,2Fh,0Ch,07h,00h,31h,0Ch,07h,00h
        db 33h,0Ch,0F9h,0FFh
SPAfgrab2:                                      ; SPA 0x5B7: grab, the other side (FightAnimTab, chkhit)
                                                ; (confidence medium)
        db 04h,00h,03h,00h,0E9h,0Bh,08h,00h,0EBh,0Bh,08h,00h,0Fh,0Ch,0F8h,0FFh
SPAfheld2:                                      ; SPA 0x5BF: held by a grab, the other side (chkhit)
                                                ; (confidence medium)
        db 04h,00h,01h,00h,35h,0Ch,0F8h,0FFh
SPAflowwaitl:                                   ; SPA 0x5C3: left fighter waits with the low punch ready
                                                ; (assfight) (confidence low)
        db 04h,00h,01h,00h,0Fh,0Ch,0F4h,0FFh
SPAflowwaitr:                                   ; SPA 0x5C7: right fighter waits with the low punch ready
                                                ; (assfight) (confidence low)
        db 04h,00h,01h,00h,35h,0Ch,0F4h,0FFh
SPAflowl:                                       ; SPA 0x5CB: left fighter low punch for the computer
                                                ; (assfight, chkhit) (confidence low)
        db 04h,00h,05h,00h,11h,0Ch,06h,00h,13h,0Ch,06h,00h,15h,0Ch,06h,00h
        db 17h,0Ch,06h,00h,19h,0Ch,0FAh,0FFh
SPAflowr:                                       ; SPA 0x5D7: right fighter low punch for the computer
                                                ; (assfight) (confidence low)
        db 04h,00h,05h,00h,37h,0Ch,06h,00h,39h,0Ch,06h,00h,3Bh,0Ch,06h,00h
        db 3Dh,0Ch,06h,00h,3Fh,0Ch,0FAh,0FFh
SPAgready2:                                     ; SPA 0x5E3: goalie ready, held frame; -30 end time
                                                ; (confidence medium)
        db 00h,00h,01h,00h,80h,02h,0E2h,0FFh
SPAgglover:                                     ; SPA 0x5E7: goalie glove save, right (GoalieSaveAnims slot 0)
                                                ; (confidence medium)
        db 00h,00h,02h,00h,0A8h,02h,08h,00h,0B0h,02h,0ECh,0FFh
SPAgglovel:                                     ; SPA 0x5ED: goalie glove save, left (GoalieSaveAnims slot 1)
                                                ; (confidence medium)
        db 00h,00h,02h,00h,0B8h,02h,08h,00h,0C0h,02h,0ECh,0FFh
SPAgstickr:                                     ; SPA 0x5F3: goalie stick save right (SkillForAnim, by
                                                ; position in its table) (confidence low)
        db 00h,00h,02h,00h,98h,02h,08h,00h,0A0h,02h,0ECh,0FFh
SPAgstickl:                                     ; SPA 0x5F9: goalie stick save left (SkillForAnim, by position
                                                ; in its table) (confidence low)
        db 00h,00h,02h,00h,88h,02h,08h,00h,90h,02h,0ECh,0FFh
SPAgstackr:                                     ; SPA 0x5FF: goalie pad stack, right (GoalieSaveAnims slot 2)
                                                ; (confidence medium)
        db 00h,00h,08h,00h,0E0h,02h,08h,00h,0E8h,02h,08h,00h,0F0h,02h,1Eh,00h
        db 90h,04h,07h,00h,98h,04h,07h,00h,78h,04h,07h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgstackl:                                     ; SPA 0x611: goalie pad stack, left (GoalieSaveAnims slot 3)
                                                ; (confidence medium)
        db 00h,00h,08h,00h,0C8h,02h,08h,00h,0D0h,02h,08h,00h,0D8h,02h,1Eh,00h
        db 0A0h,04h,07h,00h,0A8h,04h,07h,00h,78h,04h,07h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgdive:                                       ; SPA 0x623: goalie dives for the puck (assgoalie) (confidence
                                                ; medium)
        db 20h,00h,08h,00h,0F8h,02h,08h,00h,00h,03h,08h,00h,08h,03h,28h,00h
        db 68h,04h,07h,00h,70h,04h,07h,00h,78h,04h,07h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgoalieknee:                                  ; SPA 0x635: goalie drops to his knees (confidence low)
        db 00h,00h,05h,00h,0F0h,03h,08h,00h,0F8h,03h,1Eh,00h,78h,04h,07h,00h
        db 80h,04h,07h,00h,88h,04h,0F9h,0FFh
SPAgokneehold:                                  ; SPA 0x641: goalie stays on his knees (assgoalie) (confidence
                                                ; medium)
        db 00h,00h,05h,00h,0F0h,03h,08h,00h,0F8h,03h,5Ah,00h,78h,04h,07h,00h
        db 80h,04h,07h,00h,88h,04h,0F9h,0FFh
SPAgofallglove:                                 ; SPA 0x64D: goalie falls on the glove side (SkillForAnim, by
                                                ; position) (confidence low)
        db 20h,00h,08h,00h,20h,03h,08h,00h,28h,03h,08h,00h,30h,03h,14h,00h
        db 90h,04h,07h,00h,98h,04h,07h,00h,78h,04h,07h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgofallstick:                                 ; SPA 0x65F: goalie falls on the stick side (SkillForAnim, by
                                                ; position) (confidence low)
        db 20h,00h,08h,00h,40h,03h,08h,00h,48h,03h,08h,00h,50h,03h,14h,00h
        db 0A0h,04h,07h,00h,0A8h,04h,07h,00h,78h,04h,07h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgoaliepoke:                                  ; SPA 0x671: goalie pokes the puck away (assgoalie, puckglue)
                                                ; (confidence medium)
        db 00h,00h,03h,00h,60h,03h,04h,00h,68h,03h,0Fh,00h,60h,03h,0FAh,0FFh
SPAgskate:                                      ; SPA 0x679: goalie skating (goalieskateto, SkateToSpot)
                                                ; (confidence medium)
        db 00h,00h,08h,00h,70h,03h,04h,00h,78h,03h,04h,00h,80h,03h,04h,00h
        db 88h,03h,04h,00h,90h,03h,04h,00h,98h,03h,04h,00h,0A0h,03h,04h,00h
        db 0A8h,03h,0FCh,0FFh
SPAgshufflel:                                   ; SPA 0x68B: goalie side shuffle, left (goalieskateto)
                                                ; (confidence low)
        db 00h,00h,02h,00h,0B0h,03h,08h,00h,80h,02h,0F8h,0FFh
SPAgshuffler:                                   ; SPA 0x691: goalie side shuffle, right (goalieskateto)
                                                ; (confidence low)
        db 00h,00h,02h,00h,0B8h,03h,08h,00h,80h,02h,0F8h,0FFh
SPAgsavetoe:                                    ; SPA 0x697: goalie save slot 10: low toe save
                                                ; (GoalieSaveAnims) (confidence low)
        db 00h,00h,04h,00h,10h,03h,08h,00h,18h,03h,14h,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgswing:                                      ; SPA 0x6A1: goalie swings at the puck to clear or pass it
                                                ; (ShootPuck, dopass) (confidence medium)
        db 00h,00h,02h,00h,00h,04h,05h,00h,08h,04h,0F0h,0FFh
SPAgsavekick:                                   ; SPA 0x6A7: goalie save slot 11 (GoalieSaveAnims; goaliesave
                                                ; plays sfx 10h for it) (confidence low)
        db 00h,00h,01h,00h,10h,04h,0ECh,0FFh
SPAgofallback:                                  ; SPA 0x6AB: goalie falls backward (GoalieSaveAnims slot 9)
                                                ; (confidence medium)
        db 00h,00h,04h,00h,18h,04h,08h,00h,20h,04h,1Eh,00h,80h,04h,07h,00h
        db 88h,04h,0F9h,0FFh
SPAgwallleft:                                   ; SPA 0x6B5: goalie against the wall left (position 0 case of
                                                ; asspsclear, assbench) (confidence medium)
        db 08h,00h,08h,00h,78h,08h,04h,00h,80h,08h,04h,00h,88h,08h,04h,00h
        db 90h,08h,04h,00h,98h,08h,04h,00h,0A0h,08h,04h,00h,0A8h,08h,04h,00h
        db 0B0h,08h,0FCh,0FFh
SPAgwallright:                                  ; SPA 0x6C7: goalie against the wall right (asseben)
                                                ; (confidence medium)
        db 18h,00h,08h,00h,78h,08h,04h,00h,80h,08h,04h,00h,88h,08h,04h,00h
        db 90h,08h,04h,00h,98h,08h,04h,00h,0A0h,08h,04h,00h,0A8h,08h,04h,00h
        db 0B0h,08h,0FCh,0FFh
SPAgreadybob:                                   ; SPA 0x6D9: goalie ready stance, small bob (start of
                                                ; SPAgready) (confidence low)
        db 00h,00h,02h,00h,28h,04h,08h,00h,30h,04h,0F4h,0FFh
SPAgready:                                      ; SPA 0x6DF: goalie ready: blinks between the held frame and
                                                ; the ready frames (confidence medium)
        db 00h,00h,0Bh,00h,80h,02h,78h,00h,28h,04h,08h,00h,30h,04h,0Ah,00h
        db 28h,04h,08h,00h,30h,04h,0Ah,00h,80h,02h,6Bh,00h,28h,04h,08h,00h
        db 30h,04h,0Ah,00h,28h,04h,08h,00h,30h,04h,0Ah,00h,80h,02h,0F6h,0FFh
SPAgidle:                                       ; SPA 0x6F7: goalie idle, looks around (goalieacc, fight;
                                                ; random alternative to SPAgready) (confidence low)
        db 00h,00h,0Ah,00h,80h,02h,64h,00h,20h,05h,0Ah,00h,28h,05h,0Ah,00h
        db 30h,05h,0Ah,00h,38h,05h,0Ah,00h,40h,05h,0Ah,00h,48h,05h,0Ah,00h
        db 50h,05h,0Ah,00h,58h,05h,0Ah,00h,20h,05h,0Ah,00h,80h,02h,0F6h,0FFh
SPAstandwait:                                   ; SPA 0x70F: standing wait of 68 ticks, then skates off
                                                ; (assleavebox) (confidence low)
        db 00h,00h,01h,00h,08h,00h,0BCh,0FFh
SPAstandwait2:                                  ; SPA 0x713: standing wait of 47 ticks (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,01h,00h,00h,00h,0D1h,0FFh
SPAfaceoffwait:                                 ; SPA 0x717: faceoff stance wait of 53 ticks (assleavebox)
                                                ; (confidence low)
        db 00h,00h,01h,00h,78h,01h,0CBh,0FFh
SPAbenchidle1:                                  ; SPA 0x71B: bench sprite idle pose 1 (BenchSpriteAnims)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,0F8h,08h,0F8h,0FFh
SPAbenchidle2:                                  ; SPA 0x71F: bench sprite idle pose 2 (BenchSpriteAnims)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,00h,09h,0F8h,0FFh
SPAbenchidle3:                                  ; SPA 0x723: bench sprite idle pose 3 (BenchSpriteAnims)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,08h,09h,0F8h,0FFh
SPAbenchreact:                                  ; SPA 0x727: bench sprite reacts (two frames; not in
                                                ; BenchSpriteAnims) (confidence low)
        db 00h,00h,02h,00h,10h,09h,0Ah,00h,18h,09h,0ECh,0FFh
SPAbenchwatch1:                                 ; SPA 0x72D: bench sprite watches the play, long hold
                                                ; (AnimateBenchSprite adds a random wait) (confidence low)
        db 00h,00h,01h,00h,28h,09h,0D3h,0FFh
SPAbenchwatch2:                                 ; SPA 0x731: bench sprite watches the play, other pose
                                                ; (AnimateBenchSprite) (confidence low)
        db 00h,00h,01h,00h,20h,09h,0D3h,0FFh
SPAbenchlook:                                   ; SPA 0x735: bench sprite looks around, random wait after the
                                                ; second frame (AnimateBenchSprite) (confidence low)
        db 00h,00h,03h,00h,30h,09h,0Ah,00h,38h,09h,3Ch,00h,30h,09h,0F8h,0FFh
SPAbenchcheer:                                  ; SPA 0x73D: bench sprite cheers, the frame times grow (not
                                                ; set by an immediate) (confidence low)
        db 00h,00h,09h,00h,40h,09h,0Ah,00h,48h,09h,0Ch,00h,40h,09h,0Eh,00h
        db 48h,09h,0Fh,00h,40h,09h,10h,00h,48h,09h,11h,00h,40h,09h,12h,00h
        db 48h,09h,14h,00h,40h,09h,0F8h,0FFh
SPArefskate:                                    ; SPA 0x751: referee skating (noturn0) (confidence medium)
        db 00h,00h,08h,00h,50h,09h,04h,00h,58h,09h,04h,00h,60h,09h,04h,00h
        db 68h,09h,04h,00h,70h,09h,04h,00h,78h,09h,04h,00h,80h,09h,04h,00h
        db 88h,09h,0FCh,0FFh
SPArefglide:                                    ; SPA 0x763: referee glide (dostop, noturn0, every ref
                                                ; assignment)
        db 00h,00h,01h,00h,98h,0Ah,0FCh,0FFh
SPArefstop:                                     ; SPA 0x767: referee stop (dostop)
        db 00h,00h,02h,00h,0D0h,09h,08h,00h,0D8h,09h,0E4h,0FFh
SPArefstophold:                                 ; SPA 0x76D: referee stop, held end frame (dostop switches to
                                                ; it when SPArefstop ends) (confidence medium)
        db 01h,00h,01h,00h,0D8h,09h,0F0h,0FFh
SPAarmupskate:                                  ; SPA 0x771: referee skating, arm up (noturn0) (confidence
                                                ; medium)
        db 00h,00h,08h,00h,90h,09h,04h,00h,98h,09h,04h,00h,0A0h,09h,04h,00h
        db 0A8h,09h,04h,00h,0B0h,09h,04h,00h,0B8h,09h,04h,00h,0C0h,09h,04h,00h
        db 0C8h,09h,0FCh,0FFh
SPAarmupglide:                                  ; SPA 0x783: referee glide, arm up (dostop, noturn0)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,0B8h,0Ah,0FCh,0FFh
SPAarmupstop:                                   ; SPA 0x787: referee stop, arm up (dostop when the ref
                                                ; signals) (confidence medium)
        db 00h,00h,02h,00h,0E0h,09h,08h,00h,0E8h,09h,0E4h,0FFh
SPAarmupstophold:                               ; SPA 0x78D: referee stop, arm up, held end frame (confidence
                                                ; medium)
        db 01h,00h,01h,00h,0E8h,09h,0EEh,0FFh
SPArefpickup:                                   ; SPA 0x791: referee picks up the puck (assrefpenshot,
                                                ; assrefgoalpa)
        db 00h,00h,05h,00h,98h,0Ah,08h,00h,08h,0Ah,08h,00h,10h,0Ah,0Ch,00h
        db 08h,0Ah,06h,00h,98h,0Ah,0FAh,0FFh
SPArefdrop:                                     ; SPA 0x79D: referee drops the puck (puckfaceoff2) (confidence
                                                ; medium)
        db 00h,00h,04h,00h,0F0h,09h,08h,00h,0F8h,09h,08h,00h,0F0h,09h,08h,00h
        db 00h,0Ah,0F8h,0FFh
SPAreffowait:                                   ; SPA 0x7A7: referee waits at the faceoff dot (assrefatdot,
                                                ; puckfaceoff2) (confidence medium)
        db 00h,00h,01h,00h,0F0h,09h,0F8h,0FFh
SPArefturnl:                                    ; SPA 0x7AB: referee turning left, single frame (doplayeracc)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,20h,0Ah,0F8h,0FFh
SPAarmupturnl:                                  ; SPA 0x7AF: warm-up referee turning left, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,40h,0Ah,0F8h,0FFh
SPArefturnlin:                                  ; SPA 0x7B3: referee turning left, start of the turn
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,18h,0Ah,08h,00h,20h,0Ah,0F8h,0FFh
SPAarmupturnlin:                                ; SPA 0x7B9: warm-up referee turning left, start of the turn
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,38h,0Ah,08h,00h,40h,0Ah,0F8h,0FFh
SPArefturnr:                                    ; SPA 0x7BF: referee turning right, single frame (doplayeracc)
                                                ; (confidence medium)
        db 00h,00h,01h,00h,30h,0Ah,0F8h,0FFh
SPAarmupturnr:                                  ; SPA 0x7C3: warm-up referee turning right, single frame
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,01h,00h,50h,0Ah,0F8h,0FFh
SPArefturnrin:                                  ; SPA 0x7C7: referee turning right, start of the turn
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,28h,0Ah,08h,00h,30h,0Ah,0F8h,0FFh
SPAarmupturnrin:                                ; SPA 0x7CD: warm-up referee turning right, start of the turn
                                                ; (doplayeracc) (confidence medium)
        db 00h,00h,02h,00h,48h,0Ah,08h,00h,50h,0Ah,0F8h,0FFh
SPAreffallback:                                 ; SPA 0x7D3: referee falls back (FallDown) (confidence medium)
        db 20h,00h,08h,00h,58h,0Ah,05h,00h,60h,0Ah,05h,00h,68h,0Ah,05h,00h
        db 70h,0Ah,05h,00h,78h,0Ah,05h,00h,80h,0Ah,28h,00h,0C0h,0Ah,08h,00h
        db 0C8h,0Ah,0F8h,0FFh
SPApuckdrop:                                    ; SPA 0x7E5: puck sprite dropped by the referee (faceoff,
                                                ; penalty shot start) (confidence medium)
        db 00h,00h,03h,00h,88h,0Ah,08h,00h,90h,0Ah,14h,00h,88h,0Ah,0F8h,0FFh
SPArefpointgoa:                                 ; SPA 0x7ED: referee points to the goal (assrefwhistle)
                                                ; (confidence medium)
        db 00h,00h,05h,00h,0A0h,0Ah,06h,00h,0A8h,0Ah,06h,00h,0B0h,0Ah,18h,00h
        db 0A0h,0Ah,04h,00h,98h,0Ah,0FBh,0FFh
SPArefpointgoallong:                            ; SPA 0x7F9: referee points at the goal and holds the pose 485
                                                ; ticks (assrefgoalline) (confidence medium)
        db 00h,00h,05h,00h,0A0h,0Ah,06h,00h,0A8h,0Ah,06h,00h,0B0h,0Ah,18h,00h
        db 0A0h,0Ah,04h,00h,98h,0Ah,1Bh,0FEh
SPArefpointgoalshort:                           ; SPA 0x805: referee points at the goal and holds the pose 285
                                                ; ticks (assrefgoalline) (confidence medium)
        db 00h,00h,05h,00h,0A0h,0Ah,06h,00h,0A8h,0Ah,06h,00h,0B0h,0Ah,18h,00h
        db 0A0h,0Ah,04h,00h,98h,0Ah,0E3h,0FEh
SPArefrough:                                    ; SPA 0x811: referee signals roughing (assrefsignal RefPen
                                                ; call) (confidence medium)
        db 02h,00h,04h,00h,9Ch,0Ah,08h,00h,01h,0Bh,09h,00h,02h,0Bh,18h,00h
        db 9Ch,0Ah,0F8h,0FFh
SPArefcharge:                                   ; SPA 0x81B: referee signals charging (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,0Ah,00h,9Ch,0Ah,08h,00h,0F2h,0Ah,08h,00h,0F3h,0Ah,08h,00h
        db 0F4h,0Ah,08h,00h,0F5h,0Ah,08h,00h,0F2h,0Ah,08h,00h,0F3h,0Ah,08h,00h
        db 0F4h,0Ah,08h,00h,0F5h,0Ah,08h,00h,9Ch,0Ah,0F8h,0FFh
SPArefslash:                                    ; SPA 0x831: referee signals slashing (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,06h,00h,9Bh,0Ah,08h,00h,03h,0Bh,08h,00h,04h,0Bh,08h,00h
        db 05h,0Bh,10h,00h,03h,0Bh,07h,00h,9Bh,0Ah,0F8h,0FFh
SPArefxcheck:                                   ; SPA 0x83F: referee signals cross checking (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,05h,00h,9Bh,0Ah,08h,00h,06h,0Bh,0Ah,00h,07h,0Bh,18h,00h
        db 06h,0Bh,06h,00h,9Bh,0Ah,0F8h,0FFh
SPArefhook:                                     ; SPA 0x84B: referee signals hooking (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,05h,00h,9Bh,0Ah,08h,00h,0F9h,0Ah,0Ah,00h,0FAh,0Ah,0Ah,00h
        db 0F9h,0Ah,18h,00h,9Bh,0Ah,0F8h,0FFh
SPAreftrip:                                     ; SPA 0x857: referee signals tripping (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,06h,00h,9Ch,0Ah,08h,00h,08h,0Bh,0Ah,00h,09h,0Bh,0Ah,00h
        db 0Ah,0Bh,10h,00h,08h,0Bh,07h,00h,9Ch,0Ah,0F8h,0FFh
SPArefhold:                                     ; SPA 0x865: referee signals holding (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,06h,00h,9Bh,0Ah,08h,00h,0FBh,0Ah,0Ah,00h,0FCh,0Ah,0Ah,00h
        db 0FDh,0Ah,24h,00h,0FBh,0Ah,06h,00h,9Bh,0Ah,0F8h,0FFh
SPArefbehind:                                   ; SPA 0x873: referee signals a call from behind (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,05h,00h,9Ch,0Ah,08h,00h,0F0h,0Ah,0Ah,00h,0F1h,0Ah,18h,00h
        db 0F0h,0Ah,06h,00h,9Ch,0Ah,0F8h,0FFh
SPArefpenshot:                                  ; SPA 0x87F: referee signals a penalty shot (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,06h,00h,9Ch,0Ah,08h,00h,0A4h,0Ah,06h,00h,0ACh,0Ah,06h,00h
        db 0B4h,0Ah,18h,00h,0A4h,0Ah,04h,00h,9Ch,0Ah,0FBh,0FFh
SPArefelbow:                                    ; SPA 0x88D: referee signals elbowing (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,06h,00h,9Bh,0Ah,08h,00h,0F6h,0Ah,08h,00h,0F7h,0Ah,08h,00h
        db 0F8h,0Ah,18h,00h,0F6h,0Ah,06h,00h,9Bh,0Ah,0F8h,0FFh
SPArefelbow2:                                   ; SPA 0x89B: referee signals elbowing, second signal
                                                ; (assrefsignal) (confidence medium)
        db 02h,00h,06h,00h,9Bh,0Ah,08h,00h,0FEh,0Ah,08h,00h,0FFh,0Ah,08h,00h
        db 00h,0Bh,18h,00h,0FEh,0Ah,06h,00h,9Bh,0Ah,0F8h,0FFh
SPArefinterfer:                                 ; SPA 0x8A9: referee signals interference (assrefsignal)
                                                ; (confidence medium)
        db 02h,00h,05h,00h,9Bh,0Ah,08h,00h,0Bh,0Bh,0Ah,00h,0Ch,0Bh,18h,00h
        db 0Bh,0Bh,06h,00h,9Bh,0Ah,0F8h,0FFh
SPArefsignalend:                                ; SPA 0x8B5: referee signal at the end of the table, slot 31
                                                ; (assrefsignal) (confidence low)
        db 02h,00h,05h,00h,9Ch,0Ah,08h,00h,8Ch,0Ah,0Ah,00h,94h,0Ah,18h,00h
        db 8Ch,0Ah,06h,00h,9Ch,0Ah,0F8h,0FFh
SPAbrcup:                                       ; SPA 0x8C1: bench-side close-up player, first pose
                                                ; (assbenchside) (confidence medium)
        db 02h,00h,01h,00h,49h,0Ch,0F8h,0FFh
SPAclap:                                        ; SPA 0x8C5: bench-side close-up player claps (assbenchside)
                                                ; (confidence medium)
        db 02h,00h,08h,00h,41h,0Ch,06h,00h,42h,0Ch,06h,00h,43h,0Ch,06h,00h
        db 44h,0Ch,06h,00h,45h,0Ch,06h,00h,46h,0Ch,06h,00h,47h,0Ch,06h,00h
        db 48h,0Ch,0FAh,0FFh
SPAboxdooropen:                                 ; SPA 0x8D7: penalty box door opens (assboxenter) (confidence
                                                ; medium)
        db 02h,00h,0Ch,00h,49h,0Ch,06h,00h,4Ah,0Ch,06h,00h,4Bh,0Ch,06h,00h
        db 4Ch,0Ch,06h,00h,4Dh,0Ch,06h,00h,4Eh,0Ch,06h,00h,4Fh,0Ch,06h,00h
        db 50h,0Ch,06h,00h,51h,0Ch,06h,00h,52h,0Ch,06h,00h,53h,0Ch,06h,00h
        db 54h,0Ch,0FAh,0FFh
SPAgvcup:                                       ; SPA 0x8F1: penalty box door closes behind the player
                                                ; (assboxenter) (confidence medium)
        db 02h,00h,09h,00h,55h,0Ch,06h,00h,56h,0Ch,06h,00h,57h,0Ch,06h,00h
        db 58h,0Ch,06h,00h,59h,0Ch,06h,00h,5Ah,0Ch,06h,00h,5Bh,0Ch,06h,00h
        db 5Ch,0Ch,06h,00h,5Dh,0Ch,0FAh,0FFh
SPAbenchstand:                                  ; SPA 0x905: bench-side player stands at the end of the scene
                                                ; (assbenchside) (confidence low)
        db 00h,00h,01h,00h,5Fh,0Ch,0F8h,0FFh
SPAstansk:                                      ; SPA 0x909: skating with the Stanley cup (assstanley)
                                                ; (confidence medium)
        db 00h,00h,08h,00h,0F0h,0Dh,08h,00h,0F8h,0Dh,08h,00h,00h,0Eh,08h,00h
        db 08h,0Eh,08h,00h,10h,0Eh,08h,00h,18h,0Eh,08h,00h,20h,0Eh,08h,00h
        db 28h,0Eh,0F8h,0FFh
SPAstanley:                                     ; SPA 0x91B: lifting the Stanley cup (assstanley) (confidence
                                                ; medium)
        db 00h,00h,04h,00h,30h,0Eh,0Ch,00h,38h,0Eh,0Ch,00h,40h,0Eh,0Ch,00h
        db 48h,0Eh,0F4h,0FFh
SPAcupwaitl:                                    ; SPA 0x925: cup ceremony wait, left (assboxenter,
                                                ; asscupfollow) (confidence low)
        db 00h,00h,01h,00h,67h,0Ch,0F8h,0FFh
SPAcupwaitr:                                    ; SPA 0x929: cup ceremony wait, right (asscupfollow)
                                                ; (confidence low)
        db 00h,00h,01h,00h,6Fh,0Ch,0F8h,0FFh
SPAcupskate:                                    ; SPA 0x92D: skating with the cup behind the carrier
                                                ; (asscupfollow) (confidence low)
        db 00h,00h,08h,00h,77h,0Ch,08h,00h,7Fh,0Ch,08h,00h,87h,0Ch,08h,00h
        db 8Fh,0Ch,08h,00h,97h,0Ch,08h,00h,9Fh,0Ch,08h,00h,0A7h,0Ch,08h,00h
        db 0AFh,0Ch,0F8h,0FFh
SPAcupturn:                                     ; SPA 0x93F: turning with the cup (asscupfollow) (confidence
                                                ; low)
        db 00h,00h,09h,00h,0B7h,0Ch,04h,00h,0BFh,0Ch,04h,00h,0C7h,0Ch,04h,00h
        db 0CFh,0Ch,04h,00h,0D7h,0Ch,04h,00h,0DFh,0Ch,04h,00h,0E7h,0Ch,04h,00h
        db 0EFh,0Ch,04h,00h,0F7h,0Ch,0FCh,0FFh
SPAcupturnend:                                  ; SPA 0x953: end of the turn with the cup (asscupfollow)
                                                ; (confidence low)
        db 00h,00h,02h,00h,0EFh,0Ch,08h,00h,0F7h,0Ch,0F8h,0FFh
SPAcupturnhold:                                 ; SPA 0x959: held pose after the turn with the cup
                                                ; (asscupfollow) (confidence low)
        db 00h,00h,01h,00h,0F7h,0Ch,0F8h,0FFh
SPAcuptake:                                     ; SPA 0x95D: taking the cup (asscuptake, asscupfollow)
                                                ; (confidence medium)
        db 00h,00h,09h,00h,87h,0Dh,04h,00h,8Fh,0Dh,04h,00h,97h,0Dh,04h,00h
        db 9Fh,0Dh,04h,00h,0A7h,0Dh,04h,00h,0AFh,0Dh,04h,00h,0B7h,0Dh,04h,00h
        db 0BFh,0Dh,04h,00h,0C7h,0Dh,0FCh,0FFh
SPAcupfollow:                                   ; SPA 0x971: skating after the cup carrier (asscupfollow)
                                                ; (confidence low)
        db 00h,00h,08h,00h,0FFh,0Ch,08h,00h,07h,0Dh,08h,00h,0Fh,0Dh,08h,00h
        db 17h,0Dh,08h,00h,1Fh,0Dh,08h,00h,27h,0Dh,08h,00h,2Fh,0Dh,08h,00h
        db 37h,0Dh,0F8h,0FFh
SPAcupidle:                                     ; SPA 0x983: standing, waiting for the cup (asscupfollow,
                                                ; asscuptake) (confidence low)
        db 00h,00h,01h,00h,7Fh,0Dh,0F8h,0FFh
SPAcupstand:                                    ; SPA 0x987: standing with the cup (assstanley, asscuptake)
                                                ; (confidence low)
        db 00h,00h,01h,00h,58h,0Eh,0F8h,0FFh
SPAcupraise:                                    ; SPA 0x98B: raising the cup (assstanley) (confidence low)
        db 00h,00h,02h,00h,50h,0Eh,0Ch,00h,58h,0Eh,0F4h,0FFh
SPAgetcup:                                      ; SPA 0x991: player gets into the penalty box (assboxenter)
                                                ; (confidence medium)
        db 02h,00h,09h,00h,0E7h,0Dh,08h,00h,0E8h,0Dh,08h,00h,0E9h,0Dh,08h,00h
        db 0EAh,0Dh,08h,00h,0EBh,0Dh,08h,00h,0ECh,0Dh,08h,00h,0EDh,0Dh,08h,00h
        db 0EEh,0Dh,08h,00h,0EFh,0Dh,0E4h,0FFh
SPAboxenter:                                    ; SPA 0x9A5: player steps into the penalty box (assboxenter)
                                                ; (confidence low)
        db 02h,00h,08h,00h,0DFh,0Dh,1Eh,00h,0E0h,0Dh,06h,00h,0E1h,0Dh,06h,00h
        db 0E2h,0Dh,06h,00h,0E3h,0Dh,06h,00h,0E4h,0Dh,06h,00h,0E5h,0Dh,06h,00h
        db 0E6h,0Dh,0F0h,0FFh
SPAcuptakeend:                                  ; SPA 0x9B7: end of taking the cup (asscuptake) (confidence
                                                ; low)
        db 00h,00h,09h,00h,0C7h,0Dh,04h,00h,0BFh,0Dh,04h,00h,0B7h,0Dh,04h,00h
        db 0AFh,0Dh,04h,00h,0A7h,0Dh,04h,00h,9Fh,0Dh,04h,00h,97h,0Dh,04h,00h
        db 8Fh,0Dh,04h,00h,87h,0Dh,0FCh,0FFh
SPAcupheld:                                     ; SPA 0x9CB: holding the cup, two frames (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,02h,00h,0D7h,0Dh,0Ch,00h,0CFh,0Dh,0F4h,0FFh
SPAcupheld2:                                    ; SPA 0x9D1: holding the cup, three frames (not set by an
                                                ; immediate) (confidence low)
        db 00h,00h,03h,00h,0CFh,0Dh,0Ch,00h,0D7h,0Dh,0Ch,00h,7Fh,0Dh,0F4h,0FFh
SPAcupfollow2:                                  ; SPA 0x9D9: skating after the cup carrier, other direction
                                                ; (asscupfollow) (confidence low)
        db 00h,00h,08h,00h,3Fh,0Dh,08h,00h,47h,0Dh,08h,00h,4Fh,0Dh,08h,00h
        db 57h,0Dh,08h,00h,5Fh,0Dh,08h,00h,67h,0Dh,08h,00h,6Fh,0Dh,08h,00h
        db 77h,0Dh,0F8h,0FFh
SPAcupfollowhold:                               ; SPA 0x9EB: held pose at the end of the cup follow skate
                                                ; (asscupfollow) (confidence low)
        db 00h,00h,01h,00h,3Fh,0Dh,0F8h,0FFh
SPApflip:                                       ; SPA 0x9EF: puck flip (puckflip)
        db 01h,00h,01h,00h,0DBh,0Eh,0FCh
LinePickOrderFrom1:                             ; same code as in the next game; used by releasepl
        db 0FFh
