more off 

if (1 == injectIFOSystematic)
	%Update me!
	load( [HOMEDIR '/ifo/foilTranslationToTorque.dat']);

        %Load bootstrapped IFO
	[ifoP ifoV] = loadBSFits( 'output/bootstrapArbFit.bootstrappedFits.dat');
end

%Needed to ensure presence of PendStruct and AttrStruct
run3147PendulumParameters

%Define accumulators
fittedData =[];
detailAC = [];
iterAve = 1e7;

%Bootstrap loop
for bootStrapCounter = 1:(NumberOfYukawaBootstraps)  % three covers add, null, subtract case.

	['yukawa bootstrap counter ' num2str(bootStrapCounter)]

	%Bootstrapping
	pMd = bootstrapData(pM);
	
	if(SysNoX == 1)
		%Fuzz x errorbars
		pMd(:,aCol) = pMd(:,aCol) + randn(rows(pMd),1) .* pMd(:,aErrCol);
		pMd(:,bCol) = pMd(:,bCol) + randn(rows(pMd),1) .* pMd(:,bErrCol);
	end

	if(BootstrapSystematicPositionUncertainty == 1)
		bSPositionErr = randn * totalPAUncertainty;
		pMd( : , aCol ) = pMd( : , aCol ) + bSPositionErr;
		pMd( : , bCol ) = pMd( : , bCol ) + bSPositionErr;
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

	%Fit begins
	ranLam = log10(10.^( rand(NumFitSystematics,1) *3.0-6)/XLUnits);
	ranAlp = (-1).^(round(rand(NumFitSystematics,1))+1).*10.^(rand(NumFitSystematics,1)*11-5);
	ranAlp = alphasToLogAlphas(ranAlp, logCrossover);
	ranSlo = alphasToLogAlphas((rand-0.5)*10e-12/XSUnits, logCrossover);

	%Compose ranSeed
	ranSeed = [ ranSlo ]; 
	for ranCtr = 1:rows(ranLam)
		ranSeed = [ranSeed ranLam(ranCtr) ranAlp(ranCtr)];
	end


	%profile on

	%Reduces pMd to a struct containing only those columns needed for chiSquared.
	trimmedPM = trimPM(pMd, signalColumns, torCol);
	CNStruct = columnNamesStruct;

	try
		%When analyzing, make a cut on csMin
		tic

		%Do the fit.
		[x , csMin, convergence, details] = samin("chiSquareWSystematics", {trimmedPM, ranSeed', PendStruct, AttrStruct, CNStruct}, {LowerBounds', UpperBounds', 20, 5, 0.1, 10*iterAve, 5, 1e-1, 0.1, 1, 2});

		%0 = no convergence, 1 = good, 2 = near edge
		fitInfo = convergence; 
		%total number of function evaluations
		iter = details(end,1);
		%number of temperature reductions
		nf = rows(details);

		iterAve = (iterAve + iter)/2;

		%detailAC = [detailAC; details];	

		%[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], LowerBounds, UpperBounds,NumIterations);

		%Display fit outcome
		[csMin fitInfo iter nf]

		%Output fit results
		x = unLogLA(x, logCrossover);
		x(1) = logAlphasToAlphas(x(1), logCrossover);
		bsO = [ transpose(x) csMin nf iter fitInfo ranSeed bootStrapCounter toc rows(pM) ifoSubtract];
		%Dynamically locates subtraction column for variable number of parameters
		injSubCol = columns(bsO);

		%if fit converged, save it.
	%	if(fitInfo == 101) 
	       		bootstrapOut = [bootstrapOut; bsO];
	%	end

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
		%if(mod( bootStrapCounter, 30 ) == 0 ) 
			outputBSO( outfilename, bootstrapOut, injParameters, injSubCol, signalColString , fittedData );
		%	save 'details2.dat' detailAC
		%end
	catch
		'FIT ERROR!'
		errorMessage
	end
	%profile off
	%profOut = profile("info");
	%profshow(profOut)

end %bsCnt
