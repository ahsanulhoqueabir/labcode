.data 
    ms1: .asciiz "Enter your number: "
    ms2: .asciiz "You Entered: "

.text
main:
    li $v0, 4
    la $a0, ms1
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, ms2
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall
