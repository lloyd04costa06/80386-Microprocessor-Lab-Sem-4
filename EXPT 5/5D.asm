%macro read 4

	mov eax,4    ;Input 1
	mov ebx,1
	mov ecx,mss1
	mov edx,len1
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h

	mov eax,4  ;Input 2
	mov ebx,1
	mov ecx,mss2
	mov edx,len2
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,%3
	mov edx,%4
	int 80h
%endmacro

section .data
	mss1 db 'ENTER FIRST NUMBER: '
	len1 equ $-mss1

	mss2 db 'ENTER SECOND NUMBER: '
	len2 equ $-mss2

 	mss3 db 'THE NUMBERS YOU ENTERED ARE',10
 	len3 equ $-mss3

section .bss
	num1 resb 9
	num2 resb 9

section .text
	global _start:
	_start:

	read num1,9,num2,9


	mov eax,4
	mov ebx,1
	mov ecx,mss3
	mov edx,len3
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,9
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,num2
	mov edx,9
	int 80h



	mov eax,1
	mov ebx,0
	int 80h
