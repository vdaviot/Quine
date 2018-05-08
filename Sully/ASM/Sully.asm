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
mov rdi, [Fd] ; fd
lea rsi, [Quine] ; Quine
mov rdx, r12 ; va_args
mov rcx, 10 ; \n
mov r8, 34
lea r9, [Quine]
call _fprintf
%endmacro

%macro SPRINTF 0
lea rdi, [File] ; buffer
lea rsi, [Filename] ; format
mov rdx, r12 ; int
call _sprintf
%endmacro

%macro FOPEN 0
lea rdi, [File]
lea rsi, [Mode]
call _fopen
mov qword [Fd], rax
%endmacro

%macro FCLOSE 0
mov rdi, Fd
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

%macro EXEC 0
lea rdi, [Command]
lea rsi, [Execute]
mov rdx, r12
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

_main:
	mov r12, 5
	push r12
	SPRINTF ; ecriture nom fichier
	FOPEN ; ouverture fichier
	FPRINTF ; ecriture Quine ; pb avec fd -> fprintf
	FCLOSE ; fermeture fichier
	OBJ ; link obj
	FORM ; formatting .o
	COMPIL ; exec
	pop r12
	mov rax, 0
	ret

SECTION .data

Fdp: db "DEBUG", 10, 0
Quine: db "SECTION .text%2$cglobal _main%2$c_main:%2$cpush rbp%2$cret%2$c", 0
Mode: db "w", 0
Nasm: db "/Users/vdaviot/homebrew/bin/nasm -f macho64 %s", 0
Compil: db "clang -Wall -Wextra -Werror %s.o -o %s", 0
Execute: db "./%s", 0
Filename: db "Sully_%d.asm", 0
Objectname: db "Sully_%d", 0
Object: times 512 db 0
File: times 512 db 0
Command: times 512 db 0

SECTION .bss
	Fd: resb 1
