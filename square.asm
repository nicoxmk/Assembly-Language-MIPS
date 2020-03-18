# This program illustrates an exercise of determining whether an integer is a perfect square.
# The subroutine 'square' return 1 if the input is a perfect square or 0 otherwise, using an appropriate return register.
# The 'main' program should test the subroutine by first prompting the user for an integer to test, and then
# calling the subroutine with that integer as an argument. Determining on the outcome of the test, the
# 'main' program should generate an appropriate print statement.
# Feel free to add additional entries as you need them in the .text or .data segments.
# Make sure that your 'main' program terminates gracefully.
# Be sure to comment your code. Use proper register conventions!

	.data

prompt:	.asciiz "Enter a positive integer: \n"
strTrue: .asciiz "The input is a perfect square "
strFalse: .asciiz " The input is not a perfect square "

	.text
	.globl main
	
# thoughts: 
# for all positive integers that less than input n
# if squareRoot(n) is found among them,return true, else false
main:
	li $v0, 4			#ask integer from user 
	la $a0, prompt				
	syscall
	
	li $v0,5 			# read integer the user entered 
	syscall
	move $s0, $v0			
	
	li $t0, 1		
	jal square

square:
	beq $t0,$s0, False		
	mul $t1, $t0, $t0		# square($t0) = $t1
	beq $t1, $s0, True		# check if its squaree is input integer 
	addi $t0,$t0,1			# increment 
	j square
	
False:
	li $v0,4
	la $a0, strFalse		# print not perfect square
	syscall
	li $v0, 10
	syscall
	
True:
	li $v0,4
	la $a0, strTrue			# print is perfect square
	syscall
	li $v0, 10
	syscall



