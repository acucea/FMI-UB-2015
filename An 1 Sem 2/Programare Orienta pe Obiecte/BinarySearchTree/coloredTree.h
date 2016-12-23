#pragma once
#include "tree.h"
#include <string>

class ColoredNode : public Node<int>
{
	int black_color;
	ColoredNode *right;
	ColoredNode *left;
public :
	friend class BinaryColoredTree;
	int getColor() { return black_color; };
	void setColor(int x) { black_color = x; };
	ColoredNode();
	~ColoredNode()
	{
		delete right;
		delete left;
	}
};
ColoredNode::ColoredNode()
{
	black_color = 0; // the initial color of the node is red;
}
class BinaryColoredTree : public BinaryTree<char>
{
	ColoredNode *primul;
	int height;
public :
	//BinaryColoredTree(int x);
	BinaryColoredTree();

	~BinaryColoredTree();
	int getHeight();
};
BinaryColoredTree::BinaryColoredTree()
{
	primul = NULL;
}
BinaryColoredTree::~BinaryColoredTree()
{
	delete primul;
}
int BinaryColoredTree::getHeight()
{
	cout << "\n The number of black nodes in any path is  : ";
	if (!primul)
		return 0;

	ColoredNode *node = primul;
	int height = 0;
	

	while (true)
	{
		while (node)
		{
			if (node->black_color == 1)
				height++;
			if (node->left)
				node = node->left;
				else if (node->right)
					node = node->right;
				else
					return height;
		}
	}


	
	cout << ".\n";
}