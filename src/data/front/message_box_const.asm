; Strings and constants of front/message_box (src/front/message_box), in link order.
bits 32
%include "hockey.inc"
section s_110308 progbits alloc noexec write align=1
global str_BUT, str_BDREG, str_BDMEN, str_02, str_D14, str_KWKJSKxxxxxx
str_BUT:                                        ; string 'BUT'; used by MessageBox
        db 042h,055h,054h,00h
str_BDREG:                                      ; string 'BD_REG'; used by MessageBox
        db 042h,044h,05Fh,052h,045h,047h,00h
str_BDMEN:                                      ; string 'BD_MEN'; used by MessageBox
        db 042h,044h,05Fh,04Dh,045h,04Eh,00h
str_02:                                         ; string '0%'; used by ShowProgressBox
        db 030h,025h,00h
str_D14:                                        ; string '%d%%'; used by UpdateProgressBox
        db 025h,064h,025h,025h,00h,00h,00h
str_KWKJSKxxxxxx:                               ; string 'KWKJSKxxxxxx'
        db 04Bh,057h,04Bh,04Ah,053h,04Bh,078h,078h,078h,078h,078h,078h,00h
