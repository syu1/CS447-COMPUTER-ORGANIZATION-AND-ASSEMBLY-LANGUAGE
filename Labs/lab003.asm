# Sam Yu
# Lab 3
.data
enterFirstInteger: .asciiz "Please enter a postive integer: "
wrongIntegerNegative: .asciiz "A negative integer is not allowed.\n"
enterSecondInteger: .asciiz "Please enter another postive integer: "
asterisk: .asciiz " * "
carrot: .asciiz "^"
newLine: .asciiz "\n"
equals: .asciiz " = "
mipsIsDumbSpacer: .word
firstInteger: .asciiz
secondIntger: .asciiz

.text
# Prompt first number
read1:
	addi $v0, $zero, 4 
	la $a0, enterFirstInteger
	syscall

# Read first integer from input
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	jal _incorrectInputDetector1

read2:
	# Prompt second number
	addi $v0, $zero, 4 
	la $a0, enterSecondInteger
	syscall
	# Read second integer from input
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0
	jal _incorrectInputDetector2
multiply:
	# Print calculation of multiplication
	la $a0, ($s0)
	la $v0, 1
	syscall
	
	addi $v0, $zero, 4 
	la $a0, asterisk
	syscall
	
	la $a0, ($s1)
	la $v0, 1
	syscall
	
	addi $v0, $zero, 4 
	la $a0, equals
	syscall
	
	addi $v0, $zero, 4 
	la $a0, newLine
	syscall
exponent:
	# Print calculation of exponentiation
	la $a0, ($s0)
	la $v0, 1
	syscall
	
	addi $v0, $zero, 4 
	la $a0, carrot
	syscall
	
	la $a0, ($s1)
	la $v0, 1
	syscall
	
	addi $v0, $zero, 4 
	la $a0, equals
	syscall
	
# Exit Program
exit:
addi $v0, $zero, 10 
syscall

_incorrectInputDetector1:
	# Check for incorrect input
	slti $t1, $s0, 0
	# if it returns 0 then continue
	beq $t1, 0, read2
	# if it returns 1 then negative number detected
	# Incorrect input detected
	addi $v0, $zero, 4 
	la $a0, wrongIntegerNegative
	syscall
	# return to beginning of the prompt
	j read1
_incorrectInputDetector2:
	# Check for incorrect input
	slti $t1, $s1, 0
	# if it returns 0 then continue
	beq $t1, 0, multiply
	# if it returns 1 then negative number detected
	# Incorrect input detected
	addi $v0, $zero, 4 
	la $a0, wrongIntegerNegative
	syscall
	# return to beginning of the prompt
	j read2
# Multiplys $s0 and $s1 returns in $a0. Use $t0 as a counter variable
_multiply:
# Clear $t0
addi $t0,$zero,0
# Start the loop. Use a for loop using $s1 as a sentry
	loop1: beq $s1, $t0, exponent 
	#############################################################################
	##########GOING TO TEST SHIFT LEFT THEN RIGHT TO ISOLATE THE BIT#############
	#############################################################################
	
	
	add $t0, $t0, 1

# Exponents $s0 and $s1 returns in $a1. Use $t0 as a counter variable
_exponent:
# Clear $t0
addi $t0,$zero,0
# Start the loop. Use a for loop using $s1 as a sentry



