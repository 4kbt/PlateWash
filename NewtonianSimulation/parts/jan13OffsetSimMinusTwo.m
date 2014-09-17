function Attractor = jan13OffsetSimMinusTwo
	run3147PendulumParameters

	A = jan13PreOffsetAssembly;

	Attractor = translatePMArray(A, [0 attrHorizSimOffsetStep*-2 attrVertOffset]);
end
