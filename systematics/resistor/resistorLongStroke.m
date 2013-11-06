run3147FixedParameters

%run#	resist	bypassCap
resistorRuns = [\
3174	1e-3	0;\
3176	1e9	0;\
3177	10e3	0;\
3178	50	0;\
3179	1	0;\
3180	0.1	0;\
3181	1e9	1;\
3182	50	1;\
];

for resistorCtr = 1:rows(resistorRuns)
	runString = num2str(resistorRuns(resistorCtr,1));

	%Red on Left
	load(strcat( HOMEDIR , ['runAnalysis/alwaysUnblindedResults/run' runString 'pM3FilterOnly.dat']));
	bL = pM;

	%Zero applied field
	b0 = [];
	load(strcat(HOMEDIR, 'runAnalysis/alwaysUnblindedResults/run3154pM3FilterOnly.dat'));
	b0 = [b0; pM];

	clear pM;

	[l0Diff blBins blH b0Bins b0H bLPositions b0Positions] = compareTwoSquareWavesBlind( bL,b0, torCol, torerrCol, torErrThresh, torErrMin, numPWSensors + psSquareCol, numSensors, 1, 2);

	b0Uncertainty = uncertaintyOverTime(b0(:,torCol), b0(:,torerrCol)) (end,2);
	b0Uncertainty = [3154 20e6 0 0 b0Uncertainty];

	%Output...

	filePath = ['extracted/'];

	printSigError( l0Diff(1), l0Diff(2) , [filePath 'longStrokeL0Diff' runString '.tex']);

	outData = [resistorRuns(resistorCtr,:) l0Diff];

	save (['plots/longStroke' runString '.dat'],"outData");

	olHist = [blBins blH];
	o0Hist = [b0Bins b0H];

	save 'plots/longStrokeo0Hist.dat' o0Hist
	save 'plots/b0Uncertainty.dat' b0Uncertainty
	save (['plots/longStrokeoHHist' runString '.dat'], "olHist");

	save  'plots/longStrokeo0Positions.dat' b0Positions
	save (['plots/longStrokeoHPositions' runString '.dat'], 'bLPositions');
end
