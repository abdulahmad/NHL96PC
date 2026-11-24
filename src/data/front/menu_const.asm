; Strings and constants of front/menu (src/front/menu), in link order.
bits 32
%include "hockey.inc"
section s_11187C progbits alloc noexec write align=1
global str_Pal11, str_Bkgd5, str_Bt013, str_Bt023, str_Bt102, str_Bt112, str_Bt19, str_Bt20
global str_Bt28, str_Bt29, str_Bb01, str_Bb02, str_Bb10, str_Bb11, str_Bb19, str_Bb20
global str_Sta1, str_Sta2, str_Sta3, str_Use1, str_Use2, str_Use3, str_Opt1, str_Opt2
global str_Opt3, str_Hig1, str_Hig2, str_Hig3, str_Bt02d, str_Bb02d, str_LOCALNDX2, str_HILITESNDX
str_Pal11:                                      ; string '!pal'; used by MainMenuScreen
        db 021h,070h,061h,06Ch,00h
str_Bkgd5:                                      ; string 'bkgd'; used by MainMenuScreen
        db 062h,06Bh,067h,064h,00h
str_Bt013:                                      ; string 'bt01'; used by MainMenuScreen
        db 062h,074h,030h,031h,00h
str_Bt023:                                      ; string 'bt02'; used by MainMenuScreen
        db 062h,074h,030h,032h,00h
str_Bt102:                                      ; string 'bt10'; used by MainMenuScreen
        db 062h,074h,031h,030h,00h
str_Bt112:                                      ; string 'bt11'; used by MainMenuScreen
        db 062h,074h,031h,031h,00h
str_Bt19:                                       ; string 'bt19'; used by MainMenuScreen
        db 062h,074h,031h,039h,00h
str_Bt20:                                       ; string 'bt20'; used by MainMenuScreen
        db 062h,074h,032h,030h,00h
str_Bt28:                                       ; string 'bt28'; used by MainMenuScreen
        db 062h,074h,032h,038h,00h
str_Bt29:                                       ; string 'bt29'; used by MainMenuScreen
        db 062h,074h,032h,039h,00h
str_Bb01:                                       ; string 'bb01'; used by MainMenuScreen
        db 062h,062h,030h,031h,00h
str_Bb02:                                       ; string 'bb02'; used by MainMenuScreen
        db 062h,062h,030h,032h,00h
str_Bb10:                                       ; string 'bb10'; used by MainMenuScreen
        db 062h,062h,031h,030h,00h
str_Bb11:                                       ; string 'bb11'; used by MainMenuScreen
        db 062h,062h,031h,031h,00h
str_Bb19:                                       ; string 'bb19'; used by MainMenuScreen
        db 062h,062h,031h,039h,00h
str_Bb20:                                       ; string 'bb20'; used by MainMenuScreen
        db 062h,062h,032h,030h,00h
str_Sta1:                                       ; string 'sta1'; used by MainMenuScreen
        db 073h,074h,061h,031h,00h
str_Sta2:                                       ; string 'sta2'; used by MainMenuScreen
        db 073h,074h,061h,032h,00h
str_Sta3:                                       ; string 'sta3'; used by MainMenuScreen
        db 073h,074h,061h,033h,00h
str_Use1:                                       ; string 'use1'; used by MainMenuScreen
        db 075h,073h,065h,031h,00h
str_Use2:                                       ; string 'use2'; used by MainMenuScreen
        db 075h,073h,065h,032h,00h
str_Use3:                                       ; string 'use3'; used by MainMenuScreen
        db 075h,073h,065h,033h,00h
str_Opt1:                                       ; string 'opt1'; used by MainMenuScreen
        db 06Fh,070h,074h,031h,00h
str_Opt2:                                       ; string 'opt2'; used by MainMenuScreen
        db 06Fh,070h,074h,032h,00h
str_Opt3:                                       ; string 'opt3'; used by MainMenuScreen
        db 06Fh,070h,074h,033h,00h
str_Hig1:                                       ; string 'hig1'; used by MainMenuScreen
        db 068h,069h,067h,031h,00h
str_Hig2:                                       ; string 'hig2'; used by MainMenuScreen
        db 068h,069h,067h,032h,00h
str_Hig3:                                       ; string 'hig3'; used by MainMenuScreen
        db 068h,069h,067h,033h,00h
str_Bt02d:                                      ; string 'bt%02d'; used by MainMenuScreen
        db 062h,074h,025h,030h,032h,064h,00h
str_Bb02d:                                      ; string 'bb%02d'; used by MainMenuScreen
        db 062h,062h,025h,030h,032h,064h,00h
str_LOCALNDX2:                                  ; string 'LOCAL.NDX'; used by MainMenuScreen
        db 04Ch,04Fh,043h,041h,04Ch,02Eh,04Eh,044h,058h,00h
str_HILITESNDX:                                 ; string 'HILITES.NDX'; used by MainMenuScreen
        db 048h,049h,04Ch,049h,054h,045h,053h,02Eh,04Eh,044h,058h,00h
