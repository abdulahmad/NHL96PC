; Strings and constants of src/lib/ea/ea_big_file_type.asm, in link order.
bits 32
%include "hockey.inc"
section s_114004 progbits alloc noexec write align=1
global str_LocatebigNOBIGFILESETNUL, str_LocatebigFILEISNOTAUNITFILE, str_LocatebigsFILENOTFOUNDS
str_LocatebigNOBIGFILESETNUL:                   ; string 'locatebig - NO BIG FILE SET (NULL POINTER) '; used
                                                ; by BigFileType
        db 06Ch,06Fh,063h,061h,074h,065h,062h,069h,067h,020h,02Dh,020h,04Eh,04Fh,020h,042h
        db 049h,047h,020h,046h,049h,04Ch,045h,020h,053h,045h,054h,020h,028h,04Eh,055h,04Ch
        db 04Ch,020h,050h,04Fh,049h,04Eh,054h,045h,052h,029h,0Ah,00h
str_LocatebigFILEISNOTAUNITFILE:                ; string "locatebig - FILE IS NOT A UNIT FILE\n"; used by
                                                ; BigFileType
        db 06Ch,06Fh,063h,061h,074h,065h,062h,069h,067h,020h,02Dh,020h,046h,049h,04Ch,045h
        db 020h,049h,053h,020h,04Eh,04Fh,054h,020h,041h,020h,055h,04Eh,049h,054h,020h,046h
        db 049h,04Ch,045h,0Ah,00h,069h,06Eh,074h
str_LocatebigsFILENOTFOUNDS:                    ; string 'locatebigs - FILE NOT FOUND <%s> '; used by
                                                ; LocateBigs
        db 06Ch,06Fh,063h,061h,074h,065h,062h,069h,067h,073h,020h,02Dh,020h,046h,049h,04Ch
        db 045h,020h,04Eh,04Fh,054h,020h,046h,04Fh,055h,04Eh,044h,020h,03Ch,025h,073h,03Eh
        db 0Ah,00h,00h,00h
