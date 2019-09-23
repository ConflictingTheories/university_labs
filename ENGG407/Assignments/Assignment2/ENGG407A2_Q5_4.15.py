# ENGG 407 - Assignment 2 - Q5 - 4.15
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Set Initial Values
x1 = 0
x2 = 0
x3 = 0

# Iterate 3 times
for i in range(3):

	# Calculate new values
	x1 = ( 51 - 2*x2 - 3*x3 ) / 8 
	x2 = ( 23 - 2*x1 - x3 ) / 5 
	x3 = ( 20 + 3*x1 - x2 ) / 6

	# Output Values
	print "%i:\tX = [ %.4f %.4f %.4f ]" % (i+1, x1, x2, x3)
