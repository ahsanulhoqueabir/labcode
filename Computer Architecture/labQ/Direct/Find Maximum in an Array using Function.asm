.data
    array: .word 5, 12, 8, 20, 15
    size: .word 5
    msg: .asciiz "Maximum element: "

.text
.globl main
main:
    la $a0, array
    lw $a1, size
    jal find_max

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $v0
    syscall

    li $v0, 10
    syscall

find_max:
    lw $t0, 0($a0)
    li $t1, 0
    li $t2, -1

loop:
    beq $t1, $a1, done
    lw $t3, 0($a0)
    bgt $t3, $t2, update_max
    j next

update_max:
    move $t2, $t3

next:
    addi $a0, $a0, 4
    addi $t1, $t1, 1
    j loop

done:
    move $v0, $t2
    jr $ra
