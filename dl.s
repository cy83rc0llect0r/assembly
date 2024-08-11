.data
url: .asciz "1.2.3.4"
path: .asciz "/file.txt"
http_request: .asciz "GET /file.txt HTTP/1.1\r\nHost: 1.2.3.4\r\nUser-Agent: curl/7.81.0\r\nAccept: */*\r\nConnection: close\r\n\r\n"
ip_address: .byte 1, 2, 3, 4

.bss
buffer: .space 4096

.text
.global _start

_start:
    mov $41, %rax
    mov $2, %rdi
    mov $1, %rsi
    mov $6, %rdx
    syscall

    test %rax, %rax
    js _exit

    mov %rax, %rdi

    mov $42, %rax
    lea sockaddr(%rip), %rsi
    mov $16, %rdx
    syscall

    test %rax, %rax
    js _exit

    mov $44, %rax
    lea http_request(%rip), %rsi
    mov $4096, %rdx
    syscall

    test %rax, %rax
    js _exit

    mov $45, %rax
    lea buffer(%rip), %rsi
    mov $4096, %rdx
    syscall

    test %rax, %rax
    jle _exit

    mov %rax, %rdx

    mov $1, %rax
    mov $1, %rdi
    lea buffer(%rip), %rsi
    syscall

_exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data
sockaddr:
    .word 2
    .word 0x5000
    .byte 1, 2, 3, 4
    .byte 0, 0, 0, 0, 0, 0, 0, 0
