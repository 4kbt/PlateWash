function Attractor = jan13OffsetSimMinusOne
	run3147PendulumParameters

	A = jan13PreOffsetAssembly;

	Attractor = translatePMArray(A, [0 attrHorizSimOffsetStep*-1 attrVertOffset]);
end
