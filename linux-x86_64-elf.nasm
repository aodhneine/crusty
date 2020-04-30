%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1

section .text
global _start
_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, buffer_size
    syscall

    mov rax, SYS_EXIT
    mov rdi, 0
    syscall

section .data
buffer: db "Rust in 2020 KEKW", 10
buffer_size: equ $-buffer
