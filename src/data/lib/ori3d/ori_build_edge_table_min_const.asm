; Strings and constants of src/lib/ori3d/ori_build_edge_table_min.asm, in link order.
bits 32
%include "hockey.inc"
section s_1141B4 progbits alloc noexec write align=1
global str_BuildtableminLinearmapfExcee, str_BuildfixedtableminLinear, str_BuildtableminLinearmapfE, str_BuildtableminLinearmapfE2
str_BuildtableminLinearmapfExcee:               ; string "buildtablemin (linearmapf) - exceeded 768 max height
                                                ; (%d)\n"; used by BuildEdgeTableMin
        db 062h,075h,069h,06Ch,064h,074h,061h,062h,06Ch,065h,06Dh,069h,06Eh,020h,028h,06Ch
        db 069h,06Eh,065h,061h,072h,06Dh,061h,070h,066h,029h,020h,02Dh,020h,065h,078h,063h
        db 065h,065h,064h,065h,064h,020h,037h,036h,038h,020h,06Dh,061h,078h,020h,068h,065h
        db 069h,067h,068h,074h,020h,028h,025h,064h,029h,0Ah,00h,020h
str_BuildfixedtableminLinear:                   ; string 'buildfixedtablemin (linearmapf) - exceeded 768 max
                                                ; height (%d) '; used by BuildFixedTableMin
        db 062h,075h,069h,06Ch,064h,066h,069h,078h,065h,064h,074h,061h,062h,06Ch,065h,06Dh
        db 069h,06Eh,020h,028h,06Ch,069h,06Eh,065h,061h,072h,06Dh,061h,070h,066h,029h,020h
        db 02Dh,020h,065h,078h,063h,065h,065h,064h,065h,064h,020h,037h,036h,038h,020h,06Dh
        db 061h,078h,020h,068h,065h,069h,067h,068h,074h,020h,028h,025h,064h,029h,0Ah,00h
str_BuildtableminLinearmapfE:                   ; string 'buildtablemin (linearmapf) - exceeded 768 max height
                                                ; (%d) '; used by BuildFixedTableMin
        db 062h,075h,069h,06Ch,064h,074h,061h,062h,06Ch,065h,06Dh,069h,06Eh,020h,028h,06Ch
        db 069h,06Eh,065h,061h,072h,06Dh,061h,070h,066h,029h,020h,02Dh,020h,065h,078h,063h
        db 065h,065h,064h,065h,064h,020h,037h,036h,038h,020h,06Dh,061h,078h,020h,068h,065h
        db 069h,067h,068h,074h,020h,028h,025h,064h,029h,0Ah,00h,00h
str_BuildtableminLinearmapfE2:                  ; string 'buildtablemin (linearmapf) - exceeded 768 max height
                                                ; (%d) '; used by BuildFixedTableMax
        db 062h,075h,069h,06Ch,064h,074h,061h,062h,06Ch,065h,06Dh,069h,06Eh,020h,028h,06Ch
        db 069h,06Eh,065h,061h,072h,06Dh,061h,070h,066h,029h,020h,02Dh,020h,065h,078h,063h
        db 065h,065h,064h,065h,064h,020h,037h,036h,038h,020h,06Dh,061h,078h,020h,068h,065h
        db 069h,067h,068h,074h,020h,028h,025h,064h,029h,0Ah,00h,00h
