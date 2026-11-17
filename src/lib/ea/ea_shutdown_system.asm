; EA library: ShutdownSystem, InitSystem, PrintBoxedText.
bits 32
%include "hockey.inc"
section s_C5AE3 progbits alloc exec nowrite align=1
extern _searchenv_, AddExitHandler, BuildPerspTable, DefaultFont, DrawTextBoxedAt, FatalError, FileSizeByName, GraphicsReady
extern initgraphics, InitMemoryPoolDefault, InitPointer, InitReciprocalTable, InstallBreakHandler, InstallDebugHotkeys, InstallKeyboardHandler, InstallTimer
extern MemPoolBase, MenuScreenBitmap, MousePresent, NearestColour, NumLockOff, PaletteShadow, ReadPaletteEntries8, RestoreTextMode
extern RestoreTextScreen, ReturnZero, SavedTextScreen, SaveTextScreen, SetKbdIdleHook, SetPaletteEntries8, SetScreenTarget, SetViewFov
extern SetViewScreenOrigin, sprintf_, str_CheckextenderINCORRECTEX, str_CS_InitSystem, str_DOS4GWEXE, str_PATH_InitSystem, SystemInfo, SystemNeedsInit
extern TextSetColor, TextSetFont, ViewScreenHeight, ViewScreenWidth, vsprintf_, ZeroMem_29
global ShutdownSystem, InitSystem, PrintBoxedText
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ShutdownSystem                                  C5AF0  96 PC, low confidence
; Restores text mode and shuts down the system
;-----------------------------------------------------------------------------
ShutdownSystem:
        push ebx
        push ecx
        push edx
        call RestoreTextMode
        mov edx, dword [SavedTextScreen]
        test edx, edx
        je short .1
        mov eax, edx
        xor ebx, ebx
        call RestoreTextScreen
        mov dword [SavedTextScreen], ebx
.1:
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; InitSystem                                      C5B18  96 PC, low confidence
; Checks the DOS extender and sets up memory, graphics, timer and input
;-----------------------------------------------------------------------------
InitSystem:
        push esi
        sub esp, 100h
        mov ebx, esp
        xor ah, ah
        mov edx, str_PATH_InitSystem
        mov byte [esp], ah
        mov eax, str_DOS4GWEXE
        call _searchenv_
        mov dl, byte [esp]
        mov esi, 1
        test dl, dl
        jne short .1
        push str_DOS4GWEXE
        push str_CS_InitSystem
        lea eax, [byte esp+08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.1:
        mov eax, esp
        push eax
        call FileSizeByName
        add esp, byte 4
        cmp eax, 40CCCh
        je short .3
        cmp eax, 3E25Ch
        je short .3
        cmp dword [dword esp+0108h], byte 0
        je short .2
        push dword 40CCCh
        push eax
        lea eax, [byte esp+08h]
        push eax
        push str_CheckextenderINCORRECTEX
        call FatalError
        add esp, byte 10h
.2:
        mov esi, 1
.3:
        mov eax, esi
        add esp, 100h
        pop esi
        ret
        db 08Bh,0C0h
        push byte 0
        call InitSystem
        add esp, byte 4
        ret
        db 090h
        push byte 1
        call InitSystem
        add esp, byte 4
        ret
        db 090h
        push esi
        push edi
        push ebp
        cmp dword [SystemNeedsInit], byte 0
        je short .4
        push byte 1
        call InitSystem
        add esp, byte 4
.4:
        cmp dword [MemPoolBase], byte 0
        jne short .5
        push dword 0C8h
        call InitMemoryPoolDefault
        add esp, byte 4
.5:
        cmp dword [GraphicsReady], byte 0
        jne short .6
        call SaveTextScreen
        db 068h                                 ; insn: push ShutdownSystem
        dd ShutdownSystem
        mov dword [SavedTextScreen], eax
        call AddExitHandler
        add esp, byte 4
        mov esi, dword [MenuScreenBitmap]
        push esi
        mov edi, dword [ViewScreenHeight]
        push edi
        mov ebp, dword [ViewScreenWidth]
        push ebp
        call initgraphics
        add esp, byte 0Ch
.6:
        push SystemInfo
        push dword 100h
        push byte 0
        call SetPaletteEntries8
        add esp, byte 0Ch
        push DefaultFont
        call TextSetFont
        add esp, byte 4
        push dword 0FF000000h
        call NearestColour
        add esp, byte 4
        push eax
        push byte 0FFFFFFFFh
        call NearestColour
        add esp, byte 4
        push eax
        call TextSetColor
        add esp, byte 8
        call SetScreenTarget
        cmp dword [MousePresent], byte 0
        jne short .7
        call InitPointer
.7:
        push byte 64h
        call InstallTimer
        add esp, byte 4
        call NumLockOff
        call InstallKeyboardHandler
        push ReturnZero
        call InstallBreakHandler
        add esp, byte 4
        push ZeroMem_29
        call SetKbdIdleHook
        add esp, byte 4
        call InstallDebugHotkeys
        mov edx, dword [ViewScreenHeight]
        push edx
        mov ebx, dword [ViewScreenWidth]
        push ebx
        push byte 14h
        push byte 1Eh
        call SetViewFov
        add esp, byte 10h
        push byte 0
        push byte 0
        call SetViewScreenOrigin
        add esp, byte 8
        call BuildPerspTable
        call InitReciprocalTable
        push PaletteShadow
        push dword 100h
        push byte 0
        call ReadPaletteEntries8
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; PrintBoxedText                                  C5D00  96 PC, low confidence
; Formats text like printf and draws it on a box at x, y
;-----------------------------------------------------------------------------
PrintBoxedText:
        sub esp, 204h
        lea eax, [dword esp+0214h]
        lea ebx, [dword esp+0200h]
        mov edx, dword [dword esp+0210h]
        mov dword [dword esp+0200h], eax
        mov eax, esp
        call vsprintf_
        mov edx, dword [dword esp+020Ch]
        push edx
        mov ebx, dword [dword esp+020Ch]
        push ebx
        lea eax, [byte esp+08h]
        push eax
        call DrawTextBoxedAt
        add esp, byte 0Ch
        xor ecx, ecx
        mov dword [dword esp+0200h], ecx
        add esp, 204h
        ret
