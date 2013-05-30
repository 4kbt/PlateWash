'setup'

run3147FixedParameters

printInteger(Nfilt, 'extracted/calibCutLength.tex'); 

qLow = qTesterFreq1-qTesterChunkCalibWidth1;
qHigh =qTesterFreq1+qTesterChunkCalibWidth1;

out = OneTwoOmegaChunkCalibFit( pwData, pwTimeCol, torqueCol, qLow, qHigh, Nfilt);

'read Complete'
