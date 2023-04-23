%macro print 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

input:
	mov eax,3
	mov ebx,2
	mov ecx,n
	mov edx,9
	int 80h
retṇ

section .bss
n resd 9
a resb 9
b resb 9
cnt resb 9
section .text

fibonaaci:

	print msg1,len1
	call input
	print msg2,len2
	mov al,'0'
	mov [a],al
	mov al,'1'
	mov [b],al
	cmp byte[n],'0' ;N=0
	jle exit
	print a,9
	cmp byte[n],'2';N>=1
	jl exit
	print b,9

	cmp byte[n],'3'	;N>=2
	jl exit
	mov al,'2'	;LOOP COUNTER INITIALIZED TO  2
	mov [cnt],al
	fibo:
	mov eax,[a]
	sub eax,'0'
	mov ebx,[b]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	add ebx,'0'
	mov [a],ebx
	mov [b],eax
	print b,9
	inc byte[cnt]
	mov al,[cnt]
	cmp byte[n],al
	je exit
	jmp fibo
ret

section .data
	msg1 db 'ENTER THE VALUE OF N (1-9): '
	len1 equ $-msg1

	msg2 db 10,'FIBONACCI SERIES: '
	len2 equ $-msg2

	nextline db' ',10
	len3 equ $-nextline

section .text

	global _start:
	_start:

	call fibonaaci


	 exit:
	print nextline,1
	mov eax,1
	mov ebx,0
	int 80h
