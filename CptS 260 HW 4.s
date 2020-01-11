# kate radford
# 11537868
# CptS 260 HW 4 Part 1

	.data

string1: .asciiz "Enter the first number:"
string2: .asciiz "Enter the second number:"
string3: .asciiz "Enter the operation type:"
string4: .asciiz "The result is: "

	.text
	.globl main

main:
	li $v0,4
	la $a0, string1
	syscall
	li $v0,5 #first number
	syscall
	move $t1,$v0
	li $v0,4
	la $a0,string2
	syscall
	li $v0,5 #second number
	syscall
	move $t2,$v0
	li $v0,4
	la $a0,string3
	syscall
	li $v0,5 #operation choice
	syscall
	move $t0,$v0
	beq $t0,$0,addnum #if operation choice == 0
	li $t3,1
	beq $t0,$t3,subnum #if operation choice == 1
	li $t3,2
	beq $t0,$t3,multnum #if operation choice == 2

addnum:
	add $t3,$t1,$t2 #t1 + t2 = t3
	li $v0,4
	la $a0,string4
	syscall
	li $v0,1
	move $a0,$t3 #print add result
	syscall
	li $v0,10 #exit
	syscall

subnum:
	sub $t3,$t1,$t2 #t1 - t2 = t3
	li $v0,4
	la $a0,string4
	syscall
	li $v0,1
	move $a0,$t3 #print sub result
	syscall
	li $v0,10 #exit
	syscall

multnum:
	mult $t1,$t2 #t1 * t2
	li $v0,4
	la $a0,string4
	syscall
	li $v0,1
	mfhi $a0 #print upper 32 bits 
	syscall
	li $v0,1
	mflo $a0 #print lower 32 bits
	syscall
	
	li $v0,10 #exit
	syscall
