fundamentalConstants
run3147FixedParameters

d = load('finalPressure.dat');

printSI(d, 1, -9, 'torr', 'extracted/finalPressureTorr.tex');

pd = d*OnePascalInTorr

printSI(pd, 1, -6,'Pa', 'extracted/finalPressurePa.tex');


%taken from Levy Paper -- 1/QP = 5 at P = ~90 um.

QGas = 1/(5*pd);

%According to Stephan's wallet card for external damping, 
NoisePowerOfOmega = 4 * k_B * 293 * kappa /QGas / (2*pi*pendulumF0);

printSI(sqrt(NoisePowerOfOmega), 1, -15, 'N-m/$\sqrt{\mbox{Hz}}$', 'extracted/squeezeFilmNoisePower.tex');
