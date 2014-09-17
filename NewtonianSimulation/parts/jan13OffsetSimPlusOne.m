function Attractor = jan13OffsetSimPlusOne
	run3147PendulumParameters

	A = jan13PreOffsetAssembly;

	Attractor = translatePMArray(A, [0 attrHorizSimOffsetStep attrVertOffset]);
end
