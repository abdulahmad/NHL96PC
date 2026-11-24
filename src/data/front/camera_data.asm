; Initialised data of front/camera (src/front/camera).
bits 32
%include "hockey.inc"
section s_11B314 progbits alloc noexec write align=1
extern BottomBarDef, CamShotDimPath, CamShotFollowPath, CamShotNetShake, CamShotOnTarget, CamShotOrbitFrom, CamShotOrbitNear, CamShotOrbitTo
extern CamShotOverlayPanel, CamShotPuckChase, CamShotPuckMid, CamShotPuckNear, CamShotReferee, CamShotTargetTurn, CreditsText, EaCamView
extern FightSpritesLoaded, GameSpriteNames, GraphicsFixOn, HeadCamView, JerseyDigitWidths, LastPaletteMode, MenuClipActive, MenuInputPaused
extern MenuInputReady, MenuLinkActive, MenuMouseButtons, MenuMouseX, MenuMouseY, MenuMoveSfx, MenuSelectSfx, MenuViewStored
extern ModeLinear, NearestColorCount, NearestColorLimit, NhlCamOneView, NhlCamTwoView, PlayerSpritesLoaded, PressCamFourView, PressCamOneView
extern PressCamThreeView, PressCamTwoView, SideBarDef, SkyCamOneView, SkyCamTwoView, SlideEventFuncs, SlideEvents, SpriteCacheMem
extern SpriteCacheOn, SpriteFileHandles, SpriteMemBlock, SpritesLoaded, StartupPalette, TeamNameArt, textcolor, textshadow
extern TitleBarDef, WaitBoxArt, ZoneCamView
global ViewTop, ViewWidth, ViewHeight, ViewLeft, GameFrameTop, ViewBitmap, ViewPixels, ViewSizeStep
global CameraShotOn
ViewTop:                                        ; Game view top; used by ReadHotKeys, SetCameraShot,
                                                ; SetGameViewSize ...
        db 018h,00h,00h,00h
ViewWidth:                                      ; Game view width; used by DrawControlMarker, DrawGameFrame,
                                                ; DrawReplayView ...
        db 040h,01h,00h,00h
ViewHeight:                                     ; Game view height; used by DrawControlMarker, DrawGameFrame,
                                                ; DrawReplayView ...
        db 0C8h,00h,00h,00h
ViewLeft:                                       ; Game view left; used by DrawControlMarker, DrawEventPanel,
                                                ; DrawGameFrame ...
        db 0A0h,00h,00h,00h
GameFrameTop:                                   ; top of the game frame; used by DrawGameFrame, InitGameView,
                                                ; PauseGame ...
        db 064h,00h,00h,00h
ViewBitmap:                                     ; Game view bitmap; used by DrawControlMarker, DrawGameFrame,
                                                ; DrawReplayView ...
        db 00h,00h,00h,00h
ViewPixels:                                     ; Game view pixels; used by DrawControlMarker, DrawGameFrame,
                                                ; DrawReplayView ...
        db 00h,00h,00h,00h
ViewSizeStep:                                   ; Game view size step (8 full); used by DrawDirtyZones,
                                                ; EndReplay, InGameMenu ...
        db 08h,00h,00h,00h
CameraShotOn:                                   ; Camera shot running; used by CamShotDimPath, CamShotOrbitTo,
                                                ; EndCameraShot ...
        db 00h,00h,00h,00h

global CamLastSort, CamFirstFrame, HexDigits, JerseyDigitWidths, TextOverlayFadeSteps
global CamFollowObj, CamLeadDist, CamAimDist, CamViewBits, CameraViewTable




global CameraViewSlots, CamFocusObj, CamFixedObj, CamShotFromObj, CamShotToObj, CamShotNearObj
global HotKeyStates
global ShadowToggle, MarkerToggle, NameToggle, PlayerSpritesLoaded, SpriteFileHandles
global FightSpritesLoaded, SpriteMemBlock, LastPaletteMode, SpritesLoaded, SpriteCacheOn, SpriteCacheMem, TeamNameArt, WaitBoxArt
global textcolor, textshadow, ModeLinear, GraphicsFixOn, StartupPalette, NearestColorCount, NearestColorLimit, MenuMouseX
global MenuMouseY, MenuMouseButtons, MenuMoveSfx, MenuSelectSfx, ReplayCameraView, GameSpriteNames, SlideEventFuncs

global BottomBarDef, TitleBarDef, SideBarDef, SlideEvents



global CreditsText, MenuViewStored, MenuLinkActive, MenuClipActive, MenuInputPaused, MenuInputReady
TextOverlayFadeSteps:                           ; text overlay fade steps; used by CloseTextOverlay
        db 063h,00h,00h,00h,062h,00h,00h,00h,05Fh,00h,00h,00h,01Eh,00h,00h,00h
        db 014h,00h,00h,00h,0Eh,00h,00h,00h,0Dh,00h,00h,00h,0Ch,00h,00h,00h
        db 0Bh,00h,00h,00h,0Bh,00h,00h,00h,0Ah,00h,00h,00h
CamFollowObj:                                   ; Camera: object followed by the shot; used by
                                                ; CloseTextOverlay, DrawTimedPanel, EndCameraShot ...
        db 00h,00h,00h,00h
CamLeadDist:                                    ; Camera: lead distance; used by CameraLeadOffset, EaCamView,
                                                ; NhlCamOneView ...
        db 00h,00h,00h,00h,00h,00h,00h,00h
CamAimDist:                                     ; Camera: aim distance; used by CamShotReferee,
                                                ; CameraLeadOffset, CameraNearNet ...
        db 00h,00h,00h,00h
CamViewBits:                                    ; Camera: view bits; used by CamShotPuckMid, CamShotPuckNear,
                                                ; EaCamView ...
        db 00h,00h,00h,00h,010h,00h,00h,00h
CameraViewTable:                                ; Camera views and shots, 45h bytes each (text id, kind,
                                                ; routine, settings); used by CloseTextOverlay, ReadHotKeys,
                                                ; UpdateCamera
        db 030h,02h,00h,00h
        db 01h
        dd NhlCamOneView
        db 00h,00h,00h,00h,0ABh,0EAh,0FFh,0FFh,00h,00h,00h,00h,0F4h,01h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 031h,02h,00h,00h
        db 01h
        dd NhlCamTwoView
        db 00h,00h,00h,00h,0ABh,0EAh,0FFh,0FFh,00h,00h,00h,00h,0F4h,01h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 032h,02h,00h,00h
        db 02h
        dd SkyCamOneView
        db 00h,00h,00h,00h,0ABh,0EAh,0FFh,0FFh,00h,00h,00h,00h,0D0h,02h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 033h,02h,00h,00h
        db 02h
        dd SkyCamTwoView
        db 00h,00h,00h,00h,0ABh,0EAh,0FFh,0FFh,00h,00h,00h,00h,0D0h,02h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 034h,02h,00h,00h
        db 03h
        dd EaCamView
        db 00h,00h,00h,00h,0C8h,0F1h,0FFh,0FFh,00h,00h,00h,00h,0CCh,01h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 035h,02h,00h,00h
        db 04h
        dd HeadCamView
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08Ch,00h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 036h,02h,00h,00h
        db 05h
        dd PressCamOneView
        db 00h,0C0h,0FFh,0FFh,0ABh,0EAh,0FFh,0FFh,0B0h,0FAh,0FFh,0FFh,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 037h,02h,00h,00h
        db 05h
        dd PressCamTwoView
        db 00h,0C0h,0FFh,0FFh,0ABh,0EAh,0FFh,0FFh,0B0h,0FAh,0FFh,0FFh,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 038h,02h,00h,00h
        db 05h
        dd PressCamThreeView
        db 00h,0C0h,0FFh,0FFh,0ABh,0EAh,0FFh,0FFh,0B0h,0FAh,0FFh,0FFh,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 039h,02h,00h,00h
        db 05h
        dd PressCamFourView
        db 00h,0C0h,0FFh,0FFh,0ABh,0EAh,0FFh,0FFh,0B0h,0FAh,0FFh,0FFh,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Ah,02h,00h,00h
        db 06h
        dd ZoneCamView
        db 00h,0C0h,0FFh,0FFh,0ABh,0EAh,0FFh,0FFh,0B0h,0FAh,0FFh,0FFh,020h,03h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Bh,02h,00h,00h,0Bh
        dd CamShotFollowPath
        db 00h,0C0h,0FFh,0FFh,08Fh,0E3h,0FFh,0FFh,0C0h,0F9h,0FFh,0FFh,028h,0Ah,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Ch,02h,00h,00h,013h
        dd CamShotDimPath
        db 00h,0C0h,0FFh,0FFh,08Fh,0E3h,0FFh,0FFh,0A8h,02h,00h,00h,0DCh,00h,00h,00h
        db 0F8h,0F8h,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Dh,02h,00h,00h,09h
        dd CamShotOverlayPanel
        db 00h,0C0h,0FFh,0FFh,0C8h,0F1h,0FFh,0FFh,0C0h,0FEh,0FFh,0FFh,090h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Eh,02h,00h,00h,0Ah
        dd CamShotPuckChase
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0F4h,01h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Fh,02h,00h,00h,07h
        dd CamShotPuckMid
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08Ch,00h,00h,00h
        db 0F8h,0F8h,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 040h,02h,00h,00h,08h
        dd CamShotPuckNear
        db 00h,00h,00h,00h,00h,00h,00h,00h,01Ch,00h,00h,00h,050h,00h,00h,00h
        db 070h,0FAh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 041h,02h,00h,00h,0Ch
        dd CamShotOnTarget
        db 00h,00h,00h,00h,0C8h,00h,00h,00h,00h,00h,00h,00h,0F4h,01h,00h,00h
        db 0FCh,0FEh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 042h,02h,00h,00h,0Dh
        dd CamShotOrbitFrom
        db 00h,00h,00h,00h,00h,00h,00h,00h,0C0h,0FDh,0FFh,0FFh,0D8h,02h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 043h,02h,00h,00h,0Eh
        dd CamShotOrbitTo
        db 00h,0C0h,0FFh,0FFh,0EFh,0EEh,0FFh,0FFh,0C0h,0FDh,0FFh,0FFh,0D8h,02h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 044h,02h,00h,00h,0Fh
        dd CamShotNetShake
        db 00h,00h,00h,00h
        db 017h,0ECh,0FFh,0FFh
        db 00h,00h,00h,00h
        db 0B8h,0Bh,00h,00h
        db 060h,0F0h,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 045h,02h,00h,00h,010h
        dd CamShotReferee
        db 00h,00h,00h,00h,0ABh,0EAh,0FFh,0FFh,00h,00h,00h,00h,0F4h,01h,00h,00h
        db 0DCh,0FBh,0FFh,0FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 046h,02h,00h,00h,011h
        dd CamShotOrbitNear
        db 00h,00h,00h,00h,00h,00h,00h,00h,0C0h,0FDh,0FFh,0FFh,0D8h,02h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 047h,02h,00h,00h,012h
        dd CamShotTargetTurn
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,090h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
CameraViewSlots:                                ; Camera view per slot; used by DrawTimedPanel, InitGameView,
                                                ; SetReplayCamera ...
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable
ReplayCameraView:                               ; Replay camera view; used by SetReplayCamera
        dd CameraViewTable+45h
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+8Ah
        dd CameraViewTable+0CFh
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+114h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+159h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+19Eh
        dd CameraViewTable+1E3h
        dd CameraViewTable+228h
        dd CameraViewTable+26Dh
        dd CameraViewTable+2B2h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+40Bh
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable+450h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        dd CameraViewTable
        dd CameraViewTable+8Ah
        dd CameraViewTable+114h
        dd CameraViewTable+159h
        dd CameraViewTable+228h
        dd CameraViewTable+2B2h
        dd CameraViewTable+40Bh
        dd CameraViewTable+450h
        dd CameraViewTable+381h
        dd CameraViewTable+3C6h
        dd CameraViewTable+2F7h
        dd CameraViewTable+495h
        dd CameraViewTable+4DAh
        dd CameraViewTable+51Fh
        dd CameraViewTable+564h
        dd CameraViewTable+5A9h
        dd CameraViewTable+5EEh
        dd CameraViewTable+633h
        dd CameraViewTable+33Ch
CamFocusObj:                                    ; Camera: focus object; used by CameraLeadOffset,
                                                ; CameraNearNet, EaCamView ...
        db 00h,00h,00h,00h
CamFixedObj:                                    ; Camera: fixed view object, -1 for none; used by ZoneCamView
        db 0FFh,0FFh,0FFh,0FFh
CamShotFromObj:                                 ; Camera shot: from object; used by CamShotOrbitFrom
        db 0FFh,0FFh,0FFh,0FFh
CamShotToObj:                                   ; Camera shot: to object; used by CamShotOrbitTo
        db 0FFh,0FFh,0FFh,0FFh
CamShotNearObj:                                 ; Camera shot: near object; used by CamShotOrbitNear
        db 0FFh,0FFh,0FFh,0FFh
HotKeyStates:                                   ; Hot key states; used by ReadHotKeys
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
ShadowToggle:                                   ; Shadow hot key toggle; used by InitGameView, ReadHotKeys
        db 00h,00h,00h,00h
MarkerToggle:                                   ; Marker hot key toggle; used by InitGameView, ReadHotKeys
        db 00h,00h,00h,00h
NameToggle:                                     ; Name hot key toggle; used by InitGameView, ReadHotKeys
        db 00h,00h,00h,00h
CamLastSort:                                    ; Camera: last sort; used by SortSpritesForDraw, UpdateCamera
        db 00h,00h,00h,00h
CamFirstFrame:                                  ; Camera: first frame; used by UpdateCamera
        db 01h,00h,00h,00h
HexDigits:                                      ; hex digit characters; used by vtoa
        db 01h,07h,03h,05h,00h,00h,04h,04h,02h,06h,02h,06h,01h,07h,03h,05h
