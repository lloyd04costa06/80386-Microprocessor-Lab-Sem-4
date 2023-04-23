section .data
	mss1 db "ENTER NUMBER OF ELEMENTS: "
	plen equ $-mss1
	mss2 db "ENTER THE ELEMENTS INTO YOUR ARRAY:",10
	p2len equ $-mss2
	mss3 db "SORTED ARRAY:",10
	p3len equ $-mss3
	mss4 db "PASS "
	p4len equ $-mss4
	mss5 db " -> "
	p5len equ $-mss5
	newline db 10
	space db ' '

section .bss
	n resb 4
	arr resb 10
	i resb 4
	j resb 9
	trash resb 1

%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro read 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
	mov eax,3
	mov ebx,2
	mov ecx,trash
	mov edx,1
	int 80h
%endmacro

section .text
	global _start

_start:
	write mss1,plen
	read n,1
	
	mov eax,'0'
	mov [j],eax

	call input
	call insertion_sort
	write mss3,p3len
	call display

	mov eax,1
	mov ebx,0
	int 80h

input:
	write mss2,p2len
	mov [i],dword '0'
loop1:
	mov esi,[i]
	cmp esi,[n]
	jge after1

	sub esi,'0'
	add esi,arr
	read esi,1

	inc dword[i]
	jmp loop1
after1:
	ret


display:
	write mss4,p4len
	write j,9
	write mss5,p5len
	mov [i],dword '0'
loop2:
	mov esi,[i]
	cmp esi,[n]
	jge after2

	sub esi,'0'
	add esi,arr
	write esi,1
	write space,1

	inc dword[i]
	jmp loop2
after2:
	write newline,1
	ret


insertion_sort:
	mov eax,1 		;al is counter for outer loop, initialise to 1
	mov bl,[n]		;bl=n
	sub bl,'0'
loop3:
	cmp al,bl		;repeat until al<n
	jge after3

	pushad
	call display
	popad

	mov ecx,0
	mov cl,al
	sub cl,1		;cl is counter for inner loop, initialise to al-1

	mov dl,[arr+eax]		;store arr[eax] in dl
loop4:
	cmp cl,0		;repeat until cl>=0 and...
	jl after4

	cmp dl,[arr+ecx]		;...dl<arr[cl]
	jge after4

	mov dh,[arr+ecx]
	mov [arr+ecx+1],dh	;arr[ecx], arr[ecx+1]

	dec ecx			;ecx--
	jmp loop4
after4:
	mov [arr+ecx+1],dl	;arr[ecx+1]=dl

	inc al			;al++
	inc byte[j]
	jmp loop3
after3:
	ret
