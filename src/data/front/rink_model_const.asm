; Strings and constants of front/rink_model (src/front/rink_model), in link order.
bits 32
%include "hockey.inc"
section s_110768 progbits alloc noexec write align=1
global str_FSH2, str_Ice, str_IceFsh, str_Crud, str_Zamboni, F64_0p00138889, F64_65536, str_Glassline
global str_Glass, str_Topboards, str_Botboards, str_FatRedLines, str_FatBlueLines, str_SideD, str_SideNotFoundInRink, str_SideNotFoundInStands
global str_Gt002d, str_Gt102d, str_Gt202d, str_Gt302d, str_Icelogo, str_EMPTYFSH, str_HALFFSH, str_STANDSFSH
global str_STANDS, str_CrowdD, str_Wedge, str_WALL, str_Rink, str_Stands2, str_Score, str_Puck
global str_Puckshad, str_Net, str_Goal02, str_Goal12, str_Pipe, str_Left1, str_Left2, str_Back
global str_Right2, str_Right1, str_Top, str_Minx, str_Maxx, str_Minz, str_Maxz, str_Rlite1
global str_Gt305, str_Strobe, str_Boardback, str_Flatboards, str_STAND, str_STAND2ND, str_Rubber, str_Rubberside
global str_ICE2, str_ICELOGO2, str_Rlite0, str_Redlite, str_Glite0, str_Glite1, str_Grnlite, str_Lites
global str_Penboxz0, str_Penboxz1, str_Penboxt0, str_Penboxt1, str_Penbot, str_Penback, str_Penbox0D, str_Penbox1D
global str_DoorZ0, str_DoorZ1, str_Door00, str_Door01, str_Door02, str_Door10, str_Door11, str_Door12
global str_Zambpath, str_Benchz0, str_Benchz1, str_Benchbot, str_Benchdiv, str_Benchbk, str_Benchx, str_Pbench0D
global str_Pbench1D, str_B00, str_Gt007, str_Gt004, str_Gt302, str_Crease, str_R02d, str_C03
global str_C02, str_C01, str_C00, str_Center, str_Faceoff0, str_Faceoff1, str_Faceoff2, str_Faceoff3
global str_Faceoff4, str_Faceoff5, str_Faceoff6, str_Faceoff7, str_IceLine, str_ThinRedLines, str_B0DD, str_B1DD
global str_B2DD, str_B3DD, str_B4DD, str_B5DD, str_B6DD, str_B7DD, str_B8DD, str_B9DD
global str_TEMP2, str_Bkgd26, str_Rsd1, str_Rsd0, str_Saveback, str_WHD0, str_Rlxn, str_Rlxh
global str_Rlyn, str_Rlyh
str_FSH2:                                       ; string '.FSH'; used by LoadFshFile
        db 02Eh,046h,053h,048h,00h
str_Ice:                                        ; string 'ice'; used by LoadIceTexture
        db 069h,063h,065h,00h
str_IceFsh:                                     ; string 'ice.fsh'; used by LoadIceTexture
        db 069h,063h,065h,02Eh,066h,073h,068h,00h
str_Crud:                                       ; string 'crud'; used by LoadIceTexture
        db 063h,072h,075h,064h,00h
str_Zamboni:                                    ; string 'zamboni'; used by LoadZamboni
        db 07Ah,061h,06Dh,062h,06Fh,06Eh,069h,00h
F64_0p00138889:                                 ; double constant 0.00138889; used by MoveZamboni
        db 016h,06Ch,0C1h,016h,06Ch,0C1h,056h,03Fh
F64_65536:                                      ; double constant 65536; used by MoveZamboni
        db 00h,00h,00h,00h,00h,00h,0F0h,040h
str_Glassline:                                  ; string 'glassline'; used by BuildRinkSides, LoadRinkModel
        db 067h,06Ch,061h,073h,073h,06Ch,069h,06Eh,065h,00h
str_Glass:                                      ; string 'glass'; used by BuildRinkSides, LoadRinkModel
        db 067h,06Ch,061h,073h,073h,00h
str_Topboards:                                  ; string 'topboards'; used by BuildRinkSides, LoadRinkModel
        db 074h,06Fh,070h,062h,06Fh,061h,072h,064h,073h,00h
str_Botboards:                                  ; string 'botboards'; used by BuildRinkSides, LoadRinkModel
        db 062h,06Fh,074h,062h,06Fh,061h,072h,064h,073h,00h
str_FatRedLines:                                ; string 'fat_red_lines'; used by BuildRinkSides,
                                                ; LoadRinkModel
        db 066h,061h,074h,05Fh,072h,065h,064h,05Fh,06Ch,069h,06Eh,065h,073h,00h
str_FatBlueLines:                               ; string 'fat_blue_lines'; used by BuildRinkSides,
                                                ; LoadRinkModel
        db 066h,061h,074h,05Fh,062h,06Ch,075h,065h,05Fh,06Ch,069h,06Eh,065h,073h,00h
str_SideD:                                      ; string 'side%d'; used by BuildRinkSides
        db 073h,069h,064h,065h,025h,064h,00h
str_SideNotFoundInRink:                         ; string 'Side not found in rink'; used by BuildRinkSides
        db 053h,069h,064h,065h,020h,06Eh,06Fh,074h,020h,066h,06Fh,075h,06Eh,064h,020h,069h
        db 06Eh,020h,072h,069h,06Eh,06Bh,00h
str_SideNotFoundInStands:                       ; string 'Side not found in stands'; used by BuildRinkSides
        db 053h,069h,064h,065h,020h,06Eh,06Fh,074h,020h,066h,06Fh,075h,06Eh,064h,020h,069h
        db 06Eh,020h,073h,074h,061h,06Eh,064h,073h,00h
str_Gt002d:                                     ; string 'gt0%02d'; used by BuildRinkSides
        db 067h,074h,030h,025h,030h,032h,064h,00h
str_Gt102d:                                     ; string 'gt1%02d'; used by BuildRinkSides
        db 067h,074h,031h,025h,030h,032h,064h,00h
str_Gt202d:                                     ; string 'gt2%02d'; used by BuildRinkSides
        db 067h,074h,032h,025h,030h,032h,064h,00h
str_Gt302d:                                     ; string 'gt3%02d'; used by BuildRinkSides
        db 067h,074h,033h,025h,030h,032h,064h,00h
str_Icelogo:                                    ; string 'icelogo'; used by SetIceLogoTexture
        db 069h,063h,065h,06Ch,06Fh,067h,06Fh,00h
str_EMPTYFSH:                                   ; string '_EMPTY.FSH'; used by LoadStandsArt
        db 05Fh,045h,04Dh,050h,054h,059h,02Eh,046h,053h,048h,00h
str_HALFFSH:                                    ; string '_HALF.FSH'; used by LoadStandsArt
        db 05Fh,048h,041h,04Ch,046h,02Eh,046h,053h,048h,00h
str_STANDSFSH:                                  ; string '_STANDS.FSH'; used by LoadStandsArt
        db 05Fh,053h,054h,041h,04Eh,044h,053h,02Eh,046h,053h,048h,00h
str_STANDS:                                     ; string 'STANDS'; used by LoadStandsArt
        db 053h,054h,041h,04Eh,044h,053h,00h
str_CrowdD:                                     ; string 'crowd%d'; used by LoadStandsArt
        db 063h,072h,06Fh,077h,064h,025h,064h,00h
str_Wedge:                                      ; string 'wedge'; used by LoadStandsArt
        db 077h,065h,064h,067h,065h,00h
str_WALL:                                       ; string 'WALL'; used by LoadRinkModel, LoadStandsArt
        db 057h,041h,04Ch,04Ch,00h
str_Rink:                                       ; string 'rink'; used by LoadRinkModel
        db 072h,069h,06Eh,06Bh,00h
str_Stands2:                                    ; string 'stands'; used by LoadRinkModel
        db 073h,074h,061h,06Eh,064h,073h,00h
str_Score:                                      ; string 'score'; used by LoadRinkModel
        db 073h,063h,06Fh,072h,065h,00h
str_Puck:                                       ; string "puck"; used by LoadRinkModel
        db 070h,075h,063h,06Bh,00h
str_Puckshad:                                   ; string 'puckshad'; used by LoadRinkModel
        db 070h,075h,063h,06Bh,073h,068h,061h,064h,00h
str_Net:                                        ; string 'net'; used by LoadRinkModel
        db 06Eh,065h,074h,00h
str_Goal02:                                     ; string 'goal0'; used by LoadRinkModel
        db 067h,06Fh,061h,06Ch,030h,00h
str_Goal12:                                     ; string 'goal1'; used by LoadRinkModel
        db 067h,06Fh,061h,06Ch,031h,00h
str_Pipe:                                       ; string 'pipe'; used by LoadRinkModel
        db 070h,069h,070h,065h,00h
str_Left1:                                      ; string 'left1'; used by LoadRinkModel
        db 06Ch,065h,066h,074h,031h,00h
str_Left2:                                      ; string 'left2'; used by LoadRinkModel
        db 06Ch,065h,066h,074h,032h,00h
str_Back:                                       ; string "back"; used by LoadRinkModel
        db 062h,061h,063h,06Bh,00h
str_Right2:                                     ; string 'right2'; used by LoadRinkModel
        db 072h,069h,067h,068h,074h,032h,00h
str_Right1:                                     ; string 'right1'; used by LoadRinkModel
        db 072h,069h,067h,068h,074h,031h,00h
str_Top:                                        ; string 'top'; used by LoadRinkModel
        db 074h,06Fh,070h,00h
str_Minx:                                       ; string 'minx'; used by LoadRinkModel
        db 06Dh,069h,06Eh,078h,00h
str_Maxx:                                       ; string 'maxx'; used by LoadRinkModel
        db 06Dh,061h,078h,078h,00h
str_Minz:                                       ; string 'minz'; used by LoadRinkModel
        db 06Dh,069h,06Eh,07Ah,00h
str_Maxz:                                       ; string 'maxz'; used by LoadRinkModel
        db 06Dh,061h,078h,07Ah,00h
str_Rlite1:                                     ; string 'rlite1'; used by LoadRinkModel
        db 072h,06Ch,069h,074h,065h,031h,00h
str_Gt305:                                      ; string 'gt305'; used by LoadRinkModel
        db 067h,074h,033h,030h,035h,00h
str_Strobe:                                     ; string 'strobe'; used by LoadRinkModel
        db 073h,074h,072h,06Fh,062h,065h,00h
str_Boardback:                                  ; string 'boardback'; used by LoadRinkModel
        db 062h,06Fh,061h,072h,064h,062h,061h,063h,06Bh,00h
str_Flatboards:                                 ; string 'flatboards'; used by LoadRinkModel
        db 066h,06Ch,061h,074h,062h,06Fh,061h,072h,064h,073h,00h
str_STAND:                                      ; string 'STAND'; used by LoadRinkModel
        db 053h,054h,041h,04Eh,044h,00h
str_STAND2ND:                                   ; string 'STAND2ND'; used by LoadRinkModel
        db 053h,054h,041h,04Eh,044h,032h,04Eh,044h,00h
str_Rubber:                                     ; string 'rubber'; used by LoadRinkModel
        db 072h,075h,062h,062h,065h,072h,00h
str_Rubberside:                                 ; string 'rubberside'; used by LoadRinkModel
        db 072h,075h,062h,062h,065h,072h,073h,069h,064h,065h,00h
str_ICE2:                                       ; string 'ICE'; used by LoadRinkModel
        db 049h,043h,045h,00h
str_ICELOGO2:                                   ; string 'ICE_LOGO'; used by LoadRinkModel
        db 049h,043h,045h,05Fh,04Ch,04Fh,047h,04Fh,00h
str_Rlite0:                                     ; string 'rlite0'; used by LoadRinkModel
        db 072h,06Ch,069h,074h,065h,030h,00h
str_Redlite:                                    ; string 'redlite'; used by LoadRinkModel
        db 072h,065h,064h,06Ch,069h,074h,065h,00h
str_Glite0:                                     ; string 'glite0'; used by LoadRinkModel
        db 067h,06Ch,069h,074h,065h,030h,00h
str_Glite1:                                     ; string 'glite1'; used by LoadRinkModel
        db 067h,06Ch,069h,074h,065h,031h,00h
str_Grnlite:                                    ; string 'grnlite'; used by LoadRinkModel
        db 067h,072h,06Eh,06Ch,069h,074h,065h,00h
str_Lites:                                      ; string 'lites'; used by LoadRinkModel
        db 06Ch,069h,074h,065h,073h,00h
str_Penboxz0:                                   ; string 'penboxz0'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,07Ah,030h,00h
str_Penboxz1:                                   ; string 'penboxz1'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,07Ah,031h,00h
str_Penboxt0:                                   ; string 'penboxt0'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,074h,030h,00h
str_Penboxt1:                                   ; string 'penboxt1'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,074h,031h,00h
str_Penbot:                                     ; string 'penbot'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,074h,00h
str_Penback:                                    ; string 'penback'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,061h,063h,06Bh,00h
str_Penbox0D:                                   ; string 'penbox0%d'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,030h,025h,064h,00h
str_Penbox1D:                                   ; string 'penbox1%d'; used by LoadRinkModel
        db 070h,065h,06Eh,062h,06Fh,078h,031h,025h,064h,00h
str_DoorZ0:                                     ; string 'doorZ0'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,05Ah,030h,00h
str_DoorZ1:                                     ; string 'doorZ1'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,05Ah,031h,00h
str_Door00:                                     ; string 'door00'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,030h,030h,00h
str_Door01:                                     ; string 'door01'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,030h,031h,00h
str_Door02:                                     ; string 'door02'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,030h,032h,00h
str_Door10:                                     ; string 'door10'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,031h,030h,00h
str_Door11:                                     ; string 'door11'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,031h,031h,00h
str_Door12:                                     ; string 'door12'; used by LoadRinkModel
        db 064h,06Fh,06Fh,072h,031h,032h,00h
str_Zambpath:                                   ; string 'zambpath'; used by LoadRinkModel
        db 07Ah,061h,06Dh,062h,070h,061h,074h,068h,00h
str_Benchz0:                                    ; string 'benchz0'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,07Ah,030h,00h
str_Benchz1:                                    ; string 'benchz1'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,07Ah,031h,00h
str_Benchbot:                                   ; string 'benchbot'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,062h,06Fh,074h,00h
str_Benchdiv:                                   ; string 'benchdiv'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,064h,069h,076h,00h
str_Benchbk:                                    ; string 'benchbk'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,062h,06Bh,00h
str_Benchx:                                     ; string 'benchx'; used by LoadRinkModel
        db 062h,065h,06Eh,063h,068h,078h,00h
str_Pbench0D:                                   ; string 'pbench0%d'; used by LoadRinkModel
        db 070h,062h,065h,06Eh,063h,068h,030h,025h,064h,00h
str_Pbench1D:                                   ; string 'pbench1%d'; used by LoadRinkModel
        db 070h,062h,065h,06Eh,063h,068h,031h,025h,064h,00h
str_B00:                                        ; string 'b00'; used by LoadRinkModel
        db 062h,030h,030h,00h
str_Gt007:                                      ; string 'gt007'; used by LoadRinkModel
        db 067h,074h,030h,030h,037h,00h
str_Gt004:                                      ; string 'gt004'; used by LoadRinkModel
        db 067h,074h,030h,030h,034h,00h
str_Gt302:                                      ; string 'gt302'; used by LoadRinkModel
        db 067h,074h,033h,030h,032h,00h
str_Crease:                                     ; string 'crease'; used by LoadRinkModel
        db 063h,072h,065h,061h,073h,065h,00h
str_R02d:                                       ; string 'r%0.2d'; used by LoadRinkModel
        db 072h,025h,030h,02Eh,032h,064h,00h
str_C03:                                        ; string 'c03'; used by LoadRinkModel
        db 063h,030h,033h,00h
str_C02:                                        ; string 'c02'; used by LoadRinkModel
        db 063h,030h,032h,00h
str_C01:                                        ; string 'c01'; used by LoadRinkModel
        db 063h,030h,031h,00h
str_C00:                                        ; string 'c00'; used by LoadRinkModel
        db 063h,030h,030h,00h
str_Center:                                     ; string 'center'; used by LoadRinkModel
        db 063h,065h,06Eh,074h,065h,072h,00h
str_Faceoff0:                                   ; string 'faceoff0'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,030h,00h
str_Faceoff1:                                   ; string 'faceoff1'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,031h,00h
str_Faceoff2:                                   ; string 'faceoff2'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,032h,00h
str_Faceoff3:                                   ; string 'faceoff3'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,033h,00h
str_Faceoff4:                                   ; string 'faceoff4'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,034h,00h
str_Faceoff5:                                   ; string 'faceoff5'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,035h,00h
str_Faceoff6:                                   ; string 'faceoff6'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,036h,00h
str_Faceoff7:                                   ; string 'faceoff7'; used by LoadRinkModel
        db 066h,061h,063h,065h,06Fh,066h,066h,037h,00h
str_IceLine:                                    ; string 'ice_line'; used by LoadRinkModel
        db 069h,063h,065h,05Fh,06Ch,069h,06Eh,065h,00h
str_ThinRedLines:                               ; string 'thin_red_lines'; used by LoadRinkModel
        db 074h,068h,069h,06Eh,05Fh,072h,065h,064h,05Fh,06Ch,069h,06Eh,065h,073h,00h,00h
str_B0DD:                                       ; string 'B0%d%d'; used by DrawOptionButton
        db 042h,030h,025h,064h,025h,064h,00h
str_B1DD:                                       ; string 'B1%d%d'; used by DrawOptionButton
        db 042h,031h,025h,064h,025h,064h,00h
str_B2DD:                                       ; string 'B2%d%d'; used by DrawOptionButton
        db 042h,032h,025h,064h,025h,064h,00h
str_B3DD:                                       ; string 'B3%d%d'; used by DrawOptionButton
        db 042h,033h,025h,064h,025h,064h,00h
str_B4DD:                                       ; string 'B4%d%d'; used by DrawOptionButton
        db 042h,034h,025h,064h,025h,064h,00h
str_B5DD:                                       ; string 'B5%d%d'; used by DrawOptionButton
        db 042h,035h,025h,064h,025h,064h,00h
str_B6DD:                                       ; string 'B6%d%d'; used by DrawOptionButton
        db 042h,036h,025h,064h,025h,064h,00h
str_B7DD:                                       ; string 'B7%d%d'; used by DrawOptionButton
        db 042h,037h,025h,064h,025h,064h,00h
str_B8DD:                                       ; string 'B8%d%d'; used by DrawOptionButton
        db 042h,038h,025h,064h,025h,064h,00h
str_B9DD:                                       ; string 'B9%d%d'; used by DrawOptionButton
        db 042h,039h,025h,064h,025h,064h,00h
str_TEMP2:                                      ; string 'TEMP'; used by GameOptionsScreen
        db 054h,045h,04Dh,050h,00h
str_Bkgd26:                                     ; string 'bkgd'; used by GameOptionsScreen
        db 062h,06Bh,067h,064h,00h
str_Rsd1:                                       ; string 'rsd1'; used by GameOptionsScreen
        db 072h,073h,064h,031h,00h
str_Rsd0:                                       ; string 'rsd0'; used by GameOptionsScreen
        db 072h,073h,064h,030h,00h
str_Saveback:                                   ; string 'saveback'; used by GameOptionsScreen
        db 073h,061h,076h,065h,062h,061h,063h,06Bh,00h
str_WHD0:                                       ; string 'WH%d0'; used by GameOptionsScreen
        db 057h,048h,025h,064h,030h,00h
str_Rlxn:                                       ; string 'rlxn'; used by GameOptionsScreen
        db 072h,06Ch,078h,06Eh,00h
str_Rlxh:                                       ; string 'rlxh'; used by GameOptionsScreen
        db 072h,06Ch,078h,068h,00h
str_Rlyn:                                       ; string 'rlyn'; used by GameOptionsScreen
        db 072h,06Ch,079h,06Eh,00h
str_Rlyh:                                       ; string 'rlyh'; used by GameOptionsScreen
        db 072h,06Ch,079h,068h,00h,00h,00h,00h
