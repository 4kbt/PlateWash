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
	alpha    = 0 
	lambda 	 = 50e-6
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



% 'SQP'
% 'NMS'
% 'SimulatedAnnealing'
% 'Levenburg'
%fitAlgorithm = 'SimulatedAnnealing';
fitAlgorithm = 'Levenburg';

%Bootstrap loop
for bootStrapCounter = 1:30000

	bootStrapCounter

	d = bootstrapData(dBSArchive);

	'bootstrapping complete'

	%Save the real data

	%lambdas, alphas
	switch fitAlgorithm
	 case {'NMS'} 
		cSFunc = @(x) -chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'SQP', 'SimulatedAnnealing'}
		cSFunc = @(x) chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'Levenburg'}
		%uses yukfit.m
	 otherwise
		errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
		error(errstr);
	endswitch

	%Fit begins
	ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5), (rand-0.5)*10^-11]
	try
		%When analyzing, make a cut on csMin
		switch fitAlgorithm
		 case {'NMS'}
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [ x(1) x(2) csMax nf ranSeed x(3)];
			bootstrapOut(bootStrapCounter,:) = bsO; 
		 case {'SQP'}
			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax,-realmax], [.01, realmax, realmax],100,1e-22)
			bsO = [ x(1) x(2) csMin nf iter fitInfo ranSeed x(3)];
			%if fit converged, save it.
			if(fitInfo == 101) 
				bootstrapOut(bootStrapCounter,:) = bsO; 
			end
		 case {'SimulatedAnnealing'}
			lb = [0, -realmax,-realmax];
			ub = [.01, realmax, realmax];

			nt = 100;
			ns = 5;
			rt = 0.8;
			maxevals = 1e10;
			pramtol = 1e-3;
			verbosity = 2;
			minarg = 1;
			
			[x, obj, convergence, details] = samin(cSFunc, args, control) 
		 case {'Levenburg'}
			options = struct("bounds", [ 0 0.1; -Inf, Inf; -Inf Inf] );
			[f, x, cvg, iter, corp, covp, covr, stdresid, Z, r2] = leasqr(d(:,1:2), d(:,3), ranSeed, "yukFit", 1e-10, 200, 1./d(:,4), .001*ones(size(ranSeed)), 'dfdp', options);
			csMin = sum( ( (f-d(:,3))./d(:,4) ).^2 )/rows(d) ;
			bsO =  [ x(1) x(2) csMin r2 iter ranSeed x(3)];
			if(cvg == 1)
	                        bootstrapOut(bootStrapCounter,:) = bsO;
			end
		 otherwise
			errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
			error(errstr);
		end

		outfilename = ['run3147simplexBootstrapYukawa.SimulFloata' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) fitAlgorithm '.dat'];
		save( outfilename, "bootstrapOut");
	catch
		'FIT ERROR! BED HAS BEEN POOPED!'
		errorMessage
	end

end %bsCnt
