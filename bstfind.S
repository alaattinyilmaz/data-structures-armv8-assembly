	.globl bstfind
bstfind:
	mov X9, X0
	b while
while:
	cmp X9, #0 // while (root != null)
	b.eq entwhile
	LDUR X10, [X9, #0] // X10 = root->data
	cmp X1, X10 // key > root->data
	b.gt goright
	cmp X1, X10 // key < root->data
	b.lt goleft
	// equal case
	b found
goleft:
	LDUR X9, [X9, #8] // root = root->left
	b while
goright:
	LDUR X9, [X9, #16] // root = root->right
	b while
found:
	mov x0, #1 // found
	BR X30
entwhile:
	mov x0, #0 // not found
	BR X30

