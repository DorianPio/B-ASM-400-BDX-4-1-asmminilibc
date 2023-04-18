; Assembly memset
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global memset               ; memset function declaration

memset:
    xor ecx, ecx            ; Declare counter to 0
    jmp .loop               ; go to the loop

.add_incr:
    inc ecx

.loop:
    movsx rcx, ecx          ; convert ecx to rcx
    cmp rcx, rdx            ; compare if ecx == arg[3]
    je .final_value         ; true go return value
    mov byte[rdi + rcx], sil; arg[i] = arg2
    jmp .add_incr           ; incr ecx 

.final_value:
    mov rax, rdi            ; move pointer return in rax
    ret                     ; return value