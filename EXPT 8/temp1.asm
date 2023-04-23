section .data
pres db "POSITIVE NUMBER COUNT: "
prl equ $-pres
nres db "NEGATIVE NUMBER COUNT: "
nrl equ $-nres

p1 db 'ENTER SIZE OF N: '
p1L equ $-p1

p2 db 'ENTER ELMENTS INTO YOUR ARRAY: '
p2L equ $-p2

newline db 10

section .bss
pcount resb 1
ncount resb 1
arr resb 10
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
%endmacr

section .text
global _start

_start:
SYS_WRITE p1,p1L
SYS_READ size,4

sub [size],dword '0'
and [size],dword 000fh
mov eax,arr
mov edx,[size]
call input
call pncount

SYS_WRITE pres,prl
mov bl,[pcount]
call print_bl

SYS_WRITE newline,1

SYS_WRITE nres,nrl
mov bl,[ncount]
call print_bl

mov eax,1
mov ebx,0
int 80h


pncount:
;; eax should contain address of array
;; edx should contain size of array
;; stores values in pcount and ncount variables
mov [pcount],byte 0
mov [ncount],byte 0
mov ecx,0
repeat_pncount:
cmp ecx,edx
jge after_pncount

mov bl,[eax+ecx]

cmp bl,0
jl negative
jg positive
jmp after_np
negative:
inc byte[ncount]
jmp after_np
positive:
inc byte[pcount]
after_np:
inc ecx
jmp repeat_pncount
after_pncount:
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

input:
	;; eax should contain address of array
	;; edx should contain size of array
	;; scans bytes
	mov ecx,0
repeat_input:
	cmp ecx,edx
	jge after_input

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
