function m2 = jan14MacorSpindles
	
	run3147PendulumParameters

	Spindle = genPointMassAnnlSheet(mspindleMass, 0, mspindleDiameter/2.0, mspindleLength, 5, 5);

	trans = [mspindleTipDistance + mspindleLength/2.0 0 mspindleRadialPosition];


	S1 = translatePMArray(Spindle, trans);

	m2 = [];

	for i = 0:2
		m2 = [m2; rotatePMArray(S1, i*2*pi/3, [1 0 0])];
	end

end

