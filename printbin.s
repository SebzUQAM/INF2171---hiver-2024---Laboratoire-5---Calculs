	.eqv printint, 1
	.eqv readint, 5
	.eqv exit, 10
	
	li a7, readint
	ecall
	mv s0, a0
	
	li s1, 63
	li a7, printint
loop:
	srl s2, s0, s1
	andi a0, s2, 1
	ecall
	
	addi s1, s1, -1
	
	bgez  s1, loop
	
	li a7, exit
	ecall
	