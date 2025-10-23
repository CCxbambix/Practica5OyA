.data
msj: .asciiz "Me gustan los tacos de pastor :D\n" #msj a imprimir
msj_recibir_num: .asciiz "Introduszca un numero para imprimir ese num de veces un msj: \n" #msj para que el usuario introduzca un num

.text
.globl main

main:
	la $a0 msj_recibir_num # hacemos que se imprima un msj para que el usuario meta el numero a recibir
	li $v0 4 #se imprime el msj
	syscall
	li $v0 5 #leemos un entero 
	syscall
	move $t0 $v0 #muevo el valor leido a el registro $a0
	
bucleTrue:
	bgt $t0 $zero imprimir #condicional registro t0 es mayor que 0
	li $v0 10 #cerramos el programa, caso falso
	syscall
	
imprimir: #caso verdadero
	la $a0 msj #cargamos el msj a imprimir 
	li $v0 4 #imprimir string
	syscall
	sub $t0 $t0 1
	j bucleTrue
	
	
	
	
	