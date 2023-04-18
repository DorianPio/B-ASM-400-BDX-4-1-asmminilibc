; Assembly strchr
; Dorian PIO
; Epitech 2024
; Bordeaux

bits 64                     ; Declare into 64bits asm
section .text               ; Section text
global strchr               ; strchr function declaration

strchr:
    xor ecx, ecx            ; Init counter at 0
    jmp .loop               ; Go to loop

.loop:
    movsx rcx, ecx          ;convert exc to rcx 
    cmp [rdi + rcx], sil    ; Compare if str[i] == arg2
    je .quit_adress         ; true go to quit_adress function
    cmp byte[rdi + rcx], 0  ; Compare if str[i] == '\0'
    je .quit_null           ; true go to quit_null function
    inc ecx                 ; ++counter
    jmp .loop               ; go to loop again

.quit_adress:
    movsx rcx, ecx          ; Convert exc to rcx
    add rdi, rcx            ; arg1 += counter
    mov rax, rdi            ; copy &arg[counter] to rax
    ret                     ; return last value

.quit_null:
    mov rax, 0              ; Move Null in rax
    ret                     ; return NULL