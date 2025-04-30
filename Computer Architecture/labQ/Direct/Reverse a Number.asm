.data
    msg: .asciiz "Reversed Number: "
    num: .word 1234

.text
.globl main
main:
    lw $t0, num
    li $t1, 0

reverse:
    beqz $t0, print
    rem $t2, $t0, 10
    mul $t1, $t1, 10
    add $t1, $t1, $t2
    div $t0, $t0, 10
    j reverse

print:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
