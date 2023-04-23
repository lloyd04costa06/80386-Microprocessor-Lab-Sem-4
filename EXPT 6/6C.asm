addition:
  mov eax,[num1]
  sub eax,'0'
  mov ebx,[num2]
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
ret

substraction:
	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	sub eax,ebx
	add eax, '0'
	mov[result],eax

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p4
	mov edx, p4L
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, result
	mov edx, 9
	int 80h
ret

multiply:
	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	mul bl
	add ax, '0'
	mov[result],ax

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p5
	mov edx, p5L
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, result
	mov edx, 9
	int 80h
ret

division:
	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	div bl
	add ah, '0'
	add al, '0'
	mov[result1],ah
	mov[result2],al


	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p6
	mov edx, p6L
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, result1
	mov edx, 9
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, p7
	mov edx, p7L
	int 80h

	mov eax, sys_out
	mov ebx, stdout
	mov ecx, result2
	mov edx, 9
	int 80h

ret

num_input:
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

ret



section .bss
	num1 resb 9
	num2 resb 9
	result resb 9
	result1 resb 9
	result2 resb 9

section .data
	sys_out equ 4 ;To output
	sys_in equ 3 ;To Input

	stdout equ 1 ;Stdout
	stdin equ 2 ;Stdins

	p1 db 'ENTER THE FIRST NUMBER: '
	p1L equ $-p1

	p2 db 'ENTER THE SECOND NUMBER: '
	p2L equ $-p2

	p3 db 'ADD= '
	p3L equ $-p3

	p4 db 10,'SUB= '
	p4L equ $-p4

	p5 db 10,'MUL= '
	p5L equ $-p5

	p6 db 10,'R= '
	p6L equ $-p6

	p7 db 9,'Q= '
	p7L equ $-p7

	nextline db ' ',10
	nl equ $-nextline


  section .text
  	global _start:
  	_start:

  	call num_input
  	call addition
  	call substraction
  	call multiply
  	call division


  	mov eax,1
  	mov ebx,0
  	int 80h
