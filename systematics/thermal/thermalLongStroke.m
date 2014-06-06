run3147FixedParameters

%Red High
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3218pM3FilterOnly.dat'));
bL = pM;

%Blue High 
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3222pM3FilterOnly.dat'));
bR = pM;


%Zero applied field
b0 = [];
load(strcat(HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3154pM3FilterOnly.dat'));
b0 = [b0; pM];


strokeType = 'long';

blindSystematicCore
