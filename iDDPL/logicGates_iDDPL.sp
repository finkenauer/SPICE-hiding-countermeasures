* Description of basic logic gates as subckts in iDDPL style

.include stdCell_library.sp 			* Standard Cell Library from TSMC @40nm - Using regular transistors
.include macroStdCell_library.sp		* Standard Cell Library from TSMC @40nm - Using macro model of transistors

* ------------------------------ *
* ------ Regular Model --------- *
* ------------------------------ *

* ------------------------------ *
* 2-input NAND
.subckt nand_iDDPL a0 a1 b0 b1 clk out0 out1 vdd  
MP1 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 

MMP3 n1 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 
MMP4 n2 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q0 clk n1 0 nch width = 'log_efWn*3' length = 'length' 
MN2 q1 clk n2 0 nch width = 'log_efWn*3' length = 'length' 

MN3 n1 b1 n3 0 nch width = 'log_efWn*3' length = 'length' 
MN4 n3 a1 0  0 nch width = 'log_efWn*3' length = 'length' 
MN5 n3 b0 n2 0 nch width = 'log_efWn*3' length = 'length' 
MN6 n2 b0 n4 0 nch width = 'log_efWn*3' length = 'length' 
MN7 n2 b1 n4 0 nch width = 'log_efWn*3' length = 'length'  
MN8 n4 a0 0  0 nch width = 'log_efWn*3' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nand
.ends nand_iDDPL

* ------------------------------ *
* 2-input NOR
.subckt nor_iDDPL a0 a1 b0 b1 clk out0 out1 vdd 
MP1 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 

MMP3 n1 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 
MMP4 n2 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q1 clk n1 0 nch width = 'log_efWn*3' length = 'length' 
MN2 q0 clk n2 0 nch width = 'log_efWn*3' length = 'length' 

MN3 n1 b0 n3 0 nch width = 'log_efWn*3' length = 'length' 
MN4 n3 a0 0  0 nch width = 'log_efWn*3' length = 'length' 
MN5 n3 b1 n2 0 nch width = 'log_efWn*3' length = 'length' 
MN6 n2 b1 n4 0 nch width = 'log_efWn*3' length = 'length' 
MN7 n2 b0 n4 0 nch width = 'log_efWn*3' length = 'length'  
MN8 n4 a1 0  0 nch width = 'log_efWn*3' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nor
.ends nor_iDDPL

* ------------------------------ *
* 2-input XOR
.subckt xor_iDDPL a0 a1 b0 b1 clk out0 out1 vdd 
MP1 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 
MP2 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 

MMP3 n1 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 
MMP4 n2 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q0 clk n1 0 nch width = 'log_efWn*3' length = 'length' 
MN2 q1 clk n2 0 nch width = 'log_efWn*3' length = 'length' 

MN3 n1 b1 n3 0 nch width = 'log_efWn*3' length = 'length' 
MN4 n3 a1 0  0 nch width = 'log_efWn*3' length = 'length' 
MN5 n1 b0 n4 0 nch width = 'log_efWn*3' length = 'length' 
MN6 n4 a0 0  0 nch width = 'log_efWn*3' length = 'length' 
MN7 n2 b0 n5 0 nch width = 'log_efWn*3' length = 'length'  
MN8 n5 a1 0  0 nch width = 'log_efWn*3' length = 'length' 
MN9 n2 b1 n6 0 nch width = 'log_efWn*3' length = 'length'  
MN0 n6 a0 0  0 nch width = 'log_efWn*3' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xor
.ends xor_iDDPL


* ------------------------------ *
* ------ Macro Model ----------  *
* ------------------------------ *

* ------------------------------ *
.subckt nand_iDDPL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q0 vdd pch_mac width = 'log_efWp' length = 'length' 
XP2 vdd clk q1 vdd pch_mac width = 'log_efWp' length = 'length' 

XMP3 n1 clk vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XMP4 n2 clk vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 

XN1 q0 clk n1 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN2 q1 clk n2 0 nch_mac width = 'log_efWn*3' length = 'length' 

XN3 n1 b1 n3 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN4 n3 a1 0  0 nch_mac width = 'log_efWn*3' length = 'length' 
XN5 n3 b0 n2 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6 n2 b0 n4 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN7 n2 b1 n4 0 nch_mac width = 'log_efWn*3' length = 'length'  
XN8 n4 a0 0  0 nch_mac width = 'log_efWn*3' length = 'length'  

X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nand
.ends nand_iDDPL_mac	

* ------------------------------ *
.subckt nor_iDDPL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 
XP2 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 

XMP3 n1 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 
XMP4 n2 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 

XN1 q1 clk n1 0 nch width = 'log_efWn*3' length = 'length' 
XN2 q0 clk n2 0 nch width = 'log_efWn*3' length = 'length' 

XN3 n1 b0 n3 0 nch width = 'log_efWn*3' length = 'length' 
XN4 n3 a0 0  0 nch width = 'log_efWn*3' length = 'length' 
XN5 n3 b1 n2 0 nch width = 'log_efWn*3' length = 'length' 
XN6 n2 b1 n4 0 nch width = 'log_efWn*3' length = 'length' 
XN7 n2 b0 n4 0 nch width = 'log_efWn*3' length = 'length'  
XN8 n4 a1 0  0 nch width = 'log_efWn*3' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nor
.ends nor_iDDPL_mac

* ------------------------------ *
.subckt xor_iDDPL_mac a0 a1 b0 b1 clk out0 out1 vdd 
XP1 vdd clk q0 vdd pch width = 'log_efWp' length = 'length' 
XP2 vdd clk q1 vdd pch width = 'log_efWp' length = 'length' 

XMP3 n1 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 
XMP4 n2 clk vdd vdd pch width = 'log_efWp*2' length = 'length' 

XN1 q0 clk n1 0 nch width = 'log_efWn*3' length = 'length' 
XN2 q1 clk n2 0 nch width = 'log_efWn*3' length = 'length' 

XN3 n1 b1 n3 0 nch width = 'log_efWn*3' length = 'length' 
XN4 n3 a1 0  0 nch width = 'log_efWn*3' length = 'length' 
XN5 n1 b0 n4 0 nch width = 'log_efWn*3' length = 'length' 
XN6 n4 a0 0  0 nch width = 'log_efWn*3' length = 'length' 
XN7 n2 b0 n5 0 nch width = 'log_efWn*3' length = 'length'  
XN8 n5 a1 0  0 nch width = 'log_efWn*3' length = 'length' 
XN9 n2 b1 n6 0 nch width = 'log_efWn*3' length = 'length'  
XN0 n6 a0 0  0 nch width = 'log_efWn*3' length = 'length'  

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xor
.ends xor_iDDPL_mac