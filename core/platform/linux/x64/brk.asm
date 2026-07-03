[BITS 64]

section .text
    global linux_x64_getHeapEnd:function
    global linux_x64_brk:function

align 16, int3
; void *linux_x64_getHeapEnd();
linux_x64_getHeapEnd:
    mov eax, 12
    xor edi, edi
    syscall
    ret
    int3

align 16, int3
; void *linux_x64_brk(void *addr);
linux_x64_brk:
    mov eax, 12
    syscall
    ret
    int3