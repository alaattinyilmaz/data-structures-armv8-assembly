	.globl hashfind
hashfind:
	SUB X9, X1, #1 // X9 = 1023
	AND X10, X2, X9 // hashindex : 1024 is power of two we can make and operation for modulo => hashindex = data % SIZE;
	ADD X9, X1, #1 // X9 = 1024 = SIZE
	LSL X10, X10, #3 // Array address hashindex*4
	ADD X11, X0, X10 // X11 = addr of arr[hashindex*4]
	LDUR X12, [X11, #0] // X12 = arr[hashindex]
	mov X13, #1 // i=1
	B while
while:
	LDUR X12, [X11, #0] // X12 = arr[hashindex]
	cmp X12, X2 // arr[hashindex] != data
	b.eq entwhile
	cmp X10, X9 // hashindex < SIZE
	b.ge entwhile
	cmp X13, #10 // i < 5
	b.ge entwhile
	ADD X11, X11, #8 // addr hashindex = addr hashindex + 1
	ADD X10, X10, #1 // hashindex = hashindex + 1
	ADD X13, X13, #1 // i++
	B while
entwhile:
	cmp X12, X2 // arr[hashindex] == data
	b.ne notfound
	MOV X0, #1 // data is found
	BR X30
notfound:
	mov X0, #0 // data is not found
	BR X30
