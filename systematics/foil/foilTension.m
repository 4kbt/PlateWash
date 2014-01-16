run3147FixedParameters
fundamentalConstants

foilTension = foilDensity*foilThickness*pi^2*foilDiameter^2*foilResonance^2/(2.4048)^2;
printSigNumber(foilTension, [HOMEDIR '/extracted/foilTension.tex'], 2);

gasPressure = load( [HOMEDIR '/systematics/pressure/finalPressure.dat']); 
gasPressure = gasPressure * OnePascalInTorr;

gasFoilDisplacement = gasPressure*(foilDiameter/2.0)^2/4/foilTension;
printSigNumber(gasFoilDisplacement, [HOMEDIR '/extracted/gasFoilDisplacement.tex'],1);
