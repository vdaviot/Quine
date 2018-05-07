SECTION .text
	global _main
	extern _sprintf
	extern _fprintf
	extern _printf
	extern _fopen
	extern _fclose
	extern _system
	default rel

%macro FPRINTF 0
mov rdi, [Fd] ; fd
lea rsi, [Quine] ; quine
mov rdx, r12 ; va_args
mov rcx, 10
call _fprintf
%endmacro

%macro SPRINTF 2
lea rdi, [File] ; buffer
lea rsi, [Filename] ; format
mov rdx, r12 ; int
call _sprintf
%endmacro

%macro FOPEN 0
lea rdi, [File]
lea rsi, [Mode]
call _fopen
mov [Fd], rax
%endmacro

%macro FCLOSE 0
lea rdi, [Fd]
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
	sub rsp, 16
	mov r12, 5
	push r12
	SPRINTF ; ecriture nom fichier
	FOPEN ; ouverture fichier
	FPRINTF ; ecriture Quine
	FCLOSE ; fermeture fichier
	OBJ ; link obj
	FORM ; formatting .o
	COMPIL ; exec
	add rsp, 8
	mov rax, 0
	leave
	ret

SECTION .data

Quine: db ">Sully_%1$d.asm%2$c", 10, 0
Mode: db "w", 0
Nasm: db "/Users/vdaviot/homebrew/bin/nasm -f macho64 %s", 0
Compil: db "clang -Wall -Wextra -Werror %s -o %s", 0
Execute: db "./%s", 0
Filename: db "Sully_%d.asm", 0
Objectname: db "Sully_%d.o", 0
Object: times 512 db 0
File: times 512 db 0
Command: times 512 db 0

SECTION .bss
	Fd: resb 1
