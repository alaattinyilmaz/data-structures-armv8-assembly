	.globl hashinsert
hashinsert:
	SUB X9, X1, #1 // X9 = 1023
	AND X10, X2, X9 // hashindex : 1024 is power of two we can make and operation for modulo => hashindex = data % SIZE;
	ADD X9, X1, #1 // X9 = 1024 = SIZE
	LSL X10, X10, #3 // Array address hashindex*8
	ADD X11, X0, X10 // X11 = addr of arr[hashindex*8]
	B while
while:
	LDUR X12, [X11, #0] // X12 = arr[hashindex]
	cmp X12, #0
	b.eq entwhile // A space is found
	cmp X10, X9 // hashindex < SIZE
	b.ge entwhile
	ADD X11, X11, #8 // addr hashindex = addr hashindex + 1
	ADD X10, X10, #1 // hashindex = hashindex + 1
	B while
entwhile:
	STUR X2,[X11, #0] // arr[hashindex] = data
	MOV X0, X14
	BR X30
