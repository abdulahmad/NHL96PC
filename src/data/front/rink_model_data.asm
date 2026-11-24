; Initialised data of front/rink_model (src/front/rink_model).
bits 32
%include "hockey.inc"
section s_1175A4 progbits alloc noexec write align=1
global RinkFloorOn, IceTextureOn, IceLogosOn, GlassOn, PlayerDetailOn, StandsOn, RinkBoardsOn, BenchPlayersOn
global ScoreClockOn, IceLogoGroupCount, StandsArtLoaded, PenBoxDoorHome, PenBoxDoorAway, IceCircleVertices, IceSurfaceDef, IceGeometryDef
global FaceoffCircleOrder, EndZoneOrder, CircleTableBuilt, GlassHitFace, ZamboniLoaded, ShadowFill, OptionButtonDX, OptionButtonDY
RinkFloorOn:                                    ; draw the rink floor; used by DrawRinkFloor, InGameMenu,
                                                ; InitGameView ...
        db 01h
IceTextureOn:                                   ; draw the ice texture; used by DrawIceMarkings, InGameMenu,
                                                ; InitGameView ...
        db 01h
IceLogosOn:                                     ; draw the ice logos; used by DrawIceMarkings, InGameMenu,
                                                ; InitGameView ...
        db 01h
GlassOn:                                        ; draw and collide with the glass; used by DrawBenchArea,
                                                ; DrawRinkBack, DrawRinkFrontParts ...
        db 01h
PlayerDetailOn:                                 ; draw detailed players; used by DrawGameFrame,
                                                ; DrawIceMarkings, DrawPlayers ...
        db 01h
StandsOn:                                       ; draw the stands; used by CamShotFollowPath, CamShotNetShake,
                                                ; CameraNearNet ...
        db 01h
RinkBoardsOn:                                   ; draw the boards; used by CamShotFollowPath, CamShotNetShake,
                                                ; CameraNearNet ...
        db 01h
BenchPlayersOn:                                 ; draw the bench players; used by DrawBenchPlayers,
                                                ; InitGameView, ReadHotKeys
        db 01h
ScoreClockOn:                                   ; draw the score clock; used by CamShotFollowPath,
                                                ; CamShotNetShake, CameraNearNet ...
        db 01h
IceLogoGroupCount:                              ; ice logo model groups found; used by DrawIceBackPoly,
                                                ; DrawIceMarkings, LoadRinkModel
        db 00h,00h,00h,00h
StandsArtLoaded:                                ; stands art is loaded; used by FreeStandsArt, LoadStandsArt
        db 00h,00h,00h,00h
PenBoxDoorHome:                                 ; home penalty box door state; used by EndReplay,
                                                ; SetPenaltyBoxDoor, SortSpritesForDraw
        db 00h,00h,00h,00h
PenBoxDoorAway:                                 ; away penalty box door state; used by EndReplay,
                                                ; SetPenaltyBoxDoor, SortSpritesForDraw
        db 00h,00h,00h,00h
IceCircleVertices:                              ; ice circle vertices; used by DrawIceSurface
        db 02Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,036h,00h,00h,00h
        db 00h,00h,00h,00h,01Dh,00h,00h,00h,01Eh,00h,00h,00h,00h,00h,00h,00h
        db 039h,00h,00h,00h,0E2h,0FFh,0FFh,0FFh,00h,00h,00h,00h,039h,00h,00h,00h
        db 0CAh,0FFh,0FFh,0FFh,00h,00h,00h,00h,01Dh,00h,00h,00h,0D2h,0FFh,0FFh,0FFh
        db 00h,00h,00h,00h,00h,00h,00h,00h
IceSurfaceDef:                                  ; ice surface definition; used by DrawIceSurface
        db 041h,00h,00h,00h,00h,00h,00h,00h,0C9h,0FFh,0FFh,0FFh,041h,00h,00h,00h
        db 00h,00h,00h,00h,0BFh,0FFh,0FFh,0FFh,037h,00h,00h,00h,00h,00h,00h,00h
        db 0BFh,0FFh,0FFh,0FFh,0BFh,0FFh,0FFh,0FFh,00h,00h,00h,00h,0C9h,0FFh,0FFh,0FFh
        db 0BFh,0FFh,0FFh,0FFh,00h,00h,00h,00h,0BFh,0FFh,0FFh,0FFh,0C9h,0FFh,0FFh,0FFh
        db 00h,00h,00h,00h,0BFh,0FFh,0FFh,0FFh
IceGeometryDef:                                 ; ice geometry definition; used by BuildCircleTable,
                                                ; DrawIceSurface
        db 093h,00h,00h,00h,00h,00h,00h,00h,012h,00h,00h,00h,0B1h,00h,00h,00h
        db 00h,00h,00h,00h,012h,00h,00h,00h,093h,00h,00h,00h,00h,00h,00h,00h
        db 0EEh,0FFh,0FFh,0FFh,0B1h,00h,00h,00h,00h,00h,00h,00h,0EEh,0FFh,0FFh,0FFh
        db 06Dh,0FFh,0FFh,0FFh,00h,00h,00h,00h,012h,00h,00h,00h,04Fh,0FFh,0FFh,0FFh
        db 00h,00h,00h,00h,012h,00h,00h,00h,06Dh,0FFh,0FFh,0FFh,00h,00h,00h,00h
        db 0EEh,0FFh,0FFh,0FFh,04Fh,0FFh,0FFh,0FFh,00h,00h,00h,00h,0EEh,0FFh,0FFh,0FFh
FaceoffCircleOrder:                             ; faceoff circle draw order; used by DrawFaceoffCircle
        db 00h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h,03h,00h,00h,00h
        db 04h,00h,00h,00h,05h,00h,00h,00h,06h,00h,00h,00h,07h,00h,00h,00h
EndZoneOrder:                                   ; end zone marking draw order; used by DrawEndZoneMarkings
        db 00h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h
CircleTableBuilt:                               ; circle table has been built; used by BuildCircleTable
        db 00h,00h,00h,00h
GlassHitFace:                                   ; used by BreakGlass, EndReplay, ReplayBrokenGlass ...
        db 0FFh,0FFh,0FFh,0FFh
ZamboniLoaded:                                  ; Zamboni model is loaded; used by DrawGameFrame, DrawZamboni,
                                                ; DrawZamboniScene ...
        db 00h,00h,00h,00h,00h,00h,00h
ShadowFill:                                     ; shadow fill pattern; used by BeginShadowDraw
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh
        db 0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FEh,0FFh
OptionButtonDX:                                 ; option button x offset; used by DrawOptionButton,
                                                ; GameOptionsScreen
        db 00h,00h,00h,00h
OptionButtonDY:                                 ; option button y offset; used by DrawOptionButton,
                                                ; GameOptionsScreen
        db 00h,00h,00h,00h
