.data
msj_residuo: .asciiz "El residuo de la la división es:\n "
msj_cociente: .asciiz "El cociente de la división es: \n"
msj_salto: .asciiz "\n" #Mensaje que hace un salto de linea, se usa despues de imprimir un num :)
.text
.globl main

main:
	li $t0 12# guardamos el numero a dividir
	li $t1 5 # guardamos el numero por el que dividiremos
	li $v0 0 #valor inicial del cociente 
bucle:
	mul $t2 $v0 $t1 # valor de multiplicacion de reg $v0 $t1
	bge $t2 $t0 case1 #condiional para ver si $t2> $t0
	addi $v0 $v0 1# caso falso, le sumamos al cociente 
	j bucle
	
case1: #caso verdadero
	beq $t2 $t0 exit  #condicional para ver que la multiplicacion sea igual a el numero a dividir
	sub $v0 $v0 1 # como la multiplicacion de t1 con el cociente es mayor que el numero a dividir le restamos 1 al cociente 
	mul $t2 $v0 $t1 #calculamos la multiplicacion de el divisor y el cociente 
	sub $v1 $t0 $t2 #calculamos el residuo con la resta del numero a dividir menos la multiplicacion del divisor y el cociente 
	j exit
 	
exit: 
	la $a0 msj_residuo #agregamos el mensaje de residuo en $a0
	move $t3 $v0 #guargamos el valor del cociente para que no se borre
	li $v0 4
	syscall
	move $a0 $v1#pasamos el valor del residuo al registro $a0 para que se imprima, si se paso directo de la condicional $v1= 0, si paso por adentro $v1!=0
	li $v0 1 #imprimimos el valor del residuo
	syscall
	la $a0 msj_salto #guardamos el msj de salto de linea
	li $v0 4 #imprimirmos el salto de linea
	syscall
	la $a0 msj_cociente #guardamos el mensaje de cociente en $a0
	syscall
	move $a0 $t3 #pasamos el valor del cociente al registro $a0 para que se imprima
	move $t3 $zero #limpiamos el registro que usamos para guardar el valor del cociente 
	li $v0 1
	syscall
	li $v0 10
	syscall

	
