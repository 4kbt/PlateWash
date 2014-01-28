more off

run3147FixedParameters

run3147sync3

pE = load( [HOMEDIR '/calibration/pressure/run2937pressEncOutput.dat']);



cta = coherentTimeAverage( ...
	[psData(2:end,psTimeCol), diff(psData(:,psSquareCol) * pE(1))], ...
	256, 1, 1);

save 'run3147attractorLeakBack.dat' cta


