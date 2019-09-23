# ENGG 407 - Assignment 2 - Q5 - 4.14
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Setup Initial Matrix and Temp Matrix
A = [ [2.0, -4.0, 1.0], [6.0, -2.0, 1.0], [-2.0, 6.0, -2.0] ]
A_ = [ [0.0,0.0,0.0], [0.0,0.0,0.0], [0.0,0.0,0.0] ]

# Setup Solution Vector and Temp Vector
b = [ [1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0] ]
b_ = [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ]

# Setup Blank Inverse Matrix
X = [ [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0] ]

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
			b_[i] = b[i][m]
			b[i] = b[i+1][m]
			b[i+1] = b_[i][m]

	# Find Row Divisor
	DivR = A[i][i]

	# Iterate Through Remaining Rows
	for k in range(N):

		# Move to Remaining Rows
		if (k <= i):
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
				b[i][j] = b[i][j] / DivR
				b[k][j] = b[k][j] + MulR * b[i][j]
			
			# Ensure Normalization Occurs only once per row
			DivR = 1.0;			

# Solve for Solution Vector Elements
X = b

# Print Solution Vector
print X
