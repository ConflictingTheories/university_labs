# ENGG 407 - Assignment 2 - Q1 - 3.8
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Import Math Library for Sin() and Cos()
import math

# Set Initial Boundaries
x1 = 0.1
x2 = 1.4

print "First Positive Root:"

# Iterate 4 Times
for i in range(4):

	# Find Initial Value
	yx1 = x1**2 + 4*math.sin(2*x1) - 2

	# Find Slope of Tangent Line
	m = 2*x1 + 8*math.cos(2*x1)

	# Find Intercept of Line
	b = (yx1 - m*x1)

	# Calculate new point
	xi = (-b)/m

	# Find new value
	yxi = xi**2 + 4*math.sin(2*xi) - 2

	# Output Value
	print "\t%i: Root: %.4f Value: %.4f" % (i+1, xi, yxi)

	# If root, break
	if (yxi == 0):
		break
	# Else Replace Corresponding point
	else:
		x1 = xi

print "\nSecond Positive Root:"

# Iterate 4 Times
for i in range(4):

	# Find Boundary Values	
	yx2 = x2**2 + 4*math.sin(2*x2) - 2
	
	# Find Slope of Line
	m = 2*x2 + 8*math.cos(2*x2)

	# Find Intercept of Line
	b = (yx2 - m*x2)

	# Calculate new point
	xi = (-b)/m

	# Find value at new point
	yxi = xi**2 + 4*math.sin(2*xi) - 2

	# Output Value
	print "\t%i: Root: %.4f Value: %.4f" % (i+1, xi, yxi)

	# If root, break
	if (yxi == 0):
		break
	# Else Replace point
	else:
		x2 = xi
