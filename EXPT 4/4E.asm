section .bss
  num1 resb 9
  temp resb 9

section .data
  sys_out equ 4
  sys_in equ 3
  stdin equ 2
  stdout equ 1

  mss1 db 'ENTER A NUMBER: '
  ml1 equ $-mss1

  mss2 db 'NUMBER YOU ENTERED IS ODD'
  ml2 equ $-mss2

  mss3 db 'NUMBER YOU ENTERED IS EVEN'
  ml3 equ $-mss3


section .text
  global _start:

  odd:
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, mss2
  mov edx, ml2
  int 80h
  jmp exit

  even:
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, mss3
  mov edx, ml3
  int 80h
  jmp exit

  jmp exit


  _start:

  ;******************     INPUT
  mov eax, sys_out        ;NUM1
  mov ebx, stdout
  mov ecx, mss1
  mov edx, ml1
  int 80h

  mov eax, sys_in
  mov ebx, stdin
  mov ecx, num1
  mov edx, 9
  int 80h

  ;******************

  mov al,[num1]
  sub al,'0'
  mov bl,'2'
  sub bl,'0'
  div bl
  add ah,'0'
  cmp ah,'0'
  je even
  jmp odd ;else its odd


  exit:
  mov eax, 1
  mov ebx, 0
  int 80h
