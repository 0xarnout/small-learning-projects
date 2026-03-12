; This program has a random exit code that ranges from 0 to 15

bits 64

section .text

global _start

_start:
  push 0 ; this will be used as buffer for the random byte

  mov rax, 318 ; sys_getrandom
  lea rdi, [rsp] ; store random number on the stack
  mov rsi, 1 ; 1 byte of random data
  mov rdx, 0 ; no flags
  syscall

  mov rax, 60 ; sys_exit
  pop rdi ; pop random byte from stack
  and rdi, 0xf ; random number of 0-15
  syscall
