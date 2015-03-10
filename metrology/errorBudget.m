run3147MetrologyParameters
run3147PendulumParameters

bounceAngM = load( 'extracted/offsetAngle.dat');
bouncePosM = load( 'extracted/pfRawDist.dat'  );

%scale error quantities
plateauM   = plateauM   * pendulumBodyHeight / 2;
bounceAngM = bounceAngM * pendulumBodyWidth  / 2;
FoilFlatnessM = FoilFlatnessM * 2; %for two sides.


scaleFactor = 1e6;

%output error quantities
formattedErrorOutput( plateauM 		* scaleFactor, 1 ,  'extracted/plateau'   );
formattedErrorOutput( bounceAngM 	* scaleFactor, 1 ,  'extracted/bounceAng' );
formattedErrorOutput( PendulumFlatnessM * scaleFactor, 1 ,  'extracted/pendFlat'  );
formattedErrorOutput( bouncePosM	* scaleFactor, 1 ,  'extracted/bouncePos' );
formattedErrorOutput( attractorM 	* scaleFactor, 1 ,  'extracted/attractor' );
formattedErrorOutput( AttractorFlatnessM* scaleFactor, 1 ,  'extracted/attrFlat'  );
formattedErrorOutput( FoilThickM 	* scaleFactor, 1 ,  'extracted/foilThick' );
formattedErrorOutput( FoilFlatnessM 	* scaleFactor, 1 ,  'extracted/foilFlat'  );

errorTable = ...
	[ 
	  bounceAngM
	  plateauM
	  PendulumFlatnessM
	  bouncePosM
	  attractorM
	  AttractorFlatnessM
	  FoilThickM
	  FoilFlatnessM
	];

totalOffset = sum(errorTable(:,1)); 
totalStat   = sqrt( sum( errorTable( : , 2 ) .^2 ) );
totalSys    = sqrt( sum( errorTable( : , 3 ) .^2 ) );
totalErr    = sqrt( totalStat^2 + totalSys^2 );

totalM = [ totalOffset totalStat totalSys totalErr ];

formattedErrorOutput( totalM	 	* scaleFactor, 1 ,  'extracted/total'  );

%Cross-check to ensure that initial guess for totalM matches computation
columnNames
assert( abs( totalM(1) - shortCut     ) < 1e-6 );
