; Strings and constants of src/lib/ea/ea_load_file_cached.asm, in link order.
bits 32
%include "hockey.inc"
section s_113EBC progbits alloc noexec write align=1
global str_FshVshQfsQvs, str_Vsh, str_Qvs
str_FshVshQfsQvs:                               ; string ".fsh.vsh.qfs.qvs"; used by LoadFileCached
        db 02Eh,066h,073h,068h,02Eh,076h,073h,068h,02Eh,071h,066h,073h,02Eh,071h,076h,073h
        db 00h,06Ch,020h,073h
str_Vsh:                                        ; string ".vsh"; used by LoadFileCached
        db 02Eh,076h,073h,068h,00h,071h,075h,061h
str_Qvs:                                        ; string ".qvs"; used by LoadFileCached
        db 02Eh,071h,076h,073h,00h,00h,00h,00h
