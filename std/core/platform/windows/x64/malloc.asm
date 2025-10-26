[BITS 64]

section .text
    extern GetProcessHeap:
    extern HeapAlloc:
    extern HeapFree:
    global windows_x64_getHeapHandle:
    global windows_x64_malloc:
    global windows_x64_malloc_heapSpecific:
    global windows_x64_mfree:

align 16, int3
; void *windows_x64_getHeapHandle();
windows_x64_getHeapHandle:
    jmp near GetProcessHeap
    int3

align 16, int3
; void *windows_x64_malloc_heapSpecific(void *hHeap, uint32_t dwFlags, size_t dwBytes);
windows_x64_malloc_heapSpecific:
    jmp near HeapAlloc
    int3

align 16, int3
; void *windows_x64_malloc(uint32_t dwFlags, size_t dwBytes);
windows_x64_malloc:
    sub rsp, 56
    mov [rsp + 32], rcx
    mov [rsp + 40], rdx
    call GetProcessHeap

    test rax, rax
    je short .return ; return nullptr on failure

    mov rdx, [rsp + 32]
    mov r8,  [rsp + 40]
    mov rcx, rax
    call HeapAlloc

.return:
    add rsp, 56
    ret
    int3

align 16, int3
; bool windows_x64_mfree(void *hHeap, uint32_t dwFlags, void *lpMem);
windows_x64_mfree:
    jmp near HeapFree
    int3