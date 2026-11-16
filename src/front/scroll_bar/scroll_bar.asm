; The scroll bar widget of the front-end lists (96 PC).
bits 32
%include "hockey.inc"
section s_7CCB8 progbits alloc exec nowrite align=1
extern __CHP, dword_1122F8, dword_1122FC, dword_112300, dword_112304, dword_11D1A8, dword_11D1AC, PutBlock
extern SetDrawBitmap, CalendarScreen_13D3, CalendarScreen_13E4, CalendarScreen_153A, CalendarScreen_1AC2, CalendarScreen_1B49, CalendarScreen_1B6C, sub_AAA40
extern sub_AAADC, sub_AD35C, sub_ADBEC, sub_B2C70, SetScreenTarget
global InitVScrollBar, InitVScrollBar_217, InitHScrollBar, InitHScrollBar_207, InitHScrollBar_337, ScrollBarRet, ScrollBarUp, ScrollBarDown
global ScrollBarPageUp, ScrollBarPageUp_B, ScrollBarPageUp_14, ScrollBarPageUp_19, ScrollBarPageDown, FreeScrollBar, SetScrollBarPos, DrawScrollBar
global ScrollBarToMouse, unk_7D4F4, unk_7D500, jpt_7D568
;-----------------------------------------------------------------------------
; InitVScrollBar                               7CCB8  96 PC, medium confidence
; (bar, ...): a vertical scroll bar (type 1) for a list area
;-----------------------------------------------------------------------------
InitVScrollBar:
        push esi
        push edi
        enter 14h, 0
        mov edi, dword [byte ebp+018h]
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], ebx
        mov dword [byte ebp-04h], ecx
        mov dword [eax], 1
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+04h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [byte esi+0Ch], edx
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+08h], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [byte esi+010h], edx
        push byte 20h
        movsx eax, word [byte edi+06h]
        push eax
        movsx eax, word [byte edi+04h]
        push eax
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte esi+014h], eax
        push byte 20h
        movsx eax, word [byte edi+06h]
        push eax
        movsx eax, word [byte edi+04h]
        push eax
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte esi+018h], eax
        mov eax, dword [byte ebp+01Ch]
        push dword [byte esi+018h]
        mov dword [dword esi+0134h], eax
        call SetDrawBitmap
        movsx eax, word [byte edi+0Eh]
        add esp, byte 4
        neg eax
        push eax
        movsx eax, word [byte edi+0Ch]
        neg eax
        push eax
        push dword [byte ebp+014h]
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        push edi
        call sub_AAA40
        add esp, byte 0Ch
        call SetScreenTarget
        movsx eax, word [byte edi+06h]
        sub eax, byte 3Ch
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-08h]
        sub eax, dword [byte ebp-04h]
        mov dword [byte ebp-010h], eax
        fild dword [byte ebp-014h]
        fild dword [byte ebp-010h]
        fdivp
        fstp dword [byte esi+01Ch]
        fldz
        fcomp dword [byte esi+01Ch]
        fnstsw ax
        sahf
        jbe short .1
        mov dword [byte esi+01Ch], 0
.1:
        cmp dword [byte ebp+010h], byte 0
        je short .2
        fild dword [byte ebp-04h]
        fmul dword [byte esi+01Ch]
        jmp short .3
.2:
        fld dword [byte esi+01Ch]
.3:
        fmul dword [dword_1122F8]
        fld1
        faddp
        fstp dword [byte esi+020h]
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-04h]
        jne short .4
        mov dword [byte esi+01Ch], 0
        mov eax, dword [byte esi+01Ch]
        mov dword [byte esi+020h], eax
.4:
        mov eax, dword [byte ebp-08h]
        mov dword [byte esi+024h], 0
        mov dword [byte esi+028h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte esi+02Ch], eax
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte esi+030h], eax
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+034h], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+038h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [byte esi+03Ch], edx
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+040h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [byte esi+044h], edx
        movsx eax, word [byte edi+0Eh]
        add eax, byte 1Eh
        mov dword [byte esi+048h], eax
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+04Ch], eax
        movsx eax, word [byte edi+0Eh]
        add eax, byte 1Eh
        mov dword [byte esi+050h], eax
        movsx eax, word [byte edi+0Ch]
        mov dword [dword esi+0F4h], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add eax, edx
        sub eax, byte 1Eh
        mov dword [dword esi+0F8h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [dword esi+0FCh], edx
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add eax, edx
        sub eax, byte 1Eh
        mov dword [dword esi+0100h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [dword esi+0104h], edx
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [dword esi+0108h], edx
        movsx eax, word [byte edi+0Ch]
        mov dword [dword esi+010Ch], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [dword esi+0110h], edx
        lea edx, [byte esi+034h]
        xor edi, edi
        mov eax, edx
        lea ebx, [dword edx+0100h]
.5:
        mov edx, dword [byte esi+030h]
        mov dword [byte edx+edi+010h], 4
        mov edx, dword [byte esi+030h]
        mov dword [byte edx+edi+014h], eax
        add eax, byte 40h
        add edi, byte 66h
        cmp eax, ebx
        jne short .5
InitVScrollBar_217:
        mov eax, dword [byte esi+030h]
        and byte [byte eax+046h], 0FEh
        mov eax, dword [byte esi+030h]
        or byte [dword eax+0ACh], 1
        mov eax, dword [byte esi+030h]
        or byte [dword eax+0112h], 1
        mov eax, dword [byte esi+030h]
        and byte [dword eax+0178h], 0FEh
        mov edx, dword [byte esi+034h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [byte eax+03Ah], edx
        mov edx, dword [byte esi+038h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [byte eax+03Eh], edx
        mov edx, dword [byte esi+034h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+0A0h], edx
        mov edx, dword [byte esi+038h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+0A4h], edx
        mov edx, dword [dword esi+0F4h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+0106h], edx
        mov edx, dword [dword esi+0F8h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+010Ah], edx
        mov edx, dword [dword esi+0F4h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+016Ch], edx
        mov edx, dword [dword esi+0F8h]
        mov eax, dword [byte esi+030h]
        add edx, byte 5
        mov dword [dword eax+0170h], edx
        leave
        pop edi
        pop esi
        ret 10h
;-----------------------------------------------------------------------------
; InitHScrollBar                               7CF78  96 PC, medium confidence
; (bar, ...): a horizontal scroll bar (type 0)
;-----------------------------------------------------------------------------
InitHScrollBar:
        push esi
        push edi
        enter 14h, 0
        mov edi, dword [byte ebp+018h]
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], ebx
        mov dword [byte ebp-04h], ecx
        mov dword [eax], 0
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+04h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [byte esi+0Ch], edx
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+08h], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [byte esi+010h], edx
        push byte 20h
        movsx eax, word [byte edi+06h]
        push eax
        movsx eax, word [byte edi+04h]
        push eax
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte esi+014h], eax
        push byte 20h
        movsx eax, word [byte edi+06h]
        push eax
        movsx eax, word [byte edi+04h]
        push eax
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte esi+018h], eax
        mov eax, dword [byte ebp+01Ch]
        push dword [byte esi+018h]
        mov dword [dword esi+0134h], eax
        call SetDrawBitmap
        movsx eax, word [byte edi+0Eh]
        add esp, byte 4
        neg eax
        push eax
        movsx eax, word [byte edi+0Ch]
        neg eax
        push eax
        push dword [byte ebp+014h]
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        push edi
        call sub_AAA40
        add esp, byte 0Ch
        call SetScreenTarget
        movsx eax, word [byte edi+04h]
        sub eax, byte 3Ch
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-08h]
        sub eax, dword [byte ebp-04h]
        mov dword [byte ebp-010h], eax
        fild dword [byte ebp-014h]
        fild dword [byte ebp-010h]
        fdivp
        fstp dword [byte esi+01Ch]
        fldz
        fcomp dword [byte esi+01Ch]
        fnstsw ax
        sahf
        jbe short .1
        mov dword [byte esi+01Ch], 0
.1:
        cmp dword [byte ebp+010h], byte 0
        je short .2
        fild dword [byte ebp-04h]
        fmul dword [byte esi+01Ch]
        jmp short .3
.2:
        fld dword [byte esi+01Ch]
.3:
        fmul dword [dword_1122FC]
        fld1
        faddp
        fstp dword [byte esi+020h]
        mov eax, dword [byte ebp-08h]
        mov dword [byte esi+024h], 0
        mov dword [byte esi+028h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte esi+02Ch], eax
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte esi+030h], eax
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+034h], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+038h], eax
        movsx eax, word [byte edi+0Ch]
        add eax, byte 1Eh
        mov dword [byte esi+03Ch], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [byte esi+040h], eax
        movsx eax, word [byte edi+0Ch]
        add eax, byte 1Eh
        mov dword [byte esi+044h], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [byte esi+048h], edx
        movsx eax, word [byte edi+0Ch]
        mov dword [byte esi+04Ch], eax
        movsx eax, word [byte edi+0Eh]
        movsx edx, word [byte edi+06h]
        add eax, edx
        mov dword [byte esi+050h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add eax, edx
        sub eax, byte 1Eh
        mov dword [dword esi+0F4h], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [dword esi+0F8h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [dword esi+0FCh], edx
        movsx eax, word [byte edi+0Eh]
        mov dword [dword esi+0100h], eax
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add edx, eax
        mov dword [dword esi+0104h], edx
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [dword esi+0108h], edx
        movsx edx, word [byte edi+0Ch]
        movsx eax, word [byte edi+04h]
        add eax, edx
        sub eax, byte 1Eh
        mov dword [dword esi+010Ch], eax
        movsx edx, word [byte edi+0Eh]
        movsx eax, word [byte edi+06h]
        add edx, eax
        mov dword [dword esi+0110h], edx
        lea edx, [byte esi+034h]
        xor edi, edi
        mov eax, edx
        lea ebx, [dword edx+0100h]
.4:
        mov edx, dword [byte esi+030h]
        mov dword [byte edx+edi+010h], 4
        mov edx, dword [byte esi+030h]
        mov dword [byte edx+edi+014h], eax
        add eax, byte 40h
        add edi, byte 66h
        cmp eax, ebx
        jne short .4
        jmp near InitVScrollBar_217
InitHScrollBar_207:
        push byte 0
        mov eax, dword [byte esi+018h]
        push byte 0
        push dword [byte eax+02Ch]
        call sub_B2C70
        fild dword [byte esi+024h]
        fmul dword [byte esi+01Ch]
        add esp, byte 0Ch
        fadd dword [dword_112300]
        push byte 0
        call __CHP
        fistp dword [byte ebp-04h]
        push dword [byte ebp-04h]
        push dword [dword esi+0134h]
        call sub_AAADC
        mov eax, dword [byte esi+04h]
        fild dword [byte esi+024h]
        add eax, byte 1Eh
        fmul dword [byte esi+01Ch]
        mov dword [byte esi+074h], eax
        mov eax, dword [byte esi+08h]
        mov dword [byte esi+078h], eax
        mov eax, dword [byte esi+04h]
        add eax, byte 1Eh
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        mov eax, dword [byte esi+08h]
        faddp
        mov dword [dword esi+080h], eax
        fsub dword [byte esi+020h]
        mov eax, dword [byte esi+04h]
        call __CHP
        add eax, byte 1Eh
        fistp dword [byte esi+07Ch]
        mov dword [byte ebp-04h], eax
        fild dword [byte esi+024h]
        mov eax, dword [byte esi+010h]
        fmul dword [byte esi+01Ch]
        mov dword [dword esi+088h], eax
        mov eax, dword [byte esi+04h]
        add eax, byte 1Eh
        fild dword [byte ebp-04h]
        mov dword [dword esi+08Ch], eax
        faddp
        mov eax, dword [byte esi+010h]
        fsub dword [byte esi+020h]
        mov dword [dword esi+090h], eax
        call __CHP
        fistp dword [dword esi+084h]
        fild dword [byte esi+024h]
        mov eax, dword [byte esi+04h]
        fmul dword [byte esi+01Ch]
        add eax, byte 1Eh
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte esi+08h]
        mov dword [dword esi+0B8h], eax
        fild dword [byte ebp-04h]
        mov eax, dword [byte esi+0Ch]
        faddp
        sub eax, byte 1Eh
        fadd dword [byte esi+020h]
        mov dword [dword esi+0BCh], eax
        call __CHP
        fistp dword [dword esi+0B4h]
        fild dword [byte esi+024h]
        mov eax, dword [byte esi+08h]
        fmul dword [byte esi+01Ch]
        mov dword [dword esi+0C0h], eax
        mov eax, dword [byte esi+0Ch]
        sub eax, byte 1Eh
        mov dword [dword esi+0C4h], eax
        mov eax, dword [byte esi+010h]
        mov dword [dword esi+0C8h], eax
        mov eax, dword [byte esi+04h]
        add eax, byte 1Eh
        mov dword [byte ebp-04h], eax
        add esp, byte 0Ch
        fild dword [byte ebp-04h]
        faddp
        mov eax, dword [byte esi+010h]
        fadd dword [byte esi+020h]
        mov dword [dword esi+0D0h], eax
        call __CHP
        fistp dword [dword esi+0CCh]
InitHScrollBar_337:
        call SetScreenTarget
        push dword [byte esi+08h]
        mov eax, dword [byte esi+014h]
        push dword [byte esi+04h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
;-----------------------------------------------------------------------------
; ScrollBarRet                                    7D2CD  96 PC, low confidence
; Ret
;-----------------------------------------------------------------------------
ScrollBarRet:
        ret
;-----------------------------------------------------------------------------
; ScrollBarUp                                  7D2CE  96 PC, medium confidence
; Position - 1, redraw
;-----------------------------------------------------------------------------
ScrollBarUp:
        cmp dword [byte eax+024h], byte 0
        jle short ScrollBarRet
        dec dword [byte eax+024h]
        jmp near DrawScrollBar
;-----------------------------------------------------------------------------
; ScrollBarDown                                7D2DC  96 PC, medium confidence
; Position + 1 up to count - page, redraw
;-----------------------------------------------------------------------------
ScrollBarDown:
        push edx
        mov edx, dword [byte eax+028h]
        sub edx, dword [byte eax+02Ch]
        cmp edx, dword [byte eax+024h]
        jle short ScrollBarPageUp_19
        inc dword [byte eax+024h]
        jmp short ScrollBarPageUp_14
;-----------------------------------------------------------------------------
; ScrollBarPageUp                              7D2ED  96 PC, medium confidence
; Position - page, redraw
;-----------------------------------------------------------------------------
ScrollBarPageUp:
        push edx
        mov edx, dword [byte eax+02Ch]
        sub dword [byte eax+024h], edx
        cmp dword [byte eax+024h], byte 0
ScrollBarPageUp_B:
        jge short ScrollBarPageUp_14
        mov dword [byte eax+024h], 0
ScrollBarPageUp_14:
        call DrawScrollBar
ScrollBarPageUp_19:
        pop edx
        ret
;-----------------------------------------------------------------------------
; ScrollBarPageDown                            7D308  96 PC, medium confidence
; Position + page, redraw
;-----------------------------------------------------------------------------
ScrollBarPageDown:
        push edx
        mov edx, dword [byte eax+02Ch]
        add dword [byte eax+024h], edx
        mov edx, dword [byte eax+028h]
        sub edx, dword [byte eax+02Ch]
        cmp edx, dword [byte eax+024h]
        jge short .1
        mov dword [byte eax+024h], edx
.1:
        mov edx, dword [byte eax+028h]
        cmp edx, dword [byte eax+02Ch]
        jmp short ScrollBarPageUp_B
;-----------------------------------------------------------------------------
; FreeScrollBar                                7D325  96 PC, medium confidence
; Frees the scroll bar's two bitmaps
;-----------------------------------------------------------------------------
FreeScrollBar:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push dword [byte eax+014h]
        call sub_ADBEC
        add esp, byte 4
        push dword [byte esi+018h]
        call sub_ADBEC
        add esp, byte 4
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetScrollBarPos                              7D346  96 PC, medium confidence
; (bar, pos): sets the position, then DrawScrollBar
;-----------------------------------------------------------------------------
SetScrollBarPos:
        mov dword [byte eax+024h], edx
;-----------------------------------------------------------------------------
; DrawScrollBar                                7D349  96 PC, medium confidence
; Draws the scroll bar and its thumb at the position
;-----------------------------------------------------------------------------
DrawScrollBar:
        push ebx
        push ecx
        push edx
        push esi
        enter 4, 0
        mov esi, eax
        push dword [byte eax+014h]
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [esi], byte 1
        jne near InitHScrollBar_207
        push byte 0
        mov eax, dword [byte esi+018h]
        push byte 0
        push dword [byte eax+02Ch]
        call sub_B2C70
        fild dword [byte esi+024h]
        fmul dword [byte esi+01Ch]
        fadd dword [dword_112300]
        add esp, byte 0Ch
        call __CHP
        fistp dword [byte ebp-04h]
        push dword [byte ebp-04h]
        push byte 0
        push dword [dword esi+0134h]
        call sub_AAADC
        mov eax, dword [byte esi+04h]
        mov dword [byte esi+074h], eax
        fild dword [byte esi+024h]
        fmul dword [byte esi+01Ch]
        mov eax, dword [byte esi+08h]
        add eax, byte 1Eh
        mov dword [byte esi+078h], eax
        mov eax, dword [byte esi+0Ch]
        mov dword [byte esi+07Ch], eax
        mov eax, dword [byte esi+08h]
        add eax, byte 1Eh
        mov dword [dword esi+080h], eax
        mov eax, dword [byte esi+0Ch]
        mov dword [dword esi+084h], eax
        mov eax, dword [byte esi+08h]
        add eax, byte 1Eh
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        mov eax, dword [byte esi+04h]
        faddp
        mov dword [dword esi+08Ch], eax
        fsub dword [byte esi+020h]
        mov eax, dword [byte esi+08h]
        call __CHP
        add eax, byte 1Eh
        fistp dword [dword esi+088h]
        mov dword [byte ebp-04h], eax
        fild dword [byte esi+024h]
        mov eax, dword [byte esi+04h]
        fmul dword [byte esi+01Ch]
        mov dword [dword esi+0B4h], eax
        mov eax, dword [byte esi+08h]
        fild dword [byte ebp-04h]
        add eax, byte 1Eh
        faddp
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte esi+0Ch]
        fsub dword [byte esi+020h]
        mov dword [dword esi+0BCh], eax
        call __CHP
        fistp dword [dword esi+090h]
        fild dword [byte esi+024h]
        mov eax, dword [byte esi+08h]
        fmul dword [byte esi+01Ch]
        add eax, byte 1Eh
        fild dword [byte ebp-04h]
        mov dword [byte ebp-04h], eax
        faddp
        mov eax, dword [byte esi+0Ch]
        fadd dword [byte esi+020h]
        mov dword [dword esi+0C4h], eax
        call __CHP
        fistp dword [dword esi+0B8h]
        mov eax, dword [byte esi+010h]
        fild dword [byte esi+024h]
        sub eax, byte 1Eh
        fmul dword [byte esi+01Ch]
        mov dword [dword esi+0C8h], eax
        fild dword [byte ebp-04h]
        mov eax, dword [byte esi+04h]
        faddp
        mov dword [dword esi+0CCh], eax
        add esp, byte 0Ch
        fadd dword [byte esi+020h]
        mov eax, dword [byte esi+010h]
        call __CHP
        sub eax, byte 1Eh
        fistp dword [dword esi+0C0h]
        mov dword [dword esi+0D0h], eax
        jmp near InitHScrollBar_337
;-----------------------------------------------------------------------------
; ScrollBarToMouse                             7D49C  96 PC, medium confidence
; Moves the thumb to the mouse (dword_11D1A8 / 11D1AC)
;-----------------------------------------------------------------------------
ScrollBarToMouse:
        push edx
        enter 4, 0
        mov edx, eax
        mov eax, dword [byte eax+028h]
        cmp eax, dword [byte edx+02Ch]
        jle short .3
        cmp dword [edx], byte 1
        jne short .1
        mov eax, dword [dword_11D1AC]
        sub eax, byte 1Eh
        sub eax, dword [byte edx+08h]
        jmp short .2
.1:
        mov eax, dword [dword_11D1A8]
        sub eax, byte 1Eh
        sub eax, dword [byte edx+04h]
.2:
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        fld dword [byte edx+01Ch]
        fmul dword [dword_112304]
        faddp
        fdiv dword [byte edx+01Ch]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        mov dword [byte edx+024h], eax
        mov eax, edx
        call DrawScrollBar
.3:
        leave
        pop edx
        ret
unk_7D4F4:
        db 01Fh,01Ch,01Fh,01Eh,01Fh,01Eh,01Fh,01Fh,01Eh,01Fh,01Eh,01Fh
unk_7D500:
        db 0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh
        db 033h,033h,0B3h,03Eh,033h,033h,0B3h,03Eh,0CDh,0CCh,0CCh,03Eh,033h,033h,0B3h,03Eh
        db 033h,033h,0B3h,03Eh,033h,033h,0B3h,03Eh,0CDh,0CCh,0CCh,03Eh,033h,033h,0B3h,03Eh
        db 0CDh,0CCh,0CCh,03Eh,033h,033h,0B3h,03Eh,033h,033h,0B3h,03Eh,0CDh,0CCh,0CCh,03Eh
        db 033h,033h,0B3h,03Eh,0CDh,0CCh,0CCh,03Eh,033h,033h,0B3h,03Eh,0CDh,0CCh,0CCh,03Eh
        db 0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh
        db 0CDh,0CCh,0CCh,03Eh,0CDh,0CCh,0CCh,03Eh
jpt_7D568:
        dd CalendarScreen_13D3
        dd CalendarScreen_13E4
        dd CalendarScreen_153A
        dd CalendarScreen_1AC2
        dd CalendarScreen_1B49
        dd CalendarScreen_1B6C
