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

totalOffset = sum(errorTable(:,1)); 
totalStat   = sqrt( sum( errorTable( : , 2 ) .^2 ) );
totalSys    = sqrt( sum( errorTable( : , 2 ) .^2 ) );



