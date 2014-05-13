function m2 = jan13ScrewGaps

	radius = 7*0.0254;
	offset = 1 *0.0254;

	m2 = [0.2,  radius, 0 , 0;
	      0.1, -radius, -offset, 0;
	      0.1, -radius,  offset, 0];

end

