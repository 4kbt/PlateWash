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

strokeType = ['short'];

blindSystematicCore
