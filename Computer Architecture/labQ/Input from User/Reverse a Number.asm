.data
    msgInput: .asciiz "Enter a number: "
    msgOutput: .asciiz "Reversed Number: "

.text
.globl main
main:
    # Prompt user to enter a number
    li $v0, 4
    la $a0, msgInput
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0  # Store input number

    li $t1, 0  # Initialize reversed number to 0

reverse:
    beqz $t0, print  # If the number is 0, print the reversed number
    rem $t2, $t0, 10  # Extract last digit
    mul $t1, $t1, 10  # Shift left (multiply by 10)
    add $t1, $t1, $t2  # Append the extracted digit
    div $t0, $t0, 10  # Remove last digit from original number
    j reverse  # Repeat

print:
    li $v0, 4
    la $a0, msgOutput
    syscall

    li $v0, 1
    move $a0, $t1  # Print the reversed number
    syscall

    # Exit
    li $v0, 10
    syscall
