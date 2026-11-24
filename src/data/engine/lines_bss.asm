; BSS of engine/lines (src/engine/lines).
bits 32
%include "hockey.inc"
section s_176CA8 nobits alloc noexec write align=1
global offsort_c, defsort_r, offsort_d, defsort_c, defsort_d, offsort_l, dressflags, dressflags_aw
global offsort_fwd, defsort_l, offsort_r, defsort_fwd, dressedfwds, dresseddefs, dressedskaters, AttractGameOpts
global AttractOptTeams, AttractOptTeamsHi, AttractOptPads, AttractOptPadFlags, SpriteSortDelay, ReplayFrameState, ZoneBufFront, ZoneBufBack
global ZoneBufCount, ZoneMarksFront, ZoneMarksBack, ZonePrevList, ZonePrevCount, ZoneCurList, ZoneWorkBuf, ZoneCurCount
global ZoneCapacity, ZoneMemBlock, DrawFrameCount
offsort_c:                                      ; Centres sorted by offensive rating (25 per team); used by
                                                ; BuildDefaultLines, PickForLineSlot
        resb 50
defsort_r:                                      ; Right wings sorted by defensive rating (25 per team); used
                                                ; by BuildDefaultLines, PickForLineSlot
        resb 50
offsort_d:                                      ; Defencemen sorted by offensive rating (25 per team); used by
                                                ; BuildDefaultLines, PickForLineSlot, SetPlList
        resb 50
defsort_c:                                      ; Centres sorted by defensive rating (25 per team); used by
                                                ; BuildDefaultLines, PickForLineSlot
        resb 50
defsort_d:                                      ; used by BuildDefaultLines, CanRemovePlayer, PickForLineSlot
                                                ; ...
        resb 50
offsort_l:                                      ; Left wings sorted by offensive rating (25 per team); used by
                                                ; BuildDefaultLines, PickForLineSlot
        resb 50
dressflags:                                     ; used by BuildDefaultLines, CanFillLineSlot, FillDressedSlots
                                                ; ...
        resb 25
dressflags_aw:                                  ; Away dressed flags, one byte per roster player; used by
                                                ; NormalizeDressFlags
        resb 25
offsort_fwd:                                    ; used by BuildDefaultLines, CanRemovePlayer, PickExtraSkater
                                                ; ...
        resb 50
defsort_l:                                      ; Left wings sorted by defensive rating (25 per team); used by
                                                ; BuildDefaultLines, PickForLineSlot
        resb 50
offsort_r:                                      ; Right wings sorted by offensive rating (25 per team); used
                                                ; by BuildDefaultLines, PickForLineSlot
        resb 50
defsort_fwd:                                    ; Forwards for the defence pairs, sorted by defensive rating
                                                ; (25 per team); used by BuildDefaultLines, PickForLineSlot,
                                                ; SetPlList
        resb 50
dressedfwds:                                    ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 2
dresseddefs:                                    ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 2
dressedskaters:                                 ; used by FillDressedSlots, SetupTeamLines
        resb 2
AttractGameOpts:                                ; Game options block used by the attract mode game (gameopts
                                                ; points here)
        resb 1
AttractOptTeams:                                ; Attract mode options: home and away team bits; used by
                                                ; RunAttractMode
        resb 2
AttractOptTeamsHi:                              ; Attract mode options: high byte of the team bits; used by
                                                ; RunAttractMode
        resb 2
AttractOptPads:                                 ; Attract mode options: controller per player (cleared); used
                                                ; by RunAttractMode
        resb 2
AttractOptPadFlags:                             ; Attract mode options: per-player flags (set to 1); used by
                                                ; RunAttractMode
        resb 181
SpriteSortDelay:                                ; Frames before the next full sprite sort (ResetPeriodState
                                                ; sets 2); used by ResetPeriodState, SortSpritesForDraw
        resb 4



global ReplayObjX, ReplayObjY
global ReplayObjZ, ReplayObjFrame, ReplayObjAttr

ReplayFrameState:                               ; replay frame state being decoded; used by CameraLeadOffset,
                                                ; CameraTrackPuck, DrawControlMarker ...
        resb 1
        resb 1
        resb 17
        resb 17
ReplayObjX:                                     ; replay object x positions; used by CameraTrackPuck,
                                                ; DrawReplayView, DrawRinkPlayers ...
        resb 28
        resb 6
ReplayObjY:                                     ; replay object y positions; used by CameraTrackPuck,
                                                ; DrawReplayView, DrawRinkPlayers ...
        resb 28
        resb 4
        resb 2
ReplayObjZ:                                     ; replay object heights; used by DrawReplayObjects,
                                                ; DrawReplayPlayers, DrawReplayShadows ...
        resb 34
        resb 16
        resb 1
        resb 11
        resb 1
        resb 15
        resb 2
ReplayObjFrame:                                 ; replay object frames; used by DrawReplayObjects,
                                                ; DrawReplayPlayers, DrawReplayShadows ...
        resb 32
        resb 2
ReplayObjAttr:                                  ; replay object attributes; used by DrawReplayObjects,
                                                ; DrawReplayPlayers, DrawReplayShadows ...
        resb 33
        resb 1
        resb 12
        resb 2
        resb 4
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 2
        resb 2
        resb 2
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 1
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 2
        resb 2
        resb 1
ZoneBufFront:                                   ; Zone manager: front list of changed screen rectangles; used
                                                ; by CopyZonesToScreen, InitZoneManager
        resb 4
ZoneBufBack:                                    ; Zone manager: back list of changed screen rectangles; used
                                                ; by CopyZonesToScreen, InitZoneManager
        resb 4
ZoneBufCount:                                   ; Zone manager: rectangles in the front list; used by
                                                ; CopyZonesToScreen, InitZoneManager
        resb 4
ZoneMarksFront:                                 ; Zone manager: front mark list; used by CopyZonesToScreen,
                                                ; InitZoneManager
        resb 4
ZoneMarksBack:                                  ; Zone manager: back mark list; used by CopyZonesToScreen,
                                                ; InitZoneManager
        resb 4
ZonePrevList:                                   ; Zone manager: previous frame's zone list; used by
                                                ; AddZonePiece, ClipPreviousZones, CopyZonesToScreen ...
        resb 4
ZonePrevCount:                                  ; Zone manager: zones in the previous frame's list; used by
                                                ; AddZonePiece, ClipPreviousZones, CopyZonesToScreen ...
        resb 4
ZoneCurList:                                    ; Zone manager: current frame's zone list; used by AddZone,
                                                ; AddZonePiece, ClipCurrentZones ...
        resb 4
ZoneWorkBuf:                                    ; Zone manager: work buffer; used by InitZoneManager,
                                                ; ResolveZones
        resb 4
ZoneCurCount:                                   ; Zone manager: zones in the current frame's list; used by
                                                ; AddZone, AddZonePiece, ClipCurrentZones ...
        resb 4
ZoneCapacity:                                   ; Zone manager: zones each list can hold; used by AddZone,
                                                ; AddZonePiece, ClipCurrentZones ...
        resb 4
ZoneMemBlock:                                   ; Zone manager: the allocated block holding all lists; used by
                                                ; FreeZoneManager, InitZoneManager
        resb 4
DrawFrameCount:                                 ; Frames drawn (the draw routines count it up); used by
                                                ; CopyZonesToScreen, DrawEventPanel, DrawGameClock ...
        resb 4
