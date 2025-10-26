[BITS 64]

section .text
    global linux_x64_write:function
    global linux_x64_write_stdout:function

align 16, int3
; ssize_t linux_x64_write(int fd, const void buf[.count], size_t count);
linux_x64_write:
    mov eax, 1
    syscall
    ret
    int3

align 16, int3
; ssize_t linux_x64_write_stdout(const void buf[.count], size_t count);
linux_x64_write_stdout:
    mov eax, 1
    mov rdx, rsi
    mov rsi, rdi
    mov edi, eax
    syscall
    ret
    int3