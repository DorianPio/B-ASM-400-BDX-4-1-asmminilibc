; Assembly strlen
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global strlen               ; strlen function declaration

strlen:
    xor ecx, ecx            ; Set my int to 0
    jmp .loop               ; Go to my loop

 .add:
    inc ecx                 ; Increment Length

.loop:
    movsx rdx, ecx          ; Convert 4bytes into 8bytes
    mov sil, BYTE [rdi+rdx] ; Put a char intor sil = 16 bits of rsi
    cmp sil, 0              ; Check if char is \0
    jne .add                ; Increment if char is not \0
    mov eax, ecx            ; set value of the strlen return
    ret                     ; return