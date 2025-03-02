.data
	integer: .word 13
	shortInt: .half 5
	char: .byte 'A'
	floatNum: .float 13.5
	doubleNum: .double 2.789
	string: .asciiz "This is String"
	promt: .asciiz "Enter a Integer Number: "
.text
main:
	li $v0 4
	la $a0, promt
	syscall
	
	li $v0, 5
	syscall
	move $t0,$v0
	
	
	
	
print:
	li $v0,1
	move $a0,$t0
	syscall
	
