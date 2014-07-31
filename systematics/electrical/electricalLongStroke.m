run3147FixedParameters

%run#	resist	bypassCap
resistorRuns = [...
3167
];

numCuts = 0;

for resistorCtr = 1:rows(resistorRuns)
	runString = num2str(resistorRuns(resistorCtr,1));


	load(strcat( HOMEDIR , ['runAnalysis/alwaysUnblindedResults/run' runString 'pM3FilterOnly.dat']));

	TorDiff = uncertaintyOverTime( pM(:,torqueCol), pM(:, torerrCol));

	numCuts += rows(pM);

	%Output...

	l0Diff = TorDiff(end,:);

	%Approach borrowed from compareTwoSquareWavesBlind.m
	aDev = l0Diff(2) * sqrt(rows(pM));

	aBins = (min(pM(:,torqueCol)):aDev:max(pM(:,torqueCol)));

	[aH aX] = hist(pM(:,torqueCol), aBins);

	filePath = ['extracted/'];

	printSIErr( l0Diff(1), l0Diff(2) , 1, -15, 'N-m', [filePath 'longStrokeL0Diff' runString '.tex']);

	%These don't work/don't appear to be necessary (data comes out in *.tex, see Makefile)
	%outData =[resistorRuns(resistorCtr,:) l0Diff];
	%save (['plots/longStroke' runString '.dat'],"outData");

	olHist = [aBins' aH'];

	save (['plots/longStrokeoHHist' runString '.dat'], "olHist");
end

totalTime = numCuts*stepPeriod*lockAve; 

printInteger(totalTime, [filePath 'totalSecondslongStrokeL0.tex']);
