; Initialised data of front/settings (src/front/settings).
bits 32
%include "hockey.inc"
section s_11D3C8 progbits alloc noexec write align=1
extern str_AllStars, str_ANA2, str_Anaheim, str_AnaheimCalifornia, str_ASE2, str_ASW2, str_Blackhawks, str_Blues
extern str_BOS2, str_Boston, str_BostonMassachusetts, str_Bruins, str_BUF4, str_Buffalo, str_BuffaloNewYork, str_Calgary
extern str_CalgaryAlberta, str_Canadiens, str_Canucks, str_Capitals, str_CGY2, str_CHI2, str_Chicago, str_ChicagoIllinois
extern str_DAL2, str_Dallas, str_DallasTexas, str_DET2, str_Detroit, str_DetroitMichigan, str_Devils, str_Eastern
extern str_EastRutherfordNJ, str_EDM2, str_Edmonton, str_EdmontonAlberta, str_FLA2, str_Flames, str_Florida, str_Flyers
extern str_Hartford, str_HartfordConnecticut, str_HFD2, str_InglewoodCalifornia, str_Islanders, str_Jets, str_Kings, str_LA2
extern str_LandoverMaryland, str_Lightning, str_LosAngeles, str_MapleLeafs, str_MiamiFlorida, str_MightyDucks2, str_Montreal, str_MontrealQuebec
extern str_MTL2, str_NewJersey, str_NewYork, str_NewYorkNewYork, str_NJ2, str_Nordiques, str_NYI2, str_NYR2
extern str_Oilers, str_OTT2, str_Ottawa, str_OttawaOntario, str_Panthers, str_Penguins, str_PHI2, str_Philadelphia
extern str_PhiladelphiaPA, str_PIT2, str_Pittsburgh, str_PittsburghPA, str_QUE2, str_Quebec, str_QuebecCityQuebec, str_Rangers
extern str_RedWings, str_Sabres, str_SanJose, str_SanJoseCalifornia, str_Senators, str_Sharks, str_SJ2, str_Stars
extern str_STL2, str_StLouis, str_StLouisMissouri, str_TampaBay, str_TampaFlorida, str_TB2, str_TOR2, str_Toronto
extern str_TorontoOntario, str_UniondaleNewYork, str_VAN2, str_Vancouver, str_VancouverBC, str_Washington, str_Western, str_Whalers
extern str_Winnipeg, str_WinnipegManitoba, str_WPG2, str_WSH2
global DirPathTable, LogoNames, TeamCityNames, TeamFullNames, TeamNicknames, TeamDivisions, TeamJerseyStyle, TeamConferenceIds
global SeasonTeamOrder, DivisionTeamStarts
DirPathTable:                                   ; directory path table; used by MakeDataPath,
                                                ; MakeDataPathArchiveJumpTable, MakeDirPath ...
        db 00h,00h,00h,00h,019h,01h,00h,00h,01Ah,01h,00h,00h,01Bh,01h,00h,00h
        db 01Ch,01h,00h,00h
LogoNames:                                      ; team logo names; used by DrawPlayerStatsTable,
                                                ; DrawUserRecords, ExportPlayerStats ...
        dd str_ANA2
        dd str_BOS2
        dd str_BUF4
        dd str_CGY2
        dd str_CHI2
        dd str_DAL2
        dd str_DET2
        dd str_EDM2
        dd str_FLA2
        dd str_HFD2
        dd str_LA2
        dd str_MTL2
        dd str_NJ2
        dd str_NYI2
        dd str_NYR2
        dd str_OTT2
        dd str_PHI2
        dd str_PIT2
        dd str_QUE2
        dd str_STL2
        dd str_SJ2
        dd str_TB2
        dd str_TOR2
        dd str_VAN2
        dd str_WSH2
        dd str_WPG2
        dd str_ASW2
        dd str_ASE2
TeamCityNames:                                  ; pointers to team city names; used by DrawOverlayPanels,
                                                ; EditPlayoffName, PickPlayoffTeam ...
        dd str_Anaheim
        dd str_Boston
        dd str_Buffalo
        dd str_Calgary
        dd str_Chicago
        dd str_Dallas
        dd str_Detroit
        dd str_Edmonton
        dd str_Florida
        dd str_Hartford
        dd str_LosAngeles
        dd str_Montreal
        dd str_NewJersey
        dd str_NewYork
        dd str_NewYork
        dd str_Ottawa
        dd str_Philadelphia
        dd str_Pittsburgh
        dd str_Quebec
        dd str_StLouis
        dd str_SanJose
        dd str_TampaBay
        dd str_Toronto
        dd str_Vancouver
        dd str_Washington
        dd str_Winnipeg
        dd str_Western
        dd str_Eastern
TeamFullNames:                                  ; pointers to full team names; used by DrawOverlayPanels
        dd str_AnaheimCalifornia
        dd str_BostonMassachusetts
        dd str_BuffaloNewYork
        dd str_CalgaryAlberta
        dd str_ChicagoIllinois
        dd str_DallasTexas
        dd str_DetroitMichigan
        dd str_EdmontonAlberta
        dd str_MiamiFlorida
        dd str_HartfordConnecticut
        dd str_InglewoodCalifornia
        dd str_MontrealQuebec
        dd str_EastRutherfordNJ
        dd str_UniondaleNewYork
        dd str_NewYorkNewYork
        dd str_OttawaOntario
        dd str_PhiladelphiaPA
        dd str_PittsburghPA
        dd str_QuebecCityQuebec
        dd str_StLouisMissouri
        dd str_SanJoseCalifornia
        dd str_TampaFlorida
        dd str_TorontoOntario
        dd str_VancouverBC
        dd str_LandoverMaryland
        dd str_WinnipegManitoba
        dd str_SanJoseCalifornia
        dd str_SanJoseCalifornia
TeamNicknames:                                  ; pointers to team nicknames; used by DrawOverlayPanels,
                                                ; PreGameMatchupScreen, PreGameScoutingCards
        dd str_MightyDucks2
        dd str_Bruins
        dd str_Sabres
        dd str_Flames
        dd str_Blackhawks
        dd str_Stars
        dd str_RedWings
        dd str_Oilers
        dd str_Panthers
        dd str_Whalers
        dd str_Kings
        dd str_Canadiens
        dd str_Devils
        dd str_Islanders
        dd str_Rangers
        dd str_Senators
        dd str_Flyers
        dd str_Penguins
        dd str_Nordiques
        dd str_Blues
        dd str_Sharks
        dd str_Lightning
        dd str_MapleLeafs
        dd str_Canucks
        dd str_Capitals
        dd str_Jets
        dd str_AllStars
        dd str_AllStars
TeamDivisions:                                  ; division of each team; used by CopyTeamStatName,
                                                ; CreateSeason, NextUnusedPlayoffTeam ...
        db 01h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h,01h,00h,00h,00h
        db 02h,00h,00h,00h,02h,00h,00h,00h,02h,00h,00h,00h,01h,00h,00h,00h
        db 08h,00h,00h,00h,04h,00h,00h,00h,01h,00h,00h,00h,04h,00h,00h,00h
        db 08h,00h,00h,00h,08h,00h,00h,00h,08h,00h,00h,00h,04h,00h,00h,00h
        db 08h,00h,00h,00h,04h,00h,00h,00h,04h,00h,00h,00h,02h,00h,00h,00h
        db 01h,00h,00h,00h,08h,00h,00h,00h,02h,00h,00h,00h,01h,00h,00h,00h
        db 08h,00h,00h,00h,02h,00h,00h,00h
TeamJerseyStyle:                                ; jersey style of each team; used by DrawOverlayPanels,
                                                ; RunPreGameSkate
        db 01h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db 01h,00h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h,01h,00h,00h,00h
TeamConferenceIds:                              ; conference of each team; used by CopyTeamStatName,
                                                ; DrawStandings, Goal ...
        db 03h,00h,00h,00h,0Ch,00h,00h,00h,0Ch,00h,00h,00h,03h,00h,00h,00h
        db 03h,00h,00h,00h,03h,00h,00h,00h,03h,00h,00h,00h,03h,00h,00h,00h
        db 0Ch,00h,00h,00h,0Ch,00h,00h,00h,03h,00h,00h,00h,0Ch,00h,00h,00h
        db 0Ch,00h,00h,00h,0Ch,00h,00h,00h,0Ch,00h,00h,00h,0Ch,00h,00h,00h
        db 0Ch,00h,00h,00h,0Ch,00h,00h,00h,0Ch,00h,00h,00h,03h,00h,00h,00h
        db 03h,00h,00h,00h,0Ch,00h,00h,00h,03h,00h,00h,00h,03h,00h,00h,00h
        db 0Ch,00h,00h,00h,03h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h,00h
        db 07h,00h,00h,00h,0Ah,00h,00h,00h,014h,00h,00h,00h,017h,00h,00h,00h
        db 04h,00h,00h,00h,05h,00h,00h,00h,06h,00h,00h,00h,013h,00h,00h,00h
        db 016h,00h,00h,00h,019h,00h,00h,00h,01h,00h,00h,00h,02h,00h,00h,00h
        db 09h,00h,00h,00h,0Bh,00h,00h,00h,0Fh,00h,00h,00h,011h,00h,00h,00h
        db 012h,00h,00h,00h,08h,00h,00h,00h,0Ch,00h,00h,00h,0Dh,00h,00h,00h
        db 0Eh,00h,00h,00h,010h,00h,00h,00h,015h,00h,00h,00h,018h,00h,00h,00h
SeasonTeamOrder:                                ; teams in each division for the season screens; used by
                                                ; DrawSeasonTeams, NewSeasonScreen, SeasonMenuScreen
        db 06h,00h,00h,00h,06h,00h,00h
        db 00h,07h,00h,00h
        db 00h,07h,00h,00h,00h
DivisionTeamStarts:                             ; first team index of each division; used by DrawSeasonTeams
        db 00h,03h,07h,0Ah,014h,017h,063h,04h,05h,06h,013h,016h,019h,063h,01h,02h
        db 09h,0Bh,0Fh,011h,012h,08h,0Ch,0Dh,0Eh,010h,015h,018h,01Dh,01h,00h,00h
        db 01Eh,01h,00h,00h,01Fh,01h,00h,00h,020h,01h,00h,00h,021h,01h,00h,00h
        db 022h,01h,00h,00h,023h,01h,00h,00h,024h,01h,00h,00h,025h,01h,00h,00h
        db 026h,01h,00h,00h,027h,01h,00h,00h,028h,01h,00h,00h
