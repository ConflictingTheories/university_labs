*version 9.1 1400934762
u 55
R? 2
C? 2
M? 2
V? 3
? 2
@libraries
@analysis
.AC 1 3 0
+0 101
+1 10
+2 100Meg
.DC 0 0 0 0 1 1
+ 0 0 V2
+ 0 4 0V
+ 0 5 5.0V
+ 0 6 0.1V
.TRAN 0 0 0 0
+0 0ns
+1 60us
.OP 0 
.LIB C:\Users\Kyle\Documents\University\ENCM467\Assignments\ENCM467ASSN1.lib
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
pageloc 1 0 2048 
@status
c 113:00:17:17:24:16;1358468656
n 0 113:00:17:17:24:19;1358468659 e 
s 2832 113:00:17:17:24:19;1358468659 e 
e 0 113:00:17:17:08:00;1358467680 e 
*page 1 0 970 720 iA
@ports
port 8 AGND 410 190 h
port 10 AGND 360 310 h
port 9 AGND 460 310 h
port 4 AGND 530 310 h
@parts
part 2 r 410 130 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 6 VDC 410 150 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 7 VSRC 360 270 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 20 10 hcn 100 REFDES=V2
a 1 u 0 0 0 0 hcn 100 AC=1V
a 1 u 0 0 0 0 hcn 100 DC=5V
a 1 u 0 0 0 0 hcn 100 TRAN=pulse(0 10 0 10e-9 10e-9 10us 20us)
part 3 c 480 180 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
part 5 MbreakN4 430 240 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -16 40 hln 100 MODEL=M4007N
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 12
s 410 150 410 130 11
w 14
s 360 270 360 240 13
s 360 240 430 240 15
w 22
s 460 260 460 280 21
s 460 280 460 310 25
s 460 280 470 280 23
s 470 280 470 260 26
w 34
s 530 180 530 310 35
s 510 180 530 180 33
w 29
s 460 220 460 180 17
s 460 130 450 130 19
s 460 180 460 130 42
s 480 180 460 180 30
@junction
j 410 190
+ s 8
+ p 6 -
j 360 310
+ s 10
+ p 7 -
j 410 150
+ p 6 +
+ w 12
j 410 130
+ p 2 1
+ w 12
j 530 310
+ s 4
+ w 34
j 510 180
+ p 3 2
+ w 34
j 430 240
+ p 5 g
+ w 14
j 460 220
+ p 5 d
+ w 29
j 460 260
+ p 5 s
+ w 22
j 470 260
+ p 5 b
+ w 22
j 360 270
+ p 7 +
+ w 14
j 460 310
+ s 9
+ w 22
j 460 280
+ w 22
+ w 22
j 450 130
+ p 2 2
+ w 29
j 480 180
+ p 3 1
+ w 29
j 460 180
+ w 29
+ w 29
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
