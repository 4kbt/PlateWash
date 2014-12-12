upsInfo = load('results/unCorrectedpsTimeInfo.dat');
upwInfo = load('results/unCorrectedpwTimeInfo.dat');

psP = [];
pwP = [];
psS = [];
pwS = [];

%Ascertain rate difference
for i = 1:1000
	%bootstrap
	boPS = bootstrapData(upsInfo);
	boPW = bootstrapData(upwInfo);

	%fit
	psPoly = polyfit( (boPS(:,3) - boPS(:,2)) , boPS(:,4) - boPS(:,3), 1);
	pwPoly = polyfit( (boPW(:,3) - boPW(:,2)) , boPW(:,4) - boPW(:,3), 1);

	%aggregate
	psP = [ psP ; psPoly ];
	pwP = [ pwP ; pwPoly ];

	%sampleRate Fit
	psRate = mean( (boPS(:,3) - boPS(:,2) ) ./ boPS(:,5) );
	pwRate = mean( (boPW(:,3) - boPW(:,2) ) ./ boPW(:,5) );

	%aggregate
	psS = [ psS ; psRate ];
	pwS = [ pwS ; pwRate ];

end

%compute clock-rate properties
psFitMean = mean(psP);
pwFitMean = mean(pwP);
psFitErr  = std (psP);
pwFitErr  = std (pwP);

%output clock-rate errors
printSIErr( psFitMean(1) , psFitErr(1) , 1, 0, 's', [ HOMEDIR 'extracted/psWindowsClockRateError.tex'] );
printSIErr( pwFitMean(1) , pwFitErr(1) , 1, 0, 's', [ HOMEDIR 'extracted/pwWindowsClockRateError.tex'] );

save( 'results/psWindowsClockRateError.dat', 'psFitMean');
save( 'results/pwWindowsClockRateError.dat', 'pwFitMean' );


%Plot clock-rate fit
linx = 1 : 10 : 800000 ;

plot( ...
	upsInfo(:,3) - upsInfo(:,2), upsInfo(:,4) - upsInfo(:,3) , '*',...
	upwInfo(:,3) - upwInfo(:,2), upwInfo(:,4) - upwInfo(:,3) , '*',...
	linx, polyval( psFitMean,  linx ), ...
	linx, polyval( pwFitMean,  linx )
	)


%Determining actual sample times.
psSampleMean = mean(psS);
pwSampleMean = mean(pwS);
psSampleErr  = std (psS);
pwSampleErr  = std (pwS);

printSIErr( psSampleMean, psSampleErr, 1, 0, 's', [ HOMEDIR 'extracted/actualPSSampleTime.tex'] );
printSIErr( pwSampleMean, pwSampleErr, 1, 0, 's', [ HOMEDIR 'extracted/actualPWSampleTime.tex'] );

save( 'results/psSampleTimeWRTWindows.dat', 'psSampleMean');
save( 'results/pwSampleTimeWRTWindows.dat', 'pwSampleMean');


%%% Histogramming samples wrt windows clock. 
dps = load('results/psTimeDiffMerge.dat');
dpw = load('results/pwTimeDiffMerge.dat');

%shouldn't be needed.
dps = dps(dps > 0 );
dpw = dpw(dpw > 0 );
dpw = dpw(dpw < 1000);

[hpw bpw] = hist(dpw, sqrt(rows(dpw)));
[hps bps] = hist(dps, sqrt(rows(dps)));

semilogy(bpw, hpw, '*', bps, hps,'*')
