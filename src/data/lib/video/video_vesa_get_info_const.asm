; Strings and constants of src/lib/video/video_vesa_get_info.asm, in link order.
bits 32
%include "hockey.inc"
section s_1139D8 progbits alloc noexec write align=1
global str_VESAMEM, str_GetvesainfoINVALIDDOSSEGMENT, str_VESA, str_GetvesainfoINVALIDVESAINFOVE
str_VESAMEM:                                    ; string "VESA MEM"; used by VesaGetInfo, VesaGetModeInfo
        db 056h,045h,053h,041h,020h,04Dh,045h,04Dh,00h,06Fh,069h,064h
str_GetvesainfoINVALIDDOSSEGMENT:               ; string "getvesainfo - INVALID DOS SEGMENT %lx\n"; used by
                                                ; VesaGetInfo
        db 067h,065h,074h,076h,065h,073h,061h,069h,06Eh,066h,06Fh,020h,02Dh,020h,049h,04Eh
        db 056h,041h,04Ch,049h,044h,020h,044h,04Fh,053h,020h,053h,045h,047h,04Dh,045h,04Eh
        db 054h,020h,025h,06Ch,078h,0Ah,00h,072h
str_VESA:                                       ; string "VESA"; used by VesaGetInfo
        db 056h,045h,053h,041h,00h,020h,063h,06Fh
str_GetvesainfoINVALIDVESAINFOVE:               ; string "getvesainfo - INVALID VESA INFO\nVESA driver is
                                                ; installed?\n"; used by VesaGetInfo
        db 067h,065h,074h,076h,065h,073h,061h,069h,06Eh,066h,06Fh,020h,02Dh,020h,049h,04Eh
        db 056h,041h,04Ch,049h,044h,020h,056h,045h,053h,041h,020h,049h,04Eh,046h,04Fh,0Ah
        db 056h,045h,053h,041h,020h,064h,072h,069h,076h,065h,072h,020h,069h,073h,020h,069h
        db 06Eh,073h,074h,061h,06Ch,06Ch,065h,064h,03Fh,0Ah,00h,02Ch
