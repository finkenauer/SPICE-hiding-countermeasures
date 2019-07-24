* Description of basic logic gates as subckts in DPPL style

.include stdCell_library.sp 			* Standard Cell Library from TSMC @40nm - Using regular transistors
.include macroStdCell_library.sp		* Standard Cell Library from TSMC @40nm - Using macro model of transistors

* ------------------------------ *
* ------ Regular Model --------- *
* ------------------------------ *

* ------------------------------ *
* 2-input NAND
.subckt nandDPPL a0 a1 b0 b1 out0 out1 vdd
MP1_Q1 q1 b1 n5  vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q1 n5 b0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q1 n1 a1 n2  vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q1 n2 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP5_Q1 n3 a1 n4  vdd pch width = 'log_efWp*3' length = 'length' 
MP6_Q1 n4 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q1 a1 a0 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q1 a1 a1 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q1 b1 a0 n3 0 nch width = 'log_efWn*2' length = 'length' 
MN4_Q1 b1 a1 n3 0 nch width = 'log_efWn*2' length = 'length' 
MN5_Q1 n1 b1 q1 0 nch width = 'log_efWn*3' length = 'length' 
MN6_Q1 n3 b0 q1 0 nch width = 'log_efWn*3' length = 'length' 

* Dual-Rail
MP1_Q0 q0 b1 n0  vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q0 n0 b0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q0 n6 a1 n7  vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q0 n7 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP5_Q0 n8 a1 n9  vdd pch width = 'log_efWp*3' length = 'length' 
MP6_Q0 n9 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q0 a0 a0 n6 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q0 a0 a1 n6 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q0 b0 a0 n8 0 nch width = 'log_efWn*2' length = 'length' 
MN4_Q0 b0 a1 n8 0 nch width = 'log_efWn*2' length = 'length' 
MN5_Q0 n6 b1 q0 0 nch width = 'log_efWp*3' length = 'length' 
MN6_Q0 n8 b0 q0 0 nch width = 'log_efWp*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nand
.ends nandDPPL

* ------------------------------ *
* 2-input NOR
.subckt norDPPL a0 a1 b0 b1 out0 out1 vdd
MP1_Q1 q1 b1 n5  vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q1 n5 b0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q1 n1 a1 n2  vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q1 n2 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP5_Q1 n3 a1 n4  vdd pch width = 'log_efWp*3' length = 'length' 
MP6_Q1 n4 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q1 b1 a0 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q1 b1 a1 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q1 a1 a0 n3 0 nch width = 'log_efWn*2' length = 'length' 
MN4_Q1 a1 a1 n3 0 nch width = 'log_efWn*2' length = 'length' 
MN5_Q1 n1 b1 q1 0 nch width = 'log_efWn*3' length = 'length' 
MN6_Q1 n3 b0 q1 0 nch width = 'log_efWn*3' length = 'length' 

* Dual-Rail
MP1_Q0 q0 b1 n0  vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q0 n0 b0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q0 n6 a1 n7  vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q0 n7 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP5_Q0 n8 a1 n9  vdd pch width = 'log_efWp*3' length = 'length' 
MP6_Q0 n9 a0 vdd vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q0 b0 a0 n6 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q0 b0 a1 n6 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q0 a0 a0 n8 0 nch width = 'log_efWn*2' length = 'length' 
MN4_Q0 a0 a1 n8 0 nch width = 'log_efWn*2' length = 'length' 
MN5_Q0 n6 b1 q0 0 nch width = 'log_efWp*3' length = 'length' 
MN6_Q0 n8 b0 q0 0 nch width = 'log_efWp*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nand
.ends norDPPL

* ------------------------------ *
* 2-input XOR
.subckt xorDPPL a0 a1 b0 b1 out0 out1 vdd
MP1_Q1 n4 a0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q1 q1 a1 n4  vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q1 n2 b1 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q1 n1 b0 n2  vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q1 a1 b1 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q1 a0 b0 n1 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q1 n1 a0 q1 0 nch width = 'log_efWn*3' length = 'length' 
MN4_Q1 n1 a1 q1 0 nch width = 'log_efWn*3' length = 'length' 

* Dual-Rail
MP1_Q0 n7 a0 vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP2_Q0 q0 a1 n7  vdd pch width = 'log_efWp*2' length = 'length' 
MP3_Q0 n6 b1 vdd vdd pch width = 'log_efWp*3' length = 'length' 
MP4_Q0 n5 b0 n6  vdd pch width = 'log_efWp*3' length = 'length' 

MN1_Q0 a0 b1 n5 0 nch width = 'log_efWn*2' length = 'length' 
MN2_Q0 a1 b0 n5 0 nch width = 'log_efWn*2' length = 'length' 
MN3_Q0 n5 a0 q0 0 nch width = 'log_efWn*3' length = 'length' 
MN4_Q0 n5 a1 q0 0 nch width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xnor
.ends xorDPPL

* ------------------------------ *
* ------ Macro Model ----------  *
* ------------------------------ *

* ------------------------------ *
.subckt nandDPPL_mac a0 a1 b0 b1 out0 out1 vdd 
XP1_Q1 q1 b1 n5  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q1 n5 b0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q1 n1 a1 n2  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q1 n2 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP5_Q1 n3 a1 n4  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP6_Q1 n4 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q1 a1 a0 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q1 a1 a1 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q1 b1 a0 n3 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN4_Q1 b1 a1 n3 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN5_Q1 n1 b1 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6_Q1 n3 b0 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 

* Dual-Rail
XP1_Q0 q0 b1 n0  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q0 n0 b0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q0 n6 a1 n7  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q0 n7 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP5_Q0 n8 a1 n9  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP6_Q0 n9 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q0 a0 a0 n6 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q0 a0 a1 n6 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q0 b0 a0 n8 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN4_Q0 b0 a1 n8 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN5_Q0 n6 b1 q0 0 nch_mac width = 'log_efWp*3' length = 'length' 
XN6_Q0 n8 b0 q0 0 nch_mac width = 'log_efWp*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nand
.ends nandDPPL_mac

* ------------------------------ *
.subckt norDPPL_mac a0 a1 b0 b1 out0 out1 vdd
XP1_Q1 q1 b1 n5  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q1 n5 b0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q1 n1 a1 n2  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q1 n2 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP5_Q1 n3 a1 n4  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP6_Q1 n4 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q1 b1 a0 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q1 b1 a1 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q1 a1 a0 n3 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN4_Q1 a1 a1 n3 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN5_Q1 n1 b1 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6_Q1 n3 b0 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 

* Dual-Rail
XP1_Q0 q0 b1 n0  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q0 n0 b0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q0 n6 a1 n7  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q0 n7 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP5_Q0 n8 a1 n9  vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP6_Q0 n9 a0 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q0 b0 a0 n6 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q0 b0 a1 n6 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q0 a0 a0 n8 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN4_Q0 a0 a1 n8 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN5_Q0 n6 b1 q0 0 nch_mac width = 'log_efWp*3' length = 'length' 
XN6_Q0 n8 b0 q0 0 nch_mac width = 'log_efWp*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nand
.ends norDPPL_mac

* ------------------------------ *
.subckt xorDPPL_mac a0 a1 b0 b1 out0 out1 vdd
XP1_Q1 n4 a0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q1 q1 a1 n4  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q1 n2 b1 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q1 n1 b0 n2  vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q1 a1 b1 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q1 a0 b0 n1 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q1 n1 a0 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN4_Q1 n1 a1 q1 0 nch_mac width = 'log_efWn*3' length = 'length' 

* Dual-Rail
XP1_Q0 n7 a0 vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP2_Q0 q0 a1 n7  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP3_Q0 n6 b1 vdd vdd pch_mac width = 'log_efWp*3' length = 'length' 
XP4_Q0 n5 b0 n6  vdd pch_mac width = 'log_efWp*3' length = 'length' 

XN1_Q0 a0 b1 n5 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN2_Q0 a1 b0 n5 0 nch_mac width = 'log_efWn*2' length = 'length' 
XN3_Q0 n5 a0 q0 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN4_Q0 n5 a1 q0 0 nch_mac width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * xor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * xnor
.ends xorDPPL_mac