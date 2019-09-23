/*
 * threenum.c
 * ENCM 339 - Fall 2011 - Lab 1 - Exercise B
 *
 * Completed by:    REPLACE THIS WITH YOUR NAME
 * Lab Section:     REPLACE THIS WITH YOUR LAB SECTION
 */

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int a, b, c, nscan;    

  /* Get values for a, b, and c from user.    */
  /* Quit if the user enters garbage.     */
  printf("Please enter a value for the int variable a: ");
  nscan = scanf("%d", &a);
  if (nscan != 1) {
    printf("Your input could not be converted to an int.  I quit.\n\n");
    exit(1);
  }

  printf("Please enter a value for the int variable b: ");
  nscan = scanf("%d", &b);
  if (nscan != 1) {
    printf("Your input could not be converted to an int.  I quit.\n\n");
    exit(1);
  }
  printf("Please enter a value for the int variable c: ");
  nscan = scanf("%d", &c);
  if (nscan != 1) {
    printf("Your input could not be converted to an int.  I quit.\n\n");
    exit(1);
  }

  /* Echo the values entered by the user. */
  printf("\nThe values you entered were a = %d, b = %d, and c = %d.\n",
         a, b, c);
  if( a == b && b == c )
  {
	  printf("\nAll three numbers are equal.");
  }
  else if( a != b && a != c && b != c)
  {
	  printf("\nNo two numbers are the same.");
  }
  if( a == 7 || b == 7 || c == 7)
  {
	  printf("\nAt least one of the numbers is equal to 7.");
  }
  if( c >= b && b >= a )
  {
	  printf("\nThe numbers are in non-decreasing order.");
  }
  return 0;
}
