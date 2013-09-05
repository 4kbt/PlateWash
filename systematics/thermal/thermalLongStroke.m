run3147FixedParameters

%Red on Left
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3197pM3FilterOnly.dat'));
bL = pM;

%Zero applied field
b0 = [];
load(strcat(HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3154pM3FilterOnly.dat'));
b0 = [b0; pM];

clear pM;

[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrThresh, torErrMin, psSquareCol, numSensors, 1, 2);


%Output...

filePath = ['extracted/'];

printSigError( l0Diff(1), l0Diff(2) , [filePath 'longStrokeL0Diff.tex']);

olHist = [blBins blH];
o0Hist = [b0Bins b0H];

save 'plots/longStrokeo0Hist.dat' o0Hist
save 'plots/longStrokeoHHist.dat' olHist

save 'plots/longStrokeo0Positions.dat' b0Positions
save 'plots/longStrokeoHPositions.dat' bLPositions
