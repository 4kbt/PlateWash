run3147FixedParameters
fundamentalConstants

foilTension = foilDensity*foilThickness*pi^2*foilDiameter^2*foilResonance^2/(2.4048)^2;
printSigNumber(foilTension, [HOMEDIR '/extracted/foilTension.tex'], 2);
save 'foilTension.dat' foilTension


gasPressure = load( [HOMEDIR '/systematics/pressure/finalPressure.dat']); 
gasPressure = gasPressure * OnePascalInTorr;

gasFoilDisplacement = gasPressure*(foilDiameter/2.0)^2/4/foilTension;
printSI(gasFoilDisplacement, 1, -12, 'm', [HOMEDIR '/extracted/gasFoilDisplacement.tex']);

%import foil-motion to pendulum-torque conversion constant
torqueConv = load('torqueConv.dat');
torqueConv = torqueConv(1)*10^torqueConv(3);

gasFoilTorque = gasFoilDisplacement*torqueConv;
printSI(gasFoilTorque, 1, -15, 'N-m', [HOMEDIR '/extracted/gasFoilTorque.tex']);
