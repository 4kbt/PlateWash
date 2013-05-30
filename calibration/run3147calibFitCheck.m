'setup'
torqueCol   = 16;

Nfilt = 2560*3/0.8; printInteger(Nfilt, 'extracted/calibCutLength.tex'); 

qLow = 2.5e-3;
qHigh = 3.5e-3;

out = OneTwoOmegaChunkCalibFit( pwData, pwTimeCol, torqueCol, qLow, qHigh, Nfilt);

'read Complete'
