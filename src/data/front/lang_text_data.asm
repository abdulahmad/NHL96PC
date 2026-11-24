; Initialised data of front/lang_text (src/front/lang_text).
bits 32
%include "hockey.inc"
section s_11E2C0 progbits alloc noexec write align=1
global LangTextHandle, LangTextLoaded, str_LFERROR
LangTextHandle:                                 ; language text data handle; used by FreeLangText,
                                                ; GetLangText, LoadLangText
        db 00h,00h,00h,00h
LangTextLoaded:                                 ; set once language text is loaded; used by FreeLangText,
                                                ; LoadLangText
        db 00h,00h,00h,00h
str_LFERROR:                                    ; string 'LFERROR!!!'; used by GetLangText
        db 04Ch,046h,045h,052h,052h,04Fh,052h,021h,021h,021h,00h,00h
