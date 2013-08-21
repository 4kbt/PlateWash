run3147FixedParameters

%Red on Right
load('../runAnalysis/alwaysUnblindedResults/run3203pM3FilterOnly.dat');
bR = pM;

%Red on Left
load('../runAnalysis/alwaysUnblindedResults/run3204pM3FilterOnly.dat');
bL = pM;

load('../runAnalysis/alwaysUnblindedResults/run3205pM3FilterOnly.dat');
bL = [bL; pM];

%Zero applied field
b0 = [];
load('../runAnalysis/alwaysUnblindedResults/run3161pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3163pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3164pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3166pM3FilterOnly.dat');
b0 = [b0; pM];

clear pM;

[lrDiff blBins blH brBins brH] = compareTwoSquareWavesBlind( bL,bR, torCol, torerrCol, torErrThresh, torErrMin, psSquareCol, numSensors);
[r0Diff brBins brH b0Bins b0H] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrThresh, torErrMin, psSquareCol, numSensors);
[l0Diff blBins blH b0Bins b0H] = compareTwoSquareWavesBlind( bR,b0, torCol, torerrCol, torErrThresh, torErrMin, psSquareCol, numSensors);


%Output...

filePath = [HOMEDIR 'extracted/'];

printSigError( lrDiff(1), lrDiff(2) , [filePath 'shortStrokeLRDiff.tex']);
printSigError( r0Diff(1), r0Diff(2) , [filePath 'shortStrokeR0Diff.tex']);
printSigError( l0Diff(1), l0Diff(2) , [filePath 'shortStrokeL0Diff.tex']);

olHist = [blBins blH];
orHist = [brBins brH];
o0Hist = [b0Bins b0H];

save 'plots/shortStrokeolHist.dat' olHist
save 'plots/shortStrokeorHist.dat' orHist
save 'plots/shortStrokeo0Hist.dat' o0Hist

