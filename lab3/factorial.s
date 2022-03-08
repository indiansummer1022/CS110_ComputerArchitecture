.data
test_input: .word 3 6 7 8

.text
main:
	add t0, x0, x0
	addi t1, x0, 4  # t1 = 4
	la t2, test_input
main_loop:
	beq t0, t1, main_exit
	slli t3, t0, 2  # t3 = t0 * 4
	add t4, t2, t3
	lw a0, 0(t4)    # a0 = t2[t3] = test_input[t3]

	addi sp, sp, -20
	sw t0, 0(sp)
	sw t1, 4(sp)
	sw t2, 8(sp)
	sw t3, 12(sp)
	sw t4, 16(sp)

	jal ra, factorial

	lw t0, 0(sp)
	lw t1, 4(sp)
	lw t2, 8(sp)
	lw t3, 12(sp)
	lw t4, 16(sp)
	addi sp, sp, 20

	addi a1, a0, 0
	addi a0, x0, 1
	ecall # Print Result
	addi a1, x0, ' '
	addi a0, x0, 11
	ecall
	
	addi t0, t0, 1
	jal x0, main_loop
main_exit:  
	addi a0, x0, 10
	ecall # Exit

# factorial:
# 	# YOUR CODE HERE
#     add t5, a0, x0
#     mv a0, x0
#     addi a0, a0, 1  # t5 = a0, a0 = 1
# factorial_loop:
#     beq t5, x0, factorial_exit  # if t5 == 0, exit
#     mul a0, a0, t5  # a0 = a0 * t5
#     addi t5, t5, -1
#     j factorial_loop
# factorial_exit:
#     jr ra

factorial:
	addi sp, sp -8
	sw ra 0(sp)
	sw a0 4(sp)
	addi t0, a0, -1
	bge t0, x0, fact_recurse
	li a0, 1
	j fact_exit
fact_recurse:	#1 recursive method
	addi a0, a0, -1
	jal ra, factorial
	lw t0, 4(sp)
	lw ra, 0(sp)
	mul a0, t0, a0
fact_exit:
	addi sp, sp, 8
	jr ra

factorial_iter:		#2 iterative method
	li t0, 1
	li t1, 1
factorial_iter_loop:
	mul t1, t1, t0
	addi t0, t0, 1
	bge a0, t0 factorial_iter_loop
	mv a0, t1
	jr ra
