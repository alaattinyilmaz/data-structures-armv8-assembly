	.globl getlength
getlength:
	MOV X12, #0 // counter
	MOV X9, X0 // X9 = addr
	B while
while:
	LDUR X10, [X9, #8] // X10 = next
	cmp X10, #0 // while(next != NULL)
	B.eq entwhile
	//else X10 = addr2 and then X9 = addr2
	MOV X9, X10
	ADD X12, X12, #1 // counter++
	B while
entwhile:
	MOV X0, X12
	BR X30
