section .data
	textColor db "Car color: "
	textMake db "Car make: "
	textModel db "Car model: "
	textOutput db "Your car is a "

section .bss
	color resb 16
	make resb 16
	model resb 16

section .text
	global _start

_start:

	call _printColorQ
	call _getColor

	call _printMakeQ
	call _getMake

	call _printModelQ
	call _getModel

	call _printOutput
	call _printUserInput
	
	mov rax, 60
	mov rdi, 0 
	syscall

; Get info: color, make, model 
_getColor:
	mov rax, 0
	mov rdi, 0
	mov rsi, color
	mov rdx, 16
	syscall
	ret

_getMake:
	mov rax, 0
	mov rdi, 0
	mov rsi, make
	mov rdx, 16
	syscall
	ret

_getModel:
	mov rax, 0
	mov rdi, 0
	mov rsi, model
	mov rdx, 16
	syscall
	ret

; Print questions: color, make, model
_printColorQ:
	mov rax, 1
	mov rdi, 1
	mov rsi, textColor
	mov rdx, 11
	syscall
	ret

_printMakeQ:
	mov rax, 1
	mov rdi, 1
	mov rsi, textMake
	mov rdx, 10
	syscall
	ret

_printModelQ:
	mov rax, 1
	mov rdi, 1
	mov rsi, textModel
	mov rdx, 11
	syscall
	ret

; Print output frame
_printOutput:
	mov rax, 1
	mov rdi, 1
	mov rsi, textOutput
	mov rdx, 14
	syscall
	ret

; Print use input: color, make, model
_printUserInput:
	mov rax, 1
	mov rdi, 1
	mov rsi, color
	mov rdx, 16
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, make
	mov rdx, 16
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, model
	mov rdx, 16
	syscall

	ret
