function Q = YukPreFactor

	DoNotExtractPendulumParameters = 1;
	PendulumParameters

	%Previous plan has a 2 pi, not pi. pi appears correct.
	%Update 3/27, if inlay is full-width, a 2 is required.
	Q = 2*pi * G * h1 * insetWidth * momentArm * (ph1 - pl1);

end
