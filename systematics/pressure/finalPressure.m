d = load('finalPressure.dat');

printSigNumber(d, 'extracted/finalPressureTorr.tex', 2);

OnePascalInTorr = 133.3224;

printSigNumber(d*OnePascalInTorr, 'extracted/finalPressurePa.tex', 2);
