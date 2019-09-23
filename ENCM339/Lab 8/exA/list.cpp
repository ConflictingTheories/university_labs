/*
 * list.cpp
 *
 *  Created on: Nov 24, 2011
 *      Author: Kyle Derby MacInnis and Eric Sobkowicz
 *      Lab: B05
 *      Group: 82
 */

#include "list.h"

FlowList::FlowList()
{
	headM = NULL;
	cursorM = NULL;
}

FlowList::FlowList(const FlowList& source)
{
	copy(source);
}

FlowList::~FlowList()
{
	destroy();
}

FlowList& FlowList::operator =(const FlowList& rhs)
{
	copy(rhs);
	return *this;
}

const ListItem& FlowList::getItem() const
{
	return cursorM->item;
}

void FlowList::reset()
{
	cursorM = headM;
}

bool FlowList::isOn() const
{
	if(cursorM != NULL)
		return true;
	else
		return false;
}

const Node* FlowList::cursor() const
{
	return cursorM;
}

void FlowList::forward()
{
	if(isOn())
		cursorM = cursorM->next;
}

void FlowList::insert(const ListItem& itemA)
{
	//Create List Node in HEAP and copy values from passed item
	Node *copy = new Node;
	copy->item.year = itemA.year;
	copy->item.flow = itemA.flow;

	reset();

	//Move through list until proper spot it found
	while(isOn() && cursorM->next != NULL && cursorM->next->item.year <= copy->item.year)
	{
		//If duplicate exists stop function
		if(cursorM->item.year == copy->item.year || cursorM->next->item.year == copy->item.year)
		{
			cout << "\nError: Duplicate Data.";
			return;
		}
		forward();
	}

	//If position is first Item
	if(cursorM == headM)
	{
		//If no items in list
		if(!isOn())
		{
			headM = copy;
			headM->next = NULL;
			cout << "\nNew record inserted successfully.";
		}
		else
		{
			//If First item is before new item
			if(cursorM->item.year < copy->item.year)
			{
				copy->next = cursorM->next;
				headM->next = copy;
				cout << "\nNew record inserted successfully.";
			}
			//If new item comes before first
			else
			{
				headM = copy;
				headM->next = cursorM;
				cout << "\nNew record inserted successfully.";
			}
		}
	}
	//If any other place in the list
	else
	{
		copy->next = cursorM->next;
		cursorM->next = copy;
		cout << "\nNew record inserted successfully.";
	}
}

void FlowList::remove(int target_year)
{
	//Declare variables
	Node* ptr;
	bool del = false;

	reset();
	//If first item is the one
	if(cursorM->item.year == target_year)
	{
			headM = cursorM->next;
			delete cursorM;
			del = true;
	}
	//Loop through rest of list
	else
	{
		while(isOn() && cursorM->next != NULL)
		{
			ptr = cursorM;
			forward();
			if(cursorM->item.year == target_year)
			{
				ptr->next = cursorM->next;
				delete cursorM;
				del = true;
				cout << "\n\nRecord was successfully removed.";
				break;
			}
		}
	}
	//If year not found
	if(!del)
		cout << "\nThe year " << target_year << " was not found.";
}

int FlowList::count()
{
	int i;

	reset();
	for(i = 0; cursorM != NULL; i++)
	{
		forward();
	}
	return i;
}

void FlowList::copy(const FlowList& source)
{
	headM = source.headM;
	cursorM = headM;
}

void FlowList::destroy()
{
	Node *ptr;
	reset();

	//Loop through and remove all list items
	while(cursorM != NULL)
	{
		ptr = cursorM->next;
		delete cursorM;
		cursorM = ptr;
	}
}
