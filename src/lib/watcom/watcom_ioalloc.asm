; Watcom C runtime: __ioalloc_, __qread_, fgetc_, __filbuf_, __fill_buffer_ and 5 more.
bits 32
%include "hockey.inc"
section s_C3727 progbits alloc exec nowrite align=1
extern __chktty_, __flushall_, __HeapFlags, __set_errno_, __set_errno_dos_, _nmalloc_, AtexitTable, ExitHook
extern FpuExitHook, getche_, Int23Hook, SpeechBankCount, start_28F
global __ioalloc_, __qread_, fgetc_, __filbuf_, __fill_buffer_, _Full_at_exit_rtn_, atexit_, __null_int23_exit_
global exit_, _exit_
;-----------------------------------------------------------------------------
; __ioalloc_                                                    C3727  library
; Run-time library: allocates a stream's buffer
;-----------------------------------------------------------------------------
__ioalloc_:
        push ecx
        push edx
        mov edx, eax
        call __chktty_
        cmp dword [byte edx+014h], byte 0
        jne short .3
        mov ah, byte [byte edx+0Dh]
        test ah, 2
        je short .1
        mov dword [byte edx+014h], 86h
        jmp short .3
.1:
        test ah, 4
        je short .2
        mov dword [byte edx+014h], 1
        jmp short .3
.2:
        mov dword [byte edx+014h], 1000h
.3:
        mov eax, dword [byte edx+014h]
        call _nmalloc_
        mov dword [byte edx+08h], eax
        test eax, eax
        jne short .4
        lea eax, [byte edx+018h]
        mov cl, byte [byte edx+0Dh]
        mov dword [byte edx+014h], 1
        and cl, 0F8h
        mov dword [byte edx+08h], eax
        mov ch, cl
        mov byte [byte edx+0Dh], cl
        or ch, 4
        mov byte [byte edx+0Dh], ch
        jmp short .5
.4:
        or byte [byte edx+0Ch], 8
.5:
        mov eax, dword [byte edx+08h]
        mov dword [byte edx+04h], 0
        mov dword [edx], eax
        pop edx
        pop ecx
        ret
;-----------------------------------------------------------------------------
; __qread_                                                      C379E  library
; Run-time library: reads from a file handle
;-----------------------------------------------------------------------------
__qread_:
        push ecx
        mov ecx, ebx
        mov ebx, eax
        mov ah, 3Fh
        int 21h
        rcl eax, 1
        ror eax, 1
        mov edx, eax
        test eax, eax
        jge short .1
        and eax, 0FFFFh
        call __set_errno_dos_
.1:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; fgetc_                                                        C37BD  library
; Run-time library fgetc: reads a character from a stream
;-----------------------------------------------------------------------------
fgetc_:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        test byte [byte eax+0Ch], 1
        jne short .1
        mov eax, 4
        call __set_errno_
        mov bl, byte [byte edx+0Ch]
        or bl, 20h
        mov eax, 0FFFFFFFFh
        mov byte [byte edx+0Ch], bl
        jmp short .3
.1:
        mov ebx, dword [byte edx+04h]
        dec ebx
        mov dword [byte edx+04h], ebx
        test ebx, ebx
        jge short .2
        mov eax, edx
        call __filbuf_
        jmp short .3
.2:
        mov ebx, dword [edx]
        mov al, byte [ebx]
        inc ebx
        and eax, 0FFh
        mov dword [edx], ebx
.3:
        test byte [byte edx+0Ch], 40h
        jne short .6
        cmp eax, byte 0Dh
        jne short .5
        mov esi, dword [byte edx+04h]
        dec esi
        mov dword [byte edx+04h], esi
        test esi, esi
        jge short .4
        mov eax, edx
        call __filbuf_
        jmp short .5
.4:
        mov ebx, dword [edx]
        mov al, byte [ebx]
        inc ebx
        and eax, 0FFh
        mov dword [edx], ebx
.5:
        cmp eax, byte 1Ah
        jne short .6
        mov cl, byte [byte edx+0Ch]
        or cl, 10h
        mov eax, 0FFFFFFFFh
        mov byte [byte edx+0Ch], cl
.6:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __filbuf_                                                     C3846  library
; Run-time library: fills a stream's buffer and returns its first character
;-----------------------------------------------------------------------------
__filbuf_:
        push ebx
        push ecx
        push edx
        mov edx, eax
        call __fill_buffer_
        test eax, eax
        jne short .1
        mov eax, 0FFFFFFFFh
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword [byte edx+04h]
        mov ecx, dword [edx]
        dec ebx
        inc ecx
        mov dword [byte edx+04h], ebx
        mov dword [edx], ecx
        mov al, byte [byte ecx-01h]
        and eax, 0FFh
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __fill_buffer_                                                C3875  library
; Run-time library: reads the next block into a stream's buffer
;-----------------------------------------------------------------------------
__fill_buffer_:
        push ebx
        push ecx
        push edx
        push esi
        mov ecx, eax
        cmp dword [byte eax+08h], byte 0
        jne short .1
        call __ioalloc_
.1:
        mov ah, byte [byte ecx+0Dh]
        test ah, 20h
        je short .2
        test ah, 6
        je short .2
        mov eax, 2000h
        call __flushall_
.2:
        mov edx, dword [byte ecx+0Ch]
        mov bl, byte [byte ecx+0Ch]
        mov eax, dword [byte ecx+08h]
        and bl, 0FBh
        mov dword [ecx], eax
        and edx, 2400h
        mov byte [byte ecx+0Ch], bl
        cmp edx, 2400h
        jne short .3
        mov ebx, dword [byte ecx+010h]
        test ebx, ebx
        jne short .3
        mov dword [byte ecx+04h], ebx
        call getche_
        cmp eax, byte 0FFFFFFFFh
        je short .6
        mov ebx, dword [ecx]
        mov byte [ebx], al
        mov dword [byte ecx+04h], 1
        jmp short .6
.3:
        test byte [byte ecx+0Dh], 4
        je short .4
        mov ebx, 1
        jmp short .5
.4:
        mov ebx, dword [byte ecx+014h]
.5:
        mov edx, dword [ecx]
        mov eax, dword [byte ecx+010h]
        call __qread_
        mov dword [byte ecx+04h], eax
.6:
        mov esi, dword [byte ecx+04h]
        test esi, esi
        jg short .8
        jne short .7
        or byte [byte ecx+0Ch], 10h
        jmp short .8
.7:
        mov al, byte [byte ecx+0Ch]
        mov dword [byte ecx+04h], 0
        or al, 20h
        mov byte [byte ecx+0Ch], al
.8:
        mov eax, dword [byte ecx+04h]
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; _Full_at_exit_rtn_                                            C3920  library
; Run-time library: runs the atexit routines
;-----------------------------------------------------------------------------
_Full_at_exit_rtn_:
        push ebx
        push edx
        sub esp, byte 4
        mov edx, 20h
        mov ebx, dword [SpeechBankCount]
        mov dword [SpeechBankCount], edx
        mov edx, ebx
        shl edx, 2
.1:
        test edx, edx
        je short .2
        mov eax, dword [dword edx+__HeapFlags]
        sub edx, byte 4
        mov dword [esp], eax
        dec ebx
        call dword [esp]
        jmp short .1
.2:
        add esp, byte 4
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; atexit_                                                       C3957  library
; Run-time library atexit: registers an exit routine
;-----------------------------------------------------------------------------
atexit_:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov edx, _Full_at_exit_rtn_
        mov ecx, dword [SpeechBankCount]
        mov dword [ExitHook], edx
        cmp ecx, byte 20h
        jge short .1
        mov eax, ecx
        lea edx, [byte ecx+01h]
        mov dword [nosplit ecx*4+AtexitTable], ebx
        mov dword [SpeechBankCount], edx
        xor eax, ecx
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov eax, 0FFFFFFFFh
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __null_int23_exit_                                            C3993  library
; Run-time library: empty Ctrl+C exit hook
;-----------------------------------------------------------------------------
__null_int23_exit_:
        ret
;-----------------------------------------------------------------------------
; exit_                                                         C3994  library
; Run-time library exit: runs the exit routines and ends the program
;-----------------------------------------------------------------------------
exit_:
        push edx
        mov edx, eax
        call dword [ExitHook]
        call dword [Int23Hook]
        mov eax, edx
        call _exit_
        pop edx
        ret
;-----------------------------------------------------------------------------
; _exit_                                                        C39AC  library
; Run-time library _exit: ends the program at once
;-----------------------------------------------------------------------------
_exit_:
        push edx
        mov edx, eax
        call dword [Int23Hook]
        call dword [FpuExitHook]
        mov eax, edx
        jmp near start_28F
