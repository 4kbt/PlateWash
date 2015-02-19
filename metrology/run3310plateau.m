run3147FixedParameters

[pwData pwStartSec pwEndSec] = minimalPWLoad( '3310', HOMEDIR);

out = [pwData(:, pwTimeCol) - pwData(1,pwTimeCol), ... 
	pwData(:,pwPhiTopCol), ...
	pwData(:,pwPsiCol) * psdToRadians ...
	];

d = load( [HOMEDIR '/runAnalysis/results/run3147pM3FilterMerge.dat']);

tout = [d(:,pwTimeCol + numSensors)/86400 d(:,pwPsiCol + numSensors)* psdToRadians];

save 'run3310plateau.dat' out 
save 'run3147PsiOverTime.dat' tout

