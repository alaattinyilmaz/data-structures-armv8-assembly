	.globl bstinsert
bstinsert:
	SUB SP,SP, #32 // Make room for 3 registers on stack
	MOV X10, #0
	STUR X10, [SP, #16] // right = nullptr
	STUR X10, [SP, #8] // left = nullptr
	STUR X1, [SP, #0] // data in stack
	MOV X12, SP // new node address
	mov X9, X0 // X9 = root = x
	mov X10, #0 // y = null
	B while
while:
	cmp X9, #0 // if (x != null)
	b.eq entwhile
	mov X10, X9 // y = x
	LDUR X13,[X10, #0] // X13 = x->key
	cmp X1, X13
	b.ge goright
	// else going left
	LDUR X9, [X9, #8] // x = x->left
	B while
goright:
	LDUR X9, [X9, #16] // x = x->right
	B while
entwhile:
	cmp X10, #0 // if (y == null)
	b.eq ynull
	LDUR X11,[X10, #0] // X11 = y->key
	cmp X1,X11 // data < y->key
	b.ge yright
	// else going left
	STUR X12, [X10, #8] // y->left = newnode
	b done
ynull:
	MOV X10, X12 // y = newnode
	b done
yright:
	STUR X12,[X10, #16] // y->right = newnode
	b done
done:
	MOV X0, X12
	BR X30
