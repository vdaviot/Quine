SECTION .text
global _main
extern _sprintf
extern _fprintf
extern _printf
extern _fopen
extern _fclose
extern _system
default rel
%macro PRINTF 1
lea rdi, [%1]
mov rsi, r12
mov rdx, 10
mov rcx, 34
lea r8, [%1]
call _printf
%endmacro
%macro FPRINTF 0
mov rdi, [Fd]
lea rsi, [Quine]
mov rdx, r12
mov rcx, 10
mov r8, 34
lea r9, [Quine]
call _fprintf
%endmacro
%macro SPRINTF 0
lea rdi, [File]
lea rsi, [Filename]
mov rdx, r12
call _sprintf
%endmacro
%macro FOPEN 0
lea rdi, [File]
lea rsi, [Mode]
call _fopen
mov qword [Fd], rax
%endmacro
%macro FCLOSE 0
mov rdi, [Fd]
call _fclose
%endmacro
%macro COMPIL 0
lea rdi, [Command]
lea rsi, [Compil]
lea rdx, [Object]
lea rcx, [Object]
call _sprintf
lea rdi, [Command]
call _system
%endmacro
%macro FORM 0
lea rdi, [Object]
lea rsi, [Objectname]
mov rdx, r12
call _sprintf
%endmacro
%macro OBJ 0
lea rdi, [Command]
lea rsi, [Nasm]
lea rdx, [File]
call _sprintf
lea rdi, [Command]
call _system
%endmacro
%macro EXEC 0
lea rdi, [File]
lea rsi, [Objectname]
mov rdx, r12
call _sprintf
lea rdi, [Command]
lea rsi, [Execute]
lea rdx, [File]
lea rcx, [File]
call _sprintf
lea rdi, [Command]
call _system
%endmacro
_main:
mov r12, 5
cmp r12, 0
jl end
push r12
SPRINTF
FOPEN
sub r12, 1
FPRINTF
add r12, 1
FCLOSE
OBJ
FORM
COMPIL
EXEC
pop r12
end:
mov rax, 0
ret
SECTION .data
Quine: db "SECTION .text%2$cglobal _main%2$cextern _sprintf%2$cextern _fprintf%2$cextern _printf%2$cextern _fopen%2$cextern _fclose%2$cextern _system%2$cdefault rel%2$c%%macro PRINTF 1%2$clea rdi, [%%1]%2$cmov rsi, r12%2$cmov rdx, 10%2$cmov rcx, 34%2$clea r8, [%%1]%2$ccall _printf%2$c%%endmacro%2$c%%macro FPRINTF 0%2$cmov rdi, [Fd]%2$clea rsi, [Quine]%2$cmov rdx, r12%2$cmov rcx, 10%2$cmov r8, 34%2$clea r9, [Quine]%2$ccall _fprintf%2$c%%endmacro%2$c%%macro SPRINTF 0%2$clea rdi, [File]%2$clea rsi, [Filename]%2$cmov rdx, r12%2$ccall _sprintf%2$c%%endmacro%2$c%%macro FOPEN 0%2$clea rdi, [File]%2$clea rsi, [Mode]%2$ccall _fopen%2$cmov qword [Fd], rax%2$c%%endmacro%2$c%%macro FCLOSE 0%2$cmov rdi, [Fd]%2$ccall _fclose%2$c%%endmacro%2$c%%macro COMPIL 0%2$clea rdi, [Command]%2$clea rsi, [Compil]%2$clea rdx, [Object]%2$clea rcx, [Object]%2$ccall _sprintf%2$clea rdi, [Command]%2$ccall _system%2$c%%endmacro%2$c%%macro FORM 0%2$clea rdi, [Object]%2$clea rsi, [Objectname]%2$cmov rdx, r12%2$ccall _sprintf%2$c%%endmacro%2$c%%macro OBJ 0%2$clea rdi, [Command]%2$clea rsi, [Nasm]%2$clea rdx, [File]%2$ccall _sprintf%2$clea rdi, [Command]%2$ccall _system%2$c%%endmacro%2$c%%macro EXEC 0%2$clea rdi, [File]%2$clea rsi, [Objectname]%2$cmov rdx, r12%2$ccall _sprintf%2$clea rdi, [Command]%2$clea rsi, [Execute]%2$clea rdx, [File]%2$clea rcx, [File]%2$ccall _sprintf%2$clea rdi, [Command]%2$ccall _system%2$c%%endmacro%2$c_main:%2$cmov r12, %1$d%2$ccmp r12, 0%2$cjl end%2$cpush r12%2$cSPRINTF%2$cFOPEN%2$csub r12, 1%2$cFPRINTF%2$cadd r12, 1%2$cFCLOSE%2$cOBJ%2$cFORM%2$cCOMPIL%2$cEXEC%2$cpop r12%2$cend:%2$cmov rax, 0%2$cret%2$cSECTION .data%2$cQuine: db %3$c%s%3$c, 0%2$cMode: db %3$cw%3$c, 0%2$cNasm: db %3$c/Users/vdaviot/homebrew/bin/nasm -f macho64 %%s%3$c, 0%2$cCompil: db %3$cclang -Wall -Wextra -Werror %%s.o -o %%s%3$c, 0%2$cExecute: db %3$crm %%s.o && ./%%s%3$c, 0%2$cFilename: db %3$cSully_%%d.asm%3$c, 0%2$cObjectname: db %3$cSully_%%d%3$c, 0%2$cObject: times 512 db 0%2$cFile: times 512 db 0%2$cCommand: times 512 db 0%2$cSECTION .bss%2$cFd: resq 1%2$c", 0
Mode: db "w", 0
Nasm: db "/Users/vdaviot/homebrew/bin/nasm -f macho64 %s", 0
Compil: db "clang -Wall -Wextra -Werror %s.o -o %s", 0
Execute: db "rm %s.o && ./%s", 0
Filename: db "Sully_%d.asm", 0
Objectname: db "Sully_%d", 0
Object: times 512 db 0
File: times 512 db 0
Command: times 512 db 0
SECTION .bss
Fd: resq 1
