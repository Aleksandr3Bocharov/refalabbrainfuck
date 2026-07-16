@echo off

rem Copyright 2026 Aleksandr Bocharov
rem Distributed under the Boost Software License, Version 1.0.
rem See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt
rem 2026-07-17
rem https://github.com/Aleksandr3Bocharov/refalabbrainfuck

if not exist bin mkdir bin
%REFALABBIN%\refalabc src\refalabbrainfuck -l,"-o src\refalabbrainfuck.o -O2 -Wno-override-module" > refalabbrainfuck.log
%REFALABBIN%\refalabc src\interpretator -l,"-o src\interpretator.o -O2 -Wno-override-module" >> refalabbrainfuck.log
clang %REFALABCFLAGS% -I%REFALABINCLUDE% -c src\interpretatorc.c -o src\interpretatorc.o >> refalabbrainfuck.log
clang -o bin\refalabbrainfuck.exe src\refalabbrainfuck.o src\interpretator.o src\interpretatorc.o %REFALABLFLAGS% -static >> refalabbrainfuck.log
bin\refalabbrainfuck %1
