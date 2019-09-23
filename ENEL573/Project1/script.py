#-----------------------------------#
# 		Packet Trace Parser			#
#	------------------------------	#
#	Counts and displays the # of 	#
#	packets sent between a given	#
#	server and client address as	#
#	well as the type of protocol	#
#-----------------------------------#
#		Kyle Derby MacInnis			#
#			ENEL 573				#
#-----------------------------------#

#import string library
import string

# Ask for Filename
filename = input("Name of the File: ")
# Ask for Server IP
serverIP = input("What is the Server IP Address: ")
# Ask for Client IP
clientIP = input("What is the Client IP Address: ")
# Ask for Verbosity
v = input("Verbose - (y or n): ")

# Read in file
csv_file = open(filename, "r")

# Initialize Counters
srvSendCnt = 0
cltSendCnt = 0
# Initialize Field Counter & line Counter
fldCnt = 0
lnCnt = 0

# Display Welcome Message
print("\n\nBeginning Parser: ---------\n")
print("\tParsing: "+str(filename))

# Parser
for csv_line in csv_file:
	# Count Lines Parsed
	lnCnt += 1
	# Initialize Sender ID Flags
	clt = False
	srv = False
	# read in line
	csv_line = csv_line.replace('"','')
	# Initialize Field String
	field = ""
	# If Verbose
	if v == "y":
		print("\n### line:" + str(csv_line))
	# Parse Line
	for chr in csv_line:
		if chr != ',' and chr != '\n':
			field += str(chr)
		else:
			# If Source
			if (field == serverIP) and fldCnt == 2:
				srvSendCnt += 1
				srv = True
			# If Destination
			elif (field == serverIP) and (fldCnt == 3):
				cltSendCnt += 1
				clt = True
			# If packet is not UDP, do not count
			elif (field != "UDP") and (fldCnt == 4):
				if clt == True:
					cltSendCnt -= 1
				elif srv == True:
					srvSendCnt -= 1
			# If verbose print Packet information
			if v == "y":
				print("\t## field:" + str(field))
			# Adjust Field Counter and Value
			fldCnt += 1
			field = ""
	# Reset Field Counter
	fldCnt = 0
	del srv,clt

# Output Final Statistics
print("\n\t---------------------------------------")
print("\n\tParsed " + str(lnCnt) + " Lines:")
print("\n\tPackets Found: "+str(cltSendCnt + srvSendCnt))
print("\n\tClient Sent Packages:"+str(cltSendCnt)+"\tFrom: "+clientIP)
print("\n\tServer Sent Packages:"+str(srvSendCnt)+"\tFrom: "+serverIP)