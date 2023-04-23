%macro print 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	num1 db '2022'


section .text
	global _start:
	_start:
	print num1,4

	mov eax,1
	mov ebx,0
	int 80h
