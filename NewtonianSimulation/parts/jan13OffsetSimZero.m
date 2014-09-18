function Attractor = jan13OffsetSimZero
	run3147PendulumParameters

	A = jan13PreOffsetAssembly;

	Attractor = translatePMArray(A, [0 0 attrVertOffset]);
end
