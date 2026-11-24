; BSS of front/main (src/front/main).
bits 32
%include "hockey.inc"
section s_152C44 nobits alloc noexec write align=1
global str_WesternConference2, RosterTextBuf, LogoPackBuf, LogoPackFile, PanelShadeArt, MenuRemoteCursorArt, MenuCursorPixels, pointerspr
global MenuBitmapPixels
str_WesternConference2:                         ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 498
RosterTextBuf:                                  ; roster screen text buffer; used by RosterScreen
        resb 270
LogoPackBuf:                                    ; team logo pack buffer; used by LoadTeamLogo, ShutDown,
                                                ; StartUp
        resb 4
LogoPackFile:                                   ; team logo pack file; used by LoadTeamLogo, StartUp
        resb 4
PanelShadeArt:                                  ; panel shading art; used by DrawInGameMenuFrame,
                                                ; DrawOverlayPanels, DrawPanelLogo ...
        resb 4
MenuRemoteCursorArt:                            ; remote cursor art; used by OpenFrontEndFromGame,
                                                ; PauseBackToGame, PauseToFrontEnd ...
        resb 4
MenuCursorPixels:                               ; local cursor pixels; used by EditLinesHoverPanel,
                                                ; EditLinesScreen, OpenFrontEndFromGame ...
        resb 4
pointerspr:                                     ; mouse pointer sprite; used by EditLinesHoverPanel,
                                                ; EditLinesScreen, GameStatsScreen ...
        resb 4
MenuBitmapPixels:                               ; menu bitmap pixels; used by OpenFrontEndFromGame,
                                                ; PauseBackToGame, PauseToFrontEnd ...
        resb 4
