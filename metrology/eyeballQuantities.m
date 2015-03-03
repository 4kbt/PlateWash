run3147MetrologyParameters

printSI( PendulumFlatness  , 2, -6, 'm', 'extracted/pendulumFlatness.tex' );
printSI( AttractorFlatness , 2, -6, 'm', 'extracted/attractorFlatness.tex');
printSI( FoilFlatness      , 1, -6, 'm', 'extracted/foilFlatness.tex'     );

%drawn from plateau plot
plateauAngle            = 0.2e-3; 
plateauAngleUncertainty = sqrt( (0.05e-3)^2 + (0.05e-3)^2 );
plateauOut = [plateauAngle plateauAngleUncertainty];

printSIErr(plateauAngle, plateauAngleUncertainty, 1, -6, 'rad', 'extracted/plateauAngle.tex'); 
save('-ascii', 'extracted/plateauAngle.dat', 'plateauOut');


%attractor tip
attractorTip 		= 20e-6;
attractorTipUncertainty = 3e-6 ;
attractorTipOut = [attractorTip attractorTipUncertainty];

printSIErr(attractorTip, attractorTipUncertainty, 1, -6, 'm', 'extracted/attractorTip.tex');
save('-ascii', 'extracted/attractorTip.dat', 'attractorTipOut');
