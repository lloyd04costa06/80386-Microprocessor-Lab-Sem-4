%macro printer 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h

%endmacro

section .bss
	count resw 9

section .data

	my_name db 'LLOYD ALRICH COSTA',10
	len1 equ $-my_name

section .text

	global _start:


	_start:

	mov al,'0'
	mov [count],al



	loop:
	printer my_name,len1
	inc word[count]
	mov al,[count]
	cmp al,'7'
	jl loop
	jg exit


	exit:
	mov eax,1
	mov ebx,0
	int 80h
