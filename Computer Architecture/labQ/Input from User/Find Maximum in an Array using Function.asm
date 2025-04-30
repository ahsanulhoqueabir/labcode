.data
    msgSize: .asciiz "Enter size of array: "
    msgInput: .asciiz "Enter elements: "
    msgOutput: .asciiz "Maximum element: "
    array: .space 100

.text
.globl main
main:
    li $v0, 4
    la $a0, msgSize
    syscall

    li $v0, 5
    syscall
    move $a1, $v0

    li $v0, 4
    la $a0, msgInput
    syscall

    la $a0, array  
    li $t1, 0      

input_loop:
    beq $t1, $a1, find_max
    li $v0, 5
    syscall
    sw $v0, 0($a0)
    addi $a0, $a0, 4
    addi $t1, $t1, 1
    j input_loop

find_max:
    la $a0, array
    jal max_function

    li $v0, 4
    la $a0, msgOutput
    syscall

    li $v0, 1
    move $a0, $v0
    syscall

    li $v0, 10
    syscall

max_function:
    lw $t0, 0($a0)
    li $t1, 0

max_loop:
    beq $t1, $a1, done
    lw $t2, 0($a0)
    bgt $t2, $t0, update_max
    j next

update_max:
    move $t0, $t2

next:
    addi $a0, $a0, 4
    addi $t1, $t1, 1
    j max_loop

done:
    move $v0, $t0
    jr $ra
