.data
	firstNumber: .asciiz "Enter the first Number: "
	secondNumber: .asciiz "Enter the second Number: "
	equal: .asciiz "Both numbers are equal"
	notEqual: .asciiz "Both numbers are not equal"
.text
main:
	li $v0,4
	la $a0,firstNumber
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,secondNumber
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	beq $t1,$t2 Equal
	j Not_Equal
	
	Equal:
		li $v0,4
		la $a0,equal
		syscall
		j Exit
	
	Not_Equal:
		li $v0,4
		la $a0,notEqual
		syscall
		j Exit
	
	Exit:	
	li $v0,10
	syscall
 