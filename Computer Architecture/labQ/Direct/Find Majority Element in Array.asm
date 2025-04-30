.data
    array: .word 2, 3, 2, 2, 4, 2, 2
    size: .word 7
    msg: .asciiz "Majority element: "

.text
.globl main
main:
    la $t0, array
    lw $t1, size
    li $t2, -1
    li $t3, 0

find_majority:
    li $t4, 0
    move $t5, $t2

loop:
    beq $t4, $t1, check_count
    lw $t6, 0($t0)
    beq $t6, $t5, inc_count
    bltz $t3, set_candidate
    subi $t3, $t3, 1
    j next

inc_count:
    addi $t3, $t3, 1
    j next

set_candidate:
    move $t2, $t6
    li $t3, 1

next:
    addi $t0, $t0, 4
    addi $t4, $t4, 1
    j loop

check_count:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
