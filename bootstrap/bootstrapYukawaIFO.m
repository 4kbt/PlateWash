pause = 0;
more off 

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

	%bounds defined in FixedParameters
	LowerBounds = [-SloUB, repmat([LamLB, -SysUB], 1, rows(signalColumns))];
	UpperBounds = [ SloUB, repmat([LamUB,  SysUB], 1, rows(signalColumns))];
	NumIterations = 400; %default 100, but good fits are getting truncated at 200

	%Define fit function
	cSFunc = @(x) chiSquareWSystematics(pMd, x, signalColumns, ifopMCol);

	%Fit begins
	ranLam = 					       10.^( rand(rows(signalColumns),1) *3.0-6)/XLUnits;
	ranAlp = (-1).^(round(rand(rows(signalColumns),1))+1).*10.^( rand(rows(signalColumns),1)*11-5);
	ranSlo = (rand-0.5)*10e-12/XSUnits;
	fitUnitConversion = [XSUnits XLUnits 1];

	ranSeed = [ranSlo];
	for ranCtr = 1:rows(signalColumns)
		ranSeed = [ ranSeed, ranLam(ranCtr), ranAlp(ranCtr)];
	end
	try
		%When analyzing, make a cut on csMin
		tic
		[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], LowerBounds, UpperBounds,NumIterations);
		[csMin fitInfo iter nf]
		bsO = [ transpose(x).*fitUnitConversion csMin nf iter fitInfo ranSeed.*fitUnitConversion bootStrapCounter toc rows(pM)];
		%if fit converged, save it.
		if(fitInfo == 101) 
	       		bootstrapOut = [bootstrapOut; bsO];
		end

		if( exist('ifoYukawaFitFlag'))
			outfilename = ['output/bootstrapYukawa.IFO.dat']
		elseif(1 == testInjection & ~exist("fileInjection"))
			injParameters = [lambdasInjected/XLUnits alphasInjected injSlope/XSUnits];
			outfilename = ['output/bootstrapYukawa.Sysa' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) '.dat'];
		elseif(exist("fileInjection"))
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SysaInjected' '.dat']; 
		else
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.Sys' '.dat'];
		end
		save( outfilename, "bootstrapOut", "injParameters");
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
