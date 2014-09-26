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

%%%%% PENDULUM TiTa %%%%%%

%        'jan13Pendulum'
rhoTi=4507;
printSI( rhoTi, 2, 3 ,'g/m$^3$',  [HOMEDIR '/extracted/titaniumDensity.tex' ]);
pendulumBodyHeight=0.0321203;
pendulumBodyHeightErr = 0.005*0.0254; %Safe SWAG, see pg 57
printSIErr(pendulumBodyHeight, pendulumBodyHeightErr, 1, -3, 'm',[HOMEDIR '/extracted/pendulumBodyHeight.tex' ]);
pendulumBodyWidth = 0.0431448; 
pendulumBodyWidthErr = 0.005*0.0254; %Safe SWAG, see pg 57
printSIErr(pendulumBodyWidth,  pendulumBodyWidthErr,  1, -3, 'm',[HOMEDIR '/extracted/pendulumBodyWidth.tex'  ]); 
pendulumBodyThickness    = 0.070*0.0254; %See pg 50 for pre-machined thicknesses
pendulumBodyThicknessErr = 0.004*0.0254; %unclear how much material removed by lapping.
printSIErr(pendulumBodyThickness , pendulumBodyThicknessErr, 1, -3, 'm', [HOMEDIR '/extracted/pendulumBodyThickness.tex']);
%The following output is used elsewhere?
printSigNumber(pendulumBodyThickness , [HOMEDIR '/extracted/pendulumBodyThicknessNoSI.tex'],2);
pendulumBodyMass=rhoTi*pendulumBodyHeight*pendulumBodyWidth*pendulumBodyThickness;
%Before etch/lapping, body with inlay cuts was 9.6143g (pg 54)
%After all filing, total pendulum mass was 13.8602g. (pg 55)

rhoTaP=16650; printSI(rhoTaP, 2, 3, 'g/m$^3$', [HOMEDIR '/extracted/inlayDensity.tex' ]);
rhoInlay=rhoTaP-rhoTi;
inlayHeight=pendulumBodyHeight;

inlayThickness=0.008*0.0254 ; %see pg 51
inlayThicknessErr = 0.002*0.0254; %see pg 51 
printSIErr(inlayThickness, inlayThicknessErr, 1, -6, 'm', [HOMEDIR '/extracted/inlayThickness.tex' ]);

inlayWidth = pendulumBodyWidth-1.087*0.0254 ; %See pg 50
inlayWidthErr = 0.005*0.0254; %conservative.
printSIErr(inlayWidth, inlayWidthErr, 1, -3, 'm', [HOMEDIR '/extracted/inlayWidth.tex' ]);

inlayMass=rhoInlay*inlayHeight*inlayThickness*inlayWidth; printSigNumber(inlayMass, [HOMEDIR '/extracted/inlayMass.tex' ], 2);



h1=pendulumBodyHeight;	PendStruct.h1 = h1; % Pendulum height
w1=pendulumBodyWidth;	PendStruct.w1 = w1; % Pendulum Width
j1=pendulumBodyWidth/2.0-inlayWidth; PendStruct.j1 = j1;%Distance from pendulum center to step.
a1=inlayThickness;	PendStruct.a1 = a1; % inset thickness
thickness1=pendulumBodyThickness; PendStruct.thickness1 = thickness1;
ph1=rhoTaP;		PendStruct.ph1 = ph1;  %Ta
pl1=rhoTi; 		PendStruct.pl1 = pl1;  %Ti
insetWidth=inlayWidth;	PendStruct.insetWidth = insetWidth; 
momentArm=insetWidth/2+j1;	PendStruct.momentArm = momentArm;
pendCenterToStep = j1;	PendStruct.pendCenterToStep = j1;

PendStruct.G = G;
