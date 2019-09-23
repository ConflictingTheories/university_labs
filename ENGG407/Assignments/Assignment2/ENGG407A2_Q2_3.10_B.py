# ENGG 407 - Assignment 2 - Q2 - 3.10b
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Import library required for sqrt()
import math

# Set Initial Starting Point
x1 = 2.0

print "First Method:"

# Iterate 5 times for first method
for i in range(5):
	
	# Find New Point
	g1x1 = math.sqrt( 5*(x1**(0.3333)) - 1 )
	
	# Set New Point
	x1 = g1x1

	# Value of Equation at Point
	Fx1 = x1**2 - 5*(x1**(0.3333)) + 1
	
	# Output Iterated root
	print "\t%i:\tX: %.4f\tF(x): %.4f" % (i+1, x1, Fx1)
	
# Reset to initial point
x1 = 2.0

print "\nSecond Method:"

# Iterate 5 times for second method
for i in range(5):

	# Find new point
	g2x1 = ( (x1**2 + 1)/5 )**3

	# Set New Point
	x1 = g2x1

	# Value of Equation at Point
	Fx1 = x1**2 - 5*(x1**(0.3333)) + 1

	# Output Iterated root
	print "\t%i:\tX: %.4f\tF(x): %.4f" % (i+1, x1, Fx1)
