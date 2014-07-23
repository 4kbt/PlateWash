fundamentalConstants

if(exist("DoNotExtractPendulumParameters"))
	function printInteger() ; 	end
        function printSigNumber() ;	end
        function printSigError();	end
        function printDecimal();	end
        function printSI();   		end
        function printSIErr(); 		end
        function fprintf();		end

end

HOMEDIR = getenv("HOMEDIR");

%%%%% PENDULUM TiTa %%%%%%

%        'jan13Pendulum'

rhoTi=4507;
printSI( rhoTi, 2, 3 ,'g/m^3',  [HOMEDIR '/extracted/titaniumDensity.tex' ]);
pendulumBodyHeight=0.0321203; printSigNumber(pendulumBodyHeight, [HOMEDIR '/extracted/pendulumBodyHeight.tex' ],4);
pendulumBodyWidth =0.0431448; printSigNumber(pendulumBodyWidth,  [HOMEDIR '/extracted/pendulumBodyWidth.tex'  ],4); %How did I get a part in 10^6? Pg 57 of 
pendulumBodyThickness= 0.070*0.0254; printSigNumber(pendulumBodyThickness , [HOMEDIR '/extracted/pendulumBodyThicknessNoSI.tex'],2);
printSIErr(pendulumBodyThickness, 0.001*0.0254, 1, -3, 'm', [HOMEDIR '/extracted/pendulumBodyThickness.tex' ]); %1 part in 10^2 seems coarse?
pendulumBodyMass=rhoTi*pendulumBodyHeight*pendulumBodyWidth*pendulumBodyThickness;

rhoTaP=16650; printSI(rhoTaP, 2, 3, 'g/m$^3$', [HOMEDIR '/extracted/inlayDensity.tex' ]);
rhoInlay=rhoTaP-rhoTi;
inlayHeight=pendulumBodyHeight;
inlayThickness=0.010*0.0254 ; printSigNumber(inlayThickness, [HOMEDIR '/extracted/inlayThickness.tex' ], 2);
inlayWidth=pendulumBodyWidth-27.610e-3 ; printSigNumber(inlayWidth, [HOMEDIR '/extracted/inlayWidth.tex' ], 5);
inlayMass=rhoInlay*inlayHeight*inlayThickness*inlayWidth; printSigNumber(inlayMass, [HOMEDIR '/extracted/inlayMass.tex' ], 2);



h1=pendulumBodyHeight; % Pendulum height
w1=pendulumBodyWidth; % Pendulum Width
j1=pendulumBodyWidth/2.0-inlayWidth;%Distance from pendulum center to step.
a1=inlayThickness; % inset thickness
thickness1=pendulumBodyThickness;
ph1=rhoTaP;  %Ta
pl1=rhoTi; %Ti
insetWidth=inlayWidth;
momentArm=insetWidth/2+j1;
pendCenterToStep = j1;


%%%%%% ATTRACTOR %%%%%
%CamelCase variables from jan13Attractor.
InfiniteRadius = 0.3;                  printSI(InfiniteRadius, 2, 0, 'm'	, [HOMEDIR '/extracted/InfiniteRadius.tex']);

rhoAl=2700  ;			       printSI(rhoAl,  2, 3, 'g/m$^3$'		, [HOMEDIR '/extracted/rhoAl.tex']);
rhoTaA=16650;                          printSI(rhoTaA, 2, 3, 'g/m$^3$'	     	, [HOMEDIR '/extracted/rhoTaA.tex']);


%All uncertainties in this block are SWAGs as assigned; lab notebook may offer tighter constraints.
AttractorDiameter= 3*0.0254-1350e-6; AttractorDiameterErr = 0.002*0.0254;
printSIErr(AttractorDiameter,       AttractorDiameterErr        , 1, -3, 'm'     , [HOMEDIR '/extracted/AttractorDiameter.tex'       ]);
AttractorPlateThickness= 30e-3*0.0254; AttractorPlateThicknessErr = 1e-3*0.0254;
printSIErr(AttractorPlateThickness, AttractorPlateThicknessErr  , 1, -3, 'm', [HOMEDIR '/extracted/AttractorPlateThickness.tex' ]);
AttractorFullThickness = 12.91e-3 ; AttractorFullThicknessErr = 0.002*0.0254;
printSIErr(AttractorFullThickness , AttractorFullThicknessErr   , 1, -3, 'm', [HOMEDIR '/extracted/AttractorFullThickness.tex'  ]);
AttractorRimHeight = 0.0254*.4129 ; AttractorRimHeightErr = 0.002*0.0254;
printSIErr(AttractorRimHeight     , AttractorRimHeightErr       , 1, -3, 'm', [HOMEDIR '/extracted/AttractorRimHeight.tex'      ]);
AttractorBackerThickness= AttractorFullThickness - AttractorPlateThickness - AttractorRimHeight;
AttractorBackerThicknessErr = sqrt(AttractorFullThicknessErr^2 + AttractorPlateThicknessErr^2 + AttractorRimHeightErr^2);
printSIErr(AttractorBackerThickness, AttractorBackerThicknessErr, 1, -3, 'm', [HOMEDIR '/extracted/AttractorBackerThickness.tex']);
AttractorInnerDiameter=0.0254*1.915; AttractorInnerDiameterErr = 0.002*0.0254;
printSIErr(AttractorInnerDiameter ,  AttractorInnerDiameterErr  , 1, -3, 'm', [HOMEDIR '/extracted/AttractorInnerDiameter.tex' ]);
AttractorRimWidth= (AttractorDiameter - AttractorInnerDiameter)/2.0;


pa1=rhoTaA; % #Ta
pal1=rhoAl; % #Al
da1=AttractorPlateThickness; %# Ta attractor thickness
dal1=AttractorBackerThickness; % Al attractor thickness

%These offsets are entirely unchecked!
attrHorizOffset = 3.5e-3;	attrHorizOffsetErr = 0.3e-3;	
printSIErr(attrHorizOffset    , attrHorizOffsetErr, 2, -3,'m', [HOMEDIR '/extracted/attrHorizOffset.tex']);
attrVertOffset = 0.5e-3;	attrVertOffsetErr = 0.3e-3;
printSIErr(attrVertOffset     , attrVertOffsetErr,  2, -3,'m', [HOMEDIR '/extracted/attrVertOffset.tex']);

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

%%%%% Spindles %%%%
%See pg 82 of notebook

spindleLength = 2.901*0.0254;		printSigNumber(spindleLength        , [HOMEDIR '/extracted/spindleLength.tex'   ], 2);
spindleDiameter = 0.181*0.0254;		printSIErr(spindleDiameter, 0.002*0.0254, 1, -3, 'm', [HOMEDIR '/extracted/spindleDiameter.tex'   ]);

spindleMass = 3.1818e-3; 

spindleTipDistance = AttractorFullThickness;
spindleRadialPosition = gapRadialPosition;

%%% Macor Spindles %%%
mspindleLength = 1.057*0.0254;		printSigNumber(mspindleLength , [HOMEDIR '/extracted/mspindleLength.tex'], 4);
mspindleDiameter = 0.258*0.0254;		printSigNumber(mspindleDiameter,[HOMEDIR '/extracted/mspindleDiameter.tex'], 3);
mspindleMass = 1.9722e-3;			printSigNumber(mspindleMass    ,[HOMEDIR '/extracted/mspindleMass.tex'  ] , 3);

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

%brick positions
brickRadius = 25*0.0254;
printSI(brickRadius, 2, -3, 'm'	    , [HOMEDIR '/extracted/brickRadius.tex'    ]);
% elevation to center of brick
brickElevation = 16*0.0254;
printSI(brickElevation, 2, -3, 'm'	    , [HOMEDIR '/extracted/brickElevation.tex'    ]);


%%%% Bellows %%%% 

rhoAir = 1;
bellowsPressure = 50.0/14.0;

bellowsLength = 70e-3;
bellowsDiameter = 25e-3;

bellowsVolume = pi * (bellowsDiameter/2.0)^2 * bellowsLength; 	
printSI(bellowsVolume * 1000^3, 2, -3, 'm$^3$', [HOMEDIR '/extracted/bellowsVolume.tex']);

bellowsMass = bellowsVolume * rhoAir * bellowsPressure;
printSI(bellowsMass, 2, -3, 'g',  [HOMEDIR '/extracted/bellowsMass.tex'  ]);

bellowsDistance = 180e-3;
printSI(bellowsDistance, 2, -3, 'm', [HOMEDIR '/extracted/bellowsDistance.tex']);
bellowsHeight = 0;
bellowsOffset = 0;

