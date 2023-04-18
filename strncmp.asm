; Assembly strncmp
; Dorian PIO
; Epitech 2024
; Bordeaux


bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global strncmp                  ; strncmp function declaration


strncmp:
	xor eax, eax		        ; return value to 0
	xor ecx, ecx		        ; i = 0
	jmp .loop

.add_incr:
    cmp bl, 0                   ; bl == 0 ?
    je .quitt		            ; true ? go to quitt
    inc ecx

.loop:
    movsx rcx, ecx              ;convert ecx to rcx
    cmp rdx, rcx                ; index == arg3 ?
    je .quitt	                ; true ? go to quitt
    mov bl, BYTE [rdi + rcx]    ; mov str1[index] to bl
    mov r8b, BYTE [rsi + rcx]   ; mov str2[index] to r8b
    cmp bl, r8b                 ; bl == r8b ?
    je .add_incr		        ; true ? go to add_incr

.diff:
    movsx eax, bl               ; move bl(char) to eax(int)
    movsx ebx, r8b              ; move r8b(char) to eax(int)
    sub eax, ebx                ; eax - ebx

.quitt:
    ret