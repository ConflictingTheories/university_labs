/*
 * hydro.h
 *
 *  Created on: Nov 24, 2011
 *      Author: Kyle Derby MacInnis and Eric Sobkowicz
 *      Lab: B05
 *      Group: 82
 */
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include "list.h"

#ifndef HYDRO_H_
#define HYDRO_H_


void displayHeader();
//PROMISES: displays introduction screen

int readData(FlowList& list);
//REQUIRES: List Exists
//PROMISES: Read Data from file, and Store into list, then return number of records

int menu();
//PROMISES: display menu, and returns users choice.

void display(FlowList& list);
//REQUIRES: List exists
//PROMISES: displays years and flows to the screen, as well as calculated average
//			and median of flows.

void addData(FlowList& list, int *num_records);
//REQUIRES: List Exists, num_records != NULL
//PROMISES: Prompts for new data, and inserts data into the list. And updates
//			number of records.

void removeData(FlowList& list, int *num_records);
//REQUIRES: List Exists, num_records != NULL
//PROMISES: prompts user for year to be removed, and removes one record of that year
//			then updates number of records.

void saveData(FlowList& list);
//REQUIRES: a valid list exists
//PROMISES: saves data into file

void pressEnter();
//PROMISES: Prompts user to press enter

void cleanStandardInputStream();
//PROMISES: clears input buffer.

void clearScreen();
//PROMISES: clears Screen

#endif /* HYDRO_H_ */
