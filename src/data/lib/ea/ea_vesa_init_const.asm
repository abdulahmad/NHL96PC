; Strings and constants of src/lib/ea/ea_vesa_init.asm, in link order.
bits 32
%include "hockey.inc"
section s_113A50 progbits alloc noexec write align=1
global str_InitgraphicsINITMEMMAN, str_InitgraphicsINVALIDSCREEN, str_VESAVideoBiosDriver
str_InitgraphicsINITMEMMAN:                     ; string "initgraphics - INITMEMMAN REQUIRED BEFORE
                                                ; INITGRAPHICS "; used by initgraphics
        db 069h,06Eh,069h,074h,067h,072h,061h,070h,068h,069h,063h,073h,020h,02Dh,020h,049h
        db 04Eh,049h,054h,04Dh,045h,04Dh,04Dh,041h,04Eh,020h,052h,045h,051h,055h,049h,052h
        db 045h,044h,020h,042h,045h,046h,04Fh,052h,045h,020h,049h,04Eh,049h,054h,047h,052h
        db 041h,050h,048h,049h,043h,053h,0Ah,00h
str_InitgraphicsINVALIDSCREEN:                  ; string "initgraphics - INVALID SCREEN SIZE (%d,%d) "; used
                                                ; by initgraphics
        db 069h,06Eh,069h,074h,067h,072h,061h,070h,068h,069h,063h,073h,020h,02Dh,020h,049h
        db 04Eh,056h,041h,04Ch,049h,044h,020h,053h,043h,052h,045h,045h,04Eh,020h,053h,049h
        db 05Ah,045h,020h,028h,025h,064h,02Ch,025h,064h,029h,0Ah,00h
str_VESAVideoBiosDriver:                        ; string "VESA video bios driver required. Please install a
                                                ; driver for your video card and rerun. "; used by
                                                ; initgraphics
        db 056h,045h,053h,041h,020h,076h,069h,064h,065h,06Fh,020h,062h,069h,06Fh,073h,020h
        db 064h,072h,069h,076h,065h,072h,020h,072h,065h,071h,075h,069h,072h,065h,064h,02Eh
        db 0Ah,050h,06Ch,065h,061h,073h,065h,020h,069h,06Eh,073h,074h,061h,06Ch,06Ch,020h
        db 061h,020h,064h,072h,069h,076h,065h,072h,020h,066h,06Fh,072h,020h,079h,06Fh,075h
        db 072h,020h,076h,069h,064h,065h,06Fh,020h,063h,061h,072h,064h,020h,061h,06Eh,064h
        db 020h,072h,065h,072h,075h,06Eh,02Eh,0Ah,00h,00h,00h,00h
