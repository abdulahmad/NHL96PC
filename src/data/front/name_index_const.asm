; Strings and constants of front/name_index (src/front/name_index), in link order.
bits 32
%include "hockey.inc"
section s_1102EC progbits alloc noexec write align=1
global str_NAMEINDEX, str_backslash3
str_NAMEINDEX:                                  ; string 'NAMEINDEX'; used by NameIndexAdd, NameIndexNew,
                                                ; NameIndexRemove
        db 04Eh,041h,04Dh,045h,049h,04Eh,044h,045h,058h,00h
str_backslash3:                                 ; string '\'; used by NameIndexLoad, NameIndexPath,
                                                ; NameIndexSave
        db 05Ch,00h
