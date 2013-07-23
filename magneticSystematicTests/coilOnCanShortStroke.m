%Red on Right
load('../runAnalysis/results/run3203pM3FilterOnly.dat');
bR = pM;

%Red on Left
load('../runAnalysis/results/run3204pM3FilterOnly.dat');
bL = pM;

load('../runAnalysis/results/run3205pM3FilterOnly.dat');
bL = [bL; pM];

%Zero applied field
load('../runAnalysis/results/run3161pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/results/run3163pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/results/run3164pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/results/run3165pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/results/run3167pM3FilterOnly.dat');
b0 = [b0; pM];

load('../runAnalysis/results/run3168pM3FilterOnly.dat');
b0 = [b0; pM];

clear pM;


bLTor = binWeightedAverage(bL(:,torqueCol), 
