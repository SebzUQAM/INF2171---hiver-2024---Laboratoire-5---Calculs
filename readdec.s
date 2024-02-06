	.eqv readchar, 12
	.eqv printint, 1
	.eqv exit, 10
	
	li s0, 0
	
loop:
	li a7, readchar
	ecall
	
	li t0, '0'
	blt a0, t0, end
	li t0, '9'
	bgt a0, t0, end
	
	addi s1, a0, -48
	
	li t0, 10
	mul s0, s0, t0
	add s0, s0, s1
	j loop
	
end :
	li a7, printint
	mv a0, s0
	ecall
	
	li a7, exit
	ecall
	
	