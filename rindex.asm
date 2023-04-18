; Assembly memmove
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global rindex                   ; rindex function declaration

rindex:
    xor ecx, ecx                ; set index to 0
    jmp .prepare_prog

.add_incr:
    inc ecx

.prepare_prog:
    movsx rcx, ecx              ; convert ecx to rcx
    mov dl, BYTE [rdi + rcx]    ; mov str[index] to dl
    cmp dl, 0                   ; end of str ?
    jne .add_incr               ; false ? go to add_incr
    jmp .loop

.sub_incr:
    cmp rcx, 0                  ; check if the start
    je .quit_null               ; true ? go to quit_null
    dec ecx

.loop:
    movsx rcx, ecx              ; convert ecx to rcx
    movsx edx, BYTE [rdi + rcx] ; convert str[index] to edx
    cmp edx, esi                ; edx == esi ?
    jne .sub_incr               ; false ? go to sub_incr
    mov rax, rdi                ; set return value
    add rax, rcx                ; add index to return value
    jmp .quit

.quit_null:
    xor rax, rax                ;set return to Null

.quit:
    ret