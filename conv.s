.text

conv:
	## Your code here.

	# a0 has original image
	lw $s0 0($a0) # load N into t0
	addi $s1 $s0 -2 # N-2 for output
	mult $s1 $s1	
	mflo $s7	# total pixels to convolute
		
        # load first oringal RGB values and multiply, turn into a loop
	lb $t0 4($a0) 	# input R val pix 0
	lb $t1 0($a1) 	# kernel 0
	mult $t0 $t1
	mflo $t3      	# result 0

	lb $t0 7($a0) 	# input R val pix 1 
	lb $t1 1($a1) 	# kernel 1
	mult $t0 $t1
	mflo $t4      	# result 1
	add $t3 $t3 $t4 # sum

	lb $t0 10($a0) 	# input R val pix 2
	lb $t1 2($a1) 	# kernel 2
	mult $t0 $t1
	mflo $t4	# result 2
	add $t3 $t3 $t4 # sum



	# jal print_int
	# sum all of these, save to R G or B, repeat	


	
	# Traverse the entire NxN image pixel by pixel (kernel) = a1
	# 4($a1) = center of kernel
	# save changed pixel values to a2 (corresponding to 4($a1)
		
	#
	jr $ra

#################################################################################
## Your complete implementation solution should appear above this separator.
#################################################################################


main:

	addi $sp, $sp, -4
	sw $ra, 0($sp)

##      Some initial test code.  Substitute your own as needed.
	
	la $a0, tiny

	la $a1, emboss

	la $a2, tiny_out

	jal conv

	la $a0, tiny_out

	jal print_ppm

	lw $ra, 0($sp)

	addi $sp, $sp, 4

	jr $ra
	
print_int:
	# a0: integer to print
	li $v0, 1
	syscall
	jr $ra

print_newline:
 	li $v0, 11
 	li $a0, 10
 	syscall
	jr $ra
	
print_space:
	li $a0, 32
	li $v0, 11
	syscall
	jr $ra

print_kernel:
	# a0: pointer to kernel
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)

	move $s0, $a0  # s0 = pointer to kernel
	
	lb $a0, 0($s0)
	jal print_int
	jal print_space

	lb $a0, 1($s0)
	jal print_int
	jal print_space

	lb $a0, 2($s0)
	jal print_int
	jal print_newline

	lb $a0, 3($s0)
	jal print_int
	jal print_space

	lb $a0, 4($s0)
	jal print_int
	jal print_space

	lb $a0, 5($s0)
	jal print_int
	jal print_newline

	lb $a0, 6($s0)
	jal print_int
	jal print_space

	lb $a0, 7($s0)
	jal print_int
	jal print_space

	lb $a0, 8($s0)
	jal print_int
	jal print_newline
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
print_ppm:
	# a0: pointer to image in memory
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	
	move $t0, $a0          # t0 = pointer to image
	lw   $t1, 0($t0)       # t1 = N 

	li $a0, 80    # print P
	li $v0, 11
	syscall
	li $a0, 51    # print 3
	li $v0, 11
	syscall
	li $a0, 10    # print newline
	li $v0, 11
	syscall

	move $a0, $t1  # print N
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall
	move $a0, $t1  # print N
	li $v0, 1
	syscall
	li $a0, 10     # print newline
	li $v0, 11
	syscall

	li $a0, 255    # print 255
	li $v0, 1
	syscall
	li $a0, 10     # print newline
	li $v0, 11
	syscall

	addi $t0, $t0, 4    # advance pointer to first pixel
	move $t2, $t1       # t2 = rows to go

print_ppm__start_row:	
	beqz $t2, print_ppm__image_done

	move $t3, $t1       # t3 = cols to go
print_ppm__start_pixel:	
	beqz $t3, print_ppm__row_done   # check if row done
	
	lbu $a0, 0($t0) # print R
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall
	lbu $a0, 1($t0) # print G
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall
	lbu $a0, 2($t0) # print B
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall

	addi $t0, $t0, 3  # advance pointer
	addi $t3, $t3, -1 # decrement cols to go
	b print_ppm__start_pixel

print_ppm__row_done:
	li $a0, 10   # print newline
	li $v0, 11
	syscall
	addi $t2, $t2, -1  # decrement rows to go
	b print_ppm__start_row

print_ppm__image_done:
	lw   $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra

.data

tiny:
	.word 4
	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 255, 0, 0, 0, 0, 255, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 128, 0, 0, 0,	255, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0

tiny_out:	.space 16

identity:	.byte 0, 0, 0, 0, 1, 0, 0, 0, 0
sharpen:        .byte 0, -1, 0, -1, 5, -1, 0, -1, 0
emboss:         .byte -2, -1, 0, -1, 1, 1, 0, 1, 2
outline:        .byte -1, -1, -1, -1, 8, -1, -1, -1, -1
left_sobel:     .byte 1, 0, -1, 2, 0, -2, 1, 0, -1

