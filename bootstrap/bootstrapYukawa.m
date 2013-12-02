pause = 0; 

% 'SQP'
% 'NMS'
% 'Levenburg'
fitAlgorithm = 'Levenburg';

%Bootstrap loop
for bootStrapCounter = 1:NumberOfYukawaBootstraps

	['yukawa bootstrap counter ' num2str(bootStrapCounter)]

	d = bootstrapData(dBSArchive);

	%'bootstrapping complete'

	%Save the real data

	%lambdas, alphas
	switch fitAlgorithm
	 case {'NMS'} 
		cSFunc = @(x) -chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'SQP'}
		cSFunc = @(x) chiSquareVectorYukawaWSlope(d, x(1), x(2), x(3));
	 case {'Levenburg'}
		%uses yukfit.m
	 otherwise
		errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
		error(errstr);
	endswitch

	%Fit begins
	ranSeed = [ 10^( rand*3.0-6) , (-1).^(round(rand)+1)*10^(rand*11-5), (rand-0.5)*10^-11];
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

		if(1 == testInjection)
			injParameters = [lambda alpha injSlope];
			outfilename = ['output/bootstrapYukawa.SimulFloata' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) fitAlgorithm '.dat'];
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
