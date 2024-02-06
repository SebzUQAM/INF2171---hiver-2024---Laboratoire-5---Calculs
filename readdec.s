	.eqv readchar, 12
	.eqv printchar, 11
	.eqv printint, 1
	.eqv exit, 10
	
	li s0, 0
	li s2, 0
	
loop:
	li a7, readchar
	ecall
	
	li t0, 0
	bne s2, t0, notfirst
		li t0, '-'
		bne a0, t0, positif
		li s2, -1
		j loop
		positif :
		li s2, 1
	notfirst :
	
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
	li a7, printchar
	li a0, '\n'
	ecall
	
	mul s0, s0, s2

	li a7, printint
	mv a0, s0
	ecall
	
	li a7, exit
	ecall
	
	