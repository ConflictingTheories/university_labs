# ENGG 407 - Assignment 2 - Q3 - 4.7
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Setup Initial Matrix and Temp Matrix
A = [ [3.0,-2.0,5.0], [1.0,-1.0,0.0], [2.0,0.0,4.0] ]
A_ = [ [0.0,0.0,0.0], [0.0,0.0,0.0], [0.0,0.0,0.0] ]

# Setup Solution Vector and Temp Vector
b = [ 14.0, -1.0, 14.0 ]
b_ = [ 0.0, 0.0, 0.0 ]

# Number of Rows and Columns of Matrix
N = 3

# Iterate through rows
for i in range(N):
	
	# If Pivot Point is zero
	while ( A[i][i] == 0 ):
		
		# If No more rows left to try
		if (i+1 == N):
			print "Error: System has no unique solution"
			exit(-1)

		# Switch Rows with one below
		for m in range(N):
			# In Matrix
			A_[i][m] = A[i][m]
			A[i][m] = A[i+1][m]
			A[i+1][m] = A_[i][m]

			# In Known Vector
			b_[i] = b[i]
			b[i] = b[i+1]
			b[i+1] = b_[i]

	# Find Row Divisor
	DivR = A[i][i]

	# Iterate Through Remaining Rows
	for k in range(N):

		# If Pivot Row Skip
		if (k == i):
			pass

		# Otherwise Perform Elimination
		else:

			# Find Multiplier for Other Rows
			MulR = (-A[k][i])

			# Iterate through each Element in row
			for j in range(N):

				# Normalize Elements in Row
				A[i][j] = A[i][j] / DivR

				# Eliminate Column in other Rows
				A[k][j] = A[k][j] + MulR * A[i][j]
							
			# Apply Same Changes to known Vector
			b[i] = b[i] / DivR
			b[k] = b[k] + MulR*b[i]
			
			# Ensure Normalization Occurs only once per row
			DivR = 1.0

# Known vector becomes Solution Vector X
x1 = b[0]
x2 = b[1]
x3 = b[2]

# Print Solution Vector
print "\nX = [ %.4f %.4f %.4f ]" % (x1, x2, x3)
