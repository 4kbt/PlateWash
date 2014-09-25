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


