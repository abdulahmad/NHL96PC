; Strings and constants of front/draw (src/front/draw), in link order.
bits 32
%include "hockey.inc"
section s_111818 progbits alloc noexec write align=1
global str_COPY, str_LIBBUGFIX, str_CouldNotAllocateLibraryB, str_NHLinitgraphicsfixNotCal, str_USETABLE
str_COPY:                                       ; string 'COPY'; used by CopyBitmap
        db 043h,04Fh,050h,059h,00h
str_LIBBUGFIX:                                  ; string 'LIB BUG FIX'; used by InitGraphicsFix
        db 04Ch,049h,042h,020h,042h,055h,047h,020h,046h,049h,058h,00h
str_CouldNotAllocateLibraryB:                   ; string 'Could not allocate library bug fix ram.'; used by
                                                ; InitGraphicsFix
        db 043h,06Fh,075h,06Ch,064h,020h,06Eh,06Fh,074h,020h,061h,06Ch,06Ch,06Fh,063h,061h
        db 074h,065h,020h,06Ch,069h,062h,072h,061h,072h,079h,020h,062h,075h,067h,020h,066h
        db 069h,078h,020h,072h,061h,06Dh,02Eh,00h
str_NHLinitgraphicsfixNotCal:                   ; string 'NHLinitgraphicsfix not called.'; used by
                                                ; SetGraphicsMode
        db 04Eh,048h,04Ch,069h,06Eh,069h,074h,067h,072h,061h,070h,068h,069h,063h,073h,066h
        db 069h,078h,020h,06Eh,06Fh,074h,020h,063h,061h,06Ch,06Ch,065h,064h,02Eh,00h
str_USETABLE:                                   ; string 'USETABLE'; used by RemapScreenColors
        db 055h,053h,045h,054h,041h,042h,04Ch,045h,00h,00h,00h,00h
