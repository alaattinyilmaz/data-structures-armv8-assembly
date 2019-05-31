	.globl addnode
addnode:
	SUB SP,SP, #16 // Make room for 2 registers on stack
	MOV X9, #0
	STUR X9, [SP, #8] // next = nullptr
	STUR X1, [SP, #0] // ins as data
	MOV X9, X0 // X9 = addr
	B while
while:
	LDUR X10, [X9, #8] // X10 = next
	cmp X10, #0 // while(next != NULL)
	B.eq entwhile
	//else X10 = addr2 and then X9 = addr2
	MOV X9, X10
	B while
entwhile:
	MOV X11, SP
	STUR X11, [X9, #8] // next = addr3 (ins)
	LDUR X0, [X9, #0]
	BR X30
