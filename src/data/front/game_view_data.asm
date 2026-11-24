; Initialised data of front/game_view (src/front/game_view).
bits 32
%include "hockey.inc"
section s_11B238 progbits alloc noexec write align=1
extern str_C6, str_feD, str_G5, str_L, str_R5, str_X2
global ClockPanelState, ScorePanelState, TimeLeftPanelState, TimedPanelState, RinkSpriteMode, GameFrameShapes, ViewDimmed, SavedViewMode
global ovlstep, RosterNumberShapes, SpinPuckFrame, GoalNetShapeIds, GoalReplayPending, OverlayPanelQueue, PanelOpenTime, PanelCloseTime
global TimedPanelTimer, PlayerPctPanelTimer, ClockPanelTimer, TimeLeftPanelTimer, ScorePanelTimer, PlayerNamePanelTimer, LineBoxStates, LastEventPlayer
ClockPanelState:                                ; Clock panel state, -1 when closed; used by DrawClockPanel,
                                                ; DrawEventPanel, DrawGoalEventPanel ...
        db 0FFh,0FFh,0FFh,0FFh
ScorePanelState:                                ; Score panel state (1F40h after a goal); used by
                                                ; DrawClockPanel, DrawEventPanel, DrawGoalEventPanel ...
        db 0FFh,0FFh,0FFh,0FFh
TimeLeftPanelState:                             ; Time left panel state; used by DrawTimeLeftPanel,
                                                ; ResetGameOverlays
        db 0FFh,0FFh,0FFh,0FFh
TimedPanelState:                                ; Timed panel state; used by DrawTimedPanel, ReadHotKeys,
                                                ; UpdateCamera
        db 0FFh,0FFh,0FFh,0FFh
RinkSpriteMode:                                 ; Rink sprite drawing mode; used by DrawRinkSprite,
                                                ; InitGameView
        db 00h,00h,00h,00h
GameFrameShapes:                                ; Game frame shape ids; used by DrawGameFrame
        db 0F7h,0Eh,00h,00h,0F8h,0Eh,00h,00h,0F9h,0Eh,00h,00h,0FAh,0Eh,00h,00h
        db 0FBh,0Eh,00h,00h,0FAh,0Eh,00h,00h,0F9h,0Eh,00h,00h,0F8h,0Eh,00h,00h
        db 0F6h,0Eh,00h,00h
ViewDimmed:                                     ; Game view dimmed; used by DimGameView
        db 00h,00h,00h,00h
SavedViewMode:                                  ; Game view mode saved with the game state; used by
                                                ; InitGameView, LoadGameState
        db 0FFh,0FFh
ovlstep:                                        ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 0FFh,0FFh
RosterNumberShapes:                             ; Roster number shape names; used by DrawRosterNumber
        dd str_G5
        dd str_feD
        dd str_feD
        dd str_L
        dd str_C6
        dd str_R5
        dd str_X2
SpinPuckFrame:                                  ; Spinning puck frame; used by EndReplay, SortSpritesForDraw,
                                                ; SpinPuckModel
        db 00h,00h,00h,00h
GoalNetShapeIds:                                ; Goal net shape ids; used by PlaceGoalNets
        db 061h,0Bh,00h,00h,062h,0Bh,00h,00h,05Fh,0Bh,00h,00h,060h,0Bh,00h,00h
GoalReplayPending:                              ; Goal replay pending; used by DrawGameFrame, puckfaceoff2
        db 00h,00h,00h,00h
OverlayPanelQueue:                              ; queued overlay panels; used by DrawGameOverlays,
                                                ; QueueOverlayPanel, ResetGameOverlays
        db 0FFh,0FFh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,0FFh,0FFh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,0FFh,0FFh,0FFh,0FFh,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
PanelOpenTime:                                  ; Overlay panel open time; used by DrawClockPanel,
                                                ; DrawEventPanel, DrawGoalEventPanel ...
        db 00h,00h,00h,00h
PanelCloseTime:                                 ; Overlay panel close time; used by OpenOverlayPanel
        db 0FFh,0FFh,0FFh,0FFh
TimedPanelTimer:                                ; Timed panel timer; used by DrawTimedPanel
        db 0FFh,0FFh,0FFh,0FFh
PlayerPctPanelTimer:                            ; Player percentage panel timer; used by DrawPlayerPctPanel
        db 0FFh,0FFh,0FFh,0FFh
ClockPanelTimer:                                ; Clock panel timer; used by DrawClockPanel
        db 0FFh,0FFh,0FFh,0FFh
TimeLeftPanelTimer:                             ; Time left panel timer; used by DrawTimeLeftPanel
        db 0FFh,0FFh,0FFh,0FFh
ScorePanelTimer:                                ; Score panel timer; used by DrawScorePanel
        db 0FFh,0FFh,0FFh,0FFh
PlayerNamePanelTimer:                           ; Player name panel timer; used by DrawPlayerNamePanel
        db 0FFh,0FFh,0FFh,0FFh
LineBoxStates:                                  ; Line change box states; used by DrawLineChangeBox
        db 00h,00h,00h,00h,00h,00h,00h,00h
LastEventPlayer:                                ; Last event player, -1 for none; used by BuildEventLines,
                                                ; DrawPenaltyEventPanel, InProgress ...
        db 0FFh,0FFh,0FFh,0FFh
