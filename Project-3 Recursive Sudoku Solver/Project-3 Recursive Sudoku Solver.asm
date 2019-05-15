.data


.text
#driver for the program, main part
_main:
jal _readPuzzle
addi $v0, $zero, 32 # Syscall 1: Print Integer
add $a0, $zero, 3000 # Set the value to print
syscall # Print the integer'
add $v0,$zero,$zero
add $a0,$zero,$zero
add $t0,$zero,$zero
add $t1,$zero,$zero
add $t2,$zero,$zero
add $t3,$zero,$zero
add $t4,$zero,$zero
add $t5,$zero,$zero
add $t6,$zero,$zero
add $t7,$zero,$zero
jal _solveSudoku

done:
addi $v0, $zero, 10 # Syscall 10: terminate program
syscall # Exit
#Reads entire puzzle and prints it
_readPuzzle:
	la $t1,0xFFFF8000
	loopRead:
		beq $t3, 9, reset
		beq $t4, 9, endReading
		lb $t0, 0($t1)
		addi $t1,$t1,1
		beq $t0,0x0,printZero
		beq $t0,0x1,printOne
		beq $t0,0x2,printTwo
		beq $t0,0x3,printThree
		beq $t0,0x4,printFour
		beq $t0,0x5,printFive
		beq $t0,0x6,printSix
		beq $t0,0x7,printSeven
		beq $t0,0x8,printEight
		beq $t0,0x9,printNine
		
		
		reset:
		addi $t3,$zero,0
		addi $v0, $zero, 11 # Syscall 1: Print Integer
		addi $a0, $zero, 0xA # Set the value to print
		syscall # Print the integer
		addi $t4,$t4,1
		j loopRead
		printZero:
		la $t2,0
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		
		printOne:
		la $t2,1
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printTwo:
		la $t2,2
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printThree:
		la $t2,3
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printFour:
		la $t2,4
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printFive:
		la $t2,5
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printSix:
		la $t2,6
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printSeven:
		la $t2,7
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printEight:
		la $t2,8
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		printNine:
		la $t2,9
		addi $v0, $zero, 1 # Syscall 1: Print Integer
		add $a0, $zero, $t2 # Set the value to print
		syscall # Print the integer
		j endRead
		
		endRead:
		addi $t3,$t3,1
		j loopRead
	endReading:
	jr $ra
		
# This function checks whether a given number is already in a give row.
# $a0, row, $a1 number
_checkRow:
	addi $sp,$sp -4
	sw $ra, 0($sp)
	la $t1, 0xFFFF8000
	addi $t2,$zero,9
	mult $a0,$t2
	mflo $a0
	add $a0,$a0,$t1
	loopCheckRow:
		beq $t0,9,rowEnd
		lb $t2,($a0)
		beq $a1,$t2,rowEnd2
		add $a0,$a0,1
		addi $t0,$t0,1
		j loopCheckRow
	rowEnd:
		#found no duplicates
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,0
		jr $ra
	rowEnd2:
		#found duplicate
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,1
		jr $ra
# This function checks whether a given number is already in a given column starting at 0.
# $a0,col, $a1, number
_checkColumn:
	addi $sp,$sp -4
	sw $ra, 0($sp)
	la $t0,0
	la $t1, 0xFFFF8000
	add $t1,$a0,$t1
	addi $t2,$zero,9
	loopCheckCol:
		beq $t0,9,colEnd
		addi $t0,$t0,1
		#when do i have the correct address to lb here?
		
		add $t1,$t2,$t1
		lb $t3,($t1)
		beq $t3,$a1,colEnd2
		j loopCheckCol
	colEnd:
		#found no duplicates
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,0
		jr $ra
	colEnd2:
		#found duplicate
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,1
		jr $ra 

#$a0 is col, $a1 is row, $a2 is number
_checkSubgrid:
addi $sp,$sp -4
sw $ra, 0($sp)
# gets number from row col
beq $a0,0,subGridA
beq $a0,1,subGridA
beq $a0,2,subGridA

beq $a0,3,subGridB
beq $a0,4,subGridB
beq $a0,5,subGridB

beq $a0,6,subGridC
beq $a0,7,subGridC
beq $a0,8,subGridC
	subGridA:
		beq $a1,0,subGrid1
		beq $a1,1,subGrid1
		beq $a1,2,subGrid1

		beq $a1,3,subGrid4
		beq $a1,4,subGrid4
		beq $a1,5,subGrid4

		beq $a1,6,subGrid7
		beq $a1,7,subGrid7
		beq $a1,8,subGrid7

	subGridB:

		beq $a1,0,subGrid2
		beq $a1,1,subGrid2
		beq $a1,2,subGrid2

		beq $a1,3,subGrid5
		beq $a1,4,subGrid5
		beq $a1,5,subGrid5

		beq $a1,6,subGrid8
		beq $a1,7,subGrid8
		beq $a1,8,subGrid8

	subGridC:
		beq $a1,0,subGrid3
		beq $a1,1,subGrid3
		beq $a1,2,subGrid3

		beq $a1,3,subGrid6
		beq $a1,4,subGrid6
		beq $a1,5,subGrid6

		beq $a1,6,subGrid9
		beq $a1,7,subGrid9
		beq $a1,8,subGrid9

	subGrid1:
		beq $t0,3,subEnd
		addi $t1,$t0,0xFFFF8000
		subGrid1Loop:
			beq $t2,3,continueSubGrid1
			lb $t4,($t1)
			beq $t4,$a2,subEnd2
			addi $t1,$t1,9
			addi $t2,$t2,1
			j subGrid1Loop
		continueSubGrid1:
		addi $t2,$zero,0
		addi $t0,$t0,1
		j subGrid1

	subGrid2:
		beq $t0,3,subEnd
		addi $t1,$t0,0xFFFF8003
		subGrid2Loop:
			beq $t2,3,continueSubGrid2
			lb $t4,($t1)
			beq $t4,$a2,subEnd2
			addi $t1,$t1,9
			addi $t2,$t2,1
			j subGrid2Loop
		continueSubGrid2:
		addi $t0,$t0,1
		addi $t2,$zero,0
		j subGrid2
	subGrid3:
		beq $t0,3,subEnd
		addi $t1,$t0,0xFFFF8006
		subGrid3Loop:
			beq $t2,3,continueSubGrid3
			lb $t4,($t1)
			beq $t4,$a2,subEnd2
			addi $t1,$t1,9
			addi $t2,$t2,1
			j subGrid2Loop
		continueSubGrid3:
		addi $t0,$t0,1
		addi $t2,$zero,0
		j subGrid3

	subGrid4:
		beq $t0,3,subEnd
		addi $t1,$t0,0xFFFF801B
		subGrid4Loop:
			beq $t2,3,continueSubGrid4
			lb $t4,($t1)
			beq $t4,$a2,subEnd2
			addi $t1,$t1,9
			addi $t2,$t2,1
			j subGrid4Loop
		continueSubGrid4:
		addi $t0,$t0,1
		addi $t2,$zero,0
		j subGrid4

	subGrid5:
		beq $t0,3,subEnd
		addi $t1,$t0,0xFFFF801E
		subGrid5Loop:
			beq $t2,3,continueSubGrid5
			lb $t4,($t1)
			beq $t4,$a2,subEnd2
			addi $t1,$t1,9
			addi $t2,$t2,1
			j subGrid5Loop
		continueSubGrid5:
		addi $t0,$t0,1
		addi $t2,$zero,0
		j subGrid5

	subGrid6:
	beq $t0,3,subEnd
	addi $t1,$t0,0xFFFF8021
	subGrid6Loop:
		beq $t2,3,continueSubGrid6
		lb $t4,($t1)
		beq $t4,$a2,subEnd2
		addi $t1,$t1,9
		addi $t2,$t2,1
		j subGrid6Loop
	continueSubGrid6:
	addi $t0,$t0,1
	addi $t2,$zero,0
	j subGrid6
	
	subGrid7:
	beq $t0,3,subEnd
	addi $t1,$t0,0xFFFF8036
	subGrid7Loop:
		beq $t2,3,continueSubGrid7
		lb $t4,($t1)
		beq $t4,$a2,subEnd2
		addi $t1,$t1,9
		addi $t2,$t2,1
		j subGrid7Loop
	continueSubGrid7:
	addi $t0,$t0,1
	addi $t2,$zero,0
	j subGrid7

	subGrid8:
	beq $t0,3,subEnd
	addi $t1,$t0,0xFFFF8039
	subGrid8Loop:
		beq $t2,3,continueSubGrid8
		lb $t4,($t1)
		beq $t4,$a2,subEnd2
		addi $t1,$t1,9
		addi $t2,$t2,1
		j subGrid8Loop
	continueSubGrid8:
	addi $t0,$t0,1
	addi $t2,$zero,0
	j subGrid8
	
	subGrid9:
	beq $t0,3,subEnd
	addi $t1,$t0,0xFFFF803C
	subGrid9Loop:
		beq $t2,3,continueSubGrid9
		lb $t4,($t1)
		beq $t4,$a2,subEnd2
		addi $t1,$t1,9
		addi $t2,$t2,1
		j subGrid9Loop
	continueSubGrid9:
	addi $t0,$t0,1
	addi $t2,$zero,0
	j subGrid9

	subEnd:
	#found no duplicates
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,0
		jr $ra
	subEnd2:
	#found duplicate
		lw $ra, 0($sp)
		addi $sp,$sp,4
		addi $v0,$zero,1
		jr $ra


_getNumber:
# Takes $a0 as current row and takes $a1 for coluomn
_solveSudoku:
	addi $sp,$sp,-4
	sw $s0,0($sp)
	addi $sp,$sp,-4
	sw $s1,0($sp)
	addi $sp,$sp,-4
	sw $s2,0($sp)
	addi $sp,$sp,-4
	sw $s3,0($sp)
	addi $sp,$sp -4
	sw $ra, 0($sp)
	
	#lw $ra, 0($sp)
	#addi $sp,$sp,4
	#lw $s2,0($sp)
	#addi $sp,$sp,4
	#lw $s1,0($sp)
	#addi $sp,$sp,4
	#lw $s0,0($sp)
	#addi $sp,$sp,4
	
	
	addi $s0,$a0,0
	addi $s1,$a1,0
	# boolean p
	addi $s3, $zero, 0
	# if(r ==8) &&
	beq $s0, 8, checkC
	j continue1
	# c == 9
	checkC:
		beq $s1,9, true
		j continue1
	# return true
	true:
		addi $v0,$zero,1
	continue1:
	# if c == 9
	beq $s1,9,parameterUpdate
	j continue2
	#r =r + 1
	# c =0
	parameterUpdate:
		add $s0, $s0, 1
		addi $s1, $zero, 0
		j continue2
	continue2:
	#if(data at row r column c is not 0)
	# address = 0xFFFF0000 + ((row * 10) + column), for the lower half
	addi $t6, $s1,0xFFFF8000
	addi $t7,$zero,9
	mult $s0,$t7
	mflo $t4
	add $t6,$t6,$t4
	lb $t3,($t6)
	bne $t3,0,return1
	j continue3
		return1:
		addi $a0,$s0,0
		addi $a1,$s1,1
		jal _solveSudoku
		lw $ra, 0($sp)
		addi $sp,$sp,4
		lw $s2,0($sp)
		addi $sp,$sp,4
		lw $s1,0($sp)
		addi $sp,$sp,4
		lw $s0,0($sp)
		addi $sp,$sp,4
		jr $ra
	
	#else
	continue3:
	addi $s2,$zero,1
	solveLoop1:
	beq $s2,10, putZeroRetrace
		# push everything onto the stack
		add $t0,$zero,$zero
		add $t1,$zero,$zero
		add $t2,$zero,$zero
		add $t3,$zero,$zero
		add $t4,$zero,$zero
		add $t5,$zero,$zero
		add $t6,$zero,$zero
		add $t7,$zero,$zero
		move $a0,$s0
		move $a1,$s2
		# $a0 is row, $a1 is number to check against
		jal _checkRow
		beq $v0, 0, checkColumn
		add $s2,$s2,1
		j solveLoop1
		
		checkColumn:
		add $t0,$zero,$zero
		add $t1,$zero,$zero
		add $t2,$zero,$zero
		add $t3,$zero,$zero
		add $t4,$zero,$zero
		add $t5,$zero,$zero
		add $t6,$zero,$zero
		add $t7,$zero,$zero
		#$ a0 is column, $a1 is the number to check against
		move $a0,$s1
		move $a1,$s2
		jal _checkColumn
		beq $v0,0,checkSubGrid
		add $s2,$s2,1
		j solveLoop1
		
		#_check subgrid

		checkSubGrid:
		add $t0,$zero,$zero
		add $t1,$zero,$zero
		add $t2,$zero,$zero
		add $t3,$zero,$zero
		add $t4,$zero,$zero
		add $t5,$zero,$zero
		add $t6,$zero,$zero
		add $t7,$zero,$zero
		move $a0,$s1
		move $a1,$s0
		move $a2,$s2
		jal _checkSubgrid
		beq $v0,0,continue4
		add $s2,$s2,1
		j solveLoop1
			continue4:
			#put i into cell at row r column c
			addi $t6, $s1,0xFFFF8000
			addi $t7,$zero,9
			mult $t7,$s0
			mflo $t4
			add $t6,$t6,$t4
			sb $s2,0($t6)
			#p = _solvesudoku(r, c+1)
			addi $a0,$s0,0
			addi $a1,$s1,1
			jal _solveSudoku
			addi $s3,$v0,0
			beq $s3,1,ifP
			add $s2,$s2,1
			j solveLoop1
			
			ifP:
			addi $v0,$zero,0
			addi $a0,$s0,0

			lw $ra, 0($sp)
			addi $sp,$sp,4
			lw $s2,0($sp)
			addi $sp,$sp,4
			lw $s1,0($sp)
			addi $sp,$sp,4
			lw $s0,0($sp)
			addi $sp,$sp,4
			jr $ra
			
	
	putZeroRetrace:
	# puts 0 back into the cell at row r columnc 
	# return false
	addi $t6, $s1,0xFFFF8000
	addi $t7,$zero,9
	mult $t7,$s0
	mflo $t4
	add $t6,$t6,$t4
	sb $zero,0($t6)
	lw $ra, 0($sp)
	addi $sp,$sp,4
	lw $s2,0($sp)
	addi $sp,$sp,4
	lw $s1,0($sp)
	addi $sp,$sp,4
	lw $s0,0($sp)
	addi $sp,$sp,4
	addi $v0,$zero,0
	jr $ra
	
