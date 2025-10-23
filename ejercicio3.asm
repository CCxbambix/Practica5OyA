.data
msj_Error: .asciiz "Error: EL resultado de la resta es negativo\n"

.text
.globl main #etiqueta main 

main:# comienzo del programa
	li $t0 10 #guardar 10 en el registro $t0
	li $t1 1 #guardar 5 en el registro $t1
	sub $t3 $t0 $t1 # realizamos la resta de 10-5 y la guardamos en el registro $a0
	bgt $t3 $zero positivo # condicional de resultado resta es mayor que 0
	move $t3 $zero # intento de limpia de registro del resultado de la resta
	la $a0 msj_Error # cargamos el mensaje de error para los casos donde la resta no es positiva
	li $v0 4 #cargamos codigo para imprimir string
	syscall
	j exit
	
	
positivo: 
	li $v0 1 #Cargamos codigo para imprimir entero
	move $a0 $t3 #cargamos el valor de la resta en $a0
	syscall

exit:
	li $v0 10 #cargamos codigo 10 para cerrar el programa
	syscall
	