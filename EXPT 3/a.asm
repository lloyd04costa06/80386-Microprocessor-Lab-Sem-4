
section .bss
	num1 resb 9
	num2 resb 9
	num3 resb 9
	result resb 10

section .data

	sys_out equ 4 ;To output
	sys_in equ 3 ;To Input

	stdout equ 1 ;Stdout
	stdin equ 2 ;Stdins

	p1 db 'ENTER THE FIRST NUMBER: '
	p1L equ $-p1
	
	p2 db 'ENTER THE SECOND NUMBER: '
	p2L equ $-p2

	p3 db 'ENTER THE THIRD NUMBER: '
	p3L equ $-p3

	p4 db 'ADD= ' 
	p4L equ $-p4


section .text

	global _start
	_start:
	
	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p1
	mov edx, p1L
	int 80h

	mov eax, sys_in
	mov ebx, stdin
	mov ecx, num1
	mov edx, 9
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p2
	mov edx, p2L
	int 80h

	mov eax, sys_in
	mov ebx, stdin
	mov ecx, num2
	mov edx, 9
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p3
	mov edx, p3L
	int 80h

	mov eax, sys_in
	mov ebx, stdin
	mov ecx, num3
	mov edx, 9
	int 80h

	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	add eax,ebx
	mov ebx,[num3]
	sub ebx,'0'
	add eax,ebx
	add eax, '0'
	mov[result],eax
	
	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p3
	mov edx, p3L
	int 80h
	
	mov eax, sys_out
	mov ebx, stdout
	mov ecx, result
	mov edx, 9
	int 80h

	

	mov eax, 1
	mov ebx, 0
	int 80h




