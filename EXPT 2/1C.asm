section .data

	mssg1 db 'HELLO WORLD',10
	mssg1Len equ $-mssg1

	mssg2 db 'HELLO USER',10
	mssg2Len equ $-mssg2
	
	sys_exit equ 1
	sys_write equ 4
	stdin equ 0
	stdout equ 1

section .text

	global _start

	_start:
	 mov eax, sys_write
	mov ebx, stdout
	mov ecx, mssg1
	mov edx, mssg1Len
	int 80h
	
	 mov eax, sys_write
	mov ebx, stdout
	mov ecx, mssg2
	mov edx, mssg2Len
	int 80h

	

	mov eax, sys_exit
	mov ebx, stdin
	int 80h
