section .data

	sys_exit equ 1
	sys_write equ 4
	stdout equ 0

	name db 'GCE GOA',10
	nameL equ $-name

section .text
	global _start
	_start:
	 mov eax, sys_write
	mov ebx, stdout
	mov ecx, name
	mov edx, nameL
	int 80h
	
	mov[name], dword 'GEC '

	mov eax, sys_write
	mov ebx, stdout
	mov ecx, name
	mov edx, nameL
	int 80h

	mov eax, sys_exit
	mov ebx, stdout
	int 80h
	
	
