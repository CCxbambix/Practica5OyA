.data
dato_1: .asciiz "Introduce el primer numero a operar"
dato_2: .asciiz "Introduce el segundo numero a operar"
suma: .asciiz "\n El resultado de la suma es: "
resta: .asciiz "\n El resultado de la resta es: "
multi: .asciiz "\n El resultado de la multiplicacion es: "
divi: .asciiz "\n El resultado de la division es: "

.text
main:
	la $a0, dato_1 #imprime mensaje de pedir el primer numero a operar
	li $v0, 4 #imprime el mensaje
    	syscall
	li $v0, 5 #guarda el primer numero a operar en s2
	syscall
	move $s0, $v0 #guarda el segundo numero a operar en s1
	la $a0, dato_2 #imprime mensaje de pedir el primer numero a operar
	li $v0, 4 #imprime el mensaje
    	syscall
	li $v0, 5 #guarda el segundo numero a operar y lo guarda en s1
	syscall
	move $s1, $v0 #guarda el segundo numero a operar en s1
	
	la $a0, suma #carga un mensaje de resultado de la suma
	li $v0, 4 #imprime el mensaje
    	syscall
	add $a0, $s0, $s1 #suma s0 y s1 y lo guarda en a0
	li $v0, 1 #imprime el resultado
	syscall
	
	la $a0, resta #carga un mensaje de resultado de la resta
    	li $v0, 4 #imprime el mensaje
    	syscall
	sub $a0, $s0, $s1 #resta s0 con s1 y lo guarda en a0
	li $v0, 1 #imprime el resultado
	syscall
	
	la $a0, multi #carga un mensaje de resultado de la multiplicacion
    	li $v0, 4 #imprime el mensaje
    	syscall
	mul $a0, $s0, $s1 #multiplica s0 con s1 y lo guarda en a0
	li $v0, 1 #imprime el resultado
	syscall
	
	la $a0, divi #carga un mensaje de resultado de la division
    	li $v0, 4 #imprime el mensaje
    	syscall
	div $s0, $s1 #divide s0 entre s1
	mflo $a0 #guarda el resultado en a0
	li $v0, 1 #imprime el resultado
	syscall
	
	li $v0, 10 #terminamos el programa
	syscall
