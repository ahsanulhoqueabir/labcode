.data
    Comma : .asciiz ", "
    fullStop : .asciiz "."
    msg : .asciiz "\nThe sum is: "
    
.text
main:
    li $t0, 1
    li $t1, 0
    
    for_loop:
        bgt $t0, 10, last
        add $t1, $t1, $t0
        li $v0, 1
        move $a0, $t0
        syscall
        
        beq $t0, 10, last
        
        li $v0, 4
        la $a0, Comma
        syscall
        
        addi $t0, $t0, 1
        j for_loop
    
last:
    	  li $v0, 4
        la $a0, fullStop
        syscall
        
    	  li $v0, 4
        la $a0, msg
        syscall
        
        li $v0, 1
        move $a0, $t1
        syscall
        
        
    
    Exit:
        li $v0, 10
        syscall
