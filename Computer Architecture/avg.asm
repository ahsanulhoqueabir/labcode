.data
array: .space 400
size:  .word 0
newline: .asciiz "\n"
message: .asciiz "Average: "
enter_value: .asciiz "Enter a number: "
enter_size: .asciiz "Enter the number of elements less the 100: "

.text
.globl main

main:
    li $v0, 4
    la $a0, enter_size
    syscall
    li $v0, 5
    syscall
    sw $v0, size
    
    lw $t0, size
    la $t1, array
    li $t2, 0
    li $t3, 0
    mtc1 $zero, $f2
    cvt.s.w $f2, $f2

input_loop:
    beq $t2, $t0, loop
    li $v0, 4
    la $a0, enter_value
    syscall
    li $v0, 6
    syscall
    swc1 $f0, 0($t1)
    addi $t2, $t2, 1
    addi $t1, $t1, 4
    j input_loop

loop:
    lw $t0, size
    la $t1, array
    li $t2, 0
    mtc1 $zero, $f2
    cvt.s.w $f2, $f2

sum_loop:
    beq $t2, $t0, done
    lwc1 $f4, 0($t1)
    add.s $f2, $f2, $f4
    addi $t2, $t2, 1
    addi $t1, $t1, 4
    j sum_loop

done:
    mtc1 $t0, $f6
    cvt.s.w $f6, $f6
    div.s $f8, $f2, $f6
    li $v0, 4
    la $a0, message
    syscall
    li $v0, 2
    mov.s $f12, $f8
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 10
    syscall