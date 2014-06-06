run3147FixedParameters

%Heat On Red High
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3217pM3FilterOnly.dat'));
bL = pM;

%Heat On Blue High
load(strcat( HOMEDIR , 'runAnalysis/alwaysUnblindedResults/run3221pM3FilterOnly.dat'));
bR = pM;


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

strokeType = 'short';

blindSystematicCore
