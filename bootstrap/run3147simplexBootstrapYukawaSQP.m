more off

run3147FixedParameters
%Calibrate duty/microe.
if( ~exist('pressEncP'))
        %run2937pressEnc
	pressEncP = load([HOMEDIR 'calibration/pressure/run2937pressEncOutput.dat']);
end

%Need to put these somewhere.
bootstrapOut = [];
slopeOut = [];

%Load analyzed torque data
pM = load([HOMEDIR 'runAnalysis/results/run3147pM3FilterMerge.dat']);

%Inject random data to preserve the blind. 
if( max(abs(pM(:,torqueCol)) == 0) )
	if( exist('unBlind') & unBlind == 0)
		pM(:,torqueCol) = randn(rows(pM),1).*pM(:,torerrCol);
	else
		error('blind persists, but blind should not persist');
	end
else
%Interlock to prevent unblinding
	if( exist('unBlind') & unBlind == 0)
		if(fakeTheData == 0)
			error('Blind VIOLATED! WTF, MATE? This error should never happen');
		end
	else
		'Torque column is unblinded. Are you ready for this?'
			pause 
	end
end


%These are the data which will be fit.
dBSArchive = [pM(:,aCol) pM(:,bCol) pM(:,torCol) pM(:,torerrCol)];

%Calibrate distance
dBSArchive(:,1) = (touch2937 - polyval(pressEncP, dBSArchive(:,1)) ) * 1e-6;
dBSArchive(:,2) = (touch2937 - polyval(pressEncP, dBSArchive(:,2)) ) * 1e-6;
%dBSArchive(:,1:2) = (touch2937 - polyval(pressEncP, dBSArchive(:,1:2)) ) * 1e-6;

%Torque threshold cut
dBSArchive = dBSArchive(dBSArchive(:,4)      < torErrThresh,:);
dBSArchive = dBSArchive(abs(dBSArchive(:,3)) < torErrThresh,:);


%Distance cut
shortCut = (pfTouch+10)*1e-6
dBSArchive = dBSArchive(dBSArchive(:,1) >= shortCut,:);
dBSArchive = dBSArchive(dBSArchive(:,2) >= shortCut,:);
%dSci = dSci(dSci(:,1) < 500,:);
%dSci = dSci(dSci(:,2) < 500,:);

%Post-analysis signal injection.
if( testInjection == 1)
	alpha    = 100
	lambda 	 = 100e-6
	injSlope = 2e-12 
	yo = yukawaForceLaw(alpha, lambda, 1e-6, 3e-3, 1e-6);

	injPos = dBSArchive(:,1:2)

	dBSArchive(:,3) = interp1(yo(:,1), yo(:,2), injPos(:,1)) - interp1(yo(:,1), yo(:,2), injPos(:,2)) + randn(rows(dBSArchive), 1).*dBSArchive(:,4) + injSlope*(injPos(:,1) - injPos(:,2)),;

end

clear pause
 
plot(dBSArchive(:,1), dBSArchive(:,2),'+');
pause
plot(pM(:,aCol), pM(:,bCol),'+');
pause

plot3(dBSArchive(:,1), dBSArchive(:,2), dBSArchive(:,3),'+');
pause

%Sanity check
if rows(dBSArchive) < 2
	error('Insufficient data. Wrong channel? Cut too hard?');
end

pause = 0; 
nmsFit = 1

%Bootstrap loop
for bootStrapCounter = 1:30000

	bootStrapCounter

	d = bootstrapData(dBSArchive);

	'bootstrapping complete'

	%Save the real data

	%lambdas, alphas
	if (nmsFit == 1)
		cSFunc = @(x) -chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	else
		cSFunc = @(x) chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	end

	%Fit begins
	ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5), (rand-0.5)*10^-11]
	try
		%When analyzing, make a cut on csMin
		if(nmsFit == 1)
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [ x(1) x(2) csMax nf ranSeed x(3)];
		else
			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax,-realmax], [.01, realmax, realmax],2000,1e-22)
			bsO = [ x(1) x(2) csMin nf iter fitInfo ranSeed x(3)];
		end


		%if fit converged, save it.
		if(exist('fitInfo') && fitInfo == 101) 
			bootstrapOut(bootStrapCounter,:) = bsO; 
		end

		if(nmsFit == 1 )
			bootstrapOut(bootStrapCounter,:) = bsO; 
		end

		al   = num2str(alpha);
		lam  = num2str(lambda);
		injS = num2str(injSlope);
		
		if(nmsFit == 1 )
			fitType = 'NMS'
		else
			fitType = 'SQP'
		end
		outfilename = ['run3147simplexBootstrapYukawa.SimulFloata' al 'l' lam 'slop' injS fitType '.dat'];
		save( outfilename, "bootstrapOut");
	catch
		'FIT ERROR! BED HAS BEEN POOPED!'
		errorMessage
	end

end %bsCnt
