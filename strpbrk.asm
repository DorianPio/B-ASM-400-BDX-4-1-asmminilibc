; Assembly strpbrk
; Dorian PIO
; Epitech 2024
; Bordeaux


bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global strpbrk                  ; strncmp function declaration

strpbrk:
    xor ebx, ebx                ;set ebx to 0
    jmp .loop

.add_incr:
    inc ebx

.loop:
    movsx rbx, ebx              ; convert ebx to rbx
    mov al, BYTE [rdi + rbx]    ; move str[i] into al
    cmp al, 0                   ; al == \0 ?
    je .quitt
    xor ecx, ecx                ; set ecx to 0
    jmp .second_loop

.add_incr_ecx:
    inc ecx

.second_loop:
    movsx rcx, ecx              ;convert ecx to rcx
    mov dl, BYTE[rsi + rcx]     ; put str2[i2] into al
    cmp dl, 0                   ; dl == 0 ?
    je .add_incr                ; true go to add_incr
    cmp al, dl                  ; al == dl ?
    je .no_null_end             ; true ? go to no_null_end
    jmp .add_incr_ecx

.quitt:
    mov rax, 0                  ; set rax to NULL
    ret

.no_null_end:
    movsx rbx, ebx              ; convert ebx to rbx
    mov rax, rdi                ; mov rdi in rax
    add rax, rbx                ; add rbx to rax
    ret