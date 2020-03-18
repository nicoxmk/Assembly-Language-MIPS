# Mingkun Nico Xia


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



