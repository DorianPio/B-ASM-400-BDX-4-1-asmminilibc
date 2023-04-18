; Assembly strlen
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global strnlen               ; strlen function declaration

strnlen:
    xor ecx, ecx            ; Set my int to 0
    jmp .loop               ; Go to my loop

 .add:
    inc ecx                 ; Increment Length

.loop:
    cmp ecx, esi
    je .quitt
    movsx rdx, ecx
    cmp BYTE [rdi + rcx], 0
    je .quitt
    jmp .add

.quitt:
    mov eax, ecx
    ret