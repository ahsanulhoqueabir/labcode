.data
num1: .word 5   # First number
num2: .word 10  # Second number
in1: .asciiz "Enter The First Number: "
in2: .asciiz "Enter The Second Number: "
msg1: .asciiz "Numbers before SWAP: "
space: .asciiz " "
newline: .asciiz "\n"

.text
.globl main

main:

	li $v0,4
	la $a0,in1
	syscall
	
    li $v0,5
    syscall
    move $s0,$v0

    li $v0,4
	la $a0,in2
	syscall
	
    li $v0,5
    syscall
    move $s1,$v0  
    
    li $v0,4
    la $a0,msg1
    syscall
    
    li $v0,1
    move $a0,$s0
    syscall
    
    li $v0,4
	la $a0,space
	syscall
    
    li $v0,1
    move $a0,$s1
    syscall
    
    
    
	li $v0,10
	syscall