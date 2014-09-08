more off 

if (1 == injectIFOSystematic)
	%Update me!
	load( [HOMEDIR '/ifo/foilTranslationToTorque.dat']);

        %Load bootstrapped IFO
	[ifoP ifoV] = loadBSFits( 'output/bootstrapArbFit.bootstrappedFits.dat');
end

%Define accumulators
fittedData =[];

%Bootstrap loop
for bootStrapCounter = 1:NumberOfYukawaBootstraps

	['yukawa bootstrap counter ' num2str(bootStrapCounter)]

	%Bootstrapping
	pMd = bootstrapData(pM);
	
	if(SysNoX == 1)
		%Fuzz x errorbars
		pMd(:,aCol) = pMd(:,aCol) + randn(rows(pMd),1) .* pMd(:,aErrCol);
		pMd(:,bCol) = pMd(:,bCol) + randn(rows(pMd),1) .* pMd(:,bErrCol);
	end

	if(1 == injectIFOSystematic)
		%Fake torque
		outTor = foilTranslationToTorque*fitVectorPolyLinearSpline( [pMd(:,aCol) pMd(:,bCol)], ifoP(bootStrapCounter,:), ifoV(bootStrapCounter, : ) );

		%Subtract the systematic
		ifoSubtract = mod(bootStrapCounter,3) - 1;
		pMd(:,torCol) = pMd(:,torCol) + ifoSubtract * outTor;
	end

	%Output fit information
	fittedData = [fittedData; pMd(:,aCol) pMd(:,bCol), pMd(:,torCol), ifoSubtract*ones(size(pM(:,aCol)))];

	%preFitPlotData is re-saved to preserve the function of preFitPlot.gpl
	save( preFitPlotFile, "preFitPlotData", "fittedData");

	%bounds defined in FixedParameters
	LowerBounds = [-SloUB, repmat([LamLB, -SysUB], 1, NumFitSystematics)];
	UpperBounds = [ SloUB, repmat([LamUB,  SysUB], 1, NumFitSystematics)];
	NumIterations = 400; %default 100, but good fits are getting truncated at 200

	%Define fit function
	cSFunc = @(x) chiSquareWSystematics(pMd, x, signalColumns, torCol);

	%Fit begins
	ranLam = log10(10.^( rand(NumFitSystematics,1) *3.0-6)/XLUnits);
	ranAlp = (-1).^(round(rand(NumFitSystematics,1))+1).*10.^(rand(NumFitSystematics,1)*11-5);
	ranAlp = alphasToLogAlphas(ranAlp, logCrossover);
	ranSlo = (rand-0.5)*10e-12/XSUnits;

	%Compose ranSeed
	ranSeed = [ ranSlo ]; 
	for ranCtr = 1:rows(ranLam)
		ranSeed = [ranSeed ranLam(ranCtr) ranAlp(ranCtr)];
	end

	try
		%When analyzing, make a cut on csMin
		tic

		%Do the fit.
		[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], LowerBounds, UpperBounds,NumIterations);

		%Display fit outcome
		[csMin fitInfo iter nf]

		%Output fit results
		x = unLogAL(x, logCrossover);
		bsO = [ transpose(x) csMin nf iter fitInfo ranSeed bootStrapCounter toc rows(pM) ifoSubtract];
		injSubCol = columns(bsO);

		%if fit converged, save it.
		if(fitInfo == 101) 
	       		bootstrapOut = [bootstrapOut; bsO];
		end

		if(1 == testInjection & ~exist("fileInjection"))
			injParameters = [lambdasInjected/XLUnits alphasInjected injSlope/XSUnits];
			outfilename = ['output/bootstrapYukawa.Sysa' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) ];
		elseif(exist("fileInjection"))
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SysaInjected' ]; 
		else
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.Sys' ];
		end
		
		%Outputs
		outputBSO( outfilename, bootstrapOut, injParameters, injSubCol, signalColString , fittedData );
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
