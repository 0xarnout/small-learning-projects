.global _start
.intel_syntax noprefix

_start:
  // sys_umask
  mov rax, 95
  mov rdi, 0
  syscall

  // sys_open
  mov rax, 2
  lea rdi, [filename]
  mov rsi, 101
  mov rdx, 0666
  syscall

  // Store the fd in rdi for the next two syscalls
  mov rdi, rax

  // sys_write
  mov rax, 1
  lea rsi, [hello_world]
  mov rdx, 14
  syscall

  // sys_close
  mov rax, 3
  syscall

  // sys_exit
  mov rax, 60
  mov rdi, 0
  syscall

hello_world:
  .asciz "Hello, World!\n"

filename:
  .asciz "file.txt"
