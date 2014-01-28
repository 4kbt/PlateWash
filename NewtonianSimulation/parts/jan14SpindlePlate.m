function P = jan14SpindlePlate()
	run3147PendulumParameters

	P = genPointMassAnnlSheet(spindlePlateMass, spindlePlateID, ...
				 spindlePlateOD, spindlePlateThickness, ...
				3, 7);

	P = translatePMArray(P, [spindlePlateSetBack + ...
				spindlePlateThickness/2.0, 0 , 0]);
	
end

