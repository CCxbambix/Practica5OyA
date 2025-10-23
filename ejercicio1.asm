.data
	dato: .asciiz "logisim estaba chido :c"
.text
main:
	la $a0, dato    #cargar dato a a0
	add $a1, $a0, $zero #suma a0 con 0 y lo guarda en a1
	
	li $v0, 10 #terminamos el programa
	syscall
