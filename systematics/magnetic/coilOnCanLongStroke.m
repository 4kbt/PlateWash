run3147FixedParameters

%Red on Left
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3197pM3FilterOnly.dat'));
bL = pM;

%Zero applied field
b0 = [];
load(strcat(HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3154pM3FilterOnly.dat'));
b0 = [b0; pM];

clear pM;

[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);


strokeType = 'long';

blindSystematicCore
