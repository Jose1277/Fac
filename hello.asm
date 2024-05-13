.globl main

main:
	li a7, 4
	la a0, texto
	ecall

.data
	texto: .ascii "Ola mundo\n"
	
