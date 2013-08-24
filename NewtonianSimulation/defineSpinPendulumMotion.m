function t = defineSpinPendulumMotion 

	nPtsPerRev = 30;
	nHeights   = 20;
	startHeight = 0;
	endHeight = -2e-2;

	heights = linspace(startHeight, endHeight, nHeights);

	%Define angles
	a = (0:1/nPtsPerRev:1)*2*pi;

	%row vector to column vector
	a = a';

	t = [];
	for h = heights 
		t = [ t; a, a*0, a*0, ones(rows(a),1), a*0+0, a*0+0, a*0+h];
	end
end
