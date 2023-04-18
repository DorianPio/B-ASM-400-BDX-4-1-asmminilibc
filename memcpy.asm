; Assembly memcpy
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global memcpy               ; memcpy function declaration

memcpy:
    xor ecx, ecx            ; Init counter to 0
    cmp rdx, 0              ; Check if arg3 == 0
    je .final_value         ; if true go to quitt programm
    jmp .loop               ; go to the loop

.loop:
    movsx rcx, ecx          ; Convert ecx to rcx
    cmp rdx, rcx            ; Compare if arg3 == counter
    je .final_value         ; If true go to quitt programm
    mov r8b, [rsi + rcx]    ; 
    mov [rdi + rcx], r8b    ;
    inc ecx                 ; add 1 to counter
    jmp .loop               ; reloop

.final_value:
    mov rax, rdi            ; move value on the stack
    ret                     ; return value on the stack