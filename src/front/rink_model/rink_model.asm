; 3D rink: the ice and boards model, its textures and the software 3D renderer of the 96 rink view (96 PC; to be split as it gets named).
bits 32
%include "hockey.inc"
extern ReplayFrameState
section s_21984 progbits alloc exec nowrite align=1
extern __CHP, RinkFloorOn, IceTextureOn, IceLogosOn, GlassOn, PlayerDetailOn, StandsOn, RinkBoardsOn
extern BenchPlayersOn, ScoreClockOn
extern ShadowRemapEnd
extern IceLogoGroupCount, StandsArtLoaded, PenBoxDoorHome, PenBoxDoorAway
extern CircleTableBuilt, GlassHitFace, ZamboniLoaded, OptionButtonDX, OptionButtonDY, InReplay, ViewScreenWidth, ViewScreenHeight
extern NearClipZ, SinTable, DrawClipLeft, DrawClipTop, DrawClipRight, DrawClipBottom, DrawDestBuffer, SpriteArtPtrs
extern GoalLightLamp, RinkModelBoards, GoalLightTimerFar, RinkModelGlass, GoalLightFrame, FarSideModel, GoalLightOn, RinkModelIce
extern RinkMarkingPoints


extern GlassShards, StandsSidePoints, GlassPanelShake
extern BoardPoints, PenBoxBenchGroups, BenchGroups, RinkSideTables
extern PenBoxNearGroups, RinkModelTexInfo, PenBoxFarGroups, RinkModelBounds, GlassPanelList, RinkSideStructs


extern RinkFloorPoints, SideGlassPoints, IceLogoGroups, StandsArtTable, StandsArt, RinkC03Group, RinkC02Group, RinkC01Group
extern RinkModelNormals, ZamboniState
extern GoalLightTime
extern GoalLightLit, GlassShakeX, GlassShakeY, GlassShakeDir, GlassShakeOn, GlassShakeSide, GlassShakeStep, GlassShakeTimer
extern GlassBreakX, GlassBreakY, GlassBreakStep, GlassBreakPanel, GlassBreakShards, GlassBroken, CircleTableCount, CircleTableUsed
extern CircleTablePtr, RinkLength, RinkWidth, RinkCorner, RinkModelBytes, RinkModelFile, IceCrudCount, KickplateClipX
extern RinkModelSize, RinkModelFlags, RinkModelHeader, BenchDoorArt, IceCrudBase, RinkModelVerts, RinkModelPolys, RinkDoor12Group
extern IceTextureBmp, IceCrudOffset, GlassShardCount, IceTextureOffset, IceTextureFile, IceTextureSize, RinkRight2Faces, RinkLeft2Faces
extern BenchGroupCount, RinkLeft2Count, RinkRight1Faces, RinkLeft1Faces, RinkLeft1Count, RinkTopCount, RinkTopFaces, RinkBackFaces
extern RinkBackCount, RinkRight2Count, PenBoxGroupCount, RinkRight1Count, RinkPenBoxZ1Faces, RinkPenBoxZ0Faces, RinkPenBackCount, RinkBenchDividerFaces
extern RinkPenBoxT1Faces, RinkPenBoxT0Faces, RinkPenBottomFaces, RinkPenBoxZ1LastVert, RinkPenBoxZ0LastVert, RinkBenchBackFaces, RinkBenchBottomFaces, RinkPenBottomCount
extern RinkPenBoxT1LastVert, RinkPenBoxT0LastVert, RinkPenBackFaces, RinkPenBoxZ0Count, RinkPenBoxZ1Count, RinkBenchZ1Faces, RinkPenBoxT0Count, RinkPenBoxT1Count
extern RinkPenBoxT0Id, RinkIceLogo2Count, RinkIceLineFaces, RinkIceLogo2Faces, RinkIceLineCount, RinkBenchBackCount, RinkLitesFaces, RinkWallFaces
extern RinkBenchXGroup, RinkBenchZ1Group, RinkBenchZ0Group, RinkMaxZGroup, RinkMaxXGroup, RinkStand2ndFaces, RinkMinXGroup, RinkMinZGroup
extern RinkLitesCount, RinkBenchDividerCount, RinkBenchZ0Count, RinkBenchZ1Count, RinkBenchZ0Faces, RinkIce2Faces, RinkBenchBottomCount, RinkStandFaces
extern ZamboniModel, GlassLineAATable, FatLineAATable, ZamboniShapes, GoalPipeAATable, BlueLineAATable, RinkZamboniPathFaces, RinkWallCount
extern RinkCreaseMaterial, RinkStand2ndCount, RinkZamboniPathCount, BotBoardsAATable, RinkIce2Count, RinkStandCount, IceCrudColour, TopBoardsAATable
extern PuckShapes, ZamboniInstance, RinkGt007LastVert, StandsSideArt, BenchSideModel, RinkBoardBackMaterial, RinkRedLite1Group, RinkRedLite0Group
extern RinkFlatBoardsMaterial, RinkGt004FirstVert, RinkMarkingModel, RinkB00FirstVert, CreaseModel, IceTextureQuad, RinkGreenLite1Group, RinkGreenLite0Group
extern RinkGt004LastVert, RinkGeometryModel, BoxModelData, RinkEdgeFlags, StandsSideShapes, RinkGeometryParts, RinkGt302FirstVert, RinkGeometryData
extern CameraFlashOn, MarkingAATable, BenchSideIndex, NeutralSpotModel, CenterSpotModel, CreasePolyModel, BoardsTopModel, CenterCircleModel
extern BenchLineModel, ScoreInstance, ScoreShapes, ScoreModel, NetShapes, PuckShadowModel, PuckShadowInstance, RinkModel
extern PuckInstance, RinkInstance, RinkSidesModel, RinkShapes, PuckModel, NetModel, HomeNetInstance, AwayNetInstance
extern Stands2Instance, OptionButtonArt, OptionButtonBmp
extern SpriteScreenX, SpriteScreenY, RubberFaceBmp, RubberSideBmp, ShowMarkers, SpriteFrameIds
extern LineClipRight, LineClipBottom, LineClipTop, LineClipLeft, TexturePageBase, TextureDetail, FatalError, gameopts
extern GetTicks, LoadPackedFile, mousex, mousey, PBnum, PutBlock, F64_0p00138889, F64_65536
extern randomd0, SetDrawBitmap, SortCords, sprintf_, str_B00, str_B0DD, str_B1DD, str_B2DD
extern str_B3DD, str_B4DD, str_B5DD, str_B6DD, str_B7DD, str_B8DD, str_B9DD, str_Back
extern str_Benchbk, str_Benchbot, str_Benchdiv, str_Benchx, str_Benchz0, str_Benchz1, str_Bkgd26, str_Boardback
extern str_Botboards, str_C00, str_C01, str_C02, str_C03, str_Center, str_Crease, str_CrowdD
extern str_Crud, str_Door00, str_Door01, str_Door02, str_Door10, str_Door11, str_Door12, str_DoorZ0
extern str_DoorZ1, str_EMPTYFSH, str_Faceoff0, str_Faceoff1, str_Faceoff2, str_Faceoff3, str_Faceoff4, str_Faceoff5
extern str_Faceoff6, str_Faceoff7, str_FatBlueLines, str_FatRedLines, str_Flatboards, str_FSH2, str_Glass, str_Glassline
extern str_Glite0, str_Glite1, str_Goal02, str_Goal12, str_Grnlite, str_Gt002d, str_Gt004, str_Gt007
extern str_Gt102d, str_Gt202d, str_Gt302, str_Gt302d, str_Gt305, str_HALFFSH, str_Ice, str_ICE2
extern str_IceFsh, str_IceLine, str_Icelogo, str_ICELOGO2, str_Left1, str_Left2, str_Lites, str_Maxx
extern str_Maxz, str_Minx, str_Minz, str_Net, str_Pbench0D, str_Pbench1D, str_Penback, str_Penbot
extern str_Penbox0D, str_Penbox1D, str_Penboxt0, str_Penboxt1, str_Penboxz0, str_Penboxz1, str_Pipe, str_Puck
extern str_Puckshad, str_R02d, str_Redlite, str_Right1, str_Right2, str_Rink, str_Rlite0, str_Rlite1
extern str_Rlxh, str_Rlxn, str_Rlyh, str_Rlyn, str_Rsd0, str_Rsd1, str_Rubber, str_Rubberside
extern str_Saveback, str_Score, str_SideD, str_SideNotFoundInRink, str_SideNotFoundInStands, str_STAND, str_STAND2ND, str_STANDS
extern str_Stands2, str_STANDSFSH, str_Strobe, str_TEMP2, str_ThinRedLines, str_Top, str_Topboards, str_WALL
extern str_Wedge, str_WHD0, str_Zamboni, str_Zambpath, strcat_, strcpy_, SelectDataLibrary, BenchSpriteFrame
extern PlayerSpriteFrame, PuckInNet, DrawRinkSprite, SpriteScale, InitMenuItems, RunMenu, SetMenuMouse, FillMusicStream
extern SoundSecondsToBytes, SoundIdle, BuildAntiAliasTable, DrawFixedLine, DrawFixedLineClip, DrawShapeAtOwnPos, DrawArt, PutBlockAtOwnPos
extern AllocMemBlock, FreeMemBlock, MemLargestFreeOfList, CreateBitmap, TintRect, FillRectClipped, FreeBitmap, UnpackedSize
extern LoadResourceDataShared, LoadFileData, OpenArtArchiveErr, NearestColour, LoadFileToBlockShared, FileSizeByName, SetRinkView, TransformRinkPoints
extern ProjectRinkObject, FillTexturePoly, FillTexturePolyClipped, OriFlatPoly, FillFloorPlane, DrawTexturedPolyArgs, OriFindMaterial, OriLoadShapes
extern OriSetMaterialRgb, OriSetMaterialTexture, OriSetMaterialDrawFn, FixedLerp, FixedDivide, AddVec3, SubVec3, OriScaleVector
extern PerspScale, ProjectPoint, ProjectPointList, AngleOfVector, SinInterp, CosInterp, FillPolyIndexed, DrawPerspQuad
extern DrawFlatPoly, DrawPolyOutline, DrawArtScaledHotspot, TransformVector, ProjectPointsPersp, DrawPolyList, SetRinkMatrix, SetRinkTranslation
extern SetScreenScale, ProjectModelPoints, DrawModelFlat, DrawModelSorted, DrawModelPolyList, DrawModelPolys, OriCreateInstance, OriSetObjectMatrix
extern OriSetObjectPosition, OriLoadModel, MakeRotYMatrix, OriFindGroup, OriFindPartition, OriGetPartition, InitReciprocalTable, ClipPolyNearZ
extern DrawMarkingPolys, SetPolyVertexArrays, FixedInverse, SetScreenTarget, SetRemapTable, GetRemapTable, SetColourRemap, SetBlitSource
extern ScaleRowShadow, FindShape, bcopy, Random32, FillPolygon, RemapPolygon, SetNearClipZ, IceCircleVertices
extern IceSurfaceDef, IceGeometryDef, FaceoffCircleOrder, EndZoneOrder, ShadowFill, IcePolyBuffer



extern GlassShardVerts, GlassShardScreen, GlassShardDraw
extern BenchAreaPoints, RinkFrontRemap, IceLinesRemap, IceLogosRemap, IceSurfacePoly
extern IceLinePolys, CentreIcePoly, IceCenterPoly, FlashPolys, ShadowRemap, BenchSprites, BenchSpriteCount, unpack
extern vecdist, SlotsTwoPlayer, LastButtonCode, ReplayObjX, ReplayObjY, ReplayObjZ, ReplayObjFrame
extern ReplayObjAttr
global ZamboniZeroVec, DrawIceCrud, DrawTexturedQuad, DrawIceTextureQuad, RinkNullCallback, AddIceCrud, LoadFshFile, LoadFshFile_E1
global LoadIceTexture, FatLineEdge, ClipEdgeToNear, ClipLineToNear, DrawFaceEdge, DrawFaceEdge_4F, DrawThickSegment, DrawThickSegmentVisible
global DrawFatLine, DrawFatLine_AC, DrawLineListClipped, DrawLineList, DrawRubberEdge, DrawStandsQuad, RubberSideFace, RubberSideFace_8
global RubberFace, DrawStandsSideQuad, DrawStandsSide, TopBoardsFace, TopBoardsFace_E, BotBoardsFace, FatRedLineFace, FatRedLineFace_8
global FatRedLineFace_17, FatBlueLineFace, ThinRedLineFace, GlassLineFace, GlassLineFace_17, GlassFace, DrawRinkFloorPolys, GoalPipeFace
global BuildCircleTable, DrawIceSurface, DrawRinkLinePoly, DrawFaceoffCircle, DrawFaceoffCircle_1DF, DrawCentreMarkings, DrawEndZoneMarkings, FindNearestGlass
global RandomTrianglePoint, AddGlassShard, SplitGlassShards, ShatterGlass, BreakGlass, ClearGlassHoles, ResetBrokenGlass, ResetBrokenGlass_1A8
global StepGlassShards, ReplayBrokenGlass, ReplayBrokenGlass_79, FindNearestGlassVertex, ShakeGlass, ShakeGlass_129, ShakeGlass_167, StopGlassShake
global ResetGlassShake, ResetGlassShake_C, ApplyGlassShake, ReplayGlassShake, RinkEdgeKind, NearestGlassPoint, StartGoalLight, UpdateGoalLight
global DrawSpriteAtVertex, DrawSpriteAtVertex_55, DrawGoalLight, DrawGoalLight_A4, TransformRink, DrawGlassFrameLines, DrawBoardTopLines, DrawBoardTopLines_23D
global DrawBoardTopLines_24C, DrawStandsSides, DrawKickplates, DrawRinkFloor, DrawGlassShards, DrawSideGlass, DrawBoardSegments, DrawBoardSegments_2C
global DrawRinkFrontParts, DrawRinkFrontParts_194, DrawRinkFrontParts_19A, DrawRinkFrontParts_1A0, DrawRinkFrontParts_1A3, DrawRinkFrontParts_1A4, DrawPuckModel, DrawPuckShadowModel
global PlacePuckModels, DrawZamboni, DrawZamboni_41, LoadZamboni, FreeZamboni, MoveZamboni, DrawGoalNet, PlaceGoalNet
global BuildRinkSides, BuildRinkSides_602, SetIceLogoTexture, FreeStandsArt, FreeStandsArt_21, LoadStandsArtJumpTable, LoadStandsArt, LoadStandsArt_25
global LoadStandsArt_32, LoadStandsArt_3F, LoadStandsArt_61, LoadStandsArt_11B, BlendPaletteToGrey, LoadRinkModel, FreeRinkModel, SetViewCamera
global DrawIceBackPoly, DrawIceMarkings, DrawRinkModels, DrawRinkPlayers, DrawBenchPlayers, DrawBenchPlayers_F1, DrawBenchPlayers_F6, DrawBenchSide
global DrawPenaltyBoxPlayers, OpenPenaltyBoxDoor, OpenPenaltyBoxDoor_87, ClosePenaltyBoxDoor, SetPenaltyBoxDoor, DrawBenchArea, DrawPenaltyBoxSide, DrawRinkBack
global DrawRinkFront, DrawWholeRink, DrawZamboniScene, SetRinkClipWindow, LoadShadowRemap, BeginShadowDraw, DrawShadowSprite, DrawShadowSpriteAt
global OptionButtonJumpTable, DrawOptionButton, DrawOptionButton_27, DrawOptionButton_3F, DrawOptionButton_5A, DrawOptionButton_75, DrawOptionButton_90, DrawOptionButton_AB
global DrawOptionButton_C3, DrawOptionButton_DB, DrawOptionButton_F3, DrawOptionButton_10B, GameOptionsJumpTable, GameOptionsScreen, GameOptionsScreen_64F, GameOptionsScreen_66F
global GameOptionsScreen_68C, GameOptionsScreen_6AA, GameOptionsScreen_6C8, GameOptionsScreen_6FD, GameOptionsScreen_71E, GameOptionsScreen_73F, GameOptionsScreen_761, GameOptionsScreen_799
ZamboniZeroVec:                                 ; used by MoveZamboni
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawIceCrud                                     21990  96 PC, low confidence
; Rebuilds the ice texture with random crud marks up to the crud level
; (IceCrudCount)
;-----------------------------------------------------------------------------
DrawIceCrud:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8E8h, 0
        push eax
        mov eax, dword [IceTextureBmp]
        mov esi, dword [IceCrudBase]
        xor edi, edi
        mov eax, dword [byte eax+02Ch]
        add esi, byte 10h
        add eax, byte 10h
        mov dword [byte ebp-08h], edi
        mov dword [byte ebp-04h], eax
.1:
        call Random32
        mov ebx, 1F40h
        xor edx, edx
        div ebx
        mov eax, 0FA0h
        sub eax, edx
        mov edx, dword [byte ebp-08h]
        add dword [byte ebp-08h], byte 4
        mov dword [dword edx+ebp-08E8h], eax
        cmp dword [byte ebp-08h], 8D4h
        jne short .1
        mov dword [byte ebp-0Ch], 0
        jmp near .8
.2:
        mov dword [byte ebp-010h], 0
        jmp near .7
.3:
        cmp byte [esi], 0
        je near .5
        cmp dword [dword ebp-08ECh], byte 0
        je near .5
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+GlassShards+512h-2]
        sub eax, dword [IceTextureSize]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, dword [IceTextureSize]
        inc edi
        add ebx, eax
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+GlassShards+512h-1]
        sub eax, dword [IceCrudOffset]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, dword [IceCrudOffset]
        inc edi
        add ecx, eax
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+GlassShards+512h]
        sub eax, dword [IceTextureOffset]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [IceTextureOffset]
        add edx, eax
        inc edi
        mov dword [byte ebp-014h], edx
        cmp ebx, 0FFh
        jle short .4
        mov ebx, 0FFh
.4:
        mov eax, ecx
        shl ebx, 10h
        shl eax, 8
        add eax, ebx
        add eax, dword [byte ebp-014h]
        push eax
        call NearestColour
        mov edx, dword [byte ebp-04h]
        add esp, byte 4
        mov byte [edx], al
        cmp edi, 232h
        jl short .6
        xor edi, edi
        jmp short .6
.5:
        mov edx, dword [byte ebp-04h]
        mov al, byte [IceCrudColour]
        mov byte [edx], al
.6:
        inc dword [byte ebp-010h]
        inc dword [byte ebp-04h]
        inc esi
.7:
        mov eax, dword [IceTextureBmp]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+06h]
        cmp eax, dword [byte ebp-010h]
        jg near .3
        inc dword [byte ebp-0Ch]
.8:
        mov eax, dword [IceTextureBmp]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+04h]
        cmp eax, dword [byte ebp-0Ch]
        jg near .2
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawTexturedQuad                             21B35  96 PC, medium confidence
; Draws a quad textured from the texture page, from four point indices
;-----------------------------------------------------------------------------
DrawTexturedQuad:
        push esi
        push edi
        enter 64h, 0
        mov eax, dword [byte ebp+014h]
        mov esi, dword [eax]
        mov ebx, dword [TexturePageBase]
        shl esi, 3
        lea edi, [byte ebp-028h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        mov edx, dword [TextureDetail]
        lea edi, [byte ebp-064h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-020h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-058h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-018h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-04Ch]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-010h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        push dword [byte ebp+018h]
        lea eax, [byte ebp-064h]
        push eax
        lea eax, [byte ebp-028h]
        push eax
        lea edi, [byte ebp-040h]
        add esi, edx
        push dword [byte ebp+010h]
        movsd
        movsd
        movsd
        call DrawTexturedPolyArgs
        add esp, byte 10h
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawIceTextureQuad                              21BC9  96 PC, low confidence
; Callback that draws one textured ice quad
;-----------------------------------------------------------------------------
DrawIceTextureQuad:
        push ebx
        push ecx
        push byte 1
        push dword [byte edx+04h]
        push dword [IceTextureQuad]
        call DrawTexturedQuad
        add esp, byte 0Ch
        xor eax, eax
        pop ecx
        pop ebx
;-----------------------------------------------------------------------------
; RinkNullCallback                                21BE2  96 PC, low confidence
; Callback that does nothing
;-----------------------------------------------------------------------------
RinkNullCallback:
        ret
;-----------------------------------------------------------------------------
; AddIceCrud                                   21BE3  96 PC, medium confidence
; (amount): 0 resets the crud level, else adds to it (up to 0A666h) and
; redraws the ice (DrawIceCrud); from UpdateCamera and the in-game menu
;-----------------------------------------------------------------------------
AddIceCrud:
        test eax, eax
        jne short .1
        mov dword [IceCrudCount], eax
        jmp near DrawIceCrud
.1:
        jle short .2
        cmp dword [IceCrudCount], 0A666h
        jge short RinkNullCallback
        jmp short .3
.2:
        cmp dword [IceCrudCount], byte 0
        jle short RinkNullCallback
.3:
        add dword [IceCrudCount], eax
        mov eax, dword [IceCrudCount]
        jmp near DrawIceCrud
;-----------------------------------------------------------------------------
; LoadFshFile                                  21C1A  96 PC, medium confidence
; (name, flags): loads a .FSH art file (adds ".FSH" when the name has no
; extension)
;-----------------------------------------------------------------------------
LoadFshFile:
        push ebx
        push ecx
        push esi
        push edi
        enter 40h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov edx, eax
        lea eax, [byte ebp-040h]
        xor edi, edi
        call strcpy_
        lea eax, [byte ebp-040h]
.1:
        cmp byte [eax], 0
        je short .3
        movsx edx, byte [eax]
        cmp edx, byte 2Eh
        jne short .2
        mov edi, 1
.2:
        inc eax
        jmp short .1
.3:
        test edi, edi
        jne short .4
        mov edx, str_FSH2
        lea eax, [byte ebp-040h]
        call strcat_
.4:
        lea eax, [byte ebp-040h]
        push eax
        call FileSizeByName
        mov edi, eax
        add esp, byte 4
        cmp eax, 32000h
        jge near LoadFshFile_E1.7
        push byte 0
        call MemLargestFreeOfList
        add esp, byte 4
        cmp edi, eax
        jge near LoadFshFile_E1.7
        cmp dword [byte ebp-08h], byte 20h
        jne short LoadFshFile_E1.7
        push byte 0
        lea eax, [byte ebp-040h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        push eax
        mov esi, eax
        mov dword [byte ebp-0Ch], eax
        call UnpackedSize
        add esp, byte 4
        test eax, eax
        jle short .5
        push byte 20h
        push esi
        call UnpackedSize
        add esp, byte 4
        push eax
        lea eax, [byte ebp-040h]
        push eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push eax
        push esi
        mov dword [byte ebp-04h], eax
        call unpack
        jmp short .6
.5:
        push byte 20h
        push edi
        lea eax, [byte ebp-040h]
        push eax
        call AllocMemBlock
        add esp, byte 0Ch
        push edi
        push eax
        push esi
        mov dword [byte ebp-04h], eax
        call bcopy
.6:
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call FreeMemBlock
        mov eax, dword [byte ebp-04h]
LoadFshFile_E1:
        add esp, byte 4
        jmp near DrawBenchPlayers_F6
.7:
        push dword [byte ebp-08h]
        push esi
        call LoadResourceDataShared
        add esp, byte 8
        jmp near DrawBenchPlayers_F6
;-----------------------------------------------------------------------------
; LoadIceTexture                               21D14  96 PC, medium confidence
; Finds the "ice" texture of the rink, loads ice.fsh and its palette and the
; "crud" bitmap
;-----------------------------------------------------------------------------
LoadIceTexture:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        push str_Ice
        push dword [RinkInstance]
        mov edi, GlassShards+512h-2
        call OriFindMaterial
        mov edx, 20h
        add esp, byte 8
        mov eax, str_IceFsh
        mov ecx, 210h
        call LoadFshFile
        mov dword [IceCrudColour], 0ADh
        mov dword [IceTextureFile], eax
        rep movsb
        xor eax, eax
.1:
        inc eax
        shl byte [dword eax+GlassShards+512h-3], 2
        cmp eax, 210h
        jge short .3
        jmp short .1
.2:
        inc eax
        mov byte [dword eax+GlassShards+512h-3], 0
.3:
        cmp eax, 300h
        jl short .2
        movzx eax, byte [GlassShards+719h-2]
        mov dword [IceTextureSize], eax
        movzx eax, byte [GlassShards+719h-1]
        push str_Crud
        mov dword [IceCrudOffset], eax
        movzx eax, byte [GlassShards+719h]
        push dword [IceTextureFile]
        mov dword [IceTextureOffset], eax
        call FindShape
        add esp, byte 8
        mov dword [IceCrudBase], eax
        xor ecx, ecx
        add eax, byte 10h
        jmp short .8
.4:
        xor ebx, ebx
        jmp short .7
.5:
        movzx edx, byte [eax]
        cmp edx, dword [IceCrudColour]
        jne short .6
        mov byte [eax], 0
.6:
        inc ebx
        inc eax
.7:
        mov edx, dword [IceCrudBase]
        movsx edx, word [byte edx+06h]
        cmp ebx, edx
        jl short .5
        inc ecx
.8:
        mov edx, dword [IceCrudBase]
        movsx ebx, word [byte edx+04h]
        cmp ecx, ebx
        jl short .4
        push byte 20h
        movsx eax, word [byte edx+06h]
        push eax
        push ebx
        call CreateBitmap
        mov dword [IceTextureBmp], eax
        mov eax, dword [byte eax+02Ch]
        add esp, byte 0Ch
        mov dword [IceTextureQuad], eax
        xor eax, eax
        call AddIceCrud
        push str_Ice
        push dword [RinkInstance]
        call OriFindMaterial
        add esp, byte 8
        push DrawIceTextureQuad
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        jmp near DrawRinkFrontParts_1A4
;-----------------------------------------------------------------------------
; FatLineEdge                                     21E3E  96 PC, low confidence
; Works out one edge of a fat line on screen
;-----------------------------------------------------------------------------
FatLineEdge:
        push ecx
        push esi
        push edi
        enter 20h, 0
        push eax
        mov edi, edx
        mov esi, ebx
        mov edx, dword [ebx]
        xor eax, eax
        cmp edx, dword [byte ebx+08h]
        jle short .1
        mov ebx, edx
        sub ebx, dword [edi]
        mov dword [byte ebp-04h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        mov dword [byte ebp-08h], ebx
        sub edx, dword [byte ebp-04h]
        je near .3
        mov eax, dword [edi]
        push edx
        sub eax, dword [byte edi+08h]
        push eax
        call FixedDivide
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte esi+04h]
        mov dword [esi], eax
        mov eax, ebx
        sub edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-08h]
        jmp short .2
.1:
        neg edx
        cmp edx, dword [byte ebx+08h]
        jle near .3
        mov ebx, dword [ebx]
        sub ebx, dword [edi]
        mov dword [byte ebp-0Ch], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov dword [byte ebp-010h], ebx
        neg ebx
        sub ebx, dword [byte ebp-0Ch]
        je short .3
        mov eax, dword [edi]
        push ebx
        add eax, dword [byte edi+08h]
        push eax
        call FixedDivide
        add esp, byte 8
        mov edx, dword [byte ebp-0Ch]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte esi+04h]
        mov dword [esi], eax
        mov eax, ebx
        sub edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-010h]
.2:
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+08h]
        add eax, edx
        mov dword [byte esi+08h], eax
        mov eax, 1
.3:
        mov edx, dword [byte esi+04h]
        cmp edx, dword [byte esi+08h]
        jle near .4
        mov ebx, edx
        sub ebx, dword [byte edi+04h]
        mov dword [byte ebp-020h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        mov dword [byte ebp-01Ch], ebx
        sub edx, dword [byte ebp-020h]
        je near .6
        mov eax, dword [byte edi+04h]
        push edx
        sub eax, dword [byte edi+08h]
        push eax
        call FixedDivide
        mov edx, dword [esi]
        add esp, byte 8
        sub edx, dword [edi]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte ebp-020h]
        mov dword [esi], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-01Ch]
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+08h]
        add eax, edx
        jmp near .5
.4:
        neg edx
        cmp edx, dword [byte esi+08h]
        jle near .6
        mov ebx, dword [byte esi+04h]
        sub ebx, dword [byte edi+04h]
        mov dword [byte ebp-014h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        neg edx
        mov dword [byte ebp-018h], ebx
        sub edx, dword [byte ebp-014h]
        je short .6
        mov eax, dword [byte edi+04h]
        push edx
        add eax, dword [byte edi+08h]
        push eax
        call FixedDivide
        mov edx, dword [esi]
        add esp, byte 8
        sub edx, dword [edi]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte ebp-014h]
        mov dword [esi], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-018h]
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov eax, dword [byte edi+08h]
        add eax, ebx
.5:
        mov dword [byte esi+08h], eax
        mov eax, 1
.6:
        test eax, eax
        je short .7
        push dword [byte ebp-024h]
        push esi
        call ProjectPoint
        add esp, byte 8
.7:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ClipEdgeToNear                                  2207E  96 PC, low confidence
; The point where an edge crosses the near plane (NearClipZ)
;-----------------------------------------------------------------------------
ClipEdgeToNear:
        push ecx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        mov eax, dword [byte edx+08h]
        mov ebx, dword [NearClipZ]
        sub eax, dword [byte esi+08h]
        sub ebx, dword [byte esi+08h]
        push eax
        lea eax, [byte ebx+01h]
        push eax
        call FixedDivide
        mov ebx, eax
        add esp, byte 8
        mov eax, dword [edi]
        mov edx, ebx
        sub eax, dword [esi]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [esi]
        add eax, edx
        mov edx, dword [byte ebp-04h]
        mov dword [edx], eax
        mov eax, dword [byte edi+04h]
        mov edx, ebx
        sub eax, dword [byte esi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte ebp-04h]
        add eax, ebx
        mov dword [byte edx+04h], eax
        mov ebx, dword [NearClipZ]
        inc ebx
        mov dword [byte edx+08h], ebx
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ClipLineToNear                                  220FB  96 PC, low confidence
; Clips a line to the near plane (ClipEdgeToNear); 0 when it is all behind
;-----------------------------------------------------------------------------
ClipLineToNear:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        mov edi, edx
        mov esi, ebx
        mov eax, dword [byte ebx+08h]
        cmp eax, dword [NearClipZ]
        jg short .2
        mov eax, dword [byte ecx+08h]
        cmp eax, dword [NearClipZ]
        jg short .1
        xor eax, eax
        leave
        pop edi
        pop esi
        ret
.1:
        mov edx, ecx
        mov eax, ebx
        call ClipEdgeToNear
        push dword [byte ebp-04h]
        push esi
        jmp short .3
.2:
        mov eax, dword [byte ecx+08h]
        cmp eax, dword [NearClipZ]
        jg short .4
        mov ebx, ecx
        mov edx, esi
        mov eax, ecx
        call ClipEdgeToNear
        push edi
        push ecx
.3:
        call ProjectPoint
        add esp, byte 8
.4:
        mov eax, 1
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawFaceEdge                                    22159  96 PC, low confidence
; Draws a line between two projected vertices when both are in front (z >
; 50h)
;-----------------------------------------------------------------------------
DrawFaceEdge:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push ecx
        imul esi, dword [ebx], byte 0Ch
        cmp dword [byte esi+eax+08h], byte 50h
        jle short DrawFaceEdge_4F
        mov esi, dword [ebx]
        add ebx, byte 4
        imul edi, dword [ebx], byte 0Ch
        shl esi, 3
        add eax, edi
        add esi, edx
        cmp dword [byte eax+08h], byte 50h
        jle short DrawFaceEdge_4F
        mov edi, dword [ebx]
        push dword [byte ebp+010h]
        shl edi, 3
        push eax
        add edi, edx
        call PerspScale
        add esp, byte 8
        push eax
        push eax
        push dword [byte ebp-04h]
        push dword [byte edi+04h]
        push dword [edi]
        push dword [byte esi+04h]
        push dword [esi]
        call DrawFixedLine
        add esp, byte 1Ch
DrawFaceEdge_4F:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; DrawThickSegment                                221AE  96 PC, low confidence
; Draws a line segment widened into a quad along its angle
;-----------------------------------------------------------------------------
DrawThickSegment:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-0Ch], edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        push dword [byte ebx+08h]
        push ecx
        call FixedDivide
        add esp, byte 8
        cmp eax, 10000h
        jle short .1
        mov eax, 10000h
        jmp short .2
.1:
        push dword [byte esi+08h]
        push dword [byte ebp-08h]
        call FixedDivide
        add esp, byte 8
.2:
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [eax]
        mov edx, dword [byte ebp-0Ch]
        sub eax, dword [edi]
        mov edx, dword [byte edx+04h]
        push eax
        sub edx, dword [byte edi+04h]
        push edx
        call AngleOfVector
        add esp, byte 8
        push eax
        mov edi, eax
        call SinInterp
        add esp, byte 4
        test eax, eax
        jl short .3
        push edi
        call SinInterp
        add esp, byte 4
        mov edx, eax
        jmp short .4
.3:
        push edi
        call SinInterp
        mov edx, eax
        add esp, byte 4
        neg edx
.4:
        mov eax, 10000h
        sub eax, dword [byte ebp-04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push dword [byte ebp+010h]
        mov edi, dword [byte ebp-04h]
        push esi
        add edi, eax
        call PerspScale
        add esp, byte 8
        mov edx, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        jmp near DrawFaceEdge_4F
;-----------------------------------------------------------------------------
; DrawThickSegmentVisible                         22268  96 PC, low confidence
; Draws a thick segment when both ends are in front of the camera
;-----------------------------------------------------------------------------
DrawThickSegmentVisible:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebx+08h]
        cmp esi, dword [NearClipZ]
        jg short .2
.1:
        xor eax, eax
        pop ebp
        pop esi
        ret 8
.2:
        mov ecx, dword [byte ecx+08h]
        cmp ecx, dword [NearClipZ]
        jle short .1
        push dword [byte ebp+010h]
        mov ecx, dword [byte ebp+0Ch]
        call DrawThickSegment
        pop ebp
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; DrawFatLine                                     22299  96 PC, low confidence
; Draws a fat ice line across a face, clipped to the near plane
; (FatRedLineFace, FatBlueLineFace)
;-----------------------------------------------------------------------------
DrawFatLine:
        push esi
        push edi
        enter 28h, 0
        push ecx
        imul esi, dword [ebx], byte 0Ch
        lea edi, [byte ebp-01Ch]
        add esi, eax
        movsd
        movsd
        movsd
        mov esi, dword [ebx]
        shl esi, 3
        lea edi, [byte ebp-010h]
        add esi, edx
        add ebx, byte 4
        movsd
        movsd
        imul esi, dword [ebx], byte 0Ch
        lea edi, [byte ebp-028h]
        add esi, eax
        movsd
        movsd
        movsd
        lea ecx, [byte ebp-028h]
        mov esi, dword [ebx]
        lea eax, [byte ebp-010h]
        shl esi, 3
        lea edi, [byte ebp-08h]
        add esi, edx
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-08h]
        movsd
        movsd
        call ClipLineToNear
        test eax, eax
        je short DrawFatLine_AC
        lea ebx, [byte ebp-028h]
        lea edx, [byte ebp-01Ch]
        lea eax, [byte ebp-08h]
        call FatLineEdge
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-028h]
        lea eax, [byte ebp-010h]
        mov ecx, dword [byte ebp-02Ch]
        call FatLineEdge
        push dword [byte ebp+014h]
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-08h]
        lea eax, [byte ebp-010h]
        call DrawThickSegment
        push dword [byte ebp+014h]
        mov ecx, dword [byte ebp-02Ch]
        lea ebx, [byte ebp-028h]
        lea edx, [byte ebp-08h]
        mov esi, eax
        lea eax, [byte ebp-010h]
        call DrawThickSegment
        push eax
        push esi
        push dword [byte ebp+010h]
        push dword [byte ebp-04h]
        push dword [byte ebp-08h]
        push dword [byte ebp-0Ch]
        push dword [byte ebp-010h]
        call DrawFixedLine
        add esp, byte 1Ch
DrawFatLine_AC:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; DrawLineListClipped                          2234B  96 PC, medium confidence
; Draws a list of point pairs as clipped lines, skipping pairs too close to
; the camera
;-----------------------------------------------------------------------------
DrawLineListClipped:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        push edx
        push ebx
        mov esi, ecx
        xor edi, edi
        jmp short .3
.1:
        imul eax, dword [esi], byte 0Ch
        add eax, dword [byte ebp-04h]
        cmp dword [byte eax+08h], byte 50h
        jle short .2
        imul edx, dword [byte esi+04h], byte 0Ch
        mov eax, dword [esi]
        shl eax, 3
        add edx, dword [byte ebp-04h]
        add eax, dword [byte ebp-08h]
        cmp dword [byte edx+08h], byte 50h
        jle short .2
        mov ebx, dword [byte esi+04h]
        shl ebx, 2
        push byte 0
        add ebx, dword [byte ebp+014h]
        push dword [ebx]
        mov ebx, dword [esi]
        shl ebx, 2
        mov edx, dword [byte esi+04h]
        add ebx, dword [byte ebp+014h]
        shl edx, 3
        push dword [ebx]
        add edx, dword [byte ebp-08h]
        push dword [byte ebp+010h]
        push dword [byte edx+04h]
        push dword [edx]
        push dword [byte eax+04h]
        push dword [eax]
        call DrawFixedLineClip
        add esp, byte 20h
.2:
        inc edi
        add esi, byte 8
.3:
        cmp edi, dword [byte ebp-0Ch]
        jl short .1
        jmp short DrawFatLine_AC
;-----------------------------------------------------------------------------
; DrawLineList                                 223BA  96 PC, medium confidence
; Draws a list of point pairs as lines, skipping pairs too close to the
; camera
;-----------------------------------------------------------------------------
DrawLineList:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        push edx
        push ebx
        mov esi, ecx
        xor edi, edi
        jmp short .3
.1:
        imul eax, dword [esi], byte 0Ch
        add eax, dword [byte ebp-04h]
        cmp dword [byte eax+08h], byte 50h
        jle short .2
        imul edx, dword [byte esi+04h], byte 0Ch
        mov eax, dword [esi]
        shl eax, 3
        add edx, dword [byte ebp-04h]
        add eax, dword [byte ebp-08h]
        cmp dword [byte edx+08h], byte 50h
        jle short .2
        mov ebx, dword [byte esi+04h]
        shl ebx, 2
        add ebx, dword [byte ebp+014h]
        push dword [ebx]
        mov ebx, dword [esi]
        shl ebx, 2
        mov edx, dword [byte esi+04h]
        add ebx, dword [byte ebp+014h]
        shl edx, 3
        push dword [ebx]
        add edx, dword [byte ebp-08h]
        push dword [byte ebp+010h]
        push dword [byte edx+04h]
        push dword [edx]
        push dword [byte eax+04h]
        push dword [eax]
        call DrawFixedLine
        add esp, byte 1Ch
.2:
        inc edi
        add esi, byte 8
.3:
        cmp edi, dword [byte ebp-0Ch]
        jl short .1
        jmp near DrawFatLine_AC
;-----------------------------------------------------------------------------
; DrawRubberEdge                                  2242A  96 PC, low confidence
; Draws the rubber edge of a face (RubberFace, RubberSideFace)
;-----------------------------------------------------------------------------
DrawRubberEdge:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-0Ch], edx
        mov esi, ebx
        mov ebx, ecx
        mov dword [byte ebp-04h], 0
        mov edx, ecx
        jmp short .4
.1:
        imul eax, dword [edx], byte 0Ch
        add eax, edi
        cmp dword [byte eax+08h], byte 50h
        jle near DrawFaceEdge_4F
        cmp dword [eax], byte 0
        jge short .2
        mov eax, dword [eax]
        mov dword [byte ebp-08h], eax
        neg dword [byte ebp-08h]
        jmp short .3
.2:
        mov eax, dword [eax]
        mov dword [byte ebp-08h], eax
.3:
        imul eax, dword [edx], byte 0Ch
        mov ecx, dword [byte ebp-08h]
        cmp ecx, dword [byte edi+eax+08h]
        jg near DrawFaceEdge_4F
        inc dword [byte ebp-04h]
        add edx, byte 4
.4:
        cmp esi, dword [byte ebp-04h]
        jg short .1
        mov ecx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-0Ch]
        mov edx, esi
        call FillPolyIndexed
        jmp near DrawFaceEdge_4F
;-----------------------------------------------------------------------------
; DrawStandsQuad                                  22494  96 PC, low confidence
; Draws one quad of the stands from the texture page
;-----------------------------------------------------------------------------
DrawStandsQuad:
        push ecx
        push ebx
        push edx
        push dword [TexturePageBase]
        push dword [TextureDetail]
        push eax
        call DrawPerspQuad
        add esp, byte 14h
        pop ecx
        ret
;-----------------------------------------------------------------------------
; RubberSideFace                               224AE  96 PC, medium confidence
; Draw callback of the rink's "rubberside" faces
;-----------------------------------------------------------------------------
RubberSideFace:
        push ebx
        push ecx
        push dword [RubberSideBmp]
RubberSideFace_8:
        mov ebx, dword [edx]
        mov ecx, dword [byte edx+04h]
        and ebx, byte 7
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call DrawRubberEdge
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RubberFace                                   224D1  96 PC, medium confidence
; Draw callback of the rink's "rubber" faces
;-----------------------------------------------------------------------------
RubberFace:
        push ebx
        push ecx
        push dword [RubberFaceBmp]
        jmp short RubberSideFace_8
;-----------------------------------------------------------------------------
; DrawStandsSideQuad                              224DB  96 PC, low confidence
; Draws one quad of the stands side art
;-----------------------------------------------------------------------------
DrawStandsSideQuad:
        push ebx
        push ecx
        push edx
        push byte 0FFFFFFFFh
        mov eax, dword [byte eax+04h]
        push eax
        push dword [TexturePageBase]
        push dword [TextureDetail]
        mov edx, dword [StandsSideArt]
.1:
        push edx
        call DrawPerspQuad
        add esp, byte 14h
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push byte 0FFFFFFFFh
        mov eax, dword [byte eax+04h]
        push eax
        push dword [TexturePageBase]
        push dword [TextureDetail]
        mov edx, dword [StandsSideShapes]
        jmp short .1
;-----------------------------------------------------------------------------
; DrawStandsSide                                  22522  96 PC, low confidence
; Draws the stands at one side
;-----------------------------------------------------------------------------
DrawStandsSide:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        mov esi, eax
        mov eax, dword [byte eax+04h]
        add eax, byte 8
        imul edi, dword [eax], byte 0Ch
        add eax, byte 4
        imul eax, dword [eax], byte 0Ch
        mov edx, dword [Stands2Instance]
        mov edx, dword [byte edx+078h]
        add edi, edx
        add edx, eax
        lea eax, [byte ebp-010h]
        push eax
        push edx
        push edi
        mov dword [byte ebp-04h], edx
        call SubVec3
        mov edx, dword [byte ebp-04h]
        mov eax, dword [edi]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [edi]
        add eax, dword [byte edx+04h]
        sar eax, 1
        mov dword [byte ebp-018h], eax
        mov eax, dword [edi]
        add esp, byte 0Ch
        add eax, dword [byte edx+08h]
        push dword [byte ebp-010h]
        sar eax, 1
        push dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        call AngleOfVector
        add esp, byte 8
        push dword [byte ebp-01Ch]
        push dword [byte ebp-014h]
        mov edi, eax
        call AngleOfVector
        sub edi, eax
        lea eax, [dword edi+04000h]
        add esp, byte 8
        cmp eax, 0FFFF8000h
        jge short .1
        add eax, 10000h
        jmp short .2
.1:
        cmp eax, 8000h
        jle short .2
        sub eax, 10000h
.2:
        test eax, eax
        setg dl
        movzx edx, dl
        mov edi, edx
        test edx, edx
        jne short .3
        neg eax
.3:
        sar eax, 0Ch
        cmp eax, byte 8
        jle short .4
        mov edx, 10h
        sub edx, eax
        mov eax, edx
.4:
        mov ebx, dword [nosplit eax*4+StandsArt]
        test eax, eax
        jne short .5
        xor edi, edi
.5:
        test edi, edi
        jne short .6
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [eax]
        xor dword [byte eax+04h], edx
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
        mov edx, dword [byte eax+08h]
        xor dword [byte eax+0Ch], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
.6:
        mov edx, dword [byte esi+04h]
        test edi, edi
        je short .7
        mov eax, 0FFFFFFFFh
        jmp short .8
.7:
        mov eax, 1
.8:
        push eax
        push edx
        push dword [TexturePageBase]
        push dword [TextureDetail]
        push ebx
        call DrawPerspQuad
        add esp, byte 14h
        test edi, edi
        jne short .9
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [eax]
        xor dword [byte eax+04h], edx
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
        mov edx, dword [byte eax+08h]
        xor dword [byte eax+0Ch], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
.9:
        xor eax, eax
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; TopBoardsFace                                22669  96 PC, medium confidence
; Draw callback of the "topboards" line
;-----------------------------------------------------------------------------
TopBoardsFace:
        push ebx
        push ecx
        push dword [BenchLineModel]
        mov ecx, dword [TopBoardsAATable]
TopBoardsFace_E:
        mov ebx, dword [byte edx+04h]
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call DrawFaceEdge
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; BotBoardsFace                                2268D  96 PC, medium confidence
; Draw callback of the "botboards" line
;-----------------------------------------------------------------------------
BotBoardsFace:
        push ebx
        push ecx
        push dword [BoardsTopModel]
        mov ecx, dword [BotBoardsAATable]
        jmp short TopBoardsFace_E
;-----------------------------------------------------------------------------
; FatRedLineFace                               2269D  96 PC, medium confidence
; Draw callback of the "fat_red_lines" faces
;-----------------------------------------------------------------------------
FatRedLineFace:
        push ebx
        push ecx
        push dword [CenterSpotModel]
FatRedLineFace_8:
        mov ecx, dword [MarkingAATable]
        mov ebx, dword [byte edx+04h]
        push dword [FatLineAATable]
FatRedLineFace_17:
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call DrawFatLine
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FatBlueLineFace                              226C7  96 PC, medium confidence
; Draw callback of the "fat_blue_lines" faces
;-----------------------------------------------------------------------------
FatBlueLineFace:
        push ebx
        push ecx
        push dword [CenterSpotModel]
        mov ecx, dword [MarkingAATable]
        mov ebx, dword [byte edx+04h]
        push dword [BlueLineAATable]
        jmp short FatRedLineFace_17
;-----------------------------------------------------------------------------
; ThinRedLineFace                              226E0  96 PC, medium confidence
; Draw callback of the "thin_red_lines" faces
;-----------------------------------------------------------------------------
ThinRedLineFace:
        push ebx
        push ecx
        push dword [NeutralSpotModel]
        jmp short FatRedLineFace_8
;-----------------------------------------------------------------------------
; GlassLineFace                                226EA  96 PC, medium confidence
; Draw callback of the "glassline" line (with GlassOn, the glass on)
;-----------------------------------------------------------------------------
GlassLineFace:
        push ebx
        push ecx
        cmp byte [GlassOn], 0
        je short GlassLineFace_17.1
        push dword [CenterCircleModel]
        mov ecx, dword [GlassLineAATable]
GlassLineFace_17:
        mov ebx, dword [byte edx+04h]
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call DrawFaceEdge
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GlassFace                                    22717  96 PC, medium confidence
; Draw callback of the "glass" faces (with GlassOn, the glass on)
;-----------------------------------------------------------------------------
GlassFace:
        push ebx
        push ecx
        cmp byte [GlassOn], 0
        je short .1
        push dword [byte edx+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRinkFloorPolys                              22734  96 PC, low confidence
; Transforms and fills the rink floor polygons
;-----------------------------------------------------------------------------
DrawRinkFloorPolys:
        push ebx
        push edx
        mov edx, dword [byte eax+04h]
        imul ebx, dword [edx], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+078h]
        mov eax, dword [eax]
        add edx, ebx
        mov ebx, dword [ViewScreenWidth]
        shl eax, 8
        shl ebx, 3
        shr eax, 18h
        cmp ebx, dword [byte edx+08h]
        jge short .1
        inc eax
        inc eax
        pop edx
        pop ebx
        ret
.1:
        mov ebx, dword [ViewScreenWidth]
        shl ebx, 2
        cmp ebx, dword [byte edx+08h]
        jge short .2
        inc eax
.2:
        pop edx
        pop ebx
        ret
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, edx
        push dword [byte edx+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .5
        mov eax, dword [byte esi+04h]
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+078h]
        add eax, edx
        mov edx, dword [esi]
        mov ebx, dword [ViewScreenWidth]
        shl edx, 8
        shl ebx, 3
        shr edx, 18h
        cmp ebx, dword [byte eax+08h]
        jge short .3
        inc edx
        inc edx
        jmp short .4
.3:
        mov ebx, dword [ViewScreenWidth]
        shl ebx, 2
        cmp ebx, dword [byte eax+08h]
        jge short .4
        inc edx
.4:
        imul edx, byte 14h
        push dword [byte esi+04h]
        mov eax, dword [byte edi+014h]
        push dword [byte edx+eax+0Ch]
        call OriFlatPoly
        add esp, byte 8
.5:
        xor eax, eax
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GoalPipeFace                                 227E2  96 PC, medium confidence
; Draw callback of the goal "pipe" faces
;-----------------------------------------------------------------------------
GoalPipeFace:
        push ebx
        push ecx
        push dword [CreaseModel]
        mov ecx, dword [GoalPipeAATable]
        jmp near GlassLineFace_17
;-----------------------------------------------------------------------------
; BuildCircleTable                                227F5  96 PC, low confidence
; The 20h points of an ice circle (sin / cos by the radius RinkGeometryModel)
;-----------------------------------------------------------------------------
BuildCircleTable:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov dword [byte ebp-010h], 0
        xor edi, edi
        xor esi, esi
        mov dword [byte ebp-04h], edi
.1:
        push dword [byte ebp-04h]
        call SinInterp
        mov ebx, dword [RinkGeometryModel]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+RinkMarkingPoints+6A8h], 0
        push dword [byte ebp-04h]
        mov dword [dword esi+RinkMarkingPoints+6A4h], eax
        call CosInterp
        mov ebx, dword [RinkGeometryModel]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, byte 8
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+RinkMarkingPoints+6ACh], eax
        mov eax, dword [byte ebp-010h]
        add esi, byte 0Ch
        mov dword [dword edi+RinkMarkingPoints+30Ch], eax
        inc eax
        add dword [byte ebp-04h], 800h
        mov dword [byte ebp-010h], eax
        mov dword [dword edi+RinkMarkingPoints+310h], eax
        cmp eax, byte 20h
        jl near .1
        mov dword [RinkMarkingPoints+410h], 0
        mov dword [byte ebp-08h], 0
        xor edi, edi
        xor esi, esi
        mov dword [byte ebp-0Ch], edi
.2:
        push dword [byte ebp-0Ch]
        call SinInterp
        add esi, byte 0Ch
        mov ebx, dword [CreasePolyModel]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+RinkMarkingPoints+2ACh], 0
        push dword [byte ebp-0Ch]
        mov dword [dword esi+RinkMarkingPoints+2A8h], eax
        call CosInterp
        mov ebx, dword [CreasePolyModel]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add dword [byte ebp-0Ch], 2000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+RinkMarkingPoints+2B0h], eax
        mov eax, dword [byte ebp-08h]
        inc dword [byte ebp-08h]
        mov dword [dword edi+RinkMarkingPoints], eax
        cmp dword [byte ebp-08h], byte 8
        jl short .2
        mov edi, 4000h
        xor esi, esi
.3:
        push edi
        call SinInterp
        mov ebx, dword [RinkGeometryData]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add esi, byte 0Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+CircleTableUsed], 0
        push edi
        mov dword [dword esi+CircleTableCount], eax
        call CosInterp
        mov ebx, dword [RinkGeometryData]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, 1000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+CircleTablePtr], eax
        cmp edi, 0D000h
        jne short .3
        cmp dword [CircleTableBuilt], byte 0
        jne short .5
        mov esi, IceGeometryDef
        lea edi, [byte esi+060h]
.4:
        push esi
        push dword 19999h
        push esi
        call OriScaleVector
        mov dword [CircleTableBuilt], 1
        add esi, byte 0Ch
        add esp, byte 0Ch
        cmp esi, edi
        jne short .4
.5:
        mov edi, 4000h
        xor esi, esi
.6:
        push edi
        call SinInterp
        mov ebx, dword [RinkGeometryParts]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add esi, byte 0Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+GlassBreakShards], 0
        push edi
        mov dword [dword esi+GlassBroken], eax
        call CosInterp
        mov ebx, dword [RinkGeometryParts]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, 1000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+GlassBreakPanel], eax
        cmp edi, 0D000h
        jne short .6
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawIceSurface                                  22A3A  96 PC, low confidence
; Draws the ice surface
;-----------------------------------------------------------------------------
DrawIceSurface:
        push ebx
        push ecx
        push edx
        push IcePolyBuffer
        push FlashPolys
        push RinkMarkingPoints+6A4h
        push byte 20h
        call DrawFlatPoly
        add esp, byte 10h
        push RinkMarkingPoints+534h
        push FlashPolys
        push IceGeometryDef
        push byte 8
        call DrawFlatPoly
        add esp, byte 10h
        push IceLinePolys
        push FlashPolys
        push IceCenterPoly
        push byte 9
        call DrawFlatPoly
        add esp, byte 10h
        push RinkMarkingPoints+224h
        push FlashPolys
        push IceSurfaceDef
        push byte 6
        call DrawFlatPoly
        add esp, byte 10h
        push RinkMarkingPoints+26Ch
        push FlashPolys
        push IceCircleVertices
        push byte 6
        call DrawFlatPoly
        add esp, byte 10h
        push RinkMarkingPoints+4D4h
        push FlashPolys
        push RinkMarkingPoints+2B4h
        push byte 8
        call DrawFlatPoly
        add esp, byte 10h
        push CentreIcePoly
        push FlashPolys
        push IceSurfacePoly
        push byte 9
        call DrawFlatPoly
        add esp, byte 10h
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRinkLinePoly                                22AF0  96 PC, low confidence
; Draws one ice line polygon and its edge
;-----------------------------------------------------------------------------
DrawRinkLinePoly:
        push ebx
        push ecx
        push esi
        mov esi, edx
        push RinkMarkingPoints+474h
        push eax
        push RinkMarkingPoints+4D4h
        push byte 8
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+1E4h
        push RinkMarkingPoints+474h
        push byte 8
        call ProjectPointList
        add esp, byte 0Ch
        mov ecx, RinkMarkingPoints+4
        mov ebx, 8
        push esi
        mov edx, RinkMarkingPoints+1E4h
        mov eax, RinkMarkingPoints+474h
        call DrawRubberEdge
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawFaceoffCircle                               22B3C  96 PC, low confidence
; Draws a faceoff circle with its marks
;-----------------------------------------------------------------------------
DrawFaceoffCircle:
        push ebx
        push ecx
        push esi
        push edi
        enter 0B0h, 0
        sub ebp, 82h
        mov edi, eax
        mov dword [byte ebp+072h], edx
        mov eax, dword [byte eax+08h]
        cmp eax, dword [RinkMarkingModel]
        jl near DrawFaceoffCircle_1DF
        push RinkMarkingPoints+64h
        push edi
        push IcePolyBuffer
        push byte 20h
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+594h
        push RinkMarkingPoints+64h
        push byte 20h
        mov dword [byte ebp+076h], RinkMarkingPoints+594h
        xor esi, esi
        call ProjectPointList
        mov eax, RinkMarkingPoints+64h
        add esp, byte 0Ch
.1:
        push dword [NeutralSpotModel]
        lea ecx, [byte eax+0Ch]
        push dword [MarkingAATable]
        mov dword [byte ebp+07Ah], ecx
        mov ecx, dword [byte ebp+076h]
        mov ebx, eax
        add ecx, byte 8
        mov eax, dword [byte ebp+076h]
        mov dword [byte ebp+07Eh], ecx
        mov ecx, dword [byte ebp+07Ah]
        mov edx, dword [byte ebp+07Eh]
        add esi, byte 4
        call DrawThickSegmentVisible
        mov ecx, dword [byte ebp+07Eh]
        mov dword [byte esi+ebp-032h], eax
        mov eax, dword [byte ebp+07Ah]
        mov dword [byte ebp+076h], ecx
        cmp esi, byte 7Ch
        jne short .1
        mov ecx, RinkMarkingPoints+64h
        mov edx, RinkMarkingPoints+594h
        push dword [NeutralSpotModel]
        mov ebx, eax
        push dword [MarkingAATable]
        mov eax, dword [byte ebp+07Eh]
        call DrawThickSegmentVisible
        mov dword [byte esi+ebp-02Eh], eax
        lea eax, [byte ebp-02Eh]
        mov ecx, RinkMarkingPoints+314h
        push eax
        mov ebx, 20h
        mov edx, RinkMarkingPoints+594h
        push dword [FatLineAATable]
        mov eax, RinkMarkingPoints+64h
        call DrawLineListClipped
        cmp dword [byte ebp+072h], byte 0
        je near DrawFaceoffCircle_1DF
        push RinkMarkingPoints+414h
        push edi
        push RinkMarkingPoints+534h
        push byte 8
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+24h
        push RinkMarkingPoints+414h
        push byte 8
        call ProjectPointList
        mov ecx, dword [MarkingAATable]
        mov esi, dword [NeutralSpotModel]
        mov eax, dword [RinkMarkingPoints+41Ch]
        add esp, byte 0Ch
        cmp eax, dword [NearClipZ]
        jg short .3
.2:
        xor eax, eax
        jmp short .4
.3:
        mov eax, dword [RinkMarkingPoints+428h]
        cmp eax, dword [NearClipZ]
        jle short .2
        mov ebx, RinkMarkingPoints+414h
        push esi
        mov edx, RinkMarkingPoints+2Ch
        mov eax, RinkMarkingPoints+24h
        call DrawThickSegment
.4:
        mov ecx, eax
        xor eax, eax
.5:
        add eax, byte 4
        mov dword [byte eax+ebp+04Eh], ecx
        cmp eax, byte 10h
        jne short .5
        mov esi, 4
        mov ecx, dword [MarkingAATable]
        mov eax, dword [RinkMarkingPoints+44Ch]
        mov edi, dword [NeutralSpotModel]
        cmp eax, dword [NearClipZ]
        jg short .7
.6:
        xor eax, eax
        jmp short .8
.7:
        mov eax, dword [RinkMarkingPoints+458h]
        cmp eax, dword [NearClipZ]
        jle short .6
        mov ebx, RinkMarkingPoints+444h
        push edi
        mov edx, RinkMarkingPoints+4Ch
        mov eax, RinkMarkingPoints+44h
        call DrawThickSegment
.8:
        mov ecx, eax
        mov eax, esi
        shl eax, 2
        jmp short .10
.9:
        add eax, byte 4
        inc esi
        mov dword [byte eax+ebp+04Eh], ecx
.10:
        cmp eax, byte 20h
        jl short .9
        lea eax, [byte ebp+052h]
        mov ecx, FaceoffCircleOrder
        push eax
        mov ebx, 4
        mov edx, RinkMarkingPoints+24h
        push dword [FatLineAATable]
        mov eax, RinkMarkingPoints+414h
        call DrawLineList
DrawFaceoffCircle_1DF:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawCentreMarkings                              22D27  96 PC, low confidence
; Draws the centre ice circle and line
;-----------------------------------------------------------------------------
DrawCentreMarkings:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 28h, 0
        push RinkMarkingPoints+64h
        push eax
        push CentreIcePoly
        push byte 9
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+594h
        push RinkMarkingPoints+64h
        push byte 9
        xor esi, esi
        call ProjectPointList
        mov eax, RinkMarkingPoints+594h
        mov ebx, RinkMarkingPoints+64h
        add esp, byte 0Ch
.1:
        push dword [NeutralSpotModel]
        lea edx, [byte ebx+0Ch]
        lea edi, [byte eax+08h]
        push dword [MarkingAATable]
        mov dword [byte ebp-04h], edx
        mov ecx, edx
        mov edx, edi
        add esi, byte 4
        call DrawThickSegmentVisible
        mov ebx, dword [byte ebp-04h]
        mov dword [byte esi+ebp-02Ch], eax
        mov eax, edi
        cmp esi, byte 20h
        jne short .1
        push dword [NeutralSpotModel]
        lea ecx, [byte ebx-0Ch]
        push dword [MarkingAATable]
        lea edx, [byte edi-08h]
        call DrawThickSegmentVisible
        mov dword [byte esi+ebp-028h], eax
        lea eax, [byte ebp-028h]
        mov ecx, RinkMarkingPoints+314h
        push eax
        mov ebx, 8
        mov edx, RinkMarkingPoints+594h
        push dword [FatLineAATable]
        mov eax, RinkMarkingPoints+64h
        call DrawLineList
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawEndZoneMarkings                             22DD7  96 PC, low confidence
; Draws one end zone's goal line, crease and marks
;-----------------------------------------------------------------------------
DrawEndZoneMarkings:
        push ebx
        push ecx
        push esi
        push edi
        enter 0B8h, 0
        sub ebp, 82h
        mov edi, eax
        test edx, edx
        je near .4
        mov dword [byte ebp+076h], IceLinePolys
        mov esi, RinkMarkingPoints+64h
        mov dword [byte ebp+066h], 0
.1:
        push esi
        push dword [byte ebp+076h]
        inc dword [byte ebp+066h]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+076h], byte 0Ch
        call SubVec3
        add esp, byte 0Ch
        cmp dword [byte ebp+066h], byte 9
        jl short .1
        mov dword [byte ebp+06Eh], RinkMarkingPoints+224h
        mov dword [byte ebp+07Ah], 0
.2:
        push esi
        push dword [byte ebp+06Eh]
        inc dword [byte ebp+07Ah]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+06Eh], byte 0Ch
        call SubVec3
        add esp, byte 0Ch
        cmp dword [byte ebp+07Ah], byte 6
        jl short .2
        mov dword [byte ebp+06Ah], RinkMarkingPoints+26Ch
        mov dword [byte ebp+072h], 0
.3:
        push esi
        push dword [byte ebp+06Ah]
        inc dword [byte ebp+072h]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+06Ah], byte 0Ch
        call SubVec3
        add esp, byte 0Ch
        cmp dword [byte ebp+072h], byte 6
        jge short .5
        jmp short .3
.4:
        push RinkMarkingPoints+64h
        push eax
        push IceLinePolys
        push byte 9
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+0D0h
        push edi
        push RinkMarkingPoints+224h
        push byte 6
        call DrawPolyOutline
        add esp, byte 10h
        push RinkMarkingPoints+118h
        push edi
        push RinkMarkingPoints+26Ch
        push byte 6
        call DrawPolyOutline
        add esp, byte 10h
.5:
        push RinkMarkingPoints+594h
        push RinkMarkingPoints+64h
        push byte 9
        call ProjectPointList
        add esp, byte 0Ch
        push RinkMarkingPoints+5DCh
        push RinkMarkingPoints+0D0h
        push byte 6
        call ProjectPointList
        add esp, byte 0Ch
        push RinkMarkingPoints+60Ch
        push RinkMarkingPoints+118h
        push byte 6
        xor esi, esi
        call ProjectPointList
        mov eax, RinkMarkingPoints+594h
        mov ebx, RinkMarkingPoints+64h
        add esp, byte 0Ch
.6:
        push dword [NeutralSpotModel]
        lea edx, [byte ebx+0Ch]
        lea edi, [byte eax+08h]
        push dword [MarkingAATable]
        mov dword [byte ebp+07Eh], edx
        mov ecx, edx
        mov edx, edi
        add esi, byte 4
        call DrawThickSegmentVisible
        mov ebx, dword [byte ebp+07Eh]
        mov dword [byte esi+ebp+03Eh], eax
        mov eax, edi
        cmp esi, byte 20h
        jne short .6
        mov ecx, dword [byte ebp+07Eh]
        push dword [NeutralSpotModel]
        sub ebx, byte 0Ch
        lea eax, [byte edi-08h]
        push dword [MarkingAATable]
        mov edx, edi
        call DrawThickSegmentVisible
        xor ebx, ebx
        mov dword [byte esi+ebp+042h], eax
        xor esi, esi
        xor eax, eax
.7:
        cmp dword [dword esi+RinkMarkingPoints+6Ch], byte 50h
        jle short .8
        mov edx, dword [dword eax+RinkMarkingPoints+594h]
        sar edx, 10h
        add esi, byte 0Ch
        mov dword [byte eax+ebp-036h], edx
        mov edx, dword [dword eax+RinkMarkingPoints+598h]
        add eax, byte 8
        sar edx, 10h
        inc ebx
        mov dword [byte eax+ebp-03Ah], edx
        cmp eax, byte 48h
        jl short .7
.8:
        cmp ebx, byte 9
        jne short .9
        lea eax, [byte ebp-036h]
        push eax
        push ebx
        push dword [RinkCreaseMaterial]
        call FillPolygon
        add esp, byte 0Ch
.9:
        lea eax, [byte ebp+042h]
        mov ecx, RinkMarkingPoints+314h
        push eax
        mov ebx, 8
        mov edx, RinkMarkingPoints+594h
        push dword [FatLineAATable]
        mov eax, RinkMarkingPoints+64h
        call DrawLineList
        mov ecx, dword [MarkingAATable]
        mov eax, dword [RinkMarkingPoints+0E4h]
        mov edx, dword [NeutralSpotModel]
        cmp eax, dword [NearClipZ]
        jg short .11
.10:
        xor eax, eax
        jmp short .12
.11:
        mov eax, dword [RinkMarkingPoints+0F0h]
        cmp eax, dword [NearClipZ]
        jle short .10
        mov ebx, RinkMarkingPoints+0DCh
        push edx
        mov eax, RinkMarkingPoints+5E4h
        mov edx, RinkMarkingPoints+5ECh
        call DrawThickSegment
.12:
        mov edx, eax
        xor eax, eax
.13:
        add eax, byte 4
        mov dword [byte eax+ebp+03Eh], edx
        cmp eax, byte 0Ch
        jne short .13
        mov esi, 3
        mov ecx, dword [MarkingAATable]
        mov edx, dword [RinkMarkingPoints+108h]
        mov eax, dword [NeutralSpotModel]
        cmp edx, dword [NearClipZ]
        jg short .15
.14:
        xor eax, eax
        jmp short .16
.15:
        mov edx, dword [RinkMarkingPoints+114h]
        cmp edx, dword [NearClipZ]
        jle short .14
        mov ebx, RinkMarkingPoints+100h
        push eax
        mov edx, RinkMarkingPoints+604h
        mov eax, RinkMarkingPoints+5FCh
        call DrawThickSegment
.16:
        mov ebx, eax
        mov eax, esi
        shl eax, 2
        jmp short .18
.17:
        add eax, byte 4
        inc esi
        mov dword [byte eax+ebp+03Eh], ebx
.18:
        cmp eax, byte 18h
        jl short .17
        lea eax, [byte ebp+042h]
        mov ecx, EndZoneOrder
        push eax
        mov ebx, 2
        mov edx, RinkMarkingPoints+5DCh
        push dword [FatLineAATable]
        mov eax, RinkMarkingPoints+0D0h
        call DrawLineList
        lea eax, [byte ebp+042h]
        mov ecx, EndZoneOrder
        mov ebx, 2
        push eax
        mov edx, RinkMarkingPoints+5F4h
        mov eax, RinkMarkingPoints+0F4h
        push dword [FatLineAATable]
        mov esi, 0B4h
        call DrawLineList
        xor ebx, ebx
        xor eax, eax
.19:
        cmp dword [dword esi+RinkMarkingPoints+6Ch], byte 50h
        jle short .20
        mov edx, dword [dword eax+RinkMarkingPoints+60Ch]
        sar edx, 10h
        add esi, byte 0Ch
        mov dword [byte eax+ebp+012h], edx
        mov edx, dword [dword eax+RinkMarkingPoints+610h]
        add eax, byte 8
        sar edx, 10h
        inc ebx
        mov dword [byte eax+ebp+0Eh], edx
        cmp eax, byte 30h
        jl short .19
.20:
        cmp ebx, byte 6
        jne near DrawFaceoffCircle_1DF
        lea eax, [byte ebp+012h]
        push eax
        push ebx
        push dword [RinkCreaseMaterial]
        call FillPolygon
        add esp, byte 0Ch
        jmp near DrawFaceoffCircle_1DF
;-----------------------------------------------------------------------------
; FindNearestGlass                             23106  96 PC, medium confidence
; (pos, &side, &face): the glass face of the 18 rink sides (GlassPanelList, 88h
; each) whose edge midpoint is nearest
;-----------------------------------------------------------------------------
FindNearestGlass:
        push ecx
        push esi
        push edi
        enter 38h, 0
        push eax
        push edx
        push ebx
        mov dword [byte ebp-04h], GlassPanelList
        mov dword [byte ebp-014h], 7FFFFFFFh
        mov dword [edx], 0FFFFFFFFh
        mov dword [byte ebp-08h], 0
        mov dword [ebx], 0FFFFFFFFh
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+020h]
        mov edx, SideGlassPoints
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-010h], edx
        jmp near .4
.2:
        mov eax, dword [byte ebp-010h]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        imul esi, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        lea edi, [byte ebp-020h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-02Ch]
        add esi, edx
        mov eax, dword [byte ebp-020h]
        movsd
        movsd
        movsd
        add eax, dword [byte ebp-02Ch]
        sar eax, 1
        mov dword [byte ebp-038h], eax
        mov eax, dword [byte ebp-01Ch]
        add eax, dword [byte ebp-028h]
        sar eax, 1
        mov dword [byte ebp-034h], eax
        mov eax, dword [byte ebp-018h]
        add eax, dword [byte ebp-024h]
        sar eax, 1
        mov edx, dword [byte ebp-03Ch]
        mov dword [byte ebp-030h], eax
        sub eax, dword [byte edx+08h]
        push eax
        mov eax, dword [byte ebp-038h]
        sub eax, dword [edx]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-014h]
        jge short .3
        mov esi, dword [byte ebp-040h]
        mov edx, dword [byte ebp-08h]
        mov dword [esi], edx
        mov esi, dword [byte ebp-044h]
        mov edx, dword [byte ebp-0Ch]
        mov dword [byte ebp-014h], eax
        mov dword [esi], edx
.3:
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-010h], byte 4
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-0Ch]
        cmp eax, dword [byte edx+014h]
        jl near .2
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 12h
        jl near .1
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push ecx
        mov ecx, dword [eax]
        add ecx, dword [edx]
        sar ecx, 1
        mov dword [ebx], ecx
        mov ecx, dword [byte eax+04h]
        add ecx, dword [byte edx+04h]
        sar ecx, 1
        mov dword [byte ebx+04h], ecx
        mov eax, dword [byte eax+08h]
        add eax, dword [byte edx+08h]
        sar eax, 1
        mov dword [byte ebx+08h], eax
        pop ecx
        ret
;-----------------------------------------------------------------------------
; RandomTrianglePoint                          23218  96 PC, medium confidence
; A random point on a triangle (random weights), for the glass shards
;-----------------------------------------------------------------------------
RandomTrianglePoint:
        push esi
        push edi
        enter 14h, 0
        mov edi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-0Ch], ebx
        mov esi, ecx
        call Random32
        mov ebx, 0Bh
        xor edx, edx
        div ebx
        mov eax, edx
        mov ebx, 0A0000h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-04h], eax
        call Random32
        mov ebx, 0Bh
        xor edx, edx
        div ebx
        mov eax, edx
        mov ebx, 0A0000h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, dword [byte ebp-010h]
        add edx, eax
        mov ebx, eax
        cmp edx, 10000h
        jle short .1
        mov edx, 10000h
        mov ebx, 10000h
        sub edx, dword [byte ebp-010h]
        sub ebx, eax
        mov dword [byte ebp-04h], edx
.1:
        mov ecx, 10000h
        sub ecx, dword [byte ebp-04h]
        sub ecx, ebx
        mov edx, dword [edi]
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [edx]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [byte ebp-0Ch]
        mov eax, ebx
        mov edx, dword [edx]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [esi], edx
        mov eax, ecx
        mov edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte edx+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [byte ebp-0Ch]
        mov eax, ebx
        mov edx, dword [byte edx+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte esi+04h], edx
        mov eax, ecx
        mov edx, dword [byte edi+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov ecx, eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte edx+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-0Ch]
        add ecx, eax
        mov eax, ebx
        mov edx, dword [byte edx+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov dword [byte esi+08h], ecx
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; AddGlassShard                                233A2  96 PC, medium confidence
; Adds a shard triangle (up to 6Ch at GlassShardVerts) with a random spin
;-----------------------------------------------------------------------------
AddGlassShard:
        push esi
        push edi
        mov esi, eax
        cmp dword [GlassShardCount], byte 6Ch
        jge short .1
        imul eax, dword [GlassShardCount], byte 24h
        add eax, GlassShardVerts
        mov edi, eax
        movsd
        movsd
        movsd
        mov esi, edx
        lea edi, [byte eax+0Ch]
        movsd
        movsd
        movsd
        mov esi, ebx
        lea edi, [byte eax+018h]
        mov eax, 3
        movsd
        movsd
        movsd
        call randomd0
        movsx edx, ax
        imul eax, dword [GlassShardCount], byte 0Ch
        dec edx
        mov dword [dword eax+GlassShards], edx
        mov eax, 3
        call randomd0
        movsx edx, ax
        imul eax, dword [GlassShardCount], byte 0Ch
        dec edx
        mov dword [dword eax+GlassShards+4], 0FFFFFFFFh
        inc dword [GlassShardCount]
        mov dword [dword eax+GlassShards+8], edx
.1:
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SplitGlassShards                             23419  96 PC, medium confidence
; Splits a triangle into shards, recursively (RandomTrianglePoint,
; AddGlassShard)
;-----------------------------------------------------------------------------
SplitGlassShards:
        push esi
        push edi
        enter 14h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        cmp ecx, byte 1
        jg short .1
        call AddGlassShard
        leave
        pop edi
        pop esi
        ret
.1:
        lea ecx, [byte ebp-014h]
        call RandomTrianglePoint
        mov ebx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        dec ebx
        mov edx, esi
        mov dword [byte ebp-08h], ebx
        mov ecx, ebx
        lea ebx, [byte ebp-014h]
        call SplitGlassShards
        mov ecx, dword [byte ebp-08h]
        lea ebx, [byte ebp-014h]
        mov edx, edi
        mov eax, esi
        call SplitGlassShards
        mov ecx, dword [byte ebp-08h]
        lea ebx, [byte ebp-014h]
        mov edx, dword [byte ebp-018h]
        mov eax, edi
        call SplitGlassShards
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; ShatterGlass                                 23476  96 PC, medium confidence
; Breaks the hit glass face (GlassHitFace) into shards
;-----------------------------------------------------------------------------
ShatterGlass:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        imul eax, dword [GlassHitFace], dword 88h
        add eax, GlassPanelList
        mov dword [GlassShardCount], 0
        mov edx, dword [GlassBreakY]
        mov dword [byte eax+024h], edx
        mov eax, dword [byte eax+020h]
        shl eax, 2
        add eax, SideGlassPoints
        mov edx, dword [eax+edx*4]
        mov edx, dword [byte edx+04h]
        xor eax, eax
.1:
        imul esi, dword [edx], byte 0Ch
        mov ebx, dword [RinkInstance]
        mov ebx, dword [byte ebx+070h]
        lea edi, [byte eax+ebp-060h]
        add esi, ebx
        add eax, byte 0Ch
        add edx, byte 4
        movsd
        movsd
        movsd
        cmp eax, byte 30h
        jne short .1
        lea ecx, [byte ebp-0Ch]
        lea ebx, [byte ebp-048h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call RandomTrianglePoint
        mov eax, dword [byte ebp-03Ch]
        add eax, dword [byte ebp-0Ch]
        sar eax, 1
        mov dword [byte ebp-030h], eax
        mov eax, dword [byte ebp-038h]
        add eax, dword [byte ebp-08h]
        sar eax, 1
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-034h]
        add eax, dword [byte ebp-04h]
        sar eax, 1
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-048h]
        add eax, dword [byte ebp-0Ch]
        sar eax, 1
        mov dword [byte ebp-024h], eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-08h]
        sar eax, 1
        mov dword [byte ebp-020h], eax
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-04h]
        sar eax, 1
        mov dword [byte ebp-01Ch], eax
        cmp dword [GlassBreakStep], byte 4
        jne short .3
        mov eax, dword [GlassBreakX]
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-02Ch]
        jge short .2
        mov eax, dword [byte ebp-02Ch]
        mov dword [byte ebp-020h], eax
.2:
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-060h]
        call AddGlassShard
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call AddGlassShard
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-030h]
        lea eax, [byte ebp-054h]
        call AddGlassShard
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-048h]
        lea eax, [byte ebp-054h]
        mov ecx, 4
        call AddGlassShard
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-048h]
        call SplitGlassShards
        mov ecx, 4
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-030h]
        lea eax, [byte ebp-03Ch]
        jmp short .4
.3:
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-060h]
        call SplitGlassShards
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call SplitGlassShards
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-048h]
        lea eax, [byte ebp-054h]
        call SplitGlassShards
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-048h]
.4:
        call SplitGlassShards
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; BreakGlass                                   235F2  96 PC, medium confidence
; (pos, kind): from FallDown and wallcollb: breaks the nearest glass
; (FindNearestGlass, ShatterGlass)
;-----------------------------------------------------------------------------
BreakGlass:
        push ebx
        push ecx
        push esi
        mov ecx, eax
        mov esi, edx
        mov ebx, GlassBreakY
        mov edx, GlassHitFace
        call FindNearestGlass
        cmp dword [GlassHitFace], byte 0FFFFFFFFh
        je short .1
        mov dword [GlassBroken], 1
        mov dword [GlassBreakPanel], 0
        mov dword [GlassBreakStep], esi
        mov ecx, dword [byte ecx+04h]
        mov dword [GlassBreakX], ecx
        call ShatterGlass
.1:
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ClearGlassHoles                              2363D  96 PC, medium confidence
; Clears the broken face of the 18 rink sides (StartReplay, EndReplay)
;-----------------------------------------------------------------------------
ClearGlassHoles:
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+178h], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
        ret
;-----------------------------------------------------------------------------
; ResetBrokenGlass                             23656  96 PC, medium confidence
; At the faceoff (puckfaceoff2): ends the falling shards and clears the
; broken glass
;-----------------------------------------------------------------------------
ResetBrokenGlass:
        cmp dword [GlassBroken], byte 0
        je short .2
        mov dword [GlassBroken], 0
        mov dword [GlassHitFace], 0FFFFFFFFh
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+178h], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
.2:
        ret
.3:
        mov ecx, 9
        mov edi, dword [byte ebp-04h]
        mov esi, dword [byte ebp-010h]
        rep movsd
        cmp eax, dword [GlassBreakStep]
        jl near .11
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-01Ch]
        lea esi, [dword esi+GlassShards]
        movsd
        movsd
        movsd
        xor esi, esi
        jmp near .10
.4:
        cmp esi, byte 14h
        jge short .5
        mov dword [byte ebp-018h], 1
        jmp short .6
.5:
        mov dword [byte ebp-018h], 0FFFFFFFCh
.6:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte edx+01Ch]
        jg short .7
        mov eax, dword [byte edx+010h]
        cmp eax, dword [byte edx+01Ch]
        jle short .8
.7:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-01Ch]
        add dword [edx], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+04h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+08h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+0Ch], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+010h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+014h], eax
        jmp near .9
.8:
        mov ebx, 0C0000h
        mov eax, dword [byte ebp-08h]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, eax
        mov eax, dword [byte ebp-01Ch]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov ebx, 0C0000h
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte ebp-08h]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, eax
        mov eax, dword [byte ebp-014h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov edx, dword [byte ebp-04h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [edx], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+04h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+08h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+0Ch], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+010h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+014h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+018h], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+01Ch], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+020h], eax
.9:
        inc esi
.10:
        cmp esi, dword [byte ebp-020h]
        jl near .4
.11:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+04h], byte 0
        jge short .12
        mov dword [byte eax+04h], 0
.12:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+010h], byte 0
        jge short .13
        mov dword [byte eax+010h], 0
.13:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+01Ch], byte 0
        jge short .14
        mov dword [byte eax+01Ch], 0
.14:
        add dword [byte ebp-0Ch], byte 0Ch
        inc dword [byte ebp-08h]
        add dword [byte ebp-010h], byte 24h
        add dword [byte ebp-04h], byte 24h
ResetBrokenGlass_1A8:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [GlassShardCount]
        jl near ResetBrokenGlass.3
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; StepGlassShards                                 23812  96 PC, low confidence
; From DrawGameFrame: moves the falling shards while glass is breaking
;-----------------------------------------------------------------------------
StepGlassShards:
        cmp dword [GlassBroken], byte 0
        jne near ReplayBrokenGlass_79
        ret
;-----------------------------------------------------------------------------
; ReplayBrokenGlass                               23820  96 PC, low confidence
; From DrawReplayView: breaks the glass the replay recorded (ReplayFrameState+133h)
; and moves the shards
;-----------------------------------------------------------------------------
ReplayBrokenGlass:
        cmp dword [ReplayFrameState+133h], byte 0
        jge short .2
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+178h], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
        mov dword [GlassHitFace], 0FFFFFFFFh
        ret
.2:
        cmp dword [ReplayFrameState+13Bh], byte 0
        jne short .3
        cmp dword [GlassHitFace], byte 0FFFFFFFFh
        je short .4
.3:
        cmp dword [GlassHitFace], byte 0FFFFFFFFh
        jne short .5
.4:
        mov eax, dword [ReplayFrameState+133h]
        mov dword [GlassHitFace], eax
        mov eax, dword [ReplayFrameState+137h]
        mov dword [GlassBreakY], eax
        mov eax, dword [ReplayFrameState+12Bh]
        mov dword [GlassBreakStep], eax
        mov eax, dword [ReplayFrameState+12Fh]
        mov dword [GlassBreakX], eax
        call ShatterGlass
.5:
        mov eax, dword [ReplayFrameState+13Bh]
ReplayBrokenGlass_79:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        push eax
        mov dword [byte ebp-010h], GlassShardVerts
        mov dword [byte ebp-04h], GlassShardScreen
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-0Ch], 0
        jmp near ResetBrokenGlass_1A8
;-----------------------------------------------------------------------------
; FindNearestGlassVertex                          238C4  96 PC, low confidence
; The vertex of the first 4 rink sides nearest a position
;-----------------------------------------------------------------------------
FindNearestGlassVertex:
        push ecx
        push esi
        push edi
        enter 18h, 0
        mov edi, eax
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ebx
        mov esi, GlassPanelList
        mov dword [byte ebp-010h], 7FFFFFFFh
        mov dword [edx], 0FFFFFFFFh
        mov dword [byte ebp-08h], 0
        mov dword [ebx], 0FFFFFFFFh
.1:
        mov eax, dword [dword esi+080h]
        mov edx, GlassPanelShake
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-0Ch], edx
        jmp short .4
.2:
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [eax]
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte edi+08h]
        mov eax, dword [eax]
        push edx
        sub eax, dword [edi]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-010h]
        jge short .3
        mov ebx, dword [byte ebp-018h]
        mov edx, dword [byte ebp-08h]
        mov dword [ebx], edx
        mov ebx, dword [byte ebp-014h]
        mov edx, dword [byte ebp-04h]
        mov dword [byte ebp-010h], eax
        mov dword [ebx], edx
.3:
        inc dword [byte ebp-04h]
        add dword [byte ebp-0Ch], byte 4
.4:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [dword esi+084h]
        jl short .2
        inc dword [byte ebp-08h]
        add esi, 88h
        cmp dword [byte ebp-08h], byte 4
        jl short .1
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ShakeGlass                                      23965  96 PC, low confidence
; (pos, strength): from FallDown: starts a glass shake at the nearest vertex
; for a time (GetTicks)
;-----------------------------------------------------------------------------
ShakeGlass:
        push ebx
        push ecx
        push esi
        enter 8, 0
        mov ecx, eax
        mov esi, edx
        test edx, edx
        jle near .6
        mov edx, dword [byte eax+08h]
        mov eax, dword [eax]
        call RinkEdgeKind
        cmp eax, dword [RinkB00FirstVert]
        jle near .6
        lea ebx, [byte ebp-08h]
        lea edx, [byte ebp-04h]
        mov eax, ecx
        call FindNearestGlass
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        je near .6
        cmp dword [byte ebp-04h], byte 4
        jge near .6
        cmp dword [GlassShakeOn], byte 0
        je short .1
        mov dword [GlassShakeOn], 0
        call ResetGlassShake
.1:
        mov ebx, GlassShakeStep
        mov edx, GlassShakeTimer
        mov eax, ecx
        call FindNearestGlassVertex
        cmp dword [GlassShakeTimer], byte 0FFFFFFFFh
        je near .6
        imul ecx, dword [GlassShakeTimer], dword 88h
        add ecx, GlassPanelList
        cmp dword [GlassShakeTimer], byte 0
        jne short .2
        cmp dword [GlassShakeStep], byte 4
        jl short .2
        mov eax, dword [GlassShakeStep]
        dec eax
        dec eax
        cmp eax, byte 4
        jge short .3
        mov eax, 4
        jmp short .3
.2:
        mov eax, dword [GlassShakeStep]
        dec eax
        dec eax
        test eax, eax
        jge short .3
        xor eax, eax
.3:
        mov dword [GlassShakeSide], eax
        cmp dword [GlassShakeTimer], byte 0
        jne short .4
        cmp dword [GlassShakeStep], byte 4
        jge short .4
        mov eax, dword [GlassShakeStep]
        inc eax
        inc eax
        cmp eax, byte 4
        jle short .5
        mov eax, 4
        jmp short .5
.4:
        mov eax, dword [dword ecx+084h]
        mov edx, dword [GlassShakeStep]
        dec eax
        inc edx
        inc edx
        cmp eax, edx
        jl short .5
        mov eax, edx
.5:
        mov dword [GlassShakeDir], eax
        mov dword [GlassShakeX], esi
        call GetTicks
        mov dword [GlassShakeOn], 1
        mov dword [GlassShakeY], eax
        mov dword [GlassBreakShards], eax
.6:
        leave
        pop esi
        pop ecx
        pop ebx
ShakeGlass_129:
        ret
.7:
        test ebx, ebx
        jne short .9
        mov ecx, dword [eax]
        mov edi, dword [RinkMinXGroup]
.8:
        mov dword [ecx], edi
        jmp short .13
.9:
        cmp ebx, byte 1
        jne short .10
        mov ecx, dword [eax]
        mov edi, dword [RinkMinZGroup]
        jmp short .12
.10:
        cmp ebx, byte 2
        jne short .11
        mov ecx, dword [eax]
        mov edi, dword [RinkMaxXGroup]
        jmp short .8
.11:
        mov ecx, dword [eax]
        mov edi, dword [RinkMaxZGroup]
.12:
        mov dword [byte ecx+08h], edi
.13:
        add eax, byte 4
        inc esi
ShakeGlass_167:
        cmp esi, dword [dword edx+084h]
        jl short ShakeGlass_129.7
        inc ebx
        add edx, 88h
        cmp ebx, byte 4
        jl short ResetGlassShake_C
        jmp near DrawRinkFrontParts_1A4
;-----------------------------------------------------------------------------
; StopGlassShake                                  23AE5  96 PC, low confidence
; From StartReplay: ends a glass shake
;-----------------------------------------------------------------------------
StopGlassShake:
        cmp dword [GlassShakeOn], byte 0
        je short ShakeGlass_129
        mov dword [GlassShakeOn], 0
;-----------------------------------------------------------------------------
; ResetGlassShake                                 23AF8  96 PC, low confidence
; Puts the shaken vertices back
;-----------------------------------------------------------------------------
ResetGlassShake:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edx, GlassPanelList
        xor ebx, ebx
ResetGlassShake_C:
        mov eax, dword [dword edx+080h]
        shl eax, 2
        xor esi, esi
        add eax, GlassPanelShake
        jmp short ShakeGlass_167
;-----------------------------------------------------------------------------
; ApplyGlassShake                                 23B16  96 PC, low confidence
; (ticks): from DrawGameFrame: moves the glass vertices by a fading wave
; (sine table SinTable)
;-----------------------------------------------------------------------------
ApplyGlassShake:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp dword [GlassShakeOn], byte 0
        je near DrawRinkFrontParts_1A3
        sub eax, dword [GlassShakeY]
        imul edx, eax, dword 258h
        mov ebx, dword [GlassShakeX]
        sub ebx, edx
        mov edx, ebx
        test ebx, ebx
        jge short .1
        cmp dword [GlassShakeOn], byte 0
        je near DrawRinkFrontParts_1A3
        mov dword [GlassShakeOn], 0
        call ResetGlassShake
        jmp near DrawRinkFrontParts_1A3
.1:
        shl eax, 4
        mov dword [byte ebp-04h], eax
        imul eax, dword [GlassShakeTimer], dword 88h
        add eax, GlassPanelList
        mov eax, dword [dword eax+080h]
        mov ebx, dword [GlassShakeSide]
        shl eax, 2
        shl ebx, 2
        add eax, GlassPanelShake
        add ebx, eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov esi, dword [GlassShakeSide]
        mov edi, eax
        jmp near .11
.2:
        mov eax, esi
        sub eax, dword [GlassShakeStep]
        test eax, eax
        jge short .3
        neg eax
.3:
        mov edx, dword [byte ebp-04h]
        shl eax, 7
        sub edx, eax
        mov eax, edx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        mov edx, eax
        mov eax, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, esi
        sub eax, dword [GlassShakeStep]
        test eax, eax
        jge short .4
        neg eax
.4:
        imul eax, dword 1388h
        mov edx, 10000h
        sub edx, eax
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp dword [GlassShakeTimer], byte 0
        jne short .6
        mov edx, dword [RinkMinXGroup]
        sub edx, eax
.5:
        mov eax, dword [ebx]
        mov dword [eax], edx
        jmp short .10
.6:
        cmp dword [GlassShakeTimer], byte 1
        jne short .7
        mov edx, dword [RinkMinZGroup]
        sub edx, eax
        jmp short .9
.7:
        cmp dword [GlassShakeTimer], byte 2
        jne short .8
        mov edx, dword [RinkMaxXGroup]
        add edx, eax
        jmp short .5
.8:
        cmp dword [GlassShakeTimer], byte 3
        jne short .10
        mov edx, dword [RinkMaxZGroup]
        add edx, eax
.9:
        mov eax, dword [ebx]
        mov dword [byte eax+08h], edx
.10:
        inc esi
        add ebx, byte 4
.11:
        cmp esi, dword [GlassShakeDir]
        jle near .2
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; ReplayGlassShake                                23C91  96 PC, low confidence
; (ticks): the glass shake the replay recorded (ReplayFrameState+11Eh)
;-----------------------------------------------------------------------------
ReplayGlassShake:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp byte [ReplayFrameState+11Eh], 0
        jne short .1
        call ResetGlassShake
        jmp near DrawRinkFrontParts_1A3
.1:
        imul edx, dword [ReplayFrameState+127h], dword 258h
        mov eax, dword [ReplayFrameState+123h]
        sub eax, edx
        mov edx, eax
        test eax, eax
        jl near DrawRinkFrontParts_1A3
        mov eax, dword [ReplayFrameState+127h]
        shl eax, 4
        mov dword [byte ebp-04h], eax
        movsx eax, byte [ReplayFrameState+11Fh]
        imul eax, dword 88h
        add eax, GlassPanelList
        mov eax, dword [dword eax+080h]
        mov ebx, GlassPanelShake
        shl eax, 2
        add ebx, eax
        movsx eax, byte [ReplayFrameState+121h]
        shl eax, 2
        add ebx, eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        movsx esi, byte [ReplayFrameState+121h]
        mov edi, eax
        jmp near .11
.2:
        movsx eax, byte [ReplayFrameState+120h]
        mov edx, esi
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .3
        neg eax
.3:
        mov edx, dword [byte ebp-04h]
        shl eax, 7
        sub edx, eax
        mov eax, edx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        xor eax, edx
        sub eax, edx
        mov edx, eax
        mov eax, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov edx, esi
        movsx eax, byte [ReplayFrameState+120h]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .4
        neg eax
.4:
        imul eax, dword 1388h
        mov edx, 10000h
        sub edx, eax
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp byte [ReplayFrameState+11Fh], 0
        jne short .6
        mov edx, dword [RinkMinXGroup]
        sub edx, eax
.5:
        mov eax, dword [ebx]
        mov dword [eax], edx
        jmp short .10
.6:
        movsx edx, byte [ReplayFrameState+11Fh]
        cmp edx, byte 1
        jne short .7
        mov edx, dword [RinkMinZGroup]
        sub edx, eax
        jmp short .9
.7:
        cmp edx, byte 2
        jne short .8
        mov edx, dword [RinkMaxXGroup]
        add edx, eax
        jmp short .5
.8:
        cmp edx, byte 3
        jne short .10
        mov edx, dword [RinkMaxZGroup]
        add edx, eax
.9:
        mov eax, dword [ebx]
        mov dword [byte eax+08h], edx
.10:
        inc esi
        add ebx, byte 4
.11:
        movsx eax, byte [ReplayFrameState+122h]
        cmp esi, eax
        jle near .2
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; RinkEdgeKind                                    23E06  96 PC, low confidence
; (x, y): which rink edge a position is at, by the rink extents
; (RinkGt007LastVert, RinkGt004LastVert)
;-----------------------------------------------------------------------------
RinkEdgeKind:
        push ebx
        mov ebx, eax
        movsx eax, dx
        cmp eax, dword [RinkGt007LastVert]
        jl short .2
.1:
        mov eax, dword [RinkGt302FirstVert]
        pop ebx
        ret
.2:
        mov edx, dword [RinkGt007LastVert]
        neg edx
        cmp eax, edx
        jle short .1
        test bx, bx
        jg short .3
        cmp eax, dword [RinkGt004LastVert]
        jge short .3
        mov edx, dword [RinkGt004LastVert]
        neg edx
        cmp eax, edx
        jle short .3
        mov eax, dword [RinkB00FirstVert]
        pop ebx
        ret
.3:
        mov eax, dword [RinkGt004FirstVert]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NearestGlassPoint                               23E4E  96 PC, low confidence
; (pos, out): the midpoint of the nearest glass edge; 0 when the position is
; not at the glass
;-----------------------------------------------------------------------------
NearestGlassPoint:
        push ebx
        push ecx
        push esi
        push edi
        enter 20h, 0
        mov esi, eax
        mov ecx, edx
        movsx edx, word [byte eax+08h]
        movsx eax, word [eax]
        call RinkEdgeKind
        cmp eax, dword [RinkB00FirstVert]
        jne short .2
.1:
        xor eax, eax
        jmp near DrawBenchPlayers_F6
.2:
        mov dword [byte ecx+08h], 0
        mov eax, dword [byte ecx+08h]
        lea ebx, [byte ebp-04h]
        mov dword [byte ecx+04h], eax
        lea edx, [byte ebp-08h]
        mov dword [ecx], eax
        mov eax, esi
        call FindNearestGlass
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .1
        imul eax, dword [byte ebp-08h], dword 88h
        add eax, GlassPanelList
        mov edx, dword [byte eax+020h]
        shl edx, 2
        mov eax, dword [byte ebp-04h]
        add edx, SideGlassPoints
        mov eax, dword [edx+eax*4]
        mov eax, dword [byte eax+04h]
        imul ebx, dword [eax], byte 0Ch
        mov esi, dword [RinkInstance]
        mov edx, dword [byte esi+070h]
        lea edi, [byte ebp-014h]
        lea esi, [edx+ebx]
        add eax, byte 4
        movsd
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-020h]
        add esi, edx
        mov eax, dword [byte ebp-014h]
        movsd
        movsd
        movsd
        add eax, dword [byte ebp-020h]
        sar eax, 1
        mov dword [ecx], eax
        mov eax, dword [byte ebp-010h]
        add eax, dword [byte ebp-01Ch]
        sar eax, 1
        mov dword [byte ecx+04h], eax
        mov eax, dword [byte ebp-0Ch]
        add eax, dword [byte ebp-018h]
        sar eax, 1
        mov dword [byte ecx+08h], eax
        mov eax, 1
        jmp near DrawBenchPlayers_F6
;-----------------------------------------------------------------------------
; StartGoalLight                                  23F05  96 PC, low confidence
; (side, ticks): from Goal: turns the goal light of a side on for 258h ticks
;-----------------------------------------------------------------------------
StartGoalLight:
        push ebx
        mov ebx, eax
        mov dword [ZamboniState+54h], 0
        mov dword [ZamboniState+58h], 0
        mov dword [GoalLightLit], eax
        mov dword [GoalLightTime], edx
        mov dword [ZamboniState+54h], 1
        xor eax, eax
.1:
        test ebx, ebx
        je short .2
        mov edx, dword [RinkMinZGroup]
        jmp short .3
.2:
        mov edx, dword [RinkMaxZGroup]
.3:
        add eax, byte 0Ch
        mov dword [dword eax+LastButtonCode], edx
        cmp eax, byte 30h
        jne short .1
        pop ebx
        ret
        mov dword [ZamboniState+54h], 0
        mov dword [ZamboniState+58h], 0
        ret
;-----------------------------------------------------------------------------
; UpdateGoalLight                                 23F6A  96 PC, low confidence
; (ticks): from DrawGameFrame: the goal light's flashing, off after 258h
; ticks
;-----------------------------------------------------------------------------
UpdateGoalLight:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        cmp dword [ZamboniState+54h], byte 0
        je near DrawRinkFrontParts_1A3
        sub eax, dword [GoalLightTime]
        cmp eax, 258h
        jle short .1
        mov dword [ZamboniState+54h], 0
        mov dword [ZamboniState+58h], 0
        jmp near DrawRinkFrontParts_1A3
.1:
        imul edi, eax, dword 0C4h
        push edi
        call SinInterp
        add esp, byte 4
        mov esi, eax
        test eax, eax
        jge short .2
        neg eax
.2:
        push eax
        push dword 0FFh
        push dword 0C8h
        call FixedLerp
        add esp, byte 0Ch
        test esi, esi
        jge short .3
        mov edx, esi
        neg edx
        jmp short .4
.3:
        mov edx, esi
.4:
        mov eax, 0C8h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [ZamboniState+58h], 0
        test esi, esi
        je near DrawRinkFrontParts_1A3
        lea eax, [dword edi+01999h]
        push eax
        mov dword [byte ebp-04h], eax
        call SinInterp
        add esp, byte 4
        mov dword [byte ebp-08h], eax
        test eax, eax
        je near DrawRinkFrontParts_1A3
        push edi
        call CosInterp
        add esp, byte 4
        push dword [byte ebp-04h]
        mov edi, eax
        call CosInterp
        add esp, byte 4
        mov dword [byte ebp-0Ch], eax
        test esi, esi
        setg al
        movzx eax, al
        mov edx, eax
        cmp dword [byte ebp-08h], byte 0
        setg al
        movzx eax, al
        cmp edx, eax
        jne near DrawRinkFrontParts_1A3
        imul eax, edi, byte 28h
        mov ebx, esi
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edi, eax
        imul eax, dword [byte ebp-0Ch], byte 28h
        mov ebx, dword [byte ebp-08h]
        sar edi, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov esi, eax
        mov dword [ZamboniState+58h], 1
        sar esi, 10h
        cmp edi, dword [ZamboniState+50h]
        jle short .5
        mov edi, dword [ZamboniState+50h]
        jmp short .6
.5:
        mov eax, dword [ZamboniState+50h]
        neg eax
        cmp edi, eax
        jge short .6
        mov edi, eax
.6:
        cmp esi, dword [ZamboniState+50h]
        jle short .7
        mov esi, dword [ZamboniState+50h]
        jmp short .8
.7:
        mov eax, dword [ZamboniState+50h]
        neg eax
        cmp esi, eax
        jge short .8
        mov esi, eax
.8:
        mov dword [GoalLightLamp], edi
        mov dword [GoalLightTimerFar], esi
        mov dword [GoalLightFrame], esi
        mov dword [GoalLightOn], edi
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawSpriteAtVertex                              240F4  96 PC, low confidence
; Draws a scaled sprite at a rink vertex (SpriteScale)
;-----------------------------------------------------------------------------
DrawSpriteAtVertex:
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, dword [edx]
        imul edx, dword [edx], byte 0Ch
        mov eax, dword [RinkInstance]
        mov ebx, dword [byte eax+07Ch]
        mov eax, dword [byte eax+078h]
        shl esi, 3
        push dword [byte edx+eax+08h]
        add esi, ebx
        call SpriteScale
        mov ebx, eax
        add esp, byte 4
        movsx eax, word [byte edi+04h]
        mov edx, ebx
        sar eax, 1
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [esi]
        push dword [byte esi+04h]
        sub edx, eax
        push edx
        push edi
        push ebx
        call DrawArtScaledHotspot
        add esp, byte 10h
        pop edi
        pop esi
        pop ecx
        pop ebx
DrawSpriteAtVertex_55:
        ret
;-----------------------------------------------------------------------------
; DrawGoalLight                                   2414A  96 PC, low confidence
; Draws the lit goal light (4 points at GoalLightLamp)
;-----------------------------------------------------------------------------
DrawGoalLight:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        cmp dword [ZamboniState+58h], byte 0
        je near DrawRinkFrontParts_1A3
        cmp dword [InReplay], byte 0
        jne near DrawRinkFrontParts_1A3
        lea eax, [byte ebp-010h]
        push eax
        push FlashPolys
        push CameraFlashOn
        call TransformVector
        add esp, byte 0Ch
        lea eax, [byte ebp-060h]
        push eax
        push FlashPolys
        push GoalLightLamp
        push byte 4
        lea esi, [byte ebp-060h]
        xor edi, edi
        call DrawFlatPoly
        add esp, byte 10h
.1:
        imul eax, edi, byte 0Ch
        push esi
        mov dword [byte ebp-04h], eax
        lea eax, [byte ebp-010h]
        push eax
        push esi
        call SubVec3
        mov eax, dword [byte ebp-04h]
        add esp, byte 0Ch
        cmp dword [byte eax+ebp-058h], byte 50h
        jl near DrawRinkFrontParts_1A3
        inc edi
        add esi, byte 0Ch
        cmp edi, byte 4
        jl short .1
        push byte 10h
        lea eax, [byte ebp-030h]
        push eax
        lea eax, [byte ebp-060h]
        push eax
        push byte 4
        call ProjectPointsPersp
        add esp, byte 10h
        lea eax, [byte ebp-030h]
        push eax
        push dword [ZamboniState+4Ch]
        call DrawPolyList
DrawGoalLight_A4:
        add esp, byte 8
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; TransformRink                                   241F6  96 PC, low confidence
; Transforms the rink vertices and sets which rink ends face the camera
;-----------------------------------------------------------------------------
TransformRink:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        push byte 0
        mov eax, dword [RinkInstance]
        push dword [byte eax+07Ch]
        push dword [byte eax+078h]
        call SetRinkView
        mov eax, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp eax, dword [RinkMinXGroup]
        setge al
        movzx eax, al
        mov dword [RinkSideStructs], eax
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMinZGroup]
        setge al
        movzx eax, al
        mov dword [RinkSideStructs+88h], eax
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        setle al
        movzx eax, al
        mov dword [RinkSideStructs+110h], eax
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMaxZGroup]
        setle al
        mov esi, GlassPanelList
        movzx eax, al
        xor edi, edi
        mov dword [RinkSideStructs+198h], eax
.1:
        mov eax, dword [byte esi+018h]
        mov edx, RinkFloorPoints
        shl eax, 2
        mov dword [byte ebp-04h], 0
        add edx, eax
        mov dword [esi], 0
        mov dword [byte ebp-08h], edx
        jmp short .3
.2:
        mov eax, dword [byte ebp-08h]
        mov eax, dword [eax]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        sete al
        movzx eax, al
        mov dword [esi], eax
        test eax, eax
        jne short .4
        inc dword [byte ebp-04h]
        add dword [byte ebp-08h], byte 4
.3:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+0Ch]
        jl short .2
.4:
        cmp dword [byte esi+04h], byte 0
        sete al
        add esi, 88h
        movzx eax, al
        inc edi
        mov dword [byte esi-080h], eax
        cmp edi, byte 4
        jge short .7
        jmp short .1
.5:
        mov eax, dword [byte esi+018h]
        mov eax, dword [nosplit eax*4+RinkFloorPoints]
        push dword [byte eax+04h]
        push byte 4
        mov dword [byte ebp-0Ch], eax
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        sete al
        movzx eax, al
        mov dword [esi], eax
        test eax, eax
        je short .6
        mov eax, dword [byte ebp-0Ch]
        push dword [byte eax+04h]
        call ProjectRinkObject
        add esp, byte 4
        test eax, eax
        setl al
        movzx eax, al
        mov dword [byte esi+04h], eax
.6:
        add esi, 88h
        inc edi
        mov dword [byte esi-080h], 0
.7:
        cmp edi, byte 12h
        jl short .5
        cmp dword [RinkSideStructs+4], byte 0
        jne short .8
        cmp dword [RinkSideStructs+8Ch], byte 0
        je short .10
.8:
        mov eax, 220h
.9:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+15Ch], 1
        cmp eax, 3B8h
        jne short .9
.10:
        cmp dword [RinkSideStructs+8Ch], byte 0
        jne short .11
        cmp dword [RinkSideStructs+114h], byte 0
        je short .13
.11:
        mov eax, 3B8h
.12:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+15Ch], 1
        cmp eax, 550h
        jne short .12
.13:
        cmp dword [RinkSideStructs+114h], byte 0
        jne short .14
        cmp dword [RinkSideStructs+19Ch], byte 0
        je short .16
.14:
        mov eax, 550h
.15:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+15Ch], 1
        cmp eax, 6E8h
        jne short .15
.16:
        cmp dword [RinkSideStructs+19Ch], byte 0
        jne short .17
        cmp dword [RinkSideStructs+4], byte 0
        je near DrawRinkFrontParts_1A3
.17:
        mov eax, 6E8h
.18:
        add eax, 88h
        mov dword [dword eax+RinkSideTables+15Ch], 1
        cmp eax, 880h
        jne short .18
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawGlassFrameLines                             243ED  96 PC, low confidence
; Draws the glass frame lines, clipped to the camera
;-----------------------------------------------------------------------------
DrawGlassFrameLines:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 44h, 0
        push eax
        mov eax, dword [RinkInstance]
        mov dword [byte ebp-04h], GlassPanelList
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne near .5
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-014h], eax
        jmp near .4
.2:
        mov eax, dword [byte ebp-014h]
        mov eax, dword [byte eax+030h]
        imul esi, eax, byte 0Ch
        mov ebx, dword [byte ebp-014h]
        lea edi, [byte ebp-038h]
        add esi, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebx+034h]
        movsd
        movsd
        movsd
        imul esi, ebx, byte 0Ch
        lea edi, [byte ebp-044h]
        add esi, dword [byte ebp-0Ch]
        movsd
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-02Ch]
        add esi, eax
        lea ecx, [byte ebp-044h]
        lea edx, [byte ebp-024h]
        movsd
        movsd
        shl ebx, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-024h]
        add esi, ebx
        lea eax, [byte ebp-02Ch]
        lea ebx, [byte ebp-038h]
        movsd
        movsd
        call ClipLineToNear
        test eax, eax
        je short .3
        push dword [BenchLineModel]
        lea eax, [byte ebp-038h]
        push eax
        call PerspScale
        add esp, byte 8
        mov esi, eax
        push dword [BenchLineModel]
        lea eax, [byte ebp-044h]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        push esi
        push dword [TopBoardsAATable]
        push dword [byte ebp-020h]
        push dword [byte ebp-024h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call DrawFixedLine
        add esp, byte 1Ch
.3:
        add dword [byte ebp-014h], byte 8
        inc dword [byte ebp-018h]
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        cmp eax, dword [byte edx+028h]
        jl near .2
.5:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .8
        jmp near .1
.6:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je short .7
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne short .7
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+030h]
        mov dword [byte ebp-01Ch], eax
        imul eax, byte 0Ch
        push dword [BenchLineModel]
        add eax, dword [byte ebp-0Ch]
        mov edi, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte edi+034h]
        call PerspScale
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [BenchLineModel]
        add eax, dword [byte ebp-0Ch]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        mov eax, edi
        push esi
        shl eax, 3
        push dword [TopBoardsAATable]
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        mov eax, dword [byte ebp-01Ch]
        shl eax, 3
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        call DrawFixedLine
        add esp, byte 1Ch
.7:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.8:
        cmp dword [byte ebp-08h], byte 10h
        jl near .6
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawBoardTopLines                               2458D  96 PC, low confidence
; Draws the lines along the top of the boards
;-----------------------------------------------------------------------------
DrawBoardTopLines:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 44h, 0
        push eax
        mov eax, dword [RinkInstance]
        mov dword [byte ebp-04h], GlassPanelList
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne near .5
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-014h], eax
        jmp near .4
.2:
        mov eax, dword [byte ebp-014h]
        mov eax, dword [byte eax+048h]
        imul esi, eax, byte 0Ch
        mov ebx, dword [byte ebp-014h]
        lea edi, [byte ebp-038h]
        add esi, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebx+04Ch]
        movsd
        movsd
        movsd
        imul esi, ebx, byte 0Ch
        lea edi, [byte ebp-044h]
        add esi, dword [byte ebp-0Ch]
        movsd
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-02Ch]
        add esi, eax
        lea ecx, [byte ebp-044h]
        lea edx, [byte ebp-024h]
        movsd
        movsd
        shl ebx, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-024h]
        add esi, ebx
        lea eax, [byte ebp-02Ch]
        lea ebx, [byte ebp-038h]
        movsd
        movsd
        call ClipLineToNear
        test eax, eax
        je short .3
        push dword [BoardsTopModel]
        lea eax, [byte ebp-038h]
        push eax
        call PerspScale
        add esp, byte 8
        mov esi, eax
        push dword [BoardsTopModel]
        lea eax, [byte ebp-044h]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        push esi
        push dword [BotBoardsAATable]
        push dword [byte ebp-020h]
        push dword [byte ebp-024h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call DrawFixedLine
        add esp, byte 1Ch
.3:
        add dword [byte ebp-014h], byte 8
        inc dword [byte ebp-018h]
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        cmp eax, dword [byte edx+02Ch]
        jl near .2
.5:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .8
        jmp near .1
.6:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je short .7
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne short .7
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+048h]
        mov dword [byte ebp-01Ch], eax
        imul eax, byte 0Ch
        push dword [BoardsTopModel]
        add eax, dword [byte ebp-0Ch]
        mov edi, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte edi+04Ch]
        call PerspScale
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [BoardsTopModel]
        add eax, dword [byte ebp-0Ch]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        mov eax, edi
        push esi
        shl eax, 3
        push dword [BotBoardsAATable]
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        mov eax, dword [byte ebp-01Ch]
        shl eax, 3
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        call DrawFixedLine
        add esp, byte 1Ch
.7:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.8:
        cmp dword [byte ebp-08h], byte 10h
        jl near .6
        jmp near DrawRinkFrontParts_1A3
.9:
        mov eax, dword [byte ebp-018h]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, dword [eax]
        imul esi, edx, byte 0Ch
        lea edi, [byte ebp-04Ch]
        add esi, dword [byte ebp-010h]
        mov eax, dword [byte eax+04h]
        movsd
        movsd
        movsd
        imul esi, eax, byte 0Ch
        lea edi, [byte ebp-040h]
        add esi, dword [byte ebp-010h]
        movsd
        movsd
        movsd
        shl edx, 3
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-02Ch]
        add esi, edx
        lea ecx, [byte ebp-040h]
        lea ebx, [byte ebp-04Ch]
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-034h]
        add esi, eax
        lea edx, [byte ebp-034h]
        lea eax, [byte ebp-02Ch]
        movsd
        movsd
        call ClipLineToNear
        test eax, eax
        je short .10
        push dword [CenterCircleModel]
        lea eax, [byte ebp-04Ch]
        push eax
        call PerspScale
        add esp, byte 8
        mov esi, eax
        push dword [CenterCircleModel]
        lea eax, [byte ebp-040h]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        push esi
        push dword [GlassLineAATable]
        push dword [byte ebp-030h]
        push dword [byte ebp-034h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call DrawFixedLine
        add esp, byte 1Ch
.10:
        inc dword [byte ebp-014h]
        add dword [byte ebp-018h], byte 4
DrawBoardTopLines_23D:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte edx+010h]
        jl near DrawBoardTopLines.9
DrawBoardTopLines_24C:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .15
        jmp near DrawBoardSegments_2C
.11:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je near .14
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-050h]
        jne near .14
        mov esi, dword [byte ebp-04h]
        mov esi, dword [byte esi+01Ch]
        shl esi, 2
        xor edi, edi
        add esi, BoardPoints
        jmp short .13
.12:
        mov eax, dword [esi]
        mov eax, dword [byte eax+04h]
        mov edx, dword [eax]
        mov eax, dword [byte eax+04h]
        mov dword [byte ebp-020h], edx
        mov dword [byte ebp-024h], eax
        imul eax, edx, byte 0Ch
        push dword [CenterCircleModel]
        add eax, dword [byte ebp-010h]
        push eax
        call PerspScale
        mov dword [byte ebp-01Ch], eax
        imul eax, dword [byte ebp-024h], byte 0Ch
        add esp, byte 8
        push dword [CenterCircleModel]
        add eax, dword [byte ebp-010h]
        push eax
        call PerspScale
        mov edx, dword [byte ebp-024h]
        add esp, byte 8
        mov ebx, eax
        mov eax, dword [byte ebp-020h]
        push ebx
        shl edx, 3
        push dword [byte ebp-01Ch]
        add edx, dword [byte ebp-0Ch]
        push dword [GlassLineAATable]
        shl eax, 3
        push dword [byte edx+04h]
        add eax, dword [byte ebp-0Ch]
        push dword [edx]
        push dword [byte eax+04h]
        inc edi
        push dword [eax]
        add esi, byte 4
        call DrawFixedLine
        add esp, byte 1Ch
.13:
        mov eax, dword [byte ebp-04h]
        cmp edi, dword [byte eax+010h]
        jl short .12
.14:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.15:
        cmp dword [byte ebp-08h], byte 10h
        jl near .11
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawStandsSides                                 248B0  96 PC, low confidence
; (half): draws the stands of the rink sides on one half
;-----------------------------------------------------------------------------
DrawStandsSides:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edi, eax
        push byte 0
        mov edx, dword [Stands2Instance]
        push dword [byte edx+07Ch]
        push dword [byte edx+078h]
        xor esi, esi
        call SetRinkView
        mov ecx, GlassPanelList
        add esp, byte 0Ch
.1:
        cmp dword [ecx], byte 0
        je near .10
        cmp edi, dword [byte ecx+08h]
        jne short .2
        cmp esi, byte 4
        jl short .3
.2:
        cmp esi, byte 4
        jl near .10
        test edi, edi
        je near .10
.3:
        mov eax, dword [byte ecx+070h]
        mov edx, RinkSideTables+0F4h
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-08h], edx
        jmp short .5
.4:
        mov edx, dword [byte ebp-08h]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [edx]
        inc dword [byte ebp-04h]
        mov eax, dword [StandsSideShapes]
        mov edx, dword [byte edx+04h]
        add dword [byte ebp-08h], byte 4
        call DrawStandsQuad
.5:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ecx+074h]
        jl short .4
        mov edx, dword [byte ecx+068h]
        shl edx, 2
        xor ebx, ebx
        add edx, RinkSideTables+4
        jmp short .9
.6:
        cmp esi, byte 4
        jge short .7
        mov eax, dword [edx]
        call DrawStandsSide
        jmp short .8
.7:
        mov eax, dword [edx]
        call DrawStandsSideQuad
.8:
        inc ebx
        add edx, byte 4
.9:
        cmp ebx, dword [byte ecx+06Ch]
        jl short .6
.10:
        inc esi
        add ecx, 88h
        cmp esi, byte 10h
        jl near .1
        cmp byte [RinkBoardsOn], 0
        je short .17
        mov edx, GlassPanelList
        xor esi, esi
.11:
        cmp dword [edx], byte 0
        je short .16
        cmp edi, dword [byte edx+08h]
        jne short .12
        cmp esi, byte 4
        jl short .13
.12:
        cmp esi, byte 4
        jl short .16
        test edi, edi
        je short .16
.13:
        mov ecx, dword [byte edx+078h]
        shl ecx, 2
        xor ebx, ebx
        add ecx, StandsSidePoints
        jmp short .15
.14:
        mov eax, dword [ecx]
        call DrawStandsSide
        inc ebx
        add ecx, byte 4
.15:
        cmp ebx, dword [byte edx+07Ch]
        jl short .14
.16:
        inc esi
        add edx, 88h
        cmp esi, byte 10h
        jl short .11
.17:
        push byte 0
        mov edx, dword [RinkInstance]
        push dword [byte edx+07Ch]
        push dword [byte edx+078h]
        call SetRinkView
        add esp, byte 0Ch
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawKickplates                                  249E8  96 PC, low confidence
; Draws the kickplate edges along the boards
;-----------------------------------------------------------------------------
DrawKickplates:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov esi, GlassPanelList
        mov dword [byte ebp-04h], 0
.1:
        cmp dword [byte esi+060h], byte 0
        jle near .7
        cmp dword [byte esi+04h], byte 0
        je near .7
        mov edi, dword [byte esi+064h]
        shl edi, 2
        mov dword [byte ebp-08h], 0
        add edi, RinkSideTables+0CCh
        jmp short .6
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .5
        mov eax, dword [edi]
        mov edx, dword [eax]
        shl edx, 8
        shr edx, 18h
        cmp edx, dword [KickplateClipX]
        jne short .3
        mov ecx, dword [byte eax+04h]
        mov ebx, dword [eax]
        mov eax, dword [RinkInstance]
        push dword [FatLineAATable]
        jmp short .4
.3:
        mov ecx, dword [byte eax+04h]
        mov ebx, dword [eax]
        mov eax, dword [RinkInstance]
        push dword [BlueLineAATable]
.4:
        and ebx, byte 7
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call DrawRubberEdge
.5:
        inc dword [byte ebp-08h]
        add edi, byte 4
.6:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte esi+060h]
        jl short .2
.7:
        inc dword [byte ebp-04h]
        add esi, 88h
        cmp dword [byte ebp-04h], byte 10h
        jl near .1
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawRinkFloor                                   24AA4  96 PC, low confidence
; Draws the rink floor outside the ice
;-----------------------------------------------------------------------------
DrawRinkFloor:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov esi, GlassPanelList
        mov dword [byte ebp-0Ch], 0
.1:
        cmp dword [esi], byte 0
        je near .6
        cmp dword [byte esi+04h], byte 0
        je near .6
        mov edi, dword [byte esi+018h]
        shl edi, 2
        mov dword [byte ebp-08h], 0
        add edi, RinkFloorPoints
        jmp near .5
.2:
        cmp byte [RinkFloorOn], 0
        je short .3
        mov eax, dword [edi]
        mov dword [byte ebp-04h], eax
        test byte [eax], 80h
        je short .3
        mov eax, dword [RinkInstance]
        mov dword [byte ebp-010h], eax
        mov eax, dword [byte ebp-04h]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [byte ebp-04h]
        push dword [byte eax+04h]
        call DrawRinkFloorPolys
        imul eax, byte 14h
        mov edx, dword [byte ebp-010h]
        mov edx, dword [byte edx+014h]
        push dword [byte edx+eax+0Ch]
        call OriFlatPoly
        add esp, byte 8
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        push dword [RinkFlatBoardsMaterial]
        call FillTexturePoly
        add esp, byte 0Ch
.4:
        inc dword [byte ebp-08h]
        add edi, byte 4
.5:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte esi+0Ch]
        jl near .2
.6:
        inc dword [byte ebp-0Ch]
        add esi, 88h
        cmp dword [byte ebp-0Ch], byte 10h
        jl near .1
        jmp near DrawRinkFrontParts_1A3
;-----------------------------------------------------------------------------
; DrawGlassShards                              24B87  96 PC, medium confidence
; Transforms and draws the falling glass shards
;-----------------------------------------------------------------------------
DrawGlassShards:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 124h, 0
        lea eax, [dword ebp-0124h]
        push eax
        call GetRemapTable
        add esp, byte 4
        lea eax, [byte ebp-0Ch]
        push eax
        push FlashPolys
        push CameraFlashOn
        call TransformVector
        imul eax, dword [GlassShardCount], byte 3
        add esp, byte 0Ch
        push GlassShardDraw
        push FlashPolys
        push GlassShardScreen
        push eax
        mov esi, GlassShardDraw
        xor edi, edi
        call DrawFlatPoly
        add esp, byte 10h
        jmp short .2
.1:
        push esi
        lea eax, [byte ebp-0Ch]
        push eax
        push esi
        inc edi
        call SubVec3
        add esp, byte 0Ch
        add esi, byte 0Ch
.2:
        imul eax, dword [GlassShardCount], byte 3
        cmp edi, eax
        jl short .1
        mov edi, GlassShardDraw
        xor esi, esi
        jmp short .8
.3:
        push byte 10h
        lea eax, [byte ebp-024h]
        push eax
        push edi
        push byte 3
        call ProjectPointsPersp
        add esp, byte 10h
        cmp esi, byte 4
        jl short .6
        mov eax, esi
        mov ebx, 6
        cdq
        idiv ebx
        test edx, edx
        je short .4
        push StandsArtTable+44h
        jmp short .5
.4:
        push StandsArtTable+144h
.5:
        call SetRemapTable
        add esp, byte 4
.6:
        lea eax, [byte ebp-024h]
        push eax
        push byte 3
        call RemapPolygon
        add esp, byte 8
        cmp dword [GlassBreakStep], byte 4
        jne short .7
        cmp esi, byte 4
        jge short .7
        lea eax, [byte ebp-024h]
        push eax
        push byte 3
        call RemapPolygon
        add esp, byte 8
.7:
        add edi, byte 24h
        inc esi
.8:
        cmp esi, dword [GlassShardCount]
        jl short .3
        lea eax, [dword ebp-0124h]
        jmp near DrawRinkFrontParts_19A
;-----------------------------------------------------------------------------
; DrawSideGlass                                   24C7C  96 PC, low confidence
; Draws a rink side's glass faces (with the hole and shards)
;-----------------------------------------------------------------------------
DrawSideGlass:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        push eax
        mov esi, GlassPanelList
        mov dword [byte ebp-08h], 0
.1:
        cmp dword [esi], byte 0
        je short .6
        mov eax, dword [byte esi+04h]
        cmp eax, dword [byte ebp-0Ch]
        jne short .6
        mov edi, dword [byte esi+020h]
        shl edi, 2
        mov dword [byte ebp-04h], 0
        add edi, SideGlassPoints
        jmp short .5
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+024h]
        jne short .3
        call DrawGlassShards
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.4:
        inc dword [byte ebp-04h]
        add edi, byte 4
.5:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+014h]
        jl short .2
.6:
        inc dword [byte ebp-08h]
        add esi, 88h
        cmp dword [byte ebp-08h], byte 10h
        jl short .1
        jmp near DrawRinkFrontParts_1A3
        mov eax, 1
        call DrawBoardTopLines
        call DrawKickplates
        mov eax, 1
        call DrawGlassFrameLines
        cmp byte [GlassOn], 0
        je near DrawSpriteAtVertex_55
        mov eax, 1
;-----------------------------------------------------------------------------
; DrawBoardSegments                               24D32  96 PC, low confidence
; Walks the board segment list for the boards drawing loop
;-----------------------------------------------------------------------------
DrawBoardSegments:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4Ch, 0
        push eax
        mov eax, dword [RinkInstance]
        mov dword [byte ebp-04h], GlassPanelList
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-010h], eax
DrawBoardSegments_2C:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-050h]
        jne near DrawBoardTopLines_24C
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+01Ch]
        mov edx, BoardPoints
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-018h], edx
        jmp near DrawBoardTopLines_23D
;-----------------------------------------------------------------------------
; DrawRinkFrontParts                              24D8C  96 PC, low confidence
; Draws the near side of the rink: glass, boards and bench parts
;-----------------------------------------------------------------------------
DrawRinkFrontParts:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 114h, 0
        push byte 0
        mov esi, dword [RinkInstance]
        push dword [byte esi+07Ch]
        push dword [byte esi+078h]
        call SetRinkView
        add esp, byte 0Ch
        lea eax, [dword ebp-0114h]
        push eax
        call GetRemapTable
        add esp, byte 4
        push RinkFrontRemap
        mov dword [byte ebp-010h], 0
        mov esi, GlassPanelList
        call SetRemapTable
        add esp, byte 4
.1:
        cmp dword [esi], byte 0
        je short .5
        cmp dword [byte esi+04h], byte 0
        jne short .5
        mov edi, dword [byte esi+018h]
        shl edi, 2
        mov dword [byte ebp-04h], 0
        add edi, RinkFloorPoints
        jmp short .4
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .3
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.3:
        inc dword [byte ebp-04h]
        add edi, byte 4
.4:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+0Ch]
        jl short .2
.5:
        inc dword [byte ebp-010h]
        add esi, 88h
        cmp dword [byte ebp-010h], byte 10h
        jl short .1
        mov dword [byte ebp-014h], GlassPanelList
        cmp dword [GlassPanelList], byte 0
        je short .9
        cmp dword [RinkSideStructs], byte 0
        jne short .9
        mov esi, dword [RinkSideStructs+60h]
        shl esi, 2
        mov dword [byte ebp-08h], 0
        add esi, RinkSideTables+0CCh
        jmp short .8
.6:
        mov edi, dword [esi]
        push dword [byte edi+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .7
        mov edi, dword [esi]
        push dword [byte edi+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.7:
        inc dword [byte ebp-08h]
        add esi, byte 4
.8:
        mov edi, dword [byte ebp-014h]
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte edi+060h]
        jl short .6
.9:
        mov edi, RinkSideStructs+10Ch
        cmp dword [RinkSideStructs+10Ch], byte 0
        je short .13
        cmp dword [RinkSideStructs+110h], byte 0
        jne short .13
        mov esi, dword [RinkSideStructs+170h]
        shl esi, 2
        mov dword [byte ebp-0Ch], 0
        add esi, RinkSideTables+0CCh
        jmp short .12
.10:
        mov eax, dword [esi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .11
        mov eax, dword [esi]
        push dword [byte eax+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.11:
        inc dword [byte ebp-0Ch]
        add esi, byte 4
.12:
        mov eax, dword [byte ebp-0Ch]
        cmp eax, dword [byte edi+060h]
        jl short .10
.13:
        xor eax, eax
        call DrawGlassFrameLines
        cmp byte [GlassOn], 0
        je short DrawRinkFrontParts_194
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
        xor eax, eax
        call DrawSideGlass
        xor eax, eax
        call DrawBoardSegments
DrawRinkFrontParts_194:
        lea eax, [dword ebp-0114h]
DrawRinkFrontParts_19A:
        push eax
        call SetRemapTable
DrawRinkFrontParts_1A0:
        add esp, byte 4
DrawRinkFrontParts_1A3:
        leave
DrawRinkFrontParts_1A4:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawPuckModel                                24F36  96 PC, medium confidence
; Draws the puck model (PuckInstance), from DrawPuckSprite
;-----------------------------------------------------------------------------
DrawPuckModel:
        push ebx
        push ecx
        push edx
        push dword [PuckInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelPolys
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawPuckShadowModel                          24F75  96 PC, medium confidence
; Draws the puck shadow model (PuckShadowInstance) when on screen, from
; DrawPuckSprite
;-----------------------------------------------------------------------------
DrawPuckShadowModel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 80h, 0
        push dword [PuckShadowInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckShadowInstance]
        call ProjectModelPoints
        add esp, byte 4
        xor edx, edx
        xor eax, eax
        jmp short .2
.1:
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-080h]
        add esi, eax
        movsd
        movsd
        cmp dword [byte eax+ebp-080h], byte 0
        jl near DrawRinkFrontParts_1A3
        mov esi, dword [byte eax+ebp-080h]
        cmp esi, dword [ViewScreenWidth]
        jg near DrawRinkFrontParts_1A3
        cmp dword [byte eax+ebp-07Ch], byte 0
        jl near DrawRinkFrontParts_1A3
        mov esi, dword [byte eax+ebp-07Ch]
        cmp esi, dword [ViewScreenHeight]
        jg near DrawRinkFrontParts_1A3
        add eax, byte 8
        inc edx
.2:
        mov esi, dword [PuckShadowInstance]
        cmp edx, dword [byte esi+04h]
        jl short .1
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-080h]
        lea eax, [byte ebp-080h]
        movsd
        movsd
        push eax
        mov eax, dword [PuckShadowInstance]
        push dword [byte eax+04h]
        call RemapPolygon
        jmp near DrawGoalLight_A4
;-----------------------------------------------------------------------------
; PlacePuckModels                                 2500F  96 PC, low confidence
; Sets the puck and puck shadow models' positions
;-----------------------------------------------------------------------------
PlacePuckModels:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push eax
        push dword [PuckInstance]
        call OriSetObjectPosition
        add esp, byte 8
        push esi
        mov dword [byte esi+04h], 0
        push dword [PuckShadowInstance]
        call OriSetObjectPosition
        add esp, byte 8
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawZamboni                                  2503F  96 PC, medium confidence
; Draws the zamboni model when it is loaded (ZamboniLoaded)
;-----------------------------------------------------------------------------
DrawZamboni:
        push ebx
        push ecx
        push edx
        cmp dword [ZamboniLoaded], byte 0
        je short DrawZamboni_41.1
        push dword [ZamboniInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [ZamboniInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [ZamboniInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [ZamboniInstance]
        call DrawModelPolys
DrawZamboni_41:
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadZamboni                                  25087  96 PC, medium confidence
; From the in-game menu: loads the "zamboni" model and sets it up
;-----------------------------------------------------------------------------
LoadZamboni:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov eax, 0FFFFFFFDh
        mov edx, 20h
        call SelectDataLibrary
        mov eax, str_Zamboni
        call OriLoadModel
        push byte 0
        mov dword [ZamboniShapes], eax
        add eax, byte 2Ch
        push eax
        call LoadFileData
        mov ebx, 4
        mov edx, 20h
        add esp, byte 8
        mov dword [ZamboniModel], eax
        mov eax, dword [ZamboniShapes]
        call OriCreateInstance
        push eax
        mov dword [ZamboniInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [ZamboniModel]
        push dword [ZamboniInstance]
        call OriLoadShapes
        mov eax, dword [ZamboniInstance]
        or byte [byte eax+010h], 2
        mov eax, dword [RinkZamboniPathFaces]
        mov dword [ZamboniState+44h], 0
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [RinkModel]
        add edx, dword [byte eax+028h]
        mov eax, dword [byte edx+04h]
        imul esi, dword [eax], byte 0Ch
        mov eax, dword [RinkInstance]
        mov ebx, dword [byte eax+070h]
        mov edi, ZamboniState
        add esi, ebx
        movsd
        movsd
        movsd
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+04h], byte 0Ch
        add esp, byte 8
        mov eax, dword [byte eax+070h]
        mov edi, ZamboniState+0Ch
        add esi, eax
        push ZamboniState
        movsd
        movsd
        movsd
        push dword [ZamboniInstance]
        mov dword [ZamboniState+10h], 0
        mov dword [ZamboniState+4], 0
        call OriSetObjectPosition
        mov eax, dword [ZamboniState+14h]
        add esp, byte 8
        sub eax, dword [ZamboniState+8]
        push eax
        mov eax, dword [ZamboniState]
        sub eax, dword [ZamboniState+0Ch]
        push eax
        call AngleOfVector
        mov dword [ZamboniState+18h], eax
        neg dword [ZamboniState+18h]
        add esp, byte 8
        mov eax, dword [ZamboniState+18h]
        push eax
        push ZamboniState+1Ch
        mov dword [ZamboniState+40h], eax
        call MakeRotYMatrix
        add esp, byte 8
        push ZamboniState+1Ch
        push dword [ZamboniInstance]
        call OriSetObjectMatrix
        mov dword [ZamboniState+48h], 0
        mov dword [ZamboniLoaded], 1
        shl dword [ZamboniState], 10h
        shl dword [ZamboniState+8], 10h
        add esp, byte 8
        jmp near DrawRinkFrontParts_1A4
;-----------------------------------------------------------------------------
; FreeZamboni                                  251E6  96 PC, medium confidence
; Frees the zamboni model and its art
;-----------------------------------------------------------------------------
FreeZamboni:
        push ebx
        push ecx
        push edx
        xor eax, eax
        call SelectDataLibrary
        push dword [ZamboniShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [ZamboniInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [ZamboniModel]
        call FreeMemBlock
        mov dword [ZamboniLoaded], 0
        jmp near DrawZamboni_41
;-----------------------------------------------------------------------------
; MoveZamboni                                     25226  96 PC, low confidence
; Moves the zamboni along its path (from DrawGameFrame and the menu scene)
;-----------------------------------------------------------------------------
MoveZamboni:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        push eax
        lea edi, [byte ebp-010h]
        mov esi, ZamboniZeroVec
        movsd
        movsd
        movsd
        cmp dword [ZamboniLoaded], byte 0
        je near DrawRinkFrontParts_1A3
        mov eax, dword [ZamboniState]
        sar eax, 10h
        cmp eax, dword [ZamboniState+0Ch]
        jne near .3
        mov eax, dword [ZamboniState+8]
        sar eax, 10h
        cmp eax, dword [ZamboniState+14h]
        jne near .3
        mov eax, dword [RinkZamboniPathCount]
        inc dword [ZamboniState+44h]
        dec eax
        cmp eax, dword [ZamboniState+44h]
        jg short .1
        mov dword [ZamboniState+44h], 2
.1:
        mov eax, dword [ZamboniState+44h]
        mov edx, dword [RinkZamboniPathFaces]
        imul edx, dword [edx+eax*4], byte 0Ch
        mov eax, dword [RinkModel]
        mov eax, dword [byte eax+028h]
        add eax, edx
        mov edx, dword [ZamboniState+0Ch]
        mov dword [ZamboniState], edx
        mov edx, dword [ZamboniState+14h]
        mov dword [ZamboniState+8], edx
        mov eax, dword [byte eax+04h]
        imul esi, dword [byte eax+04h], byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        mov edi, ZamboniState+0Ch
        add esi, eax
        movsd
        movsd
        movsd
        mov eax, dword [ZamboniState+14h]
        sub eax, dword [ZamboniState+8]
        push eax
        mov eax, dword [ZamboniState]
        sub eax, dword [ZamboniState+0Ch]
        push eax
        mov dword [ZamboniState+10h], 0
        mov dword [ZamboniState+4], 0
        call AngleOfVector
        mov dword [ZamboniState+40h], eax
        neg dword [ZamboniState+40h]
        add esp, byte 8
        cmp dword [ZamboniState+40h], 0FFFF8000h
        jne short .2
        inc word [ZamboniState+42h]
.2:
        shl dword [ZamboniState], 10h
        shl dword [ZamboniState+8], 10h
.3:
        mov eax, dword [ZamboniState+18h]
        cmp eax, dword [ZamboniState+40h]
        je near .6
        mov eax, dword [byte ebp-020h]
        sub eax, dword [ZamboniState+48h]
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        fmul qword [F64_0p00138889]
        fmul qword [F64_65536]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        add dword [ZamboniState+18h], eax
        cmp dword [ZamboniState+18h], 8000h
        jl short .4
        sub dword [ZamboniState+18h], 10000h
        sub dword [ZamboniState+40h], 10000h
.4:
        mov eax, dword [ZamboniState+18h]
        cmp eax, dword [ZamboniState+40h]
        jle short .5
        mov eax, dword [ZamboniState+40h]
        mov dword [ZamboniState+18h], eax
.5:
        push dword [ZamboniState+18h]
        push ZamboniState+1Ch
        call MakeRotYMatrix
        add esp, byte 8
        push ZamboniState+1Ch
        push dword [ZamboniInstance]
        call OriSetObjectMatrix
        add esp, byte 8
.6:
        mov eax, dword [byte ebp-020h]
        sub eax, dword [ZamboniState+48h]
        cmp eax, byte 2
        jge short .7
        mov dword [byte ebp-08h], 20000h
        jmp short .8
.7:
        shl eax, 10h
        mov dword [byte ebp-08h], eax
.8:
        lea eax, [byte ebp-01Ch]
        push eax
        push ZamboniState+1Ch
        lea eax, [byte ebp-010h]
        push eax
        call TransformVector
        add esp, byte 0Ch
        push ZamboniState
        lea eax, [byte ebp-01Ch]
        push eax
        push ZamboniState
        call AddVec3
        mov eax, dword [ZamboniState]
        mov edx, dword [ZamboniState+0Ch]
        add esp, byte 0Ch
        sar eax, 10h
        shl edx, 10h
        cmp dword [ZamboniState+18h], 4000h
        jl short .11
        cmp eax, dword [ZamboniState+0Ch]
        jle short .10
.9:
        mov dword [ZamboniState], edx
.10:
        mov eax, dword [ZamboniState+8]
        sar eax, 10h
        cmp eax, dword [ZamboniState+14h]
        jge near .17
        jmp near .16
.11:
        cmp dword [ZamboniState+18h], byte 0
        jl short .13
        cmp eax, dword [ZamboniState+0Ch]
        jle short .12
        mov dword [ZamboniState], edx
.12:
        mov eax, dword [ZamboniState+8]
        sar eax, 10h
        cmp eax, dword [ZamboniState+14h]
        jle short .17
        jmp short .16
.13:
        cmp dword [ZamboniState+18h], 0FFFFC000h
        jg short .14
        cmp eax, dword [ZamboniState+0Ch]
        jge short .10
        jmp short .9
.14:
        cmp dword [ZamboniState+18h], byte 0
        jg short .17
        cmp eax, dword [ZamboniState+0Ch]
        jge short .15
        mov dword [ZamboniState], edx
.15:
        mov eax, dword [ZamboniState+8]
        sar eax, 10h
        cmp eax, dword [ZamboniState+14h]
        jle short .17
.16:
        mov eax, dword [ZamboniState+14h]
        shl eax, 10h
        mov dword [ZamboniState+8], eax
.17:
        mov eax, dword [ZamboniState]
        sar eax, 10h
        mov dword [byte ebp-010h], eax
        mov eax, dword [ZamboniState+8]
        sar eax, 10h
        mov dword [byte ebp-08h], eax
        lea eax, [byte ebp-010h]
        push eax
        push dword [ZamboniInstance]
        mov dword [byte ebp-0Ch], 0
        call OriSetObjectPosition
        jmp near DrawGoalLight_A4
;-----------------------------------------------------------------------------
; DrawGoalNet                                  25502  96 PC, medium confidence
; (goal): draws the goal0 / goal1 net model
;-----------------------------------------------------------------------------
DrawGoalNet:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edi, eax
        test eax, eax
        je short .1
        mov eax, dword [AwayNetInstance]
        jmp short .2
.1:
        mov eax, dword [HomeNetInstance]
.2:
        mov dword [byte ebp-04h], eax
        mov esi, dword [byte ebp-04h]
        push esi
        call DrawModelFlat
        add esp, byte 4
        push esi
        mov dword [byte ebp-08h], 0
        call ProjectModelPoints
        add esp, byte 4
        cmp dword [InReplay], byte 0
        je short .3
        movsx eax, byte [ReplayFrameState+143h]
        cmp eax, edi
        jne short .5
        jmp short .4
.3:
        call PuckInNet
        cmp eax, edi
        jne short .5
.4:
        mov dword [byte ebp-08h], 1
.5:
        cmp dword [byte ebp-08h], byte 0
        je near .16
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [byte esi+01Ch]
        jg near .14
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [byte esi+024h]
        jg near .11
        cmp edi, byte 1
        jne near .9
.6:
        push dword [RinkRight1Faces]
        push dword [RinkRight1Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkRight2Faces]
        push dword [RinkRight2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [PuckInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelPolys
        add esp, byte 4
        push dword [RinkBackFaces]
        push dword [RinkBackCount]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
.7:
        push dword [RinkLeft2Faces]
        push dword [RinkLeft2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkLeft1Faces]
        push dword [RinkLeft1Count]
.8:
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkTopFaces]
        push dword [RinkTopCount]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        jmp near DrawRinkFrontParts_1A3
.9:
        push dword [RinkLeft1Faces]
        push dword [RinkLeft1Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkLeft2Faces]
        push dword [RinkLeft2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBackFaces]
        push dword [RinkBackCount]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [PuckInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelPolys
        add esp, byte 4
.10:
        push dword [RinkRight2Faces]
        push dword [RinkRight2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkRight1Faces]
        push dword [RinkRight1Count]
        jmp near .8
.11:
        cmp edi, byte 1
        jne short .13
.12:
        push dword [RinkRight1Faces]
        push dword [RinkRight1Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkRight2Faces]
        push dword [RinkRight2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBackFaces]
        push dword [RinkBackCount]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [PuckInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelPolys
        add esp, byte 4
        jmp near .7
.13:
        push dword [RinkLeft1Faces]
        push dword [RinkLeft1Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkLeft2Faces]
        push dword [RinkLeft2Count]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [PuckInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [PuckInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [PuckInstance]
        call DrawModelPolys
        add esp, byte 4
        push dword [RinkBackFaces]
        push dword [RinkBackCount]
        push esi
        call DrawModelPolyList
        add esp, byte 0Ch
        jmp near .10
.14:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [byte esi+024h]
        jg short .15
        cmp edi, byte 1
        je near .13
        jmp near .12
.15:
        cmp edi, byte 1
        je near .9
        jmp near .6
.16:
        push esi
        call DrawModelSorted
        add esp, byte 4
        push esi
        call DrawModelPolys
        jmp near DrawRinkFrontParts_1A0
;-----------------------------------------------------------------------------
; PlaceGoalNet                                    25820  96 PC, low confidence
; (goal): sets the goal0 / goal1 model's position
;-----------------------------------------------------------------------------
PlaceGoalNet:
        push ebx
        push ecx
        push edx
        test eax, eax
        je short .1
        mov eax, dword [AwayNetInstance]
        jmp short .2
.1:
        mov eax, dword [HomeNetInstance]
.2:
        push eax
        call OriSetObjectPosition
        add esp, byte 8
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; BuildRinkSides                               2583F  96 PC, medium confidence
; Finds the 18 rink sides (Side%d) in the rink and stands models with their
; glass, glassline, boards and ice line parts
;-----------------------------------------------------------------------------
BuildRinkSides:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 12Ch, 0
        sub ebp, 82h
        push str_Glassline
        push dword [RinkInstance]
        call OriFindMaterial
        add esp, byte 8
        push str_Glass
        push dword [RinkInstance]
        mov dword [byte ebp+06h], eax
        call OriFindMaterial
        add esp, byte 8
        push str_Topboards
        push dword [RinkInstance]
        mov dword [byte ebp-06h], eax
        call OriFindMaterial
        add esp, byte 8
        push str_Botboards
        push dword [RinkInstance]
        mov dword [byte ebp+02h], eax
        call OriFindMaterial
        add esp, byte 8
        push str_FatRedLines
        mov dword [byte ebp+04Eh], 0
        push dword [RinkInstance]
        mov dword [byte ebp-02h], eax
        call OriFindMaterial
        add esp, byte 8
        mov dword [byte ebp+076h], 0
        mov dword [byte ebp+072h], 0
        push str_FatBlueLines
        mov dword [byte ebp+04Ah], 0
        mov dword [byte ebp+066h], 0
        push dword [RinkInstance]
        mov dword [KickplateClipX], eax
        call OriFindMaterial
        mov dword [BenchDoorArt], eax
        mov eax, dword [RinkModel]
        mov dword [byte ebp+06Eh], 0
        mov esi, GlassPanelList
        mov eax, dword [byte eax+028h]
        xor edi, edi
        mov dword [byte ebp-0Ah], eax
        mov eax, dword [RinkSidesModel]
        mov dword [byte ebp+07Eh], edi
        mov dword [byte ebp+07Ah], edi
        mov eax, dword [byte eax+028h]
        add esp, byte 8
        mov dword [byte ebp-0Eh], eax
.1:
        push dword [byte ebp+07Ah]
        push str_SideD
        lea eax, [byte ebp-02Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-02Ah]
        push eax
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        mov dword [byte ebp+0Ah], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .2
        push str_SideNotFoundInRink
        call FatalError
        add esp, byte 4
.2:
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-012h]
        push eax
        push dword [byte ebp+0Ah]
        push dword [RinkInstance]
        call OriGetPartition
        mov dword [byte esi+010h], 0
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte esi+014h], 0
        mov dword [byte esi+018h], eax
        mov eax, dword [byte ebp+076h]
        mov dword [byte esi+01Ch], eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte esi+020h], eax
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 10h
        mov dword [byte esi+064h], eax
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte esi+060h], 0
        shl eax, 2
        mov dword [byte esi+028h], 0
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte esi+02Ch], 0
        shl eax, 2
        mov dword [byte esi+0Ch], 0
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [byte ebp+076h]
        mov dword [esi], 1
        shl eax, 2
        mov dword [byte esi+024h], 0FFFFFFFFh
        mov dword [byte ebp+026h], eax
        jmp near .8
.3:
        cmp edx, dword [byte ebp-06h]
        jne short .4
        mov edx, dword [byte ebp+01Eh]
        inc dword [byte ebp+072h]
        inc dword [byte esi+014h]
        add dword [byte ebp+01Eh], byte 4
        mov dword [dword edx+SideGlassPoints], eax
        jmp short .8
.4:
        cmp edx, dword [byte ebp+02h]
        jne short .5
        mov ebx, dword [byte eax+04h]
        mov edx, dword [byte esi+028h]
        mov ebx, dword [ebx]
        mov dword [byte esi+edx*8+030h], ebx
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esi+028h]
        mov eax, dword [byte eax+04h]
        mov dword [byte esi+edx*8+034h], eax
        inc dword [byte esi+028h]
        jmp short .8
.5:
        cmp edx, dword [byte ebp-02h]
        jne short .6
        mov edx, dword [byte eax+04h]
        mov ebx, dword [byte esi+02Ch]
        mov edx, dword [edx]
        mov dword [byte esi+ebx*8+048h], edx
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esi+02Ch]
        mov eax, dword [byte eax+04h]
        mov dword [byte esi+edx*8+04Ch], eax
        inc dword [byte esi+02Ch]
        jmp short .8
.6:
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, dword [byte ebp+07Eh]
        inc ecx
        shl ebx, 2
        cmp edx, dword [KickplateClipX]
        jne short .9
.7:
        inc dword [byte esi+060h]
        mov dword [byte ebp+07Eh], ecx
        mov dword [dword ebx+RinkSideTables+0CCh], eax
.8:
        dec dword [byte ebp-012h]
        cmp dword [byte ebp-012h], byte 0FFFFFFFFh
        je short .10
        mov eax, dword [byte ebp-016h]
        add dword [byte ebp-016h], byte 4
        imul eax, dword [eax], byte 0Ch
        add eax, dword [byte ebp-0Ah]
        mov edx, dword [eax]
        shl edx, 8
        shr edx, 18h
        cmp edx, dword [byte ebp+06h]
        jne near .3
        mov edx, dword [byte ebp+026h]
        inc dword [byte ebp+076h]
        inc dword [byte esi+010h]
        add dword [byte ebp+026h], byte 4
        mov dword [dword edx+BoardPoints], eax
        jmp short .8
.9:
        cmp edx, dword [BenchDoorArt]
        je short .7
        mov edx, dword [byte ebp+02Eh]
        inc dword [byte ebp+04Eh]
        inc dword [byte esi+0Ch]
        add dword [byte ebp+02Eh], byte 4
        mov dword [dword edx+RinkFloorPoints], eax
        jmp short .8
.10:
        cmp dword [byte ebp+07Ah], byte 10h
        jge near .22
        lea eax, [byte ebp-02Ah]
        push eax
        push dword [Stands2Instance]
        call OriFindPartition
        add esp, byte 8
        mov dword [byte ebp+0Eh], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .11
        push str_SideNotFoundInStands
        call FatalError
        add esp, byte 4
.11:
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-012h]
        push eax
        push dword [byte ebp+0Eh]
        push dword [Stands2Instance]
        call OriGetPartition
        mov eax, dword [byte ebp+04Ah]
        mov dword [byte esi+074h], 0
        mov dword [byte esi+068h], eax
        mov eax, dword [byte ebp+06Eh]
        mov dword [byte esi+070h], eax
        mov eax, dword [byte ebp+066h]
        mov dword [byte esi+078h], eax
        mov edx, dword [byte ebp+04Ah]
        mov eax, dword [byte esi+074h]
        mov ebx, dword [byte ebp+06Eh]
        mov dword [byte esi+07Ch], eax
        add esp, byte 10h
        mov dword [byte esi+06Ch], eax
        mov eax, dword [byte ebp+066h]
        shl edx, 2
        shl eax, 2
        shl ebx, 2
        mov dword [byte ebp+036h], eax
.12:
        dec dword [byte ebp-012h]
        cmp dword [byte ebp-012h], byte 0FFFFFFFFh
        je near .22
        mov eax, dword [byte ebp-016h]
        add dword [byte ebp-016h], byte 4
        mov eax, dword [eax]
        mov dword [byte ebp+062h], eax
        imul eax, byte 0Ch
        mov ecx, dword [byte ebp-0Eh]
        mov dword [byte ebp+052h], 0
        add ecx, eax
        mov eax, dword [RinkStandCount]
        mov dword [byte ebp+03Ah], ecx
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+02Ah], eax
        jmp short .15
.13:
        mov eax, dword [RinkStandFaces]
        add eax, dword [byte ebp+052h]
        cmp ecx, dword [eax]
        jne short .14
        mov eax, dword [byte ebp+03Ah]
        add edx, byte 4
        inc dword [byte esi+06Ch]
        inc dword [byte ebp+04Ah]
        mov dword [dword edx+RinkSideTables], eax
        jmp short .12
.14:
        add dword [byte ebp+052h], byte 4
.15:
        mov eax, dword [byte ebp+052h]
        cmp eax, dword [byte ebp+02Ah]
        jl short .13
        mov eax, dword [RinkStand2ndCount]
        mov dword [byte ebp+042h], 0
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+022h], eax
        jmp short .18
.16:
        mov eax, dword [RinkStand2ndFaces]
        add eax, dword [byte ebp+042h]
        cmp ecx, dword [eax]
        jne short .17
        mov eax, dword [byte ebp+03Ah]
        mov ecx, dword [byte ebp+036h]
        inc dword [byte ebp+066h]
        inc dword [byte esi+07Ch]
        add dword [byte ebp+036h], byte 4
        mov dword [dword ecx+StandsSidePoints], eax
        jmp near .12
.17:
        add dword [byte ebp+042h], byte 4
.18:
        mov eax, dword [byte ebp+042h]
        cmp eax, dword [byte ebp+022h]
        jl short .16
        mov eax, dword [RinkWallCount]
        mov dword [byte ebp+046h], 0
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+012h], eax
        jmp short .21
.19:
        mov eax, dword [RinkWallFaces]
        add eax, dword [byte ebp+046h]
        cmp ecx, dword [eax]
        jne short .20
        mov eax, dword [byte ebp+03Ah]
        add ebx, byte 4
        inc dword [byte esi+074h]
        inc dword [byte ebp+06Eh]
        mov dword [dword ebx+RinkSideTables+0F0h], eax
        jmp near .12
.20:
        add dword [byte ebp+046h], byte 4
.21:
        mov eax, dword [byte ebp+046h]
        cmp eax, dword [byte ebp+012h]
        jl short .19
        jmp near .12
.22:
        inc dword [byte ebp+07Ah]
        add esi, 88h
        cmp dword [byte ebp+07Ah], byte 12h
        jl near .1
        mov esi, GlassPanelList
        mov dword [RinkSideStructs+80h], 0
        mov eax, edi
        mov dword [byte ebp+05Eh], 0
        shl eax, 2
        mov dword [RinkSideStructs+7Ch], edi
        mov dword [byte ebp+03Eh], eax
.23:
        push dword [byte ebp+05Eh]
        push str_Gt002d
        lea eax, [dword ebp-0AAh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [dword ebp-0AAh]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .24
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+05Eh]
        add eax, edx
        mov edx, dword [byte ebp+03Eh]
        inc edi
        add dword [byte ebp+03Eh], byte 4
        mov dword [dword edx+GlassPanelShake], eax
        cmp dword [byte ebp+05Eh], byte 14h
        jl short .23
.24:
        mov esi, RinkSideStructs+84h
        mov dword [RinkSideStructs+108h], 0
        mov eax, edi
        mov dword [byte ebp+05Ah], 0
        shl eax, 2
        mov dword [RinkSideStructs+104h], edi
        mov dword [byte ebp+032h], eax
.25:
        push dword [byte ebp+05Ah]
        push str_Gt102d
        lea eax, [dword ebp-08Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [dword ebp-08Ah]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .26
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+05Ah]
        add eax, edx
        mov edx, dword [byte ebp+032h]
        inc edi
        add dword [byte ebp+032h], byte 4
        mov dword [dword edx+GlassPanelShake], eax
        cmp dword [byte ebp+05Ah], byte 14h
        jl short .25
.26:
        mov esi, RinkSideStructs+10Ch
        mov dword [RinkSideStructs+190h], 0
        mov eax, edi
        mov dword [byte ebp+056h], 0
        shl eax, 2
        mov dword [RinkSideStructs+18Ch], edi
        mov dword [byte ebp+01Ah], eax
.27:
        push dword [byte ebp+056h]
        push str_Gt202d
        lea eax, [byte ebp-04Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-04Ah]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .28
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+056h]
        add eax, edx
        mov edx, dword [byte ebp+01Ah]
        inc edi
        add dword [byte ebp+01Ah], byte 4
        mov dword [dword edx+GlassPanelShake], eax
        cmp dword [byte ebp+056h], byte 14h
        jl short .27
.28:
        mov esi, RinkSideStructs+194h
        mov dword [RinkSideStructs+218h], 0
        mov eax, edi
        mov dword [byte ebp+06Ah], 0
        shl eax, 2
        mov dword [RinkSideStructs+214h], edi
        mov dword [byte ebp+016h], eax
.29:
        push dword [byte ebp+06Ah]
        push str_Gt302d
        lea eax, [byte ebp-06Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-06Ah]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short BuildRinkSides_602
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+06Ah]
        add eax, edx
        mov edx, dword [byte ebp+016h]
        inc edi
        add dword [byte ebp+016h], byte 4
        mov dword [dword edx+GlassPanelShake], eax
        cmp dword [byte ebp+06Ah], byte 14h
        jl short .29
BuildRinkSides_602:
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawRinkFrontParts_1A4
;-----------------------------------------------------------------------------
; SetIceLogoTexture                            25E4D  96 PC, medium confidence
; Sets the rink's "icelogo" texture (LoadIceLogo)
;-----------------------------------------------------------------------------
SetIceLogoTexture:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push str_Icelogo
        push dword [RinkInstance]
        call OriFindMaterial
        add esp, byte 8
        push esi
        push eax
        push dword [RinkInstance]
        call OriSetMaterialTexture
        add esp, byte 0Ch
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeStandsArt                                25E7B  96 PC, medium confidence
; Frees the stands art (StandsArtLoaded)
;-----------------------------------------------------------------------------
FreeStandsArt:
        push ebx
        push ecx
        push edx
        cmp dword [StandsArtLoaded], byte 0
        je short FreeStandsArt_21.1
        push dword [StandsArtLoaded]
        call FreeMemBlock
        mov dword [StandsArtLoaded], 0
FreeStandsArt_21:
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
LoadStandsArtJumpTable:                         ; jump table for the switch cases of LoadStandsArt
        dd LoadStandsArt_3F
        dd LoadStandsArt_25
        dd LoadStandsArt_32
        dd LoadStandsArt_61
;-----------------------------------------------------------------------------
; LoadStandsArt                                25EB3  96 PC, medium confidence
; (crowd): loads the stands art for the crowd size (EMPTY.FSH, HALF.FSH,
; STANDS.FSH) and its crowd frames
;-----------------------------------------------------------------------------
LoadStandsArt:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov edx, eax
        mov eax, 0FFFFFFFDh
        call SelectDataLibrary
        lea eax, [byte edx+01h]
        cmp eax, byte 3
        ja short LoadStandsArt_61.2
        jmp dword [nosplit cs:eax*4+LoadStandsArtJumpTable]
LoadStandsArt_25:
        push dword [StandsArtLoaded]
        push str_EMPTYFSH
        jmp short LoadStandsArt_61.1
LoadStandsArt_32:
        push dword [StandsArtLoaded]
        push str_HALFFSH
        jmp short LoadStandsArt_61.1
LoadStandsArt_3F:
        push byte 20h
        push str_STANDSFSH
        call FileSizeByName
        add esp, byte 4
        push eax
        push str_STANDS
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [StandsArtLoaded], eax
LoadStandsArt_61:
        push dword [StandsArtLoaded]
        push str_STANDSFSH
.1:
        call LoadFileToBlockShared
        add esp, byte 8
.2:
        push dword [StandsArtLoaded]
        xor edi, edi
        push dword [Stands2Instance]
        xor esi, esi
        call OriLoadShapes
        add esp, byte 8
.3:
        push edi
        push str_CrowdD
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-010h]
        push eax
        push dword [Stands2Instance]
        call OriFindMaterial
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [Stands2Instance]
        mov ebx, dword [byte eax+014h]
        add esi, byte 4
        inc edi
        mov edx, dword [byte edx+ebx+0Ch]
        add esp, byte 8
        mov dword [dword esi+StandsArtTable], edx
        cmp edi, byte 9
        jl short .3
        push str_Wedge
        push eax
        call OriFindMaterial
        mov edx, eax
        imul ebx, edx, byte 14h
        mov eax, dword [Stands2Instance]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_WALL
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [StandsSideArt], edx
        call OriFindMaterial
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [Stands2Instance]
        mov eax, dword [byte eax+014h]
        mov eax, dword [byte edx+eax+0Ch]
        add esp, byte 8
        mov dword [StandsSideShapes], eax
        xor eax, eax
LoadStandsArt_11B:
        call SelectDataLibrary
        jmp near DrawRinkFrontParts_1A3
        push ebx
        push ecx
        push esi
        mov esi, edx
        push eax
        push dword [RinkInstance]
        call OriFindMaterial
        add esp, byte 8
        push esi
        push eax
        push dword [RinkInstance]
        call OriSetMaterialTexture
        add esp, byte 0Ch
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; BlendPaletteToGrey                              26000  96 PC, low confidence
; (src, dst, ..., amount): moves each palette colour toward its grey level by
; an amount
;-----------------------------------------------------------------------------
BlendPaletteToGrey:
        push esi
        push edi
        enter 14h, 0
        push edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        mov edi, eax
        add eax, 2FDh
        mov dword [byte ebp-0Ch], eax
.1:
        movsx ecx, byte [edi]
        movsx ebx, byte [byte edi+01h]
        movsx eax, byte [byte edi+02h]
        shl ecx, 2
        shl eax, 2
        shl ebx, 2
        mov dword [byte ebp-010h], eax
        lea eax, [ecx+ebx]
        add eax, dword [byte ebp-010h]
        mov dword [byte ebp-04h], 3
        cdq
        idiv dword [byte ebp-04h]
        mov edx, dword [byte ebp+010h]
        mov dword [byte ebp-014h], eax
        sub eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp+010h]
        sub eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ebx, eax
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp+010h]
        sub eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-010h], eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ebx, eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-010h], eax
        mov edx, esi
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .2
        mov eax, 0FFh
        jmp short .3
.2:
        mov edx, esi
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.3:
        mov ecx, eax
        mov edx, esi
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .4
        mov eax, 0FFh
        jmp short .5
.4:
        mov edx, esi
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.5:
        mov ebx, eax
        mov edx, esi
        mov eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .6
        mov eax, 0FFh
        jmp short .7
.6:
        mov eax, dword [byte ebp-010h]
        mov edx, esi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.7:
        shl ecx, 10h
        shl ebx, 8
        or ebx, ecx
        or eax, ebx
        push eax
        add edi, byte 3
        call NearestColour
        mov ebx, dword [byte ebp-018h]
        add esp, byte 4
        inc dword [byte ebp-018h]
        mov byte [ebx], al
        cmp edi, dword [byte ebp-0Ch]
        jne near .1
        mov eax, dword [byte ebp-018h]
        mov byte [eax], 0FFh
        jmp near DrawFaceEdge_4F
;-----------------------------------------------------------------------------
; LoadRinkModel                                                   261A6  96 PC
; From InitGameView: loads the rink, stands, score, puck, puck shadow and net
; models, finds their named parts and lights, sets the face callbacks and the
; ice (LoadIceTexture, BuildRinkSides)
;-----------------------------------------------------------------------------
LoadRinkModel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4Ch, 0
        mov esi, eax
        push byte 50h
        call SetNearClipZ
        add esp, byte 4
        push byte 50h
        call SetScreenScale
        add esp, byte 4
        mov edx, 19999h
        call InitReciprocalTable
        mov eax, 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [NeutralSpotModel], eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [CenterSpotModel], eax
        mov eax, 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [BenchLineModel], eax
        mov eax, 6
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [BoardsTopModel], eax
        mov eax, 1
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [CenterCircleModel], eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [CreasePolyModel], eax
        mov eax, 96h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [RinkGeometryModel], eax
        mov eax, 3Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [RinkGeometryData], eax
        mov eax, 64h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [RinkGeometryParts], eax
        mov eax, 0FFFFFF7Eh
        mov ecx, 8000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [RinkMarkingModel], eax
        mov eax, 3
        mov ebx, 18000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push dword 9999h
        mov edx, StandsArtTable+44h
        mov dword [CreaseModel], eax
        mov eax, esi
        call BlendPaletteToGrey
        push dword 9999h
        mov ecx, 1999h
        mov ebx, 11999h
        mov edx, IceLinesRemap
        mov eax, esi
        call BlendPaletteToGrey
        push IceLogosRemap
        push esi
        push dword 11999h
        call TintRect
        add esp, byte 0Ch
        push RinkFrontRemap
        push esi
        push dword 9999h
        call TintRect
        add esp, byte 0Ch
        push StandsArtTable+144h
        push esi
        push dword 0E666h
        call TintRect
        add esp, byte 0Ch
        mov eax, 0FFFFFFFDh
        mov edx, 20h
        call SelectDataLibrary
        mov eax, str_Rink
        call OriLoadModel
        mov edx, 20h
        mov dword [RinkModel], eax
        add eax, byte 2Ch
        mov ebx, 4
        call LoadFshFile
        mov edx, 20h
        mov dword [RinkShapes], eax
        mov eax, dword [RinkModel]
        call OriCreateInstance
        push eax
        mov dword [RinkInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [RinkShapes]
        push dword [RinkInstance]
        call OriLoadShapes
        mov eax, dword [RinkInstance]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Stands2
        mov ebx, 4
        call OriLoadModel
        mov edx, 20h
        mov dword [RinkSidesModel], eax
        call OriCreateInstance
        mov dword [Stands2Instance], eax
        mov edx, 20h
        or byte [byte eax+010h], 2
        mov eax, str_Score
        call OriLoadModel
        mov edx, 20h
        mov dword [ScoreModel], eax
        add eax, byte 2Ch
        mov ebx, 4
        call LoadFshFile
        mov edx, 20h
        mov dword [ScoreShapes], eax
        mov eax, dword [ScoreModel]
        call OriCreateInstance
        push eax
        mov dword [ScoreInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [ScoreShapes]
        push dword [ScoreInstance]
        call OriLoadShapes
        mov eax, dword [ScoreInstance]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Puck
        call OriLoadModel
        mov edx, 20h
        mov dword [PuckModel], eax
        add eax, byte 2Ch
        mov ebx, 4
        call LoadFshFile
        mov edx, 20h
        mov dword [PuckShapes], eax
        mov eax, dword [PuckModel]
        call OriCreateInstance
        push eax
        mov dword [PuckInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [PuckShapes]
        push dword [PuckInstance]
        call OriLoadShapes
        mov eax, dword [PuckInstance]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Puckshad
        mov ebx, 4
        call OriLoadModel
        mov edx, 20h
        mov dword [PuckShadowModel], eax
        call OriCreateInstance
        mov dword [PuckShadowInstance], eax
        mov edx, 20h
        or byte [byte eax+010h], 2
        mov eax, str_Net
        call OriLoadModel
        mov edx, 20h
        mov dword [NetModel], eax
        add eax, byte 2Ch
        mov ebx, 4
        call LoadFshFile
        mov edx, 20h
        mov dword [NetShapes], eax
        mov eax, dword [NetModel]
        call OriCreateInstance
        push eax
        mov dword [HomeNetInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [NetShapes]
        push dword [HomeNetInstance]
        call OriLoadShapes
        add esp, byte 8
        push str_Goal02
        push dword [RinkInstance]
        call OriFindGroup
        imul edx, eax, byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [HomeNetInstance]
        call OriSetObjectPosition
        mov eax, dword [HomeNetInstance]
        mov ebx, 4
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov edx, 20h
        mov eax, dword [NetModel]
        call OriCreateInstance
        push eax
        mov dword [AwayNetInstance], eax
        call OriSetMaterialRgb
        add esp, byte 4
        push dword [NetShapes]
        push dword [AwayNetInstance]
        call OriLoadShapes
        add esp, byte 8
        push str_Goal12
        push dword [RinkInstance]
        call OriFindGroup
        imul edx, eax, byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [AwayNetInstance]
        call OriSetObjectPosition
        add esp, byte 8
        push dword 8000h
        lea eax, [byte ebp-04Ch]
        push eax
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-04Ch]
        push eax
        push dword [AwayNetInstance]
        call OriSetObjectMatrix
        add esp, byte 8
        mov eax, dword [AwayNetInstance]
        push str_Pipe
        or byte [byte eax+010h], 2
        push dword [HomeNetInstance]
        call OriFindMaterial
        mov edi, eax
        imul edx, edi, byte 14h
        mov eax, dword [HomeNetInstance]
        mov eax, dword [byte eax+014h]
        add esp, byte 8
        add eax, edx
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [eax]
        movzx edx, byte [byte eax+01h]
        movzx eax, byte [byte eax+02h]
        call BuildAntiAliasTable
        push GoalPipeFace
        push edi
        push dword [HomeNetInstance]
        mov dword [GoalPipeAATable], eax
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        push GoalPipeFace
        push edi
        push dword [AwayNetInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        push str_Left1
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkLeft1Faces
        push RinkLeft1Count
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Left2
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkLeft2Faces
        push RinkLeft2Count
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Back
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBackFaces
        push RinkBackCount
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Right2
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkRight2Faces
        push RinkRight2Count
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Right1
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkRight1Faces
        push RinkRight1Count
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Top
        push dword [HomeNetInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkTopFaces
        push RinkTopCount
        push eax
        push dword [HomeNetInstance]
        call OriGetPartition
        add esp, byte 10h
        mov edx, dword [RinkInstance]
        push str_Minx
        mov eax, dword [byte edx+078h]
        push edx
        mov edi, dword [byte edx+070h]
        mov dword [byte ebp-04h], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Maxx
        mov eax, dword [edi+eax]
        push dword [RinkInstance]
        mov dword [RinkMinXGroup], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Minz
        mov eax, dword [edi+eax]
        push dword [RinkInstance]
        mov dword [RinkMaxXGroup], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Maxz
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkMinZGroup], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Rlite1
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkMaxZGroup], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Gt305
        mov eax, dword [byte edi+eax+04h]
        push dword [RinkInstance]
        mov dword [byte ebp-08h], eax
        call OriFindGroup
        imul eax, byte 0Ch
        mov eax, dword [edi+eax]
        add esp, byte 8
        mov dword [ZamboniState+50h], eax
        mov eax, dword [byte ebp-08h]
        push str_Strobe
        mov dword [RinkModelGlass], eax
        mov dword [RinkModelBoards], eax
        sub eax, byte 14h
        push dword [RinkInstance]
        mov dword [RinkModelIce], eax
        mov dword [FarSideModel], eax
        call OriFindMaterial
        mov edx, eax
        imul ebx, edx, byte 14h
        mov eax, dword [RinkInstance]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Glass
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [ZamboniState+4Ch], edx
        call OriFindMaterial
        add esp, byte 8
        push GlassFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        push str_Boardback
        push dword [RinkInstance]
        call OriFindMaterial
        mov edx, eax
        imul ebx, edx, byte 14h
        mov dword [RinkBoardBackMaterial], eax
        mov eax, dword [RinkInstance]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Flatboards
        mov edx, dword [byte edx+ebx+04h]
        push eax
        mov dword [RinkEdgeFlags], edx
        call OriFindMaterial
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [RinkInstance]
        add esp, byte 8
        mov eax, dword [byte eax+014h]
        push str_STAND
        mov eax, dword [byte edx+eax+04h]
        push dword [Stands2Instance]
        mov dword [RinkFlatBoardsMaterial], eax
        call OriFindPartition
        add esp, byte 8
        push RinkStandFaces
        push RinkStandCount
        push eax
        push dword [Stands2Instance]
        call OriGetPartition
        add esp, byte 10h
        push str_STAND2ND
        push dword [Stands2Instance]
        call OriFindPartition
        add esp, byte 8
        push RinkStand2ndFaces
        push RinkStand2ndCount
        push eax
        push dword [Stands2Instance]
        call OriGetPartition
        add esp, byte 10h
        push str_WALL
        push dword [Stands2Instance]
        call OriFindPartition
        add esp, byte 8
        push RinkWallFaces
        push RinkWallCount
        push eax
        push dword [Stands2Instance]
        call OriGetPartition
        add esp, byte 10h
        push str_Rubber
        push dword [PuckInstance]
        call OriFindMaterial
        add esp, byte 8
        push RubberFace
        push eax
        push dword [PuckInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        push str_Rubberside
        push dword [PuckInstance]
        call OriFindMaterial
        add esp, byte 8
        push RubberSideFace
        push eax
        push dword [PuckInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        push str_ICE2
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkIce2Faces
        push RinkIce2Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_ICELOGO2
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkIceLogo2Faces
        push RinkIceLogo2Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Rlite0
        push dword [RinkInstance]
        call OriFindGroup
        add esp, byte 8
        push str_Rlite1
        push dword [RinkInstance]
        mov dword [RinkRedLite0Group], eax
        call OriFindGroup
        add esp, byte 8
        push str_Redlite
        push dword [RinkInstance]
        mov dword [RinkRedLite1Group], eax
        call OriFindMaterial
        imul ebx, eax, byte 14h
        mov eax, dword [RinkInstance]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Glite0
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [BenchSideModel], edx
        call OriFindGroup
        add esp, byte 8
        push str_Glite1
        push dword [RinkInstance]
        mov dword [RinkGreenLite0Group], eax
        call OriFindGroup
        add esp, byte 8
        push str_Grnlite
        push dword [RinkInstance]
        mov dword [RinkGreenLite1Group], eax
        call OriFindMaterial
        imul edx, eax, byte 14h
        mov eax, dword [RinkInstance]
        add esp, byte 8
        mov ebx, dword [byte eax+014h]
        push str_Lites
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [BoxModelData], edx
        call OriFindPartition
        add esp, byte 8
        push RinkLitesFaces
        push RinkLitesCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penboxz0
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBoxZ0Faces
        push RinkPenBoxZ0Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penboxz1
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBoxZ1Faces
        push RinkPenBoxZ1Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penboxt0
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBoxT0Faces
        push RinkPenBoxT0Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penboxt1
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBoxT1Faces
        push RinkPenBoxT1Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penbot
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBottomFaces
        push RinkPenBottomCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penback
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkPenBackFaces
        push RinkPenBackCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Penboxt0
        push dword [RinkInstance]
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxz0
        mov eax, dword [edi+eax]
        push dword [RinkInstance]
        mov dword [RinkPenBoxT0Id], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxz1
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkPenBoxZ0LastVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxt0
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkPenBoxZ1LastVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxt1
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkPenBoxT0LastVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        mov dword [PenBoxGroupCount], 0
        mov dword [RinkPenBoxT1LastVert], eax
.1:
        push dword [PenBoxGroupCount]
        push str_Penbox0D
        lea eax, [byte ebp-01Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-01Ch]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        add esp, byte 8
        test eax, eax
        jl short .2
        mov edx, dword [PenBoxGroupCount]
        push edx
        push str_Penbox1D
        mov dword [nosplit edx*4+PenBoxNearGroups], eax
        lea eax, [byte ebp-01Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-01Ch]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .2
        mov eax, dword [PenBoxGroupCount]
        inc dword [PenBoxGroupCount]
        mov dword [nosplit eax*4+PenBoxFarGroups], edx
        cmp dword [PenBoxGroupCount], byte 3
        jl short .1
.2:
        push str_DoorZ0
        push dword [RinkInstance]
        call OriFindGroup
        add esp, byte 8
        push str_DoorZ1
        push dword [RinkInstance]
        mov dword [RinkModelTexInfo], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door00
        push dword [RinkInstance]
        mov dword [RinkModelBounds], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door01
        push dword [RinkInstance]
        mov dword [RinkModelSize], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door02
        push dword [RinkInstance]
        mov dword [RinkModelFlags], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door10
        push dword [RinkInstance]
        mov dword [RinkModelHeader], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door11
        push dword [RinkInstance]
        mov dword [RinkModelVerts], eax
        call OriFindGroup
        add esp, byte 8
        push str_Door12
        push dword [RinkInstance]
        mov dword [RinkModelPolys], eax
        call OriFindGroup
        add esp, byte 8
        push str_Zambpath
        push dword [RinkInstance]
        mov dword [RinkDoor12Group], eax
        call OriFindPartition
        add esp, byte 8
        push RinkZamboniPathFaces
        push RinkZamboniPathCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchz0
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBenchZ0Faces
        push RinkBenchZ0Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchz1
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBenchZ1Faces
        push RinkBenchZ1Count
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchbot
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBenchBottomFaces
        push RinkBenchBottomCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchdiv
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBenchDividerFaces
        push RinkBenchDividerCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchbk
        push dword [RinkInstance]
        call OriFindPartition
        add esp, byte 8
        push RinkBenchBackFaces
        push RinkBenchBackCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_Benchx
        push dword [RinkInstance]
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Benchz0
        mov eax, dword [edi+eax]
        push dword [RinkInstance]
        mov dword [RinkBenchXGroup], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Benchz1
        mov eax, dword [byte edi+eax+08h]
        push dword [RinkInstance]
        mov dword [RinkBenchZ0Group], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        mov dword [BenchGroupCount], 0
        mov dword [RinkBenchZ1Group], eax
.3:
        push dword [BenchGroupCount]
        push str_Pbench0D
        lea eax, [byte ebp-028h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-028h]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .4
        mov eax, dword [BenchGroupCount]
        push eax
        push str_Pbench1D
        mov dword [nosplit eax*4+PenBoxBenchGroups], edx
        lea eax, [byte ebp-028h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-028h]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .4
        mov eax, dword [BenchGroupCount]
        inc dword [BenchGroupCount]
        mov dword [nosplit eax*4+BenchGroups], edx
        cmp dword [BenchGroupCount], byte 7
        jl short .3
.4:
        push str_B00
        push dword [RinkInstance]
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+04h]
        push str_Gt007
        sar eax, 2
        push dword [RinkInstance]
        mov dword [RinkB00FirstVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        push str_Gt004
        sar eax, 2
        push dword [RinkInstance]
        mov dword [RinkGt007LastVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        push str_Gt302
        sar eax, 2
        push dword [RinkInstance]
        mov dword [RinkGt004LastVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+04h]
        push str_Gt004
        sar eax, 2
        push dword [RinkInstance]
        mov dword [RinkGt302FirstVert], eax
        call OriFindGroup
        imul eax, byte 0Ch
        mov eax, dword [byte edi+eax+04h]
        sar eax, 2
        add esp, byte 8
        mov dword [RinkGt004FirstVert], eax
        mov eax, esi
        call LoadIceTexture
        push str_Crease
        push dword [RinkInstance]
        call OriFindMaterial
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+014h]
        add esp, byte 8
        mov eax, dword [byte edx+eax+04h]
        mov dword [IceLogoGroupCount], 0
        mov dword [RinkCreaseMaterial], eax
.5:
        push dword [IceLogoGroupCount]
        push str_R02d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-010h]
        push eax
        push dword [RinkInstance]
        call OriFindGroup
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .6
        mov eax, dword [IceLogoGroupCount]
        inc dword [IceLogoGroupCount]
        mov dword [nosplit eax*4+IceLogoGroups], edx
        cmp dword [IceLogoGroupCount], byte 10h
        jl short .5
.6:
        push str_C03
        push dword [RinkInstance]
        call OriFindGroup
        add esp, byte 8
        push str_C02
        push dword [RinkInstance]
        mov dword [RinkC03Group], eax
        call OriFindGroup
        add esp, byte 8
        push str_C01
        push dword [RinkInstance]
        mov dword [RinkC02Group], eax
        call OriFindGroup
        add esp, byte 8
        push str_C00
        push dword [RinkInstance]
        mov dword [RinkC01Group], eax
        call OriFindGroup
        add esp, byte 8
        mov dword [RinkModelNormals], eax
        call BuildCircleTable
        push str_Center
        push dword [RinkInstance]
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff0
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkLength], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff1
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkWidth], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff2
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkCorner], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff3
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkModelBytes], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff4
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkModelFile], edx
        call OriFindGroup
        imul eax, byte 0Ch
        mov edx, dword [byte ebp-04h]
        add edx, eax
        add esp, byte 8
        mov dword [RinkMarkingPoints+694h], edx
        push str_Faceoff5
        push dword [RinkInstance]
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff6
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkMarkingPoints+698h], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff7
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkMarkingPoints+69Ch], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Goal02
        add edx, eax
        push dword [RinkInstance]
        mov dword [RinkMarkingPoints+6A0h], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Goal12
        add edx, eax
        push dword [RinkInstance]
        mov dword [CircleTableCount], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Maxx
        add edx, eax
        push dword [RinkInstance]
        mov dword [CircleTableUsed], edx
        call OriFindGroup
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_IceLine
        add edx, eax
        push dword [RinkInstance]
        mov dword [CircleTablePtr], edx
        call OriFindPartition
        add esp, byte 8
        push RinkIceLineFaces
        push RinkIceLineCount
        push eax
        push dword [RinkInstance]
        call OriGetPartition
        add esp, byte 10h
        push str_FatRedLines
        push dword [RinkInstance]
        call OriFindMaterial
        add esp, byte 8
        push FatRedLineFace
        push eax
        push dword [RinkInstance]
        mov edi, eax
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        imul edi, byte 14h
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+014h]
        push byte 20h
        mov ecx, esi
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call BuildAntiAliasTable
        push str_FatBlueLines
        push dword [RinkInstance]
        mov dword [FatLineAATable], eax
        call OriFindMaterial
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push FatBlueLineFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        mov eax, dword [RinkInstance]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call BuildAntiAliasTable
        push str_Glassline
        push dword [RinkInstance]
        mov dword [BlueLineAATable], eax
        call OriFindMaterial
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push GlassLineFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        mov eax, dword [RinkInstance]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call BuildAntiAliasTable
        push str_Topboards
        push dword [RinkInstance]
        mov dword [GlassLineAATable], eax
        call OriFindMaterial
        mov edi, eax
        add esp, byte 8
        imul edi, byte 14h
        push TopBoardsFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        mov eax, dword [RinkInstance]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call BuildAntiAliasTable
        push str_Botboards
        push dword [RinkInstance]
        mov dword [TopBoardsAATable], eax
        call OriFindMaterial
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push BotBoardsFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        mov eax, dword [RinkInstance]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call BuildAntiAliasTable
        push str_ThinRedLines
        push dword [RinkInstance]
        mov dword [BotBoardsAATable], eax
        call OriFindMaterial
        add esp, byte 8
        push ThinRedLineFace
        push eax
        push dword [RinkInstance]
        call OriSetMaterialDrawFn
        add esp, byte 0Ch
        call BuildRinkSides
        mov dword [ZamboniState+54h], 0
        mov dword [ZamboniState+58h], 0
        mov dword [GlassShakeOn], 0
        xor eax, eax
        mov dword [GlassBroken], 0
        jmp near LoadStandsArt_11B
;-----------------------------------------------------------------------------
; FreeRinkModel                                                   2751C  96 PC
; From FreeGameView: frees the rink models and art LoadRinkModel loaded
;-----------------------------------------------------------------------------
FreeRinkModel:
        push ebx
        push ecx
        push edx
        push dword [RinkModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [RinkInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [RinkShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [RinkSidesModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [Stands2Instance]
        call FreeMemBlock
        add esp, byte 4
        push dword [ScoreModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [ScoreInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [ScoreShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [PuckModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [PuckInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [PuckShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [PuckShadowModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [PuckShadowInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [NetModel]
        call FreeMemBlock
        add esp, byte 4
        push dword [HomeNetInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [AwayNetInstance]
        call FreeMemBlock
        add esp, byte 4
        push dword [NetShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [GlassLineAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [FatLineAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [BlueLineAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [TopBoardsAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [BotBoardsAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [GoalPipeAATable]
        call FreeMemBlock
        add esp, byte 4
        push dword [IceTextureBmp]
        call FreeBitmap
        add esp, byte 4
        push dword [IceTextureFile]
        call FreeMemBlock
        jmp near FreeStandsArt_21
;-----------------------------------------------------------------------------
; SetViewCamera                                2767F  96 PC, medium confidence
; (pos, matrix): sets the 3D camera position and matrix
;-----------------------------------------------------------------------------
SetViewCamera:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push edx
        mov edi, CameraFlashOn
        mov esi, eax
        movsd
        movsd
        movsd
        mov ecx, 9
        mov edi, FlashPolys
        mov esi, edx
        push eax
        rep movsd
        call SetRinkTranslation
        add esp, byte 4
        push dword [byte ebp-04h]
        call SetRinkMatrix
        jmp near LoadFshFile_E1
;-----------------------------------------------------------------------------
; DrawIceBackPoly                                 276B5  96 PC, low confidence
; Fills the far part of the ice surface
;-----------------------------------------------------------------------------
DrawIceBackPoly:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24Ch, 0
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 270Fh
        mov dword [byte ebp+07Ah], 0FFFFD8F1h
        mov ecx, dword [IceLogoGroupCount]
        xor eax, eax
        xor ebx, ebx
        xor edx, edx
        shl ecx, 2
        jmp short .2
.1:
        imul esi, dword [dword edx+IceLogoGroups], byte 0Ch
        mov dword [byte ebp+066h], esi
        mov esi, dword [RinkInstance]
        mov esi, dword [byte esi+078h]
        lea edi, [dword ebx+ebp-01CAh]
        add esi, dword [byte ebp+066h]
        movsd
        movsd
        movsd
        mov esi, dword [dword edx+IceLogoGroups]
        shl esi, 3
        mov dword [byte ebp+066h], esi
        mov esi, dword [RinkInstance]
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-03Ah]
        add esi, dword [byte ebp+066h]
        add eax, byte 8
        add ebx, byte 0Ch
        movsd
        movsd
        add edx, byte 4
        sub dword [byte eax+ebp-03Eh], byte 2
.2:
        cmp edx, ecx
        jl short .1
        push dword [NearClipZ]
        lea eax, [byte ebp-03Ah]
        push eax
        lea eax, [dword ebp-01CAh]
        push eax
        push dword [IceLogoGroupCount]
        xor esi, esi
        call ClipPolyNearZ
        add esp, byte 10h
        mov dword [byte ebp+076h], eax
        xor eax, eax
        jmp short .6
.3:
        mov edx, dword [byte eax+ebp-036h]
        cmp edx, dword [byte ebp+07Eh]
        jge short .4
        mov dword [byte ebp+07Eh], edx
        mov dword [byte ebp+06Eh], esi
.4:
        mov edx, dword [byte eax+ebp-036h]
        cmp edx, dword [byte ebp+07Ah]
        jle short .5
        mov dword [byte ebp+07Ah], edx
        mov dword [byte ebp+072h], esi
.5:
        add eax, byte 8
        inc esi
.6:
        cmp esi, dword [byte ebp+076h]
        jl short .3
        cmp dword [byte ebp+07Eh], byte 0
        jle short .7
        push byte 0
        push dword [byte ebp+07Eh]
        push dword [ViewScreenWidth]
        push byte 0
        push byte 0
        call FillRectClipped
        add esp, byte 14h
.7:
        mov eax, dword [ViewScreenHeight]
        dec eax
        cmp eax, dword [byte ebp+07Ah]
        jle short .8
        mov eax, dword [ViewScreenHeight]
        sub eax, dword [byte ebp+07Eh]
        push byte 0
        dec eax
        push eax
        mov eax, dword [byte ebp+07Ah]
        push dword [ViewScreenWidth]
        inc eax
        push eax
        push byte 0
        call FillRectClipped
        add esp, byte 14h
.8:
        mov ebx, dword [byte ebp+06Eh]
        mov ecx, dword [byte ebp+076h]
        xor eax, eax
        xor edx, edx
        shl ecx, 3
        jmp short .11
.9:
        cmp ebx, dword [byte ebp+076h]
        jl short .10
        xor ebx, ebx
.10:
        mov esi, ebx
        lea edi, [dword edx+ebp-0DAh]
        lea esi, [byte ebp+esi*8-03Ah]
        add edx, byte 8
        inc eax
        movsd
        movsd
        cmp ebx, dword [byte ebp+072h]
        je short .12
        inc ebx
.11:
        cmp edx, ecx
        jl short .9
.12:
        inc eax
        inc eax
        mov ebx, dword [byte ebp+07Ah]
        lea edx, [dword ebp-0DAh]
        mov dword [dword ebp+eax*8-0EAh], 0FFFFFC19h
        push edx
        mov dword [dword ebp+eax*8-0E6h], ebx
        push eax
        mov ebx, dword [byte ebp+07Eh]
        mov dword [dword ebp+eax*8-0E2h], 0FFFFFC19h
        push byte 0
        mov dword [dword ebp+eax*8-0DEh], ebx
        call FillPolygon
        mov edx, dword [byte ebp+06Eh]
        mov ebx, dword [byte ebp+076h]
        mov ecx, dword [byte ebp+076h]
        add esp, byte 0Ch
        xor eax, eax
        dec ebx
        shl ecx, 3
        mov dword [byte ebp+06Ah], ebx
        xor ebx, ebx
        jmp short .15
.13:
        test edx, edx
        jge short .14
        mov edx, dword [byte ebp+06Ah]
.14:
        mov esi, edx
        lea edi, [dword ebx+ebp-0DAh]
        lea esi, [byte ebp+esi*8-03Ah]
        add ebx, byte 8
        inc eax
        movsd
        movsd
        cmp edx, dword [byte ebp+072h]
        je short .16
        dec edx
.15:
        cmp ebx, ecx
        jl short .13
.16:
        inc eax
        inc eax
        mov ebx, dword [byte ebp+07Ah]
        lea edx, [dword ebp-0DAh]
        mov dword [dword ebp+eax*8-0EAh], 3E7h
        push edx
        mov dword [dword ebp+eax*8-0E6h], ebx
        push eax
        mov ebx, dword [byte ebp+07Eh]
        mov dword [dword ebp+eax*8-0E2h], 3E7h
        push byte 0
        mov dword [dword ebp+eax*8-0DEh], ebx
        call FillPolygon
        add esp, byte 0Ch
        jmp near BuildRinkSides_602
;-----------------------------------------------------------------------------
; DrawIceMarkings                                 278B9  96 PC, low confidence
; Draws the ice markings (circles, lines, creases)
;-----------------------------------------------------------------------------
DrawIceMarkings:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0B0h, 0
        sub ebp, 82h
        mov eax, dword [RinkInstance]
        and byte [byte eax+010h], 0FDh
        cmp byte [IceTextureOn], 0
        je short .2
        xor edx, edx
        xor ebx, ebx
        xor eax, eax
.1:
        imul esi, dword [dword eax+RinkC03Group], byte 0Ch
        mov ecx, dword [RinkInstance]
        mov ecx, dword [byte ecx+078h]
        lea edi, [byte ebx+ebp-02Eh]
        add esi, ecx
        movsd
        movsd
        movsd
        mov edi, dword [dword eax+RinkC03Group]
        mov ecx, dword [RinkInstance]
        shl edi, 3
        mov esi, dword [byte ecx+07Ch]
        add edx, byte 8
        add esi, edi
        lea edi, [byte edx+ebp+04Ah]
        add ebx, byte 0Ch
        add eax, byte 4
        movsd
        movsd
        cmp eax, byte 10h
        jne short .1
        lea eax, [byte ebp+052h]
        push eax
        lea eax, [byte ebp-02Eh]
        push eax
        push byte 4
        call FillFloorPlane
        add esp, byte 0Ch
        push dword [RinkIce2Faces]
        push dword [RinkIce2Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        jmp short .3
.2:
        mov eax, dword [RinkInstance]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte eax+07Ch]
        mov eax, dword [byte eax+078h]
        call SetPolyVertexArrays
        mov edx, IceLogoGroups
        mov ebx, dword [IceCrudColour]
        mov eax, dword [IceLogoGroupCount]
        call DrawMarkingPolys
.3:
        call DrawIceSurface
        mov eax, dword [CircleTableCount]
        cmp dword [byte eax+08h], byte 50h
        jle short .6
        cmp dword [byte eax+04h], byte 0
        jge short .4
        mov edx, dword [byte eax+04h]
        neg edx
        jmp short .5
.4:
        mov edx, dword [byte eax+04h]
.5:
        mov eax, dword [CircleTableCount]
        cmp edx, dword [byte eax+08h]
        jge short .6
        xor edx, edx
        call DrawEndZoneMarkings
.6:
        mov eax, dword [CircleTableUsed]
        cmp dword [byte eax+08h], byte 50h
        jle short .9
        cmp dword [byte eax+04h], byte 0
        jge short .7
        mov edx, dword [byte eax+04h]
        neg edx
        jmp short .8
.7:
        mov edx, dword [byte eax+04h]
.8:
        mov eax, dword [CircleTableUsed]
        cmp edx, dword [byte eax+08h]
        jge short .9
        mov edx, 1
        call DrawEndZoneMarkings
.9:
        mov eax, dword [CircleTablePtr]
        call DrawCentreMarkings
        push dword [RinkIceLineFaces]
        push dword [RinkIceLineCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [RinkInstance]
        or byte [byte eax+010h], 2
        add esp, byte 0Ch
        cmp byte [IceLogosOn], 0
        je short .10
        push dword [RinkIceLogo2Faces]
        push dword [RinkIceLogo2Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.10:
        mov eax, dword [RinkLength]
        xor edx, edx
        mov ebx, 4
        call DrawFaceoffCircle
.11:
        mov edx, 1
        mov eax, dword [dword ebx+RinkLength]
        add ebx, byte 4
        call DrawFaceoffCircle
        cmp ebx, byte 14h
        jne short .11
        mov edx, dword [BlueLineAATable]
        mov eax, dword [RinkLength]
        mov ebx, 4
        call DrawRinkLinePoly
.12:
        mov edx, dword [FatLineAATable]
        mov eax, dword [dword ebx+RinkLength]
        add ebx, byte 4
        call DrawRinkLinePoly
        cmp ebx, byte 14h
        jne short .12
        xor ebx, ebx
.13:
        mov edx, dword [FatLineAATable]
        mov eax, dword [dword ebx+RinkMarkingPoints+694h]
        add ebx, byte 4
        call DrawRinkLinePoly
        cmp ebx, byte 10h
        jne short .13
        cmp byte [PlayerDetailOn], 0
        je near BuildRinkSides_602
        push IceLinesRemap
        call SetRemapTable
        add esp, byte 4
        push dword [RinkLitesFaces]
        push dword [RinkLitesCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        push IceLogosRemap
        mov dword [byte ebp+07Ah], GlassPanelList
        mov dword [byte ebp+076h], 0
        call SetRemapTable
        add esp, byte 4
.14:
        mov eax, dword [byte ebp+07Ah]
        cmp dword [eax], byte 0
        je near .18
        cmp dword [byte eax+04h], byte 0
        je near .18
        mov eax, dword [byte eax+018h]
        mov edx, RinkFloorPoints
        shl eax, 2
        add edx, eax
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+07Eh], edx
        jmp near .17
.15:
        mov eax, dword [byte ebp+07Eh]
        mov eax, dword [eax]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne near .16
        mov eax, dword [byte ebp+07Eh]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        imul esi, dword [eax], byte 0Ch
        mov eax, dword [TextureDetail]
        lea edi, [byte ebp+02h]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+04h], byte 0Ch
        lea edi, [byte ebp+0Eh]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+08h], byte 0Ch
        lea edi, [byte ebp+01Ah]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+0Ch], byte 0Ch
        lea edi, [byte ebp+026h]
        add esi, eax
        movsd
        movsd
        movsd
        mov eax, dword [byte ebp+02Ah]
        sub eax, dword [byte ebp+06h]
        add eax, eax
        add dword [byte ebp+06h], eax
        mov eax, dword [byte ebp+01Eh]
        sub eax, dword [byte ebp+012h]
        add eax, eax
        push byte 10h
        add dword [byte ebp+012h], eax
        lea eax, [byte ebp+032h]
        push eax
        lea eax, [byte ebp+02h]
        push eax
        push byte 4
        call ProjectPointsPersp
        add esp, byte 10h
        lea eax, [byte ebp+032h]
        push eax
        push byte 4
        call RemapPolygon
        add esp, byte 8
.16:
        inc dword [byte ebp+072h]
        add dword [byte ebp+07Eh], byte 4
.17:
        mov edx, dword [byte ebp+07Ah]
        mov eax, dword [byte ebp+072h]
        cmp eax, dword [byte edx+0Ch]
        jl near .15
.18:
        inc dword [byte ebp+076h]
        add dword [byte ebp+07Ah], 88h
        cmp dword [byte ebp+076h], byte 12h
        jl near .14
        jmp near BuildRinkSides_602
;-----------------------------------------------------------------------------
; DrawRinkModels                               27BF1  96 PC, medium confidence
; Draws the rink, the stands (StandsOn) and the score clock (ScoreClockOn)
; models
;-----------------------------------------------------------------------------
DrawRinkModels:
        push ebx
        push ecx
        push edx
        push dword [RinkInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [RinkInstance]
        call ProjectModelPoints
        add esp, byte 4
        cmp byte [StandsOn], 0
        je short .1
        push dword [Stands2Instance]
        call DrawModelFlat
        add esp, byte 4
        push dword [Stands2Instance]
        call ProjectModelPoints
        add esp, byte 4
.1:
        cmp byte [ScoreClockOn], 0
        je short .2
        push dword [ScoreInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [ScoreInstance]
        call ProjectModelPoints
        add esp, byte 4
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRinkPlayers                                 27C5E  96 PC, low confidence
; Draws the sorted players (SortCords) as rink sprites (DrawRinkSprite)
;-----------------------------------------------------------------------------
DrawRinkPlayers:
        push esi
        push edi
        enter 0B4h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 0
        xor edi, edi
        mov esi, SortCords
        mov dword [byte ebp+072h], edi
        mov dword [byte ebp+06Eh], edi
.1:
        cmp dword [InReplay], byte 0
        je near .4
        mov eax, dword [byte ebp+07Eh]
        cmp byte [dword eax+ReplayFrameState+2], 0
        je near .6
        movsx eax, word [dword edi+ReplayObjZ]
        cmp eax, byte 0FFFFFFFFh
        je near .6
        movsx eax, word [dword edi+ReplayObjX]
        cmp eax, dword [byte ebp-036h]
        jl near .6
        cmp eax, dword [byte ebp-03Ah]
        jg near .6
        movsx eax, word [dword edi+ReplayObjY]
        cmp eax, dword [byte ebp-03Eh]
        jl near .6
        cmp eax, dword [byte ebp-042h]
        jg near .6
        mov ax, word [dword edi+ReplayObjZ]
        mov word [byte ebp-020h], ax
        mov ax, word [dword edi+ReplayObjFrame]
        mov word [byte ebp+06h], ax
        mov ax, word [dword edi+ReplayObjAttr]
        mov word [byte ebp+08h], ax
        mov eax, dword [byte ebp+07Eh]
        movsx ax, byte [dword eax+ReplayFrameState+0A7h]
        mov word [byte ebp+04h], ax
        mov eax, dword [byte ebp+07Eh]
        cmp byte [dword eax+ReplayFrameState+8Ah], 0
        je short .2
        or byte [byte ebp+023h], 8
        jmp short .3
.2:
        and byte [byte ebp+023h], 0F7h
.3:
        lea eax, [byte ebp-032h]
        call PlayerSpriteFrame
        mov eax, dword [nosplit eax*4+SpriteArtPtrs]
        mov dword [byte ebp+076h], eax
        mov eax, dword [byte ebp+06Eh]
        push dword [dword eax+SpriteFrameIds]
        call SpriteScale
        add esp, byte 4
        mov edx, dword [byte ebp+07Eh]
        mov ebx, dword [byte ebp+072h]
        push byte 1
        movsx edx, byte [dword edx+ReplayFrameState+8Ah]
        push dword [byte ebp+07Eh]
        mov ecx, eax
        push edx
        mov edx, dword [byte ebp+072h]
        mov eax, dword [byte ebp+076h]
        jmp near .5
.4:
        cmp dword [dword esi+09Ch], byte 0
        je near .6
        movsx eax, word [byte esi+012h]
        cmp eax, byte 0FFFFFFFFh
        je near .6
        movsx eax, word [byte esi+02h]
        cmp eax, dword [byte ebp-036h]
        jl short .6
        cmp eax, dword [byte ebp-03Ah]
        jg short .6
        movsx eax, word [byte esi+06h]
        cmp eax, dword [byte ebp-03Eh]
        jl short .6
        cmp eax, dword [byte ebp-042h]
        jg short .6
        mov eax, esi
        call PlayerSpriteFrame
        mov eax, dword [nosplit eax*4+SpriteArtPtrs]
        mov dword [byte ebp+07Ah], eax
        mov eax, dword [byte ebp+06Eh]
        push dword [dword eax+SpriteFrameIds]
        call SpriteScale
        add esp, byte 4
        push byte 1
        movsx edx, word [dword esi+086h]
        push edx
        mov dx, word [byte esi+054h]
        xor dl, dl
        and dh, 8
        movsx edx, dx
        test edx, edx
        setne dl
        mov ebx, dword [byte ebp+072h]
        movzx edx, dl
        mov ecx, eax
        push edx
        mov edx, dword [byte ebp+072h]
        mov eax, dword [byte ebp+07Ah]
.5:
        mov ebx, dword [dword ebx+SpriteScreenY]
        mov edx, dword [dword edx+SpriteScreenX]
        call DrawRinkSprite
.6:
        add dword [byte ebp+072h], byte 8
        add dword [byte ebp+06Eh], byte 0Ch
        inc dword [byte ebp+07Eh]
        add esi, 0A0h
        inc edi
        inc edi
        cmp dword [byte ebp+07Eh], byte 11h
        jl near .1
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawBenchPlayers                                27E24  96 PC, low confidence
; (team): draws a team's bench players (BenchPlayersOn)
;-----------------------------------------------------------------------------
DrawBenchPlayers:
        push ebx
        push ecx
        push esi
        push edi
        enter 44h, 0
        push edx
        cmp byte [BenchPlayersOn], 0
        je near DrawBenchPlayers_F6
        imul esi, eax, byte 1Ch
        mov edx, dword [ShowMarkers]
        mov dword [ShowMarkers], 0
        mov dword [byte ebp-018h], edx
        add esi, PenBoxBenchGroups
        cmp dword [byte ebp-048h], byte 0
        jg short .1
        add esi, byte 18h
.1:
        lea edx, [byte eax+011h]
        imul eax, dword 126h
        add eax, BenchSpriteCount
        mov dword [byte ebp-010h], eax
        add eax, 126h
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], eax
.2:
        mov edi, dword [esi]
        mov eax, dword [RinkInstance]
        shl edi, 3
        mov edx, dword [byte eax+07Ch]
        add edi, edx
        imul edx, dword [esi], byte 0Ch
        mov eax, dword [byte eax+078h]
        add edx, eax
        cmp dword [InReplay], byte 0
        je short .3
        mov word [byte ebp-032h], 8F8h
        mov word [byte ebp-02Ch], 71Bh
        mov word [byte ebp-02Ah], 0
        lea eax, [byte ebp-044h]
        mov word [byte ebp-02Eh], 2
        jmp short .4
.3:
        mov eax, dword [byte ebp-010h]
.4:
        call BenchSpriteFrame
        mov dword [byte ebp-04h], eax
        mov eax, dword [nosplit eax*4+SpriteArtPtrs]
        mov dword [byte ebp-014h], eax
        push dword [byte edx+08h]
        call SpriteScale
        add esp, byte 4
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        je short .5
        push byte 0
        mov ecx, eax
        push dword [byte ebp-0Ch]
        mov ebx, dword [byte edi+04h]
        push byte 0
        mov edx, dword [edi]
        mov eax, dword [byte ebp-014h]
        call DrawRinkSprite
.5:
        cmp dword [byte ebp-048h], byte 0
        jle short .6
        add esi, byte 4
        jmp short .7
.6:
        sub esi, byte 4
.7:
        add dword [byte ebp-010h], byte 2Ah
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-08h]
        jne near .2
        mov eax, dword [byte ebp-018h]
DrawBenchPlayers_F1:
        mov dword [ShowMarkers], eax
DrawBenchPlayers_F6:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawBenchSide                                   27F20  96 PC, low confidence
; Draws the bench side of the rink (DrawRinkPlayers, DrawBenchPlayers)
;-----------------------------------------------------------------------------
DrawBenchSide:
        push ebx
        push ecx
        push edx
        enter 100h, 0
        lea ebx, [dword ebp-0100h]
        push ebx
        call GetRemapTable
        add esp, byte 4
        push StandsArtTable+44h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBottomFaces]
        push dword [RinkBenchBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp ebx, dword [RinkBenchXGroup]
        jle short .1
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.1:
        cmp dword [BenchSideIndex], byte 0
        jg near .3
        mov ecx, 190h
        mov eax, 0FFFFFEACh
        mov ebx, dword [RinkBenchZ1Group]
        xor edx, edx
        sar ebx, 2
        call DrawRinkPlayers
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        mov edx, 0FFFFFFFFh
        mov eax, 1
        call DrawBenchPlayers
        xor ebx, ebx
        mov eax, 0FFFFFEACh
        mov ecx, dword [RinkBenchZ1Group]
        xor edx, edx
        sar ecx, 2
        call DrawRinkPlayers
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkBenchZ0Group]
        jge short .2
        mov edx, 1
        xor eax, eax
        call DrawBenchPlayers
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [RinkBenchZ0Group]
        xor edx, edx
        sar ebx, 2
        call DrawRinkPlayers
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.2:
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkBenchZ0Group]
        jl near .6
        mov edx, 1
        xor eax, eax
        call DrawBenchPlayers
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [RinkBenchZ0Group]
        xor edx, edx
        sar ebx, 2
        jmp near .5
.3:
        jle near .6
        mov ebx, 0FFFFFE70h
        mov eax, 0FFFFFEACh
        mov ecx, dword [RinkBenchZ0Group]
        xor edx, edx
        sar ecx, 2
        call DrawRinkPlayers
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        mov edx, 0FFFFFFFFh
        xor eax, eax
        call DrawBenchPlayers
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [RinkBenchZ0Group]
        xor edx, edx
        sar ebx, 2
        call DrawRinkPlayers
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkBenchZ1Group]
        jle short .4
        mov edx, 1
        mov eax, edx
        xor ebx, ebx
        call DrawBenchPlayers
        mov eax, 0FFFFFEACh
        mov ecx, dword [RinkBenchZ1Group]
        xor edx, edx
        sar ecx, 2
        call DrawRinkPlayers
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.4:
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkBenchZ1Group]
        jg short .6
        mov edx, 1
        mov eax, edx
        xor ebx, ebx
        call DrawBenchPlayers
        mov eax, 0FFFFFEACh
        mov ecx, dword [RinkBenchZ1Group]
        xor edx, edx
        sar ecx, 2
.5:
        call DrawRinkPlayers
.6:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkBenchXGroup]
        jg short .7
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.7:
        lea ebx, [dword ebp-0100h]
        push ebx
        call SetRemapTable
        add esp, byte 4
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawPenaltyBoxPlayers                        281DC  96 PC, medium confidence
; (team): draws up to 3 players in a team's penalty box (PBnum)
;-----------------------------------------------------------------------------
DrawPenaltyBoxPlayers:
        push ebx
        push ecx
        push esi
        push edi
        enter 44h, 0
        push edx
        mov edx, dword [ShowMarkers]
        mov dword [ShowMarkers], 0
        mov dword [byte ebp-08h], edx
        cmp dword [InReplay], byte 0
        je short .1
        movsx edi, byte [dword eax+ReplayFrameState+113h]
        jmp short .2
.1:
        movsx edi, byte [dword eax+PBnum]
.2:
        cmp edi, byte 3
        jle short .3
        mov edi, 3
.3:
        test edi, edi
        jle near .11
        mov esi, eax
        shl esi, 4
        add esi, PenBoxNearGroups
        cmp dword [byte ebp-048h], byte 0
        jg short .4
        mov edx, edi
        shl edx, 2
        sub edx, byte 4
        add esi, edx
.4:
        lea edx, [byte eax+011h]
        imul eax, byte 7Eh
        mov dword [byte ebp-0Ch], 0
        add eax, BenchSprites
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-04h], eax
        jmp near .10
.5:
        mov edx, dword [esi]
        mov eax, dword [RinkInstance]
        shl edx, 3
        mov ebx, dword [byte eax+07Ch]
        add ebx, edx
        imul edx, dword [esi], byte 0Ch
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], ebx
        add edx, eax
        cmp dword [InReplay], byte 0
        je short .6
        mov word [byte ebp-032h], 8F8h
        mov word [byte ebp-02Ch], 71Bh
        mov word [byte ebp-02Ah], 0
        lea eax, [byte ebp-044h]
        mov word [byte ebp-02Eh], 6
        jmp short .7
.6:
        mov eax, dword [byte ebp-04h]
.7:
        call BenchSpriteFrame
        mov eax, dword [nosplit eax*4+SpriteArtPtrs]
        mov dword [byte ebp-014h], eax
        push dword [byte edx+08h]
        call SpriteScale
        add esp, byte 4
        mov ebx, dword [byte ebp-010h]
        push byte 0
        mov edx, dword [byte ebp-010h]
        mov ecx, eax
        push dword [byte ebp-018h]
        mov eax, dword [byte ebp-014h]
        push byte 0
        mov ebx, dword [byte ebx+04h]
        mov edx, dword [edx]
        call DrawRinkSprite
        cmp dword [byte ebp-048h], byte 0
        jle short .8
        add esi, byte 4
        jmp short .9
.8:
        sub esi, byte 4
.9:
        add dword [byte ebp-04h], byte 2Ah
        inc dword [byte ebp-0Ch]
.10:
        cmp edi, dword [byte ebp-0Ch]
        jg near .5
.11:
        mov eax, dword [byte ebp-08h]
        jmp near DrawBenchPlayers_F1
        push edx
        shl eax, 4
        imul edx, dword [dword eax+RinkModelTexInfo], byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        add eax, edx
        pop edx
        ret
        shl eax, 4
        imul edx, dword [dword eax+edx*4+PenBoxNearGroups], byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        add eax, edx
        ret
;-----------------------------------------------------------------------------
; OpenPenaltyBoxDoor                           28327  96 PC, medium confidence
; (team): swings the penalty box door open (vertices of RinkModelSize /
; 15E6B4)
;-----------------------------------------------------------------------------
OpenPenaltyBoxDoor:
        push ebx
        push ecx
        push edx
        mov edx, eax
        test eax, eax
        je short .1
        mov eax, RinkModelVerts
        jmp short .2
.1:
        mov eax, RinkModelSize
.2:
        test edx, edx
        je short .3
        mov ebx, 1
        jmp short .4
.3:
        mov ebx, 0FFFFFFFFh
.4:
        imul ebx, byte 78h
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
OpenPenaltyBoxDoor_87:
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [RinkInstance]
        mov eax, dword [byte eax+070h]
        mov dword [byte edx+eax+08h], ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ClosePenaltyBoxDoor                          283C1  96 PC, medium confidence
; (team): puts the penalty box door back
;-----------------------------------------------------------------------------
ClosePenaltyBoxDoor:
        push ebx
        push ecx
        push edx
        mov edx, eax
        test eax, eax
        je short .1
        mov eax, RinkModelVerts
        jmp short .2
.1:
        mov eax, RinkModelSize
.2:
        test edx, edx
        je short .3
        mov ebx, 1
        jmp short .4
.3:
        mov ebx, 0FFFFFFFFh
.4:
        imul ebx, dword 0A0h
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [RinkMaxXGroup]
        mov dword [edx], ecx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [RinkMaxXGroup]
        mov dword [edx], ecx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [RinkInstance]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [RinkMaxXGroup]
        mov dword [edx], ecx
        jmp near OpenPenaltyBoxDoor_87
;-----------------------------------------------------------------------------
; SetPenaltyBoxDoor                            28459  96 PC, medium confidence
; (team, open): from asspenalty, assdopen, assepen and puckfaceoff2: opens or
; closes a penalty box door
;-----------------------------------------------------------------------------
SetPenaltyBoxDoor:
        push ebx
        mov ebx, eax
        test edx, edx
        je short .2
        call OpenPenaltyBoxDoor
        test ebx, ebx
        je short .1
        mov dword [PenBoxDoorAway], 1
        pop ebx
        ret
.1:
        mov dword [PenBoxDoorHome], 1
        pop ebx
        ret
.2:
        call ClosePenaltyBoxDoor
        test ebx, ebx
        je short .3
        mov dword [PenBoxDoorAway], edx
        pop ebx
        ret
.3:
        mov dword [PenBoxDoorHome], edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawBenchArea                                   2849A  96 PC, low confidence
; Draws the bench and penalty box glass and frames
;-----------------------------------------------------------------------------
DrawBenchArea:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 114h, 0
        imul eax, dword 88h
        mov esi, BenchAreaPoints
        mov edi, dword [RinkInstance]
        add esi, eax
        mov eax, dword [dword edi+080h]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte edi+078h]
        mov dword [byte ebp-04h], eax
        lea eax, [dword ebp-0114h]
        push eax
        call GetRemapTable
        add esp, byte 4
        cmp dword [esi], byte 0
        je near DrawRinkFrontParts_194
        cmp byte [GlassOn], 0
        je short .4
        mov edi, dword [byte esi+020h]
        shl edi, 2
        add edi, SideGlassPoints
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .4
        cmp dword [byte esi+04h], byte 0
        je short .1
        push StandsArtTable+44h
        jmp short .2
.1:
        push StandsArtTable+144h
.2:
        call SetRemapTable
        add esp, byte 4
        cmp dword [byte esi+024h], byte 0
        jne short .3
        call DrawGlassShards
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.4:
        mov edi, dword [byte esi+018h]
        shl edi, 2
        add edi, RinkFloorPoints
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call TransformRinkPoints
        add esp, byte 8
        test eax, eax
        jne short .6
        cmp dword [byte esi+04h], byte 0
        je short .5
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        push dword [RinkFlatBoardsMaterial]
        call FillTexturePoly
        add esp, byte 0Ch
        jmp short .6
.5:
        push RinkFrontRemap
        call SetRemapTable
        add esp, byte 4
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call FillTexturePolyClipped
        add esp, byte 8
.6:
        mov eax, dword [byte esi+030h]
        mov dword [byte ebp-010h], eax
        mov eax, dword [byte esi+034h]
        mov dword [byte ebp-014h], eax
        imul eax, dword [byte ebp-010h], byte 0Ch
        push dword [BenchLineModel]
        add eax, dword [byte ebp-04h]
        push eax
        call PerspScale
        mov edi, eax
        imul eax, dword [byte ebp-014h], byte 0Ch
        add esp, byte 8
        push dword [BenchLineModel]
        add eax, dword [byte ebp-04h]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        push edi
        mov edi, dword [byte ebp-014h]
        shl edi, 3
        push dword [TopBoardsAATable]
        add edi, dword [byte ebp-08h]
        push dword [byte edi+04h]
        push dword [edi]
        mov edi, dword [byte ebp-010h]
        shl edi, 3
        add edi, dword [byte ebp-08h]
        push dword [byte edi+04h]
        push dword [edi]
        call DrawFixedLine
        add esp, byte 1Ch
        cmp dword [byte esi+04h], byte 0
        je near DrawRinkFrontParts_194
        mov eax, dword [byte esi+048h]
        mov dword [byte ebp-0Ch], eax
        imul eax, byte 0Ch
        push dword [BoardsTopModel]
        add eax, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte esi+04Ch]
        call PerspScale
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [BoardsTopModel]
        add eax, dword [byte ebp-04h]
        push eax
        call PerspScale
        add esp, byte 8
        push eax
        push esi
        mov esi, edi
        shl esi, 3
        push dword [BotBoardsAATable]
        add esi, dword [byte ebp-08h]
        push dword [byte esi+04h]
        push dword [esi]
        mov esi, dword [byte ebp-0Ch]
        shl esi, 3
        add esi, dword [byte ebp-08h]
        push dword [byte esi+04h]
        push dword [esi]
        call DrawFixedLine
        add esp, byte 1Ch
        jmp near DrawRinkFrontParts_194
;-----------------------------------------------------------------------------
; DrawPenaltyBoxSide                              28668  96 PC, low confidence
; Draws the penalty box side of the rink (DrawRinkPlayers,
; DrawPenaltyBoxPlayers)
;-----------------------------------------------------------------------------
DrawPenaltyBoxSide:
        push ebx
        push ecx
        push edx
        push dword [RinkPenBottomFaces]
        push dword [RinkPenBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp ebx, dword [RinkPenBoxT0Id]
        jge short .1
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.1:
        cmp dword [BenchSideIndex], byte 0
        jg near .9
        mov ecx, 190h
        mov edx, 154h
        mov ebx, dword [RinkPenBoxZ1LastVert]
        xor eax, eax
        sar ebx, 2
        call DrawRinkPlayers
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp ebx, dword [RinkMaxXGroup]
        jl short .2
        mov eax, 1
        call DrawBenchArea
.2:
        mov edx, 0FFFFFFFFh
        mov eax, 1
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxZ1LastVert]
        mov ebx, dword [RinkPenBoxT1LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jge short .3
        mov eax, 1
        call DrawBenchArea
.3:
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov edx, 154h
        mov ecx, dword [RinkPenBoxT1LastVert]
        mov ebx, dword [RinkPenBoxT0LastVert]
        add esp, byte 0Ch
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxT0LastVert]
        jge short .4
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.4:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jl short .5
        xor eax, eax
        call DrawBenchArea
.5:
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxZ0LastVert]
        jge short .6
        mov edx, 1
        xor eax, eax
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxT0LastVert]
        mov ebx, dword [RinkPenBoxZ0LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
.6:
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkPenBoxZ0LastVert]
        jl short .7
        mov edx, 1
        xor eax, eax
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxT0LastVert]
        mov ebx, dword [RinkPenBoxZ0LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
.7:
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxT0LastVert]
        jl short .8
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.8:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jge near .18
        xor eax, eax
        jmp near .17
.9:
        jle near .18
        mov ebx, 0FFFFFE70h
        mov edx, 154h
        mov ecx, dword [RinkPenBoxZ0LastVert]
        xor eax, eax
        sar ecx, 2
        call DrawRinkPlayers
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp ebx, dword [RinkMaxXGroup]
        jl short .10
        xor eax, eax
        call DrawBenchArea
.10:
        mov edx, 0FFFFFFFFh
        xor eax, eax
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxT0LastVert]
        mov ebx, dword [RinkPenBoxZ0LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jge short .11
        xor eax, eax
        call DrawBenchArea
.11:
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov edx, 154h
        mov ecx, dword [RinkPenBoxT1LastVert]
        mov ebx, dword [RinkPenBoxT0LastVert]
        add esp, byte 0Ch
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxT1LastVert]
        jle short .12
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.12:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jl short .13
        mov eax, 1
        call DrawBenchArea
.13:
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxZ1LastVert]
        jle short .14
        mov edx, 1
        mov eax, edx
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxZ1LastVert]
        mov ebx, dword [RinkPenBoxT1LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
.14:
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov ebx, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp ebx, dword [RinkPenBoxZ1LastVert]
        jg short .15
        mov edx, 1
        mov eax, edx
        call DrawPenaltyBoxPlayers
        mov edx, 154h
        mov ecx, dword [RinkPenBoxZ1LastVert]
        mov ebx, dword [RinkPenBoxT1LastVert]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call DrawRinkPlayers
.15:
        mov ebx, dword [BenchSideIndex]
        cmp ebx, dword [RinkPenBoxT1LastVert]
        jg short .16
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.16:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkMaxXGroup]
        jge short .18
        mov eax, 1
.17:
        call DrawBenchArea
.18:
        mov ebx, dword [CameraFlashOn]
        cmp ebx, dword [RinkPenBoxT0Id]
        jl short .19
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.19:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRinkBack                                    28A87  96 PC, low confidence
; From DrawGameFrame / DrawReplayView: the rink passes behind the players
; (stands, ice, glass)
;-----------------------------------------------------------------------------
DrawRinkBack:
        push ebx
        push ecx
        push edx
        call TransformRink
        mov eax, dword [Stands2Instance]
        and byte [byte eax+010h], 0FDh
        call DrawIceMarkings
        cmp byte [StandsOn], 0
        je short .1
        cmp dword [InReplay], byte 0
        je short .2
.1:
        call DrawIceBackPoly
.2:
        cmp byte [StandsOn], 0
        je short .3
        xor eax, eax
        call DrawStandsSides
        mov eax, 1
        call DrawStandsSides
.3:
        mov eax, dword [Stands2Instance]
        or byte [byte eax+010h], 2
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jg short .4
        call DrawPenaltyBoxSide
.4:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMinXGroup]
        jl short .5
        call DrawBenchSide
.5:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMaxZGroup]
        jg near .9
        cmp dword [CameraFlashOn], byte 0
        jg short .6
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.6:
        mov edx, RinkGreenLite1Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .7
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.7:
        cmp dword [ZamboniState+58h], byte 0
        je short .8
        cmp dword [GoalLightLit], byte 0
        jne short .8
        call DrawGoalLight
.8:
        mov ecx, 1B8h
        mov ebx, 168h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call DrawRinkPlayers
.9:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMinZGroup]
        jl near .13
        cmp dword [CameraFlashOn], byte 0
        jg short .10
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.10:
        mov edx, RinkRedLite0Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .11
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.11:
        cmp dword [ZamboniState+58h], byte 0
        je short .12
        cmp dword [GoalLightLit], byte 0
        je short .12
        call DrawGoalLight
.12:
        mov ecx, 0FFFFFE98h
        mov ebx, 0FFFFFE48h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call DrawRinkPlayers
.13:
        cmp byte [GlassOn], 0
        je short .14
        push StandsArtTable+44h
        call SetRemapTable
        add esp, byte 4
        mov eax, 1
        call DrawSideGlass
.14:
        call DrawRinkFloor
        mov eax, 1
        call DrawBoardTopLines
        call DrawKickplates
        mov eax, 1
        call DrawGlassFrameLines
        cmp byte [GlassOn], 0
        je short .15
        mov eax, 1
        call DrawBoardSegments
.15:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRinkFront                                   28C50  96 PC, low confidence
; From DrawGameFrame / DrawReplayView: the rink passes in front of the
; players
;-----------------------------------------------------------------------------
DrawRinkFront:
        push ebx
        push ecx
        push edx
        call DrawRinkFrontParts
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jle short .1
        call DrawPenaltyBoxSide
.1:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMinXGroup]
        jge short .2
        call DrawBenchSide
.2:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMaxZGroup]
        jle near .6
        cmp dword [ZamboniState+58h], byte 0
        je short .3
        cmp dword [GoalLightLit], byte 0
        jne short .3
        call DrawGoalLight
.3:
        cmp dword [CameraFlashOn], byte 0
        jg short .4
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.4:
        mov edx, RinkGreenLite1Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .5
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.5:
        mov ecx, 1B8h
        mov ebx, 168h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call DrawRinkPlayers
.6:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMinZGroup]
        jge near .10
        cmp dword [ZamboniState+58h], byte 0
        je short .7
        cmp dword [GoalLightLit], byte 0
        je short .7
        call DrawGoalLight
.7:
        cmp dword [CameraFlashOn], byte 0
        jg short .8
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.8:
        mov edx, RinkRedLite0Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .9
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.9:
        mov ecx, 0FFFFFE98h
        mov ebx, 0FFFFFE48h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call DrawRinkPlayers
.10:
        cmp byte [ScoreClockOn], 0
        je short .11
        push dword [ScoreInstance]
        call DrawModelPolys
        add esp, byte 4
.11:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawWholeRink                                28D97  96 PC, medium confidence
; From DrawRinkView: the whole rink with stands and glass on, no players
;-----------------------------------------------------------------------------
DrawWholeRink:
        push ebx
        push ecx
        push edx
        enter 108h, 0
        movsx eax, byte [StandsOn]
        mov byte [StandsOn], 1
        mov dword [byte ebp-08h], eax
        movsx eax, byte [RinkBoardsOn]
        mov byte [RinkBoardsOn], 1
        mov dword [byte ebp-04h], eax
        call TransformRink
        mov eax, dword [Stands2Instance]
        and byte [byte eax+010h], 0FDh
        xor eax, eax
        call DrawStandsSides
        call DrawIceMarkings
        mov eax, 1
        call DrawStandsSides
        mov eax, dword [Stands2Instance]
        or byte [byte eax+010h], 2
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jg near .11
        push dword [RinkPenBottomFaces]
        push dword [RinkPenBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0Id]
        jge short .1
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.1:
        cmp dword [BenchSideIndex], byte 0
        jg near .5
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        mov eax, 1
        call DrawBenchArea
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0LastVert]
        jge short .2
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.2:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jl short .3
        xor eax, eax
        call DrawBenchArea
.3:
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0LastVert]
        jl short .4
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.4:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jge near .10
        xor eax, eax
        jmp near .9
.5:
        jle near .10
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        xor eax, eax
        call DrawBenchArea
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT1LastVert]
        jle short .6
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.6:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jl short .7
        mov eax, 1
        call DrawBenchArea
.7:
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT1LastVert]
        jg short .8
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.8:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jge short .10
        mov eax, 1
.9:
        call DrawBenchArea
.10:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkPenBoxT0Id]
        jl short .11
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.11:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMinXGroup]
        jl near .19
        lea eax, [dword ebp-0108h]
        push eax
        call GetRemapTable
        add esp, byte 4
        push StandsArtTable+44h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBottomFaces]
        push dword [RinkBenchBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchXGroup]
        jle short .12
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.12:
        cmp dword [BenchSideIndex], byte 0
        jg short .14
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchZ0Group]
        jge short .13
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.13:
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        jmp short .16
.14:
        jle short .17
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchZ1Group]
        jle short .15
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.15:
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
.16:
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.17:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkBenchXGroup]
        jg short .18
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.18:
        lea eax, [dword ebp-0108h]
        push eax
        call SetRemapTable
        add esp, byte 4
.19:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMaxZGroup]
        jg short .21
        cmp dword [CameraFlashOn], byte 0
        jg short .20
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.20:
        mov edx, RinkGreenLite1Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .21
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.21:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMinZGroup]
        jl short .23
        cmp dword [CameraFlashOn], byte 0
        jg short .22
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.22:
        mov edx, RinkRedLite0Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .23
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.23:
        push StandsArtTable+44h
        call SetRemapTable
        add esp, byte 4
        mov eax, 1
        call DrawSideGlass
        call DrawRinkFloor
        mov eax, 1
        call DrawBoardTopLines
        call DrawKickplates
        mov eax, 1
        call DrawGlassFrameLines
        cmp byte [GlassOn], 0
        je short .24
        mov eax, 1
        call DrawBoardSegments
.24:
        push dword [ScoreInstance]
        call DrawModelPolys
        mov al, byte [byte ebp-08h]
        mov byte [StandsOn], al
        mov al, byte [byte ebp-04h]
        add esp, byte 4
        mov byte [RinkBoardsOn], al
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawZamboniScene                             2929F  96 PC, medium confidence
; From DrawInGameMenuFrame: the rink with the zamboni
;-----------------------------------------------------------------------------
DrawZamboniScene:
        push ebx
        push ecx
        push edx
        enter 100h, 0
        call MoveZamboni
        cmp dword [ZamboniLoaded], byte 0
        je short .1
        push dword [ZamboniInstance]
        call DrawModelFlat
        add esp, byte 4
        push dword [ZamboniInstance]
        call ProjectModelPoints
        add esp, byte 4
        push dword [ZamboniInstance]
        call DrawModelSorted
        add esp, byte 4
        push dword [ZamboniInstance]
        call DrawModelPolys
        add esp, byte 4
.1:
        call DrawRinkFrontParts
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jle near .12
        push dword [RinkPenBottomFaces]
        push dword [RinkPenBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0Id]
        jge short .2
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.2:
        cmp dword [BenchSideIndex], byte 0
        jg near .6
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        mov eax, 1
        call DrawBenchArea
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0LastVert]
        jge short .3
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.3:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jl short .4
        xor eax, eax
        call DrawBenchArea
.4:
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT0LastVert]
        jl short .5
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.5:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jge near .11
        xor eax, eax
        jmp near .10
.6:
        jle near .11
        push dword [RinkPenBoxZ0Faces]
        push dword [RinkPenBoxZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        xor eax, eax
        call DrawBenchArea
        push dword [RinkPenBoxT0Faces]
        push dword [RinkPenBoxT0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT1LastVert]
        jle short .7
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.7:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jl short .8
        mov eax, 1
        call DrawBenchArea
.8:
        push dword [RinkPenBoxZ1Faces]
        push dword [RinkPenBoxZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkPenBoxT1LastVert]
        jg short .9
        push dword [RinkPenBoxT1Faces]
        push dword [RinkPenBoxT1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.9:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMaxXGroup]
        jge short .11
        mov eax, 1
.10:
        call DrawBenchArea
.11:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkPenBoxT0Id]
        jl short .12
        push dword [RinkPenBackFaces]
        push dword [RinkPenBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.12:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkMinXGroup]
        jge near .20
        lea eax, [dword ebp-0100h]
        push eax
        call GetRemapTable
        add esp, byte 4
        push StandsArtTable+44h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBottomFaces]
        push dword [RinkBenchBottomCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [CameraFlashOn]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchXGroup]
        jle short .13
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.13:
        cmp dword [BenchSideIndex], byte 0
        jg short .15
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchZ0Group]
        jge short .14
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.14:
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        jmp short .17
.15:
        jle short .18
        push dword [RinkBenchZ0Faces]
        push dword [RinkBenchZ0Count]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
        push dword [RinkBenchDividerFaces]
        push dword [RinkBenchDividerCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        mov eax, dword [BenchSideIndex]
        add esp, byte 0Ch
        cmp eax, dword [RinkBenchZ1Group]
        jle short .16
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
.16:
        push dword [RinkBenchZ1Faces]
        push dword [RinkBenchZ1Count]
.17:
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.18:
        mov eax, dword [CameraFlashOn]
        cmp eax, dword [RinkBenchXGroup]
        jg short .19
        push StandsArtTable+144h
        call SetRemapTable
        add esp, byte 4
        push dword [RinkBenchBackFaces]
        push dword [RinkBenchBackCount]
        push dword [RinkInstance]
        call DrawModelPolyList
        add esp, byte 0Ch
.19:
        lea eax, [dword ebp-0100h]
        push eax
        call SetRemapTable
        add esp, byte 4
.20:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMaxZGroup]
        jle short .23
        cmp dword [ZamboniState+58h], byte 0
        je short .21
        cmp dword [GoalLightLit], byte 0
        jne short .21
        call DrawGoalLight
.21:
        cmp dword [CameraFlashOn], byte 0
        jg short .22
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.22:
        mov edx, RinkGreenLite1Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .23
        mov edx, RinkRedLite1Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
.23:
        mov eax, dword [BenchSideIndex]
        cmp eax, dword [RinkMinZGroup]
        jge short .26
        cmp dword [ZamboniState+58h], byte 0
        je short .24
        cmp dword [GoalLightLit], byte 0
        je short .24
        call DrawGoalLight
.24:
        cmp dword [CameraFlashOn], byte 0
        jg short .25
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.25:
        mov edx, RinkRedLite0Group
        mov eax, dword [BenchSideModel]
        call DrawSpriteAtVertex
        cmp dword [CameraFlashOn], byte 0
        jle short .26
        mov edx, RinkGreenLite0Group
        mov eax, dword [BoxModelData]
        call DrawSpriteAtVertex
.26:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetRinkClipWindow                            2976B  96 PC, medium confidence
; Copies the view clip window (DrawClipLeft-1228E4) into 16.16 for the rink
; draw
;-----------------------------------------------------------------------------
SetRinkClipWindow:
        movsx eax, word [DrawClipLeft]
        shl eax, 10h
        mov dword [LineClipLeft], eax
        movsx eax, word [DrawClipRight]
        shl eax, 10h
        mov dword [LineClipRight], eax
        movsx eax, word [DrawClipTop]
        shl eax, 10h
        mov dword [LineClipTop], eax
        movsx eax, word [DrawClipBottom]
        shl eax, 10h
        mov dword [LineClipBottom], eax
        ret
;-----------------------------------------------------------------------------
; LoadShadowRemap                                 297A8  96 PC, low confidence
; Loads the shadow colour remap
;-----------------------------------------------------------------------------
LoadShadowRemap:
        push ebx
        push ecx
        push edx
        push ShadowRemap
        push eax
        push dword 0E666h
        call TintRect
        mov byte [ShadowRemapEnd], 0FFh
        add esp, byte 0Ch
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; BeginShadowDraw                                 297C9  96 PC, low confidence
; Sets up drawing for player shadows
;-----------------------------------------------------------------------------
BeginShadowDraw:
        push ebx
        push ecx
        push edx
        push ShadowFill
        call SetColourRemap
        add esp, byte 4
        push ShadowRemap
        call SetRemapTable
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawShadowSprite                                297EA  96 PC, low confidence
; Draws a sprite as a shadow, clipped to the screen
;-----------------------------------------------------------------------------
DrawShadowSprite:
        push esi
        push edi
        enter 81Ch, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov edi, ebx
        mov dword [byte ebp-018h], ecx
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        mov eax, edx
        mov edx, dword [byte ebp+010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        imul eax, dword [byte ebp+014h]
        movsx edx, word [byte esi+08h]
        imul ecx, edx
        mov edx, dword [byte ebp-04h]
        shl edx, 10h
        sub edx, ecx
        mov dword [byte ebp-08h], 0
        sub edx, eax
        mov dword [byte ebp-04h], edx
        cmp edi, dword [DrawClipTop]
        jge short .1
        mov eax, dword [DrawClipTop]
        mov dword [byte ebp-010h], eax
        jmp short .2
.1:
        mov dword [byte ebp-010h], edi
.2:
        mov eax, dword [byte ebp-04h]
        sar eax, 10h
        sub edi, ebx
        cmp eax, dword [DrawClipRight]
        jge near .14
        cmp edi, dword [DrawClipBottom]
        jge near .14
        movsx eax, word [byte esi+06h]
        shl eax, 10h
        dec eax
        push dword [byte ebp+010h]
        mov dword [byte ebp-0Ch], eax
        call FixedInverse
        mov ecx, eax
        add esp, byte 4
        mov dword [byte ebp-01Ch], eax
        cmp edi, dword [byte ebp-010h]
        jge short .3
        mov ebx, dword [byte ebp-010h]
        sub ebx, edi
        mov edx, ebx
        imul ebx, ecx
        mov eax, dword [byte ebp+014h]
        mov edi, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-04h], eax
        sub dword [byte ebp-0Ch], ebx
.3:
        push dword [byte ebp-018h]
        call FixedInverse
        add esp, byte 4
        mov ecx, eax
        mov eax, dword [byte ebp-08h]
        xor edx, edx
        shl eax, 2
        jmp short .5
.4:
        inc dword [byte ebp-08h]
        mov ebx, edx
        add eax, byte 4
        sar ebx, 10h
        add edx, ecx
        mov dword [dword eax+ebp-0820h], ebx
.5:
        movsx ebx, word [byte esi+04h]
        shl ebx, 10h
        cmp edx, ebx
        jge short .6
        cmp eax, 800h
        jl short .4
.6:
        lea eax, [dword ebp-081Ch]
        push eax
        lea eax, [byte esi+010h]
        push eax
        call SetBlitSource
        mov eax, edi
        shl eax, 2
        add esp, byte 8
        mov dword [byte ebp-014h], eax
        jmp near .13
.7:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-08h]
        xor ebx, ebx
        sar eax, 10h
        cmp edi, dword [DrawClipBottom]
        jge near .14
        cmp eax, dword [DrawClipRight]
        jl short .8
        cmp dword [byte ebp+014h], byte 0
        jg near .14
        jmp near .12
.8:
        lea ecx, [edx+eax]
        cmp ecx, dword [DrawClipRight]
        jl short .9
        mov edx, ecx
        mov ecx, dword [byte ebp-08h]
        sub edx, dword [DrawClipRight]
        sub ecx, edx
        mov edx, ecx
.9:
        cmp eax, dword [DrawClipLeft]
        jge short .11
        lea ebx, [eax+edx]
        cmp ebx, dword [DrawClipLeft]
        jge short .10
        cmp dword [byte ebp+014h], byte 0
        jl short .14
        jmp short .12
.10:
        mov ebx, dword [DrawClipLeft]
        sub ebx, eax
        mov eax, dword [DrawClipLeft]
        sub edx, ebx
.11:
        test edx, edx
        jle short .12
        mov ecx, dword [byte ebp-0Ch]
        push edx
        sar ecx, 10h
        movsx edx, word [byte esi+04h]
        imul ecx, edx
        mov edx, dword [DrawDestBuffer]
        add ecx, dword [dword ebp+ebx*4-081Ch]
        add edx, dword [byte ebp-014h]
        push ecx
        add eax, dword [edx]
        push eax
        call ScaleRowShadow
        add esp, byte 0Ch
.12:
        mov eax, dword [byte ebp-01Ch]
        add dword [byte ebp-014h], byte 4
        sub dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp+014h]
        inc edi
        add dword [byte ebp-04h], eax
.13:
        cmp dword [byte ebp-0Ch], byte 0
        jge near .7
.14:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; DrawShadowSpriteAt                              299CF  96 PC, low confidence
; Draws a sprite shadow at a position
;-----------------------------------------------------------------------------
DrawShadowSpriteAt:
        push esi
        mov esi, edx
        mov edx, ebx
        mov ebx, ecx
        mov ecx, eax
        push dword 7333h
        sar ecx, 2
        push ecx
        mov ecx, eax
        mov eax, esi
        call DrawShadowSprite
        pop esi
        ret
OptionButtonJumpTable:                          ; jump table for the switch cases of DrawOptionButton
        dd DrawOptionButton_27
        dd DrawOptionButton_3F
        dd DrawOptionButton_5A
        dd DrawOptionButton_75
        dd DrawOptionButton_90
        dd DrawOptionButton_AB
        dd DrawOptionButton_C3
        dd DrawOptionButton_DB
        dd DrawOptionButton_F3
        dd DrawOptionButton_10B
;-----------------------------------------------------------------------------
; DrawOptionButton                                29A14  96 PC, low confidence
; Builds the art name for an option button and draws it
;-----------------------------------------------------------------------------
DrawOptionButton:
        push ebx
        push ecx
        push edx
        enter 8, 0
        mov edx, eax
        cmp dword [byte eax+04h], byte 0
        setne al
        mov edx, dword [edx]
        movzx ax, al
        cmp edx, byte 9
        ja near DrawOptionButton_10B.2
        jmp dword [nosplit cs:edx*4+OptionButtonJumpTable]
DrawOptionButton_27:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        and eax, byte 1
        push eax
        push str_B0DD
        jmp near DrawOptionButton_10B.1
DrawOptionButton_3F:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 1Eh
        shr eax, 1Fh
        push eax
        push str_B1DD
        jmp near DrawOptionButton_10B.1
DrawOptionButton_5A:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 1Dh
        shr eax, 1Fh
        push eax
        push str_B2DD
        jmp near DrawOptionButton_10B.1
DrawOptionButton_75:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 1Ch
        shr eax, 1Fh
        push eax
        push str_B3DD
        jmp near DrawOptionButton_10B.1
DrawOptionButton_90:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 1Ah
        shr eax, 1Eh
        push eax
        push str_B4DD
        jmp near DrawOptionButton_10B.1
DrawOptionButton_AB:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 19h
        shr eax, 1Fh
        push eax
        push str_B5DD
        jmp short DrawOptionButton_10B.1
DrawOptionButton_C3:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 18h
        shr eax, 1Fh
        push eax
        push str_B6DD
        jmp short DrawOptionButton_10B.1
DrawOptionButton_DB:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 17h
        shr eax, 1Fh
        push eax
        push str_B7DD
        jmp short DrawOptionButton_10B.1
DrawOptionButton_F3:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 15h
        shr eax, 1Eh
        push eax
        push str_B8DD
        jmp short DrawOptionButton_10B.1
DrawOptionButton_10B:
        cwde
        push eax
        mov eax, dword [OptionButtonBmp]
        mov eax, dword [byte eax+01h]
        shl eax, 14h
        shr eax, 1Fh
        push eax
        push str_B9DD
.1:
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 10h
.2:
        lea eax, [byte ebp-08h]
        push eax
        push dword [OptionButtonArt]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, dword [OptionButtonDY]
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, dword [OptionButtonDX]
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        leave
        pop edx
        pop ecx
        pop ebx
        ret
GameOptionsJumpTable:                           ; jump table for the switch cases of GameOptionsScreen
        dd GameOptionsScreen_64F
        dd GameOptionsScreen_66F
        dd GameOptionsScreen_68C
        dd GameOptionsScreen_6AA
        dd GameOptionsScreen_6C8
        dd GameOptionsScreen_6FD
        dd GameOptionsScreen_71E
        dd GameOptionsScreen_73F
        dd GameOptionsScreen_761
        dd GameOptionsScreen_799
;-----------------------------------------------------------------------------
; GameOptionsScreen                               29B9F  96 PC, low confidence
; Game options screen: ten option buttons over the menu background
;-----------------------------------------------------------------------------
GameOptionsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 7F4h, 0
        push eax
        sub ebp, 82h
        push byte 0
        push dword 0B9h
        push str_TEMP2
        call AllocMemBlock
        mov ecx, 0B9h
        mov esi, dword [gameopts]
        add esp, byte 0Ch
        mov edi, eax
        mov dword [OptionButtonBmp], eax
        rep movsb
        mov eax, 2
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 51h
        call LoadPackedFile
        push str_Bkgd26
        push eax
        mov dword [byte ebp+076h], 0FFFFFFFFh
        mov dword [OptionButtonArt], eax
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+066h], eax
        cmp dword [dword ebp-0776h], byte 0
        je short .1
        push str_Rsd1
        jmp short .2
.1:
        push str_Rsd0
.2:
        push dword [OptionButtonArt]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+062h], eax
        mov eax, dword [byte ebp+066h]
        push byte 0
        movsx eax, word [byte eax+06h]
        mov edx, dword [byte ebp+066h]
        push eax
        mov eax, dword [byte ebp+062h]
        movsx edx, word [byte edx+04h]
        movsx eax, word [byte eax+04h]
        add eax, edx
        push eax
        call CreateBitmap
        mov edx, dword [byte ebp+066h]
        mov dword [byte ebp+06Ah], eax
        mov dword [byte ebp+06Eh], eax
        mov eax, dword [byte eax+02Ch]
        mov dx, word [byte edx+0Ch]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [byte edx+0Eh]
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+06h]
        imul eax, edx
        add esp, byte 0Ch
        push byte 0
        add eax, byte 10h
        push eax
        push str_Saveback
        mov esi, dword [byte ebp+06Ah]
        call AllocMemBlock
        add esp, byte 0Ch
        mov edi, eax
        mov esi, dword [byte esi+02Ch]
        mov dword [byte ebp+066h], eax
        push eax
        movsd
        movsd
        movsd
        movsd
        movsb
        call DrawShapeAtOwnPos
        add esp, byte 4
        lea edx, [dword ebp-0772h]
        mov eax, 0Ch
        call InitMenuItems
        push dword [byte ebp+06Ah]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_Bkgd26
        push dword [OptionButtonArt]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+062h]
        add esp, byte 0Ch
        mov eax, dword [byte eax+02Ch]
        movsx edx, word [byte edx+0Ch]
        movsx eax, word [byte eax+0Ch]
        push byte 0
        sub edx, eax
        push edx
        push dword [byte ebp+062h]
        call PutBlock
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+0Ch]
        mov dword [OptionButtonDX], eax
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+07Ah], 0
        mov dword [OptionButtonDY], eax
        mov al, byte [byte ebp+07Ah]
        dec al
        lea edi, [dword ebp-0772h]
        mov byte [byte ebp+07Eh], al
        lea eax, [dword ebp-02AAh]
        add esp, byte 0Ch
        mov dword [byte ebp+072h], eax
.3:
        cmp dword [dword ebp-0776h], byte 0
        jne short .4
        cmp dword [byte ebp+07Ah], byte 9
        jne near .5
.4:
        imul esi, dword [byte ebp+07Ah], byte 66h
        push dword [byte ebp+07Ah]
        push str_WHD0
        lea eax, [byte ebp+056h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+056h]
        push eax
        push dword [OptionButtonArt]
        call FindShape
        add esp, byte 8
        mov dword [dword esi+ebp-0758h], eax
        lea eax, [byte ebp+056h]
        push eax
        push dword [OptionButtonArt]
        mov byte [byte ebp+059h], 31h
        call FindShape
        add esp, byte 8
        mov dword [dword esi+ebp-0754h], eax
        lea eax, [byte ebp+056h]
        push eax
        push dword [OptionButtonArt]
        mov byte [byte ebp+059h], 32h
        call FindShape
        mov dword [dword esi+ebp-0762h], 4
        mov dword [dword esi+ebp-0750h], eax
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [dword esi+ebp-0758h]
        shl eax, 6
        movsx ebx, word [byte edx+0Ch]
        mov dword [dword eax+ebp-02AAh], ebx
        movsx ebx, word [byte edx+0Eh]
        mov dword [dword eax+ebp-02A6h], ebx
        movsx ebx, word [byte edx+0Ch]
        mov dword [byte ebp+06Ah], ebx
        movsx ebx, word [byte edx+04h]
        add ebx, dword [byte ebp+06Ah]
        mov dword [dword eax+ebp-02A2h], ebx
        mov ebx, dword [dword eax+ebp-02A6h]
        mov dword [dword eax+ebp-029Eh], ebx
        mov ebx, dword [dword eax+ebp-02A2h]
        mov dword [dword eax+ebp-029Ah], ebx
        movsx edx, word [byte edx+06h]
        add edx, dword [dword eax+ebp-02A6h]
        sub edx, byte 3
        mov dword [dword eax+ebp-0296h], edx
        mov edx, dword [dword eax+ebp-02AAh]
        mov dword [dword eax+ebp-0292h], edx
        mov edx, dword [dword eax+ebp-0296h]
        mov byte [dword esi+ebp-072Eh], 0Ah
        mov dword [dword eax+ebp-028Eh], edx
        mov edx, dword [byte ebp+072h]
        mov dword [dword esi+ebp-075Eh], edx
        mov edx, dword [dword eax+ebp-02AAh]
        mov dword [dword esi+ebp-074Ch], edx
        mov edx, dword [dword eax+ebp-02A6h]
        mov dword [dword esi+ebp-0748h], edx
        mov edx, dword [dword eax+ebp-0292h]
        mov eax, dword [dword eax+ebp-028Eh]
        mov dword [dword esi+ebp-073Ch], DrawOptionButton
        sub eax, byte 0Ah
        mov dword [dword esi+ebp-0734h], eax
        mov al, byte [byte ebp+07Eh]
        add edx, byte 0Ah
        mov byte [dword esi+ebp-0730h], al
        mov al, byte [byte ebp+07Ah]
        mov dword [dword esi+ebp-0738h], edx
        inc al
        mov byte [dword esi+ebp-072Fh], al
        mov al, byte [byte ebp+07Ah]
        mov byte [dword esi+ebp-072Dh], al
        mov eax, dword [dword esi+ebp-0748h]
        add esp, byte 8
        sub eax, dword [OptionButtonDY]
        push eax
        mov eax, dword [dword esi+ebp-074Ch]
        sub eax, dword [OptionButtonDX]
        push eax
        push dword [dword esi+ebp-0758h]
        call DrawArt
        add esp, byte 0Ch
.5:
        inc byte [byte ebp+07Eh]
        add dword [byte ebp+072h], byte 40h
        mov eax, edi
        inc dword [byte ebp+07Ah]
        call DrawOptionButton
        add edi, byte 66h
        cmp dword [byte ebp+07Ah], byte 0Ah
        jl near .3
        mov byte [dword ebp-0730h], 0
        cmp dword [dword ebp-0776h], byte 0
        jne short .6
        mov byte [dword ebp-039Ah], 9
.6:
        push str_Rlxn
        mov byte [dword ebp-0397h], 0Bh
        push dword [OptionButtonArt]
        mov byte [dword ebp-0399h], 0Bh
        call FindShape
        add esp, byte 8
        push str_Rlxh
        push dword [OptionButtonArt]
        mov dword [dword ebp-035Ch], eax
        call FindShape
        mov dword [dword ebp-0358h], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [dword ebp-0366h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-02Ah], eax
        mov eax, dword [dword ebp-035Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-026h], eax
        mov eax, dword [dword ebp-035Ch]
        mov edx, dword [byte ebp-02Ah]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp-026h]
        mov dword [byte ebp-022h], edx
        mov dword [byte ebp-01Eh], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [byte ebp-01Ah], edx
        mov edx, dword [byte ebp-026h]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp-02Ah]
        mov dword [byte ebp-012h], eax
        lea eax, [byte ebp-02Ah]
        mov dword [dword ebp-0362h], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [byte ebp-016h], edx
        mov dword [byte ebp-0Eh], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0350h], eax
        mov eax, dword [dword ebp-035Ch]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push str_Rlyn
        mov dword [dword ebp-034Ch], eax
        mov eax, dword [byte ebp-022h]
        push dword [OptionButtonArt]
        sub eax, byte 8
        mov byte [dword ebp-0334h], 9
        mov dword [dword ebp-033Ch], eax
        lea eax, [byte edx-08h]
        mov byte [dword ebp-0331h], 0Bh
        mov dword [dword ebp-0338h], eax
        call FindShape
        add esp, byte 8
        push str_Rlyh
        push dword [OptionButtonArt]
        mov dword [dword ebp-02F6h], eax
        call FindShape
        mov dword [dword ebp-02F2h], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [dword ebp-0300h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp+016h], eax
        mov eax, dword [dword ebp-02F6h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+01Ah], eax
        mov eax, dword [dword ebp-02F6h]
        mov edx, dword [byte ebp+016h]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp+01Ah]
        mov dword [byte ebp+01Eh], edx
        mov dword [byte ebp+022h], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [byte ebp+026h], edx
        mov edx, dword [byte ebp+01Ah]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp+016h]
        mov dword [byte ebp+02Eh], eax
        lea eax, [byte ebp+016h]
        mov dword [dword ebp-02FCh], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [byte ebp+02Ah], edx
        mov dword [byte ebp+032h], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-02EAh], eax
        mov eax, dword [dword ebp-02F6h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-02E6h], eax
        mov eax, dword [byte ebp+01Eh]
        sub eax, byte 8
        add esp, byte 8
        mov dword [dword ebp-02D6h], eax
        lea eax, [byte edx-08h]
        mov byte [dword ebp-02CCh], 0Ah
        mov dword [dword ebp-02D2h], eax
        mov edx, eax
        mov eax, dword [dword ebp-02D6h]
        mov byte [dword ebp-02CEh], 9
        call SetMenuMouse
        mov dword [byte ebp+05Eh], 0Bh
        call SetScreenTarget
        mov eax, dword [byte ebp+06Eh]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [byte ebp+06Eh]
        call FreeBitmap
        mov dword [OptionButtonDX], 0
        mov dword [OptionButtonDY], 0
        add esp, byte 4
.7:
        call SoundIdle
        cmp dword [byte ebp+05Eh], byte 0
        jl short .9
        cmp dword [byte ebp+05Eh], byte 0Ch
        jge short .9
        imul eax, dword [byte ebp+05Eh], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0738h]
        jne short .8
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0734h]
        je short .9
.8:
        mov dword [byte ebp+05Eh], 0FFFFFFFFh
.9:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        or al, 2
        cmp dword [dword ebp-0776h], byte 0
        je short .10
        cwde
        push eax
        mov ebx, 0FFFFFFFFh
        push byte 0Ah
        lea eax, [byte ebp+05Eh]
        lea edx, [dword ebp-0772h]
        push eax
        xor ecx, ecx
        mov eax, 0Ch
        jmp short .11
.10:
        cwde
        push eax
        mov ebx, 0FFFFFFFFh
        push byte 0Ah
        lea eax, [byte ebp+05Eh]
        lea edx, [dword ebp-03DCh]
        push eax
        xor ecx, ecx
        mov eax, 3
.11:
        call RunMenu
        cmp dword [byte ebp+05Eh], byte 0
        jl near GameOptionsScreen_799.16
        cmp dword [byte ebp+05Eh], byte 9
        jg near GameOptionsScreen_799.16
        ja near GameOptionsScreen_799.19
        mov eax, dword [byte ebp+05Eh]
        jmp dword [nosplit cs:eax*4+GameOptionsJumpTable]
GameOptionsScreen_64F:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 1
        sete dl
        movzx edx, dl
        and byte [eax], 0FEh
        and edx, byte 1
.12:
        or dword [eax], edx
        jmp near GameOptionsScreen_799.19
GameOptionsScreen_66F:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 2
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0FDh
        add edx, edx
        jmp short GameOptionsScreen_64F.12
GameOptionsScreen_68C:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 4
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0FBh
        shl edx, 2
        jmp short GameOptionsScreen_64F.12
GameOptionsScreen_6AA:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 8
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0F7h
        shl edx, 3
        jmp short GameOptionsScreen_64F.12
GameOptionsScreen_6C8:
        mov eax, dword [OptionButtonBmp]
        mov edx, dword [byte eax+01h]
        and edx, byte 30h
        cmp edx, byte 20h
        jne short .13
        and byte [byte eax+01h], 0CFh
        jmp near GameOptionsScreen_799.19
.13:
        mov edx, dword [byte eax+01h]
        shl edx, 1Ah
        shr edx, 1Eh
        inc edx
        and edx, byte 3
        and byte [byte eax+01h], 0CFh
        shl edx, 4
.14:
        or dword [byte eax+01h], edx
        jmp near GameOptionsScreen_799.19
GameOptionsScreen_6FD:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 40h
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0BFh
        shl edx, 6
        jmp near GameOptionsScreen_64F.12
GameOptionsScreen_71E:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 80h
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 7Fh
        shl edx, 7
        jmp near GameOptionsScreen_64F.12
GameOptionsScreen_73F:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+02h], 1
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [byte eax+01h], 0FEh
        shl edx, 8
        jmp near GameOptionsScreen_64F.12
GameOptionsScreen_761:
        mov eax, dword [OptionButtonBmp]
        mov edx, dword [byte eax+01h]
        and edx, 600h
        cmp edx, 400h
        jne short .15
        and byte [byte eax+02h], 0F9h
        jmp near GameOptionsScreen_799.19
.15:
        mov edx, dword [byte eax+01h]
        shl edx, 15h
        shr edx, 1Eh
        inc edx
        and edx, byte 3
        and byte [byte eax+02h], 0F9h
        shl edx, 9
        jmp near GameOptionsScreen_6C8.14
GameOptionsScreen_799:
        mov edx, dword [OptionButtonBmp]
        lea eax, [byte edx+01h]
        test byte [byte edx+02h], 8
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [byte eax+01h], 0F7h
        shl edx, 0Bh
        jmp near GameOptionsScreen_64F.12
.16:
        cmp dword [byte ebp+05Eh], byte 0Ah
        jb short .19
        jbe short .17
        cmp dword [byte ebp+05Eh], byte 0Bh
        je short .18
        jmp short .19
.17:
        mov dword [byte ebp+076h], 1
        jmp short .19
.18:
        mov ecx, 0B9h
        mov esi, dword [OptionButtonBmp]
        mov edi, dword [gameopts]
        mov dword [byte ebp+076h], 1
        rep movsb
.19:
        cmp dword [byte ebp+076h], byte 0
        jl near GameOptionsScreen.7
        push dword [byte ebp+066h]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [OptionButtonBmp]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+066h]
        call FreeMemBlock
        add esp, byte 4
        push dword [OptionButtonArt]
        call FreeMemBlock
        add esp, byte 4
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
