; Strings and constants of pc/cdstream (src/pc/cdstream), in link order.
bits 32
%include "hockey.inc"
section s_11061C progbits alloc noexec write align=1
global str_CDSTREAM, str_SetstreamspeedSFILEISTOO, str_STREAM, str_DelstreamSTREAMNOTFOUND, str_SECCDSTREAM, str_StreamreaderILLEGALCHUNK
str_CDSTREAM:                                   ; string "CDSTREAM"; used by CdStreamOpen
        db 043h,044h,053h,054h,052h,045h,041h,04Dh,00h
str_SetstreamspeedSFILEISTOO:                   ; string 'setstreamspeed - %s FILE IS TOO SMALL TO ESTIMATE
                                                ; DATA STREAM SPEED Size is %d. Require %d. '; used by
                                                ; setstreamspeed
        db 073h,065h,074h,073h,074h,072h,065h,061h,06Dh,073h,070h,065h,065h,064h,020h,02Dh
        db 020h,025h,073h,020h,046h,049h,04Ch,045h,020h,049h,053h,020h,054h,04Fh,04Fh,020h
        db 053h,04Dh,041h,04Ch,04Ch,020h,054h,04Fh,020h,045h,053h,054h,049h,04Dh,041h,054h
        db 045h,020h,044h,041h,054h,041h,020h,053h,054h,052h,045h,041h,04Dh,020h,053h,050h
        db 045h,045h,044h,0Ah,053h,069h,07Ah,065h,020h,069h,073h,020h,025h,064h,02Eh,020h
        db 052h,065h,071h,075h,069h,072h,065h,020h,025h,064h,02Eh,0Ah,00h
str_STREAM:                                     ; string 'STREAM'; used by setstreamspeed
        db 053h,054h,052h,045h,041h,04Dh,00h
str_DelstreamSTREAMNOTFOUND:                    ; string 'delstream - STREAM NOT FOUND '; used by delstream
        db 064h,065h,06Ch,073h,074h,072h,065h,061h,06Dh,020h,02Dh,020h,053h,054h,052h,045h
        db 041h,04Dh,020h,04Eh,04Fh,054h,020h,046h,04Fh,055h,04Eh,044h,0Ah,00h
str_SECCDSTREAM:                                ; string "SECCDSTREAM"; used by CdStreamOpenSecondary
        db 053h,045h,043h,043h,044h,053h,054h,052h,045h,041h,04Dh,00h
str_StreamreaderILLEGALCHUNK:                   ; string 'streamreader - ILLEGAL CHUNK SIZE %d BUFFERSIZE %d
                                                ; '; used by CdStreamService
        db 073h,074h,072h,065h,061h,06Dh,072h,065h,061h,064h,065h,072h,020h,02Dh,020h,049h
        db 04Ch,04Ch,045h,047h,041h,04Ch,020h,043h,048h,055h,04Eh,04Bh,020h,053h,049h,05Ah
        db 045h,020h,025h,064h,020h,042h,055h,046h,046h,045h,052h,053h,049h,05Ah,045h,020h
        db 025h,064h,0Ah,00h,00h
