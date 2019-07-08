* Description of basic logic gates as subckts in SABL style

.include stdCell_library.sp 			* Standard Cell Library from TSMC @40nm - Using regular transistors
.include macroStdCell_library.sp		* Standard Cell Library from TSMC @40nm - Using macro model of transistors

* ------------------------------ *
* ------ Regular Model --------- *
* ------------------------------ *

* ------------------------------ *
* 2-input NAND
.subckt nandSABL a0 a1 b0 b1 clk out0 out1 vdd  
MP1 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd q0  q1 vdd pch width = 'log_efWp' length = 'length' 
MP3 vdd q1  q0 vdd pch width = 'log_efWp' length = 'length' 
MP4 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 

MN0 n4 q1 q0  0 nch width = 'log_efWn*5' length = 'length' 
MN1 n3 q0 q1  0 nch width = 'log_efWn*5' length = 'length' 

MN2 0 clk n1  0 nch width = 'log_efWn*5' length = 'length' 

* DPDN
MN3 n1 b1 n2  0 nch width = 'log_efWn*5' length = 'length' 
MN4 n2 a1 n4  0 nch width = 'log_efWn*5' length = 'length' 
MN5 n3 b0 n1  0 nch width = 'log_efWn*4' length = 'length' 
MN6 n3 a0 n2  0 nch width = 'log_efWn*5' length = 'length' 

MN7 n4 vdd n3 0 nch width = 'log_efWn*5' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nand
.ends nandSABL

* ------------------------------ *
* 2-input NOR
.subckt norSABL a0 a1 b0 b1 clk out0 out1 vdd 
MP1 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd q0  q1 vdd pch width = 'log_efWp' length = 'length' 
MP3 vdd q1  q0 vdd pch width = 'log_efWp' length = 'length' 
MP4 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 

MN0 n4 q0  q1 0 nch width = 'log_efWn*5' length = 'length' 
MN1 n3 q1  q0 0 nch width = 'log_efWn*5' length = 'length' 

MN2 0 clk  n1 0 nch width = 'log_efWn*5' length = 'length' 

* DPDN
MN3 n1 b0  n2 0 nch width = 'log_efWn*5' length = 'length' 
MN4 n2 a0  n4 0 nch width = 'log_efWn*5' length = 'length' 
MN5 n3 b1  n1 0 nch width = 'log_efWn*4' length = 'length' 
MN6 n3 a1  n2 0 nch width = 'log_efWn*5' length = 'length' 

MN7 n4 vdd n3 0 nch width = 'log_efWn*5' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nor
.ends norSABL

* ------------------------------ *
* 2-input XOR
.subckt xorSABL a0 a1 b0 b1 clk out0 out1 vdd 
MP1 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd q0  q1 vdd pch width = 'log_efWp' length = 'length' 
MP3 vdd q1  q0 vdd pch width = 'log_efWp' length = 'length' 
MP4 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 

MN0 n4 q0 q1  0 nch width = 'log_efWn*5' length = 'length' 
MN1 n5 q1 q0  0 nch width = 'log_efWn*5' length = 'length' 

MN2 0 clk n1  0 nch width = 'log_efWn*5' length = 'length' 

* DPDN
MN3 n1 b1 n2  0 nch width = 'log_efWn*5' length = 'length' 
MN4 n2 a0 n4  0 nch width = 'log_efWn*5' length = 'length' 
MN5 n5 a1 n2  0 nch width = 'log_efWn*5' length = 'length' 
MN6 n1 b0 n3  0 nch width = 'log_efWn*5' length = 'length' 
MN7 n3 a1 n4  0 nch width = 'log_efWn*5' length = 'length' 
MN8 n3 a0 n5  0 nch width = 'log_efWn*5' length = 'length' 

MN9 n4 vdd n5 0 nch width = 'log_efWn*5' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xor
.ends xorSABL


* ------------------------------ *
* ------ Macro Model ----------  *
* ------------------------------ *

* ------------------------------ *
.subckt nandSABL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP2 vdd q0  q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP3 vdd q1  q0 vdd pch_mac width = 'log_efWp' length = 'length' 
XP4 vdd clk q0 vdd pch_mac width = 'log_efWp' length = 'length' 

XN0 n4 q1 q0  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN1 n3 q0 q1  0 nch_mac width = 'log_efWn*5' length = 'length' 

XN2 0 clk n1  0 nch_mac width = 'log_efWn*5' length = 'length' 

* DPDN
XN3 n1 b1 n2  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN4 n2 a1 n4  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN5 n3 b0 n1  0 nch_mac width = 'log_efWn*4' length = 'length' 
XN6 n3 a0 n2  0 nch_mac width = 'log_efWn*5' length = 'length' 

XN7 n4 vdd n3 0 nch_mac width = 'log_efWn*5' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nand
.ends nandSABL_mac	

* ------------------------------ *
.subckt norSABL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP2 vdd q0  q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP3 vdd q1  q0 vdd pch_mac width = 'log_efWp' length = 'length' 
XP4 vdd clk q0 vdd pch_mac width = 'log_efWp' length = 'length' 

XN0 n4 q0 q1  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN1 n3 q1 q0  0 nch_mac width = 'log_efWn*5' length = 'length' 

XN2 0 clk n1  0 nch_mac width = 'log_efWn*5' length = 'length' 

* DPDN
XN3 n1 b0 n2  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN4 n2 a0 n4  0 nch_mac width = 'log_efWn*5' length = 'length' 
XN5 n3 b1 n1  0 nch_mac width = 'log_efWn*4' length = 'length' 
XN6 n3 a1 n2  0 nch_mac width = 'log_efWn*5' length = 'length' 

XN7 n4 vdd n3 0 nch_mac width = 'log_efWn*5' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nor
.ends norSABL_mac

* ------------------------------ *
.subckt xorSABL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP2 vdd q0  q1 vdd pch_mac width = 'log_efWp' length = 'length' 
XP3 vdd q1  q0 vdd pch_mac width = 'log_efWp' length = 'length' 
XP4 vdd clk q0 vdd pch_mac width = 'log_efWp' length = 'length' 

XN0 n4 q0 q1 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN1 n5 q1 q0 0 nch_mac width = 'log_efWn*5' length = 'length' 

XN2 0 clk n1 0 nch_mac width = 'log_efWn*5' length = 'length' 

* DPDN
XN3 n1 b1 n2 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN4 n2 a0 n4 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN5 n5 a1 n2 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN6 n1 b0 n3 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN7 n3 a1 n4 0 nch_mac width = 'log_efWn*5' length = 'length' 
XN8 n3 a0 n5 0 nch_mac width = 'log_efWn*5' length = 'length' 

XN9 n4 vdd n5 0 nch_mac width = 'log_efWn*5' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * xor
.ends xorSABL_mac