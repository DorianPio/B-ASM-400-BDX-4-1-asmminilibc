; Assembly strcspn
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global strcspn              ; strcspn function declaration

strcspn:
    xor ebx, ebx            ; set ebx to 0
    jmp .loop               ; go to loop

.add_incr:
    inc ebx

.loop:
    movsx rbx, ebx           ; convert ebx to rbx
    mov al, BYTE [rdi + rbx] ; mov str1[index] to al
    cmp al, 0                ; al == 0 ?
    je .quit                 ; true ? go to quit
    xor ecx, ecx             ; set ecx to 0
    jmp .second_loop

.add_incr_ecx:
    inc ecx

.second_loop:
    movsx rcx, ecx            ; convert ecx to rcx
    mov dl, BYTE [rsi + rcx]  ; mov str2[index2] to dl
    cmp dl, 0                 ; dl == 0 ?
    je .add_incr              ; true ? increment
    cmp al, dl                ; al == dl ?
    je .quit                  ; true ? go to quit
    jmp .add_incr_ecx

.quit:
    mov rax, rbx              ; set return value
    ret