// Emir Alaattin Yilmaz - Computer Architectures Project #5
// Linkedlist, Stack, Binary Search Tree, Hashtable ARMv8 Implementation
// 27.05.2019 - Sabanci University
#include <stdio.h>
#include <stdlib.h>

typedef struct Node{
    int data;
    struct Node* next;
};

typedef struct TreeNode{
    int data;
    struct TreeNode* left;
    struct TreeNode* right;
};

extern void addnode(struct Node* head, long long int ins);
extern long long int deletenode(struct Node* head, long long int ins);
extern long long int getlength(struct Node* head);
void print_table(long long int arr[]);

extern struct TreeNode* bstinsert(struct TreeNode* root, long long int data);
extern long long int bstfind(struct TreeNode* root, long long int data);
extern long long int bstfindmin(struct TreeNode* root);
extern long long int bstfindmax(struct TreeNode* root);

extern void pushstack(struct Node* head, long long int ins);
extern void popstack(struct Node* head);
extern long long int gettop(struct Node* head);

extern void hashinsert(long long int arr[], long long int SIZE, long long int data);
extern void hashdelete(long long int arr[], long long int SIZE, long long int data);
extern long long int hashfind(long long int arr[], long long int SIZE, long long int data);

long long int SIZE = 1024;
long long int arr[1024] = { 0 }; // Hash Table


void getInput(struct Node * head,struct Node * shead,struct TreeNode * root)
{

	char choice ='k',lchoice = 'k';
	long long int num;

	while(choice != 'e')
	{
	printf("Which data-structures would you want to use? \n Linkedlist: l \n Stack: s \n Hash Table: h \n Binary Search Tree: b \n Exit : e \n");
    scanf(" %c", &choice);

		if(choice == 'l')
		{
			while(lchoice != 'c')
			{
				printf("\n Insertion: i \n Deletion: d \n Getlength: g \n Change Data Structure: c \n");
				scanf(" %c", &lchoice);

				if(lchoice=='i')
				{
					printf("Insert num: ");
					scanf("%d", &num);
				    addnode(head, num);
				}
				else if(lchoice=='d')
				{
					printf("Delete num: ");
					scanf("%d", &num);
				    deletenode(head, num);
				}
				else if(lchoice=='g')
				{
					printf("Length is: ");
				    printf("%d \n", getlength(head));
					//scanf_s("%d", &num);
				}
				printf("List: ");
				print_list(head);
				// printlist();
			}
		}
		else if(choice == 's')
		{
			while(lchoice != 'c')
			{
				printf("\n Push: u \n Pop: o \n Gettop: t \n Getlength: g \n Change Data Structure: c \n");
				scanf(" %c", &lchoice);

				if(lchoice=='u')
				{
					printf("Push num: ");
					scanf("%d", &num);
					pushstack(shead,num);
				}
				else if(lchoice=='o')
				{
					popstack(shead);
				}
				else if(lchoice=='t')
				{
					printf("Top: %d", gettop(shead));
					printf("\n");
					//scanf_s("%d", &num);
				}
				else if(lchoice=='g')
				{
					printf("Length is: ");
				    printf("%d \n", getlength(shead));
				}
				print_list(shead);
			}
		}
		else if(choice == 'h')
		{
			while(lchoice != 'c')
			{
				printf("\n Insert: i \n Delete: d \n Find: f \n Change Data Structure: c \n");
				scanf(" %c", &lchoice);

				if(lchoice=='i')
				{
					printf("Insert num: ");
					scanf("%d", &num);
					hashinsert(arr,SIZE,num);
				}
				else if(lchoice=='d')
				{
					printf("Delete num: ");
					scanf("%d", &num);
					hashdelete(arr,SIZE,num);
				}
				else if(lchoice=='f')
				{
					printf("Find num: ");
					scanf("%d", &num);
					printf("Result: %d \n", hashfind(arr,SIZE,num));
				}
				printf("Table: ");
				print_table(arr);
			}
		}

		else if(choice == 'b')
		{
			while(lchoice != 'c')
			{
				printf("\n Insertion: i \n Find: f \n FindMin: n \n FindMax: x \n Change Data Structure: c \n");
				scanf(" %c", &lchoice);

				if(lchoice=='i')
				{
					printf("Insert num: ");
					scanf("%d", &num);
					if(root == NULL)
						root = bstinsert(root,num);
					else
						bstinsert(root,num);
				}
				else if(lchoice=='f')
				{
					printf("Find num: ");
					scanf("%d", &num);
					printf("Result: %d \n", bstfind(root,num));
				}
				else if(lchoice=='n')
				{
					printf("Minimum: %d \n", bstfindmin(root));
				}
				else if(lchoice=='x')
				{
					printf("Maximum: %d \n", bstfindmax(root));
				}
				printf("BST in order: ");
				print_bst(root);
			}
		}

		lchoice = 'k';
	}
}

// Linkedlist Printer for debugging purposes
void print_list(struct Node * head){
	struct Node * ptr = head;
	while(ptr)
	{
		if(ptr->data != -1)
		printf("%d ",ptr->data);

		ptr = ptr->next;
	}
	printf(" \n");
}

// Hash Table Printer for debugging purposes
void print_table(long long int arr[]){
	int i;
	for (i = 0; i < SIZE; i++)
	{
		if(arr[i] != 0)
		printf("k: %d v: %d, ", i,arr[i]);
	}
}

void print_bst(struct TreeNode *root)
{
	if (root != NULL)
    {
        print_bst(root->left);
        printf("%d ", root->data);
        print_bst(root->right);
    }
}

int main(void)
{

	struct Node * head = (struct Node*) malloc(sizeof(struct Node));
	head->data = -1;
	head->next = NULL;

	struct Node * shead = (struct Node*) malloc(sizeof(struct Node));
	shead->data = -1;
	shead->next = NULL;

	struct TreeNode * root = NULL;
	getInput(head,shead,root);

	/*
	root->data = 6;
	root->left = NULL;
	root->right = NULL;
	 */
	//print_bst(root);

	//getInput(head,shead,root);


	/*
	//root = NULL;
	printf("\n BST will be called.\n");

	root = NULL;

	bstinsert(root, 6);
	bstinsert(root, 3);
	bstinsert(root, 9);
	bstinsert(root, 7);
	bstinsert(root, 12);

	printf("\n Returned.\n");

	print_bst(root);
	//root = bstinsert(root,4);
	printf("Root Addr = %d\n", bstfindmax(root));

	//print_bst(root);

	 */

	/*
	struct TreeNode * root = (struct TreeNode*) malloc(sizeof(struct TreeNode));
	root->data = 8;
	root->left = NULL;
	root->right = NULL;
	*/

	//struct TreeNode * root = NULL;
	/*
	printf("\n BST will be called.\n");
	//root = bstinsert(root,3);
	long long int res = getnum(2);
	printf("Result = %d ", res);

	long long int res2 = bstinsert(2,3);
	printf("Result = %d ", res2);
*/
	/*
	if(root == NULL)
		printf("null");
	else
		printf("null degil");

	//printf("%d",root);
	//print_bst(root);
	 */

	/*
	printf("\nLinkedlist will be called.\n");
	addnode(head, 3);
	addnode(head, 5);

	addnode(head, 12);
	addnode(head, 7);
	addnode(head, 1);
	print_list(head);

    printf("Length = %d\n", getlength(head));

    deletenode(head, 1);
	deletenode(head, 1);
	deletenode(head, 12);
	print_list(head);
    printf("Length = %d\n", getlength(head));
	*/

	/*
	printf("\n Stack will be called.\n");
	pushstack(head, 37);
	pushstack(head, 23);
	pushstack(head, 4);
	pushstack(head, 12);
	pushstack(head, 54);
	print_list(head);
    printf("Top = %d\n", gettop(head));
    printf("Length = %d\n", getlength(head));
	popstack(head);
	popstack(head);
	popstack(head);
	print_list(head);
    printf("Top = %d\n", gettop(head));
    printf("Length = %d\n", getlength(head));
	pushstack(head,31);
	pushstack(head,64);
	print_list(head);
    printf("Top = %d\n", gettop(head));
    printf("Length = %d\n", getlength(head));
	*/

	/*
	// HASH TABLE TEST CASES
	hashinsert(arr, SIZE, 23);
	hashinsert(arr, SIZE, 1047);
	hashinsert(arr, SIZE, 2071);
	hashinsert(arr, SIZE, 353);
	hashinsert(arr, SIZE, 24);
	print_table(arr);
    printf("Result = %d\n", 3);
    hashdelete(arr, SIZE, 23);
	hashdelete(arr, SIZE, 2071);
	hashdelete(arr, SIZE, 1453);
	print_table(arr);
	long long int f1 = hashfind(arr, SIZE, 23);
	long long int f2 = hashfind(arr, SIZE, 2071);
    printf("\nResult = %d\n", f1);
    printf("Result = %d\n", f2);
    */

    while(1);
    return 0;
}
