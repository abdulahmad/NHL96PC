; BSS of front/pregame (src/front/pregame).
bits 32
%include "hockey.inc"
section s_17DB7C nobits alloc noexec write align=1
global RightLogoFrames, LeftLogoFrames, LogoSpinFrame, LogoSpinTime, CardsSpeechPending, TeamsSpeechPending, AwayCardsSpeechPending, MatchupSpeechPending
RightLogoFrames:                                ; frames of the right team logo animation on the pre-game
                                                ; screen; used by CycleScreenPalettes, PreGameTeamsScreen
        resb 68
        resb 4
LeftLogoFrames:                                 ; frames of the left team logo animation on the pre-game
                                                ; screen; used by CycleScreenPalettes, PreGameTeamsScreen
        resb 72
LogoSpinFrame:                                  ; current spinning logo frame; used by CycleScreenPalettes,
                                                ; PreGameTeamsScreen
        resb 4
LogoSpinTime:                                   ; tick count for the next spinning logo frame; used by
                                                ; CycleScreenPalettes, PreGameTeamsScreen
        resb 4
CardsSpeechPending:                             ; announcer line due on the home player cards screen; used by
                                                ; PreGameScoutingCards, PreGameScreens
        resb 1
TeamsSpeechPending:                             ; announcer line due on the teams screen; used by
                                                ; PreGameScreens, PreGameTeamsScreen
        resb 1
AwayCardsSpeechPending:                         ; announcer line due on the away player cards screen; used by
                                                ; PreGameForwardCards, PreGameScreens
        resb 1
MatchupSpeechPending:                           ; used by PreGameMatchupScreen, PreGameScreens
        resb 1
