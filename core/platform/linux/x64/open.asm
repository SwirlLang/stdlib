[BITS 64]

section .text
    global linux_x64_open:function
    global linux_x64_openat:function

align 16, int3
; int linux_x64_open(const char *filename, uint32_t flags, uint32_t mode);
linux_x64_open:
    mov eax, 2
    syscall
    ret
    int3

align 16, int3
; int linux_x64_openat(unsigned int dfd, const char *filename, uint32_t flags, uint32_t mode)
linux_x64_openat:
    mov r10, rcx
    mov eax, 257
    syscall
    ret
    int3
