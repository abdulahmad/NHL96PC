; Strings and constants of pc/modem_setup (src/pc/modem_setup), in link order.
bits 32
%include "hockey.inc"
section s_111ED0 progbits alloc noexec write align=1
global str_Off1, str_Onn1, str_SldD, str_Onn0, str_Off0, str_PICKS, str_Pal13, str_BKGD7
global str_CMD0, str_HGH0, str_HGH1, str_LOW0, str_LOW1, str_CMD1, str_LOWD, str_Bkgd8
global str_ALFB, str_ALFT, str_BALL2, str_ARHB, str_ARHT, str_MseD, str_KeyD, str_Mse0
global str_Mse1, str_Mse2, str_Key0, str_Key12, str_Key2, str_Jy10, str_Jy11, str_Jy12
global str_Jy1x, str_Jy20, str_Jy21, str_Jy22, str_Jy2x, str_Det0, str_Det1, str_Det22
global str_PICKS2, str_bangpal, str_BKGD22, str_01D0, str_02D0, str_0D00, str_TONE, str_PULS
global str_02D2, str_01D2, str_NUMD, str_NMD0, str_NMD1, str_MAK2, str_MAK0, str_MAK1
global str_WFC2, str_WFC0, str_WFC1, str_YES0, str_YES1, str_NOO0, str_NOO1, str_CMD02
global str_SET02, str_SET13, str_SET23, str_CMD2, str_Bkgd23
str_Off1:                                       ; string 'off1'; used by ControlPicksScreen,
                                                ; ControlSetupScreen, DrawOnOffSlider ...
        db 06Fh,066h,066h,031h,00h
str_Onn1:                                       ; string 'onn1'; used by ControlPicksScreen,
                                                ; ControlSetupScreen, DrawOnOffSlider ...
        db 06Fh,06Eh,06Eh,031h,00h
str_SldD:                                       ; string 'sld%d'; used by DrawOnOffSlider
        db 073h,06Ch,064h,025h,064h,00h
str_Onn0:                                       ; string 'onn0'; used by ControlPicksScreen,
                                                ; ControlSetupScreen, DrawOnOffSlider ...
        db 06Fh,06Eh,06Eh,030h,00h
str_Off0:                                       ; string 'off0'; used by ControlPicksScreen,
                                                ; ControlSetupScreen, DrawOnOffSlider ...
        db 06Fh,066h,066h,030h,00h
str_PICKS:                                      ; string 'PICKS'; used by ControlPicksScreen
        db 050h,049h,043h,04Bh,053h,00h
str_Pal13:                                      ; string '!pal'; used by ControlPicksScreen,
                                                ; ControlSetupScreen
        db 021h,070h,061h,06Ch,00h
str_BKGD7:                                      ; string 'BKGD'; used by ControlPicksScreen
        db 042h,04Bh,047h,044h,00h
str_CMD0:                                       ; string 'CM%d0'; used by ControlPicksScreen
        db 043h,04Dh,025h,064h,030h,00h
str_HGH0:                                       ; string 'HGH0'; used by ControlPicksScreen
        db 048h,047h,048h,030h,00h
str_HGH1:                                       ; string 'HGH1'; used by ControlPicksScreen
        db 048h,047h,048h,031h,00h
str_LOW0:                                       ; string 'LOW0'; used by ControlPicksScreen
        db 04Ch,04Fh,057h,030h,00h
str_LOW1:                                       ; string 'LOW1'; used by ControlPicksScreen
        db 04Ch,04Fh,057h,031h,00h
str_CMD1:                                       ; string 'CM%d1'; used by ControlPicksScreen
        db 043h,04Dh,025h,064h,031h,00h
str_LOWD:                                       ; string 'LOW%d'; used by ControlPicksScreen
        db 04Ch,04Fh,057h,025h,064h,00h
str_Bkgd8:                                      ; string 'bkgd'; used by ControlSetupScreen
        db 062h,06Bh,067h,064h,00h
str_ALFB:                                       ; string 'ALFB'; used by ControlSetupScreen
        db 041h,04Ch,046h,042h,00h
str_ALFT:                                       ; string 'ALFT'; used by ControlSetupScreen
        db 041h,04Ch,046h,054h,00h
str_BALL2:                                      ; string 'BALL'; used by ControlSetupScreen
        db 042h,041h,04Ch,04Ch,00h
str_ARHB:                                       ; string 'ARHB'; used by ControlSetupScreen
        db 041h,052h,048h,042h,00h
str_ARHT:                                       ; string 'ARHT'; used by ControlSetupScreen
        db 041h,052h,048h,054h,00h
str_MseD:                                       ; string 'mse%d'; used by ControlSetupScreen
        db 06Dh,073h,065h,025h,064h,00h
str_KeyD:                                       ; string 'key%d'; used by ControlSetupScreen
        db 06Bh,065h,079h,025h,064h,00h
str_Mse0:                                       ; string 'mse0'; used by ControlSetupScreen
        db 06Dh,073h,065h,030h,00h
str_Mse1:                                       ; string 'mse1'; used by ControlSetupScreen
        db 06Dh,073h,065h,031h,00h
str_Mse2:                                       ; string 'mse2'; used by ControlSetupScreen
        db 06Dh,073h,065h,032h,00h
str_Key0:                                       ; string 'key0'; used by ControlSetupScreen
        db 06Bh,065h,079h,030h,00h
str_Key12:                                      ; string 'key1'; used by ControlSetupScreen
        db 06Bh,065h,079h,031h,00h
str_Key2:                                       ; string 'key2'; used by ControlSetupScreen
        db 06Bh,065h,079h,032h,00h
str_Jy10:                                       ; string 'jy10'; used by ControlSetupScreen
        db 06Ah,079h,031h,030h,00h
str_Jy11:                                       ; string 'jy11'; used by ControlSetupScreen
        db 06Ah,079h,031h,031h,00h
str_Jy12:                                       ; string 'jy12'; used by ControlSetupScreen
        db 06Ah,079h,031h,032h,00h
str_Jy1x:                                       ; string 'jy1x'; used by ControlSetupScreen
        db 06Ah,079h,031h,078h,00h
str_Jy20:                                       ; string 'jy20'; used by ControlSetupScreen
        db 06Ah,079h,032h,030h,00h
str_Jy21:                                       ; string 'jy21'; used by ControlSetupScreen
        db 06Ah,079h,032h,031h,00h
str_Jy22:                                       ; string 'jy22'; used by ControlSetupScreen
        db 06Ah,079h,032h,032h,00h
str_Jy2x:                                       ; string 'jy2x'; used by ControlSetupScreen
        db 06Ah,079h,032h,078h,00h
str_Det0:                                       ; string 'det0'; used by ControlSetupScreen
        db 064h,065h,074h,030h,00h
str_Det1:                                       ; string 'det1'; used by ControlSetupScreen
        db 064h,065h,074h,031h,00h
str_Det22:                                      ; string 'det2'; used by ControlSetupScreen
        db 064h,065h,074h,032h,00h,00h
str_PICKS2:                                     ; string 'PICKS'; used by ModemSettingsScreen
        db 050h,049h,043h,04Bh,053h,00h
str_bangpal:                                    ; string '!pal'; used by LinkSetupScreen, ModemDialScreen,
                                                ; ModemSettingsScreen
        db 021h,070h,061h,06Ch,00h
str_BKGD22:                                     ; string 'BKGD'; used by ModemDialScreen, ModemSettingsScreen
        db 042h,04Bh,047h,044h,00h
str_01D0:                                       ; string '01%d0'; used by ModemSettingsScreen
        db 030h,031h,025h,064h,030h,00h
str_02D0:                                       ; string '02%d0'; used by ModemSettingsScreen
        db 030h,032h,025h,064h,030h,00h
str_0D00:                                       ; string '0%d00'; used by ModemSettingsScreen
        db 030h,025h,064h,030h,030h,00h
str_TONE:                                       ; string 'TONE'; used by ModemSettingsScreen
        db 054h,04Fh,04Eh,045h,00h
str_PULS:                                       ; string 'PULS'; used by ModemSettingsScreen
        db 050h,055h,04Ch,053h,00h
str_02D2:                                       ; string '02%d2'; used by ModemSettingsScreen
        db 030h,032h,025h,064h,032h,00h
str_01D2:                                       ; string '01%d2'; used by ModemSettingsScreen
        db 030h,031h,025h,064h,032h,00h
str_NUMD:                                       ; string 'NUM%d'; used by DrawPhoneNumber
        db 04Eh,055h,04Dh,025h,064h,00h
str_NMD0:                                       ; string 'NM%d0'; used by DrawPhoneNumber
        db 04Eh,04Dh,025h,064h,030h,00h
str_NMD1:                                       ; string 'NM%d1'; used by DrawPhoneNumber
        db 04Eh,04Dh,025h,064h,031h,00h
str_MAK2:                                       ; string 'MAK2'; used by ModemDialScreen
        db 04Dh,041h,04Bh,032h,00h
str_MAK0:                                       ; string 'MAK0'; used by ModemDialScreen
        db 04Dh,041h,04Bh,030h,00h
str_MAK1:                                       ; string 'MAK1'; used by ModemDialScreen
        db 04Dh,041h,04Bh,031h,00h
str_WFC2:                                       ; string 'WFC2'; used by ModemDialScreen
        db 057h,046h,043h,032h,00h
str_WFC0:                                       ; string 'WFC0'; used by ModemDialScreen
        db 057h,046h,043h,030h,00h
str_WFC1:                                       ; string 'WFC1'; used by ModemDialScreen
        db 057h,046h,043h,031h,00h
str_YES0:                                       ; string 'YES0'; used by ModemDialScreen
        db 059h,045h,053h,030h,00h
str_YES1:                                       ; string 'YES1'; used by ModemDialScreen
        db 059h,045h,053h,031h,00h
str_NOO0:                                       ; string 'NOO0'; used by ModemDialScreen
        db 04Eh,04Fh,04Fh,030h,00h
str_NOO1:                                       ; string 'NOO1'; used by ModemDialScreen
        db 04Eh,04Fh,04Fh,031h,00h
str_CMD02:                                      ; string 'CM%d0'; used by ModemDialScreen
        db 043h,04Dh,025h,064h,030h,00h
str_SET02:                                      ; string 'SET0'; used by ModemDialScreen
        db 053h,045h,054h,030h,00h
str_SET13:                                      ; string 'SET1'; used by ModemDialScreen
        db 053h,045h,054h,031h,00h
str_SET23:                                      ; string 'SET2'; used by ModemDialScreen
        db 053h,045h,054h,032h,00h
str_CMD2:                                       ; string 'CM%d2'; used by ModemDialScreen
        db 043h,04Dh,025h,064h,032h,00h
str_Bkgd23:                                     ; string 'bkgd'; used by LinkSetupScreen
        db 062h,06Bh,067h,064h,00h
