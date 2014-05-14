function m2 = may14EndMass

	OD = 2.5*0.0254;
	ID = 1.25*0.0254;
	Length = 3*0.0254;
	CavDepth = 1*0.0254;
	RadialPoints = 5;
	AxialPoints = 5;

	TotalMass = 1.8

	CylLength = Length - CavDepth;

	CylMass = pi*(OD/2)^2*CylLength;
	RingMass = pi*((OD/2)^2 - (ID/2)^2 )*CavDepth;

	CylMass = TotalMass * ( CylMass / (CylMass+RingMass) );
	RingMass = TotalMass - CylMass; 

	Cylinder = genPointMassAnnlSheet( CylMass , 0, OD/2, CylLength,
			AxialPoints, RadialPoints); 
	Ring     = genPointMassAnnlSheet( RingMass , ID/2, OD/2, CavDepth,
                        AxialPoints, RadialPoints);

	Cylinder = translatePMArray(Cylinder, [-CylLength/2, 0, 0]);
	Ring     = translatePMArray(Ring    , [  CavDepth/2, 0, 0]);

	m2 = [Cylinder; Ring];
end

