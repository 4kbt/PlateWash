function m2 = jan13Spindles
	
	run3147PendulumParameters

	Spindle = genPointMassAnnlSheet(spindleMass, 0, spindleDiameter/2.0, spindleLength, 5	, 5);

	trans = [spindleTipDistance + spindleLength/2.0 0 spindleRadialPosition];


	S1 = translatePMArray(Spindle, trans);

	m2 = [];

	for i = 0:2
		m2 = [m2; rotatePMArray(S1, i*2*pi/3, [1 0 0])];
	end

end

