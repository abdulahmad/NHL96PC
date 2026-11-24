; BSS of front/lang_text (src/front/lang_text).
bits 32
%include "hockey.inc"
section s_17D694 nobits alloc noexec write align=1
global LangBlockState, LangBlockText, LangBlockPtrs, LangBlockLastId, LangBlockIds, LangFileHandle
LangBlockState:                                 ; state of each language text block; used by GetLangText
        resb 12
LangBlockText:                                  ; language text for the current block; used by LoadLangText
        resb 4
LangBlockPtrs:                                  ; pointers to the language text blocks; used by GetLangText,
                                                ; LoadLangBlock
        resb 12
LangBlockLastId:                                ; last id loaded into each language block; used by
                                                ; LoadLangText
        resb 4
LangBlockIds:                                   ; id of each language text block; used by GetLangText,
                                                ; LoadLangBlock
        resb 16
LangFileHandle:                                 ; language text file handle; used by LoadLangBlock,
                                                ; LoadLangText
        resb 4
