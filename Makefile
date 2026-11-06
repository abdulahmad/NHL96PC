# NHL 96 PC: byte-identical rebuild of HOCKEY.EXE from src/, plus the SDL2 host.
#
#   make              ./build.sh -> MATCH output/HOCKEY.EXE
#   make sdl2         port/build.sh -> build/hockey-linux
#   make sdl2-win     port/build-win.sh -> build/win/hockey-win32.exe

.PHONY: all sdl2 sdl2-win
all:
	./build.sh
sdl2:
	port/build.sh
sdl2-win:
	port/build-win.sh
