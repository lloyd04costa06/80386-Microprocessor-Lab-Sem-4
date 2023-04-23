section .data
p1 db 'ENTER SIZE OF N: '
p1L equ $-p1

p2 db 'ENTER ELMENTS INTO YOUR ARRAY: '
p2L equ $-p2

p3 db 'ARRAY: '
p3L equ $-p3
	space db ' '
	pres db "Above 50 : "
	prl equ $-pres
	nres db "Below 50 : "
	nrl equ $-nres
	newline db 10

section .bss
	arr resb 10
	acount resb 1
	bcount resb 1
	dis_buffer resb 3
	ip_buffer resb 4
	size resb 4

%macro SYS_WRITE 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro SYS_READ 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .text
global _start

_start:
	SYS_WRITE p1,p1L
	SYS_READ size,2
	SYS_WRITE p3,p3L

	sub [size],dword '0'
	and [size],dword 000fh
	mov eax,arr
	mov edx,[size]
	call input

	mov eax,arr
	mov edx,[size]
	call abcount

	SYS_WRITE pres,prl
	mov bl,[acount]
	call print_bl

	SYS_WRITE newline,1

	SYS_WRITE nres,nrl
	mov bl,[bcount]
	call print_bl

	mov eax,1
	mov ebx,0
	int 80h


abcount:
;; eax should contain address of array
;; edx should contain size of array
;; stores values in acount and bcount variables
	mov [acount],byte 0
	mov [bcount],byte 0
	mov ecx,0
repeat_abcount:
	cmp ecx,edx
	jge after_abcount

	mov bl,[eax+ecx]

	cmp bl,50
	jl below
	jg above
	jmp after_ba
below:
	inc byte[bcount]
	jmp after_ba
above:
	inc byte[acount]
after_ba:
	inc ecx
	jmp repeat_abcount
after_abcount:
	ret



input:
;; eax should contain address of array
;; edx should contain size of array
;; scans bytes
	mov ecx,0
repeat_input:
	cmp ecx,edx
	jge after_input
prom:
	mov ebx,eax
	add ebx,ecx
	mov esi,ebx
	pushad
	call scan_esi
	popad
	inc ecx
	jmp repeat_input
after_input:

	ret


print_bl:
;; bl should contain value to be printed
	mov ecx,3
	mov esi,2
	mov al,bl
print_bl_loop:
	mov ah,0
	mov dl,10
	div dl
	add ah,'0'
	mov [dis_buffer+esi],ah
	dec esi
	loop print_bl_loop

	mov eax,4
	mov ebx,1
	mov ecx,dis_buffer
	mov edx,3
	int 80h

	ret


scan_esi:
;; esi should contain address of value to be scanned
	mov eax,3
	mov ebx,2
	mov ecx,ip_buffer
	mov edx,4
	int 80h

	mov al,0
	mov ecx,0
scan_esi_loop:
	cmp ecx,dword 3
	jge after_scan_esi

	cmp byte [ip_buffer+ecx],10
	je after_scan_esi

	mov bl,10
	mul bl			;al=al*10
	mov bl,[ip_buffer+ecx]
	sub bl,'0'		;bl= digit
	add al,bl		;al=al+bl

	inc ecx
	jmp scan_esi_loop
after_scan_esi:
	mov [esi],al

	ret
