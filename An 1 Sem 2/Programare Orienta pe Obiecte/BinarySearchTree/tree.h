#pragma once
#ifndef GRAF_H_INCLUDED
#define GRAF_H_INCLUDED
//#include <cstdlib>

using namespace std;

template <class Y>
class Node
{
	Y value;
	Node<Y> *left, *right;
	template <typename Y> 
	friend class BinaryTree;
	friend class BinaryColoredTree;
};
template <class Y>
class BinaryTree
{
private:
	Node<Y> *first;
public:
	BinaryTree();
	~BinaryTree();
	BinaryTree(const BinaryTree<Y> &p);
	void insertNode(const Y x);
	void deleteNode(const Y x);
	void deleteNodes();
	void inOrderTraversal(ostream& os);
	void printLeafs(const Node<Y> *first);
	void printLeafsNoParameter();
	virtual int getHeight();

	//operator oveloading
	BinaryTree<Y>& operator=(const BinaryTree<Y>& other)
	{
		Node<Y> *curr = new Node<Y>;
		curr = other.first;
		stack < Node<Y> *> s;
		bool done = false;

		while (!done)
		{
			if (curr != NULL)
			{
				s.push(curr);
				curr = curr->left;
			}
			else
			{
				if (!s.empty())
				{
					curr = s.top();
					s.pop();
					this->insertNode(curr->value);
					curr = curr->right;
				}
				else
					done = true;
			}

		}

		return *this;
	}
	friend ostream& operator << (ostream& os, BinaryTree<Y>& bt)
	{
		bt.inOrderTraversal(os);
		return os;
	}
	friend istream& operator >> (istream& is, BinaryTree<Y> &bt)
	{
		int nr_nod;
		Y x;
		cout << "\nInsert the number of nodes you want to insert :\n";
		is >> nr_nod;
		cout << "\nInsert the nodes :\n";
		for (int i = 0; i<nr_nod; i++)
		{
			is >> x;
			bt.insertNode(x);
		}
		return is;
	}
	friend BinaryTree<Y>& operator + (BinaryTree<Y>& bt, Y x)
	{
		bt.insertNode(x);
		return bt;
	}
};
template <class T>
BinaryTree<T>::BinaryTree<T>()
{
	first = NULL;
}
template <class T>
BinaryTree<T> :: ~BinaryTree<T>()
{
	delete first;
}
template <class Y>
BinaryTree<Y>::BinaryTree(const BinaryTree<Y> &p)
{
	first = new Node<Y>;
	*first = *p.first;
}
template <class Y>
void BinaryTree<Y>::insertNode(const Y x)
{
	{
		if (!first)
		{
			first = new Node<Y>;            // creating the first node
			first->value = x;
			first->left = NULL;
			first->right = NULL;
		}
		else
		{
			Node<Y> * curr = first;       // creating a new node, and initialize it with the head of the tree

			while (true)
			{
				while (x < curr->value)             // then we go through the tree and find where we should fix this node
				{
					if (curr->left)
						curr = curr->left;
					else
					{
						curr->left = new Node<Y>;
						curr->left->value = x;
						curr->left->left = curr->left->right = nullptr;    // initialize our node's left and right children with nullptr;
						return;
					}
				}

				while (x > curr->value)
				{
					if (curr->right)
						curr = curr->right;
					else
					{
						curr->right = new Node<Y>;
						curr->right->value = x;
						curr->right->left = curr->right->right = nullptr;    // initialize our node's left and right children with nullptr;
						return;
					}
				}
			}
		}
	}
}
template <class Y>
void BinaryTree<Y>::inOrderTraversal(ostream& os)
{
	os << "\nIn-order traversal : ";
	Node<Y> *curr = new Node<Y>;
	curr = first;
	stack < Node<Y> *> s;
	bool done = false;

	// we start with the root and put every node from it to the left on a stack
	// then we start pop-ing the stack, display the value of each node
	// and then put the right child of the node in the stack

	while (!done)
	{
		if (curr != NULL)
		{
			s.push(curr);
			curr = curr->left;
		}
		else
		{
			if (!s.empty())
			{
				curr = s.top();
				s.pop();
				os << curr->value << " ";
				curr = curr->right;
			}
			else
				done = true;
		}

	}
	os << ".\n";
	system("PAUSE");
}
template <class Y>
void BinaryTree<Y>::deleteNode(const Y d)
{
	bool found = false;
	if (first == NULL)
	{
		cout << "\nThe tree is empty ! " << endl;
		return;
	}

	Node<Y>* curr;
	Node<Y>* parent;
	curr = first;
	parent = first;

	// Testing if the "d" value in the tree
	while (curr != NULL)        // stopping when we reach the bottom or ....
	{                                  //                     |
		if (curr->value == d)    //                     |
		{                              //                     |
			found = true;         // when we find the value
			break;
		}
		else
		{
			parent = curr;
			if (d > curr->value) curr = curr->right;
			else curr = curr->left;
		}
	}
	if (!found)                      // we leave this function if the value wasn't found
	{
		cout << "\n This node doesn't belong to the tree ! " << endl;
		return;
	}

	/*
	If we found the value, there are three cases :
	1. When you remove a leaf node ( a node without any clindren)
	2. When you remove a noda with a single child
	3. When you remove a node with both clildren

	There is a different approach for each case

	*/

	// if the node has a single child

	if ((curr->left == NULL && curr->right != NULL) || (curr->left != NULL && curr->right == NULL))
	{
		// right child present, no left child
		if (curr->left == NULL && curr->right != NULL)
		{
			if (parent->left == curr)
			{
				parent->left = curr->right;
				delete curr;
			}
			else
			{
				parent->right = curr->right;
				delete curr;
			}
		}
		else
			// left child present, no right child
		{
			if (parent->left == curr)
			{
				parent->left = curr->left;
				delete curr;
			}
			else
			{
				parent->right = curr->left;
				delete curr;
			}
		}
		return;
	}

	// if our node is a leaf ( has no child )

	if (curr->left == NULL && curr->right == NULL)
	{
		if (parent->left == curr) parent->left = NULL;
		else parent->right = NULL;
		delete curr;
		return;
	}


	// Node with both children
	// we will replace node with smallest value in right subtree
	// this means that we are looking for the lowest value lower than our node's value

	if (curr->left != NULL && curr->right != NULL)
	{
		Node<Y>* node1;
		node1 = curr->right;

		// if the smallest value in right subtree has no children

		if ((node1->left == NULL) && (node1->right == NULL))
		{
			curr = node1;
			delete node1;
			curr->right = NULL;
		}
		else    // right child has children

		{

			//if the node's right child has a left child
			// move all the way down left to locate smallest element

			if ((curr->right)->left != NULL)
			{
				Node<Y>* lcurr;
				Node<Y>* lcurrp;
				lcurrp = curr->right;
				lcurr = (curr->right)->left;
				while (lcurr->left != NULL)
				{
					lcurrp = lcurr;
					lcurr = lcurr->left;
				}
				curr->value = lcurr->value;
				delete lcurr;
				lcurrp->left = NULL;
			}
			else
			{
				Node<Y>* tmp;
				tmp = curr->right;
				curr->value = tmp->value;
				curr->right = tmp->right;
				delete tmp;
			}

		}
		return;
	}
}
template <class Y>
void BinaryTree<Y>::deleteNodes()
{
	int nr_elems;
	Y elems;
	cout << "\nYou can delete the following nodes : ";
	this->inOrderTraversal(cout);
	cout << "\nInsert the number of nodes you want to delete : ";
	cin >> nr_elems;
	for (int i = 0; i < nr_elems; i++)
	{
		cout << "\nInsert the node value you want to delete : ";
		cin >> elems;
		this->deleteNode(elems);
		cout << "\nThe node number " << elems << " has been deleted.\n";
	}
	system("PAUSE");
}
template <class Y>
void BinaryTree<Y>::printLeafs(const Node<Y> *node)
{
	if (node == NULL)
		return;
	printLeafs(node->left);
	if (node->left == NULL && node->right == NULL)
		cout << node->value << " ";
	printLeafs(node->right);
}
template <class Y>
void BinaryTree<Y>::printLeafsNoParameter()
{
	system("CLS");
	cout << "\n The leaf list is : ";
	printLeafs(first);
	cout << "\n";
	system("PAUSE");
}
template <class Y>
int BinaryTree<Y>::getHeight()
{
	cout << "\n The height of the tree is  : ";
	if (first == NULL)
		return 0;

	// Create an empty queue for level order tarversal
	queue <Node<Y> *> q;

	// push-int the first node to the queue
	q.push(first);
	int height = 0;

	while (true)
	{
		// nodeCount (queue size) indicates number of nodes
		// at current lelvel.
		int nodeCount = q.size();
		if (nodeCount == 0)
			return height;

		height++;

		// Dequeue all nodes of current level and Enqueue all
		// nodes of next level

		while (nodeCount > 0)
		{
			Node<Y> *node = q.front();
			q.pop();
			if (node->left != NULL)
				q.push(node->left);
			if (node->right != NULL)
				q.push(node->right);
			nodeCount--;
		}
	}
	cout << ".\n";
}


#endif // GRAF_H_INCLUDED
#pragma once
