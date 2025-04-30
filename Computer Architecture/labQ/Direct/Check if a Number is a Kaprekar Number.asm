.data
    msgYes: .asciiz "Kaprekar Number\n"
    msgNo: .asciiz "Not a Kaprekar Number\n"
    num: .word 45  # Example number

.text
.globl main
main:
    lw $t0, num      # Load number into $t0
    mul $t1, $t0, $t0 # Square the number

    move $a0, $t1    # Print the square for debugging
    li $v0, 1
    syscall
    li $a0, 10
    li $v0, 11
    syscall

    li $t3, 1        # Divider power of 10
find_divider:
    div $t2, $t1, $t3
    beqz $t2, check_kaprekar
    mul $t3, $t3, 10
    j find_divider

check_kaprekar:
    div $t2, $t1, $t3  # Left part
    rem $t4, $t1, $t3  # Right part
    add $t5, $t2, $t4  # Sum of both parts

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
