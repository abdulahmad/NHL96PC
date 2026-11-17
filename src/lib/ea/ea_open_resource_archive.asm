; EA library: OpenResourceArchive, GetResourceArchiveName.
bits 32
%include "hockey.inc"
section s_B7301 progbits alloc exec nowrite align=1
extern ArchiveCount, ArchiveHandle, ArchiveOpenFn, BigEntryLength, LocateBigEntry_168, ResourceArchive, ResourceArchiveData, ResourceArchiveName
extern str_Viv
global OpenResourceArchive, GetResourceArchiveName
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; OpenResourceArchive                             B7310  96 PC, low confidence
; Frees the old archive and loads the named resource archive for later
; lookups
;-----------------------------------------------------------------------------
OpenResourceArchive:
        push esi
        push edi
        mov esi, dword [byte esp+0Ch]
        mov edx, LocateBigEntry_168
        mov ebx, ResourceArchiveData
        mov ecx, BigEntryLength
        mov edi, 5DC0h
        xor ah, ah
        mov dword [ArchiveOpenFn], edx
        mov dword [ArchiveHandle], ebx
        mov dword [ArchiveCount], ecx
        mov dword [ResourceArchive], edi
        mov byte [ResourceArchiveData], ah
        mov byte [ResourceArchiveName], ah
        test esi, esi
        je short .8
        mov edi, ResourceArchiveName
        mov dl, 2Eh
        push edi
.1:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .2
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .1
.2:
        pop edi
        mov esi, edi
.3:
        mov al, byte [esi]
        LD cmp, al, dl
        je short .5
        cmp al, 0
        je short .4
        inc esi
        mov al, byte [esi]
        LD cmp, al, dl
        je short .5
        inc esi
        cmp al, 0
        jne short .3
.4:
        LD sub, esi, esi
.5:
        test esi, esi
        jne short .8
        mov esi, str_Viv
        push edi
        LD sub, ecx, ecx
        dec ecx
        mov al, 0
        repne scasb
        dec edi
.6:
        mov al, byte [esi]
        mov byte [edi], al
        cmp al, 0
        je short .7
        mov al, byte [byte esi+01h]
        add esi, byte 2
        mov byte [byte edi+01h], al
        add edi, byte 2
        cmp al, 0
        jne short .6
.7:
        pop edi
.8:
        mov eax, ResourceArchiveName
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; GetResourceArchiveName                       B73C4  96 PC, medium confidence
; Returns the resource archive name buffer
;-----------------------------------------------------------------------------
GetResourceArchiveName:
        mov eax, ResourceArchiveName
        ret
