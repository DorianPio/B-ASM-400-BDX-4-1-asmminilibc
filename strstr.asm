; Assembly memmove
; Dorian PIO
; Epitech 2024
; Bordeaux


bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global strstr                   ; strstr function declaration

strstr:
    xor rbx, rbx                ; set an index to 0
    jmp .loop

.incr:
    inc rbx                     ; inc ebx

.loop:
    mov r8, rbx                 ; copy index to r8
    xor rcx, rcx                ; set an new index to 0
    jmp .second_loop

.add_incr:
    inc r8                      ; inc r8
    inc rcx                     ; inc rcx


.second_loop:
    mov dl, BYTE [rsi + rcx]    ; mov str2[index] to dl
    cmp dl, 0                   ; dl == 0 ?
    je .no_null_end             ; true go to no_null_end
    mov al, BYTE [rdi + r8]     ; move str1[index2] to al
    cmp al, 0                   ; al == 0 ?
    je .quit_null               ; true go to quit_null
    cmp al, dl                  ; al == dl ?
    je .add_incr                ; true go to add_incr
    jmp .incr


.quit_null:
    xor rax, rax                ; return value to null
    jmp .quit                   ; go quit

.no_null_end:
    mov rax, rdi                ; return value to rdi
    add rax, rbx                ; add rax o return value

.quit:
    ret    