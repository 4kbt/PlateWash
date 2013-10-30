more off;


run3224sync3

try
run3147preSM3A
%run3224preSM3A
catch
end


%N = 4000;
%S = ceil(1.5*N);
%
%F = fir1(N, 0.001,'high');
%FA = fir1(N,1); 

%D  = filter(F, 1,pwData(:,15)*1e-2/400e-3/4);
%DT = filter(F, 1,pwData(:,torqueCol));
%DA = filter(FA,1,psData(:,15));

%N = 4000;
%S = ceil(1.5*N);

%F = fir1(N, 0.001,'high');
%FA = fir1(N,1); 

D  = pwData(:,15)*1e-2/400e-3/4; %filter(F, 1,pwData(:,15)*1e-2/400e-3/4);
DT = pwData(:,torqueCol)*torqueCal ; %filter(F, 1,pwData(:,torqueCol));
DA = psData(:,15) ; %filter(FA,1,psData(:,15));


f  = coherentAverage([pwData(1:end,pwTimeCol) D(1:end)] , stepPeriod*2.0/TheoSampleTime);
fT = coherentAverage([pwData(1:end,pwTimeCol) DT(1:end)], stepPeriod*2.0/TheoSampleTime);
c = transpose(0:TheoSampleTime:(stepPeriod*2.0-TheoSampleTime*0.1) );

offsT = mod(pwData(1,pwTimeCol), stepPeriod*2.0);
offsA = mod(psData(1,psTimeCol), stepPeriod*2.0);

m   =       [mod(pwData(1:end,pwTimeCol) - offsT, stepPeriod*2.0) D(1:end )]; 
tor =       [mod(pwData(1:end,pwTimeCol) - offsT, stepPeriod*2.0) DT(1:end)]; 

attractor = [mod(psData(1:end,psTimeCol) - offsA, stepPeriod*2.0) DA(1:end)];

hold off


plot(m(:,1), m(:,2), '1.', c,f(:,1));

o =  [c f ];
oT = [c fT];

save 'run3224torqueLagMod.dat' m
save 'run3224torqueLagCoh.dat' o 
save 'run3224torqueLagAtt.dat' attractor
save 'run3224torqueLagTor.dat' tor
save 'run3224torqueLagTorCoh.dat' oT
