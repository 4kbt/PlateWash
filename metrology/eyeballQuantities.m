run3147MetrologyParameters

printSI( PendulumFlatness  , 2, -6, 'm', 'extracted/pendulumFlatness.tex' );
printSI( AttractorFlatness , 2, -6, 'm', 'extracted/attractorFlatness.tex');
printSI( FoilFlatness      , 1, -6, 'm', 'extracted/foilFlatness.tex'     );

%drawn from plateau plot
plateauOut = [plateauAngle plateauStatU plateauSysU plateauAngleU];

printSIErr(plateauAngle, plateauAngleU, 1, -6, 'rad', 'extracted/plateauAngle.tex'); 
save('-ascii', 'extracted/plateauAngle.dat', 'plateauOut');

%attractor tip
attractorTipOut = [attractorTip attractorTipStatU attractorTipSysU attractorTipU];

printSIErr(attractorTip, attractorTipU, 1, -6, 'm', 'extracted/attractorTip.tex');
save('-ascii', 'extracted/attractorTip.dat', 'attractorTipOut');
