input:
	mov eax,3
	mov ebx,2
	ret

print:
	mov eax,4
	mov ebx,1
	ret

factorial:
	mov al,'1'
	mov cl,'1'
	fact:
		cmp cl,byte[n]
		jg display

    sub al,'0'  ;Multiplication
  	mov bl,cl
  	sub bl,'0'
  	mul bl
  	add al,'0'

		inc cl
		jmp fact

	display:
		mov [n],al
		call print
		mov ecx,n
		mov edx,8
		int 80h
	ret

section .data
	msg1 db 'ENTER A NUMBER: '
	len1 equ $-msg1

	msg2 db 10,'THE FACTORIAL: '
	len2 equ $-msg2


section .bss
	n resb 9

section .text
	global _start:

	_start:
	call print
	mov ecx,msg1
	mov edx,len1
	int 80h
	call input
	mov ecx,n
	mov edx,8
	int 80h

	call print
	mov ecx,msg2
	mov edx,len2
	int 80h
	call factorial

	exit:
	mov eax,1
	mov ebx,0
	int 80h
