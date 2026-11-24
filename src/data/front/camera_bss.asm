; BSS of front/camera (src/front/camera).
bits 32
%include "hockey.inc"
section s_179CBC nobits alloc noexec write align=1
extern AwayJerseyPal, BottomBarArt, BottomBarBmp, fadepalbuf, FrontEndArtFiles, FrontEndBarShapes, FrontEndScreenBmp, HomeJerseyPal
extern IntroPalette, JerseyColorMap, MarkerSpriteFile, MatchupLayer, MenuBoxStyle, MenuButtons, MenuLastButtons, MenuLastMouseX
extern MenuLastMouseY, MenuViewTop, NetSpriteFile, PlayerSpriteCount, PlayerSpriteFile, RinkColorMap, RinkSpriteFile, ScreenPaletteBuf
extern SideBarArt, SideBarBmp, SlideEventPtr, SlideImageBmp, SlideImageIndex, SlideImageNames, SpriteCache, SpriteCacheBlock
extern SpriteCacheFree, SpriteCacheHead, SpriteCacheLinks, SpriteCachePtr, SpriteCacheSize, SpriteCacheUsed, SpriteColorRanges, TeamPaletteSave
extern TeamStatsBitmap, TitleBarArt, TitleBarBmp, TitleTextStyle
global CamShotMode, CamViewFlags, CamShotPhase

global TitleTextStyle, CamTargetObj, CamLeadX, CamLeadY, CamLeadOn
global CamShotTime, CamPathPos, CamAimX, CamAimShift, CamAimY, CamShotTimer, CamShakeStart, CamShakeCount
global CamShotId, CamShotObj, CamInjuredObj, CamNearNet, CameraShotState, CamShotKeys, CamShotSaved
global CamPosX, CamPosY, CamPosZ, CamDistance, CamMatrix, CamAngle, CamPitch, CamPathState
global CamZoom, CamPathActive, CamPathDerivs
global SpriteCacheLinks, SpriteCache, SpriteCachePtr, SpriteCacheFree
global SpriteCacheUsed, SpriteCacheBlock, SpriteCacheSize, PlayerSpriteFile, PlayerSpriteCount, RinkSpriteFile, NetSpriteFile, MarkerSpriteFile
global FrontEndBarShapes, SideBarBmp, BottomBarBmp
global ScreenPaletteBuf, TitleBarBmp, FrontEndScreenBmp, MatchupLayer, TeamStatsBitmap, SideBarArt
global MenuBoxStyle, BottomBarArt

global TitleBarArt
global SlideImageBmp, SlideImageIndex, SlideEventPtr, MenuLastMouseX, MenuLastMouseY, MenuLastButtons
global MenuButtons, MenuViewTop, CameraPathPoints, CamPathTarget
global SpriteCacheHead, JerseyColorMap, RinkColorMap, TeamPaletteSave, HomeJerseyPal, AwayJerseyPal, SpriteColorRanges, FrontEndArtFiles
global SlideImageNames, IntroPalette, fadepalbuf
CamTargetObj:                                   ; Camera: object followed; used by CamShotOnTarget,
                                                ; CamShotOrbitFrom, CamShotReferee ...
        resb 4
CamLeadX:                                       ; Camera: lead x; used by CameraLeadOffset, CameraTrackPuck
        resb 4
CamLeadY:                                       ; Camera: lead y; used by CameraTrackPuck
        resb 4
CamLeadOn:                                      ; Camera: lead on; used by CameraLeadOffset, CameraTrackPuck
        resb 4
CameraPathPoints:                               ; Camera path points, 24 bytes each; used by CameraPathDerivs,
                                                ; CameraPathPoint
        resb 24
        resb 24
        resb 24
        resb 24
        resb 24
CamShotTime:                                    ; Camera shot time; used by CamShotDimPath, SetCameraShot
        resb 4
CamPathPos:                                     ; Camera path position; used by CamShotDimPath,
                                                ; CameraPathDerivs, CameraPathPoint ...
        resb 8
CamAimX:                                        ; Camera aim x; used by CamShotDimPath, CamShotFollowPath,
                                                ; CamShotNetShake ...
        resb 4
CamAimShift:                                    ; Camera aim shift; used by CamShotDimPath, CamShotFollowPath,
                                                ; CamShotNetShake ...
        resb 4
CamAimY:                                        ; Camera aim y; used by CamShotDimPath, CamShotFollowPath,
                                                ; CamShotNetShake ...
        resb 4
CamShotTimer:                                   ; Camera shot timer; used by CamShotOrbitFrom,
                                                ; CamShotOrbitNear, CameraAim ...
        resb 4
CamShakeStart:                                  ; Camera shake start; used by CamShotNetShake, UpdateCamera
        resb 4
CamShakeCount:                                  ; Camera shake count; used by CamShotNetShake, UpdateCamera
        resb 4
CamShotId:                                      ; Camera shot id, -1 for none; used by CamShotNetShake,
                                                ; CloseTextOverlay, EndCameraShot ...
        resb 4
CamShotObj:                                     ; Camera shot object; used by CamShotOrbitFrom, Goal,
                                                ; UpdateCamera
        resb 4
CamInjuredObj:                                  ; Camera: injured player object; used by UpdateCamera,
                                                ; setInjuryType
        resb 4
CamNearNet:                                     ; Camera near the net; used by CamShotFollowPath,
                                                ; CamShotNetShake, CameraNearNet ...
        resb 4
CameraShotState:                                ; Camera shot state block; used by CamShotDimPath,
                                                ; EndCameraShot, ReadHotKeys ...
        resb 4
        resb 1
        resb 64
CamShotKeys:                                    ; Camera shot keys; used by CamShotDimPath, CameraPathDerivs,
                                                ; EndCameraShot ...
        resb 4
CamShotMode:                                    ; Camera shot mode; used by CamShotDimPath, DrawGameOverlays,
                                                ; DrawLineChangeBoxes ...
        resb 1
CamShotSaved:                                   ; Camera shot saved state; used by CamShotDimPath,
                                                ; EndCameraShot, ReadHotKeys ...
        resb 4
CamPosX:                                        ; Camera position x (16.16); used by CamShotDimPath,
                                                ; CamShotFollowPath, CamShotNetShake ...
        resb 2
        resb 2
CamPosY:                                        ; Camera position y (16.16); used by CamShotFollowPath,
                                                ; CamShotNetShake, CamShotOrbitTo ...
        resb 2
        resb 2
CamPosZ:                                        ; Camera position z; used by CamShotDimPath,
                                                ; CamShotFollowPath, CamShotNetShake ...
        resb 4
CamDistance:                                    ; Camera distance; used by CamShotDimPath, CamShotFollowPath,
                                                ; CamShotNetShake ...
        resb 4
CamMatrix:                                      ; Camera matrix; used by CamShotDimPath, CamShotFollowPath,
                                                ; CamShotNetShake ...
        resb 44
CamPathTarget:                                  ; Camera path target; used by CameraPathDerivs, ReadHotKeys,
                                                ; ReplayCameraAim ...
        resb 4
CamViewFlags:                                   ; Camera view flags; used by InitGameView
        resb 5
CamAngle:                                       ; Camera angle (16.16); used by BenchSpriteFrame,
                                                ; CamShotDimPath, CameraFacing ...
        resb 2
        resb 2
CamPitch:                                       ; Camera pitch (16.16); used by CameraPathPoint,
                                                ; DrawGameFrame, DrawReplayView ...
        resb 2
        resb 2
CamPathState:                                   ; Camera path state; used by CamShotDimPath,
                                                ; CamShotFollowPath, CamShotOrbitNear ...
        resb 4
CamZoom:                                        ; Camera zoom; used by CameraPathPoint, DrawGameFrame,
                                                ; DrawReplayView ...
        resb 4
CamPathActive:                                  ; Camera path active; used by CamShotDimPath,
                                                ; CamShotFollowPath, CamShotOrbitNear ...
        resb 4
CamPathDerivs:                                  ; Camera path derivatives; used by CameraPathDerivs
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
CamShotPhase:                                   ; Camera shot phase; used by CamShotOrbitFrom
        resb 1
