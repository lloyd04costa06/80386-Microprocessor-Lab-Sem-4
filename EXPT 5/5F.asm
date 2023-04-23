%macro print 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro input 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro fib 0
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
%endmacro

section .data
	msg1 db 'ENTER THE VALUE OF N (1-9): '
	len1 equ $-msg1	

	msg2 db 10,'FIBONACCI SERIES: '
	len2 equ $-msg2
	
	nextline db 10

section .bss
	n resd 9
	a resb 9
	b resb 9
	cnt resb 9

section .text
	global _start:

	_start:
	print msg1,len1
	input n,9
	
	print msg2,len2
	mov al,'0'
	mov [a],al
	mov al,'1'
	mov [b],al
	
	cmp byte[n],'0' 	;N=0
	jle exit
	print a,9		;N>=1
	cmp byte[n],'2'		
	jl exit
	print b,9		;N>=2
	cmp byte[n],'3'		
	jl exit
	mov al,'2'		;LOOP COUNTER INITIALIZED TO 2
	mov [cnt],al
	
	fibo:
		fib 
		je exit
		jmp fibo
	
	exit:
	print nextline,1
	mov eax,1
	mov ebx,0
	int 80h
