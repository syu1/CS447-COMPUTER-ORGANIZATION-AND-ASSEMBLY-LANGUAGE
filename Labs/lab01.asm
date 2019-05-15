.text
top_of_loop:
	addi $t9, $zero, 0 # Neutral face
	addi $v0, $zero, 32 # Syscall 32: Sleep
	addi $a0, $zero, 500 # Time to sleep (500 ms)
	syscall # Perform the syscall (sleep for 500 ms)
	
	addi $t9, $t9, 179 # Happy face
	addi $v0, $zero, 32 # Syscall 32: Sleep
	addi $a0, $zero, 500 # Time to sleep (500 ms)
	syscall # Perform the syscall (sleep for 500 ms)
	
	addi $t9, $t9, -293 # Unhappy face
	addi $v0, $zero, 32 # Syscall 32: Sleep
	addi $a0, $zero, 500 # Time to sleep (500 ms)
	syscall # Perform the syscall (sleep for 500 ms)
	
	addi $t9, $t9, 561 # Happy face again!
	addi $v0, $zero, 32 # Syscall 32: Sleep
	addi $a0, $zero, 500 # Time to sleep (500 ms)
	syscall # Perform the syscall (sleep for 500 ms)
	
	j top_of_loop


