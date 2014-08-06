run3147FixedParameters

d = load('run3147calFitChkMerge.dat');


%Time cut
d =d( d(:,1) > 1e8,:);

%Chi-square cut <-- WHY?????? Many points with correct frequency near day 1180 are affected.
d =d( d(:,10) < 2e-8 , :);

freq2   = 0.006;
freqTol = 0.00005;

%frequency cut
d = d( abs( d(:,12) - freq2) < freqTol , :);

meanfreq = mean(d(:,12));
stdfreq  = std( d(:,12)); 
printSIErr( meanfreq, stdfreq/sqrt(rows(d)), 1, -3, 'Hz', '../extracted/CalibFrequency.tex');

freqOut = [meanfreq stdfreq rows(d)];

save 'run3147calFreq.dat' freqOut

m = mean(sqrt(d(:,6).^2 + d(:,7).^2));
s =  std(sqrt(d(:,6).^2 + d(:,7).^2));


printSIErr(m             , s/sqrt(rows(d))             , 1, -6, 'N-m/AFU', '../extracted/CalibFitWErr.tex'         );
printSIErr(m*psdToRadians, s/sqrt(rows(d))*psdToRadians, 1, -9, 'N-m/rad', '../extracted/CalibFitWErrInRadians.tex');

M = m*ones(rows(d),1);
S = s*ones(rows(d),1);

out = [d(:,1) M S/sqrt(rows(d))];



save -ascii 'run3147calFitChkMean.dat' out
save 'run3147calFitChkMergeCut.dat' d
