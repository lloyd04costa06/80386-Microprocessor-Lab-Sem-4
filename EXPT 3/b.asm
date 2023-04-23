
section .bss
	num1 resb 9


section .data

	sys_out equ 4 ;To output
	sys_in equ 3 ;To Input

	stdout equ 1 ;Stdout
	stdin equ 2 ;Stdins

	p1 db 'ENTER A NUMBER: '
	p1L equ $-p1

	p2 db 'INCREMENT = '
	p2L equ $-p2


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


  mov eax,[num1]
	inc eax
  mov[num1],eax
	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p2
	mov edx, p2L
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, num1
	mov edx, 9
	int 80h

  mov eax,[num1]
  inc eax
  mov[num1],eax
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, p2
  mov edx, p2L
  int 80h

  mov eax, sys_out
  mov ebx, stdout
  mov ecx, num1
  mov edx, 9
  int 80h

  mov eax,[num1]
  inc eax
  mov[num1],eax
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, p2
  mov edx, p2L
  int 80h

  mov eax, sys_out
  mov ebx, stdout
  mov ecx, num1
  mov edx, 9
  int 80h

  mov eax,[num1]
  inc eax
  mov[num1],eax
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, p2
  mov edx, p2L
  int 80h

  mov eax, sys_out
  mov ebx, stdout
  mov ecx, num1
  mov edx, 9
  int 80h


	mov eax, 1
	mov ebx, 0
	int 80h
