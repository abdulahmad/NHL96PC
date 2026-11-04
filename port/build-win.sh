#!/bin/sh
# Build the 32-bit Windows program (build/win/hockey-win32.exe + SDL2.dll) with mingw-w64 from Linux or WSL.
#   sudo apt install gcc-mingw-w64-i686 nasm make python3
# Does not assemble src/; ./build.sh (repo root) still builds MATCH.
set -e
cd "$(dirname "$0")/.."
# Where SDL2 for 32-bit Windows is: SDL2_MINGW (the i686-w64-mingw32 directory of SDL2-devel-*-mingw), a copy unpacked next to the
# repository, or the MSYS2 MINGW32 package (pkg-config).
SDL2_MINGW=${SDL2_MINGW:-$(ls -d SDL2-*/i686-w64-mingw32 ../SDL2-*/i686-w64-mingw32 2>/dev/null | head -1)}
if [ -n "$SDL2_MINGW" ] && [ -d "$SDL2_MINGW/include/SDL2" ]; then
    SDL_CFLAGS="-I$SDL2_MINGW/include/SDL2"
    SDL_LIBS="-L$SDL2_MINGW/lib -lSDL2"
    SDL_DLL="$SDL2_MINGW/bin/SDL2.dll"
elif pkg-config --exists sdl2 2>/dev/null; then
    SDL_CFLAGS=$(pkg-config --cflags sdl2 | sed 's/-Dmain=SDL_main//')
    SDL_LIBS=$(pkg-config --libs sdl2 | sed 's/-lmingw32//; s/-lSDL2main//; s/-mwindows//')
    SDL_DLL="$(pkg-config --variable=prefix sdl2)/bin/SDL2.dll"
else
    echo "SDL2 for 32-bit Windows not found: set SDL2_MINGW to the i686-w64-mingw32 directory of SDL2-devel-*-mingw, or install" >&2
    echo "mingw-w64-i686-SDL2 in an MSYS2 MINGW32 shell" >&2
    exit 1
fi
OUT=build/win
mkdir -p "$OUT"

sh port/fetch-deps.sh
# Munt (the MT-32 emulator) needs a C++ compiler: mingw-w64's g++ (gcc-mingw-w64-i686 plus g++-mingw-w64-i686)
CXXW=${CXXW:-i686-w64-mingw32-g++}
command -v "$CXXW" >/dev/null 2>&1 || CXXW=g++
ARW=${ARW:-i686-w64-mingw32-ar}
command -v "$ARW" >/dev/null 2>&1 || ARW=ar           # MSYS2 MINGW32 has only ar
CXX=$CXXW AR=$ARW sh port/munt-build.sh build/munt-win "-static"

CC=${CC:-i686-w64-mingw32-gcc}
command -v "$CC" >/dev/null 2>&1 || CC=gcc
# DOS memory (0x10000-0xFFFFF) must be free, but Windows fills it before main runs. Linked at 0x10000 with ld's default script plus an
# uninitialized section .lowmem in front of .text, the program's own image covers 0x11000-0xFFFFF: the loader maps it first.
$CC -Wl,--verbose 2>/dev/null | sed -n '/^======/,/^======/p' | sed '1d;$d' | sed \
    's/^  \.text  __image_base__ + ( __section_alignment__ < 0x1000 ? \. : __section_alignment__ ) :/  .lowmem __image_base__ + __section_alignment__ (NOLOAD) : { . = . + 0xEF000; }\n  .text ALIGN(__section_alignment__) :/' \
    > "$OUT/lowmem.ld"
grep -q '^  \.lowmem' "$OUT/lowmem.ld" || { echo "could not add .lowmem to the linker script" >&2; exit 1; }
# the program's icon (resource 1, which SDL uses for the window as well)
WINDRES=${WINDRES:-i686-w64-mingw32-windres}
command -v "$WINDRES" >/dev/null 2>&1 || WINDRES=windres
$WINDRES -O coff port/icon/icon.rc -o "$OUT/icon.o"
$CC -O1 -g -mstackrealign -Wall -Wno-format-truncation -DSDL_MAIN_HANDLED $SDL_CFLAGS \
    -o "$OUT/hockey-win32.exe" port/host.c port/video_gl.c port/menu_win.c port/bindings.c port/bindings_win.c -DHAVE_GL port/stats.c port/emu.c port/ports.c port/dos.c port/video.c port/input.c port/irq.c port/audio.c port/dma.c port/speaker.c port/opl.c port/sb.c port/mpu.c port/gus.c port/sound_ports.c \
    port/soundtest.c port/third_party/nuked-opl3/opl3.c -DHAVE_MUNT -Ibuild/munt-win/inc -Iport/third_party/munt/mt32emu/src port/cstart.c \
    port/overrides.c port/le_load.c port/plat_win.c "$OUT/icon.o" \
    build/munt-win/libmt32emu.a $SDL_LIBS -lopengl32 -lpdh -lcomctl32 -lgdi32 -static-libgcc -Wl,-Bstatic -lstdc++ -lpthread -Wl,-Bdynamic -lm -Wl,--subsystem,console \
    -Wl,--disable-dynamicbase -Wl,--image-base=0x10000 -Wl,-T,"$OUT/lowmem.ld"
cp "$SDL_DLL" "$OUT/"
rm -rf "$OUT/mister" && cp -r port/mister "$OUT/mister"       # the MiSTer filter files the "MiSTer filters" menus list
echo "built $OUT/hockey-win32.exe (run it in the game's folder, or set NHL96_ROOT)"
