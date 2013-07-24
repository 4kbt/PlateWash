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

%load('../runAnalysis/alwaysUnblindedResults/run3164pM3FilterOnly.dat');
%b0 = [b0; pM];

%load('../runAnalysis/alwaysUnblindedResults/run3165pM3FilterOnly.dat');
%b0 = [b0; pM];

load('../runAnalysis/alwaysUnblindedResults/run3166pM3FilterOnly.dat');
b0 = [b0; pM];



clear pM;


bLTor = uncertaintyOverTime(bL(:,torqueCol), bL(:,torerrCol)) (end,:); 
bRTor = uncertaintyOverTime(bR(:,torqueCol), bR(:,torerrCol)) (end,:); 
b0Tor = uncertaintyOverTime(b0(:,torqueCol), b0(:,torerrCol)) (end,:); 

bL(:,torqueCol) = 0;
bR(:,torqueCol) = 0;
b0(:,torqueCol) = 0;

function o = diffOfTwoMeasurements(m1, m2)
	o = m1(1) - m2(1);
	o(2) = sqrt(m1(2)^2 +m2(2)^2);
end

LRDiff = diffOfTwoMeasurements(bLTor, bRTor)
L0Diff = diffOfTwoMeasurements(bLTor, b0Tor)
R0Diff = diffOfTwoMeasurements(bRTor, b0Tor)

