* Description of basic logic gates as subckts in PCSL style

.include stdCell_library.sp 			* Standard Cell Library from TSMC @40nm - Using regular transistors
.include macroStdCell_library.sp		* Standard Cell Library from TSMC @40nm - Using macro model of transistors

* ------------------------------ *
* ------ Regular Model --------- *
* ------------------------------ *

* ------------------------------ *
* 2-input NAND
.subckt nand_PCSL a0 a1 b0 b1 req out0 out1 vdd  
MP1 vdd req q0  vdd pch width = 'log_efWp'   length = 'length' 
MP2 q0  0   n1  vdd pch width = 'log_efWp*2' length = 'length' * dummy transistor
MP3 n1  a1  vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP4 n1  b1  vdd vdd pch width = 'log_efWp*2' length = 'length' 

MP5 vdd req q1  vdd pch width = 'log_efWp'   length = 'length' 
MP6 q1  b0  n2  vdd pch width = 'log_efWp*2' length = 'length'  
MP7 n2  vdd vdd vdd pch width = 'log_efWp*2' length = 'length' * dummy transistor
MP8 n2  a0  vdd vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q0 a1 n3 0 nch width = 'log_efWn*3' length = 'length' 
MN2 n3 b1 n4 0 nch width = 'log_efWn*3' length = 'length' 
MN3 n3 0  n4 0 nch width = 'log_efWn*3' length = 'length'  * dummy transistor

MN4 q1 vdd n5 0 nch width = 'log_efWn*3' length = 'length' * dummy transistor
MN5 n5 a0 n4  0 nch width = 'log_efWn*3' length = 'length' 
MN6 n5 b0 n4  0 nch width = 'log_efWn*3' length = 'length' 
 
MN7 n4 req 0  0 nch width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nand
.ends nand_PCSL

* ------------------------------ *
* 2-input NOR
.subckt nor_PCSL a0 a1 b0 b1 req out0 out1 vdd 
MP1 vdd req q0  vdd pch width = 'log_efWp'   length = 'length' 
MP2 q0  b1  n1  vdd pch width = 'log_efWp*2' length = 'length'  
MP3 n1  a1  vdd vdd pch width = 'log_efWp*2' length = 'length' 
MP4 n1  vdd vdd vdd pch width = 'log_efWp*2' length = 'length' * dummy transistor

MP5 vdd req q1  vdd pch width = 'log_efWp'   length = 'length' 
MP6 q1  0   n2  vdd pch width = 'log_efWp*2' length = 'length' * dummy transistor
MP7 n2  b0  vdd vdd pch width = 'log_efWp*2' length = 'length'  
MP8 n2  a0  vdd vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q0 vdd n3 0 nch width = 'log_efWn*3' length = 'length' 
MN2 n3 b1  n4 0 nch width = 'log_efWn*3' length = 'length' 
MN3 n3 a1  n4 0 nch width = 'log_efWn*3' length = 'length' * dummy transistor

MN4 q1 b0 n5 0 nch width = 'log_efWn*3' length = 'length'  * dummy transistor
MN5 n5 a0 n4 0 nch width = 'log_efWn*3' length = 'length' 
MN6 n5 0  n4 0 nch width = 'log_efWn*3' length = 'length' 
 
MN7 n4 req 0 0 nch width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nor
.ends nor_PCSL

* ------------------------------ *
* 2-input XOR
.subckt xor_PCSL a0 a1 b0 b1 req out0 out1 vdd 
MP1 vdd req q0  vdd pch width = 'log_efWp'   length = 'length' 
MP2 vdd a0  n1  vdd pch width = 'log_efWp*2' length = 'length'  
MP3 n1  b1  q0  vdd pch width = 'log_efWp*2' length = 'length' 
MP4 vdd a1  n2  vdd pch width = 'log_efWp*2' length = 'length' 
MP5 n2  b0  q0  vdd pch width = 'log_efWp*2' length = 'length' 

MP6 vdd req q1 vdd pch width = 'log_efWp'   length = 'length' 
MP7 vdd a0  n3 vdd pch width = 'log_efWp*2' length = 'length' 
MP8 n3  b0  q1 vdd pch width = 'log_efWp*2' length = 'length' 
MP9 vdd b1  n4 vdd pch width = 'log_efWp*2' length = 'length' 

MP0 n4  a1  q1 vdd pch width = 'log_efWp*2' length = 'length' 

MN1 q0 a0 n5 0 nch width = 'log_efWn*3' length = 'length' 
MN2 n5 b0 nx 0 nch width = 'log_efWn*3' length = 'length' 
MN3 q0 b1 n6 0 nch width = 'log_efWn*3' length = 'length'  
MN4 n6 a1 nx 0 nch width = 'log_efWn*3' length = 'length' 

MN5 q1 a1 n7 0 nch width = 'log_efWn*3' length = 'length' 
MN6 n7 b0 nx 0 nch width = 'log_efWn*3' length = 'length' 
MN7 q1 a0 n8 0 nch width = 'log_efWn*3' length = 'length'  
MN8 n8 b1 nx 0 nch width = 'log_efWn*3' length = 'length' 

MNX nx req 0 0 nch width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xor
.ends xor_PCSL

* ------------------------------ *
* ------ Macro Model ----------  *
* ------------------------------ *

* ------------------------------ *
.subckt nand_PCSL_mac a0 a1 b0 b1 req out0 out1 vdd 
XP1 vdd req q0  vdd pch_mac width = 'log_efWp'   length = 'length' 
XP2 q0  0   n1  vdd pch_mac width = 'log_efWp*2' length = 'length' * dummy transistor
XP3 n1  a1  vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP4 n1  b1  vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 

XP5 vdd req q1  vdd pch_mac width = 'log_efWp'   length = 'length' 
XP6 q1  b0  n2  vdd pch_mac width = 'log_efWp*2' length = 'length'  
XP7 n2  vdd vdd vdd pch_mac width = 'log_efWp*2' length = 'length' * dummy transistor
XP8 n2  a0  vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 

XN1 q0 a1 n3 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN2 n3 b1 n4 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN3 n3 0  n4 0 nch_mac width = 'log_efWn*3' length = 'length'  * dummy transistor

XN4 q1 vdd n5 0 nch_mac width = 'log_efWn*3' length = 'length' * dummy transistor
XN5 n5 a0 n4  0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6 n5 b0 n4  0 nch_mac width = 'log_efWn*3' length = 'length' 
 
XN7 n4 req 0  0 nch_mac width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP_MAC * and
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP_MAC * nand
.ends nand_PCSL_mac	

* ------------------------------ *
.subckt nor_PCSL_mac a0 a1 b0 b1 req out0 out1 vdd 
XP1 vdd req q0  vdd pch_mac width = 'log_efWp'   length = 'length' 
XP2 q0  b1  n1  vdd pch_mac width = 'log_efWp*2' length = 'length'  
XP3 n1  a1  vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP4 n1  vdd vdd vdd pch_mac width = 'log_efWp*2' length = 'length' * dummy transistor

XP5 vdd req q1  vdd pch_mac width = 'log_efWp'   length = 'length' 
XP6 q1  0   n2  vdd pch_mac width = 'log_efWp*2' length = 'length' * dummy transistor
XP7 n2  b0  vdd vdd pch_mac width = 'log_efWp*2' length = 'length'  
XP8 n2  a0  vdd vdd pch_mac width = 'log_efWp*2' length = 'length' 

XN1 q0 vdd n3 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN2 n3 b1  n4 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN3 n3 a1  n4 0 nch_mac width = 'log_efWn*3' length = 'length' * dummy transistor

XN4 q1 b0 n5 0 nch_mac width = 'log_efWn*3' length = 'length'  * dummy transistor
XN5 n5 a0 n4 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6 n5 0  n4 0 nch_mac width = 'log_efWn*3' length = 'length' 
 
XN7 n4 req 0 0 nch_mac width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * or
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * nor
.ends nor_PCSL_mac

* ------------------------------ *
.subckt xor_PCSL_mac a0 a1 b0 b1 req out0 out1 vdd 
XP1 vdd req q0  vdd pch_mac width = 'log_efWp'   length = 'length' 
XP2 vdd a0  n1  vdd pch_mac width = 'log_efWp*2' length = 'length'  
XP3 n1  b1  q0  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP4 vdd a1  n2  vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP5 n2  b0  q0  vdd pch_mac width = 'log_efWp*2' length = 'length' 

XP6 vdd req q1 vdd pch_mac width = 'log_efWp'   length = 'length' 
XP7 vdd a0  n3 vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP8 n3  b0  q1 vdd pch_mac width = 'log_efWp*2' length = 'length' 
XP9 vdd b1  n4 vdd pch_mac width = 'log_efWp*2' length = 'length' 

XP0 n4  a1  q1 vdd pch_mac width = 'log_efWp*2' length = 'length' 

XN1 q0 a0 n5 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN2 n5 b0 nx 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN3 q0 b1 n6 0 nch_mac width = 'log_efWn*3' length = 'length'  
XN4 n6 a1 nx 0 nch_mac width = 'log_efWn*3' length = 'length' 

XN5 q1 a1 n7 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN6 n7 b0 nx 0 nch_mac width = 'log_efWn*3' length = 'length' 
XN7 q1 a0 n8 0 nch_mac width = 'log_efWn*3' length = 'length'  
XN8 n8 b1 nx 0 nch_mac width = 'log_efWn*3' length = 'length' 

XNX nx req 0 0 nch_mac width = 'log_efWn*3' length = 'length' 

* invs for the output
X0 q0 out0 vdd 0 _CADMOS_INVD1BWP * xnor
X1 q1 out1 vdd 0 _CADMOS_INVD1BWP * xor
.ends xor_PCSL_mac
