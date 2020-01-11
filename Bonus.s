# kate radford
# 11537868
# CptS 260
# Bonus Assignment
# Write an assembly program which gets two double numbers from the user. These two numbers
# are height in terms of feet and inches. You are asked to write a program to convert the height into
# meters (stored as a double number). 
# 1 foot = 0.3048 meter
# 1 inch = 0.0254 meter
# 1 meter = 100 centimeters

.data
	promptFeet:		.asciiz "Enter the height in feet: "
	promptInches:	.asciiz "Enter the height in inches: "
	printResult:	.asciiz "Height is "
	meters:			.asciiz " meters"
	cent:			.asciiz " centimeters"
	feetToInch:		.double 12.0
	inchToMeter:	.double 0.0254
	meterToCent	:	.double 100.0
	
.text
.globl main

main:
	li $v0,4
	la $a0, promptFeet 
	syscall	#print first message
	
	li $v0,7
	syscall	#get height in feet
	mov.d $f2, $f0
	
	li $v0,4
	la $a0, promptInches
	syscall	#print second message
	
	li $v0,7
	syscall	#get height in inches
	mov.d $f4, $f0
	
	l.d $f0, feetToInch
	mul.d $f2, $f2, $f0
	
	add.d $f6, $f2, $f4 #'feet' + inches
	l.d $f0, inchToMeter
	mul.d $f8, $f6, $f0	#convert inches to meters
	
	li $v0, 4
	la $a0, printResult
	syscall
	
	li $v0,3 
	mov.d $f12, $f8
	syscall	#print meters
	
	li $v0, 4
	la $a0, meters
	syscall #print units
	
	l.d $f0, meterToCent
	mul.d $f10, $f8, $f0 #convert meters to centimeters
	
	li $v0, 4
	la $a0, printResult
	syscall
	
	li $v0, 3
	mov.d $f12, $f10
	syscall #print centimeters
	
	li $v0, 4
	la $a0, cent
	syscall #print units

	li $v0, 10
	syscall	#exit
	