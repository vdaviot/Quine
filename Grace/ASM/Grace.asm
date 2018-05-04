%macro end 0
mov rsp, rbp
leave
ret
%endmacro

%macro fprintf 0
mov rdi, rax
lea rsi, [Quine]
mov rdx, 10
mov rcx, 34
mov r8, 59
lea r9, [Quine]
call _fprintf
%endmacro

%macro fclose 0
mov rax, 3
syscall
%endmacro

%macro fopen 0
global _main
extern _fprintf
extern _fopen
extern _fclose
default rel
section .text
_main:
push rbp
mov rbp, rsp
lea rdi, [File]
lea rsi, [Mode]
call _fopen ; fd dans rax
fprintf
fclose
end
section .data
Quine: db "%%macro end 0%1$cmov rsp, rbp%1$cleave%1$cret%1$c%%endmacro%1$c%1$c%%macro fprintf 0%1$cmov rdi, rax%1$clea rsi, [Quine]%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, 59%1$clea r9, [Quine]%1$ccall _fprintf%1$c%%endmacro%1$c%1$c%%macro fclose 0%1$cmov rax, 3%1$csyscall%1$c%%endmacro%1$c%1$c%%macro fopen 0%1$cglobal _main%1$cextern _fprintf%1$cextern _fopen%1$cextern _fclose%1$cdefault rel%1$csection .text%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$clea rdi, [File]%1$clea rsi, [Mode]%1$ccall _fopen %3$c fd dans rax%1$cfprintf%1$cfclose%1$cend%1$csection .data%1$cQuine: db %2$c%4$s%2$c, 0%1$cFile: db %2$cGrace_kid.asm%2$c, 0%1$cMode: db %2$cw%2$c, 0%1$c%%endmacro%1$c%1$cfopen", 0
File: db "Grace_kid.asm", 0
Mode: db "w", 0
%endmacro

fopen