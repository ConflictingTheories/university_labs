// ENGG 233 Lab 3 - Task 1.1
// Lab section: B15
// File: lab3_11.cpp
// Author: Kyle Derby MacInnis
// Created: File created by Dr. Petovello on 20 Jan 2009
// Last Modified: Oct 5, 2010
// Topic: Syntax Errors
//
// Notes: This file intentionally contains errors that prevents it from compiling.
//        It is the objective of the task to have students identify and correct
//        these errors.

// include necessary libraries
#include <iostream>
#include <cmath>

// use std namespace
using namespace std;

int main()
{
   // declare the value of PI
   const double PI = atan( 1.0 ) * 4.0;

   // declare variables to store the X and Y coordinates of two points
   double x1 = 0.0, y1 = 0.0;
   double x2 = 0.0, y2 = 0.0;

   // declare variables to store the distance and angle between the two points
   double dist, angle;

   // prompt for and read the first coordinate pair
   cout << "Enter the X and Y coordinates of the first point: ";
   cin >> x1 >> y1;

   // prompt for and read the second coordinate pair
   cout << "Enter the X and Y coordinates of the second point: ";
   cin >> x2 >> y2;

   // echo the results to the screen
   cout << endl
        << "The Point 1 is (" << x1 << ", " << y1 
        << ") and Point 2 is (" << x2 << ", " << y2 << ")" 
        << endl;

   // compute the distance between the two points
   dist = sqrt( ( x2 - x1 ) * ( x2 - x1 ) + ( y2 - y1 ) * ( y2 - y1 ) );

   // compute the angle from point 1 to point 2
   angle = atan2( y2 - y1 , x2 - x1 );

   // output the distance
   cout << "The distance between the points is: " << dist << endl;

   // output the angle in units of degrees
   cout << "The angle from Point 1 to Point 2 is: " << angle * 180.0 / PI 
        << " degrees" << endl;

	return 0;
}