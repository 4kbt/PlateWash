function Q = YukPreFactor

	DoNotExtractPendulumParameters = 1;
	run3147PendulumParameters

	%Previous plan has a 2 pi, not pi. pi appears correct.
	Q = pi * G * h1 * insetWidth * momentArm * (ph1 - pl1);

end
