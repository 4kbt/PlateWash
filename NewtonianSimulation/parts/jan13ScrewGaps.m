function m2 = jan13ScrewGaps
	
	run3147PendulumParameters

	Gap = genPointMassAnnlSheet(gapMass, 0, gapDiameter/2.0, gapLength, 5	, 5);

	trans = [gapDistance + gapLength/2.0 0 gapRadialPosition];


	G1 = translatePMArray(Gap, trans);

	m2 = [];

	for i = 0:2
		m2 = [m2; rotatePMArray(G1, i*2*pi/3, [1 0 0])];
	end

end

