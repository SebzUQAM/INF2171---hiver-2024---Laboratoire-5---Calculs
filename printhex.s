	.eqv readint, 5
	.eqv printchar, 11
	.eqv exit, 10
	
	li a7, readint
	ecall
	mv s0, a0
	
	li s1, 60
	li a7, printchar
loop :
	srl s2, s0, s1
	andi a0, s2, 0b1111
	
	li t0, 10
	blt a0, t0 print
	
	addi a0, a0, 7
	
print :
	addi a0, a0, '0'
	ecall
	
	addi s1, s1, -4
	bgez s1, loop
	
	li a7, exit
	ecall