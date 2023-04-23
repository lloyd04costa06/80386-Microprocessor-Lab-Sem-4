%macro read 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	mss1 db 'ENTER FIRST NUMBER: '
	len1 equ $-mss1

	mss2 db 'THE NUMBER YOU ENTERED IS: '
 	len2 equ $-mss2

section .bss
	num1 resb 9
	
section .text
	global _start:
	_start:
	mov eax,4
	mov ebx,1
	mov ecx,mss1
	mov edx,len1
	int 80h
	read num1,9

	mov eax,4
	mov ebx,1
	mov ecx,mss2
	mov edx,len2
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,9
	int 80h

	
	mov eax,1
	mov ebx,0
	int 80h
	
