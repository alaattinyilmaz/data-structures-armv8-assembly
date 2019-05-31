	.globl bstfindmax
bstfindmax:
	mov X9, X0
	cmp x9,#0
	b.eq null
	b while
null:
	MOV X0, #-1
	BR X30
while:
	LDUR X10, [X9, #16] // X10 = root->right
	cmp X10, #0 // while (root->left != null)
	b.eq entwhile
	LDUR X9, [X9, #16] // root = root->right
	b while
entwhile:
	LDUR X0, [X9, #0] // X0 = root->...->right->data
	BR X30

