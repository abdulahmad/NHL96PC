; Strings and constants of src/lib/ea/ea_debug_get_key.asm, in link order.
bits 32
%include "hockey.inc"
section s_114330 progbits alloc noexec write align=1
global str_HW77xPool77xMax77xDOSHW77xDO, str_HW7uPool7uMax7uDOSHW7uDOSPoo, str_Used77xFree77xLargst77x, str_Used7uFree7u, str_NAMESIZEADRFLAG, str_IDXNAMESIZEADRFLAG, str_C, str_80s
global MemViewStrings, str_S9, str_S_MemViewerDrawList, str_SPACE10x8s8s, str_SPACE10d8s8s, str_SPACE1010x88s88s, str_SPACE10d88s88s, str_1212s10x8s8s
global str_1212s10d8s8s, str_33d1212s1010x88s88s44x, str_33d1212s10d88s88s44x, str_MEMMANAGER, str_X_DebugSprintf, str_044X00000000, str_1_MemViewerBlockInfo, str_SYSTEM
global str_SPACE3, str_HIGHMemoryBlock, str_LOWMemoryBlock, str_ConventionalMemory, str_RelocatableBlock, str_NonRelocatableBlock, str_ALIGNFlagIsSet, str_PRIORITY1d
global str_SequenceD, str_BlockIsPURGABLE, str_04x2, str_02x, str_Punct_HexDumpRow, str_SpaceHex, str_FourSpacesHex, str_FILES2
global str_DATES2, str_TIMES3, str_N_WriteMemMap, str_FF, str_HexmemdspOS, str_XxMMAPTXT, str_W_DumpMemoryMap, str_ErrorDumpingMemoryMap
global str_ShapeFileIsInvalid, str_NumDPackedD, str_ThereAreNoShapes, str_44s05x, str_Bad, str_CxCy3d3d, str_NotDrawn, str_Bytes3dRows3d
global str_Un, str_Spacked, str_Packed, str_Unpacked_ShapeInfo, str_3d3d3d3dS, str_Type02xNext05x, str_ShapeIsInvalidDraw, str_MEMSHPTXT
global str_ErrorDumpingShapesList, str_ShapeFileName0, str_ShapeFileSizeLd, str_NumberOfShapesD, str_44s66ld, str_Bytes3dRows3d2, str_XY3d3d, str_Punct_DumpShapesList
global str_033d022X, str_R022d, str_G022d, str_B022d, str_02d_PaletteViewerLabel, str_SCREEN2, str_Tga, str_02d3s02d_FormatDateTime
global str_2d02d02d
str_HW77xPool77xMax77xDOSHW77xDO:               ; string " HW=%7.7x Pool=%7.7x Max=%7.7x DOSHW=%7.7x
                                                ; DOSPool=%7.7x"; used by MemViewerDrawList
        db 020h,020h,048h,057h,03Dh,025h,037h,02Eh,037h,078h,020h,050h,06Fh,06Fh,06Ch,03Dh
        db 025h,037h,02Eh,037h,078h,020h,04Dh,061h,078h,03Dh,025h,037h,02Eh,037h,078h,020h
        db 044h,04Fh,053h,048h,057h,03Dh,025h,037h,02Eh,037h,078h,020h,044h,04Fh,053h,050h
        db 06Fh,06Fh,06Ch,03Dh,025h,037h,02Eh,037h,078h,00h,0Dh,0Ah
str_HW7uPool7uMax7uDOSHW7uDOSPoo:               ; string " HW=%-7u Pool=%-7u Max=%-7u DOSHW=%-7u
                                                ; DOSPool=%-7u"; used by MemViewerDrawList
        db 020h,020h,048h,057h,03Dh,025h,02Dh,037h,075h,020h,050h,06Fh,06Fh,06Ch,03Dh,025h
        db 02Dh,037h,075h,020h,04Dh,061h,078h,03Dh,025h,02Dh,037h,075h,020h,044h,04Fh,053h
        db 048h,057h,03Dh,025h,02Dh,037h,075h,020h,044h,04Fh,053h,050h,06Fh,06Fh,06Ch,03Dh
        db 025h,02Dh,037h,075h,00h,02Ah,02Ah,02Ah
str_Used77xFree77xLargst77x:                    ; string 'Used=%7.7x Free=%7.7x Largst=%7.7x '; used by
                                                ; MemViewerDrawList
        db 055h,073h,065h,064h,03Dh,025h,037h,02Eh,037h,078h,020h,046h,072h,065h,065h,03Dh
        db 025h,037h,02Eh,037h,078h,020h,04Ch,061h,072h,067h,073h,074h,03Dh,025h,037h,02Eh
        db 037h,078h,020h,00h
str_Used7uFree7u:                               ; string "Used=%-7u Free=%-7u Largst=%-7u"; used by
                                                ; MemViewerDrawList
        db 055h,073h,065h,064h,03Dh,025h,02Dh,037h,075h,020h,046h,072h,065h,065h,03Dh,025h
        db 02Dh,037h,075h,020h,04Ch,061h,072h,067h,073h,074h,03Dh,025h,02Dh,037h,075h,00h
str_NAMESIZEADRFLAG:                            ; string " NAME SIZE ADR FLAG "; used by MemViewerDrawList
        db 020h,020h,020h,020h,04Eh,041h,04Dh,045h,020h,020h,020h,020h,020h,020h,053h,049h
        db 05Ah,045h,020h,020h,020h,020h,020h,020h,020h,041h,044h,052h,020h,020h,020h,020h
        db 020h,020h,046h,04Ch,041h,047h,020h,020h,00h,02Eh,037h,078h
str_IDXNAMESIZEADRFLAG:                         ; string 'IDX NAME SIZE ADR FLAG'; used by MemViewerDrawList
        db 049h,044h,058h,020h,020h,020h,020h,020h,04Eh,041h,04Dh,045h,020h,020h,020h,020h
        db 020h,020h,020h,020h,020h,020h,020h,053h,049h,05Ah,045h,020h,020h,020h,020h,041h
        db 044h,052h,020h,020h,020h,020h,046h,04Ch,041h,047h,00h,00h
str_C:                                          ; string "%c"; used by HexDumpRow, MemViewerDrawList
        db 025h,063h,00h,048h
str_80s:                                        ; string "%-80s"; used by HexDumpRow, MemViewerDrawList
        db 025h,02Dh,038h,030h,073h,00h,020h,044h
MemViewStrings:                                 ; memory viewer strings; used by DumpShapesList, HexDumpRow,
                                                ; MemViewerDrawList ...
        db 00h,053h,050h,06Fh
str_S9:                                         ; string '%s '; used by DumpShapesList, MemViewerDrawList,
                                                ; WriteMemMap
        db 025h,073h,0Ah,00h
str_S_MemViewerDrawList:                        ; string "%s\n\n"; used by MemViewerDrawList
        db 025h,073h,0Ah,0Ah,00h,02Ah,02Ah,055h
str_SPACE10x8s8s:                               ; string " SPACE %10x %8s %8s"; used by MemViewerDrawList
        db 020h,020h,020h,020h,020h,053h,050h,041h,043h,045h,020h,020h,020h,025h,031h,030h
        db 078h,020h,025h,038h,073h,020h,025h,038h,073h,00h,074h,03Dh
str_SPACE10d8s8s:                               ; string " SPACE %10d %8s %8s"; used by MemViewerDrawList
        db 020h,020h,020h,020h,020h,053h,050h,041h,043h,045h,020h,020h,020h,025h,031h,030h
        db 064h,020h,025h,038h,073h,020h,025h,038h,073h,00h,020h,04Ch
str_SPACE1010x88s88s:                           ; string " SPACE %10.10x %8.8s %8.8s"; used by
                                                ; MemViewerDrawList
        db 020h,020h,020h,020h,020h,020h,020h,053h,050h,041h,043h,045h,020h,020h,020h,020h
        db 020h,025h,031h,030h,02Eh,031h,030h,078h,020h,025h,038h,02Eh,038h,073h,020h,025h
        db 038h,02Eh,038h,073h,00h,044h,052h,020h
str_SPACE10d88s88s:                             ; string " SPACE %10d %8.8s %8.8s"; used by MemViewerDrawList
        db 020h,020h,020h,020h,020h,020h,020h,053h,050h,041h,043h,045h,020h,020h,020h,020h
        db 020h,025h,031h,030h,064h,020h,025h,038h,02Eh,038h,073h,020h,025h,038h,02Eh,038h
        db 073h,00h,020h,020h
str_1212s10x8s8s:                               ; string '%-12.12s %10x %8s %8s'; used by MemViewerDrawList
        db 025h,02Dh,031h,032h,02Eh,031h,032h,073h,020h,025h,031h,030h,078h,020h,025h,038h
        db 073h,020h,025h,038h,073h,00h,00h,00h
str_1212s10d8s8s:                               ; string "%-12.12s %10d %8s %8s"; used by MemViewerDrawList
        db 025h,02Dh,031h,032h,02Eh,031h,032h,073h,020h,025h,031h,030h,064h,020h,025h,038h
        db 073h,020h,025h,038h,073h,00h,0Ah,0Ah
str_33d1212s1010x88s88s44x:                     ; string "%3.3d %-12.12s %10.10x %8.8s %8.8s %4.4x"; used by
                                                ; MemViewerDrawList
        db 025h,033h,02Eh,033h,064h,020h,025h,02Dh,031h,032h,02Eh,031h,032h,073h,020h,025h
        db 031h,030h,02Eh,031h,030h,078h,020h,025h,038h,02Eh,038h,073h,020h,025h,038h,02Eh
        db 038h,073h,020h,025h,034h,02Eh,034h,078h,00h,045h,020h,020h
str_33d1212s10d88s88s44x:                       ; string "%3.3d %-12.12s %10d %8.8s %8.8s %4.4x"; used by
                                                ; MemViewerDrawList
        db 025h,033h,02Eh,033h,064h,020h,025h,02Dh,031h,032h,02Eh,031h,032h,073h,020h,025h
        db 031h,030h,064h,020h,025h,038h,02Eh,038h,073h,020h,025h,038h,02Eh,038h,073h,020h
        db 025h,034h,02Eh,034h,078h,00h,030h,078h
str_MEMMANAGER:                                 ; string "MEM MANAGER"; used by MemViewerDrawTitle
        db 04Dh,045h,04Dh,020h,04Dh,041h,04Eh,041h,047h,045h,052h,00h
str_X_DebugSprintf:                             ; string "%x"; used by DebugSprintf
        db 025h,078h,00h,020h
str_044X00000000:                               ; string "%04.4X (0000 0000 0000 0000)"; used by
                                                ; MemViewerBlockInfo
        db 025h,030h,034h,02Eh,034h,058h,020h,028h,030h,030h,030h,030h,020h,030h,030h,030h
        db 030h,020h,030h,030h,030h,030h,020h,030h,030h,030h,030h,029h,00h,038h,02Eh,038h
str_1_MemViewerBlockInfo:                       ; string "1"; used by MemViewerBlockInfo
        db 031h,00h,020h,020h
str_SYSTEM:                                     ; string " SYSTEM "; used by MemViewerBlockInfo
        db 020h,053h,059h,053h,054h,045h,04Dh,020h,00h,00h,00h,00h
str_SPACE3:                                     ; string " SPACE "; used by MemViewerBlockInfo
        db 020h,053h,050h,041h,043h,045h,020h,00h
str_HIGHMemoryBlock:                            ; string "HIGH memory block"; used by MemViewerBlockInfo
        db 048h,049h,047h,048h,020h,06Dh,065h,06Dh,06Fh,072h,079h,020h,062h,06Ch,06Fh,063h
        db 06Bh,00h,02Eh,033h
str_LOWMemoryBlock:                             ; string "LOW memory block"; used by MemViewerBlockInfo
        db 04Ch,04Fh,057h,020h,06Dh,065h,06Dh,06Fh,072h,079h,020h,062h,06Ch,06Fh,063h,06Bh
        db 00h,078h,020h,025h
str_ConventionalMemory:                         ; string "Conventional memory"; used by MemViewerBlockInfo
        db 043h,06Fh,06Eh,076h,065h,06Eh,074h,069h,06Fh,06Eh,061h,06Ch,020h,06Dh,065h,06Dh
        db 06Fh,072h,079h,00h
str_RelocatableBlock:                           ; string "Relocatable block"; used by MemViewerBlockInfo
        db 052h,065h,06Ch,06Fh,063h,061h,074h,061h,062h,06Ch,065h,020h,062h,06Ch,06Fh,063h
        db 06Bh,00h,064h,020h
str_NonRelocatableBlock:                        ; string "Non-Relocatable block"; used by MemViewerBlockInfo
        db 04Eh,06Fh,06Eh,02Dh,052h,065h,06Ch,06Fh,063h,061h,074h,061h,062h,06Ch,065h,020h
        db 062h,06Ch,06Fh,063h,06Bh,00h,04Dh,020h
str_ALIGNFlagIsSet:                             ; string "ALIGN flag is set"; used by MemViewerBlockInfo
        db 041h,04Ch,049h,047h,04Eh,020h,066h,06Ch,061h,067h,020h,069h,073h,020h,073h,065h
        db 074h,00h,020h,028h
str_PRIORITY1d:                                 ; string "PRIORITY #%1d"; used by MemViewerBlockInfo
        db 050h,052h,049h,04Fh,052h,049h,054h,059h,020h,023h,025h,031h,064h,00h,020h,030h
str_SequenceD:                                  ; string "Sequence #%d"; used by MemViewerBlockInfo
        db 053h,065h,071h,075h,065h,06Eh,063h,065h,020h,023h,025h,064h,00h,053h,059h,053h
str_BlockIsPURGABLE:                            ; string "Block is PURGABLE"; used by MemViewerBlockInfo
        db 042h,06Ch,06Fh,063h,06Bh,020h,069h,073h,020h,050h,055h,052h,047h,041h,042h,04Ch
        db 045h,00h,00h,00h
str_04x2:                                       ; string "%04x "; used by HexDumpRow
        db 025h,030h,034h,078h,020h,020h,020h,00h
str_02x:                                        ; string "%02x"; used by HexDumpRow
        db 025h,030h,032h,078h,00h,06Dh,065h,06Dh
str_Punct_HexDumpRow:                           ; string "*"; used by HexDumpRow
        db 02Ah,00h,079h,020h
str_SpaceHex:                                   ; space before a hex byte; used by HexDumpRow
        db 020h,00h,06Fh,063h
str_FourSpacesHex:                              ; four spaces in a hex dump; used by HexDumpRow
        db 020h,020h,020h,020h,00h,04Fh,057h,020h
str_FILES2:                                     ; string "* FILE: %s "; used by DumpShapesList, WriteMemMap
        db 02Ah,020h,046h,049h,04Ch,045h,03Ah,020h,025h,073h,0Ah,00h
str_DATES2:                                     ; string "* DATE: %s "; used by DumpShapesList, WriteMemMap
        db 02Ah,020h,044h,041h,054h,045h,03Ah,020h,025h,073h,0Ah,00h
str_TIMES3:                                     ; string "* TIME: %s "; used by DumpShapesList, WriteMemMap
        db 02Ah,020h,054h,049h,04Dh,045h,03Ah,020h,025h,073h,0Ah,00h
str_N_WriteMemMap:                              ; string "N"; used by WriteMemMap
        db 04Eh,00h,06Ch,06Fh
str_FF:                                         ; string "FF"; used by WriteMemMap
        db 046h,046h,00h,061h
str_HexmemdspOS:                                ; string "hexmemdsp = O%s "; used by WriteMemMap
        db 068h,065h,078h,06Dh,065h,06Dh,064h,073h,070h,020h,03Dh,020h,04Fh,025h,073h,0Ah
        db 0Ah,00h,06Ch,06Fh
str_XxMMAPTXT:                                  ; string "xxMMAP??.TXT"; used by DumpMemoryMap
        db 078h,078h,04Dh,04Dh,041h,050h,03Fh,03Fh,02Eh,054h,058h,054h,00h,00h,04Dh,020h
str_W_DumpMemoryMap:                            ; string "w"; used by DumpMemoryMap, DumpShapesList
        db 077h,00h,049h,047h
str_ErrorDumpingMemoryMap:                      ; string "Error Dumping Memory Map"; used by DumpMemoryMap
        db 045h,072h,072h,06Fh,072h,020h,044h,075h,06Dh,070h,069h,06Eh,067h,020h,04Dh,065h
        db 06Dh,06Fh,072h,079h,020h,04Dh,061h,070h,00h,023h,025h,031h
str_ShapeFileIsInvalid:                         ; string "Shape file is invalid. Work with it?"; used by
                                                ; ShapeViewer
        db 053h,068h,061h,070h,065h,020h,066h,069h,06Ch,065h,020h,069h,073h,020h,069h,06Eh
        db 076h,061h,06Ch,069h,064h,02Eh,020h,020h,057h,06Fh,072h,06Bh,020h,077h,069h,074h
        db 068h,020h,069h,074h,03Fh,00h,030h,032h
str_NumDPackedD:                                ; string "Num = %d, # packed = %d, # not packed = %d, # no
                                                ; shows = %d "; used by ShapeViewer
        db 04Eh,075h,06Dh,020h,03Dh,020h,025h,064h,02Ch,020h,023h,020h,070h,061h,063h,06Bh
        db 065h,064h,020h,03Dh,020h,025h,064h,02Ch,020h,023h,020h,06Eh,06Fh,074h,020h,070h
        db 061h,063h,06Bh,065h,064h,020h,03Dh,020h,025h,064h,02Ch,020h,023h,020h,06Eh,06Fh
        db 020h,073h,068h,06Fh,077h,073h,020h,03Dh,020h,025h,064h,0Ah,00h,046h,046h,00h
str_ThereAreNoShapes:                           ; string "There are no shapes that can be shown!"; used by
                                                ; ShapeViewer
        db 054h,068h,065h,072h,065h,020h,061h,072h,065h,020h,06Eh,06Fh,020h,073h,068h,061h
        db 070h,065h,073h,020h,074h,068h,061h,074h,020h,063h,061h,06Eh,020h,062h,065h,020h
        db 073h,068h,06Fh,077h,06Eh,021h,00h,049h
str_44s05x:                                     ; string "'%4.4s' %05x: "; used by ShapeViewer
        db 027h,025h,034h,02Eh,034h,073h,027h,020h,025h,030h,035h,078h,03Ah,020h,00h,04Dh
str_Bad:                                        ; string "Bad. "; used by ShapeViewer
        db 042h,061h,064h,02Eh,0Ah,00h,04Dh,061h
str_CxCy3d3d:                                   ; string "cx/cy = %3d/%3d - "; used by ShapeViewer
        db 063h,078h,02Fh,063h,079h,020h,03Dh,020h,025h,033h,064h,02Fh,025h,033h,064h,020h
        db 02Dh,020h,00h,069h
str_NotDrawn:                                   ; string "Not drawn. "; used by ShapeViewer
        db 04Eh,06Fh,074h,020h,064h,072h,061h,077h,06Eh,02Eh,0Ah,00h
str_Bytes3dRows3d:                              ; string "bytes = %3d, rows = %3d, x/y = %3d/%3d, cx/cy =
                                                ; %3d/%3d"; used by ShapeInfo
        db 062h,079h,074h,065h,073h,020h,03Dh,020h,025h,033h,064h,02Ch,020h,072h,06Fh,077h
        db 073h,020h,03Dh,020h,025h,033h,064h,02Ch,020h,078h,02Fh,079h,020h,03Dh,020h,025h
        db 033h,064h,02Fh,025h,033h,064h,02Ch,020h,063h,078h,02Fh,063h,079h,020h,03Dh,020h
        db 025h,033h,064h,02Fh,025h,033h,064h,00h
str_Un:                                         ; string "un"; used by DumpShapesList, ShapeInfo
        db 075h,06Eh,00h,061h
str_Spacked:                                    ; string " %spacked "; used by DumpShapesList, ShapeInfo
        db 020h,025h,073h,070h,061h,063h,06Bh,065h,064h,0Ah,00h,023h
str_Packed:                                     ; string "packed "; used by ShapeInfo
        db 070h,061h,063h,06Bh,065h,064h,020h,020h,00h,020h,03Dh,020h
str_Unpacked_ShapeInfo:                         ; string "unpacked"; used by ShapeInfo
        db 075h,06Eh,070h,061h,063h,06Bh,065h,064h,00h,065h,072h,065h
str_3d3d3d3dS:                                  ; string "%3d/%3d, %3d/%3d, %s"; used by ShapeInfo
        db 025h,033h,064h,02Fh,025h,033h,064h,02Ch,020h,025h,033h,064h,02Fh,025h,033h,064h
        db 02Ch,020h,025h,073h,00h,061h,06Eh,020h
str_Type02xNext05x:                             ; string "type %02x, next %05x"; used by ShapeInfo
        db 074h,079h,070h,065h,020h,025h,030h,032h,078h,02Ch,020h,06Eh,065h,078h,074h,020h
        db 025h,030h,035h,078h,00h,035h,078h,03Ah
str_ShapeIsInvalidDraw:                         ; string "Shape is invalid. Draw it anyways?"; used by
                                                ; ShapeInfo
        db 053h,068h,061h,070h,065h,020h,069h,073h,020h,069h,06Eh,076h,061h,06Ch,069h,064h
        db 02Eh,020h,020h,044h,072h,061h,077h,020h,069h,074h,020h,061h,06Eh,079h,077h,061h
        db 079h,073h,03Fh,00h
str_MEMSHPTXT:                                  ; string "MEMSHP??.TXT"; used by DumpShapesList
        db 04Dh,045h,04Dh,053h,048h,050h,03Fh,03Fh,02Eh,054h,058h,054h,00h,00h,00h,00h
str_ErrorDumpingShapesList:                     ; string "Error Dumping Shapes List"; used by DumpShapesList
        db 045h,072h,072h,06Fh,072h,020h,044h,075h,06Dh,070h,069h,06Eh,067h,020h,053h,068h
        db 061h,070h,065h,073h,020h,04Ch,069h,073h,074h,00h,02Fh,063h
str_ShapeFileName0:                             ; string "Shape file name: %0.12s "; used by DumpShapesList
        db 053h,068h,061h,070h,065h,020h,066h,069h,06Ch,065h,020h,06Eh,061h,06Dh,065h,03Ah
        db 020h,025h,030h,02Eh,031h,032h,073h,0Ah,00h,0Ah,00h,023h
str_ShapeFileSizeLd:                            ; string "Shape file size: %ld "; used by DumpShapesList
        db 053h,068h,061h,070h,065h,020h,066h,069h,06Ch,065h,020h,073h,069h,07Ah,065h,03Ah
        db 020h,025h,06Ch,064h,0Ah,00h,072h,065h
str_NumberOfShapesD:                            ; string "Number of shapes: %d "; used by DumpShapesList
        db 04Eh,075h,06Dh,062h,065h,072h,020h,06Fh,066h,020h,073h,068h,061h,070h,065h,073h
        db 03Ah,020h,025h,064h,0Ah,0Ah,00h,020h
str_44s66ld:                                    ; string "'%-4.4s' @ %6.6ld, "; used by DumpShapesList
        db 027h,025h,02Dh,034h,02Eh,034h,073h,027h,020h,040h,020h,025h,036h,02Eh,036h,06Ch
        db 064h,02Ch,020h,00h
str_Bytes3dRows3d2:                             ; string "bytes = %3d, rows = %3d, "; used by DumpShapesList
        db 062h,079h,074h,065h,073h,020h,03Dh,020h,025h,033h,064h,02Ch,020h,072h,06Fh,077h
        db 073h,020h,03Dh,020h,025h,033h,064h,02Ch,020h,00h,077h,020h
str_XY3d3d:                                     ; string "x/y = %3d/%3d, cx/cy = %3d/%3d"; used by
                                                ; DumpShapesList
        db 078h,02Fh,079h,020h,03Dh,020h,025h,033h,064h,02Fh,025h,033h,064h,02Ch,020h,063h
        db 078h,02Fh,063h,079h,020h,03Dh,020h,025h,033h,064h,02Fh,025h,033h,064h,00h,072h
str_Punct_DumpShapesList:                       ; string "\n"; used by DumpShapesList
        db 0Ah,00h,020h,044h
str_033d022X:                                   ; string "%03.3d (%02.2X)"; used by PaletteViewer
        db 025h,030h,033h,02Eh,033h,064h,020h,028h,025h,030h,032h,02Eh,032h,058h,029h,00h
str_R022d:                                      ; string "R=%02.2d"; used by PaletteViewer
        db 052h,03Dh,025h,030h,032h,02Eh,032h,064h,00h,065h,020h,066h
str_G022d:                                      ; string "G=%02.2d"; used by PaletteViewer
        db 047h,03Dh,025h,030h,032h,02Eh,032h,064h,00h,020h,025h,030h
str_B022d:                                      ; string "B=%02.2d"; used by PaletteViewer
        db 042h,03Dh,025h,030h,032h,02Eh,032h,064h,00h,053h,068h,061h
str_02d_PaletteViewerLabel:                     ; string "%02d"; used by PaletteViewerLabel
        db 025h,030h,032h,064h,00h,06Ch,065h,020h
str_SCREEN2:                                    ; string "SCREEN??.*"; used by SaveScreenshot
        db 053h,043h,052h,045h,045h,04Eh,03Fh,03Fh,02Eh,02Ah,00h,072h
str_Tga:                                        ; string ".tga"; used by SaveScreenshot
        db 02Eh,074h,067h,061h,00h,065h,072h,020h
str_02d3s02d_FormatDateTime:                    ; string "%02d-%3s-%02d"; used by FormatDateTime
        db 025h,030h,032h,064h,02Dh,025h,033h,073h,02Dh,025h,030h,032h,064h,00h,0Ah,00h
str_2d02d02d:                                   ; string '%2d:%02d:%02d'; used by FormatDateTime
        db 025h,032h,064h,03Ah,025h,030h,032h,064h,03Ah,025h,030h,032h,064h,00h,00h,00h
