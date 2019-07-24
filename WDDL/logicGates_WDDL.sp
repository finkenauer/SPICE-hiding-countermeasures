* Description of basic logic gates as subckts in SABL style

.include stdCell_library.sp 			* Standard Cell Library from TSMC @40nm - Using regular transistors
.include macroStdCell_library.sp		* Standard Cell Library from TSMC @40nm - Using macro model of transistors

* ------------------------------ *
* ------ Regular Model --------- *
* ------------------------------ *

* ------------------------------ *
* 2-input NAND
.subckt nandWDDL a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b1 out0 vdd vss _CADMOS_AN2D1BWP
X2 a0 b0 out1 vdd vss _CADMOS_OR2D1BWP
.ends nandWDDL

* ------------------------------ *
* 2-input NOR
.subckt norWDDL a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b1 out0 vdd vss _CADMOS_OR2D1BWP
X2 a0 b0 out1 vdd vss _CADMOS_AN2D1BWP
.ends norWDDL

* ------------------------------ *
* 2-input XOR
.subckt xorWDDL a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b0 q10 vdd vss _CADMOS_AN2D1BWP
X2 a0 b1 q11 vdd vss _CADMOS_AN2D1BWP
X3 a0 b1 q00 vdd vss _CADMOS_OR2D1BWP
X4 a1 b0 q01 vdd vss _CADMOS_OR2D1BWP

XQ1 q10 q11 out1 vdd vss _CADMOS_OR2D1BWP
XQ0 q00 q01 out0 vdd vss _CADMOS_AN2D1BWP
.ends xorWDDL


* ------------------------------ *
* ------ Macro Model ----------  *
* ------------------------------ *

* ------------------------------ *
.subckt nandWDDL_mac a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b1 out0 vdd vss _CADMOS_AN2D1BWP_MAC
X2 a0 b0 out1 vdd vss _CADMOS_OR2D1BWP_MAC
.ends nandWDDL_mac

* ------------------------------ *
.subckt norWDDL_mac a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b1 out0 vdd vss _CADMOS_OR2D1BWP_MAC
X2 a0 b0 out1 vdd vss _CADMOS_AN2D1BWP_MAC
.ends norWDDL_mac

* ------------------------------ *
.subckt xorWDDL_mac a0 a1 b0 b1 out0 out1 vdd vss
X1 a1 b0 q10 vdd vss _CADMOS_AN2D1BWP_MAC
X2 a0 b1 q11 vdd vss _CADMOS_AN2D1BWP_MAC
X3 a0 b1 q00 vdd vss _CADMOS_OR2D1BWP_MAC
X4 a1 b0 q01 vdd vss _CADMOS_OR2D1BWP_MAC

XQ1 q10 q11 out1 vdd vss _CADMOS_OR2D1BWP_MAC
XQ0 q00 q01 out0 vdd vss _CADMOS_AN2D1BWP_MAC
.ends xorWDDL_mac