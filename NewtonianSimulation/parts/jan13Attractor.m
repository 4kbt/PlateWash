function Attractor = jan13Attractor

	run3147PendulumParameters

	AttractorPlateMass= rhoTaA*pi*(InfiniteRadius^2-(AttractorDiameter/2)^2)*AttractorPlateThickness
	AttractorBackerMass=rhoAl*pi*(InfiniteRadius^2-(AttractorDiameter/2)^2)*AttractorBackerThickness
	AttractorRimMass=   rhoAl*pi*(AttractorDiameter/2)^2*AttractorRimHeight-\
			    rhoAl*pi*((AttractorDiameter-2*AttractorRimWidth)/2)^2*AttractorRimHeight

	AttractorMass=AttractorPlateMass+AttractorBackerMass+AttractorRimMass


	AttractorPlate = genPointMassAnnlSheet( -AttractorPlateMass , AttractorDiameter/2, InfiniteRadius, AttractorPlateThickness, 2, 70); 
	AttractorBacker = genPointMassAnnlSheet( -AttractorBackerMass , AttractorDiameter/2, InfiniteRadius, AttractorBackerThickness, 4, 70);
	AttractorRim = genPointMassAnnlSheet( AttractorRimMass , AttractorDiameter/2-AttractorRimWidth, AttractorDiameter/2, AttractorRimHeight, 10, 50);

	AttractorPlate = translatePMArray(AttractorPlate, [AttractorPlateThickness/2,0,0]);
	AttractorBacker = translatePMArray(AttractorBacker,[AttractorPlateThickness+AttractorBackerThickness/2,0,0]);
	AttractorRim    = translatePMArray(AttractorRim, [AttractorPlateThickness + AttractorBackerThickness + AttractorRimHeight/2,0,0]);

	Attractor = [AttractorPlate; AttractorBacker; AttractorRim];

end
