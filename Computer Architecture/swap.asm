.data
	input1: .asciiz "Enter First Number: "  
	input2: .asciiz "Enter Second Number: "
	output1: .asciiz "Enter First Number: "
	output2: .asciiz "Enter Second Number: "
.text

main:
	li $v0,4
	la $a0,input1
	syscall
	
	li $v0,1
	syscall
	move $s0,$v0
	
	li $v0,4
	la $a0,input2
	syscall
	
	li $v0,1
	syscall
	move $s1,$v0

	jal swap
	
		
			
	swap:
			
	