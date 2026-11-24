; Strings and constants of src/lib/cd/cd_find_file.asm, in link order.
bits 32
%include "hockey.inc"
section s_113794 progbits alloc noexec write align=1
global str_CDROMDATA, str_CDROMBUFFER, str_CdromcheckCDROMSTATUSNOTRETU, str_CdromreadREADGREATERTHANMAXR, str_CdromreadREADSTATUSERRORX, str_CdromseekSEEKSTATUSX, str_CdromdirectoryentryERROR
str_CDROMDATA:                                  ; string "CDROM DATA"; used by AllocCdBuffer
        db 043h,044h,052h,04Fh,04Dh,020h,044h,041h,054h,041h,00h,04Fh
str_CDROMBUFFER:                                ; string "CDROM BUFFER"; used by AllocCdBuffer
        db 043h,044h,052h,04Fh,04Dh,020h,042h,055h,046h,046h,045h,052h,00h,076h,06Fh,069h
str_CdromcheckCDROMSTATUSNOTRETU:               ; string "cdromcheck - CDROM STATUS NOT RETURNED \n"; used by
                                                ; DetectMscdex
        db 063h,064h,072h,06Fh,06Dh,063h,068h,065h,063h,06Bh,020h,02Dh,020h,043h,044h,052h
        db 04Fh,04Dh,020h,053h,054h,041h,054h,055h,053h,020h,04Eh,04Fh,054h,020h,052h,045h
        db 054h,055h,052h,04Eh,045h,044h,020h,0Ah,00h,069h,06Eh,074h
str_CdromreadREADGREATERTHANMAXR:               ; string "cdromread - READ GREATER THAN MAXREADSECTORS %d\n";
                                                ; used by CdReadRequest
        db 063h,064h,072h,06Fh,06Dh,072h,065h,061h,064h,020h,02Dh,020h,052h,045h,041h,044h
        db 020h,047h,052h,045h,041h,054h,045h,052h,020h,054h,048h,041h,04Eh,020h,04Dh,041h
        db 058h,052h,045h,041h,044h,053h,045h,043h,054h,04Fh,052h,053h,020h,025h,064h,0Ah
        db 00h,02Ah,06Dh,061h
str_CdromreadREADSTATUSERRORX:                  ; string "cdromread - READ STATUS ERROR=%x\n"; used by
                                                ; CdReadRequest
        db 063h,064h,072h,06Fh,06Dh,072h,065h,061h,064h,020h,02Dh,020h,052h,045h,041h,044h
        db 020h,053h,054h,041h,054h,055h,053h,020h,045h,052h,052h,04Fh,052h,03Dh,025h,078h
        db 0Ah,00h,063h,064h
str_CdromseekSEEKSTATUSX:                       ; string "cdromseek - SEEK STATUS =%x\n"; used by CdSeekCmd
        db 063h,064h,072h,06Fh,06Dh,073h,065h,065h,06Bh,020h,02Dh,020h,053h,045h,045h,04Bh
        db 020h,053h,054h,041h,054h,055h,053h,020h,03Dh,025h,078h,0Ah,00h,052h,04Fh,04Dh
str_CdromdirectoryentryERROR:                   ; string 'cdromdirectoryentry - ERROR %x READING DIRECTORY %s
                                                ; '; used by CdDirEntry
        db 063h,064h,072h,06Fh,06Dh,064h,069h,072h,065h,063h,074h,06Fh,072h,079h,065h,06Eh
        db 074h,072h,079h,020h,02Dh,020h,045h,052h,052h,04Fh,052h,020h,025h,078h,020h,052h
        db 045h,041h,044h,049h,04Eh,047h,020h,044h,049h,052h,045h,043h,054h,04Fh,052h,059h
        db 020h,025h,073h,0Ah,00h,00h,00h,00h
