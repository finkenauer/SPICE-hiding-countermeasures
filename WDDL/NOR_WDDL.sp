* 2-input NOR WDDL style
.lib "path\to\modelCard-spiceModel" corner

.include logicGates_WDDL.sp
.option numdgt = 10

* ------------------------------ *
vdd0 vdd_aux 0 dc 0.9
vdd1 vdd 0 dc 0.9

.param supply = 0.9

* ------------------------------ *
X1_A a0_signal  a0_temp vdd_aux 0 _CADMOS_INVD1BWP
X2_A a0_temp    a0      vdd_aux 0 _CADMOS_INVD1BWP
 
X3_A a1_signal  a1_temp vdd_aux 0 _CADMOS_INVD1BWP
X4_A a1_temp    a1      vdd_aux 0 _CADMOS_INVD1BWP

X1_B b0_signal  b0_temp vdd_aux 0 _CADMOS_INVD1BWP
X2_B b0_temp    b0      vdd_aux 0 _CADMOS_INVD1BWP

X3_B b1_signal  b1_temp vdd_aux 0 _CADMOS_INVD1BWP
X4_B b1_temp    b1      vdd_aux 0 _CADMOS_INVD1BWP

* ------------------------------ *
X_C a0 a1 b0 b1 out0 out1 vdd NOR_WDDL

* ------------------------------ *
X1_O0 out0 o0_1 vdd_aux 0 _CADMOS_INVD1BWP
X2_O0 out0 o0_2 vdd_aux 0 _CADMOS_INVD1BWP
X3_O0 out0 o0_3 vdd_aux 0 _CADMOS_INVD1BWP
X4_O0 out0 o0_4 vdd_aux 0 _CADMOS_INVD1BWP

X1_O1 out1 o1_1 vdd_aux 0 _CADMOS_INVD1BWP
X2_O1 out1 o1_2 vdd_aux 0 _CADMOS_INVD1BWP
X3_O1 out1 o1_3 vdd_aux 0 _CADMOS_INVD1BWP
X4_O1 out1 o1_4 vdd_aux 0 _CADMOS_INVD1BWP


.param window_0 = 1.5
+ window_1 = 5.5

.param case =  0 * 0: A1, B1: 0 / 1: A1: 0, B1: 1 / 2: A1: 1, B1:0 / 3: A1, B1: 1
.step case 0 3 1

.tran 0.0001ns 6.6ns
* ------------------------------ *
.if(case==0) * A1, B1: 0 -> 0
	vin_a1 a1_signal 0 pwl(0n 0 0.02n 0)
	vin_a0 a0_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_b1 b1_signal 0 pwl(0n 0 0.02n 0)
	vin_b0 b0_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)

	* propagation delay
	.measure tran pLH_0
	+ trig v(a0) val='supply/2' rise=1
	+ targ v(out1) val='supply/2' rise=1
	
	.measure tran pHL_0
	+ trig v(a0) val='supply/2' fall=1
	+ targ v(out1) val='supply/2' fall=1

	.measure tran trise_0
	+ trig v(out1) val='0.2*supply' rise=1
	+ targ v(out1) val='0.8*supply' rise=1
	
	.measure tran tfall_0
	+ trig v(out1) val='0.8*supply' fall=1
	+ targ v(out1) val='0.2*supply' fall=1

	* power
	.measure tran energy_prech0 integral 'p(vdd1)*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	.measure tran energy_eval0 integral 'p(vdd1)*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'

	.measure tran avg_power0 avg 'p(vdd1)*(-1)'
	.measure tran avg_energy0 avg 'p(vdd1)*(-6.6n)'
		
.elseif(case==1) * A1: 0 -> 0, B1: 0 -> 1 -> 0
	vin_a1 a1_signal 0 pwl(0n 0 0.02n 0)
	vin_a0 a0_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_b1 b1_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_b0 b0_signal 0 pwl(0n 0 0.02n 0)

	* propagation delay
	.measure tran pLH_1
	+ trig v(a0) val='supply/2' rise=1
	+ targ v(out0) val='supply/2' rise=1
	
	.measure tran pHL_1
	+ trig v(a0) val='supply/2' fall=1
	+ targ v(out0) val='supply/2' fall=1

	.measure tran trise_1
	+ trig v(out0) val='0.2*supply' rise=1
	+ targ v(out0) val='0.8*supply' rise=1
	
	.measure tran tfall_1
	+ trig v(out0) val='0.8*supply' fall=1
	+ targ v(out0) val='0.2*supply' fall=1

	* power
	.measure tran energy_prech1 integral 'p(vdd1)*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	.measure tran energy_eval1 integral 'p(vdd1)*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'

	.measure tran avg_power1 avg 'p(vdd1)*(-1)'
	.measure tran avg_energy1 avg 'p(vdd1)*(-6.6n)'
	
.elseif(case==2) * A1: 0 -> 1 -> 0, B1: 0 -> 0
	vin_a1 a1_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_a0 a0_signal 0 pwl(0n 0 0.02n 0)
	vin_b1 b1_signal 0 pwl(0n 0 0.02n 0)
	vin_b0 b0_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	
	* propagation delay
	.measure tran pLH_2
	+ trig v(b0) val='supply/2' rise=1
	+ targ v(out0) val='supply/2' rise=1
	
	.measure tran pHL_2
	+ trig v(b0) val='supply/2' fall=1
	+ targ v(out0) val='supply/2' fall=1

	.measure tran trise_2
	+ trig v(out0) val='0.2*supply' rise=1
	+ targ v(out0) val='0.8*supply' rise=1
	
	.measure tran tfall_2
	+ trig v(out0) val='0.8*supply' fall=1
	+ targ v(out0) val='0.2*supply' fall=1

	.measure tran energy_prech2 integral 'p(vdd1)*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	.measure tran energy_eval2 integral 'p(vdd1)*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'

	.measure tran avg_power2 avg 'p(vdd1)*(-1)'
	.measure tran avg_energy2 avg 'p(vdd1)*(-6.6n)'
	
.elseif(case==3) * A1, B1: 0 -> 1 -> 0
	vin_a1 a1_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_a0 a0_signal 0 pwl(0n 0 0.02n 0)
	vin_b1 b1_signal 0 pwl(0n 0 2n 0 2.02n supply 6n supply 6.02n 0)
	vin_b0 b0_signal 0 pwl(0n 0 0.02n 0)

	* propagation delay
	.measure tran pLH_3
	+ trig v(a1) val='supply/2' rise=1
	+ targ v(out0) val='supply/2' rise=1
	
	.measure tran pHL_3
	+ trig v(a1) val='supply/2' fall=1
	+ targ v(out0) val='supply/2' fall=1

	.measure tran trise_3
	+ trig v(out0) val='0.2*supply' rise=1
	+ targ v(out0) val='0.8*supply' rise=1
	
	.measure tran tfall_3
	+ trig v(out0) val='0.8*supply' fall=1
	+ targ v(out0) val='0.2*supply' fall=1

	.measure tran energy_prech3 integral 'p(vdd1)*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_0+1)-window_0)*(-1n)' from='window_0*1n' to='(window_0+1)*1n'
	.measure tran energy_eval3 integral 'p(vdd1)*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'
	*.measure tran int6 integral 'i(vdd1)*supply*((window_1+1)-window_1)*(-1n)' from='window_1*1n' to='(window_1+1)*1n'

	.measure tran avg_power3 avg 'p(vdd1)*(-1)'
	.measure tran avg_energy3 avg 'p(vdd1)*(-6.6n)'
	 
.endif

.end
