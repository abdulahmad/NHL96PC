; Watcom C runtime: forcedecpt_, __cnvs2d_, __setenvp_, __exit_with_msg_, __fatal_runtime_error_.
bits 32
%include "hockey.inc"
section s_D7BB2 progbits alloc exec nowrite align=1
extern ___env_mask, __EnterWVIDEO_, _environ, _Envptr, _Envptr_w4, _nfree_, _nmalloc_, memset_
extern strtod_, WriteConsoleMessage
global forcedecpt_, __cnvs2d_, __setenvp_, __exit_with_msg_, __fatal_runtime_error_
;-----------------------------------------------------------------------------
; forcedecpt_                                                   D7BB2  library
; Run-time library: makes sure a formatted float has a decimal point
;-----------------------------------------------------------------------------
forcedecpt_:
        push ebx
        push ecx
        mov ebx, edx
        test byte [byte edx+014h], 1
        jne short .6
.1:
        mov dh, byte [eax]
        test dh, dh
        je short .2
        cmp dh, 65h
        je short .2
        cmp dh, 45h
        je short .2
        inc eax
        jmp short .1
.2:
        mov edx, eax
        mov cl, byte [byte ebx+015h]
        dec eax
        cmp cl, 47h
        je short .3
        cmp cl, 67h
        jne short .4
.3:
        cmp byte [eax], 30h
        jne short .4
        dec eax
        jmp short .3
.4:
        cmp byte [eax], 2Eh
        je short .5
        inc eax
.5:
        mov bl, byte [edx]
        inc edx
        mov byte [eax], bl
        inc eax
        test bl, bl
        jne short .5
.6:
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __cnvs2d_                                                     D7BFA  library
; Run-time library: a decimal string to a double
;-----------------------------------------------------------------------------
__cnvs2d_:
        push ebx
        mov ebx, edx
        xor edx, edx
        call strtod_
        fstp qword [ebx]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __setenvp_                                                    D7C08  library
; Run-time library: builds the environment pointer table at start-up
;-----------------------------------------------------------------------------
__setenvp_:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push es
        push fs
        cmp dword [_environ], byte 0
        jne near .10
        mov fs, word [_Envptr_w4]
        xor ecx, ecx
        xor dl, dl
        mov eax, fs
        mov edi, dword [_Envptr]
        mov es, eax
        mov eax, edi
.1:
        cmp dl, byte [es:eax]
        je short .4
.2:
        mov dh, byte [es:eax]
        lea ebx, [byte eax+01h]
        cmp dl, dh
        je short .3
        mov eax, ebx
        jmp short .2
.3:
        inc ecx
        mov eax, ebx
        jmp short .1
.4:
        sub eax, edi
        jne short .5
        mov eax, 1
.5:
        call _nmalloc_
        mov edx, eax
        mov ebx, eax
        test eax, eax
        je near .10
        mov eax, ecx
        shl eax, 2
        add eax, byte 4
        add eax, ecx
        call _nmalloc_
        test eax, eax
        je short .9
        mov dword [_environ], eax
        xor esi, esi
        mov eax, fs
        xor ecx, ecx
        mov es, eax
        mov eax, edi
.6:
        cmp byte [es:eax], 0
        je short .8
        mov edx, dword [_environ]
        mov dword [ecx+edx], ebx
.7:
        mov dl, byte [es:eax]
        inc eax
        mov byte [ebx], dl
        inc ebx
        test dl, dl
        jne short .7
        add ecx, byte 4
        inc esi
        jmp short .6
.8:
        mov edx, dword [_environ]
        mov dword [ecx+edx], 0
        add ecx, byte 4
        add edx, ecx
        mov ebx, esi
        mov dword [___env_mask], edx
        mov eax, edx
        xor edx, edx
        call memset_
        jmp short .10
.9:
        mov eax, edx
        call _nfree_
.10:
        pop fs
        pop es
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __exit_with_msg_                                              D7CDC  library
; Run-time library: prints a message and exits
;-----------------------------------------------------------------------------
__exit_with_msg_:
        jmp near WriteConsoleMessage
;-----------------------------------------------------------------------------
; __fatal_runtime_error_                                        D7CE1  library
; Run-time library: prints a fatal run-time error and exits
;-----------------------------------------------------------------------------
__fatal_runtime_error_:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov edx, ds
        call __EnterWVIDEO_
        test eax, eax
        jne short .1
        mov eax, ebx
        mov edx, ecx
        call WriteConsoleMessage
.1:
        pop ecx
        pop ebx
        ret
        db 00h,00h
        push ebx
        push edx
        push esi
        push edi
        mov edx, ecx
        mov ebx, eax
        xor esi, esi
        xor eax, eax
.2:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .3
        mov cl, al
        movzx edi, byte [ebx]
        inc ebx
        shl edi, cl
        add eax, byte 8
        add esi, edi
        jmp short .2
.3:
        mov eax, esi
        pop edi
        pop esi
        pop edx
        pop ebx
        ret
        push ebx
        push edx
        xor edx, edx
.4:
        dec ecx
        cmp ecx, byte 0FFFFFFFFh
        je short .5
        xor ebx, ebx
        shl edx, 8
        mov bl, byte [eax]
        inc eax
        add edx, ebx
        jmp short .4
.5:
        mov eax, edx
        pop edx
        pop ebx
        ret
