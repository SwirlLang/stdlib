[BITS 64]

section .text
    extern GetFileInformationByHandle:
    global windows_x64_fstat:

; bool windows_x64_fstat(void *hFile, BY_HANDLE_FILE_INFORMATION *lpFileInformation);
align 16, int3
windows_x64_fstat:
    jmp near GetFileInformationByHandle
    int3