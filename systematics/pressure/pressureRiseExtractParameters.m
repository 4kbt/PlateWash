d = load('pressureRiseFitParameters.dat');

printSigNumber(d(1,1), 'extracted/pressureRiseRate.tex', 1);

%1000 l/m^3

printSigNumber(d(1,1)*1000.0, 'extracted/pressureRiseRateTorrLS.tex', 1);
