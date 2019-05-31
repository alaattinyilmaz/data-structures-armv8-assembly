	.globl pushstack
pushstack:
	SUB SP,SP, #16 // Make room for 2 registers on stack
	MOV X9, X0 // X9 = addr
	LDUR X10, [X9, #8] // X10 = head->next (head was dummy -1)
	STUR X10, [SP, #8] // next = head
	STUR X1, [SP, #0] // ins as data
	MOV X11, SP
	STUR X11, [X9, #8] // next = addr (ins)
	LDUR X0, [X9, #0]
	BR X30
