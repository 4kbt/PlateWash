run3147MetrologyParameters
run3147PendulumParameters

bounceAngM = load( 'extracted/offsetAngle.dat');
bouncePosM = load( 'extracted/pfRawDist.dat'  );

errorTable = ...
	[ attractorM
	  plateauM * pendulumBodyHeight / 2
	  PendulumFlatnessM
	  AttractorFlatnessM
	  FoilFlatnessM
	  bounceAngM * pendulumBodyWidth / 2
	  bouncePosM
	];


