fundamentalConstants

%exist was too slow
try
	if(1 == DoNotExtractPendulumParameters)
		function printInteger() ; 	end
	        function printSigNumber() ;	end
	        function printSigError();	end
	        function printDecimal();	end
	        function printSI();   		end
	        function printSIErr(); 		end
       		function fprintf();		end

	end
catch
end

HOMEDIR = getenv("HOMEDIR");


%%%%% Screw gaps %%%%%

rhoGap = -rhoAl;

%Errors are SWAGs
gapLength = 1e-3;	gapLengthErr = 0.5e-3;
printSIErr(gapLength, 	gapLengthErr, 1, -3,'m', [HOMEDIR '/extracted/screwGapLength.tex']);
gapDiameter = 0.110*0.0254; gapDiameterErr = 0.002*0.0254;
printSIErr(gapDiameter, 	gapDiameterErr, 1, -3,'m', [HOMEDIR '/extracted/screwGapLength.tex']);


gapMass = pi * (gapDiameter/2.0)^2*gapLength * rhoGap;

%Distance from attractor plane to gap end
gapDistance = 1e-3; 			 printSigNumber(gapDistance  	   , [HOMEDIR '/extracted/screwGapDistFromPlane.tex'   ], 1);
gapRadialPosition = 72e-3/2;		 printSigNumber(gapRadialPosition  , [HOMEDIR '/extracted/screwGapRadialPosition.tex'  ], 2);

bigGapLength = AttractorFullThickness - gapDistance;
bigGapMass   = pi * (gapDiameter/2.0)^2 * bigGapLength * rhoGap;

%%%%% Spindles %%%%
spindleLength      = 2.901*0.0254; %Pg 82 of 'PlateWash'
spindleLengthErr   = 0.003*0.0254;
printSIErr(spindleLength  , spindleLengthErr  , 1, -3, 'm', [HOMEDIR '/extracted/spindleLength.tex'  ]);

spindleDiameter    = 0.181*0.0254; %Pg 82 of 'PlateWash'
spindleDiameterErr = 0.001*0.0254;
printSIErr(spindleDiameter, spindleDiameterErr, 1, -3, 'm', [HOMEDIR '/extracted/spindleDiameter.tex']);

spindleMass        = 3.1818e-3; %see pg 82 of 'platewash'
spindleMassErr	   = 0.0099e-3; 
printSIErr(spindleMass    , spindleMassErr    , 1,  0, 'g',  [HOMEDIR '/extracted/spindleMass.tex'   ]);

spindleTipDistance = AttractorFullThickness;
spindleRadialPosition = gapRadialPosition;

%%% Macor Spindles %%% See pg 82 of 'PlateWash'
mspindleLength    = 1.057*0.0254;
mspindleLengthErr = 0.001*0.0254;
printSIErr(mspindleLength , mspindleLengthErr,    1, -3, 'm', [HOMEDIR '/extracted/mspindleLength.tex'  ]);
mspindleDiameter    = 0.258*0.0254;
mspindleDiameterErr = 0.001*0.0254;
printSIErr(mspindleDiameter, mspindleDiameterErr, 1, -3, 'm', [HOMEDIR '/extracted/mspindleDiameter.tex']);
mspindleMass    = 1.9722e-3;
mspindleMassErr = 0.0066e-3;
printSIErr(mspindleMass    , mspindleMassErr    , 1,  0, 'g', [HOMEDIR '/extracted/mspindleMass.tex'    ]);


mspindleTipDistance = spindleLength + spindleTipDistance;
mspindleRadialPosition = spindleRadialPosition;

%%% Spindle Plate %%%

spindlePlateMass =      67.261e-3;		printSigNumber(spindlePlateMass, [HOMEDIR '/extracted/spindlePlateMass.tex'] , 4);
spindlePlateID =        0.375*0.0254;	printSigNumber(spindlePlateID  , [HOMEDIR '/extracted/spindlePlateID.tex'  ] , 3);
spindlePlateOD =        3.007*0.0254;	printSigNumber(spindlePlateOD  , [HOMEDIR '/extracted/spindlePlateOD.tex'  ] , 4);
spindlePlateThickness = 0.250 * 0.0254;	printSigNumber(spindlePlateThickness, [HOMEDIR '/extracted/spindlePlateThickness.tex' ], 3);

spindlePlateSetBack = mspindleTipDistance + mspindleLength; ...
					printSigNumber(spindlePlateSetBack  , [HOMEDIR '/extracted/spindlePlateSetBack.tex'   ], 3);


%%% Flexure frame %%%

rhoAl = 2700;

flexureHeight = 3*0.0254;		printSigNumber(flexureHeight , [HOMEDIR '/extracted/flexureHeight.tex' ], 3);
flexureWidth  = 1.0005*0.0254;		printSigNumber(flexureWidth  , [HOMEDIR '/extracted/flexureWidth.tex'  ], 3);
flexureLength = 5*0.0254;		printSigNumber(flexureLength , [HOMEDIR '/extracted/flexureLength.tex' ], 3);
wallThickness = 0.250*0.0254;		printSigNumber(wallThickness , [HOMEDIR '/extracted/wallThickness.tex' ], 3);

flexureSetBack = spindlePlateSetBack + spindlePlateThickness;
					printSigNumber(flexureSetBack, [HOMEDIR '/extracted/flexureSetBack.tex'], 3);

%%% Microscope scan PM Array Parameters %%%%


%was 100e-6
%'Pendulum gridsize is insufficient. 750e-6 and 2.5e-6 are better.'
pendulumPMScanGridSize =2000e-6;
printSI(pendulumPMScanGridSize, 2, -6, 'm', [HOMEDIR '/extracted/pendulumPMScanGridSize.tex']);
pendulumPMScanVertStep = 5e-6;	
printSI(pendulumPMScanVertStep, 2, -6, 'm', [HOMEDIR '/extracted/pendulumPMScanVertStep.tex']);
pendulumPMBodyDensity = rhoTi;
pendulumPMInlayDensity =  rhoTaP;

%was 200e-6
attractorPMScanGridSize = pendulumPMScanGridSize;
printSI(attractorPMScanGridSize, 2, -6, 'm', [HOMEDIR '/extracted/attractorPMScanGridSize.tex']);
attractorPMScanVertStep = 2.5e-6;
printSI(attractorPMScanVertStep, 2, -6, 'm', [HOMEDIR '/extracted/attractorPMScanVertStep.tex']);
attractorPMDensity = rhoTaA;


%%%%%% Q-tester bricks %%%%%%%

%brick mass
brickMass = 23.88;
brickMassErr = 0.34;			
printSIErr(brickMass, brickMassErr, 2, 3, 'g', [HOMEDIR '/extracted/brickMass.tex']);

%brick dimensions
brickHeight = 8*0.0254;			
printSI(brickHeight, 2, -3, 'm', [HOMEDIR '/extracted/brickHeight.tex'    ]);
brickWidth  = 4*0.0254;
printSI(brickWidth, 2, -3, 'm', [HOMEDIR '/extracted/brickWidth.tex'    ]);

%brick positions - to center of brick
brickRadius = 24.75*0.0254; %Rechecked 8/6/2014
brickRadiusErr = 1*0.0254;
printSIErr(brickRadius, brickRadiusErr, 1, -3, 'm'	   , [HOMEDIR '/extracted/brickRadius.tex'    ]);
% elevation to center of brick
brickElevation = 15.3*0.0254; %Rechecked 8/6/2014
brickElevationErr = 1*0.0254;
printSIErr(brickElevation, brickElevationErr, 1, -3, 'm'   , [HOMEDIR '/extracted/brickElevation.tex'    ]);


%%%% Bellows %%%% 

rhoAir = 1;
bellowsPressure = 50.0/14.0;

bellowsLength = 70e-3;
bellowsDiameter = 25e-3;

bellowsVolume = pi * (bellowsDiameter/2.0)^2 * bellowsLength;
%1000^2 instead of 1000^3, as the millimeter conversion does one of them.
printSI(bellowsVolume * 1000^2, 2, -3, 'm$^3$', [HOMEDIR '/extracted/bellowsVolume.tex']);

bellowsMass = bellowsVolume * rhoAir * bellowsPressure;
printSI(bellowsMass, 2, -3, 'g',  [HOMEDIR '/extracted/bellowsMass.tex'  ]);

bellowsDistance = 180e-3;
printSI(bellowsDistance, 2, -3, 'm', [HOMEDIR '/extracted/bellowsDistance.tex']);
bellowsHeight = 0;
bellowsOffset = 0;

