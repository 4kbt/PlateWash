fundamentalConstants

if(exist("DoNotExtractPendulumParameters"))
	function printInteger() ;  end
	function printSigNumber() ; end
	function printSigError();  end
end

HOMEDIR = getenv("HOMEDIR");

%%%%% PENDULUM TiTa %%%%%%

%        'jan13Pendulum'

rhoTi=4507; printInteger(rhoTi, [HOMEDIR '/extracted/titaniumDensity.tex' ]);
pendulumBodyHeight=0.0321203; printSigNumber(pendulumBodyHeight, [HOMEDIR '/extracted/pendulumBodyHeight.tex' ],4);
pendulumBodyWidth =0.0431448; printSigNumber(pendulumBodyWidth,  [HOMEDIR '/extracted/pendulumBodyWidth.tex'  ],4); %How did I get a part in 10^6? Pg 57 of 
pendulumBodyThickness= 0.070*0.0254; printSigNumber(pendulumBodyThickness, [HOMEDIR '/extracted/pendulumBodyThickness.tex' ], 2); %1 part in 10^2 seems coarse?
pendulumBodyMass=rhoTi*pendulumBodyHeight*pendulumBodyWidth*pendulumBodyThickness;

rhoTaP=16650; printInteger(rhoTaP, [HOMEDIR '/extracted/inlayDensity.tex' ]);
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
InfiniteRadius = 0.3;                  printSigNumber(InfiniteRadius         , [HOMEDIR '/extracted/InfiniteRadius.tex']          , 1);

rhoAl=2700  ;			       printSigNumber(rhoAl                  , [HOMEDIR '/extracted/rhoAl.tex']                   , 2);
rhoTaA=16650;                          printSigNumber(rhoTaA		     , [HOMEDIR '/extracted/rhoTaA.tex']		  , 2);

AttractorDiameter= 3*0.0254-1350e-6;   printSigNumber(AttractorDiameter      , [HOMEDIR '/extracted/AttractorDiameter.tex'       ], 4);
AttractorPlateThickness= 30e-3*0.0254; printSigNumber(AttractorPlateThickness, [HOMEDIR '/extracted/AttractorPlateThickness.tex' ], 2);
AttractorFullThickness = 12.91e-3 ;    printSigNumber(AttractorFullThickness , [HOMEDIR '/extracted/AttractorFullThickness.tex'  ], 4);
AttractorRimHeight = 0.0254*.4129 ;    printSigNumber(AttractorRimHeight     , [HOMEDIR '/extracted/AttractorRimHeight.tex'      ], 4);
AttractorBackerThickness= AttractorFullThickness - AttractorPlateThickness - AttractorRimHeight;
				       printSigNumber(AttractorBackerThickness,[HOMEDIR '/extracted/AttractorBackerThickness.tex'], 4);
AttractorInnerDiameter=0.0254*1.915;   printSigNumber(AttractorInnerDiameter , [HOMEDIR '/extracted/AttractorInnerDiameter.tex'  ], 4);
AttractorRimWidth= (AttractorDiameter - AttractorInnerDiameter)/2.0;


pa1=rhoTaA; % #Ta
pal1=rhoAl; % #Al
da1=AttractorPlateThickness; %# Ta attractor thickness
dal1=AttractorBackerThickness; % Al attractor thickness

%These offsets are entirely unchecked!
attrHorizOffset = 3.5e-3;		printSigNumber(attrHorizOffset    , [HOMEDIR '/extracted/attrHorizOffset.tex'], 2);
attrVertOffset = 0.5e-3;		printSigNumber(attrVertOffset	  , [HOMEDIR '/extracted/attrVertOffset.tex' ], 2);

%%%%% Screw gaps %%%%%

rhoGap = -rhoAl;

gapLength = 1e-3;			printSigNumber(gapLength  , [HOMEDIR '/extracted/screwGapLength.tex'  ], 1);
gapDiameter = 0.110*0.0254; 		printSigNumber(gapDiameter, [HOMEDIR '/extracted/screwGapDiameter.tex'], 2);


gapMass = pi * (gapDiameter/2.0)^2*gapLength * rhoGap;

%Distance from attractor plane to gap end
gapDistance = 1e-3; 			 printSigNumber(gapDistance  	   , [HOMEDIR '/extracted/screwGapDistFromPlane.tex'   ], 1);
gapRadialPosition = 72e-3/2;		 printSigNumber(gapRadialPosition  , [HOMEDIR '/extracted/screwGapRadialPosition.tex'  ], 2);

%%%%% Spindles %%%%
%See pg 82 of notebook

spindleLength = 2.901*0.0254;			printSigNumber(spindleLength        , [HOMEDIR '/extracted/spindleLength.tex'   ], 2);
spindleDiameter = 0.181*0.0254;		printSigNumber(spindleDiameter      , [HOMEDIR '/extracted/spindleDiameter.tex'   ], 2);

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
pendulumPMScanGridSize =2000e-6;printSigNumber(pendulumPMScanGridSize, [HOMEDIR '/extracted/pendulumPMScanGridSize.tex'],3);
pendulumPMScanVertStep = 5e-6;	printSigNumber(pendulumPMScanVertStep, [HOMEDIR '/extracted/pendulumPMScanVertStep.tex'],2);
pendulumPMBodyDensity = rhoTi;
pendulumPMInlayDensity =  rhoTaP;

%was 200e-6
attractorPMScanGridSize = pendulumPMScanGridSize;	printSigNumber(attractorPMScanGridSize, [HOMEDIR '/extracted/attractorPMScanGridSize.tex'],3);
attractorPMScanVertStep = 2.5e-6;	printSigNumber(attractorPMScanVertStep, [HOMEDIR '/extracted/attractorPMScanVertStep.tex'],2);
attractorPMDensity = rhoTaA;


%%%%%% Q-tester bricks %%%%%%%

%brick mass
brickMass = 23.88;
brickMassErr = 0.34;			printSigError(brickMass, brickMassErr, [HOMEDIR '/extracted/brickMass.tex']);

%brick dimensions
brickHeight = 8*0.0254;			printSigNumber(brickHeight	    , [HOMEDIR '/extracted/brickHeight.tex'    ],2);
brickWidth  = 4*0.0254;			printSigNumber(brickWidth	    , [HOMEDIR '/extracted/brickWidth.tex'     ],2);

%brick positions
brickRadius = 25*0.0254;		printSigNumber(brickRadius	    , [HOMEDIR '/extracted/brickRadius.tex'    ],2);
% elevation to center of brick
brickElevation = 16*0.0254;		printSigNumber(brickElevation	    , [HOMEDIR '/extracted/brickElevation.tex' ],2);


%%%% Bellows %%%% 

rhoAir = 1;
bellowsPressure = 50.0/14.0;

bellowsLength = 70e-3;
bellowsDiameter = 25e-3;

bellowsVolume = pi * (bellowsDiameter/2.0)^2 * bellowsLength; 	printSigNumber(bellowsVolume, [HOMEDIR '/extracted/bellowsVolume.tex'], 2);

bellowsMass = bellowsVolume * rhoAir * bellowsPressure;		printSigNumber(bellowsMass,   [HOMEDIR '/extracted/bellowsMass.tex'  ], 2);

bellowsDistance = 180e-3; 					printSigNumber(bellowsDistance, [HOMEDIR '/extracted/bellowsDistance.tex'],2);
bellowsHeight = 0;
bellowsOffset = 0;

