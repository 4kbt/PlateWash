function m2 = may14BeamBalance

	BarLength = 1;

	Bar = may14Bar(BarLength);
	EndMass = may14EndMass;

	EndMass = translatePMArray(EndMass, [BarLength/2, 0,0]);

	EndMasses = [ EndMass ; rotatePMArray(EndMass, pi, [0 1 0])];

	m2 = [Bar; EndMasses];

end

