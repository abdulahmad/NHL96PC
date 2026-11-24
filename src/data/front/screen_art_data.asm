; Initialised data of front/screen_art (src/front/screen_art).
bits 32
%include "hockey.inc"
section s_11BCE0 progbits alloc noexec write align=1
global TeamNameArt, WaitBoxArt, BottomBarDef, TitleBarDef, SideBarDef
TeamNameArt:                                    ; Team name art; used by FreeFrontEndArt, GetTeamNameArt,
                                                ; LoadFrontEndArt
        db 00h,00h,00h,00h
WaitBoxArt:                                     ; Wait box art; used by FreeFrontEndArt, LoadFrontEndArt,
                                                ; ShowLinkWaitBox
        db 00h,00h,00h,00h
BottomBarDef:                                   ; Bottom bar definition; used by LoadFrontEndArt
        db 045h,02h,00h,00h,028h,00h,00h,00h,053h,02h,00h,00h,01Bh,00h,00h,00h
        db 066h,02h,00h,00h,01Bh,00h,00h,00h,074h,02h,00h,00h,02Ah,00h,00h,00h
        db 074h,02h,00h,00h,03Ah,00h,00h,00h,065h,02h,00h,00h,04Ah,00h,00h,00h
        db 054h,02h,00h,00h,04Ah,00h,00h,00h,045h,02h,00h,00h,03Ch,00h,00h,00h
TitleBarDef:                                    ; Title bar definition; used by LoadFrontEndArt
        db 03Eh,02h,00h,00h,0B4h,01h,00h,00h,04Bh,02h,00h,00h,0A5h,01h,00h,00h
        db 061h,02h,00h,00h,0A5h,01h,00h,00h,06Ch,02h,00h,00h,0B4h,01h,00h,00h
        db 06Ch,02h,00h,00h,0C6h,01h,00h,00h,05Eh,02h,00h,00h,0D2h,01h,00h,00h
        db 04Ch,02h,00h,00h,0D2h,01h,00h,00h,03Eh,02h,00h,00h,0C4h,01h,00h,00h
SideBarDef:                                     ; Side bar definition; used by LoadFrontEndArt
        db 012h,00h,00h,00h,0B1h,01h,00h,00h,01Fh,00h,00h,00h,0A5h,01h,00h,00h
        db 033h,00h,00h,00h,0A5h,01h,00h,00h,040h,00h,00h,00h,0B1h,01h,00h,00h
        db 040h,00h,00h,00h,0C7h,01h,00h,00h,030h,00h,00h,00h,0D3h,01h,00h,00h
        db 021h,00h,00h,00h,0D3h,01h,00h,00h,013h,00h,00h,00h,0C7h,01h,00h,00h
