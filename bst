#include <iostream>
using namespace std;
struct Node{
	int data; 
	Node *left; 
	Node *right;
};
struct s {
	Node *Tree = NULL;
	int sam = 0;
	void show(Node *Tree){
		if (Tree != NULL) {
			show(Tree->left);
			cout << Tree->data; 
			show(Tree->right); 
		}
	}
	int find(int x, Node *Tree) {
		if (x == Tree->data) {	
			cout << Tree->data << " is in TREE"<<endl;
			return 1;
		}else {
			if (Tree == NULL) {
				return 0;
			}
			else {
				if (x < Tree->data) {
					if (Tree->left != NULL)
						find(x, Tree->left);
					else {
						return 0;
					}
				}
				if (x > Tree->data) {
					if (Tree->right != NULL) {
						find(x, Tree->right);
					}
					else {
						return 0;
					}
				}
			}
		}
	}
	void delit(Node *Tree) {
		if (Tree != NULL) {
			delit(Tree->left);
			sam = sam - Tree->left->data;
			delit(Tree->right); 
			sam = sam - Tree->right->data;
			delete Tree;  
			sam = sam - Tree->data;
		}
	}
	void add(int x, Node *&Tree) {
		
		if (Tree==NULL){
			Tree = new Node; 
			Tree->data = x; 
			Tree->left = NULL;
			Tree->right = NULL;
			sam = sam + x;
		}
		else {
			if (x < Tree->data) {
				if (Tree->left != NULL)
					add(x, Tree->left);
				else {
					Tree->left = new Node;
					Tree->left->data = x;
					Tree->left->left = NULL;
					Tree->left->right = NULL;
					sam = sam + x;
				}
			}
			if (x > Tree->data) {
				if (Tree->right != NULL) {
					add(x, Tree->right);
				}
				else {
					Tree->right = new Node;
					Tree->right->data = x;
					Tree->right->left = NULL;
					Tree->right->right = NULL;
					sam = sam + x;
				}
			}
		}
	}
	int S(Node *Tree) {
		cout << sam<<endl;
		return sam;
	}
};
int main(){
	s s;
	Node *Tre = NULL;
	for (int i = 5; i > 0; i--) {
		s.add(i, Tre);
	}
	//cout << s.sum(Tre, 0) << endl;
	s.S(Tre);
	s.find(3, Tre);
	s.show(Tre); 
	s.delit(Tre->right);
	return 0;
}
