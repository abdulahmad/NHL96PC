; BSS of front/game_view (src/front/game_view).
bits 32
%include "hockey.inc"
section s_17828C nobits alloc noexec write align=1
global PalUsedFlags


global OverlayPanelId, OverlayQueueLen, OverlayQueue, GameViewPanelIds
global ShadeMatchFrom1, ShadeMatch, ShadeLutPtrs, LineBoxOpen, LineBoxShown
global LineBoxChoice, LineBoxTimer, LineBoxBmps, LineEnergyBmps, ViewScrollX, ViewScrollY, SpriteScreenX, SpriteScreenY
global OverlayPanelOn, EventPanelLines, ClockDrawnTime, ClockDrawnPeriod, ClockBmp, ViewDirty, RubberFaceBmp, RubberSideBmp
global ViewBrightness, IceLogoBmp, ShadeLutCount, ShadeLutBlock, PanelBaseY, PenaltyClockWidth, GameViewBlock, ClockFont
global LineBoxDrawn, GoalFrameCount, ClockPanelBmp, NameFont, NamePanelBmp, OverlayBmp, LineBoxBmp, PanelWidth
global PanelHeight, ViewObjects, ShowShadows, ShowMarkers, SpriteDepth, SpriteFrameIds, ZoneRectCount, ZoneRectIndex
global ZoneRectList, HomeSpriteShades, AwaySpriteShades, RefSpriteShades, PuckModelPoints, DrawList, DrawListCount, ZoneRects
GameViewPanelIds:                               ; Game view: cached panel ids, -1 when not drawn; used by
                                                ; DrawPlayerPctPanel, InitGameView
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
HomeSpriteShades:                               ; Game view: home team sprite shade table; used by
                                                ; DrawPlayerSprite, InitGameView
        resb 1024
AwaySpriteShades:                               ; Game view: away team sprite shade table; used by
                                                ; DrawPlayerSprite, InitGameView
        resb 1024
RefSpriteShades:                                ; Game view: referee and goalie sprite shade table; used by
                                                ; DrawPlayerSprite, InitGameView
        resb 1020
ShadeMatchFrom1:                                ; used by BuildShadeMatch
        resb 4
ShadeMatch:                                     ; used by BuildShadeLut, BuildShadeMatch
        resb 1024
ShadeLutPtrs:                                   ; Shade lookup table pointers; used by AllocShadeLut,
                                                ; BuildShadeMatch, InitGameView
        resb 1024
PalUsedFlags:                                   ; Palette entries used by the game view sprites (InitGameView
                                                ; marks them)
        resb 19
        resb 1
        resb 28
        resb 36
        resb 1
        resb 9
        resb 1
        resb 2
        resb 5
        resb 1
        resb 2
        resb 6
        resb 1
        resb 6
        resb 1
        resb 10
        resb 6
        resb 16
        resb 8
        resb 14
        resb 1
        resb 9
        resb 1
        resb 72
LineBoxOpen:                                    ; Line change box open, per team; used by DrawLineChangeBox,
                                                ; InitGameView
        resb 4
LineBoxShown:                                   ; line change box shown last (-1 for none); used by
                                                ; InitGameView
        resb 4
LineBoxChoice:                                  ; Line change box choice, per team; used by CompLine,
                                                ; DrawLineChangeBox, InitGameView ...
        resb 4
LineBoxTimer:                                   ; line change box display timer; used by InitGameView
        resb 4
LineBoxBmps:                                    ; Line change box bitmaps; used by DrawLineChangeBox,
                                                ; DrawLineChangeBoxes, DrawLineEnergyBar
        resb 32
LineEnergyBmps:                                 ; Line change energy bar bitmaps; used by DrawLineChangeBox,
                                                ; DrawLineChangeBoxes, DrawLineEnergyBar
        resb 24
ViewScrollX:                                    ; Game view scroll x (16.16); used by DrawGameFrame,
                                                ; DrawReplayView
        resb 4
ViewScrollY:                                    ; Game view scroll y (16.16); used by DrawGameFrame,
                                                ; DrawReplayView
        resb 4
SpriteScreenX:                                  ; Sprite screen x, 8 bytes per sprite; used by
                                                ; DrawControlMarker, DrawGameFrame, DrawPlayerShadows ...
        resb 4
SpriteScreenY:                                  ; Sprite screen y, 8 bytes per sprite; used by
                                                ; DrawControlMarker, DrawGameFrame, DrawPlayerShadows ...
        resb 164
OverlayPanelId:                                 ; Overlay panel being shown; used by DrawEventPanel,
                                                ; DrawGameClock, DrawGoalEventPanel ...
        resb 4
OverlayPanelOn:                                 ; Overlay panel open; used by DrawClockPanel, DrawEventPanel,
                                                ; DrawGoalEventPanel ...
        resb 4
EventPanelLines:                                ; Event panel text lines; used by BuildEventLines,
                                                ; DrawEventPanel, DrawGoalEventPanel ...
        resb 4
ClockDrawnTime:                                 ; Game clock: time last drawn; used by DrawGameClock,
                                                ; DrawGameFrame
        resb 4
ClockDrawnPeriod:                               ; Game clock: period last drawn; used by DrawGameClock,
                                                ; DrawGameFrame
        resb 4
ClockBmp:                                       ; Game clock bitmap; used by DrawClockPanel, DrawGameClock,
                                                ; DrawGameFrame ...
        resb 4
ViewDirty:                                      ; Game view needs a full redraw; used by CopyZonesToScreen,
                                                ; DrawDirtyZones, DrawGameFrame ...
        resb 4
PuckModelPoints:                                ; Spinning puck model points; used by SpinPuckModel
        resb 36
RubberFaceBmp:                                  ; Puck face bitmap; used by FreeGameView, InitGameView,
                                                ; RubberFace
        resb 4
RubberSideBmp:                                  ; Puck side bitmap; used by FreeGameView, InitGameView,
                                                ; RubberSideFace
        resb 4
ViewBrightness:                                 ; Game view brightness (4000h full); used by CamShotDimPath,
                                                ; DimGameView, InitGameView
        resb 4
IceLogoBmp:                                     ; Centre ice logo bitmap; used by FreeGameView, LoadIceLogo
        resb 4
ShadeLutCount:                                  ; Shade lookup tables in use; used by AllocShadeLut,
                                                ; BuildShadeLut, BuildShadeMatch
        resb 4
ShadeLutBlock:                                  ; Shade lookup table memory block; used by AllocShadeLut,
                                                ; BuildShadeLut, FreeGameView ...
        resb 4
PanelBaseY:                                     ; Overlay panel base y; used by DrawEventPanel,
                                                ; DrawGoalEventPanel, DrawLineChangeBox ...
        resb 4
PenaltyClockWidth:                              ; Penalty clock panel width; used by DrawPenaltyClock,
                                                ; InitGameView
        resb 4
GameViewBlock:                                  ; Game view memory block; used by FreeGameView, InitGameView
        resb 4
ClockFont:                                      ; Game clock font; used by DrawGameClock, DrawPenaltyClock,
                                                ; DrawReplayClock ...
        resb 4
LineBoxDrawn:                                   ; Line change box drawn; used by DrawLineChangeBox,
                                                ; DrawLineChangeBoxes
        resb 4
GoalFrameCount:                                 ; Frames since the goal; used by DrawGameFrame, Goal
        resb 4
ClockPanelBmp:                                  ; Clock panel bitmap; used by DrawGameClock, DrawPenaltyClock,
                                                ; DrawReplayClock ...
        resb 4
NameFont:                                       ; Overlay name font; used by DrawEventPanel,
                                                ; DrawGoalEventPanel, DrawInGameMenuFrame ...
        resb 8
NamePanelBmp:                                   ; Overlay name panel bitmap; used by DrawEventPanel,
                                                ; DrawGoalEventPanel, DrawInGameMenuFrame ...
        resb 4
OverlayBmp:                                     ; Overlay panel bitmap; used by DrawOverlayPanels,
                                                ; FreeGameView, InitGameView
        resb 4
LineBoxBmp:                                     ; Line change box bitmap; used by DrawLineChangeBox,
                                                ; DrawLineChangeBoxes
        resb 4
PanelWidth:                                     ; Overlay panel width; used by DrawOverlayCaption,
                                                ; DrawScorePanel, DrawTimedPanel ...
        resb 4
PanelHeight:                                    ; Overlay panel height; used by InitGameView
        resb 4
ViewObjects:                                    ; Game view object list; used by DrawGameFrame, DrawReplayView
        resb 68
ShowShadows:                                    ; Player shadows on; used by DrawReplayObjects, InitGameView,
                                                ; PlaceGoalNets ...
        resb 4
ShowMarkers:                                    ; Player markers on; used by DrawBenchPlayers, DrawGameFrame,
                                                ; DrawPenaltyBoxPlayers ...
        resb 4
DrawList:                                       ; Game view draw list; used by DrawGameFrame, DrawReplayView
        resb 252
SpriteDepth:                                    ; Sprite depth per object; used by DrawGameFrame,
                                                ; DrawPlayerShadows, DrawPlayers ...
        resb 68
DrawListCount:                                  ; Draw list counts; used by DrawGameFrame, DrawReplayView
        resb 8
SpriteFrameIds:                                 ; Sprite frame per object; used by DrawControlMarker,
                                                ; DrawGameFrame, DrawPlayerMarkers ...
        resb 244
ZoneRects:                                      ; Game frame: dirty zone rectangles; used by DrawGameFrame
        resb 204
ZoneRectCount:                                  ; Game frame: dirty zone rectangle count; used by
                                                ; DrawGameFrame
        resb 4
ZoneRectIndex:                                  ; Game frame: dirty zone index; used by DrawGameFrame
        resb 4
ZoneRectList:                                   ; Game frame: dirty zone list; used by DrawGameFrame
        resb 40
OverlayQueueLen:                                ; Overlay panel queue length; used by OpenOverlayPanel,
                                                ; ResetGameOverlays
        resb 1
OverlayQueue:                                   ; Overlay panel queue; used by OpenOverlayPanel,
                                                ; ResetGameOverlays
        resb 3
