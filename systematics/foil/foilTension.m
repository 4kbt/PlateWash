run3147FixedParameters
fundamentalConstants

foilTension = foilDensity*foilThickness*pi^2*foilDiameter^2*foilResonance^2/(2.4048)^2;
printSigNumber(foilTension, [HOMEDIR '/extracted/foilTension.tex'], 2);

gasPressure = load( [HOMEDIR '/systematics/pressure/finalPressure.dat']); 
gasPressure = gasPressure * OnePascalInTorr;

gasFoilDisplacement = gasPressure*(foilDiameter/2.0)^2/4/foilTension;
printSigNumber(gasFoilDisplacement, [HOMEDIR '/extracted/gasFoilDisplacement.tex'],1);

%import foil-motion to pendulum-torque conversion constant
torqueConv = load('torqueConv.dat');
torqueConv = torqueConv(1)*10^torqueConv(3);

gasFoilTorque = gasFoilDisplacement*torqueConv;
printSigNumber(gasFoilTorque, [HOMEDIR '/extracted/gasFoilTorque.tex'],1);
