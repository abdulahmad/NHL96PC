; Sprite animation tables: SPAlist and one sequence per animation, in SPA number order. The code files take
; the SPA numbers from src/inc/spa.inc; tools/build/check_spa.py checks them.
;
; A sequence is a flags word (bit 1: every direction shows the same frames; the other bits are read by the
; animation code), a pair count (the animation code reads pair count-1 as the last pair), then the frame,time
; pairs. A frame is the one for direction 0: the player's direction 0-7 is added to it. A negative time ends
; the list. SPAgidle's count is 10 for its 11 pairs.
;
; A SPA number is a sequence's word offset from SPAlist. CheckHitAnims is the pair of SPAstand, which chkhit
; also reads. The high byte of the last sequence's final time is LinePickOrderFrom1.
bits 32
%include "hockey.inc"
section s_117A9C progbits alloc noexec write align=1
global SPAlist, CheckHitAnims, LinePickOrderFrom1

SPAlist:                                        ; the SPA table: every sprite animation sequence (flags, pair
                                                ; count, frame/time pairs); a sequence number is its word
                                                ; offset from here; used by HotSpotFrame, BenchSprite
        dw 0                                    ; SPA 0 is no animation
SPAstand:                                       ; SPA 0x1: standing still, facing the player direction
                                                ; (assfwatch, resetplstuff, asspenshooter) (confidence low)
        dw 0, 1                                 ; flags, pair count
CheckHitAnims:                                  ; chkhit: hit animation per check type; used by chkhit
        dw 0, -10
SPAcoast:                                       ; SPA 0x5: coasting pose, first frame of the skate cycle held
                                                ; (RunPreGameSkate) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 8, -10
SPAskate:                                       ; SPA 0x9: skating, no puck (noturn0 picks it when the player
                                                ; is not the puck carrier) (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 16, 4, 24, 4, 32, 4, 40, 4, 48, 4, 56, 4, 64, 4, 72, -4
SPAskatewp:                                     ; SPA 0x1B: skating with the puck (noturn0 when the player is
                                                ; the puck carrier) (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 80, 4, 88, 4, 96, 4, 104, 4, 112, 4, 120, 4, 128, 4, 136, -4
SPAskatewp2:                                    ; SPA 0x2D: skating with the puck, second pose set; the second
                                                ; sequence of the SPAskatewp pair (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 144, 4, 152, 4, 160, 4, 168, 4, 176, 4, 184, 4, 192, 4, 200, -4
SPAstop:                                        ; SPA 0x3F: stop (dostop, not the puck carrier) (confidence
                                                ; medium)
        dw 0, 2                                 ; flags, pair count
        dw 1200, 8, 1208, -28
SPAstophold:                                    ; SPA 0x45: stop, held end frame (dostop switches to it when
                                                ; SPAstop ends) (confidence medium)
        dw 1, 1                                 ; flags, pair count
        dw 1208, -16
SPAstopwp:                                      ; SPA 0x49: stop with the puck (dostop when the player is the
                                                ; puck carrier) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 208, 8, 216, -28
SPAstopwphold:                                  ; SPA 0x4F: stop with the puck, held end frame (confidence
                                                ; medium)
        dw 1, 1                                 ; flags, pair count
        dw 216, -16
SPAstopfast:                                    ; SPA 0x53: stop without the puck when dostop does not pick
                                                ; SPAstop (dostop) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 960, 8, 968, -28
SPAstopfasthold:                                ; SPA 0x59: stop, held end frame of SPAstopfast (dostop)
                                                ; (confidence low)
        dw 1, 1                                 ; flags, pair count
        dw 968, -16
SPAturnlwp:                                     ; SPA 0x5D: turning left with the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 248, -8
SPAturnl:                                       ; SPA 0x61: turning left without the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 1000, -8
SPAturnlwpin:                                   ; SPA 0x65: turning left with the puck, start of the turn (two
                                                ; frames; doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 240, 8, 248, -8
SPAturnlin:                                     ; SPA 0x6B: turning left without the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 992, 8, 1000, -8
SPAturnrwp:                                     ; SPA 0x71: turning right with the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 232, -8
SPAturnr:                                       ; SPA 0x75: turning right without the puck, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 984, -8
SPAturnrwpin:                                   ; SPA 0x79: turning right with the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 224, 8, 232, -8
SPAturnrin:                                     ; SPA 0x7F: turning right without the puck, start of the turn
                                                ; (two frames; doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 976, 8, 984, -8
SPAcheckswingl:                                 ; SPA 0x85: check swing to the left, not flagged as a check
                                                ; animation (DoCheckInput) (confidence low)
        dw 0, 4                                 ; flags, pair count
        dw 528, 8, 536, 8, 544, 8, 552, -8
SPAcheckswingr:                                 ; SPA 0x8F: check swing to the right, not flagged as a check
                                                ; animation (DoCheckInput) (confidence low)
        dw 0, 4                                 ; flags, pair count
        dw 496, 8, 504, 8, 512, 8, 520, -8
SPAskatefast:                                   ; SPA 0x99: skating fast without the puck (PickSkateAnim when
                                                ; speed is 0FA0h or more) (confidence medium)
        dw 0, 4                                 ; flags, pair count
        dw 368, 10, 344, 10, 352, 10, 360, -10
SPAcoastl:                                      ; SPA 0xA3: coasting stride, left (FallDown tests it; two
                                                ; frames held) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 344, 28, 352, -28
SPAcoastr:                                      ; SPA 0xA9: coasting stride, right (CrowdOnStoppage picks it
                                                ; at random) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 360, 28, 368, -28
SPApassf:                                       ; SPA 0xAF: pass, forward side (dopass) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 272, 6, 320, -20
SPApassb:                                       ; SPA 0xB5: pass, backward side (dopass) (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 1224, 4, 1240, 8, 1248, -8
SPAshotf:                                       ; SPA 0xBD: shot, forward side (SetShotMode) (confidence
                                                ; medium)
        dw 0, 7                                 ; flags, pair count
        dw 272, 4, 280, 4, 288, 4, 296, 4, 304, 4, 328, 4, 336, -20
SPAshotfquick:                                  ; SPA 0xCD: forward shot with the quick-release ending
                                                ; (ShotMode replaces SPAshotf by it, regd2 bit 5) (confidence
                                                ; low)
        dw 0, 7                                 ; flags, pair count
        dw 272, 4, 280, 4, 288, 4, 296, 4, 304, 4, 312, 4, 320, -20
SPAshotb:                                       ; SPA 0xDD: shot, backward side (ShotMode) (confidence medium)
        dw 0, 7                                 ; flags, pair count
        dw 1216, 2, 1224, 2, 1224, 2, 1232, 2, 1232, 2, 1240, 8, 1248, -8
SPAfakeshotf:                                   ; SPA 0xED: faked shot, forward side (ShotMode) (confidence
                                                ; medium)
        dw 0, 7                                 ; flags, pair count
        dw 272, 4, 280, 4, 288, 4, 296, 4, 304, 4, 288, 4, 272, -4
SPAfakeshotb:                                   ; SPA 0xFD: faked shot, backward side (ShotMode) (confidence
                                                ; medium)
        dw 0, 7                                 ; flags, pair count
        dw 1216, 2, 1224, 2, 1224, 2, 1232, 2, 1232, 2, 1224, 4, 1216, -4
SPAonetimef:                                    ; SPA 0x10D: one-timer, forward side (assonetimer) (confidence
                                                ; medium)
        dw 0, 4                                 ; flags, pair count
        dw 296, 24, 312, 2, 312, 2, 320, -20
SPAonetimeb:                                    ; SPA 0x117: one-timer, backward side (assonetimer)
                                                ; (confidence medium)
        dw 0, 4                                 ; flags, pair count
        dw 1232, 24, 1240, 2, 1240, 2, 1248, -8
SPAfakeonetimef:                                ; SPA 0x121: faked one-timer, forward side (assonetimer,
                                                ; ShotMode) (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 296, 24, 280, 4, 272, -4
SPAfakeonetimeb:                                ; SPA 0x129: faked one-timer, backward side (assonetimer,
                                                ; ShotMode) (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 1232, 24, 1224, 4, 1216, -4
SPAboardback:                                   ; SPA 0x131: falling against the boards with the back to them
                                                ; (FallFrameByDir) (confidence medium)
        dw 20h, 12                              ; flags, pair count
        dw 1520, 6, 1528, 6, 1536, 6, 1544, 6, 1552, 6, 1560, 6, 1472, 20, 1776, 8
        dw 1784, 8, 1792, 8, 1800, 8, 1808, -8
SPAboardfront:                                  ; SPA 0x14B: falling against the boards facing them
                                                ; (FallFrameByDir) (confidence medium)
        dw 20h, 12                              ; flags, pair count
        dw 1568, 6, 1576, 6, 1584, 6, 1592, 6, 1600, 6, 1608, 6, 1416, 20, 1816, 8
        dw 1824, 8, 1832, 8, 1840, 8, 1848, -8
SPAboardleft:                                   ; SPA 0x165: falling against the boards, side-on, mirrored
                                                ; (FallFrameByDir) (confidence low)
        dw 28h, 12                              ; flags, pair count
        dw 1664, 6, 1672, 6, 1680, 6, 1688, 6, 1696, 6, 1704, 6, 1472, 20, 1776, 8
        dw 1784, 8, 1792, 8, 1800, 8, 1808, -8
SPAboardright:                                  ; SPA 0x17F: falling against the boards, side-on
                                                ; (FallFrameByDir) (confidence low)
        dw 28h, 12                              ; flags, pair count
        dw 1616, 6, 1624, 6, 1632, 6, 1640, 6, 1648, 6, 1656, 6, 1416, 20, 1816, 8
        dw 1824, 8, 1832, 8, 1840, 8, 1848, -8
SPAboardbackglass:                              ; SPA 0x199: falling back into the glass hard enough to break
                                                ; it (FallDown, FallFrameByFacing) (confidence low)
        dw 18h, 8                               ; flags, pair count
        dw 1712, 6, 1720, 6, 1728, 6, 1736, 6, 1784, 28, 1792, 8, 1800, 8, 1808, -8
SPAboardfrontglass:                             ; SPA 0x1AB: falling forward into the glass hard enough to
                                                ; break it (FallDown, FallFrameByFacing) (confidence low)
        dw 18h, 8                               ; flags, pair count
        dw 1744, 6, 1752, 6, 1760, 6, 1768, 6, 1784, 28, 1792, 8, 1800, 8, 1808, -8
SPAfallback:                                    ; SPA 0x1BD: falling backward after a check from the front
                                                ; (FallDown) (confidence medium)
        dw 20h, 11                              ; flags, pair count
        dw 1376, 6, 1384, 6, 1392, 6, 1400, 6, 1408, 6, 1416, 20, 1816, 8, 1824, 8
        dw 1832, 8, 1840, 8, 1848, -8
SPAfallfwd:                                     ; SPA 0x1D5: falling forward after a check from behind or the
                                                ; side (FallDown) (confidence medium)
        dw 20h, 12                              ; flags, pair count
        dw 1424, 6, 1432, 6, 1440, 6, 1448, 6, 1456, 6, 1464, 6, 1472, 20, 1776, 8
        dw 1784, 8, 1792, 8, 1800, 8, 1808, -8
SPAflip:                                        ; SPA 0x1EF: flipped over by a hard check (FallDown)
                                                ; (confidence medium)
        dw 20h, 14                              ; flags, pair count
        dw 1880, 6, 1888, 6, 1896, 6, 1904, 6, 1912, 6, 1920, 6, 1928, 6, 1936, 6
        dw 1416, 20, 1816, 8, 1824, 8, 1832, 8, 1840, 8, 1848, -8
SPAflipfwd:                                     ; SPA 0x20D: flipped over forward by a hard check from behind
                                                ; (FallDown) (confidence low)
        dw 20h, 14                              ; flags, pair count
        dw 1944, 6, 1952, 6, 1960, 6, 1968, 6, 1976, 6, 1984, 6, 1992, 6, 2000, 6
        dw 1472, 20, 1776, 8, 1784, 8, 1792, 8, 1800, 8, 1808, -8
SPAinjury1:                                     ; SPA 0x22B: injured player lying on the ice, held (FallDown)
                                                ; (confidence medium)
        dw 20h, 54                              ; flags, pair count
        dw 1376, 6, 1384, 6, 1392, 6, 1400, 6, 1408, 6, 1416, 6, 1480, 8, 1488, 8
        dw 1496, 8, 1488, 8, 1480, 9, 1488, 9, 1496, 10, 1488, 10, 1480, 11, 1488, 11
        dw 1496, 12, 1488, 50, 1480, 8, 1488, 8, 1496, 8, 1488, 8, 1480, 9, 1488, 9
        dw 1496, 10, 1488, 10, 1480, 11, 1488, 11, 1496, 12, 1488, 70, 1480, 8, 1488, 8
        dw 1496, 8, 1488, 8, 1480, 9, 1488, 9, 1496, 10, 1488, 10, 1480, 11, 1488, 11
        dw 1496, 12, 1488, 60, 1480, 8, 1488, 8, 1496, 8, 1488, 8, 1480, 9, 1488, 9
        dw 1496, 10, 1488, 10, 1480, 11, 1488, 11, 1496, 12, 1488, -4000
SPAstumble:                                     ; SPA 0x299: strong player stumbles instead of falling
                                                ; (FallDown) (confidence medium)
        dw 0, 4                                 ; flags, pair count
        dw 608, 7, 616, 7, 624, 7, 632, -7
SPAblockleft:                                   ; SPA 0x2A3: skater dives to block a shot, left
                                                ; (BlockShotDive) (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 592, 8, 600, 20, 1792, 8, 1800, 8, 1808, -8
SPAblockright:                                  ; SPA 0x2AF: skater dives to block a shot, right
                                                ; (BlockShotDive) (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 576, 8, 584, 20, 1792, 8, 1800, 8, 1808, -8
SPAblockfront:                                  ; SPA 0x2BB: skater stands to block a high shot
                                                ; (BlockShotDive) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 560, -20
SPAblockknee:                                   ; SPA 0x2BF: skater drops to block a low shot (BlockShotDive)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 568, -20
SPAburst:                                       ; SPA 0x2C3: burst of speed; the burst routine sets it
        dw 18h, 8                               ; flags, pair count
        dw 16, 4, 24, 4, 32, 4, 40, 4, 48, 4, 56, 4, 64, 4, 72, -4
SPAcrosscheck:                                  ; SPA 0x2D5: cross check; checkcheck penalty test
        dw 0, 2                                 ; flags, pair count
        dw 1504, 6, 1512, -10
SPAsweepchk:                                    ; SPA 0x2DB: sweep check; checkcheck sends it to Bcheck
        dw 0, 3                                 ; flags, pair count
        dw 256, 6, 264, 10, 256, -6
SPAhook:                                        ; SPA 0x2E3: hook check; Holdplayer
        dw 0, 3                                 ; flags, pair count
        dw 1856, 4, 1864, 20, 1872, -4
SPAhook2:                                       ; SPA 0x2EB: player held by a hook check (holdcheck)
        dw 0, 6                                 ; flags, pair count
        dw 1856, 8, 1864, 8, 1872, 8, 1856, 8, 1864, 8, 1872, -8
SPAHold:                                        ; SPA 0x2F9: hold check, stick out; input sets it, checkcheck
                                                ; sends it to holdcheck
        dw 0, 1                                 ; flags, pair count
        dw 2008, -30
SPAHold2:                                       ; SPA 0x2FD: player held by a hold check (holdcheck)
        dw 0, 1                                 ; flags, pair count
        dw 2008, -30
SPAshoulderchkr:                                ; SPA 0x301: shoulder check right, windup and hit (not set by
                                                ; an immediate) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 480, 8, 488, -16
SPAshoulderchkl:                                ; SPA 0x307: shoulder check left, windup and hit (not set by
                                                ; an immediate) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 464, 8, 472, -16
SPAhipchkr:                                     ; SPA 0x30D: hip check right, windup and hit (not set by an
                                                ; immediate) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 448, 8, 456, -16
SPAhipchkl:                                     ; SPA 0x313: hip check left, windup and hit (not set by an
                                                ; immediate) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 432, 8, 440, -16
SPAchecktarget:                                 ; SPA 0x319: check on a target ahead, shoulder side
                                                ; (DoCheckInput, checkcheck) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 1080, 8, 1088, -16
SPAchecktargetl:                                ; SPA 0x31F: check on a target at the left hip (DoCheckInput,
                                                ; checkcheck; left hip) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 1112, 8, 1120, -16
SPAchecktargetr:                                ; SPA 0x325: check on a target at the right hip (DoCheckInput,
                                                ; checkcheck; right hip) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 1096, 8, 1104, -16
SPAcheckslidel:                                 ; SPA 0x32B: fast check slide, left (DoCheckInput plays sfx
                                                ; 21h first) (confidence low)
        dw 0, 5                                 ; flags, pair count
        dw 1280, 10, 1288, 10, 1296, 10, 1288, 10, 1280, -10
SPAcheckslider:                                 ; SPA 0x337: fast check slide, right (DoCheckInput plays sfx
                                                ; 21h first) (confidence low)
        dw 0, 5                                 ; flags, pair count
        dw 1256, 10, 1264, 10, 1272, 10, 1264, 10, 1256, -10
SPAcheckskate:                                  ; SPA 0x343: skating with a check pending, no target, no puck
                                                ; (DoCheckInput; 343-36Fh is the check range) (confidence
                                                ; medium)
        dw 0, 8                                 ; flags, pair count
        dw 16, 4, 24, 4, 32, 4, 40, 4, 48, 4, 56, 4, 64, 4, 72, -4
SPAcheckmissl:                                  ; SPA 0x355: check swing with no target, left (DoCheckInput)
                                                ; (confidence low)
        dw 0, 4                                 ; flags, pair count
        dw 528, 8, 536, 8, 544, 8, 552, -8
SPAcheckmissr:                                  ; SPA 0x35F: check swing with no target, right (DoCheckInput)
                                                ; (confidence low)
        dw 0, 4                                 ; flags, pair count
        dw 496, 8, 504, 8, 512, 8, 520, -8
SPAcheckburstl:                                 ; SPA 0x369: check while burst is held, left (DoCheckInput)
                                                ; (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 448, 8, 456, -16
SPAcheckburstr:                                 ; SPA 0x36F: check while burst is held, right (DoCheckInput)
                                                ; (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 432, 8, 440, -16
SPAcheckskatewp:                                ; SPA 0x375: skating with a check pending, puck carrier
                                                ; (DoCheckInput) (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 80, 4, 88, 4, 96, 4, 104, 4, 112, 4, 120, 4, 128, 4, 136, -4
SPAfaceoff:                                     ; SPA 0x387: faceoff stance (puckcarrier) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 376, -8
SPAfaceoffr:                                    ; SPA 0x38B: alternate faceoff stance after the wait runs out,
                                                ; one in 8 (faceoffinput) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 384, -5
SPAfaceoffpokel:                                ; SPA 0x38F: faceoff stick swing, left side (faceoffinput)
                                                ; (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 392, 8, 400, -8
SPAfaceoffpokelhold:                            ; SPA 0x395: faceoff stick swing, left side, late press
                                                ; (faceoffinput) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 392, -8
SPAfaceoffpoker:                                ; SPA 0x399: faceoff stick swing, right side (faceoffinput)
                                                ; (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 408, 8, 416, -8
SPAfaceoffpokerhold:                            ; SPA 0x39F: faceoff stick swing, right side, late press
                                                ; (faceoffinput) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 408, -8
SPAfaceoffpokeend:                              ; SPA 0x3A3: faceoff stick swing, end pose (not set by an
                                                ; immediate) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 424, -8
SPApuckhit:                                     ; SPA 0x3A7: skater reacts to being hit by a fast puck
                                                ; (puckbody) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 2016, 8, 2024, -8
SPAwallleft:                                    ; SPA 0x3AD: skater against the wall left (TakePlayerFromBox,
                                                ; assepen family) (confidence medium)
        dw 8, 8                                 ; flags, pair count
        dw 2032, 4, 2040, 4, 2048, 4, 2056, 4, 2064, 4, 2072, 4, 2080, 4, 2088, -4
SPAwallright:                                   ; SPA 0x3BF: skater against the wall right (asseben)
                                                ; (confidence medium)
        dw 18h, 8                               ; flags, pair count
        dw 2032, 4, 2040, 4, 2048, 4, 2056, 4, 2064, 4, 2072, 4, 2080, 4, 2088, -4
SPAglide:                                       ; SPA 0x3D1: glide; dostop, doplayeracc and noturn0 fall back
                                                ; to it (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 1304, -10
SPAstandrest:                                   ; SPA 0x3D5: standing at rest off the play: penalty box,
                                                ; bench, leaving the ice (assleavebox, assboxenter, assbench)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 1304, -10
SPAcelebrate:                                   ; SPA 0x3D9: scorer celebrates, first of the four picks
                                                ; (ScoreCelebrateAnims) (confidence medium)
        dw 0, 4                                 ; flags, pair count
        dw 2128, 8, 2136, 8, 2144, 28, 2128, -5
SPAcelebrate2:                                  ; SPA 0x3E3: scorer celebrates, second pick
                                                ; (ScoreCelebrateAnims) (confidence medium)
        dw 0, 6                                 ; flags, pair count
        dw 2128, 8, 2136, 8, 2144, 24, 2136, 8, 2144, 28, 2128, -5
SPApump:                                        ; SPA 0x3F1: scorer pumps the arm, first (ScoreCelebrateAnims)
                                                ; (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 2152, 8, 2160, 28, 2152, -5
SPApump2:                                       ; SPA 0x3F9: scorer pumps the arm, second
                                                ; (ScoreCelebrateAnims) (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 2152, 8, 2160, 24, 2152, 8, 2160, 28, 2152, -5
SPAcelebratevis:                                ; SPA 0x405: celebration picked for the visiting team, first
                                                ; (assscore) (confidence low)
        dw 0, 6                                 ; flags, pair count
        dw 2096, 8, 2104, 16, 2112, 8, 2120, 20, 2112, 8, 2096, -5
SPAcelebratevis2:                               ; SPA 0x413: celebration picked for the visiting team, second
                                                ; (assscore) (confidence low)
        dw 0, 8                                 ; flags, pair count
        dw 2096, 8, 2104, 16, 2112, 8, 2120, 20, 2112, 8, 2120, 20, 2112, 8, 2096, -5
SPAboxsit:                                      ; SPA 0x425: penalized player sitting in the box (asspenalty,
                                                ; assdopen) (confidence medium)
        dw 2, 13                                ; flags, pair count
        dw 2232, 6, 2240, 6, 2248, 6, 2256, 6, 2264, 6, 2272, 6, 2280, 6, 2288, 6
        dw 8, 8, 9, 8, 10, 8, 11, 8, 12, -8
SPAboxsitep:                                    ; SPA 0x441: sitting in the box for a second penalty (assepen)
                                                ; (confidence medium)
        dw 0, 9                                 ; flags, pair count
        dw 8, 8, 2232, 6, 2240, 6, 2248, 6, 2256, 6, 2264, 6, 2272, 6, 2280, 6
        dw 2288, -6
SPAskatebox:                                    ; SPA 0x455: player skating to the penalty box after a fight
                                                ; (doplayeracc, dostop, noturn0) (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 2829, 4, 2837, 4, 2845, 4, 2853, 4, 2861, 4, 2869, 4, 2877, 4, 2885, -4
SPAglidebox:                                    ; SPA 0x467: the same skate to the penalty box as one held
                                                ; frame (doplayeracc, noturn0) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2829, -4
SPAfightdrop:                                   ; SPA 0x46B: gloves drop and the fighters take their stance;
                                                ; chkhit tests its last frame (checkfight) (confidence low)
        dw 0Ch, 9                               ; flags, pair count
        dw 2893, 26, 2895, 6, 2897, 6, 2899, 6, 2901, 6, 2903, 6, 2905, 6, 2907, 6
        dw 2909, -6
SPAfight:                                       ; SPA 0x47F: fight stance, set when the fight starts
                                                ; (assfight) (confidence medium)
        dw 4, 1                                 ; flags, pair count
        dw 2915, -6
SPAfightstance:                                 ; SPA 0x483: fight stance, circling (assfight, chkhit)
                                                ; (confidence low)
        dw 5, 8                                 ; flags, pair count
        dw 2915, 4, 2917, 4, 2919, 4, 2921, 4, 2923, 4, 2925, 4, 2927, 4, 2929, -4
SPAfightweavel:                                 ; SPA 0x495: fight footwork, left (assfight) (confidence low)
        dw 4, 6                                 ; flags, pair count
        dw 2931, 4, 2933, 4, 2935, 4, 2937, 4, 2939, 4, 2941, -4
SPAfightweaver:                                 ; SPA 0x4A3: fight footwork, right (assfight) (confidence low)
        dw 4, 6                                 ; flags, pair count
        dw 2943, 4, 2945, 4, 2947, 4, 2949, 4, 2951, 4, 2953, -4
SPAfhigh:                                       ; SPA 0x4B1: high punch (fightinput, FightAnimTab) (confidence
                                                ; medium)
        dw 4, 6                                 ; flags, pair count
        dw 2955, 6, 2957, 6, 2959, 6, 2961, 6, 2963, 6, 2965, -6
SPAfhith:                                       ; SPA 0x4BF: hit by a high punch (chkhit) (confidence medium)
        dw 4, 5                                 ; flags, pair count
        dw 2967, 6, 2969, 6, 2971, 6, 2973, 6, 2975, -6
SPAflow:                                        ; SPA 0x4CB: low punch (fightinput, FightAnimTab) (confidence
                                                ; medium)
        dw 4, 3                                 ; flags, pair count
        dw 2977, 8, 2979, 8, 2981, -8
SPAfhitl:                                       ; SPA 0x4D3: hit by a low punch (chkhit) (confidence medium)
        dw 4, 2                                 ; flags, pair count
        dw 2983, 6, 2985, -6
SPAffall:                                       ; SPA 0x4D9: loser falls after the fight is decided (chkhit)
                                                ; (confidence medium)
        dw 24h, 14                              ; flags, pair count
        dw 3005, 6, 3007, 6, 3009, 6, 3011, 6, 3013, 6, 3015, 6, 3017, 6, 3019, 6
        dw 3021, 30, 3023, 6, 3025, 6, 3027, 6, 3029, 6, 3031, -6
SPAffall2:                                      ; SPA 0x4F7: loser falls, the other side (chkhit) (confidence
                                                ; medium)
        dw 2Ch, 15                              ; flags, pair count
        dw 2987, 6, 2989, 6, 2991, 6, 2993, 6, 2995, 6, 2997, 6, 2999, 6, 3001, 6
        dw 3003, 30, 3033, 6, 3035, 6, 3037, 6, 3039, 6, 3041, 6, 3043, -6
SPAfinjury:                                     ; SPA 0x517: injured loser, copy of SPAffall (not set by an
                                                ; immediate) (confidence low)
        dw 24h, 14                              ; flags, pair count
        dw 3005, 6, 3007, 6, 3009, 6, 3011, 6, 3013, 6, 3015, 6, 3017, 6, 3019, 6
        dw 3021, 200, 3023, 6, 3025, 6, 3027, 6, 3029, 6, 3031, -6
SPAfinjury2:                                    ; SPA 0x535: injured loser, copy of SPAffall2 (not set by an
                                                ; immediate) (confidence low)
        dw 2Ch, 15                              ; flags, pair count
        dw 2987, 6, 2989, 6, 2991, 6, 2993, 6, 2995, 6, 2997, 6, 2999, 6, 3001, 6
        dw 3003, 200, 3033, 6, 3035, 6, 3037, 6, 3039, 6, 3041, 6, 3043, -6
SPAfwin:                                        ; SPA 0x555: winner stands over the loser (chkhit) (confidence
                                                ; low)
        dw 4, 2                                 ; flags, pair count
        dw 3057, 6, 2915, -6
SPAfswing:                                      ; SPA 0x55B: big swing punch (FightAnimTab, chkhit)
                                                ; (confidence low)
        dw 4, 8                                 ; flags, pair count
        dw 3045, 6, 3061, 6, 3063, 6, 3065, 6, 3067, 6, 3069, 6, 3071, 6, 3073, -6
SPAfswinghit:                                   ; SPA 0x56D: hit by the big swing punch (chkhit) (confidence
                                                ; low)
        dw 4, 8                                 ; flags, pair count
        dw 3099, 6, 3101, 6, 3103, 6, 3105, 6, 3107, 6, 3109, 6, 3111, 6, 3047, -6
SPAfgrab:                                       ; SPA 0x57F: grab (FightAnimTab, chkhit) (confidence medium)
        dw 4, 4                                 ; flags, pair count
        dw 3049, 8, 3051, 8, 3075, 8, 3077, -8
SPAfgrabend:                                    ; SPA 0x589: grab ends without a hold (chkhit) (confidence
                                                ; low)
        dw 4, 5                                 ; flags, pair count
        dw 3049, 8, 3051, 8, 3053, 8, 3055, 8, 3057, -8
SPAfheld:                                       ; SPA 0x595: held by a grab (chkhit) (confidence medium)
        dw 4, 2                                 ; flags, pair count
        dw 3113, 8, 3115, -8
SPAfhighwaitl:                                  ; SPA 0x59B: left fighter waits with the high punch ready
                                                ; (assfight) (confidence low)
        dw 4, 1                                 ; flags, pair count
        dw 3077, -12
SPAfhighwaitr:                                  ; SPA 0x59F: right fighter waits with the high punch ready
                                                ; (assfight) (confidence low)
        dw 4, 1                                 ; flags, pair count
        dw 3115, -12
SPAfhighl:                                      ; SPA 0x5A3: left fighter high punch for the computer
                                                ; (assfight, chkhit) (confidence low)
        dw 4, 4                                 ; flags, pair count
        dw 3079, 7, 3081, 7, 3083, 7, 3085, -7
SPAfhighr:                                      ; SPA 0x5AD: right fighter high punch for the computer
                                                ; (assfight) (confidence low)
        dw 4, 4                                 ; flags, pair count
        dw 3117, 7, 3119, 7, 3121, 7, 3123, -7
SPAfgrab2:                                      ; SPA 0x5B7: grab, the other side (FightAnimTab, chkhit)
                                                ; (confidence medium)
        dw 4, 3                                 ; flags, pair count
        dw 3049, 8, 3051, 8, 3087, -8
SPAfheld2:                                      ; SPA 0x5BF: held by a grab, the other side (chkhit)
                                                ; (confidence medium)
        dw 4, 1                                 ; flags, pair count
        dw 3125, -8
SPAflowwaitl:                                   ; SPA 0x5C3: left fighter waits with the low punch ready
                                                ; (assfight) (confidence low)
        dw 4, 1                                 ; flags, pair count
        dw 3087, -12
SPAflowwaitr:                                   ; SPA 0x5C7: right fighter waits with the low punch ready
                                                ; (assfight) (confidence low)
        dw 4, 1                                 ; flags, pair count
        dw 3125, -12
SPAflowl:                                       ; SPA 0x5CB: left fighter low punch for the computer
                                                ; (assfight, chkhit) (confidence low)
        dw 4, 5                                 ; flags, pair count
        dw 3089, 6, 3091, 6, 3093, 6, 3095, 6, 3097, -6
SPAflowr:                                       ; SPA 0x5D7: right fighter low punch for the computer
                                                ; (assfight) (confidence low)
        dw 4, 5                                 ; flags, pair count
        dw 3127, 6, 3129, 6, 3131, 6, 3133, 6, 3135, -6
SPAgready2:                                     ; SPA 0x5E3: goalie ready, held frame; -30 end time
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 640, -30
SPAgglover:                                     ; SPA 0x5E7: goalie glove save, right (GoalieSaveAnims slot 0)
                                                ; (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 680, 8, 688, -20
SPAgglovel:                                     ; SPA 0x5ED: goalie glove save, left (GoalieSaveAnims slot 1)
                                                ; (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 696, 8, 704, -20
SPAgstickr:                                     ; SPA 0x5F3: goalie stick save right (SkillForAnim, by
                                                ; position in its table) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 664, 8, 672, -20
SPAgstickl:                                     ; SPA 0x5F9: goalie stick save left (SkillForAnim, by position
                                                ; in its table) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 648, 8, 656, -20
SPAgstackr:                                     ; SPA 0x5FF: goalie pad stack, right (GoalieSaveAnims slot 2)
                                                ; (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 736, 8, 744, 8, 752, 30, 1168, 7, 1176, 7, 1144, 7, 1152, 7, 1160, -7
SPAgstackl:                                     ; SPA 0x611: goalie pad stack, left (GoalieSaveAnims slot 3)
                                                ; (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 712, 8, 720, 8, 728, 30, 1184, 7, 1192, 7, 1144, 7, 1152, 7, 1160, -7
SPAgdive:                                       ; SPA 0x623: goalie dives for the puck (assgoalie) (confidence
                                                ; medium)
        dw 20h, 8                               ; flags, pair count
        dw 760, 8, 768, 8, 776, 40, 1128, 7, 1136, 7, 1144, 7, 1152, 7, 1160, -7
SPAgoalieknee:                                  ; SPA 0x635: goalie drops to his knees (confidence low)
        dw 0, 5                                 ; flags, pair count
        dw 1008, 8, 1016, 30, 1144, 7, 1152, 7, 1160, -7
SPAgokneehold:                                  ; SPA 0x641: goalie stays on his knees (assgoalie) (confidence
                                                ; medium)
        dw 0, 5                                 ; flags, pair count
        dw 1008, 8, 1016, 90, 1144, 7, 1152, 7, 1160, -7
SPAgofallglove:                                 ; SPA 0x64D: goalie falls on the glove side (SkillForAnim, by
                                                ; position) (confidence low)
        dw 20h, 8                               ; flags, pair count
        dw 800, 8, 808, 8, 816, 20, 1168, 7, 1176, 7, 1144, 7, 1152, 7, 1160, -7
SPAgofallstick:                                 ; SPA 0x65F: goalie falls on the stick side (SkillForAnim, by
                                                ; position) (confidence low)
        dw 20h, 8                               ; flags, pair count
        dw 832, 8, 840, 8, 848, 20, 1184, 7, 1192, 7, 1144, 7, 1152, 7, 1160, -7
SPAgoaliepoke:                                  ; SPA 0x671: goalie pokes the puck away (assgoalie, puckglue)
                                                ; (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 864, 4, 872, 15, 864, -6
SPAgskate:                                      ; SPA 0x679: goalie skating (goalieskateto, SkateToSpot)
                                                ; (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 880, 4, 888, 4, 896, 4, 904, 4, 912, 4, 920, 4, 928, 4, 936, -4
SPAgshufflel:                                   ; SPA 0x68B: goalie side shuffle, left (goalieskateto)
                                                ; (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 944, 8, 640, -8
SPAgshuffler:                                   ; SPA 0x691: goalie side shuffle, right (goalieskateto)
                                                ; (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 952, 8, 640, -8
SPAgsavetoe:                                    ; SPA 0x697: goalie save slot 10: low toe save
                                                ; (GoalieSaveAnims) (confidence low)
        dw 0, 4                                 ; flags, pair count
        dw 784, 8, 792, 20, 1152, 7, 1160, -7
SPAgswing:                                      ; SPA 0x6A1: goalie swings at the puck to clear or pass it
                                                ; (ShootPuck, dopass) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 1024, 5, 1032, -16
SPAgsavekick:                                   ; SPA 0x6A7: goalie save slot 11 (GoalieSaveAnims; goaliesave
                                                ; plays sfx 10h for it) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 1040, -20
SPAgofallback:                                  ; SPA 0x6AB: goalie falls backward (GoalieSaveAnims slot 9)
                                                ; (confidence medium)
        dw 0, 4                                 ; flags, pair count
        dw 1048, 8, 1056, 30, 1152, 7, 1160, -7
SPAgwallleft:                                   ; SPA 0x6B5: goalie against the wall left (position 0 case of
                                                ; asspsclear, assbench) (confidence medium)
        dw 8, 8                                 ; flags, pair count
        dw 2168, 4, 2176, 4, 2184, 4, 2192, 4, 2200, 4, 2208, 4, 2216, 4, 2224, -4
SPAgwallright:                                  ; SPA 0x6C7: goalie against the wall right (asseben)
                                                ; (confidence medium)
        dw 18h, 8                               ; flags, pair count
        dw 2168, 4, 2176, 4, 2184, 4, 2192, 4, 2200, 4, 2208, 4, 2216, 4, 2224, -4
SPAgreadybob:                                   ; SPA 0x6D9: goalie ready stance, small bob (start of
                                                ; SPAgready) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 1064, 8, 1072, -12
SPAgready:                                      ; SPA 0x6DF: goalie ready: blinks between the held frame and
                                                ; the ready frames (confidence medium)
        dw 0, 11                                ; flags, pair count
        dw 640, 120, 1064, 8, 1072, 10, 1064, 8, 1072, 10, 640, 107, 1064, 8, 1072, 10
        dw 1064, 8, 1072, 10, 640, -10
SPAgidle:                                       ; SPA 0x6F7: goalie idle, looks around (goalieacc, fight;
                                                ; random alternative to SPAgready) (confidence low)
        dw 0, 10                                ; flags, pair count
        dw 640, 100, 1312, 10, 1320, 10, 1328, 10, 1336, 10, 1344, 10, 1352, 10, 1360, 10
        dw 1368, 10, 1312, 10, 640, -10
SPAstandwait:                                   ; SPA 0x70F: standing wait of 68 ticks, then skates off
                                                ; (assleavebox) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 8, -68
SPAstandwait2:                                  ; SPA 0x713: standing wait of 47 ticks (not set by an
                                                ; immediate) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 0, -47
SPAfaceoffwait:                                 ; SPA 0x717: faceoff stance wait of 53 ticks (assleavebox)
                                                ; (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 376, -53
SPAbenchidle1:                                  ; SPA 0x71B: bench sprite idle pose 1 (BenchSpriteAnims)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2296, -8
SPAbenchidle2:                                  ; SPA 0x71F: bench sprite idle pose 2 (BenchSpriteAnims)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2304, -8
SPAbenchidle3:                                  ; SPA 0x723: bench sprite idle pose 3 (BenchSpriteAnims)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2312, -8
SPAbenchreact:                                  ; SPA 0x727: bench sprite reacts (two frames; not in
                                                ; BenchSpriteAnims) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 2320, 10, 2328, -20
SPAbenchwatch1:                                 ; SPA 0x72D: bench sprite watches the play, long hold
                                                ; (AnimateBenchSprite adds a random wait) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 2344, -45
SPAbenchwatch2:                                 ; SPA 0x731: bench sprite watches the play, other pose
                                                ; (AnimateBenchSprite) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 2336, -45
SPAbenchlook:                                   ; SPA 0x735: bench sprite looks around, random wait after the
                                                ; second frame (AnimateBenchSprite) (confidence low)
        dw 0, 3                                 ; flags, pair count
        dw 2352, 10, 2360, 60, 2352, -8
SPAbenchcheer:                                  ; SPA 0x73D: bench sprite cheers, the frame times grow (not
                                                ; set by an immediate) (confidence low)
        dw 0, 9                                 ; flags, pair count
        dw 2368, 10, 2376, 12, 2368, 14, 2376, 15, 2368, 16, 2376, 17, 2368, 18, 2376, 20
        dw 2368, -8
SPArefskate:                                    ; SPA 0x751: referee skating (noturn0) (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 2384, 4, 2392, 4, 2400, 4, 2408, 4, 2416, 4, 2424, 4, 2432, 4, 2440, -4
SPArefglide:                                    ; SPA 0x763: referee glide (dostop, noturn0, every ref
                                                ; assignment)
        dw 0, 1                                 ; flags, pair count
        dw 2712, -4
SPArefstop:                                     ; SPA 0x767: referee stop (dostop)
        dw 0, 2                                 ; flags, pair count
        dw 2512, 8, 2520, -28
SPArefstophold:                                 ; SPA 0x76D: referee stop, held end frame (dostop switches to
                                                ; it when SPArefstop ends) (confidence medium)
        dw 1, 1                                 ; flags, pair count
        dw 2520, -16
SPAarmupskate:                                  ; SPA 0x771: referee skating, arm up (noturn0) (confidence
                                                ; medium)
        dw 0, 8                                 ; flags, pair count
        dw 2448, 4, 2456, 4, 2464, 4, 2472, 4, 2480, 4, 2488, 4, 2496, 4, 2504, -4
SPAarmupglide:                                  ; SPA 0x783: referee glide, arm up (dostop, noturn0)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2744, -4
SPAarmupstop:                                   ; SPA 0x787: referee stop, arm up (dostop when the ref
                                                ; signals) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 2528, 8, 2536, -28
SPAarmupstophold:                               ; SPA 0x78D: referee stop, arm up, held end frame (confidence
                                                ; medium)
        dw 1, 1                                 ; flags, pair count
        dw 2536, -18
SPArefpickup:                                   ; SPA 0x791: referee picks up the puck (assrefpenshot,
                                                ; assrefgoalpa)
        dw 0, 5                                 ; flags, pair count
        dw 2712, 8, 2568, 8, 2576, 12, 2568, 6, 2712, -6
SPArefdrop:                                     ; SPA 0x79D: referee drops the puck (puckfaceoff2) (confidence
                                                ; medium)
        dw 0, 4                                 ; flags, pair count
        dw 2544, 8, 2552, 8, 2544, 8, 2560, -8
SPAreffowait:                                   ; SPA 0x7A7: referee waits at the faceoff dot (assrefatdot,
                                                ; puckfaceoff2) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2544, -8
SPArefturnl:                                    ; SPA 0x7AB: referee turning left, single frame (doplayeracc)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2592, -8
SPAarmupturnl:                                  ; SPA 0x7AF: warm-up referee turning left, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2624, -8
SPArefturnlin:                                  ; SPA 0x7B3: referee turning left, start of the turn
                                                ; (doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 2584, 8, 2592, -8
SPAarmupturnlin:                                ; SPA 0x7B9: warm-up referee turning left, start of the turn
                                                ; (doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 2616, 8, 2624, -8
SPArefturnr:                                    ; SPA 0x7BF: referee turning right, single frame (doplayeracc)
                                                ; (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2608, -8
SPAarmupturnr:                                  ; SPA 0x7C3: warm-up referee turning right, single frame
                                                ; (doplayeracc) (confidence medium)
        dw 0, 1                                 ; flags, pair count
        dw 2640, -8
SPArefturnrin:                                  ; SPA 0x7C7: referee turning right, start of the turn
                                                ; (doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 2600, 8, 2608, -8
SPAarmupturnrin:                                ; SPA 0x7CD: warm-up referee turning right, start of the turn
                                                ; (doplayeracc) (confidence medium)
        dw 0, 2                                 ; flags, pair count
        dw 2632, 8, 2640, -8
SPAreffallback:                                 ; SPA 0x7D3: referee falls back (FallDown) (confidence medium)
        dw 20h, 8                               ; flags, pair count
        dw 2648, 5, 2656, 5, 2664, 5, 2672, 5, 2680, 5, 2688, 40, 2752, 8, 2760, -8
SPApuckdrop:                                    ; SPA 0x7E5: puck sprite dropped by the referee (faceoff,
                                                ; penalty shot start) (confidence medium)
        dw 0, 3                                 ; flags, pair count
        dw 2696, 8, 2704, 20, 2696, -8
SPArefpointgoa:                                 ; SPA 0x7ED: referee points to the goal (assrefwhistle)
                                                ; (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 2720, 6, 2728, 6, 2736, 24, 2720, 4, 2712, -5
SPArefpointgoallong:                            ; SPA 0x7F9: referee points at the goal and holds the pose 485
                                                ; ticks (assrefgoalline) (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 2720, 6, 2728, 6, 2736, 24, 2720, 4, 2712, -485
SPArefpointgoalshort:                           ; SPA 0x805: referee points at the goal and holds the pose 285
                                                ; ticks (assrefgoalline) (confidence medium)
        dw 0, 5                                 ; flags, pair count
        dw 2720, 6, 2728, 6, 2736, 24, 2720, 4, 2712, -285
SPArefrough:                                    ; SPA 0x811: referee signals roughing (assrefsignal RefPen
                                                ; call) (confidence medium)
        dw 2, 4                                 ; flags, pair count
        dw 2716, 8, 2817, 9, 2818, 24, 2716, -8
SPArefcharge:                                   ; SPA 0x81B: referee signals charging (assrefsignal)
                                                ; (confidence medium)
        dw 2, 10                                ; flags, pair count
        dw 2716, 8, 2802, 8, 2803, 8, 2804, 8, 2805, 8, 2802, 8, 2803, 8, 2804, 8
        dw 2805, 8, 2716, -8
SPArefslash:                                    ; SPA 0x831: referee signals slashing (assrefsignal)
                                                ; (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2715, 8, 2819, 8, 2820, 8, 2821, 16, 2819, 7, 2715, -8
SPArefxcheck:                                   ; SPA 0x83F: referee signals cross checking (assrefsignal)
                                                ; (confidence medium)
        dw 2, 5                                 ; flags, pair count
        dw 2715, 8, 2822, 10, 2823, 24, 2822, 6, 2715, -8
SPArefhook:                                     ; SPA 0x84B: referee signals hooking (assrefsignal)
                                                ; (confidence medium)
        dw 2, 5                                 ; flags, pair count
        dw 2715, 8, 2809, 10, 2810, 10, 2809, 24, 2715, -8
SPAreftrip:                                     ; SPA 0x857: referee signals tripping (assrefsignal)
                                                ; (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2716, 8, 2824, 10, 2825, 10, 2826, 16, 2824, 7, 2716, -8
SPArefhold:                                     ; SPA 0x865: referee signals holding (assrefsignal)
                                                ; (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2715, 8, 2811, 10, 2812, 10, 2813, 36, 2811, 6, 2715, -8
SPArefbehind:                                   ; SPA 0x873: referee signals a call from behind (assrefsignal)
                                                ; (confidence medium)
        dw 2, 5                                 ; flags, pair count
        dw 2716, 8, 2800, 10, 2801, 24, 2800, 6, 2716, -8
SPArefpenshot:                                  ; SPA 0x87F: referee signals a penalty shot (assrefsignal)
                                                ; (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2716, 8, 2724, 6, 2732, 6, 2740, 24, 2724, 4, 2716, -5
SPArefelbow:                                    ; SPA 0x88D: referee signals elbowing (assrefsignal)
                                                ; (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2715, 8, 2806, 8, 2807, 8, 2808, 24, 2806, 6, 2715, -8
SPArefelbow2:                                   ; SPA 0x89B: referee signals elbowing, second signal
                                                ; (assrefsignal) (confidence medium)
        dw 2, 6                                 ; flags, pair count
        dw 2715, 8, 2814, 8, 2815, 8, 2816, 24, 2814, 6, 2715, -8
SPArefinterfer:                                 ; SPA 0x8A9: referee signals interference (assrefsignal)
                                                ; (confidence medium)
        dw 2, 5                                 ; flags, pair count
        dw 2715, 8, 2827, 10, 2828, 24, 2827, 6, 2715, -8
SPArefsignalend:                                ; SPA 0x8B5: referee signal at the end of the table, slot 31
                                                ; (assrefsignal) (confidence low)
        dw 2, 5                                 ; flags, pair count
        dw 2716, 8, 2700, 10, 2708, 24, 2700, 6, 2716, -8
SPAbrcup:                                       ; SPA 0x8C1: bench-side close-up player, first pose
                                                ; (assbenchside) (confidence medium)
        dw 2, 1                                 ; flags, pair count
        dw 3145, -8
SPAclap:                                        ; SPA 0x8C5: bench-side close-up player claps (assbenchside)
                                                ; (confidence medium)
        dw 2, 8                                 ; flags, pair count
        dw 3137, 6, 3138, 6, 3139, 6, 3140, 6, 3141, 6, 3142, 6, 3143, 6, 3144, -6
SPAboxdooropen:                                 ; SPA 0x8D7: penalty box door opens (assboxenter) (confidence
                                                ; medium)
        dw 2, 12                                ; flags, pair count
        dw 3145, 6, 3146, 6, 3147, 6, 3148, 6, 3149, 6, 3150, 6, 3151, 6, 3152, 6
        dw 3153, 6, 3154, 6, 3155, 6, 3156, -6
SPAgvcup:                                       ; SPA 0x8F1: penalty box door closes behind the player
                                                ; (assboxenter) (confidence medium)
        dw 2, 9                                 ; flags, pair count
        dw 3157, 6, 3158, 6, 3159, 6, 3160, 6, 3161, 6, 3162, 6, 3163, 6, 3164, 6
        dw 3165, -6
SPAbenchstand:                                  ; SPA 0x905: bench-side player stands at the end of the scene
                                                ; (assbenchside) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3167, -8
SPAstansk:                                      ; SPA 0x909: skating with the Stanley cup (assstanley)
                                                ; (confidence medium)
        dw 0, 8                                 ; flags, pair count
        dw 3568, 8, 3576, 8, 3584, 8, 3592, 8, 3600, 8, 3608, 8, 3616, 8, 3624, -8
SPAstanley:                                     ; SPA 0x91B: lifting the Stanley cup (assstanley) (confidence
                                                ; medium)
        dw 0, 4                                 ; flags, pair count
        dw 3632, 12, 3640, 12, 3648, 12, 3656, -12
SPAcupwaitl:                                    ; SPA 0x925: cup ceremony wait, left (assboxenter,
                                                ; asscupfollow) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3175, -8
SPAcupwaitr:                                    ; SPA 0x929: cup ceremony wait, right (asscupfollow)
                                                ; (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3183, -8
SPAcupskate:                                    ; SPA 0x92D: skating with the cup behind the carrier
                                                ; (asscupfollow) (confidence low)
        dw 0, 8                                 ; flags, pair count
        dw 3191, 8, 3199, 8, 3207, 8, 3215, 8, 3223, 8, 3231, 8, 3239, 8, 3247, -8
SPAcupturn:                                     ; SPA 0x93F: turning with the cup (asscupfollow) (confidence
                                                ; low)
        dw 0, 9                                 ; flags, pair count
        dw 3255, 4, 3263, 4, 3271, 4, 3279, 4, 3287, 4, 3295, 4, 3303, 4, 3311, 4
        dw 3319, -4
SPAcupturnend:                                  ; SPA 0x953: end of the turn with the cup (asscupfollow)
                                                ; (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 3311, 8, 3319, -8
SPAcupturnhold:                                 ; SPA 0x959: held pose after the turn with the cup
                                                ; (asscupfollow) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3319, -8
SPAcuptake:                                     ; SPA 0x95D: taking the cup (asscuptake, asscupfollow)
                                                ; (confidence medium)
        dw 0, 9                                 ; flags, pair count
        dw 3463, 4, 3471, 4, 3479, 4, 3487, 4, 3495, 4, 3503, 4, 3511, 4, 3519, 4
        dw 3527, -4
SPAcupfollow:                                   ; SPA 0x971: skating after the cup carrier (asscupfollow)
                                                ; (confidence low)
        dw 0, 8                                 ; flags, pair count
        dw 3327, 8, 3335, 8, 3343, 8, 3351, 8, 3359, 8, 3367, 8, 3375, 8, 3383, -8
SPAcupidle:                                     ; SPA 0x983: standing, waiting for the cup (asscupfollow,
                                                ; asscuptake) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3455, -8
SPAcupstand:                                    ; SPA 0x987: standing with the cup (assstanley, asscuptake)
                                                ; (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3672, -8
SPAcupraise:                                    ; SPA 0x98B: raising the cup (assstanley) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 3664, 12, 3672, -12
SPAgetcup:                                      ; SPA 0x991: player gets into the penalty box (assboxenter)
                                                ; (confidence medium)
        dw 2, 9                                 ; flags, pair count
        dw 3559, 8, 3560, 8, 3561, 8, 3562, 8, 3563, 8, 3564, 8, 3565, 8, 3566, 8
        dw 3567, -28
SPAboxenter:                                    ; SPA 0x9A5: player steps into the penalty box (assboxenter)
                                                ; (confidence low)
        dw 2, 8                                 ; flags, pair count
        dw 3551, 30, 3552, 6, 3553, 6, 3554, 6, 3555, 6, 3556, 6, 3557, 6, 3558, -16
SPAcuptakeend:                                  ; SPA 0x9B7: end of taking the cup (asscuptake) (confidence
                                                ; low)
        dw 0, 9                                 ; flags, pair count
        dw 3527, 4, 3519, 4, 3511, 4, 3503, 4, 3495, 4, 3487, 4, 3479, 4, 3471, 4
        dw 3463, -4
SPAcupheld:                                     ; SPA 0x9CB: holding the cup, two frames (not set by an
                                                ; immediate) (confidence low)
        dw 0, 2                                 ; flags, pair count
        dw 3543, 12, 3535, -12
SPAcupheld2:                                    ; SPA 0x9D1: holding the cup, three frames (not set by an
                                                ; immediate) (confidence low)
        dw 0, 3                                 ; flags, pair count
        dw 3535, 12, 3543, 12, 3455, -12
SPAcupfollow2:                                  ; SPA 0x9D9: skating after the cup carrier, other direction
                                                ; (asscupfollow) (confidence low)
        dw 0, 8                                 ; flags, pair count
        dw 3391, 8, 3399, 8, 3407, 8, 3415, 8, 3423, 8, 3431, 8, 3439, 8, 3447, -8
SPAcupfollowhold:                               ; SPA 0x9EB: held pose at the end of the cup follow skate
                                                ; (asscupfollow) (confidence low)
        dw 0, 1                                 ; flags, pair count
        dw 3391, -8
SPApflip:                                       ; SPA 0x9EF: puck flip (puckflip)
        dw 1, 1                                 ; flags, pair count
        dw 3803
        db -4                                   ; low byte of the final time; its high byte is
                                                ; LinePickOrderFrom1
LinePickOrderFrom1:                             ; same code as in the next game; used by releasepl
        db 0FFh
