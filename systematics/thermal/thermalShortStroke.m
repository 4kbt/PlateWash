run3147FixedParameters

%Heat On
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3217pM3FilterOnly.dat'));
bL = pM;

%No Heat
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

[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrThresh, torErrMin, psSquareCol, numSensors, 1, 2);


%Output...

%filePath = [HOMEDIR 'extracted/'];
filePath = ['extracted/'];

printSigError( l0Diff(1), l0Diff(2) , [filePath 'longStrokeL0Diff.tex']);

olHist = [blBins blH];
o0Hist = [b0Bins b0H];

save 'plots/shortStrokeoHHist.dat' olHist
save 'plots/shortStrokeo0Hist.dat' o0Hist

save 'plots/shortStrokeo0Positions.dat' b0Positions
save 'plots/shortStrokeoHPositions.dat' bLPositions
