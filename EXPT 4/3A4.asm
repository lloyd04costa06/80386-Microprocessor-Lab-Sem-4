section .data
	sys_exit equ 1
	stdin2 equ 0

	sys_write equ 4
	sys_read equ 3
	stdin equ 2
	stdout equ 1
	
	msg1 db 'Enter the number: ',10
	len1 equ $-msg1	

	msg2 db 'The result is ',10
	len2 equ $-msg2

section .bss
	num1 resb 10
	num2 resb 10
	result1 resb 10
	result2 resb 10

section .text
	global _start:

	_start:
	mov eax,sys_write	;num1
	mov ebx,stdout
	mov ecx,msg1
	mov edx,len1
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num1
	mov edx,9
	int 80h

	mov eax,sys_write	;num2
	mov ebx,stdout
	mov ecx,msg1
	mov edx,len1
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num2
	mov edx,9
	int 80h
	
	mov al,[num1]
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	div bl
	add al,'0'
	add ah,'0'
	mov [result1],al
	mov [result2],ah ;remainder

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,msg2
	mov edx,len2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,result1
	mov edx,10
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,result2
	mov edx,10
	int 80h
	
	mov eax,sys_exit
	mov ebx,stdin2
	int 80h
