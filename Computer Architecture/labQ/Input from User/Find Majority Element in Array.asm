.data
    msgSize: .asciiz "Enter size of array: "
    msgInput: .asciiz "Enter elements: "
    msgOutput: .asciiz "Majority element: "
    array: .space 100

.text
.globl main
main:
    li $v0, 4
    la $a0, msgSize
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  # Store size

    li $v0, 4
    la $a0, msgInput
    syscall

    la $t0, array  
    li $t2, 0      

input_loop:
    beq $t2, $t1, find_majority
    li $v0, 5
    syscall
    sw $v0, 0($t0)
    addi $t0, $t0, 4
    addi $t2, $t2, 1
    j input_loop

find_majority:
    la $t0, array
    li $t3, 0
    li $t4, -1

majority_loop:
    beq $t3, $t1, check_count
    lw $t5, 0($t0)
    beq $t5, $t4, inc_count
    bltz $t3, set_candidate
    subi $t3, $t3, 1
    j next

inc_count:
    addi $t3, $t3, 1
    j next

set_candidate:
    move $t4, $t5
    li $t3, 1

next:
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    j majority_loop

check_count:
    li $v0, 4
    la $a0, msgOutput
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
