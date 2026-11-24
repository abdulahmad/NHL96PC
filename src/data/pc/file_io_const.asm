; Strings and constants of pc/file_io (src/pc/file_io), in link order.
bits 32
%include "hockey.inc"
section s_1106E8 progbits alloc noexec write align=1
global str_backslash4, str_dot2, str_Punct_DeleteFiles, str_COPYBUFFER, str_ErrDiskFree2
str_backslash4:                                 ; string '\'; used by DeleteFiles
        db 05Ch,00h
str_dot2:                                       ; string '.'; used by DeleteFiles
        db 02Eh,00h
str_Punct_DeleteFiles:                          ; string "*"; used by DeleteFiles
        db 02Ah,00h
str_COPYBUFFER:                                 ; string 'COPYBUFFER'; used by FileCopy
        db 043h,04Fh,050h,059h,042h,055h,046h,046h,045h,052h,00h
str_ErrDiskFree2:                               ; string 'error getting disk space free '; used by
                                                ; ReadSeasonHeader
        db 065h,072h,072h,06Fh,072h,020h,067h,065h,074h,074h,069h,06Eh,067h,020h,064h,069h
        db 073h,06Bh,020h,073h,070h,061h,063h,065h,020h,066h,072h,065h,065h,0Ah,00h
