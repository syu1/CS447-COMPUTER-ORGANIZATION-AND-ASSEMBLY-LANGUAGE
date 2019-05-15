# Sam Yu
# Lab 2
# Higher Lower Game!

.data
guessMsg: .asciiz "Enter a number between 0 and 9: " 
# For some reason the output given in the example code
# has the first letter of the first error message captialized. 

capitalLowerMsg: .asciiz "Your guess was too low.\n"
lowerLowerMsg: .asciiz "your guess was too low.\n"

capitalHigherMsg: .asciiz "Your guess was too high.\n"
lowerHigherMsg: .asciiz "your guess was too high.\n"

winnerMsg: .asciiz "Congratulations! You win!"
# Gotta add a period at the end of the losing message
loserMsg: .asciiz "You lose the number was "
period: .asciiz "."




.text
# Grab System Time
li $v0,30
syscall
addi $s0, $a0, 0

# Sets the seed value of the pseudo random generator of MIPS
li $v0, 40
li $a0, 0
addi $a1, $s0, 0
syscall

# Generates Random Integer using lower Epoch Time seed 

addi $v0, $zero, 42 # Syscall 42: Random int range
add $a0, $zero, $zero # Set RNG ID to 0
addi $a1, $zero, 10 # Set upper bound to 5 (exclusive)
syscall # Generate a random number and put it in $a0
add $t8, $zero, $a0 # Copy the random number to $s1

j game

############################################################
######## $t9 TRACKS USER GUESSES DO NOT OVERWRITE ##########
######## $t8 STORES RANDOM NUMBER DO NOT OVERWRITE #########
############################################################
# run out of guesses
	# if $t9 == 2
	# 	print loser message
	lose:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, loserMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg
	# Print integer
	addi $v0, $zero, 1 # Syscall 1: Print Integer
	add $a0, $zero, $t8 # Set the value to print
	syscall # Print the integer
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, period # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg

	li $v0, 10
	syscall

# Begin Guessing Game
game:
	# if the user has guesses 3 times lose
	beq $t9, 3, lose
	
	addi $v0, $zero, 4 
	la $a0, guessMsg 
	syscall 
	
	# Read Integer from Input
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	
	
	# if user guesses correct number win
	beq $s0, $t8, win
	
	
	add $t9,$t9,1
	
	# if first time guessing and wrong go to capital messages
	beq $t9, 1, branchCapital
	bne $t9, 1, branchLower
	# Three possiblities win, try again, run out of guesses
	
	# Win
	# if $s0 == $t8 print user wins message
	win:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0,winnerMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string guessMsg
	li $v0, 10
	syscall
	
	# Try again Capital
	# if $t9 < 2 && $t9 == 0
	# 	if $s0 > $t8 
	# 		print capitalHigher message
	# 	elif $s0 < $t8
	# 		print capitalLower message
	branchCapital:
	blt $s0, $t8, capitalLower
	bgt $s0, $t8, capitalHigher
	
	branchLower:
	blt $s0, $t8, lowercaseLower
	bgt $s0, $t8, lowercaseHigher
	
	capitalLower:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, capitalLowerMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg
	j game
	
	capitalHigher:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, capitalHigherMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg
	j game
	
	lowercaseLower:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, lowerLowerMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg
	j game
	
	lowercaseHigher:
	addi $v0, $zero, 4 # Syscall 4: Print String
	la $a0, lowerHigherMsg # $a0 = address of the first character of helloMsg
	syscall # Print the string loserMsg
	j game
	
	
	
	
	
