.data
buffer: .space 12  # Reserva 12 bytes para o buffer da string (incluindo espaço para '\0')

.text
.globl main
main:
    li t2, 1234        # O número que queremos converter
    la t0, buffer      # Endereço do buffer
    add t1, t0, zero   # t1 aponta para o final do buffer

    # Loop para converter número para string
convert_loop:
    li t3, 10
    rem t4, t2, t3     # t4 = t2 % 10, obtém o último dígito
    div t2, t2, t3     # t2 = t2 / 10, remove o último dígito

    addi t4, t4, '0'   # Converte dígito para ASCII
    addi t1, t1, -1    # Move para trás no buffer
    sb t4, 0(t1)       # Armazena o caractere no buffer

    bnez t2, convert_loop  # Continua enquanto t2 não for 0

    # Adiciona o terminador de string
    addi t1, t1, -1    # Move para trás mais uma vez para o '\0'
    sb zero, 0(t1)     # Insere o '\0'

    # Imprimir a string resultante
    la a0, buffer      # Carrega o endereço inicial do buffer
    li a7, 4           # Syscall para printar string
    ecall              # Executa syscall

    # Sai do programa
    li a7, 10          # Syscall para sair
    ecall              # Executa syscall