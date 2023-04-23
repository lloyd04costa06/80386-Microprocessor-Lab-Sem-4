
%macro print 2
mov eax,sys_out
mov ebx,stdout
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro input 2
mov eax,sys_in
mov ebx,stdin
mov ecx,%1
mov edx,%2
int 80h
%endmacro

section .bss
	num1 resb 9
	num2 resb 9
	result resb 9


section .data
	sys_out equ 4 ;To output
	sys_in equ 3 ;To Input

	stdout equ 1 ;Stdout
	stdin equ 2 ;Stdins

	p1 db 'ENTER THE FIRST NUMBER: '
	p1L equ $-p1

	p2 db 'ENTER THE SECOND NUMBER: '
	p2L equ $-p2

	p3 db 'SUB= '
	p3L equ $-p3


section .text

global _start:
_start:

print p1,p1L
input num1,9

print p2,p2L
input num2,9

mov esi,2
mov ecx,3   ;3 digits
clc

sub_loop:
  mov al,[num1+esi]   ;from num1 address location mov 2 places ahead (since esi==2)
  sbb al,[num2+esi]  ;substract with borrow
  aas                 ;Adjust after substraction
  pushf
  or al,30h
  popf

  mov [result+esi],al
  dec esi         ;decrement
  loop sub_loop

print p3,p3L
print result,9

mov eax,1
mov ebx,0
int 80h
