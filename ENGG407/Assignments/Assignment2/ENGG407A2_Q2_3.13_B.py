# ENGG 407 - Assignment 2 - Q2 - 3.13b
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Set Initial Starting Point Coordinates
x1 = 1.0
y1 = 1.0

# Iterate 10 Times
for i in range(10):

	# Calculate New Coordinates 
	x = ( (145 - 4*(y1**2))/3 )**(0.3333)
	y = (4*(x1**2) + 28)**(0.3333)
	
	# Set New Coordinates
	x1 = x
	y1 = y

	# Evaluate New Coordinates in System
	f1 = 4*(x1**2) - (y1**3) + 28
	f2 = 3*(x1**3) + 4*(y1**2) - 145

	# Output Results
	print "%i\tX: %.4f\tY: %.4f\tF1: %.4f\tF2: %.4f" % (i+1, x1, y1, f1, f2)
