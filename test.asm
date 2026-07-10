section .data
    ; Task 1: Values used for the calculation
    ; var1 = 4, var2 = 1, var3 = 3
    ; result = (4 + 2) / (3 - 1) = 6 / 2 = 3
    var1 dd 4
    var2 dd 1
    var3 dd 3
    result dd 0
    char_out db 0, 10    ; Buffer to hold ASCII char and newline

section .text
    global _start

_start:
    ; Calculate numerator: (var1 + 2)
    mov eax, [var1]
    add eax, 2          ; EAX = var1 + 2 = 6

    ; Calculate denominator: (var3 - var2)
    mov ebx, [var3]
    sub ebx, [var2]     ; EBX = var3 - var2 = 2

    ; Division: EDX:EAX / EBX
    cdq                 ; Sign-extend EAX into EDX before division
    idiv ebx            ; EAX = quotient (result), EDX = remainder

    mov [result], eax   ; Store quotient in result

    ; Task 2: Display result variable on console screen (ASCII representation)
    add eax, '0'        ; Convert single-digit integer to its ASCII character
    mov [char_out], al  ; Move ASCII character to output buffer

    mov eax, 4          ; sys_write system call
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, char_out   ; Pointer to message
    mov edx, 2          ; Length of message (character + newline)
    int 0x80            ; Call kernel

    ; Exit program
    mov eax, 1          ; sys_exit system call
    xor ebx, ebx        ; Return code 0
    int 0x80            ; Call kernel
