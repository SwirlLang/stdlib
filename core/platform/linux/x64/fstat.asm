[BITS 64]

section .text
    global linux_x64_statx:function
    global linux_x64_fstatx:function

align 16, int3
; int linux_x64_statx(int dfd, const char *filename, unsigned flags, unsigned int mask, statx *buffer);
linux_x64_statx:
    mov eax, 332
    mov r10, rcx
    syscall
    ret
    int3

align 16, int3
; int linux_x64_fstatx(int dfd, unsigned flags, statx *buffer);
linux_x64_fstatx:
    push 0
    mov r8, rdx
    mov eax, 332
    mov edx, esi 
    mov r10d, 0x3ffff
    mov rsi, rsp
    or edx, 0x1000
    syscall
    pop rsi
    ret
    int3