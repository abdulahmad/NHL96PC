; Initialised data of front/player_art (src/front/player_art).
bits 32
%include "hockey.inc"
section s_11BB38 progbits alloc noexec write align=1
extern str_Ana, str_Anh, str_Ase, str_Asw, str_Bfa, str_Bfh, str_Bsa, str_Bsh
extern str_Cga, str_Cgh, str_Cha, str_Chh, str_Dla, str_Dlh, str_Dta, str_Dth
extern str_Eda, str_Edh, str_Fla, str_Flh, str_Hra, str_Hrh, str_Ila, str_Ilh
extern str_Laa, str_Lah, str_Mta, str_Mth, str_Nja, str_Njh, str_Ota, str_Oth
extern str_Pha, str_Phh, str_Pta, str_Pth, str_Qua, str_Quh, str_Rga, str_Rgh
extern str_Sja, str_Sjh, str_Sla, str_Slh, str_Tba, str_Tbh, str_Tra, str_Trh
extern str_Vna, str_Vnh, str_Wna, str_Wnh, str_Wsa, str_Wsh
global PlayerSpritesLoaded, SpriteFileHandles, FightSpritesLoaded, SpriteMemBlock, GameSpriteNames, LastPaletteMode, JerseyDigitWidths, SpritesLoaded
global SpriteCacheOn, SpriteCacheMem
PlayerSpritesLoaded:                            ; Player sprites loaded; used by FreeGameSprites,
                                                ; LoadPlayerSprites
        db 00h,00h,00h,00h
SpriteFileHandles:                              ; Sprite file handles; used by FreeGameSprites,
                                                ; FreeTotalSprites, IndexSpriteFrames ...
        db 00h,00h,00h,00h
FightSpritesLoaded:                             ; Fight sprites loaded; used by FreeFightSprites,
                                                ; LoadCupSprites, LoadFightSprites ...
        db 00h,00h,00h,00h
SpriteMemBlock:                                 ; Sprite memory block; used by LoadPlayerSprites
        db 00h,00h,00h,00h,00h,00h,00h,00h
GameSpriteNames:                                ; Game sprite file names; used by LoadGameSprites
        dd str_Anh
        dd str_Ana
        dd str_Bsh
        dd str_Bsa
        dd str_Bfh
        dd str_Bfa
        dd str_Cgh
        dd str_Cga
        dd str_Chh
        dd str_Cha
        dd str_Dlh
        dd str_Dla
        dd str_Dth
        dd str_Dta
        dd str_Edh
        dd str_Eda
        dd str_Flh
        dd str_Fla
        dd str_Hrh
        dd str_Hra
        dd str_Lah
        dd str_Laa
        dd str_Mth
        dd str_Mta
        dd str_Njh
        dd str_Nja
        dd str_Ilh
        dd str_Ila
        dd str_Rgh
        dd str_Rga
        dd str_Oth
        dd str_Ota
        dd str_Phh
        dd str_Pha
        dd str_Pth
        dd str_Pta
        dd str_Quh
        dd str_Qua
        dd str_Slh
        dd str_Sla
        dd str_Sjh
        dd str_Sja
        dd str_Tbh
        dd str_Tba
        dd str_Trh
        dd str_Tra
        dd str_Vnh
        dd str_Vna
        dd str_Wsh
        dd str_Wsa
        dd str_Wnh
        dd str_Wna
        dd str_Asw
        dd str_Ase
LastPaletteMode:                                ; Last palette mode, -1 for none; used by DrawInGameMenuFrame,
                                                ; DrawPanelLogo, DrawPauseFrame ...
        db 0FFh,0FFh,0FFh,0FFh
JerseyDigitWidths:                              ; Jersey digit widths; used by PutJerseyDigit
        db 02h,02h,02h,02h,01h,02h,02h,01h,02h,02h,01h,02h,02h,02h,02h,01h
        db 01h,02h,01h,01h,02h,01h,01h,02h,01h,01h,02h,01h,01h,02h,02h,02h
        db 02h,01h,01h,02h,01h,02h,01h,02h,01h,01h,02h,02h,02h,02h,02h,02h
        db 01h,01h,02h,01h,02h,01h,01h,01h,02h,02h,02h,02h,02h,01h,01h,02h
        db 01h,02h,02h,02h,02h,01h,01h,02h,01h,01h,02h,02h,02h,02h,02h,01h
        db 01h,01h,02h,01h,01h,01h,02h,02h,02h,02h,01h,02h,02h,02h,01h,01h
        db 02h,02h,02h,02h,01h,02h,02h,02h,02h,02h,02h,02h,01h,01h,02h,01h
        db 02h,01h,02h,01h,01h,02h,01h,01h,02h,02h,02h,02h,01h,02h,01h,02h
        db 01h,02h,01h,02h,02h,02h,02h,02h,02h,02h,02h,01h,02h,02h,02h,02h
        db 01h,01h,02h,02h,02h,01h,02h,01h,01h,02h,01h,01h,02h,01h,01h,02h
        db 01h,01h,02h,01h,01h,00h,00h,00h,00h
SpritesLoaded:                                  ; Sprites loaded; used by FreeGameSprites, LoadPlayerSprites
        db 00h,00h,00h,00h
SpriteCacheOn:                                  ; Sprite cache on; used by GetSpriteFrame
        db 01h,00h,00h,00h
SpriteCacheMem:                                 ; Sprite cache memory; used by FreeSpriteCache, GetSpriteFrame
        db 00h,00h,00h,00h,00h,00h,00h
