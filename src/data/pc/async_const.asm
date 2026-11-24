; Strings and constants of pc/async (src/pc/async), in link order.
bits 32
%include "hockey.inc"
section s_1104D0 progbits alloc noexec write align=1
global str_SetasyncspeedSFILEISTOOS, str_SetasyncspeedSFILEISTOOS2, str_ASYNC, str_ASYNCFILE, str_AsyncreaderNOFILESPECIFI, str_AsyncreaderNOFILESPECIFI2, str_AsyncreaderNOFILESPECIFI3, str_GetasyncblockDNOASYNCBLO
str_SetasyncspeedSFILEISTOOS:                   ; string 'setasyncspeed - %s FILE IS TOO SMALL TO ESTIMATE
                                                ; ASYNC SPEED '; used by setasyncspeed
        db 073h,065h,074h,061h,073h,079h,06Eh,063h,073h,070h,065h,065h,064h,020h,02Dh,020h
        db 025h,073h,020h,046h,049h,04Ch,045h,020h,049h,053h,020h,054h,04Fh,04Fh,020h,053h
        db 04Dh,041h,04Ch,04Ch,020h,054h,04Fh,020h,045h,053h,054h,049h,04Dh,041h,054h,045h
        db 020h,041h,053h,059h,04Eh,043h,020h,053h,050h,045h,045h,044h,0Ah,00h
str_SetasyncspeedSFILEISTOOS2:                  ; string 'setasyncspeed - %s FILE IS TOO SMALL TO ESTIMATE
                                                ; ASYNC SPEED '; used by setasyncspeed
        db 073h,065h,074h,061h,073h,079h,06Eh,063h,073h,070h,065h,065h,064h,020h,02Dh,020h
        db 025h,073h,020h,046h,049h,04Ch,045h,020h,049h,053h,020h,054h,04Fh,04Fh,020h,053h
        db 04Dh,041h,04Ch,04Ch,020h,054h,04Fh,020h,045h,053h,054h,049h,04Dh,041h,054h,045h
        db 020h,041h,053h,059h,04Eh,043h,020h,053h,050h,045h,045h,044h,0Ah,00h
str_ASYNC:                                      ; string 'ASYNC'; used by setasyncspeed
        db 041h,053h,059h,04Eh,043h,00h
str_ASYNCFILE:                                  ; string 'ASYNC FILE'; used by AsyncInit
        db 041h,053h,059h,04Eh,043h,020h,046h,049h,04Ch,045h,00h
str_AsyncreaderNOFILESPECIFI:                   ; string 'asyncreader - NO FILE SPECIFIED FOR CHUNK READ ';
                                                ; used by asyncreader
        db 061h,073h,079h,06Eh,063h,072h,065h,061h,064h,065h,072h,020h,02Dh,020h,04Eh,04Fh
        db 020h,046h,049h,04Ch,045h,020h,053h,050h,045h,043h,049h,046h,049h,045h,044h,020h
        db 046h,04Fh,052h,020h,043h,048h,055h,04Eh,04Bh,020h,052h,045h,041h,044h,0Ah,00h
str_AsyncreaderNOFILESPECIFI2:                  ; string 'asyncreader - NO FILE SPECIFIED FOR SECTION READ ';
                                                ; used by asyncreader
        db 061h,073h,079h,06Eh,063h,072h,065h,061h,064h,065h,072h,020h,02Dh,020h,04Eh,04Fh
        db 020h,046h,049h,04Ch,045h,020h,053h,050h,045h,043h,049h,046h,049h,045h,044h,020h
        db 046h,04Fh,052h,020h,053h,045h,043h,054h,049h,04Fh,04Eh,020h,052h,045h,041h,044h
        db 0Ah,00h
str_AsyncreaderNOFILESPECIFI3:                  ; string 'asyncreader - NO FILE SPECIFIED FOR HANDLE READ ';
                                                ; used by asyncreader
        db 061h,073h,079h,06Eh,063h,072h,065h,061h,064h,065h,072h,020h,02Dh,020h,04Eh,04Fh
        db 020h,046h,049h,04Ch,045h,020h,053h,050h,045h,043h,049h,046h,049h,045h,044h,020h
        db 046h,04Fh,052h,020h,048h,041h,04Eh,044h,04Ch,045h,020h,052h,045h,041h,044h,0Ah
        db 00h
str_GetasyncblockDNOASYNCBLO:                   ; string 'getasyncblock[%d] - NO ASYNC BLOCKS LEFT '; used by
                                                ; getasyncblock
        db 067h,065h,074h,061h,073h,079h,06Eh,063h,062h,06Ch,06Fh,063h,06Bh,05Bh,025h,064h
        db 05Dh,020h,02Dh,020h,04Eh,04Fh,020h,041h,053h,059h,04Eh,043h,020h,042h,04Ch,04Fh
        db 043h,04Bh,053h,020h,04Ch,045h,046h,054h,0Ah,00h,00h,00h
