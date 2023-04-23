section .data
	sys_exit equ 1
	stdin2 equ 0

	sys_write equ 4
	sys_read equ 3
	stdin equ 2
	stdout equ 1
	
	rec db '***RECTANGLE***',10
	rec1 equ $-rec
	
	tri db '***TRIANGLE***',10
	tri1 equ $-tri

	mss1 db 'ENTER LENGTH: '
	len1 equ $-mss1
	
	mss2 db 'ENTER BREADTH: '
	len2 equ $-mss2
	
	mss3 db 'AREA OF RECTANGLE: '
	len3 equ $-mss3
	
	mss4 db 'PERIMETER OF RECTANGLE: '
	len4 equ $-mss4
	
	mss5 db 'ENTER HEIGHT: '
	len5 equ $-mss5

	mss66 db 'ENTER LENGTH C: '
	len66 equ $-mss66
	
	mss6 db 'PERIMETER OF TRIANGLE: '
	len6 equ $-mss6
	
	mss7 db 'AREA OF TRIANGLE: '
	len7 equ $-mss7
	
	nextline db' ',10
	lenn equ $-nextline


section .bss
	num1 resb 9
	num2 resb 9
	num3 resb 9
	num4 resb 9
	result resb 10
	result1 resb 10

section .text
	global _start:

	_start:
	
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,rec
	mov edx,rec1
	int 80h
	
	mov eax,sys_write	;num1
	mov ebx,stdout
	mov ecx,mss1
	mov edx,len1
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num1
	mov edx,9
	int 80h

	mov eax,sys_write	;num2
	mov ebx,stdout
	mov ecx,mss2
	mov edx,len2
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num2
	mov edx,9
	int 80h
	
	
	;-----------------------------------------			
	mov al,[num1] 		;Rectangle's Area
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	mul bl
	add ax, '0'
	mov[result],ax
	;-----------------------------------------
	
	
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, mss3
	mov edx, len3
	int 80h
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, result
	mov edx, 10
	int 80h
	
	;--------------------------------------
	mov eax,[num1]   ;Rectangle's perimeter
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'
	add eax,ebx
	add eax, '0'
	mov[result1],eax
	
	mov al,[result1]
	sub al,'0'
	mov bl,'2'
	sub bl,'0'
	mul bl
	add ax, '0'
	mov[result],ax
	;--------------------------------------
	
	
	
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	mov eax,sys_write	;Next Line
	mov ebx, stdout
	mov ecx, nextline
	mov edx, lenn
	int 80h
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, mss4
	mov edx, len4
	int 80h
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, result
	mov edx, 10
	int 80h
	
	
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	mov eax,sys_write	;Next Line
	mov ebx, stdout
	mov ecx, nextline
	mov edx, lenn
	int 80h
	mov eax,sys_write	
	mov ebx, stdout
	mov ecx, nextline
	mov edx, lenn
	int 80h
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
	
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,tri
	mov edx,tri1
	int 80h
	
	mov eax,sys_write	;num1
	mov ebx,stdout
	mov ecx,mss1
	mov edx,len1
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num1
	mov edx,9
	int 80h

	mov eax,sys_write	;num2
	mov ebx,stdout
	mov ecx,mss2
	mov edx,len2
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num2
	mov edx,9
	int 80h
	
	mov eax,sys_write	;num3
	mov ebx,stdout
	mov ecx,mss5
	mov edx,len5
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num3
	mov edx,9
	int 80h

	mov eax,sys_write	;num4
	mov ebx,stdout
	mov ecx,mss66
	mov edx,len66
	int 80h
	
	mov eax,sys_read
	mov ebx,stdin
	mov ecx,num4
	mov edx,9
	int 80h
	
	;-----------------------------------------			
	mov al,[num1]	;perimeter of triangle
	sub al,'0'
	mov bl,[num2]	;perimeter of triangle
	sub bl,'0'
	add al,bl
	mov cl,[num4]
	sub cl,'0'
	add al,cl
	add al,'0'
	mov [result],al
	;-----------------------------------------

	mov eax,sys_write
	mov ebx, stdout
	mov ecx, mss6
	mov edx, len6
	int 80h
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, result
	mov edx, 10
	int 80h
	
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	mov eax,sys_write	;Next Line
	mov ebx, stdout
	mov ecx, nextline
	mov edx, lenn
	int 80h
	;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	
	
	;-----------------------------------------			
	mov al,[num1]	;Area of triangle
	sub al,'0'
	mov bl,[num2]
	sub bl,'0'
	mul bl
	add ax,'0'
	mov [result],ax
	mov al,[result]
	sub al,'0'
	mov bl,'2'
	sub bl,'0'
	div bl
	add al,'0'
	mov [result],al
	;-----------------------------------------
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, mss7
	mov edx, len7
	int 80h
	
	mov eax,sys_write
	mov ebx, stdout
	mov ecx, result1
	mov edx, 10
	int 80h
	
	
	mov eax, 1
	mov ebx, 0
	int 80h


	
	
	
	
	

