	.globl deletenode
deletenode:
	MOV X9, X0 // X9 = addr
	MOV X11, X9 // prev = addr
	B while
while:
	cmp X9, #0 // while(addr != NULL)
	B.eq notfound
	LDUR X10, [X9, #8] // X10 = next
	LDUR X12, [X9, #0] // X11 = data
	cmp X12, X1 // while(data != del)
	B.eq entwhile
	MOV X11, X9 // prev = temp = addr
	MOV X9, X10
	B while
entwhile:
	STUR X10, [X11, #8] // prev->next = temp->next;
	MOV X0, X12
	BR X30
notfound:
	MOV X0, #1111
	BR X30
