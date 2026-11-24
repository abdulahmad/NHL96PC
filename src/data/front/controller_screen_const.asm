; Strings and constants of front/controller_screen (src/front/controller_screen), in link order.
bits 32
%include "hockey.inc"
section s_111E44 progbits alloc noexec write align=1
global str_Log7, str_Logx, str_PlyD, str_MseD2, str_Jy1D, str_Jy2D, str_Jy3D, str_Jy4D
global str_KeyD2, str_MdmD, str_P11, str_P21, str_Usri, str_Usrh, str_Utext, str_MCONTROL
global str_Pal12, str_Bkgd6, str_Key1, str_P12, str_P13, str_P1G, str_P22, str_P23
global str_P2G
str_Log7:                                       ; string 'log7'; used by ControllerUsersPanel
        db 06Ch,06Fh,067h,037h,00h
str_Logx:                                       ; string 'logx'; used by ControllerUsersPanel
        db 06Ch,06Fh,067h,078h,00h
str_PlyD:                                       ; string 'ply%d'; used by ControllerScreen, DeviceIconShape
        db 070h,06Ch,079h,025h,064h,00h
str_MseD2:                                      ; string 'mse%d'; used by DeviceIconShape
        db 06Dh,073h,065h,025h,064h,00h
str_Jy1D:                                       ; string 'jy1%d'; used by DeviceIconShape
        db 06Ah,079h,031h,025h,064h,00h
str_Jy2D:                                       ; string 'jy2%d'; used by DeviceIconShape
        db 06Ah,079h,032h,025h,064h,00h
str_Jy3D:                                       ; string 'jy3%d'; used by DeviceIconShape
        db 06Ah,079h,033h,025h,064h,00h
str_Jy4D:                                       ; string 'jy4%d'; used by DeviceIconShape
        db 06Ah,079h,034h,025h,064h,00h
str_KeyD2:                                      ; string 'key%d'; used by DeviceIconShape
        db 06Bh,065h,079h,025h,064h,00h
str_MdmD:                                       ; string 'mdm%d'; used by DeviceIconShape
        db 06Dh,064h,06Dh,025h,064h,00h
str_P11:                                        ; string 'p1_1'; used by ControllerScreen, SetControllerIcon
        db 070h,031h,05Fh,031h,00h
str_P21:                                        ; string 'p2_1'; used by ControllerScreen, SetControllerIcon
        db 070h,032h,05Fh,031h,00h
str_Usri:                                       ; string 'usri'; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 075h,073h,072h,069h,00h
str_Usrh:                                       ; string 'usrh'; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 075h,073h,072h,068h,00h
str_Utext:                                      ; string 'utext'; used by ControllerScreen,
                                                ; DrawControllerColumns
        db 075h,074h,065h,078h,074h,00h
str_MCONTROL:                                   ; string 'M_CONTROL'; used by ControllerScreen
        db 04Dh,05Fh,043h,04Fh,04Eh,054h,052h,04Fh,04Ch,00h
str_Pal12:                                      ; string '!pal'; used by ControllerScreen
        db 021h,070h,061h,06Ch,00h
str_Bkgd6:                                      ; string 'bkgd'; used by ControllerScreen
        db 062h,06Bh,067h,064h,00h
str_Key1:                                       ; string 'key1'; used by ControllerScreen
        db 06Bh,065h,079h,031h,00h
str_P12:                                        ; string 'p1_2'; used by ControllerScreen
        db 070h,031h,05Fh,032h,00h
str_P13:                                        ; string 'p1_3'; used by ControllerScreen
        db 070h,031h,05Fh,033h,00h
str_P1G:                                        ; string 'p1_g'; used by ControllerScreen
        db 070h,031h,05Fh,067h,00h
str_P22:                                        ; string 'p2_2'; used by ControllerScreen
        db 070h,032h,05Fh,032h,00h
str_P23:                                        ; string 'p2_3'; used by ControllerScreen
        db 070h,032h,05Fh,033h,00h
str_P2G:                                        ; string 'p2_g'; used by ControllerScreen
        db 070h,032h,05Fh,067h,00h,00h
