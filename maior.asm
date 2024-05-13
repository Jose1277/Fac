.globl main

main:
	#le e armazena n
	li a7, 5
	ecall
	add t0, zero, a0
	
loop:

.data
	texto: .string "\n"