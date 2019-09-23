/*
 * list.h
 *
 *  Created on: Nov 24, 2011
 *      Author: Kyle Derby MacInnis and Eric Sobkowicz
 *      Lab: B05
 *      Group: 82
 */
#include <iostream>
#include <stdlib.h>
#include <fstream>

#ifndef LIST_H_
#define LIST_H_

using namespace std;

struct ListItem {
	int year;
	double flow;
};

struct Node {
	ListItem item;
	Node* next;
};

class FlowList {
public:
	FlowList();
	// PROMISES: Creates empty list
	FlowList(const FlowList& source);
	// REQUIRES: source refers to an existing List object
	// PROMISES: create the copy of source
	~FlowList();
	// PROMISES: Destroys an existing list.

	FlowList& operator =(const FlowList& rhs);
	// REQUIRES: rhs refers to an existing FlowList object
	// PROMISES: the left hand side object becomes the copy of rhs

	const ListItem& getItem() const;
	// REQUIRES: cursorM != NULL.
	// PROMISES: returns the item to which cursorM is attached to.

	void reset();
	// PROMISES: cursorM is equal to headM.

	bool isOn() const;
	// PROMISES: returns true if cursorM != NULL, otherwise
	// returns false

	const Node* cursor()const;
	// PROMISES: returns cursorM.

	void forward();
	// PROMISES: if cursorM != NULL, moves cursorM to the next.

	void insert(const ListItem& itemA);
	// PROMISES: A node with a copy of itemA is added in a way
	// that preserves the nondecreasing order of flows
	// in nodes. Then, sets cursorM to NULL.

	void remove(int target_year);
	// PROMISES: If a no node has an item matching the
	// target_year, list is unchanged and gives a clear message
	// that the target_year (e.g. 2000) Not Found. Otherwise
	// exactly one node with its item.year == itemA.year is
	// removed. Then, sets cursorM to NULL.

	int count ();
	// PROMISES: returns the number of nodes in the list.

	private:
	// always points to the first node in the list.

	Node *headM;
	// Initially is set to NULL, but it may point to any node.

	Node *cursorM;

	void copy(const FlowList& source);
	void destroy();
};


#endif /* LIST_H_ */
