; Strings and constants of front/settings (src/front/settings), in link order.
bits 32
%include "hockey.inc"
section s_111940 progbits alloc noexec write align=1
global str_5552362337, str_ATF, str_ATD2, str_backslash, str_EXHIBITNDX, str_ANA2, str_BOS2, str_BUF4
global str_CGY2, str_CHI2, str_DAL2, str_DET2, str_EDM2, str_FLA2, str_HFD2, str_LA2
global str_MTL2, str_NJ2, str_NYI2, str_NYR2, str_OTT2, str_PHI2, str_PIT2, str_QUE2
global str_STL2, str_SJ2, str_TB2, str_TOR2, str_VAN2, str_WSH2, str_WPG2, str_ASW2
global str_ASE2, str_Anaheim, str_Boston, str_Buffalo, str_Calgary, str_Chicago, str_Dallas, str_Detroit
global str_Edmonton, str_Florida, str_Hartford, str_LosAngeles, str_Montreal, str_NewJersey, str_NewYork, str_Ottawa
global str_Philadelphia, str_Pittsburgh, str_Quebec, str_StLouis, str_SanJose, str_TampaBay, str_Toronto, str_Vancouver
global str_Washington, str_Winnipeg, str_Western, str_Eastern, str_AnaheimCalifornia, str_BostonMassachusetts, str_BuffaloNewYork, str_CalgaryAlberta
global str_ChicagoIllinois, str_DallasTexas, str_DetroitMichigan, str_EdmontonAlberta, str_MiamiFlorida, str_HartfordConnecticut, str_InglewoodCalifornia, str_MontrealQuebec
global str_EastRutherfordNJ, str_UniondaleNewYork, str_NewYorkNewYork, str_OttawaOntario, str_PhiladelphiaPA, str_PittsburghPA, str_QuebecCityQuebec, str_StLouisMissouri
global str_SanJoseCalifornia, str_TampaFlorida, str_TorontoOntario, str_VancouverBC, str_LandoverMaryland, str_WinnipegManitoba, str_MightyDucks2, str_Bruins
global str_Sabres, str_Flames, str_Blackhawks, str_Stars, str_RedWings, str_Oilers, str_Panthers, str_Whalers
global str_Kings, str_Canadiens, str_Devils, str_Islanders, str_Rangers, str_Senators, str_Flyers, str_Penguins
global str_Nordiques, str_Blues, str_Sharks, str_Lightning, str_MapleLeafs, str_Canucks, str_Capitals, str_Jets
global str_AllStars
str_5552362337:                                 ; string "5552362337"; used by ReadGlobalSet
        db 035h,035h,035h,032h,033h,036h,032h,033h,033h,037h,00h
str_ATF:                                        ; string 'AT &F'; used by ReadGlobalSet
        db 041h,054h,020h,026h,046h,00h
str_ATD2:                                       ; string 'ATD'; used by ReadGlobalSet
        db 041h,054h,044h,00h
str_backslash:                                  ; string '\'; used by ReadGlobalSet
        db 05Ch,00h,00h
str_EXHIBITNDX:                                 ; string 'EXHIBIT.NDX'; used by RunExhibitionMenus
        db 045h,058h,048h,049h,042h,049h,054h,02Eh,04Eh,044h,058h,00h
str_ANA2:                                       ; string 'ANA'
        db 041h,04Eh,041h,00h
str_BOS2:                                       ; string 'BOS'
        db 042h,04Fh,053h,00h
str_BUF4:                                       ; string 'BUF'
        db 042h,055h,046h,00h
str_CGY2:                                       ; string 'CGY'
        db 043h,047h,059h,00h
str_CHI2:                                       ; string 'CHI'
        db 043h,048h,049h,00h
str_DAL2:                                       ; string 'DAL'
        db 044h,041h,04Ch,00h
str_DET2:                                       ; string 'DET'
        db 044h,045h,054h,00h
str_EDM2:                                       ; string 'EDM'
        db 045h,044h,04Dh,00h
str_FLA2:                                       ; string 'FLA'
        db 046h,04Ch,041h,00h
str_HFD2:                                       ; string 'HFD'
        db 048h,046h,044h,00h
str_LA2:                                        ; string 'LA'
        db 04Ch,041h,00h
str_MTL2:                                       ; string 'MTL'
        db 04Dh,054h,04Ch,00h
str_NJ2:                                        ; string 'NJ'
        db 04Eh,04Ah,00h
str_NYI2:                                       ; string 'NYI'
        db 04Eh,059h,049h,00h
str_NYR2:                                       ; string 'NYR'
        db 04Eh,059h,052h,00h
str_OTT2:                                       ; string 'OTT'
        db 04Fh,054h,054h,00h
str_PHI2:                                       ; string 'PHI'
        db 050h,048h,049h,00h
str_PIT2:                                       ; string 'PIT'
        db 050h,049h,054h,00h
str_QUE2:                                       ; string 'QUE'
        db 051h,055h,045h,00h
str_STL2:                                       ; string 'STL'
        db 053h,054h,04Ch,00h
str_SJ2:                                        ; string 'SJ'
        db 053h,04Ah,00h
str_TB2:                                        ; string 'TB'
        db 054h,042h,00h
str_TOR2:                                       ; string 'TOR'
        db 054h,04Fh,052h,00h
str_VAN2:                                       ; string 'VAN'
        db 056h,041h,04Eh,00h
str_WSH2:                                       ; string 'WSH'
        db 057h,053h,048h,00h
str_WPG2:                                       ; string 'WPG'
        db 057h,050h,047h,00h
str_ASW2:                                       ; string 'ASW'
        db 041h,053h,057h,00h
str_ASE2:                                       ; string 'ASE'
        db 041h,053h,045h,00h
str_Anaheim:                                    ; team name string 1
        incbin "build/teamstrings.bin", 0, 8
str_Boston:                                     ; team name string 2
        incbin "build/teamstrings.bin", 8, 7
str_Buffalo:                                    ; team name string 3
        incbin "build/teamstrings.bin", 15, 8
str_Calgary:                                    ; team name string 4
        incbin "build/teamstrings.bin", 23, 8
str_Chicago:                                    ; team name string 5
        incbin "build/teamstrings.bin", 31, 8
str_Dallas:                                     ; team name string 6
        incbin "build/teamstrings.bin", 39, 7
str_Detroit:                                    ; team name string 7
        incbin "build/teamstrings.bin", 46, 8
str_Edmonton:                                   ; team name string 8
        incbin "build/teamstrings.bin", 54, 9
str_Florida:                                    ; team name string 9
        incbin "build/teamstrings.bin", 63, 8
str_Hartford:                                   ; team name string 10
        incbin "build/teamstrings.bin", 71, 9
str_LosAngeles:                                 ; team name string 11
        incbin "build/teamstrings.bin", 80, 12
str_Montreal:                                   ; team name string 12
        incbin "build/teamstrings.bin", 92, 9
str_NewJersey:                                  ; team name string 13
        incbin "build/teamstrings.bin", 101, 11
str_NewYork:                                    ; string 'New York'
        db 04Eh,065h,077h,020h,059h,06Fh,072h,06Bh,00h
str_Ottawa:                                     ; team name string 14
        incbin "build/teamstrings.bin", 112, 7
str_Philadelphia:                               ; team name string 15
        incbin "build/teamstrings.bin", 119, 13
str_Pittsburgh:                                 ; team name string 16
        incbin "build/teamstrings.bin", 132, 11
str_Quebec:                                     ; team name string 17
        incbin "build/teamstrings.bin", 143, 7
str_StLouis:                                    ; string 'St Louis'
        db 053h,074h,020h,04Ch,06Fh,075h,069h,073h,00h
str_SanJose:                                    ; team name string 18
        incbin "build/teamstrings.bin", 150, 9
str_TampaBay:                                   ; team name string 19
        incbin "build/teamstrings.bin", 159, 10
str_Toronto:                                    ; team name string 20
        incbin "build/teamstrings.bin", 169, 8
str_Vancouver:                                  ; team name string 21
        incbin "build/teamstrings.bin", 177, 10
str_Washington:                                 ; team name string 22
        incbin "build/teamstrings.bin", 187, 11
str_Winnipeg:                                   ; team name string 23
        incbin "build/teamstrings.bin", 198, 9
str_Western:                                    ; string 'Western'
        db 057h,065h,073h,074h,065h,072h,06Eh,00h
str_Eastern:                                    ; string 'Eastern'
        db 045h,061h,073h,074h,065h,072h,06Eh,00h
str_AnaheimCalifornia:                          ; team name string 24
        incbin "build/teamstrings.bin", 207, 20
str_BostonMassachusetts:                        ; team name string 25
        incbin "build/teamstrings.bin", 227, 22
str_BuffaloNewYork:                             ; team name string 26
        incbin "build/teamstrings.bin", 249, 18
str_CalgaryAlberta:                             ; team name string 27
        incbin "build/teamstrings.bin", 267, 17
str_ChicagoIllinois:                            ; team name string 28
        incbin "build/teamstrings.bin", 284, 18
str_DallasTexas:                                ; team name string 29
        incbin "build/teamstrings.bin", 302, 14
str_DetroitMichigan:                            ; team name string 30
        incbin "build/teamstrings.bin", 316, 18
str_EdmontonAlberta:                            ; team name string 31
        incbin "build/teamstrings.bin", 334, 18
str_MiamiFlorida:                               ; team name string 32
        incbin "build/teamstrings.bin", 352, 15
str_HartfordConnecticut:                        ; team name string 33
        incbin "build/teamstrings.bin", 367, 22
str_InglewoodCalifornia:                        ; string 'Inglewood, California'
        db 049h,06Eh,067h,06Ch,065h,077h,06Fh,06Fh,064h,02Ch,020h,043h,061h,06Ch,069h,066h
        db 06Fh,072h,06Eh,069h,061h,00h
str_MontrealQuebec:                             ; team name string 34
        incbin "build/teamstrings.bin", 389, 17
str_EastRutherfordNJ:                           ; string 'East Rutherford, N.J.'
        db 045h,061h,073h,074h,020h,052h,075h,074h,068h,065h,072h,066h,06Fh,072h,064h,02Ch
        db 020h,04Eh,02Eh,04Ah,02Eh,00h
str_UniondaleNewYork:                           ; string 'Uniondale, New York'
        db 055h,06Eh,069h,06Fh,06Eh,064h,061h,06Ch,065h,02Ch,020h,04Eh,065h,077h,020h,059h
        db 06Fh,072h,06Bh,00h
str_NewYorkNewYork:                             ; string 'New York, New York'
        db 04Eh,065h,077h,020h,059h,06Fh,072h,06Bh,02Ch,020h,04Eh,065h,077h,020h,059h,06Fh
        db 072h,06Bh,00h
str_OttawaOntario:                              ; team name string 35
        incbin "build/teamstrings.bin", 406, 16
str_PhiladelphiaPA:                             ; team name string 36
        incbin "build/teamstrings.bin", 422, 17
str_PittsburghPA:                               ; team name string 37
        incbin "build/teamstrings.bin", 439, 15
str_QuebecCityQuebec:                           ; team name string 38
        incbin "build/teamstrings.bin", 454, 20
str_StLouisMissouri:                            ; team name string 39
        incbin "build/teamstrings.bin", 474, 20
str_SanJoseCalifornia:                          ; team name string 40
        incbin "build/teamstrings.bin", 494, 21
str_TampaFlorida:                               ; team name string 41
        incbin "build/teamstrings.bin", 515, 15
str_TorontoOntario:                             ; team name string 42
        incbin "build/teamstrings.bin", 530, 17
str_VancouverBC:                                ; team name string 43
        incbin "build/teamstrings.bin", 547, 16
str_LandoverMaryland:                           ; string 'Landover, Maryland'
        db 04Ch,061h,06Eh,064h,06Fh,076h,065h,072h,02Ch,020h,04Dh,061h,072h,079h,06Ch,061h
        db 06Eh,064h,00h
str_WinnipegManitoba:                           ; team name string 44
        incbin "build/teamstrings.bin", 563, 19
str_MightyDucks2:                               ; team name string 45
        incbin "build/teamstrings.bin", 582, 13
str_Bruins:                                     ; team name string 46
        incbin "build/teamstrings.bin", 595, 7
str_Sabres:                                     ; team name string 47
        incbin "build/teamstrings.bin", 602, 7
str_Flames:                                     ; team name string 48
        incbin "build/teamstrings.bin", 609, 7
str_Blackhawks:                                 ; team name string 49
        incbin "build/teamstrings.bin", 616, 11
str_Stars:                                      ; team name string 50
        incbin "build/teamstrings.bin", 627, 6
str_RedWings:                                   ; team name string 51
        incbin "build/teamstrings.bin", 633, 10
str_Oilers:                                     ; team name string 52
        incbin "build/teamstrings.bin", 643, 7
str_Panthers:                                   ; team name string 53
        incbin "build/teamstrings.bin", 650, 9
str_Whalers:                                    ; team name string 54
        incbin "build/teamstrings.bin", 659, 8
str_Kings:                                      ; team name string 55
        incbin "build/teamstrings.bin", 667, 6
str_Canadiens:                                  ; team name string 56
        incbin "build/teamstrings.bin", 673, 10
str_Devils:                                     ; team name string 57
        incbin "build/teamstrings.bin", 683, 7
str_Islanders:                                  ; team name string 58
        incbin "build/teamstrings.bin", 690, 10
str_Rangers:                                    ; team name string 59
        incbin "build/teamstrings.bin", 700, 8
str_Senators:                                   ; team name string 60
        incbin "build/teamstrings.bin", 708, 9
str_Flyers:                                     ; team name string 61
        incbin "build/teamstrings.bin", 717, 7
str_Penguins:                                   ; team name string 62
        incbin "build/teamstrings.bin", 724, 9
str_Nordiques:                                  ; team name string 63
        incbin "build/teamstrings.bin", 733, 10
str_Blues:                                      ; team name string 64
        incbin "build/teamstrings.bin", 743, 6
str_Sharks:                                     ; team name string 65
        incbin "build/teamstrings.bin", 749, 7
str_Lightning:                                  ; team name string 66
        incbin "build/teamstrings.bin", 756, 10
str_MapleLeafs:                                 ; team name string 67
        incbin "build/teamstrings.bin", 766, 12
str_Canucks:                                    ; team name string 68
        incbin "build/teamstrings.bin", 778, 8
str_Capitals:                                   ; team name string 69
        incbin "build/teamstrings.bin", 786, 9
str_Jets:                                       ; team name string 70
        incbin "build/teamstrings.bin", 795, 5
str_AllStars:                                   ; team name string 71
        incbin "build/teamstrings.bin", 800, 12
