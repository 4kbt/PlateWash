pause = 0;
more off 

% 'SQP'
% 'NMS'
% 'Levenburg'
fitAlgorithm = 'SQP';

%Bootstrap loop
lambdaShort = -6;
lambdaLong = -3;
lambdaStep = 1;
alphaSmall = -3;
alphaLarge = 10;
alphaStep = 1;

lambdas = (10.^(lambdaShort:lambdaStep:lambdaLong))
alphas = (10.^(alphaSmall:alphaStep:alphaLarge))
alphas = [-fliplr(alphas) alphas];

ctr = 0;

%rescaling
lambdas = lambdas/1e-4;

for lam = lambdas
for alph = alphas
	
	['lambda ' num2str(lam) ' alpha ' num2str(alph)]

	%lambdas, alphas
	switch fitAlgorithm
	 case {'NMS'} 
		error('NMS not supported');
		cSFunc = @(x) -chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'SQP'}
		cSFunc = @(x) chiSquareWSystematics(pM, alph, lam, x(1));
	%	cSFunc = @(x) chiSquareWSystematics(pMd, x(1), x(2), x(3));
	 case {'Levenburg'}
		error('Levenburg not supported');
		%uses yukfit.m
	 otherwise
		errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
		error(errstr);
	endswitch

	%Fit begins
%	ranSeed = [ 10^( rand*3.0-6)/1e-4 , (-1).^(round(rand)+1)*10^(rand*11-5), (rand-0.5)*10];
	ranSeed = [ (rand-0.5)*10];
	try
		%When analyzing, make a cut on csMin
		switch fitAlgorithm
		 case {'NMS'}
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [ x(1) x(2) csMax nf ranSeed x(3)];
			bootstrapOut(bootStrapCounter,:) = bsO; 
		 case {'SQP'}
%			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [1e-2, -realmax], [100, realmax],100)
			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [-100], [100],100)
%			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [], [], 500, 1e-22);
			bsO = [ lam alph csMin nf iter fitInfo ranSeed x(1)];
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
			outfilename = ['output/chiSquareYukawa.SimulFloata' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) fitAlgorithm '.dat'];
		elseif(exist("fileInjection"))
			injParameters = [0 0 0];
			outfilename = ['output/chiSquareYukawa.SimulFloataInjected' fitAlgorithm '.dat']; 
		else
			injParameters = [0 0 0];
			outfilename = ['output/chiSquareYukawa.SimulFloat' fitAlgorithm '.dat'];
		end
		save( outfilename, "bootstrapOut", "injParameters");
	catch
		'FIT ERROR!'
		errorMessage
	end
%}

%}
end %alph loop
end %lam loop
