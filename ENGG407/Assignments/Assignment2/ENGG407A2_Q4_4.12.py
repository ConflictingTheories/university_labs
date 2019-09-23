# ENGG 407 - Assignment 2 - Q4 - 4.12
#
# Name: Kyle Derby MacInnis 
# Date: November 16, 2012
#
# Note: Python Programming Language

# Setup Initial Matrix and Temp Matrix
A = [ [2.0, -4.0, 1.0], [6.0, -2.0, 1.0], [-2.0, 6.0, -2.0] ]

# Setup Blank Lower and Upper Matrices
L = [ [0, 0, 0], [0, 0, 0], [0, 0, 0] ]	
U = [ [0, 0, 0], [0, 0, 0], [0, 0, 0] ]

# Setup Blank Vectors
b = [ 4.0, -10.0, -6.0 ]
y = [ 0, 0, 0 ]

# Dimensions of System
N = 3

# Iterate through rows
for i in range(N):

	L[i][0] = A[i][0]

	U[i][i] = 1.0

	# Iterate through Columns
	for j in range(N):

		# First Row
		if ( i == 0):

			U[i][j] = A[i][j] / L[i][0] ;
		
		# Calculate Lower Matrix
		elif (j <= i):

			L[i][j] = A[i][j]

			for k in range(j-1):
			
				L[i][j] -= L[i][k]*U[k][j]
		
		# Calculate Upper Matrix
		else:

			U[i][j] = A[i][j] / L[i][i]

			for k in range(i-1):

				U[i][j] -= (L[i][k]*U[k][j]) / L[i][i]


# Calculate y solution vector
y[0] = ( b[0] / L[0][0] ) 
y[1] = ( b[1] - L[1][0]*y[0] ) / L[1][1] 
y[2] = ( b[2] - L[1][0]*y[0] - L[2][1]*y[1] ) / L[2][2] 

# Calculate x solution vector
x3 = y[2] 
x2 = y[1] - U[1][2]*y[2] 
x1 = y[0] - U[0][2]*y[2] - U[0][1]*y[1]

# Output Solution
print "X = [ %.4f %.4f %.4f ]" % (x1, x2, x3)
