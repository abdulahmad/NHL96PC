; Strings and constants of front/ingame_menu (src/front/ingame_menu), in link order.
bits 32
%include "hockey.inc"
section s_112E34 progbits alloc noexec write align=1
global str_D13, str_Intr, str_Sid1, str_Sid2, str_Bot1, str_Bot2, str_Bot3, str_Gam0
global str_FhiL3, str_FhiR3, str_GloL2, str_GloR2, str_GhiL2, str_GhiR2, str_Ret0, str_Ret1
global str_Ret2, str_Gam1, str_Ply02, str_Ply1, str_INTERREG, str_Qui0, str_Qui1, str_Qui2
global str_Cht0, str_Cht1, str_Edt0, str_Edt1, str_Ctr0, str_Ctr1, str_Sts0, str_Sts1
global str_Sav0, str_Sav1, str_EXHIBITNDX2, str_08d2, str_05d3, str_CsgDb2
str_D13:                                        ; string '%d'; used by DrawInGameMenuFrame
        db 025h,064h,00h
str_Intr:                                       ; string 'intr'; used by DrawInGameMenuFrame
        db 069h,06Eh,074h,072h,00h
str_Sid1:                                       ; string 'sid1'; used by DrawInGameMenuFrame
        db 073h,069h,064h,031h,00h
str_Sid2:                                       ; string 'sid2'; used by DrawInGameMenuFrame
        db 073h,069h,064h,032h,00h
str_Bot1:                                       ; string 'bot1'; used by DrawInGameMenuFrame
        db 062h,06Fh,074h,031h,00h
str_Bot2:                                       ; string 'bot2'; used by DrawInGameMenuFrame
        db 062h,06Fh,074h,032h,00h
str_Bot3:                                       ; string 'bot3'; used by DrawInGameMenuFrame
        db 062h,06Fh,074h,033h,00h
str_Gam0:                                       ; string 'gam0'; used by DrawInGameMenuFrame, InGameReturnMenu
        db 067h,061h,06Dh,030h,00h
str_FhiL3:                                      ; string 'FhiL'; used by OpenFrontEndFromGame
        db 046h,068h,069h,04Ch,00h
str_FhiR3:                                      ; string 'FhiR'; used by OpenFrontEndFromGame
        db 046h,068h,069h,052h,00h
str_GloL2:                                      ; string 'GloL'; used by ReturnToGameView
        db 047h,06Ch,06Fh,04Ch,00h
str_GloR2:                                      ; string 'GloR'; used by ReturnToGameView
        db 047h,06Ch,06Fh,052h,00h
str_GhiL2:                                      ; string 'GhiL'; used by ReturnToGameView
        db 047h,068h,069h,04Ch,00h
str_GhiR2:                                      ; string 'GhiR'; used by ReturnToGameView
        db 047h,068h,069h,052h,00h
str_Ret0:                                       ; string 'ret0'; used by InGameMenu, InGameReturnMenu
        db 072h,065h,074h,030h,00h
str_Ret1:                                       ; string 'ret1'; used by InGameMenu, InGameReturnMenu
        db 072h,065h,074h,031h,00h
str_Ret2:                                       ; string 'ret2'; used by InGameMenu, InGameReturnMenu
        db 072h,065h,074h,032h,00h
str_Gam1:                                       ; string 'gam1'; used by InGameReturnMenu
        db 067h,061h,06Dh,031h,00h
str_Ply02:                                      ; string 'ply0'; used by InGameReturnMenu
        db 070h,06Ch,079h,030h,00h
str_Ply1:                                       ; string 'ply1'; used by InGameReturnMenu
        db 070h,06Ch,079h,031h,00h
str_INTERREG:                                   ; string 'INTERREG'; used by InGameMenu
        db 049h,04Eh,054h,045h,052h,052h,045h,047h,00h
str_Qui0:                                       ; string 'qui0'; used by InGameMenu
        db 071h,075h,069h,030h,00h
str_Qui1:                                       ; string 'qui1'; used by InGameMenu
        db 071h,075h,069h,031h,00h
str_Qui2:                                       ; string 'qui2'; used by InGameMenu
        db 071h,075h,069h,032h,00h
str_Cht0:                                       ; string 'cht0'; used by InGameMenu
        db 063h,068h,074h,030h,00h
str_Cht1:                                       ; string 'cht1'; used by InGameMenu
        db 063h,068h,074h,031h,00h
str_Edt0:                                       ; string 'edt0'; used by InGameMenu
        db 065h,064h,074h,030h,00h
str_Edt1:                                       ; string 'edt1'; used by InGameMenu
        db 065h,064h,074h,031h,00h
str_Ctr0:                                       ; string 'ctr0'; used by InGameMenu
        db 063h,074h,072h,030h,00h
str_Ctr1:                                       ; string 'ctr1'; used by InGameMenu
        db 063h,074h,072h,031h,00h
str_Sts0:                                       ; string 'sts0'; used by InGameMenu
        db 073h,074h,073h,030h,00h
str_Sts1:                                       ; string 'sts1'; used by InGameMenu
        db 073h,074h,073h,031h,00h
str_Sav0:                                       ; string 'sav0'; used by InGameMenu
        db 073h,061h,076h,030h,00h
str_Sav1:                                       ; string 'sav1'; used by InGameMenu
        db 073h,061h,076h,031h,00h
str_EXHIBITNDX2:                                ; string 'EXHIBIT.NDX'; used by InGameMenu
        db 045h,058h,048h,049h,042h,049h,054h,02Eh,04Eh,044h,058h,00h
str_08d2:                                       ; string '%08d'; used by InGameMenu
        db 025h,030h,038h,064h,00h
str_05d3:                                       ; string '%05d'; used by InGameMenu
        db 025h,030h,035h,064h,00h
str_CsgDb2:                                     ; string '%csg.db'; used by InGameMenu
        db 025h,063h,073h,067h,02Eh,064h,062h,00h,00h,00h
