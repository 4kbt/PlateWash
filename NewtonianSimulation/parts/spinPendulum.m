function P = spinPendulum

	'spinPendulum'

	cylMass   = 0.89e-3;
	cylOD     = 0.476e-2;
	cylHeight = 0.3e-2;

	cylRadius = 0.71e-2;

	cyl = genPointMassAnnlSheet( cylMass, 0, cylOD/2.0, cylHeight, 10, 10)
	cyl = rotatePMArray(cyl, pi/2, [ 0 1 0] ); 
	cyl = translatePMArray( cyl, [cylRadius 0 0]); 


	P = [];
	for i = 1:4
		P = [P; rotatePMArray(cyl, i*pi/2, [0 0 1])];
	end

end
