function Q = YukPreFactor( P )

	%Previous plan has a 2 pi, not pi. pi appears correct.
	%Update 3/27, if inlay is full-width, a 2 is required.
	Q = 2*pi * P.G * P.h1 * P.insetWidth * P.momentArm * (P.ph1 - P.pl1);

end
