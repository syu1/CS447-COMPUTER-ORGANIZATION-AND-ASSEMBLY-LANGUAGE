# Project 1
# by Sam Yu
# will never exit will always loop
# calling convention
# $a0 and $a1 are inputs
# $v0 is return value sometimes $v1 too!
# LCD $t8 is connected to the display
# $t9 gives numbers and instructions

menu:
	beq $t9,0x80000000,zero
	beq $t9,0x80000001,one
	beq $t9,0x80000002,two

	beq $t9,0x80000003,three
	
	beq $t9,0x80000004,four
	
	beq $t9,0x80000005,five
	beq $t9,0x80000006,six

	beq $t9,0x80000007,seven
	beq $t9,0x80000008,eight
	beq $t9,0x80000009,nine

	beq $t9,0x8000000a,addition

	beq $t9,0x8000000b,subtraction

	beq $t9,0x8000000c,normal_multiplication

	beq $t9,0x8000000d,division_normal

	beq $t9,0x8000000e,equals

	beq $t9,0x8000000f,clear
	j menu

zero_zero:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_zero
zero_one:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_one
zero_two:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_two
zero_three:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_three
zero_four:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_four
zero_five:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_five
zero_six:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_six
zero_seven:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_seven
zero_eight:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_eight
zero_nine:
addi $t8,$zero,0
addi $s1,$s1,1
j continue_nine
zero:
	beq $s1,1,zero_zero
	continue_zero:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, zero_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,0
	j multiplication
	zero_multiple:
	add $t8,$v0,0
	zero_base:

	addi $t8,$t8,0
	addi $t9,$zero, 0
	j menu
one:
	beq $s1,1,zero_one
	continue_one:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, one_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,1
	j multiplication
	one_multiple:
	add $t8,$v0,0
	one_base:

	addi $t8,$t8,1
	addi $t9,$zero, 0
	j menu
two:
	beq $s1,1,zero_two
	continue_two:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, two_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,2
	j multiplication
	two_multiple:
	add $t8,$v0,0
	two_base:

	addi $t8,$t8,2
	addi $t9,$zero, 0
	j menu
three:
	beq $s1,1,zero_three
	continue_three:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, three_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,3
	j multiplication
	three_multiple:
	add $t8,$v0,0
	three_base:

	addi $t8,$t8,3
	addi $t9,$zero, 0
	j menu
four:
	beq $s1,1,zero_four
	continue_four:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, four_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,4
	j multiplication
	four_multiple:
	add $t8,$v0,0
	four_base:
	addi $t8,$t8,4
	addi $t9,$zero, 0
	j menu
five:
	beq $s1,1,zero_five
	continue_five:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, five_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,5
	j multiplication
	five_multiple:
	add $t8,$v0,0
	
	five_base:

	addi $t8,$t8,5
	addi $t9,$zero, 0
	j menu
six:
	beq $s1,1,zero_six
	continue_six:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, six_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,6
	j multiplication
	six_multiple:
	add $t8,$v0,0
	
	six_base:

	addi $t8,$t8,6
	addi $t9,$zero, 0
	j menu
seven:
	beq $s1,1,zero_seven
	continue_seven:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, seven_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,7
	j multiplication
	seven_multiple:
	add $t8,$v0,0
	seven_base:

	addi $t8,$t8,7
	addi $t9,$zero, 0
	j menu
eight:
	beq $s1,1,zero_eight
	continue_eight:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, eight_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,8
	j multiplication
	eight_multiple:
	add $t8,$v0,0
	
	eight_base:

	addi $t8,$t8,8
	addi $t9,$zero, 0
	j menu
nine:
	beq $s1,1,zero_nine
	continue_nine:
	# if its currently zero set the intial number to this stuff
	beq $t8,$zero, nine_base
	#mult 10, $t8 then add 1
	# so load up $a0 with current value in $t8
	# load up multipler with ten
	addi $v0,$zero,0
	addi $a0,$t8,0
	addi $a1,$zero,10
	addi $a2,$zero,9
	j multiplication
	nine_multiple:
	add $t8,$v0,0
	nine_base:
	
	addi $t8,$t8,9
	addi $t9,$zero, 0
	j menu

	# user presses additon jumps here
	# right now we are here in the code and the current number
	# is stored in $t8
	# now we need him to press the next number and it should change the
	# number to the new one on the screen
	# so we need to save $t8 in the register
	# now we need to wait for the user to input the next number so its
	# going to jump back to the menu
	# we need to wait for the user to either press equal OR press the plus sign again
	# if he presses the equal sign then we need to grab the stored number and return the result to the screen
	# if he presses plus again then we need to display the answer to the screen and wait for input again
	# so basically the plus and equal sign do the same thing in this case
#addirion only runs once````````````````````````````````````````
# basically for operations $s0 stores the previous number
# then $s5 keeps track of the number of ti
continue_addition1:
add $s6,$t8,$zero
j finish_addition
addition:
	beq $s1,0,continue_addition1
	finish_addition:
	addi $s1,$zero,1
	addi $s7,$zero,1
	addi $t9,$zero,0
	j menu
continue_subtraction1:
add $s6,$t8,$zero
j finish_subtraction
subtraction:
	beq $s1,0,continue_subtraction1
	finish_subtraction:
	addi $s1,$zero,1
	addi $s7,$zero,2
	addi $t9,$zero,0
	j menu
# parameters- $a0, $a1
# $a0, multiplicand
# a1, multiplier
# $v0, return the value of the operation.
multiplication:
	#clear out $t1
	addi $t1,$zero, 0
	# once the multiplier becomes zero
	# end the loop
	loop1: beq $a1, $zero, done1
	and $t0,$a1, 1
	# if the lsb is 1/$t0 add the current mulptilicand
	beq $t0, 1, do_operation
	# if the lsb is 0 simply only do the shift
	beq $t0, 0, jump_to_shift
	do_operation:
	add $t1,$t1,$a0
	jump_to_shift:
	srl $a1, $a1, 1
	sll $a0, $a0, 1
	j loop1
	done1:
	# return the result in v0
	addi $v0, $t1,0
	# digit controller, 0 through nine is digiti multiplication
	# 10 is just the actual normal multiplication for control jumps
	beq $a2,0,zero_multiple
	beq $a2,1,one_multiple
	beq $a2,2,two_multiple
	beq $a2,3,three_multiple
	beq $a2,4,four_multiple
	beq $a2,5,five_multiple
	beq $a2,6,six_multiple
	beq $a2,7,seven_multiple
	beq $a2,8,eight_multiple
	beq $a2,9,nine_multiple
	beq $a2,10,multiplication_equals
#$a0,$a1 divident and divisor
#return $v0 with the qoutient

continue_multiplication1:
add $s6,$t8,$zero
j finish_multiplication
normal_multiplication:
	beq $s1,0,continue_multiplication1
	finish_multiplication:
	addi $s1,$zero,1
	addi $s7,$zero,3
	addi $t9,$zero,0
	j menu
continue_division1:
add $s6,$t8,$zero
j finish_normal_division

division_normal:
	beq $s1,0,continue_division1
	finish_normal_division:
	addi $s1,$zero,1
	addi $s7,$zero,4
	addi $t9,$zero,0
	j menu

#$a0 is dividend
#$a1 is divisor
division:
	loop3:
	slt $t3,$a0,$a1
	beq $t3, 1, finish_division
	sub $a0,$a0,$a1
	addi $t4,$t4,1
	j loop3 
	finish_division:
	addi $v0,$t4,0
	j division_equals





equals:
beq $s7,1,equals_addition
beq $s7,2,equals_subtraction
beq $s7,3,equals_multiplication
beq $s7,4,equals_division
equals_addition:
	add $t8,$s6,$t8
	addi $t9,$zero,0
	j menu
equals_subtraction:
	sub $t8,$s6,$t8
	addi $t9,$zero,0
	j menu
equals_multiplication:
	la $a0,0($s6)
	la $a1,0($t8)
	la $a2,10
	j multiplication
	multiplication_equals:
	addi $t8,$v0,0
	addi $t9,$zero,0
	j menu
equals_division:
	la $a0,0($s6)
	la $a1,0($t8)
	j division
	division_equals:
	addi $t8,$v0,0
	addi $t9,$zero,0
	j menu
	
clear:
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
	add $s0,$zero,$zero
	add $s1,$zero,$zero
	add $s2,$zero,$zero
	add $s3,$zero,$zero
	add $s4,$zero,$zero
	add $s5,$zero,$zero
	add $s6,$zero,$zero
	add $s7,$zero,$zero
	j menu
