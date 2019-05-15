.data
# i kinda got lazy and didn't use $s cause stack pointer backing up stuff
# still within the requirements though.
gameArrayLength: .word 0
gameArray: .space 256
.text
initial_input:
	bne $t9,16,initial_input
	addi $t8,$zero,16
	
run_game:
	addi $a0,$zero,0
	addi $a1,$zero,4
	addi $v0,$zero,42
	syscall
	addi $a0,$a0,1
	# loads the size of the array into $t0
	lw $t0, gameArrayLength
	# loads the address of the start of the game array + current size
	la $t1, gameArray($t0)
	# stores the random number generated in to start game array + current size
	sb $a0, ($t1)
	# adds 1 to the size of the array
	addi $t0,$t0,1
	# stores the new size of the array
	sw $t0, gameArrayLength
	# now we need to get the random number generated and load it into $a0
	
	#now loop through play sequence with each byte
	addi $t3, $zero, 0
	lw $t0, gameArrayLength
	loop_sequence:
		beq $t3, $t0, userside
		lb $a0, gameArray($t3)
		jal _playSequence
		addi $t3, $t3, 1
		j loop_sequence
	userside:
	addi $t3, $zero, 0
	lw $t0, gameArrayLength
	loop_sequence2:
		beq $t3, $t0, run_game
		lb $a0, gameArray($t3)
		jal _userPlay
		beq $v0,0,resetGame
		addi $t3, $t3, 1
		j loop_sequence2
		
	
resetGame:
addi $t8,$zero,15
addi $t2,$zero, 0
addi $t3, $zero, 0
lw $t0, gameArrayLength
loop_sequence3:
		beq $t3, $t0, finish_clear
		sb $t2, gameArray($t3)
		addi $t3, $t3, 1
		j loop_sequence3
finish_clear:
sw $t2, gameArrayLength

add $v0,$zero,$zero
add $v1,$zero,$zero
	
add $a0,$zero,$zero
add $a1,$zero,$zero
add $a2,$zero,$zero
add $a3,$zero,$zero
	
add $t0,$zero,$zero
add $t1,$zero,$zero
add $t2,$zero,$zero
add $t3,$zero,$zero
add $t4,$zero,$zero
add $t5,$zero,$zero
add $t6,$zero,$zero
add $t7,$zero,$zero
add $t8,$zero,$zero
add $t9,$zero,$zero
j initial_input


# $a0, the byte of the currently generated number
# $v0, return value telling if user inputed the correct sequence
.text
_playSequence:
		newColor:
		beq $a0,1,blue
		beq $a0,2,yellow
		beq $a0,3,green
		beq $a0,4,red
		
		blue:
			addi $t8,$zero,1	
			j continue
		yellow:
			addi $t8,$zero,2
			j continue
		green:
			addi $t8,$zero,4
			j continue
		red:	
			addi $t8,$zero,8
			j continue
			
		continue:
		jr $ra
		
	
.text
#this function should notify if the user
#successfuly played back the sequence
#Keep track of user input and check back with play
#sequence array as it goes through
# $a0 - the current number being checked
_userPlay:
	resetClick:
	addi $t9,$zero,0
	addi $t4,$a0,0
	buttonClick:
		beq $t9,1,blueClick
		beq $t9,2,yellowClick
		beq $t9,4,greenClick
		beq $t9,8,redClick
		j buttonClick
	
	blueClick:
		addi $t8,$zero,1
		addi $a0,$zero,500
		addi $v0,$zero,32
		beq $t4,1,correct
		j wrongAnswer
	yellowClick:
		addi $t8,$zero,2
		addi $a0,$zero,500
		addi $v0,$zero,32
		beq $t4,2,correct
		j wrongAnswer
	greenClick:
		addi $t8,$zero,4
		addi $a0,$zero,500
		addi $v0,$zero,32
		beq $t4,3,correct
		j wrongAnswer
	redClick:
		addi $t8,$zero,8
		addi $a0,$zero,500
		addi $v0,$zero,32
		beq $t4,4,correct
		j wrongAnswer
	#set $v0 to 1 if correct answer
	correct:
		addi $v0, $zero,1
		jr $ra
	#set $v0 to 0 if wrong answer
	wrongAnswer:
		addi $v0,$zero,0
		jr $ra
	
