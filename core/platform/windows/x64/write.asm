[BITS 64]

section .text
    extern GetStdHandle:
    extern WriteFile:
    global windows_x64_write:
    global windows_x64_write_stdout_singleThread:

align 16, int3
; bool windows_x64_write(
;   void *hFile, 
;   const void *lpBuffer,
;   uint32_t nNumberOfBytesToWrite,
;   uint32_t *lpNumberOfBytesWritten,
;   OVERLAPPED *lpOverlapped
; );
windows_x64_write:
    jmp near WriteFile
    int3

align 16, int3
; bool windows_x64_write_stdout_singleThread(
;   const void *lpBuffer,
;   uint32_t nNumberOfBytesToWrite,
;   uint32_t *lpNumberOfBytesWritten,
; );
windows_x64_write_stdout_singleThread:
    push r8
    push rdx
    push rcx

    mov ecx, -11
    sub rsp, 32
    call GetStdHandle

    mov rcx, rax
    xor eax, eax
    mov rdx, [rsp + 32]
    mov r8, [rsp + 40]
    mov r9, [rsp + 48]
    mov [rsp + 32], rax
    call WriteFile

    add rsp, 56
    ret
    int3