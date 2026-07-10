section .data
    number dd 7

    odd_msg db "odd number", 10
    odd_len equ $ - odd_msg

    even_msg db "even number", 10
    even_len equ $ - even_msg

section .text
    global _start

_start:
    ; Divide the number by 2
    mov eax, [number]
    cdq
    mov ebx, 2
    idiv ebx

    ; Check the remainder in EDX
    cmp edx, 0
    je even_number

odd_number:
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, odd_len
    int 0x80
    jmp exit_program

even_number:
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, even_len
    int 0x80

exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
