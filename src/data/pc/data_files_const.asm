; Strings and constants of pc/data_files (src/pc/data_files), in link order.
bits 32
%include "hockey.inc"
section s_110718 progbits alloc noexec write align=1
global str_backslash2, str_07d, str_D15, str_dot3, str_DB2, str_02d
str_backslash2:                                 ; string '\'; used by MakeDataPath,
                                                ; MakeDataPathArchiveJumpTable, MakeDirPath ...
        db 05Ch,00h,00h,00h
str_07d:                                        ; string '%07d'; used by MakeDatabasePath
        db 025h,030h,037h,064h,00h
str_D15:                                        ; string '%d'; used by MakeDatabasePath
        db 025h,064h,00h
str_dot3:                                       ; string '.'; used by MakeDatabasePath
        db 02Eh,00h
str_DB2:                                        ; string 'DB'; used by MakeDatabasePath
        db 044h,042h,00h
str_02d:                                        ; string '%02d'; used by MakeDatabasePath
        db 025h,030h,032h,064h,00h,00h,00h
