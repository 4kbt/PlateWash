%This function fits an arbitrary linear piecewise function the data defined in preFit.
pause = 0; 

%Ugly hack to reenable print functions
clear -f

%Void script to DRY out arbFits.
arbFitPositions

% 'SQP' <--- doesn't work.
% 'NMS'
% 'Levenberg'
fitAlgorithm = 'Levenberg';

xsO = [];

%Bootstrap loop
for bootStrapCounter = 1:NumberOfArbFitBootstraps

	['arbFit bootstrap counter ' num2str(bootStrapCounter)]

	d = bootstrapData(dBSArchive);

%	'bootstrapping complete'

	%Save the real data

	%lambdas, alphas
	switch fitAlgorithm
	 case {'NMS'} 
		cSFunc = @(fitp)  -chiSquareVectorPolyLinearSpline(d,xpositions, fitp);
	 case {'SQP'}
		cSFunc = @(fitp)  chiSquareVectorPolyLinearSpline(d,xpositions, fitp);
	 case {'Levenberg'}
		%uses yukfit.m
		fitFunc = @(x,p) fitVectorPolyLinearSpline(x, xpositions, p);
	 otherwise
		errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
		error(errstr);
	endswitch

	%Fit begins
	ranSeed = 0.5*(randn(size(xpositions))-0.5)*1e-12;
	try
		%When analyzing, make a cut on csMin
		switch fitAlgorithm
		 case {'NMS'}
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [xpositions' (x'- mean(x(2:(end-3)))) ranSeed' ones(size(xpositions'))*csMax];
			bootstrapOut = [bootstrapOut; bsO]; 
		 case {'SQP'}
			[x, csMin, fitInfo, iter, nf]   = sqp(ranSeed, cSFunc, [], [], [0, -realmax,-realmax], [.01, realmax, realmax],100,1e-22)
			bsO = [ x(1) x(2) csMin nf iter fitInfo ranSeed x(3)];
			%if fit converged, save it.
			if(fitInfo == 101) 
				bootstrapOut(bootStrapCounter,:) = bsO; 
			end
		 case {'Levenberg'}
			%Define Bounds
			%options = struct("bounds", [ 0 0.1; -Inf, Inf; -Inf Inf] );
			%Do the fit
			[f, x, cvg, iter, corp, covp, covr, stdresid, Z, r2] = leasqr(d(:,1:2), d(:,3), ranSeed, fitFunc, 1e-10, 200, 1./d(:,4), .001*ones(size(ranSeed)), 'dfdp');
			%Reduced Chi-squared computation
			csMin = sum( ( (f-d(:,3))./d(:,4) ).^2 )/rows(d) ;
			%Note lack of transpose on x as compared to NMS
			xm = transpose(x- mean(x(4:(end-3))));
                        bsO = [xpositions' (x- mean(x(4:(end-3)))) ranSeed' ones(size(xpositions'))*csMin ones(size(xpositions'))*iter];
			if(cvg == 1)
	                        bootstrapOut = [bootstrapOut; bsO]; 
				xsO = [xsO; [xpositions xm] ];
			end
		 otherwise
			errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
			error(errstr);
		end

			save( "-ascii", outfilename, "xsO");
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
