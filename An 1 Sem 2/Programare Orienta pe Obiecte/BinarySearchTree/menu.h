#pragma once
#include "tree.h"
#ifndef MENU_H_INCLUDED
#define MENU_H_INCLUDED
#include <cstdlib>
#include <iostream>
void wrongComnnad()
{
	system("CLS");
	cout << "\nYou entered a wrong command !\n";
	system("PAUSE");
}
void menuText()
{
	system("CLS");
	cout << "[1] -> Insert new nodes \n";
	cout << "[2] -> Delete nodes \n";
	cout << "[3] -> In-Order traversal \n";
	cout << "[4] -> Height of the tree \n";
	cout << "[5] -> Leafs list \n";
	cout << "[6] -> Exit\n";
}
void menu()
{

	BinaryTree<char> *tree = new BinaryTree<char>;
	volatile bool cont = true;
	while (cont)         // cont is used for leaving the menu
	{
		menuText();
		int comanda;
		cin >> comanda;
		switch (comanda)
		{
		case 1:
			cin >> *tree;
			break;
		case 2:
			tree->deleteNodes();
			break;
		case 3:
			tree->inOrderTraversal(cout);
			break;
		case 4:
			cout << tree->getHeight();
			system("PAUSE");
			break;
		case 5:
			tree->printLeafsNoParameter();
			break;
		case 6:
			cont = false;
			break;
		default:
			wrongComnnad();
			break;
		}
	}
}


#endif // MENU_H_INCLUDED
#pragma once
