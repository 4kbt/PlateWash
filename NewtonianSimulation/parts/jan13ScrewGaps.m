function m2 = jan13ScrewGaps
	
	run3147PendulumParameters

	%Small gaps
	Gap    = genPointMassAnnlSheet(gapMass   , 0, gapDiameter/2.0, gapLength   , 5	, 5);
	bigGap = genPointMassAnnlSheet(bigGapMass, 0, gapDiameter/2.0, bigGapLength, 5	, 5);
	trans  = [gapDistance +    gapLength/2.0 0 gapRadialPosition];
	trans2 = [gapDistance + bigGapLength/2.0 0 gapRadialPosition];

	G1 = translatePMArray(Gap   , trans );
	G2 = translatePMArray(bigGap, trans2);

	m2 = [];
	for i = 0:2
		m2 = [m2; rotatePMArray(G1, (i * 2    ) * pi/3, [1 0 0]);
			  rotatePMArray(G2, (i * 2 + 1) * pi/3, [1 0 0])];
	end

end

