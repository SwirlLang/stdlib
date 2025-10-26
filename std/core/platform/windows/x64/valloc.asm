[BITS 64]

section .text
    extern VirtualAlloc
    extern VirtualFree
    global windows_x64_valloc:
    global windows_x64_vfree:

align 16, int3
; void *windows_x64_valloc(void *lpAddress, size_t dwSize, uint32_t flAllocationType, uint32_t flProtect);
windows_x64_valloc:
    jmp near VirtualAlloc
    int3

align 16, int3
; bool windows_x64_vfree(void *lpAddress, size_t dwSize, uint32_t dwFreeType);
windows_x64_vfree:
    jmp near VirtualFree
    int3