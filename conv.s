.text

conv:


	lw $s0 0($a0) 	# N
	addi $s0 $s0 -2 # N-2 for output
	sw $a2 $s0	# set the fist 4 bytes of output to N-2
	multu $s0 $s0   	
	mflo $s0	# total pixels to convolute
	
	li $s7 4	#initial offset
	add $s7 $s7 $a0	

	bgtz $s0 outer  # there's at least 1 pixel to convolute
	b done		# there are no pixels to convolute


outer:
	bgtz $s0 inner 	# decrement s7 at end of inner
	
	b done
	

inner:
	#t3 = RED SUM, t5 = GREEN SUM, t7 = BLUE SUM

#	li $t0 4	# offset
#	add $t0, $t0, $a0


	lb $t0 ($s7)	# input R val pix 0
	lb $t1 0($a1) 	# kernel 0
	mult $t0 $t1
	mflo $t3      	
	addi $s7 1	# increment: G value, same pixel

	lb $t0 ($s7) 	# input G val pix 0
	mult $t0 $t1 	
	mflo $t5	
	addi $s7 1	

	lb $t0 ($s7)	# input B val pix 0
	mult $t0 $t1
	mflo $t7
	addi $s7 1	#increment: next pixel

####
	
	lb $t0 ($s7) 	# input R val pix 1 
	lb $t1 1($a1) 	# kernel 1
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 1
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 1
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 2 
	lb $t1 2($a1) 	# kernel 2
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 2
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 2
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 3 
	lb $t1 3($a1) 	# kernel 3
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 3
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 3
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 4 
	lb $t1 4($a1) 	# kernel 4
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 4
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 4
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 5 
	lb $t1 5($a1) 	# kernel 5
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 5
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 5
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 6 
	lb $t1 6($a1) 	# kernel 6
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 6
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 6
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 7
	lb $t1 7($a1) 	# kernel 7
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 7
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 7
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1      # increment: next pixel

####

	lb $t0 ($s7) 	# input R val pix 8 
	lb $t1 8($a1) 	# kernel 8
	mult $t0 $t1
	mflo $t4      	
	add $t3 $t3 $t4 # sum RED
	addi $s7 1	

	lb $t0 ($s7)	# input G val pix 8
	mult $t0 $t1
	mflo $t6
	add $t5 $t5 $t6 # sum GREEN
	addi $s7 1	

	lb $t0 ($s7) 	# input B val pix 8
	mult $t0 $t1
	mflo $t8
	add $t7 $t7 $t8	# sum blue
	addi $s7 1	


	
	sb $s1 ($t3)   	# new value of R for target pixel
	sb $s2 ($t5) 	# new value of G for target pixel
	sb $s3 ($t7)	# new value of B for target pixel
	addi $s0 -1 	# decrement number of pixels left to conv


	#save those values to a2

	li $t9 4 	# offset for a2
	add $t9 $t9 $a2
	sb ($t9) s1 	# R
	addi $t9 1   	
	sb ($t9) s2	# G
	addi $t9 1	
	sb ($t9) s3	# B

	# need a line to save t9 into a2
	
	j outter
	
		
done:
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
	lw   $t1, 0($s7)       # t1 = N 

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
	
	lbu $a0, 0($s7) # print R
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall
	lbu $a0, 1($s7) # print G
	li $v0, 1
	syscall
	li $a0, 32     # print space
	li $v0, 11
	syscall
	lbu $a0, 2($s7) # print B
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

