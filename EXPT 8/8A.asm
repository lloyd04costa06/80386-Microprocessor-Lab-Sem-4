;Expt 8
;Aim: Working with arrays
;1) Write a program to enter elements into an array and then dispay the content of the array
;2) Write a program to count the number  of positive and negative numbers into the aray
;3) Write a programn to count the number of odd and even numbers
;4) Write a program to count numbers above 50

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

	section .data
	sys_out equ 4 ;To output
	sys_in equ 3 ;To Input

	stdout equ 1 ;Stdout
	stdin equ 2 ;Stdins

	p1 db 'ENTER SIZE OF N: '
	p1L equ $-p1

	p2 db 'ENTER ELMENTS INTO YOUR ARRAY: '
	p2L equ $-p2

	p3 db 'ARRAY: '
	p3L equ $-p3

	space db ' '
	spaceL equ $-space

	newline db ' '
	newlineL equ $-newline


	section .bss
	size resb 9
	arr resb 10
	dis_buffer resb 3
	ip_buffer resb 4


section _text:
global _start:
  _start:
  print p1,p1L
  input size,9
  print p2,p2L

  sub [size],dword '0'
  and [size],dword 000fh
  mov eax,arr
  mov edx,[size]
  call inputElArr

  print p3,p3L
  mov eax,arr
  mov edx,[size]
  call display

  mov eax,1
  mov ebx,0
  int 80h



  display:
  ;; eax should contain address of array
  ;; edx should contain size of array
  ;; prints bytes
  mov ecx,0
  repeat_display:
  cmp ecx,edx
  jge after_display

  mov bl,[eax+ecx]
  pushad
  call print_bl

  mov eax,4
  mov ebx,1
  mov ecx,space
  mov edx,spaceL
  int 80h

  popad
  inc ecx
  jmp repeat_display
  after_display:
  mov eax,4
  mov ebx,1
  mov ecx,newline
  mov edx,newlineL
  int 80h

  ret


inputElArr:
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
