[BITS 64]

section .text
    global linux_x64_read:function
    ; global linux_x64_read_stdin:function

align 16, int3
; ssize_t linux_x64_read(int fd = 0, void buf[.count], size_t count);
linux_x64_read:
    xor eax, eax
    syscall
    ret
    int3