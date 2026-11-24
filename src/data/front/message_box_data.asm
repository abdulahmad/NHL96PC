; Initialised data of front/message_box (src/front/message_box).
bits 32
%include "hockey.inc"
section s_1150C4 progbits alloc noexec write align=1
global MessageShown, ProgressBoxBmp, ProgressBoxTotal, ProgressBoxStep
MessageShown:                                   ; message box is shown; used by HideMessage, ShowMessage
        db 00h,00h,00h,00h
ProgressBoxBmp:                                 ; progress box bitmap; used by HideProgressBox,
                                                ; ShowProgressBox, UpdateProgressBox
        db 00h,00h,00h,00h
ProgressBoxTotal:                               ; progress box total; used by ShowProgressBox,
                                                ; UpdateProgressBox
        db 01h,00h,00h,00h
ProgressBoxStep:                                ; progress box step; used by ShowProgressBox,
                                                ; UpdateProgressBox
        db 00h,00h,00h,00h
