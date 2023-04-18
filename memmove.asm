; Assembly memmove
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global memmove                  ; memmove function declaration


memmove:
    cmp rdx, 0                  ; compare size == 0
    je .quit                    ; if true go quit
    xor ecx, ecx               ; init a i to 0
    jmp .value

.add_incr:
    inc ecx

.value:
    movsx rcx, ecx              ; convert ecx to rcx
    cmp rcx, rdx                ; i == size ?
    je .dest_value              ; go to dest_value
    movsx rbx, BYTE [rsi + rcx] ; set rbx to src[rbx]
    push rbx                    ; put rbx on the stack
    jmp .add_incr

.dest_value:
    movsx rcx, ecx              ; convert ecx to rcx
    dec ecx                     ; decrement index
    pop rbx                     ; delete rbx from the stack
    mov BYTE [rdi + rcx], bl    ; set dest[rcx] to bl char
    cmp rcx, 0                  ; index == 0 ?
    je .quit                    ; if true go quit
    jmp .dest_value

.quit:
    mov rax, rdi                ; set return value to dest
    ret
