more off;

try
run3147preSM3A
catch
end

run3220sync3


N = 4000;
S = ceil(1.5*N);

Nyq = 1.0/TheoSampleTime/2.0;

filterHigh3220 = 0.002;  printInteger( 1000*filterHigh3220      ,  [HOMEDIR 'extracted/filterHigh3220.tex']);


F = fir1(N, filterHigh3220/Nyq,'high');
FA = fir1(N,1); 

D  = filter(F, 1,(pwData(:,15)-mean(pwData(:,15)))*1e-2/400e-3/4);
DT = filter(F, 1,pwData(:,torqueCol)-mean(pwData(:,torqueCol)))*torqueCal;
DA = filter(FA,1,psData(:,9));

f  = coherentAverage([pwData(S:end,pwTimeCol) D(S:end)] , stepPeriod/TheoSampleTime);
fT = coherentAverage([pwData(S:end,pwTimeCol) DT(S:end)], stepPeriod/TheoSampleTime);
c = transpose(0:TheoSampleTime:(stepPeriod-TheoSampleTime*0.1) );

offsT = mod(pwData(S,pwTimeCol), stepPeriod);
offsA = mod(psData(S,psTimeCol), stepPeriod);

m   =       [mod(pwData(S:end,pwTimeCol) - offsT, stepPeriod) D(S:end) ]; 
tor =       [mod(pwData(S:end,pwTimeCol) - offsT, stepPeriod) DT(S:end)]; 

attractor = [mod(psData(S:end,psTimeCol) - offsA, stepPeriod) DA(S:end)];

hold off


plot(m(:,1), m(:,2), '1.', c,f(:,1));

o =  [c f ];
oT = [c fT];

save 'run3220torqueLagMod.dat' m
save 'run3220torqueLagCoh.dat' o 
save 'run3220torqueLagAtt.dat' attractor
save 'run3220torqueLagTor.dat' tor
save 'run3220torqueLagTorCoh.dat' oT
