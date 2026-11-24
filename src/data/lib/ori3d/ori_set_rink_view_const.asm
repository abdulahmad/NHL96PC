; Strings and constants of src/lib/ori3d/ori_set_rink_view.asm, in link order.
bits 32
%include "hockey.inc"
section s_11388C progbits alloc noexec write align=1
global str_UpsideDown, str_OrisetmaterialrgbInvalidMate, str_OrisetmaterialcolorInval, str_OrisetmaterialtextureInvalid, str_OrisetmaterialdrawfnInva
str_UpsideDown:                                 ; string 'upside down '; used by FillFloorPlane
        db 075h,070h,073h,069h,064h,065h,020h,064h,06Fh,077h,06Eh,0Ah,00h,00h,00h,00h
str_OrisetmaterialrgbInvalidMate:               ; string "orisetmaterialrgb: invalid material id %d"; used by
                                                ; OriSetMaterialRgb
        db 06Fh,072h,069h,073h,065h,074h,06Dh,061h,074h,065h,072h,069h,061h,06Ch,072h,067h
        db 062h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,06Dh,061h,074h,065h,072h
        db 069h,061h,06Ch,020h,069h,064h,020h,025h,064h,00h,00h,078h
str_OrisetmaterialcolorInval:                   ; string 'orisetmaterialcolor: invalid material id %d'; used
                                                ; by OriSetMaterialRgb
        db 06Fh,072h,069h,073h,065h,074h,06Dh,061h,074h,065h,072h,069h,061h,06Ch,063h,06Fh
        db 06Ch,06Fh,072h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,06Dh,061h,074h
        db 065h,072h,069h,061h,06Ch,020h,069h,064h,020h,025h,064h,00h
str_OrisetmaterialtextureInvalid:               ; string "orisetmaterialtexture: invalid material id %d"; used
                                                ; by OriSetMaterialTexture
        db 06Fh,072h,069h,073h,065h,074h,06Dh,061h,074h,065h,072h,069h,061h,06Ch,074h,065h
        db 078h,074h,075h,072h,065h,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,06Dh
        db 061h,074h,065h,072h,069h,061h,06Ch,020h,069h,064h,020h,025h,064h,00h,00h,038h
str_OrisetmaterialdrawfnInva:                   ; string 'orisetmaterialdrawfn: invalid material id %d'; used
                                                ; by OriSetMaterialDrawFn
        db 06Fh,072h,069h,073h,065h,074h,06Dh,061h,074h,065h,072h,069h,061h,06Ch,064h,072h
        db 061h,077h,066h,06Eh,03Ah,020h,069h,06Eh,076h,061h,06Ch,069h,064h,020h,06Dh,061h
        db 074h,065h,072h,069h,061h,06Ch,020h,069h,064h,020h,025h,064h,00h,00h,00h,00h
