#-----------------------------------#
#     WinDump Packet Trace Parser	#
#	------------------------------	#
#	Counts and displays the # of 	#
#	packets sent between a given	#
#	server and client address as	#
#	well as the type of protocol	#
#-----------------------------------#
#		Kyle Derby MacInnis			#
#			ENEL 573				#
#-----------------------------------#

# Import Libraries
import string
import re

# Function for Parsing Data Fields from IP Packets
def parse_IP(packet_fields):
	# IP Packet Information
	ip_tos = packet_fields[3]
	ip_ttl = packet_fields[5]
	ip_id = packet_fields[7]
	ip_offset = packet_fields[9]
	ip_flags = packet_fields[11]
	ip_proto = (packet_fields[13], packet_fields[14])
	ip_length = packet_fields[16]
	ip_sender = packet_fields[17]
	ip_receiver = packet_fields[19]
	ip_pro = packet_fields[20]
	ip_len = packet_fields[22]
	# Return Dictionary Look-up
	ret = {'ip_tos':ip_tos, 'ip_ttl':ip_ttl, 'ip_id':ip_id, 'ip_offset': ip_offset, 'ip_flags': ip_flags, 'ip_proto': ip_proto, 'ip_length':ip_length, 'sender':ip_sender, 'receiver':ip_receiver, 'protocol': ip_pro, 'length': ip_len}
	return ret

# Ask for # of Files
fileNum = input("How many files are you parsing: ")
# Ask for Verbosity
v = input("Verbose - (y or n):")

# Loop through files
for i in range(0,int(fileNum)):

	print("Parsing File: " + str(i+1) + "/" + str(int(fileNum)))
	# Ask for filename
	filename = input("Name of the File: ")
	# Ask for Server Import
	serverIP = input("What is the Server IP Address (ex. 192.168.2.2): ")
	# Ask for the Client IP
	clientIP = input("What is the Client IP Address (ex. 192.168.12/3.2): ")
	# Ask for the TTL
	numHops = input("What is the expected ttl *(62): ")
	
	print("\t---BEGINNING " + filename + "---")
	# Initialize Counters and Flags
	# Counters
	lnCnt = 0
	clientCnt = 0
	serverCnt = 0
	Hops = 0

	# Read in File
	txt_file = open(filename, "r")

	# Parse Line-by-Line
	for line in txt_file:
		# Count # of Lines (Packets)
		lnCnt += 1;
		
		# Strip Unnecessary Information and delimiters
		line = line.replace('(','')
		line = line.replace(':','')
		line = line.replace(')','')
		line = line.replace(',','')

		# Split into words
		packet_fields = line.split()
		# Extract Timestamp
		ts = packet_fields[0]
		# Determine Packet Type
		pkt = packet_fields[1]
		# If Verbose
		if v == "y":
			print("#### PACKET: " + pkt)
			print(line)
		
		# If IP Packet
		if pkt == "IP":
			# Extract Packet info based on type
			data = parse_IP(packet_fields)
			# Specify Variables
			proto = data['protocol']
			length = data['length']
			send = data['sender']
			recv = data['receiver']
			tos = data['ip_tos']
			ttl = data['ip_ttl']
			offset = data['ip_offset']
			flags = data['ip_flags']
			iplen = data['ip_length']
			ipproto = data['ip_proto']
			length = data['length']	
			# Perform Calculations
			# ip Search Pattern
			ipPattern = re.compile('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')
			# Extract Sender and Receiver IPs
			sender = re.findall(ipPattern, send)
			receiver = re.findall(ipPattern, recv)
			# Count packets
			if sender[0] == clientIP:
				clientCnt += 1
				if ttl == str(64):
					if v == "y":
						print("Client Sent - OK")
				else:
					if v == "y":
						print("Client Sent - BAD")
			elif sender[0] == serverIP:
				serverCnt += 1
				Hops = 64 - int(ttl)
				if v == "y":
					print("# of Hops: " + str(Hops))
				if ttl == numHops:
					if v == "y":
						print("Server Sent - OK")	
				else:
					if v == "y":
						print("Server Sent - BAD")
		# if ARP packet	
		elif pkt == "arp":
			if v == "y":
				print('# ARP Packet Found - Ignoring')
			lnCnt -= 1
			continue
		else:
			if v == "y":
				print('# Unknown Packet Found - Ignoring')
			lnCnt -= 1
			continue
	
	# Display Information
	print('\t---FINISHED ' + filename + '---:\n\n')
	print('###\t# of Server Sent Packets: ' + str(serverCnt))
	print("###\t# of Client Sent Packets: " + str(clientCnt))
	print("###\tEstimated Number of Hops: " + str(Hops))
	if (serverCnt == clientCnt) and (serverCnt != 0):
		print("###\t(# of Received Packets) equals (# of Sent Packets) - Success")
# File Finished
	



