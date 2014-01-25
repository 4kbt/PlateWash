fundamentalConstants

HOMEDIR = getenv("HOMEDIR");

%%%%% PENDULUM TiTa %%%%%%

%        'jan13Pendulum'

rhoTi=4507; printInteger(rhoTi, [HOMEDIR '/extracted/titaniumDensity.tex' ]);
pendulumBodyHeight=0.0321203; printSigNumber(pendulumBodyHeight, [HOMEDIR '/extracted/pendulumBodyHeight.tex' ],6);
pendulumBodyWidth =0.0431448; printSigNumber(pendulumBodyWidth, [HOMEDIR '/extracted/pendulumBodyWidth.tex' ],6); %How did I get a part in 10^6?
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
attrHorizOffset = 5e-3;
attrVertOffset = 0.5e-3;

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

