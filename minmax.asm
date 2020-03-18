# Nico Mingkun Xia

	.data

# An array, with hard-coded values, to use for testing
array1:	.word 23, 45, -2, 4, 6, 42, 7, 35, 10, 2, -332, 101, 2, 3, 110, -1
size: .word 16
	.text
	.globl main

main: 	la $a0, array1		# initialize pointer to head of array
	la $a1, array1
	move $t0, $0		# set loop counter to zero
	move $t6, $0
	lw $s0, size		# load array size
	addi, $s0, $s0, -1	# iter limit is size-1
	jal minmax
	
minmax:
	lw $t1, 0($a0)		# load first int to $t1, served as max value
	lw $t5, 0($a0)		# load first int to $t4, served as min value
	
Loop1:
 	slt $t7, $s0, $t0 	# if limit < counter
 	beq $t7, 1, Loop2 	# then quit looping and go to Loop 2 to check min 
 
 	lw $t2, 4($a1)  	# load second int to $t2
 	slt $t3, $t1, $t2	# if first value < second value
 	bne $t3, $0, Swap1 	# swap 
 	addi $a1, $a1, 4  	# increment array pointer
 	addi $t0, $t0, 1 	# increment loop counter
 	j Loop1 

Swap1:
 	add $t1,$t2,$0 		# change value of t1 to t2
 	addi $a1, $a1, 4  	# increment array pointer
 	addi $t0,$t0, 1  	# increment loop counter
 	j Loop1	
 	
Loop2:	
	slt $t7, $s0, $t6	# if limit < counter
	beq $t7,1,Exit		# then quit looping and print
	
	lw $t2, 4($a0)		# load second int to $t2
	slt $t3, $t2, $t5	# if first value > second value
	bne $t3, $0, Swap2	# swap 
	addi $a0, $a0, 4 	# increment array pointer
	addi $t6, $t6, 1	# increment loop counter
	j Loop2
	
Swap2:	
	add $t5,$t2,$0		# change value of t4 to t2
	addi $a0, $a0, 4 	# increment array pointer
	addi $t6,$t6, 1		# increment loop counter
	j Loop2
 	

							
Exit:
	#print 
 	li $v0, 1  	# print max 
 	add $a0,$t1,$0   
 	syscall 
 
 	li $a0, 32  	# print white space
 	li $v0, 11   
 	syscall
 	
 	li $v0, 1	# print min
	add $a0,$t5,$0 		
	syscall 
	
	li $v0, 10	# exit program
	syscall
	
	
	
	
	
