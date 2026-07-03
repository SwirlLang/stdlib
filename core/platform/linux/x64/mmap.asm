[BITS 64]

section .text
    global linux_x64_mmap:function
    global linux_x64_munmap:function

align 16, int3
; void *linux_x64_mmap(void addr[.length], size_t length, int prot, int flags, int fd, off_t offset);
linux_x64_mmap:
    mov eax, 9
    mov r10, rcx
    syscall
    ret
    int3

align 16, int3
; int linux_x64_munmap(void addr[.length], size_t length);
linux_x64_munmap:
    mov eax, 11
    syscall
    ret
    int3