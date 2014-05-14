function m2 = may14Bar(Length)

	OD = 1.25*0.0254;
	ID = 1.*0.0254;
	RadialPoints = 5;
	AxialPoints = 20;

	TotalMass = 0.58;

	Bar = genPointMassAnnlSheet( TotalMass, ID/2, OD/2, Length,
					AxialPoints, RadialPoints);
	m2 = [Bar];
end

