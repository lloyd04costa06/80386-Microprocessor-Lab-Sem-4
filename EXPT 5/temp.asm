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
%endmacro

section .bss
  n resb 9
  a resb 9
  b resb 9
  c resb 9
  count resw 9

section .data
  mss1 db 'ENTER VALUE OF N (1-9): '
  len1 equ $-mss1

  mss2 db 'FIBONACCI SERIES: '
  len2 equ $-mss2

  section .text
     global _start:
     _start:
     write mss1,len1
     read n,9

	mov eax,[n]
     sub eax,'0'
     mov ebx,'1'
     sub ebx,'0'
     cmp eax,ebx
     je print0

     



     

     

     mov eax,[n]
     sub eax,'0'
     mov ebx,'2'
     sub ebx,'0'
     cmp eax,ebx
     je print01
     jg print012

     next1:
     mov byte[a],'0'
     mov byte[b],'1'
     mov word[count],'2'

	print0:
     write '0',1
     jmp next1

     print01:
     write '0',1
     write '1',1
     jmp exit

     print012:
     write '0',1
     write '1',1
     jmp next1

     exit:
     mov eax,1
   	mov ebx,0
   	int 80h
