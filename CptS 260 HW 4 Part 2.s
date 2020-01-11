# kate radford
# 11537868
# Cpts 260 HW 4 Part 2

.data	
		array1:		.space 40	# 10 element integer array
		string1:	.asciiz "The maximum value is: "
		string2:	.asciiz " The summation is: "
.text
.globl main

main:
		jal makeArray
		jal findMaxVal
		jal findSummation
		li	$v0, 10		# system call code for exit = 10
		syscall			# call operating system


makeArray:	
		la	$t0, array1	# load base address of array
		li	$t1, 11		# $t1 = 11
		sw $t1, ($t0)	# first array element set to 11
		li	$t1, 12		# $t1 = 12
		sw $t1, 4($t0)	# second array element set to 12
		li	$t1, -10	# $t1 = -10
		sw $t1, 8($t0)	# third array element set to -10
		li	$t1, 13		
		sw $t1, 12($t0)
		li	$t1, 9	
		sw $t1, 16($t0)
		li	$t1, 12	
		sw $t1, 20($t0)
		li	$t1, 14	
		sw $t1, 24($t0)
		li	$t1, 15	
		sw $t1, 28($t0)
		li	$t1, -20	
		sw $t1, 32($t0)
		li	$t1, 0	
		sw $t1, 36($t0)
		
		jr $ra

# Write a function which finds the maximum value of this array.
findMaxVal:
		li	$t0, 0		# index = 0
		li	$t2, 0		# count = 0
		li	$t3, 0		# max = 0

		loop1:
		beq $t2, 10, end
		nop
		lw $t1, array1($t0)
		blt $t1, $t3, else	# check for max value
		max:
		move $t3, $t1		# if so, change max value
		else:
		addi $t0, $t0, 4	# increment address
		addi $t2, $t2, 1	# increment count
		j loop1
		
		end:
		li	$v0, 4
		la	$a0, string1
		syscall
		li	$v0, 1
		move $a0, $t3
		syscall
		
		jr $ra

# Write another function which calculates the summation of this array.
findSummation:
		li $t5, 0				# count = 0
		li $t0, 0				# array address = 0
		li $t2, 0				# sum = 0

		loop2:
		beq $t5, 10, end2		# when to exit loop
		nop
		lw $t1, array1($t0)
		add $t2, $t2, $t1		# add to summation
		addi $t0, $t0, 4		# increments address
		addi $t5, $t5, 1		# increments count
		j loop2
		
		end2:
		li	$v0, 4
		la	$a0, string2
		syscall
		li	$v0, 1				# load system call for print int
		move $a0, $t2			# move integer to be printed
		syscall					# call operating system to perform print
		
		jr $ra
