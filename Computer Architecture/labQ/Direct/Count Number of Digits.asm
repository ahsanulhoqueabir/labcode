.data
    msg: .asciiz "Number of digits: "
    num: .word 12345

.text
.globl main
main:
    lw $t0, num
    li $t1, 0    # Digit counter

count:
    beqz $t0, print
    div $t0, $t0, 10
    addi $t1, $t1, 1
    j count

print:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
