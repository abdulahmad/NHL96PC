; Watcom C runtime: _dos_close_, _dos_commit_, _dos_open_, DosFindFirst, DosFindNext and 9 more.
bits 32
%include "hockey.inc"
section s_B71A6 progbits alloc exec nowrite align=1
extern __doserror_, __set_EINVAL_, __set_errno_dos_, _Extender, unlink_
global _dos_close_, _dos_commit_, _dos_open_, DosFindFirst, DosFindNext, CopyDtaOut, CopyDtaIn, UnlinkJump
global rmdir_, _dos_creat_, _dos_creatnew_, _dos_read_, _dos_read__5, _dos_write_, _dos_getdiskfree_
;-----------------------------------------------------------------------------
; _dos_close_                                                   B71A6  library
; Run-time library _dos_close: closes a DOS file handle
;-----------------------------------------------------------------------------
_dos_close_:
        push ebx
        mov bx, ax
        mov ah, 3Eh
        int 21h
        call __doserror_
        pop ebx
        ret
;-----------------------------------------------------------------------------
; _dos_commit_                                                  B71B5  library
; Run-time library _dos_commit: flushes a DOS file to disk
;-----------------------------------------------------------------------------
_dos_commit_:
        push ebx
        mov bx, ax
        mov ah, 68h
        clc
        int 21h
        call __doserror_
        pop ebx
        ret
;-----------------------------------------------------------------------------
; _dos_open_                                                    B71C5  library
; Run-time library _dos_open: opens a DOS file
;-----------------------------------------------------------------------------
_dos_open_:
        xchg edx, eax
        mov ah, 3Dh
        int 21h
        jb short .1
        mov dword [ebx], eax
.1:
        call __doserror_
        ret
;-----------------------------------------------------------------------------
; DosFindFirst                                 B71D4  96 PC, medium confidence
; Finds the first file matching a pattern (DOS 4Eh) into a find record
;-----------------------------------------------------------------------------
DosFindFirst:
        push ecx
        push eax
        push edx
        mov edx, ebx
        mov ah, 1Ah
        int 21h
        pop ecx
        pop edx
        mov ah, 4Eh
        int 21h
        call __doserror_
        mov edx, ebx
        call CopyDtaOut
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DosFindNext                                  B71F1  96 PC, medium confidence
; Finds the next matching file (DOS 4Fh)
;-----------------------------------------------------------------------------
DosFindNext:
        push edx
        mov edx, eax
        mov ah, 1Ah
        int 21h
        call CopyDtaIn
        mov ah, 4Fh
        int 21h
        call __doserror_
        call CopyDtaOut
        pop edx
        ret
        xor eax, eax
        ret
;-----------------------------------------------------------------------------
; CopyDtaOut                                      B7210  96 PC, low confidence
; Copies the DOS transfer area to the caller's find record under the DOS/4GW
; extender
;-----------------------------------------------------------------------------
CopyDtaOut:
        cmp byte [_Extender], 9
        jne short .1
        push eax
        push ebx
        push ecx
        push esi
        push edi
        mov ah, 2Fh
        int 21h
        mov esi, ebx
        mov edi, edx
        mov ecx, 2Bh
        rep movsb
        pop edi
        pop esi
        pop ecx
        pop ebx
        pop eax
.1:
        ret
;-----------------------------------------------------------------------------
; CopyDtaIn                                       B7233  96 PC, low confidence
; Copies the caller's find record into the DOS transfer area under the
; DOS/4GW extender
;-----------------------------------------------------------------------------
CopyDtaIn:
        cmp byte [_Extender], 9
        jne short .1
        push eax
        push ebx
        push ecx
        push esi
        push edi
        mov ah, 2Fh
        int 21h
        mov edi, ebx
        mov esi, edx
        mov ecx, 2Bh
        rep movsb
        pop edi
        pop esi
        pop ecx
        pop ebx
        pop eax
.1:
        ret
;-----------------------------------------------------------------------------
; UnlinkJump                                      B7256  96 PC, low confidence
; Jumps to unlink (file delete)
;-----------------------------------------------------------------------------
UnlinkJump:
        jmp near unlink_
;-----------------------------------------------------------------------------
; rmdir_                                                        B725B  library
; Run-time library rmdir: removes a directory
;-----------------------------------------------------------------------------
rmdir_:
        push edx
        mov edx, eax
        mov ah, 3Ah
        int 21h
        rcl eax, 1
        ror eax, 1
        test eax, eax
        jge short .1
        and eax, 0FFFFh
        call __set_errno_dos_
        pop edx
        ret
.1:
        xor eax, eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; _dos_creat_                                                   B727A  library
; Run-time library _dos_creat: creates or truncates a file and returns its
; handle
;-----------------------------------------------------------------------------
_dos_creat_:
        push ecx
        mov ecx, edx
        mov edx, eax
        mov ah, 3Ch
        int 21h
        jb short .1
        mov dword [ebx], eax
.1:
        call __doserror_
        pop ecx
        ret
;-----------------------------------------------------------------------------
; _dos_creatnew_                                                B728E  library
; Run-time library _dos_creatnew: creates a file that must not exist yet
;-----------------------------------------------------------------------------
_dos_creatnew_:
        push ecx
        mov ecx, edx
        mov edx, eax
        mov ah, 5Bh
        int 21h
        jb short .1
        mov dword [ebx], eax
.1:
        call __doserror_
        pop ecx
        ret
;-----------------------------------------------------------------------------
; _dos_read_                                                    B72A2  library
; Run-time library _dos_read: reads from a DOS file handle
;-----------------------------------------------------------------------------
_dos_read_:
        push dword 3F00h
_dos_read__5:
        push ds
        mov ds, ecx
        mov ecx, edx
        mov edx, ebx
        mov ebx, eax
        mov eax, dword [byte esp+04h]
        int 21h
        pop ds
        push ds
        jb short .1
        mov ebx, dword [byte esp+0Ch]
        mov dword [ebx], eax
.1:
        call __doserror_
        pop ds
        add esp, byte 4
        ret 4
;-----------------------------------------------------------------------------
; _dos_write_                                                   B72CC  library
; Run-time library _dos_write: writes to a DOS file handle through the shared
; read and write code
;-----------------------------------------------------------------------------
_dos_write_:
        push dword 4000h
        jmp short _dos_read__5
        db 00h
;-----------------------------------------------------------------------------
; _dos_getdiskfree_                                             B72D4  library
; Run-time library _dos_getdiskfree: free space of a drive
;-----------------------------------------------------------------------------
_dos_getdiskfree_:
        push edi
        push ecx
        push ebx
        mov edi, edx
        mov edx, eax
        mov ah, 36h
        int 21h
        cmp ax, 0FFFFh
        je short .1
        mov word [edi], dx
        mov word [byte edi+02h], bx
        mov word [byte edi+04h], ax
        mov word [byte edi+06h], cx
        sub eax, eax
        jmp short .2
.1:
        call __set_EINVAL_
.2:
        pop ebx
        pop ecx
        pop edi
        ret
