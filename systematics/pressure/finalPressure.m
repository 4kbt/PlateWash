fundamentalConstants

d = load('finalPressure.dat');

printSigNumber(d, 'extracted/finalPressureTorr.tex', 2);

printSigNumber(d*OnePascalInTorr, 'extracted/finalPressurePa.tex', 2);
