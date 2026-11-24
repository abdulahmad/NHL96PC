; Strings and constants of src/lib/sound/snd_hw_sb.asm, in link order.
bits 32
%include "hockey.inc"
section s_1142B8 progbits alloc noexec write align=1
global str_RMHandler, str_ULTRASND, str_StarRule, str_Fs, str_Jan2, str_Feb3, str_Mar2, str_Apr2
global str_May2, str_Jun2, str_Jul2, str_Aug2, str_Sep2, str_Oct2, str_Nov2, str_Dec2
str_RMHandler:                                  ; string 'RMHandler'; used by InstallRealIrqStub
        db 052h,04Dh,048h,061h,06Eh,064h,06Ch,065h,072h,00h,00h,00h
str_ULTRASND:                                   ; string 'ULTRASND'
        db 055h,04Ch,054h,052h,041h,053h,04Eh,044h,00h,00h,00h,00h
str_StarRule:                                   ; line of stars
        db 02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah
        db 02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah
        db 02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,02Ah,00h,064h,065h,064h
str_Fs:                                         ; string '%Fs'
        db 025h,046h,073h,00h
str_Jan2:                                       ; string 'Jan'
        db 04Ah,061h,06Eh,00h
str_Feb3:                                       ; string 'Feb'
        db 046h,065h,062h,00h
str_Mar2:                                       ; string 'Mar'
        db 04Dh,061h,072h,00h
str_Apr2:                                       ; string 'Apr'
        db 041h,070h,072h,00h
str_May2:                                       ; string 'May'
        db 04Dh,061h,079h,00h
str_Jun2:                                       ; string 'Jun'
        db 04Ah,075h,06Eh,00h
str_Jul2:                                       ; string 'Jul'
        db 04Ah,075h,06Ch,00h
str_Aug2:                                       ; string 'Aug'
        db 041h,075h,067h,00h
str_Sep2:                                       ; string 'Sep'
        db 053h,065h,070h,00h
str_Oct2:                                       ; string 'Oct'
        db 04Fh,063h,074h,00h
str_Nov2:                                       ; string 'Nov'
        db 04Eh,06Fh,076h,00h
str_Dec2:                                       ; string 'Dec'
        db 044h,065h,063h,00h
