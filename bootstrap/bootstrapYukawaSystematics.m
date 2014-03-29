pause = 0;
more off 

%Bootstrap loop
for bootStrapCounter = 1:NumberOfYukawaBootstraps

	['yukawa bootstrap counter ' num2str(bootStrapCounter)]

	pMd = bootstrapData(pM);

	%'bootstrapping complete'

	%Save the real data

	SlopeFit  = [ 1 0 0 0 0 0 0];
	YukawaFit = [ 0 1 1 0 0 0 0];
	MagFit    = [ 0 0 0 1 1 0 0];
	Mag2Fit   = [ 0 0 0 0 0 1 1];
	FitOnlyThese = SlopeFit + YukawaFit + MagFit + Mag2Fit;

	%bounds defined in FixedParameters
	LowerBounds = [-SloUB, repmat([LamLB, -SysUB], 1, NumSystematics)];
	UpperBounds = [ SloUB, repmat([LamUB,  SysUB], 1, NumSystematics)];
	NumIterations = 400; %default 100, but good fits are getting truncated at 200

	%Define fit function
	cSFunc = @(x) chiSquareWSystematics(pMd, x);

	%Fit begins
	ranLam = 10.^( rand(NumSystematics,1) *3.0-6)/XLUnits;
	ranAlp = (-1).^(round(rand(NumSystematics,1))+1).*10.^(rand(NumSystematics,1)*11-5);
	ranSlo = (rand-0.5)*10e-12/XSUnits;
	ranSeed = [ ranSlo ranLam(1), ranAlp(1), ranLam(2), ranAlp(2), ranLam(3), ranAlp(3) ];
	try
		%When analyzing, make a cut on csMin
		tic
		[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], LowerBounds, UpperBounds,NumIterations)
		bsO = [ transpose(x) csMin nf iter fitInfo ranSeed bootStrapCounter toc];
		%if fit converged, save it.
		if(fitInfo == 101) 
	       		bootstrapOut = [bootstrapOut; bsO];
		end

		if(1 == testInjection & ~exist("fileInjection"))
			injParameters = [lambdasInjected/XLUnits alphasInjected injSlope/XSUnits];
			outfilename = ['output/bootstrapYukawa.SimulFloata' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) '.dat'];
		elseif(exist("fileInjection"))
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SimulFloataInjected' '.dat']; 
		else
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SimulFloat' '.dat'];
		end
		save( outfilename, "bootstrapOut", "injParameters");
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
