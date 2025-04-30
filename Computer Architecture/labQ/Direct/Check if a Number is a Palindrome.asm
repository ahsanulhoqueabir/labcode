.data
    msgYes: .asciiz "Palindrome\n"
    msgNo: .asciiz "Not a Palindrome\n"
    num: .word 122  # Example number

.text
.globl main
main:
    lw $t0, num  # Load the number
    move $t1, $t0
    li $t2, 0    # Reversed number

reverse:
    beqz $t1, check_palindrome
    rem $t3, $t1, 10
    mul $t2, $t2, 10
    add $t2, $t2, $t3
    div $t1, $t1, 10
    j reverse

check_palindrome:
    beq $t2, $t0, palindrome
    j not_palindrome

palindrome:
    li $v0, 4
    la $a0, msgYes
    syscall
    j end

not_palindrome:
    li $v0, 4
    la $a0, msgNo
    syscall

end:
    li $v0, 10
    syscall
