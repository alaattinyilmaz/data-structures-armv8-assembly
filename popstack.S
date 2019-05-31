	.globl popstack
popstack:
	MOV X9, X0 // X9 = addr
	LDUR X10, [X9, #8] // X10 = head->next (head was dummy -1)
	cmp X10, #0 // There is no element case
	b.eq nopop
	LDUR X0, [X10, #0]
	LDUR X10, [X10,#8] // X10 = head->next->next
	STUR X10, [X9, #8] // next = addr (ins)
	BR X30
nopop:
	MOV X0, #-1
	BR X30
