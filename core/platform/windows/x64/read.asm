[BITS 64]

section .text
    extern GetStdHandle:
    extern ReadFile:
    global windows_x64_read:
    global windows_x64_read_stdin:

align 16, int3
; bool windows_x64_read(
;   void *hFile,
;   void *lpBuffer,
;   uint32_t nNumberOfBytesToRead,
;   uint32_t *lpNumberOfBytesRead,
;   OVERLAPPED *lpOverlapped
; );
windows_x64_read:
    jmp near ReadFile
    int3

align 16, int3
; bool windows_x64_read_stdin_singleThread(
;   void *lpBuffer,
;   uint32_t nNumberOfBytesRead,
;   uint32_t *lpNumberOfBytesRead
; );
windows_x64_read_stdin_singleThread:
    push r8
    push rdx
    push rcx

    mov ecx, -10
    sub rsp, 32
    call GetStdHandle

    mov rcx, rax
    xor eax, eax
    mov rdx, [rsp + 32]
    mov r8,  [rsp + 40]
    mov r9,  [rsp + 48]
    mov [rsp + 32], rax
    call ReadFile

    add rsp, 56
    ret 
    int3
