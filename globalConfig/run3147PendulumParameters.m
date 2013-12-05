%CODATA
G =  6.67428e-11;

%%%%% PENDULUM TiTa %%%%%%

        'jan13Pendulum'

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
