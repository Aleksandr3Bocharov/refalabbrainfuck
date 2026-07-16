@echo off

rem Copyright 2026 Aleksandr Bocharov
rem Distributed under the Boost Software License, Version 1.0.
rem See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt
rem 2026-07-17
rem https://github.com/Aleksandr3Bocharov/refalabbrainfuck

set RAYLIB=F:\Programming\raylib-5.5_win64_mingw-w64
set RAYLIBCFLAGS=-Wall -O2 -I%RAYLIB%\include
set RAYLIBLFLAGS=-L%RAYLIB%\lib -lraylib -lgdi32 -lwinmm

if not exist bin mkdir bin
%REFALABBIN%\refalabc src\refalabbrainfuck_gui -l,"-o src\refalabbrainfuck_gui.o -O2 -Wno-override-module" > refalabbrainfuck_gui.log
%REFALABBIN%\refalabc src\interpretator -l,"-o src\interpretator.o -O2 -Wno-override-module" >> refalabbrainfuck_gui.log
clang %REFALABCFLAGS% -I%REFALABINCLUDE% -c src\interpretatorc.c -o src\interpretatorc.o >> refalabbrainfuck_gui.log
clang %REFALABCFLAGS% -I%REFALABINCLUDE% -c src\refalabbrainfuckc_gui.c -o src\refalabbrainfuckc_gui.o >> refalabbrainfuck_gui.log
clang %RAYLIBCFLAGS% -c src\gui.c -o src\gui.o >> refalabbrainfuck_gui.log
clang -o bin\refalabbrainfuck_gui.exe src\refalabbrainfuck_gui.o src\refalabbrainfuckc_gui.o src\interpretator.o src\interpretatorc.o %REFALABLFLAGS% src\gui.o -static %RAYLIBLFLAGS% >> refalabbrainfuck_gui.log
bin\refalabbrainfuck_gui
