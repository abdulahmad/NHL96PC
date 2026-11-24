; BSS of front/message_box (src/front/message_box).
bits 32
%include "hockey.inc"
section s_152B3C nobits alloc noexec write align=1
global MsgTextBuf, dlgtextfg, ProgressBoxState
MsgTextBuf:                                     ; message box text buffer; used by EditText, MessageBox,
                                                ; ShowMessage ...
        resb 255
        resb 1
dlgtextfg:                                      ; message box text colour; used by DrawBoxButton, MessageBox
        resb 4
ProgressBoxState:                               ; progress box state; used by ShowProgressBox,
                                                ; UpdateProgressBox
        resb 1
        resb 1
        resb 2
