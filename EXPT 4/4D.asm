section .bss
  num1 resb 9

section .data
  sys_out equ 4
  sys_in equ 3
  stdin equ 2
  stdout equ 1

  mss1 db 'ENTER A NUMBER: '
  ml1 equ $-mss1

  mss2 db 'NUMBER YOU ENTERED IS SMALLER THAN 5'
  ml2 equ $-mss2

  mss3 db 'NUMBER YOU ENTERED IS NOT SMALLER THAN 5'
  ml3 equ $-mss3

  mss4 db 'NUMBER YOU ENTERED IS EQUAL TO 5'
  ml4 equ $-mss4

section .text
  global _start:

  case1:
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, mss2
  mov edx, ml2
  int 80h
  jmp exit

  case2:
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, mss3
  mov edx, ml3
  int 80h
  jmp exit

  case3:
  mov eax, sys_out
  mov ebx, stdout
  mov ecx, mss4
  mov edx, ml4
  int 80h
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
  mov bl,'5'
  sub bl,'0'
  cmp al,bl
  jl case1
  jg case2
  je case3


  exit:
  mov eax, 1
  mov ebx, 0
  int 80h
