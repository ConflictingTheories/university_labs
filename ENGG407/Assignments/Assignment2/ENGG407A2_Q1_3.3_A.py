# ENGG 407 - Assignment 2 - Q1 - 3.3a
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Import Math Library for Sin() and Cos()
import math

# Set Initial Boundaries
a = 0.1
b = 1.4

# Set Target Centroid
Ct = 0.75

# Iterate 4 Times
for i in range(4):

	# Bisect Interval
	h = (b + a)/2	

	# Find Boundary Values	
	Ca = (2*(math.sin(a))**3)/(3*(a - math.sin(a)*math.cos(a)))
	Cb = (2*(math.sin(b))**3)/(3*(b - math.sin(b)*math.cos(b)))
	
	# Find bisection Value
	Ch = (2*(math.sin(h))**3)/(3*(h - math.sin(h)*math.cos(h)))

	# Output Value
	print "%i: Angle: %.4f Centroid: %.4f%s" % (i+1, h, Ch, "r")

	# If root, break
	if (Ch == Ct):
		break
	# Else Replace Corresponding Boundary Position
	elif (Ch > Ct and Ca > Ct) or (Ch < Ct and Ca < Ct): 
		a = h
	else:
		b = h
