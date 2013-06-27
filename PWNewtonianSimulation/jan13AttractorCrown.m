function m2 = jan13
	
	rhoAl = 2700

	rhoGap = -rhoAl

	gapLength = 1e-3
	gapDiameter = 0.110*0.0254

	gapMass = pi * (gapDiameter/2.0)^2*gapLength * rhoGap

	gapDistance = 1e-3
	gapRadialPosition = 72e-3/2
	gapHeight = gapRadialPosition
	gapOffset = 0

	gapDisplacement = 7e-3;

	Gap = genPointMassAnnlSheet(gapMass, 0, gapDiameter/2.0, gapLength, 5	, 5);

	trans = [gapDistance + gapLength/2.0 0 gapRadialPosition];


	G1 = translatePMArray(Gap, trans);

	m2 = [];

	for i = 0:2
		m2 = [m2; rotatePMArray(G1, i*2*pi/3, [1 0 0])];
	end

end

