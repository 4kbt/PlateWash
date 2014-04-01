run3147FixedParameters

%Red on Right
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3203pM3FilterOnly.dat'));
bR = pM;

%Red on Left
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3204pM3FilterOnly.dat'));
bL = pM;

load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3205pM3FilterOnly.dat'));
bL = [bL; pM];

%Zero applied field
b0 = [];
load(strcat( HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3161pM3FilterOnly.dat'));
b0 = [b0; pM];

load(strcat( HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3163pM3FilterOnly.dat'));
b0 = [b0; pM];

load(strcat( HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3164pM3FilterOnly.dat'));
b0 = [b0; pM];

load(strcat( HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3166pM3FilterOnly.dat'));
b0 = [b0; pM];

clear pM;

[lrDiff blBins blH brBins brH bLPositions bRPositions] = compareTwoSquareWavesBlind( bL,bR, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);
[r0Diff brBins brH b0Bins b0H bRPositions b0Positions] = compareTwoSquareWavesBlind( bR,b0, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);
[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);


%Output...

%filePath = [HOMEDIR 'extracted/'];
filePath = ['extracted/'];

printSigError( lrDiff(1), lrDiff(2) , [filePath 'shortStrokeLRDiff.tex']);
printSigError( r0Diff(1), r0Diff(2) , [filePath 'shortStrokeR0Diff.tex']);
printSigError( l0Diff(1), l0Diff(2) , [filePath 'shortStrokeL0Diff.tex']);

olHist = [blBins blH];
orHist = [brBins brH];
o0Hist = [b0Bins b0H];

save 'plots/shortStrokeolHist.dat' olHist
save 'plots/shortStrokeorHist.dat' orHist
save 'plots/shortStrokeo0Hist.dat' o0Hist

save 'plots/shortStrokeo0Positions.dat' b0Positions
save 'plots/shortStrokeoLPositions.dat' bLPositions
save 'plots/shortStrokeoRPositions.dat' bRPositions
