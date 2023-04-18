; Assembly strcmp
; Dorian PIO
; Epitech 2024
; Bordeaux


bits 64                         ; Declare into 64bits asm
section .text                   ; Section text
global strcmp                   ; strcmp function declaration


strcmp:
	xor eax, eax		        ; return value to 0
	xor rcx, rcx		        ; i = 0
	jmp .loop

.add_incr:
	cmp bl, 0		            ; bl == 0 ?
	je .quitt			        ; true ? go to 0
	inc rcx			            ; add 1 to rcx

.loop:
	mov bl, BYTE [rdi + rcx]	; mov str1[rcx] to bl
	mov dl, BYTE [rsi + rcx]    ; mov str2[rcx] to dl
	cmp bl, dl		            ; bl == dl ?
	je .add_incr		        ; true ? go to add_incr

.minus:
	movsx eax, bl		        ; mov bl (char) to eax (int)
	movsx ebx, dl		        ; mov dl (char) to ebx (int)
	sub eax, ebx		        ; eax = eax - ebx

.quitt:
	ret			                ; end