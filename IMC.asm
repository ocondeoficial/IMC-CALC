.data
	peso1: .word 17
	peso2: .word 19
	peso3: .word 25
	peso4: .word 30
	peso5: .word 35
	peso6: .word 40
	
	frase1: .asciiz "muito abaixo do peso"
	frase2: .asciiz "abaixo do peso"
	frase3: .asciiz "peso normal"
	frase4: .asciiz "acima do peso"
	frase5: .asciiz "obesidade grau 1"
	frase6: .asciiz "obesidade grau 2"
	frase7: .asciiz "obesidade grau 3"
	frase8: .asciiz "Seu imc é: "
	frase9: .asciiz "\n"
	frase10: .asciiz "digite sua altura em centímetros (cm): "
	frase11: .asciiz "digite seu peso em kilogramas (kg): "
.text
	li $v0, 4
	la $a0, frase10
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	mul $t0, $s0, $v0
	li $v0, 4
	la $a0, frase11
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	mulo $t1, $t1, 10000
	div  $t1, $t0
	mflo $a0
	
	lw $t0, peso1
	lw $t1, peso2
	lw $t2, peso3
	lw $t3, peso4
	lw $t4, peso5
	lw $t5, peso6
	
	add $a1, $a0, $zero
	blt $a0, $t0, muito_abaixo_peso
	bgt $a0, $t0, proximo
	
muito_abaixo_peso:
	la $a0, frase1
	li $v0, 4
	syscall
	j saida

proximo:
	ble $a0, $t1, abaixo_peso
	bgt $a0, $t1, proximo2

abaixo_peso:
	la $a0, frase2
	li $v0, 4
	syscall
	j saida

proximo2:
	ble $a0, $t2, peso_normal
	bgt $a0, $t2, proximo3
	
peso_normal:
	la $a0, frase3
	li $v0, 4
	syscall 
	j saida

proximo3:
	ble $a0, $t3, acima_peso
	bgt $a0, $t3, proximo4
	
acima_peso:
	la $a0, frase4
	li $v0, 4
	syscall
	j saida

proximo4:
	ble $a0, $t4, obesidade_grau1
	bgt $a0, $t4, proximo5
	
obesidade_grau1:
	la $a0, frase5
	li $v0, 4
	syscall
	j saida

proximo5:
	ble $a0, $t5, obesidade_grau2
	bgt $a0, $t5, obesidade_grau3
	
obesidade_grau2:
	la $a0, frase6
	li $v0, 4
	syscall
	j saida

obesidade_grau3:
	la $a0, frase7
	li $v0, 4
	syscall
	j saida
	
saida:
	li $v0, 4
	la $a0, frase9
	syscall
	li $v0, 4
	la $a0, frase8
	syscall
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
