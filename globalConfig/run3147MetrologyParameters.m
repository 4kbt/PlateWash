%Metrology:

%bounce-test
bounceTestU 	    =  5e-6;
bounceTouchPosition = -892e-6;
bounceAngleOffset   = 0.00058;
bounceAngleOffsetU  = 200e-6;

%pendulum tip angle
plateauAngle  = 0.2e-3; 
plateauStatU  = 0.01e-3; 
plateauSysU   = sqrt( (0.05e-3)^2 + (0.05e-3)^2 );
plateauAngleU = sqrt( plateauStatU^2 + plateauSysU^2 );
plateauM = ...
	[ plateauAngle plateauStatU plateauSysU plateauAngleU ];

%attractor tip
attractorTip      = 20e-6 ;
attractorTipStatU = 2e-6  ;
attractorTipSysU  = 5e-6  ;
attractorTipU     = sqrt( attractorTipStatU^2 + attractorTipSysU^2 ) ;
attractorM = ...
	[ attractorTip attractorTipStatU attractorTipSysU attractorTipU ];

%Flatness scans
%all three are +-, so double for absolute distance
%should consider an area correction for pendulum
PendulumFlatness      = 7.5e-6 ;
PendulumFlatnessStatU = 1e-6   ;
PendulumFlatnessSysU  = 7.5e-6 ;
PendulumFlatnessU     = sqrt(PendulumFlatnessStatU^2 + PendulumFlatnessSysU^2);
PendulumFlatnessM = ...
	[ PendulumFlatness PendulumFlatnessStatU PendulumFlatnessSysU PendulumFlatnessU ];

AttractorFlatness      = 4.5e-6 ;
AttractorFlatnessStatU = 1e-6   ;
AttractorFlatnessSysU  = 4.5e-6 ;
AttractorFlatnessU     = sqrt(AttractorFlatnessStatU^2 + AttractorFlatnessSysU^2);
AttractorFlatnessM = ...
	[ AttractorFlatness AttractorFlatnessStatU AttractorFlatnessSysU AttractorFlatnessU ];

FoilFlatness      = 2e-6 ;
FoilFlatnessStatU = 1e-6 ;
FoilFlatnessSysU  = 2e-6 ;
FoilFlatnessU     = sqrt(FoilFlatnessSysU^2 + FoilFlatnessSysU^2);
FoilFlatnessM = ...
	[ FoilFlatness FoilFlatnessStatU FoilFlatnessSysU FoilFlatnessU ];
