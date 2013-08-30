function P = washCyclePendulum 

	'washCyclePendulum'

	%end masses
	m = 0.04
	r = 0.032

	P = [m r 0 0; m -r 0 0];


	rD = 0.032
	tD = 0.125*0.0254
	mD = pi*rD*rD*tD*2700

	Wheel = genPointMassAnnlSheet( mD, 0, rD, tD, 10, 10);

	Wheel = rotatePMArray(Wheel, pi/2, [0 0 1]);

	P = [P; Wheel]; 

end
