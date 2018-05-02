; Enter my dungeon!
section .data
quine: db "%c Enter my dungeon!%csection .data%cquine: db %c%s%c, 0%c%cglobal _main%cextern _printf%cdefault rel%csection .text%c_main:%cpush rbp%cmov rbp, rsp%cmov rcx, 30%csetup:%cpush 10%cdec rcx%ccmp rcx, 0%cje print%cjmp setup%cprint:%cadd dword [rsp], 24 %c lol%cadd dword [rsp + 144], 49%clea rdi, [quine]%cmov rsi, 59%cmov rdx, 10%cmov rcx, 10%cmov r8, 34%clea r9, [quine]%ccall _printf%cmov rsp, rbp%cleave%cret", 0

global _main
extern _printf
default rel
section .text
_main:
push rbp
mov rbp, rsp
mov rcx, 30
setup:
push 10
dec rcx
cmp rcx, 0
je print
jmp setup
print:
add dword [rsp], 24 ; lol
add dword [rsp + 144], 49
lea rdi, [quine]
mov rsi, 59
mov rdx, 10
mov rcx, 10
mov r8, 34
lea r9, [quine]
call _printf
mov rsp, rbp
leave
ret