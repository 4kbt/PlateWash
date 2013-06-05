d = load('run3147calFitChkMerge.dat');


%Time cut
d =d( d(:,1) > 1e8,:);

%Chi-square cut <-- WHY?????? Many points with correct frequency near day 1180 are affected.
d =d( d(:,10) < 2e-8 , :);

freq2   = 0.006;
freqTol = 0.00005;

%frequency cut
d = d( abs( d(:,12) - freq2) < freqTol , :);


m = mean(sqrt(d(:,6).^2 + d(:,7).^2));
s =  std(sqrt(d(:,6).^2 + d(:,7).^2));


printSigError(m,s/sqrt(rows(d)), '../extracted/CalibFitWErr.tex');

M = m*ones(rows(d),1);
S = s*ones(rows(d),1);

out = [d(:,1) M S/sqrt(rows(d))];



save -ascii 'run3147calFitChkMean.dat' out
save 'run3147calFitChkMergeCut.dat' d
