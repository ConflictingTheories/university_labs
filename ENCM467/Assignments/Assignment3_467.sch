*version 9.1 655317425
u 37
V? 4
M? 2
R? 2
? 3
@libraries
@analysis
.AC 0 1 0
+0 101
+1 100kHz
+2 10GHz
.DC 1 0 0 0 1 1
+ 0 0 V2
+ 0 4 0v
+ 0 5 3v
+ 0 6 .1
.OP 0 
.LIB C:\Users\Kyle\Documents\Assignment3_467.lib
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2471 
@status
n 0 113:01:06:12:56:15;1360180575 e 
s 2832 113:01:06:12:56:15;1360180575 e 
*page 1 0 970 720 iA
@ports
port 7 AGND 170 150 h
port 8 AGND 170 270 h
port 9 AGND 300 280 h
@parts
part 4 VDC 170 110 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 24 7 hcn 100 REFDES=V3
a 1 u 13 0 -11 18 hcn 100 DC=3V
part 3 VDC 170 230 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 24 7 hcn 100 REFDES=V2
a 1 u 13 0 -11 18 hcn 100 DC=1V
part 2 VAC 210 230 v
a 0 sp 0 0 0 50 hln 100 PART=VAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
a 0 u 13 0 -9 23 hcn 100 ACMAG=.1V
part 6 r 300 160 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=1k
part 5 MbreakN 270 230 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 34 nodeMarker 370 190 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 35 nodeMarker 260 230 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
@conn
w 13
a 0 up 0:33 0 0 0 hln 100 V=
s 310 250 310 270 12
s 300 280 300 270 10
s 300 270 300 250 16
a 0 up 33 0 302 260 hlt 100 V=
s 310 270 300 270 14
w 20
a 0 up 0:33 0 0 0 hln 100 V=
s 300 120 300 110 19
s 300 110 170 110 21
a 0 up 33 0 235 109 hct 100 V=
w 24
a 0 up 0:33 0 0 0 hln 100 V=
s 210 230 170 230 30
a 0 up 33 0 190 229 hct 100 V=
w 18
a 0 up 0:33 0 0 0 hln 100 V=
s 300 210 300 190 17
s 300 190 300 160 27
s 300 190 370 190 25
a 0 up 33 0 335 189 hct 100 V=
w 31
a 0 up 0:33 0 0 0 hln 100 V=
s 250 230 260 230 29
s 260 230 270 230 36
a 0 up 33 0 265 229 hct 100 V=
@junction
j 170 150
+ p 4 -
+ s 7
j 300 280
+ s 9
+ w 13
j 300 270
+ w 13
+ w 13
j 300 160
+ p 6 1
+ w 18
j 300 120
+ p 6 2
+ w 20
j 170 110
+ p 4 +
+ w 20
j 300 190
+ w 18
+ w 18
j 170 270
+ s 8
+ p 3 -
j 170 230
+ p 3 +
+ w 24
j 250 230
+ p 2 -
+ w 31
j 210 230
+ p 2 +
+ w 24
j 370 190
+ p 34 pin1
+ w 18
j 260 230
+ p 35 pin1
+ w 31
j 300 250
+ p 5 s
+ w 13
j 310 250
+ p 5 b
+ w 13
j 300 210
+ p 5 d
+ w 18
j 270 230
+ p 5 g
+ w 31
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
