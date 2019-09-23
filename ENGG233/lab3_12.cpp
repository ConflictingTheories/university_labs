// ENGG 233 Lab 3 - Task 1.2
// Lab section: B15
// File: lab3_12.cpp
// Author: Kyle Derby MacInnis
// Created: File created by Dr. Petovello on 20 Jan 2009
// Last Modified: Oct 5, 2010
// Topic: Syntax Errors
//
// Notes: This file intentionally contains a logic error to be fixed as part
//        of the lab exercise

// include necessary libraries
#include <iostream>

// use std namespace
using namespace std;

int main()
{
   // declare variables to store the X and Y coordinates of three points
   double x1 = 0.0, y1 = 0.0;
   double x2 = 0.0, y2 = 0.0;
   double xk = 0.0, yk = 0.0;

   // prompt for and read the first coordinate pair
   cout << "Enter the X and Y coordinates of Point 1: ";
   cin >> x1 >> y1;

   // prompt for and read the second coordinate pair
   cout << "Enter the X and Y coordinates of Point 2: ";
   cin >> x2 >> y2;

   // prompt for and read the value of X at which to interpolate the result
   cout << "Enter the value of X at which to compute the result: ";
   cin >> xk;

   // echo the results to the screen
   cout << endl
        << "The Point 1 is (" << x1 << ", " << y1 
        << ") and Point 2 is (" << x2 << ", " << y2 << ")" 
        << endl;

   // interpolate the value of yk
   yk = ( y2 - y1 ) * ( xk - x1 ) / ( x2 - x1 ) + y1;

   // output the result
   cout << endl << "The interpolated value at x = " << xk << " is: y = " << yk << endl;

	return 0;
}