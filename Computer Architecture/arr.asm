.data
    size: .asciiz "Enter the number of elements: "
    element: .asciiz "Enter element at "
    elem: .asciiz " : "
    output_msg: .asciiz "Array elements: "
    nl: .asciiz "\n"

    array: .space 400 

.text
main:

    li $v0, 4
    la $a0, size
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   

  
    li $t1, 0      
    la $t2, array   

input_loop:
    bge $t1, $t0, print 

    li $v0, 4
    la $a0, element
    syscall
    
    li $v0,1
 	move $a0,$t1
 	syscall
 	
 	li $v0,4
 	la $a0, elem
 	syscall

    li $v0, 5
    syscall

    sw $v0, 0($t2)  

    addi $t1, $t1, 1
    addi $t2, $t2, 4
    j input_loop

print:
    li $v0, 4
    la $a0, output_msg
    syscall

    li $t1, 0
    la $t2, array

print_loop:
    bge $t1, $t0, exit

    lw $a0, 0($t2)
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    addi $t1, $t1, 1
    addi $t2, $t2, 4
    j print_loop

exit:
    li $v0, 10
    syscall
