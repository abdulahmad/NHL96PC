; BSS of front/player_art (src/front/player_art).
bits 32
%include "hockey.inc"
section s_179E48 nobits alloc noexec write align=1
global SpriteCacheHead, SpriteCacheLinks, SpriteCache, JerseyColorMap, RinkColorMap, TeamPaletteSave, HomeJerseyPal, AwayJerseyPal
global SpriteCachePtr, SpriteCacheFree, SpriteCacheUsed, SpriteCacheBlock, SpriteCacheSize, PlayerSpriteFile, PlayerSpriteCount, RinkSpriteFile
global NetSpriteFile, MarkerSpriteFile, SpriteColorRanges
SpriteCacheHead:                                ; Sprite cache head; used by GetSpriteFrame
        resb 4
SpriteCacheLinks:                               ; Sprite cache links; used by GetSpriteFrame
        resb 4
SpriteCache:                                    ; Sprite cache entries; used by GetSpriteFrame
        resb 5112
JerseyColorMap:                                 ; Jersey colour map; used by DrawRinkSprite,
                                                ; SetTeamJerseyColors
        resb 576
RinkColorMap:                                   ; Rink sprite colour map; used by SetRinkSpriteColors,
                                                ; SetTeamJerseyColors
        resb 144
TeamPaletteSave:                                ; Saved team palettes; used by DrawPlayerSprite,
                                                ; SaveTeamPalette
        resb 792
HomeJerseyPal:                                  ; Home jersey palette; used by DrawRinkSprite, InitGameView,
                                                ; LoadTeamPalette ...
        resb 256
AwayJerseyPal:                                  ; Away jersey palette; used by DrawRinkSprite, InitGameView,
                                                ; LoadTeamPalette ...
        resb 256
SpriteCachePtr:                                 ; Sprite cache pointer; used by GetSpriteFrame
        resb 4
SpriteCacheFree:                                ; Sprite cache free list; used by GetSpriteFrame
        resb 4
SpriteCacheUsed:                                ; Sprite cache used; used by GetSpriteFrame
        resb 4
SpriteCacheBlock:                               ; Sprite cache memory block; used by FreeSpriteCache,
                                                ; GetSpriteFrame
        resb 4
SpriteCacheSize:                                ; Sprite cache size; used by GetSpriteFrame
        resb 4
PlayerSpriteFile:                               ; Player sprite file; used by FreeGameSprites, GetSpriteFrame,
                                                ; LoadPlayerSprites
        resb 4
PlayerSpriteCount:                              ; Player sprites; used by IndexSpriteFrames, LoadPlayerSprites
        resb 4
RinkSpriteFile:                                 ; Rink sprite file; used by DrawRinkSprite, FreeGameSprites,
                                                ; LoadGameSprites
        resb 4
NetSpriteFile:                                  ; Net sprite file; used by DrawRinkSprite, FreeGameSprites,
                                                ; LoadGameSprites
        resb 4
MarkerSpriteFile:                               ; Player marker sprite file; used by DrawPlayerMarkers,
                                                ; DrawReplayObjects, DrawRinkSprite ...
        resb 4
SpriteColorRanges:                              ; Sprite colour ranges (SetPlayerSpriteColors,
                                                ; SetRinkSpriteColors); used by SetPlayerSpriteColors,
                                                ; SetRinkSpriteColors
        resb 36
