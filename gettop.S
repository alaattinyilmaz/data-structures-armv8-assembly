	.globl gettop
gettop:
	LDUR X9, [X0, #8] // X9 = next
	cmp X9, #0 // next == NULL
	B.eq null
	LDUR X0, [X9, #0]
	BR X30
null:
	MOV X0, #-1
	BR X30
