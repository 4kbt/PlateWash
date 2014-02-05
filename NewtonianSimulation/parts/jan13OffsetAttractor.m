function Attractor = jan13OffsetAttractor
	run3147PendulumParameters

	A = [jan13ScrewGaps;\
		jan13Attractor;\
		jan13Spindles;\
		jan14MacorSpindles.dat;\
		jan14Flexure.dat];

	Attractor = translatePMArray(A, [0 attrHorizOffset attrVertOffset]);
end
