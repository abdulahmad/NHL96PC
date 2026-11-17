; EA library: OpenArtArchiveErr, OpenArtArchive, LoadDataFileErr, LoadFileAllocQuiet.
bits 32
%include "hockey.inc"
section s_B20CE progbits alloc exec nowrite align=1
extern LoadDataFileExt
global OpenArtArchiveErr, OpenArtArchive, LoadDataFileErr, LoadFileAllocQuiet
        db 00h,00h
;-----------------------------------------------------------------------------
; OpenArtArchiveErr                               B20D0  96 PC, low confidence
; Opens an art archive file with the error message
;-----------------------------------------------------------------------------
OpenArtArchiveErr:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadDataFileExt
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov eax, dword [eax]
.1:
        ret
        db 090h
;-----------------------------------------------------------------------------
; OpenArtArchive                                  B20EC  96 PC, low confidence
; Opens an art archive file
;-----------------------------------------------------------------------------
OpenArtArchive:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadDataFileExt
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov eax, dword [eax]
.1:
        ret
        db 090h
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        mov ecx, dword [byte esp+0Ch]
        push ecx
        call LoadDataFileExt
        add esp, byte 0Ch
        test eax, eax
        je short .2
        mov eax, dword [eax]
.2:
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; LoadDataFileErr                                 B2128  96 PC, low confidence
; Loads a data file with the error message
;-----------------------------------------------------------------------------
LoadDataFileErr:
        push byte 1
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadDataFileExt
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; LoadFileAllocQuiet                              B2140  96 PC, low confidence
; Loads a file into a new block without the error message
;-----------------------------------------------------------------------------
LoadFileAllocQuiet:
        push byte 0
        mov edx, dword [byte esp+0Ch]
        push edx
        mov ebx, dword [byte esp+0Ch]
        push ebx
        call LoadDataFileExt
        add esp, byte 0Ch
        ret
        db 08Dh,040h,00h
