pause = 0;
more off 

% 'SQP'
% 'NMS'
% 'Levenburg'
fitAlgorithm = 'SQP';

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

	LowerBounds = [-1000, 1e-2, -1e8, 1e-2, -1e8, 1e-2, -1e8];
	UpperBounds = [ 1000, 100 ,  1e8,  100,  1e8,  100,  1e8];
	NumIterations = 100;

	%lambdas, alphas
	switch fitAlgorithm
	 case {'NMS'} 
		cSFunc = @(x) -chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'SQP'}
		cSFunc = @(x) chiSquareWSystematics(pMd, x);
	%	cSFunc = @(x) chiSquareWSystematics(pMd, x(1), x(2), x(3));
	 case {'Levenburg'}
		%uses yukfit.m
	 otherwise
		errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
		error(errstr);
	endswitch

	%Fit begins
	ranLam = 10.^( rand(5,1) *3.0-6)/1e-4
	ranAlp = (-1).^(round(rand(5,1))+1).*10.^(rand(5,1)*11-5)
	ranSlo = (rand-0.5)*10;
	ranSeed = [ ranSlo ranLam(1), ranAlp(1), ranLam(2), ranAlp(2), ranLam(3), ranAlp(3) ];
%	ranSeed = [randn * 1e-4, randn, randn * 1e-12 ]
%	ranSeed = [1.0001, 1, 2]; 
%	ranSeed = [1.0001, 1]; 
%	ranSeed = rand(1,2);
	try
		%When analyzing, make a cut on csMin
		switch fitAlgorithm
		 case {'NMS'}
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [ x(1) x(2) csMax nf ranSeed x(3)];
			bootstrapOut(bootStrapCounter,:) = bsO; 
		 case {'SQP'}
%			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [1e-2, -realmax], [100, realmax],100)
			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], LowerBounds, UpperBounds,NumIterations)
%			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [], [], 500, 1e-22);
			bsO = [ transpose(x) csMin nf iter fitInfo ranSeed];
			%if fit converged, save it.
			if(fitInfo == 101) 
	                        bootstrapOut = [bootstrapOut; bsO];
			end
		 case {'Levenburg'}
			%Define Bounds
			options = struct("bounds", [ 0 0.1; -Inf, Inf; -Inf Inf] );
			%Do the fit
			[f, x, cvg, iter, corp, covp, covr, stdresid, Z, r2] = leasqr(d(:,1:2), d(:,3), ranSeed, "yukFit", 1e-10, 200, 1./d(:,4), .001*ones(size(ranSeed)), 'dfdp', options);
			%Reduced Chi-squared computation
			csMin = sum( ( (f-d(:,3))./d(:,4) ).^2 )/rows(d) ;
			bsO =  [ x(1) x(2) csMin r2 iter ranSeed x(3)];
			if(cvg == 1)
	                        bootstrapOut = [bootstrapOut; bsO];
			end
		 otherwise
			errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
			error(errstr);
		end

		if(1 == testInjection & ~exist("fileInjection"))
			injParameters = [lambda alpha injSlope];
			outfilename = ['output/bootstrapYukawa.SimulFloata' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) fitAlgorithm '.dat'];
		elseif(exist("fileInjection"))
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SimulFloataInjected' fitAlgorithm '.dat']; 
		else
			injParameters = [0 0 0];
			outfilename = ['output/bootstrapYukawa.SimulFloat' fitAlgorithm '.dat'];
		end
		save( outfilename, "bootstrapOut", "injParameters");
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
