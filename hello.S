msg:
	.ascii "Hello, Apple Silicon!\n"
len = . - msg

.align 2
.global _main
_main:
	; Print the message
	mov X0, #1   ; fd = stdout
	adr X1, msg  ; pointer
	ldr X2, =len ; length
	mov X16, #4  ; syscall = write
	svc #0x80    ; invoke kernel

	; Exit
	mov X0, #0  ; status = 0
	mov X16, #1 ; syscall = exit
	svc #0x80   ; invoke kernel
