; Watcom C runtime: memset_, __InitFiles_, __full_io_exit_, fcloseall_, docloseall_ and 1 more.
bits 32
%include "hockey.inc"
section s_CFEA7 progbits alloc exec nowrite align=1
extern __ClosedStreams, __fatal_runtime_error_, __freefp__39, __iob, __iob_end, __iob_flags, __IOMode_, __nheapbeg
extern __OpenStreams, __set_errno_, __set_errno_dos_, __shutdown_stream_, __STOSB, _nmalloc_, str_NotEnoughMemoryTo
global memset_, __InitFiles_, __full_io_exit_, fcloseall_, docloseall_, __qwrite_
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; memset_                                                       CFEB0  library
; Run-time library memset: fills a block of memory
;-----------------------------------------------------------------------------
memset_:
        push eax
        push ecx
        mov dh, dl
        shl edx, 8
        mov dl, dh
        shl edx, 8
        mov dl, dh
        mov ecx, ebx
        call __STOSB
        pop ecx
        pop eax
        ret
;-----------------------------------------------------------------------------
; __InitFiles_                                                  CFEC8  library
; Run-time library: sets up the standard streams
;-----------------------------------------------------------------------------
__InitFiles_:
        push ebx
        push ecx
        push edx
        mov ah, byte [__iob_flags]
        and ah, 0F8h
        mov dl, ah
        mov byte [__iob_flags], ah
        or dl, 4
        mov ecx, __iob
        mov byte [__iob_flags], dl
        jmp short .3
.1:
        mov eax, 8
        call _nmalloc_
        mov ebx, eax
        test eax, eax
        jne short .2
        mov eax, 8
        call _nmalloc_
        mov ebx, eax
        test eax, eax
        jne short .2
        mov eax, str_NotEnoughMemoryTo
        mov edx, 1
        call __fatal_runtime_error_
.2:
        mov edx, dword [__ClosedStreams]
        mov dword [byte ebx+04h], ecx
        mov dword [__ClosedStreams], ebx
        add ecx, byte 1Ah
        mov dword [ebx], edx
.3:
        mov edx, dword [byte ecx+0Ch]
        test edx, edx
        jne short .1
        mov dword [__OpenStreams], edx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __full_io_exit_                                               CFF40  library
; Run-time library: closes all streams at exit
;-----------------------------------------------------------------------------
__full_io_exit_:
        xor eax, eax
        call docloseall_
        jmp near __freefp__39
;-----------------------------------------------------------------------------
; fcloseall_                                                    CFF4C  library
; Run-time library fcloseall: closes every stream but the standard ones
;-----------------------------------------------------------------------------
fcloseall_:
        mov eax, 5
;-----------------------------------------------------------------------------
; docloseall_                                                   CFF51  library
;-----------------------------------------------------------------------------
docloseall_:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        shl eax, 2
        sub eax, edx
        shl eax, 2
        add eax, edx
        mov esi, __iob
        add eax, eax
        xor ebx, ebx
        add esi, eax
        mov eax, dword [__ClosedStreams]
        jmp short .4
.1:
        mov ecx, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, 1
        test byte [byte eax+0Dh], 40h
        jne short .2
        cmp eax, esi
        jb short .3
        cmp eax, __iob_end
        jae short .2
        xor edx, edx
.2:
        call __shutdown_stream_
        inc ebx
.3:
        mov eax, ecx
.4:
        test eax, eax
        jne short .1
        mov eax, ebx
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __qwrite_                                                     CFFA3  library
; Run-time library: writes to a file handle
;-----------------------------------------------------------------------------
__qwrite_:
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov esi, eax
        mov dword [esp], edx
        mov ebp, ebx
        call __IOMode_
        test al, 80h
        je short .2
        mov al, 2
        mov ebx, esi
        xor edx, edx
        mov ah, 42h
        mov ecx, edx
        shr ecx, 10h
        int 21h
        rcl dx, 1
        ror dx, 1
        shl edx, 10h
        mov dx, ax
        mov edi, edx
        test edx, edx
        jge short .2
        xor eax, eax
        mov ax, dx
.1:
        call __set_errno_dos_
        jmp short .5
.2:
        mov edx, dword [esp]
        mov ebx, esi
        mov ecx, ebp
        mov ah, 40h
        int 21h
        rcl eax, 1
        ror eax, 1
        mov esi, eax
        mov edi, eax
        mov edx, eax
        test eax, eax
        jge short .3
        xor eax, eax
        mov ax, si
        jmp short .1
.3:
        cmp eax, ebp
        je short .4
        mov eax, 0Ch
        call __set_errno_
.4:
        mov eax, edx
.5:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
        push edx
        mov edx, eax
        mov eax, dword [__nheapbeg]
        mov dword [__nheapbeg], edx
        pop edx
        ret
