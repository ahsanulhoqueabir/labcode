.data
    msgInput: .asciiz "Enter a number: "
    msgYes: .asciiz "Kaprekar Number\n"
    msgNo: .asciiz "Not a Kaprekar Number\n"

.text
.globl main
main:
    li $v0, 4
    la $a0, msgInput
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Store input number

    mul $t1, $t0, $t0  # Square the number
    li $t3, 1  

find_divider:
    div $t2, $t1, $t3
    beqz $t2, check_kaprekar
    mul $t3, $t3, 10
    j find_divider

check_kaprekar:
    div $t2, $t1, $t3  
    rem $t4, $t1, $t3  
    add $t5, $t2, $t4  

    beq $t5, $t0, kaprekar
    j not_kaprekar

kaprekar:
    li $v0, 4
    la $a0, msgYes
    syscall
    j end

not_kaprekar:
    li $v0, 4
    la $a0, msgNo
    syscall

end:
    li $v0, 10
    syscall
