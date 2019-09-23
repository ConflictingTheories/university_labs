# ENGG 407 - Assignment 2 - Q1 - 3.3b
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

# Set Target Centroid
Ct = 0.75

# Iterate 4 Times
for i in range(4):

	# Find Boundary Values	
	Cx1 = (2*(math.sin(x1))**3)/(3*(x1 - math.sin(x1)*math.cos(x1)))
	Cx2 = (2*(math.sin(x2))**3)/(3*(x2 - math.sin(x2)*math.cos(x2)))
	
	# Find Slope of Secant Line
	m = (Cx2 - Cx1)/(x2 - x1)

	# Find Intercept of Secant Line
	b = (Cx2 - m*x2)

	# Calculate new point
	xi = (Ct - b)/m

	# Find new centroid Value
	Cxi = (2*(math.sin(xi))**3)/(3*(xi - math.sin(xi)*math.cos(xi)))

	# Output Value
	print "%i: Angle: %.4f Centroid: %.4f%s" % (i+1, xi, Cxi, "r")

	# If root, break
	if (Cxi == Ct):
		break
	# Else Replace Corresponding Boundary Position
	elif (Cxi > Ct and Cx1 > Ct) or (Cxi < Ct and Cx1 < Ct): 
		x1 = xi
	else:
		x2 = xi
