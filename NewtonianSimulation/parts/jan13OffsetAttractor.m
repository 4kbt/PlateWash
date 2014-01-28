function Attractor = jan13OffsetAttractor
	run3147PendulumParameters

	A = jan13Attractor;

	Attractor = translatePMArray(A, [0 attrHorizOffset attrVertOffset]);
end
