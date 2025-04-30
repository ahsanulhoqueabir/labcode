.data
    msgInput: .asciiz "Enter a number: "
    msgOutput: .asciiz "Number of digits: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msgInput
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  

    li $t1, 0    

count:
    beqz $t0, print
    div $t0, $t0, 10
    addi $t1, $t1, 1
    j count

print:
    li $v0, 4
    la $a0, msgOutput
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
