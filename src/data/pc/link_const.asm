; Strings and constants of pc/link (src/pc/link), in link order.
bits 32
%include "hockey.inc"
section s_11029C progbits alloc noexec write align=1
global str_ATZS760S1155, str_ATE1, str_ATQ0, str_ATX4, str_ATF1, str_ATH0, str_ATD, str_T
global str_feP, str_ATX3, str_ATS01, str_ATA, str_Punct_ModemSendCommand, str_Punct2, str_AT, str_ATM0
str_ATZS760S1155:                               ; string 'ATZS7=60S11=55'; used by ModemInitDefault
        db 041h,054h,05Ah,053h,037h,03Dh,036h,030h,053h,031h,031h,03Dh,035h,035h,00h
str_ATE1:                                       ; string 'ATE1'; used by ModemInit
        db 041h,054h,045h,031h,00h
str_ATQ0:                                       ; string 'ATQ0'; used by ModemInit
        db 041h,054h,051h,030h,00h
str_ATX4:                                       ; string 'ATX4'; used by ModemInit
        db 041h,054h,058h,034h,00h
str_ATF1:                                       ; string 'ATF1'; used by ModemInit
        db 041h,054h,046h,031h,00h
str_ATH0:                                       ; string 'ATH0'; used by ModemHangup
        db 041h,054h,048h,030h,00h
str_ATD:                                        ; string 'ATD'; used by ModemDial, ModemHangup
        db 041h,054h,044h,00h
str_T:                                          ; string 'T'; used by ModemDial
        db 054h,00h
str_feP:                                        ; string 'P'; used by ModemDial
        db 050h,00h
str_ATX3:                                       ; string 'ATX3'; used by ModemDial
        db 041h,054h,058h,033h,00h
str_ATS01:                                      ; string 'ATS0=1'; used by ModemAutoAnswer
        db 041h,054h,053h,030h,03Dh,031h,00h
str_ATA:                                        ; string 'ATA '; used by ModemAutoAnswer
        db 041h,054h,041h,0Dh,00h
str_Punct_ModemSendCommand:                     ; string "\r"; used by LinkConnect, ModemSendCommand
        db 0Dh,00h
str_Punct2:                                     ; string "+++"; used by ModemAttention
        db 02Bh,02Bh,02Bh,00h
str_AT:                                         ; string "AT"; used by ModemAttention
        db 041h,054h,00h
str_ATM0:                                       ; string 'ATM0'; used by ModemAttention
        db 041h,054h,04Dh,030h,00h,00h
