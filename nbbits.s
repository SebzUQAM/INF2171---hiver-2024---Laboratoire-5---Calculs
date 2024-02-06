	.eqv printint, 1
	.eqv readint, 5
	.eqv exit, 10
	
	li a7, readint
	ecall
	
	li s1, 0
	li s2, 1
loop :
	beqz  a0, end
	
	andi s3, a0, 1
	beqz s3, jump
		addi s1, s1, 1
	jump :
	srli a0, a0, 1
	j loop
	
end :

	li a7, printint
	mv a0, s1
	ecall
	
	li a7, exit
	ecall