/*
 * hydro.cpp
 *
 *  Created on: Nov 24, 2011
 *      Author: Kyle Derby MacInnis and Eric Sobkowicz
 *      Lab: B05
 *      Group: 82
 */
#include "hydro.h"

void displayHeader() {
	cout << "HEF Hydropower Studies - Fall 2011\n" << "Program: Flow Studies\n"
			<< "Version: 1.0\n" << "Lab section: B05\n"
			<< "Instructor : Dr. Garousi\n"
			<< "Produced by: Kyle Derby MacInnis and Eric Sobkowicz\n";
	pressEnter();
}

int readData(FlowList& list) {
	//Declare Variables
	char year[10], flow[20], ch;
	int i, ycount, fcount;
	bool newline = false, yeardone = false;

	//Make Temporary List
	struct ListItem List;

	ifstream file;
	file.open("flow.dat");

	if (file == NULL) {
		cerr << "File Could Not Be Opened!";
		getchar();
		exit(1);
	}

	//Read through file line by line
	for (i = 0; !file.eof(); i++) {
		ycount = 0;
		fcount = 0;
		newline = false;
		yeardone = false;
		while (!newline) {
			file.get(ch);
			//If working on year characters
			if (!yeardone) {
				if (ch == ' ' || ch == '\t') {
					yeardone = true;
				} else if (ch == '\n') {
					newline = true;
				} else {
					year[ycount] = ch;
					ycount++;
				}
			}
			//If working on flow characters
			else if (yeardone) {
				if (ch == ' ' || ch == '\t') {
					continue;
				} else if (ch == '\n') {
					newline = true;
				} else {
					flow[fcount] = ch;
					fcount++;
				}
			}
		}
		//Finalize string and Convert to Numbers
		year[ycount] = '\0';
		flow[fcount] = '\0';
		List.year = atoi(year);
		List.flow = atof(flow);

		//If valid list item, insert data
		if (ycount != 0 && fcount != 0)
			list.insert(List);
	}
	file.close();
	return i;
}

int menu() {
	int choice;
	//Show Menu and Prompt user for choice
	cout << "\n\nPlease select on the following operations\n"
			<< "1. Display data.\n" << "2. Add data.\n"
			<< "3. Save data into the file\n" << "4. Remove data\n"
			<< "5. Quit\n\n" << "Enter your choice (1, 2, 3, 4 or 5):";
	cin >> choice;
	if (choice <= 0 || choice > 5) {
		cout << "\n\nPlease enter a valid input.";
		choice = menu();
	}
	cleanStandardInputStream();
	return choice;
}

void display(FlowList& list) {
	//Declare Variables
	double smallest, sumFlow = 0;
	int index, count = list.count();
	double temprecord[count];
	struct ListItem item;

	//Set To beginning of List
	list.reset();

	//Read List Items one by one
	cout << "\nYear\t\tFlow (in Billions of Cubic Meters)\n";
	for (int i = 0; i < count; i++) {
		if (list.isOn()) {
			//Print values to screen
			item = list.getItem();
			cout << "\n" << item.year << "\t\t\t" << item.flow;
			//Make an array of flow values and update sum
			sumFlow += item.flow;
			temprecord[i] = item.flow;
			list.forward();
		} else {
			cerr << "\n\nError: List is Empty";
			return;
		}
	}
	cout << "\n\nThe Annual Average of the Flow is: " << sumFlow / count << " in Billions Cubic Meter.";

	//Sort Flows into non-decreasing order
	for (int i = 0; i < count; i++) {
		smallest = temprecord[i];
		for (int j = i + 1; j < count; j++) {
			if (smallest > temprecord[j]) {
				smallest = temprecord[j];
				index = j;
			}
		}
		temprecord[index] = temprecord[i];
		temprecord[i] = smallest;
	}

	//Find Median of the flows
	if (count % 2 == 0)
		cout << "\n\nThe Median Flow is " << (temprecord[((count) / 2) - 1]
				+ (temprecord[(count) / 2])) / 2 << " in Billions Cubic Meter.";
	else if (count % 2 == 1)
		cout << "\n\nThe Median Flow is " << temprecord[((count) / 2)] << " in Billions Cubic Meter.";
	pressEnter();
}

void addData(FlowList& list, int *num_records) {
	struct ListItem item;

	//Prompt for Data
	cout << "Please enter the year: ";
	cin >> item.year;
	cout << "Please enter the flow: ";
	cin >> item.flow;

	//Insert Data and Update Records
	list.insert(item);
	(*num_records)++;
	cleanStandardInputStream();
}

void removeData(FlowList& list, int *num_records) {
	int year;
	cout << "Please enter the year to be removed: ";
	cin >> year;
	list.remove(year);
	cleanStandardInputStream();
}

void saveData(FlowList& list) {
	ofstream file;
	struct ListItem item;

	file.open("flow.dat");

	list.reset();

	while (list.isOn()) {
		item = list.getItem();
		file << item.year << "\t\t" << item.flow << "\n";
		list.forward();
	}
	cout << "\nData has been saved to file.";

	file.close();
}

void pressEnter() {
	cout << "\n\n<<<Press Enter to Continue>>>";
	getchar();
}

void cleanStandardInputStream() {
	int i;

	do {

		i = fgetc(stdin);

	} while (i != '\n' && i != EOF);
}

void clearScreen() {
	system("cls");
}

int main() {
	//Declare Flowlist Object and other variables
	FlowList flows;
	int numRecords;
	int quit = 0;

	//Display Header and Read Data from File
	displayHeader();
	numRecords = readData(flows);

	while (1) {
		switch (menu()) {
		//Display Data
		case 1:
			clearScreen();
			display(flows);
			break;
			//Add New Data
		case 2:
			clearScreen();
			addData(flows, &numRecords);
			pressEnter();
			break;
			//Save Data to File
		case 3:
			clearScreen();
			saveData(flows);
			pressEnter();
			break;
			//Remove Data
		case 4:
			clearScreen();
			removeData(flows, &numRecords);
			pressEnter();
			break;
			//Exit Program
		case 5:
			clearScreen();
			cout << "\nProgram terminated!\n\n";
			quit = 1;
			break;
		default:
			clearScreen();
			cout << "\nNot a valid input.\n";
			pressEnter();
		}
		if (quit == 1)
			break;
	}

	return 0;
}
