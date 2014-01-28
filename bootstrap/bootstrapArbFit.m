%This function fits an arbitrary linear piecewise function the data defined in preFit.
pause = 0; 

arbFitx1Spacing = 15e-6;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx1Spacing.tex', 2);
arbFitx2Spacing = 50e-6;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx2Spacing.tex', 2);
arbFitx1Start   = pfTouch*1e-6;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx1Start.tex'  , 2);
arbFitx1Stop    = 300e-6;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx1Stop.tex'   , 2);
arbFitx2Start	= arbFitx1Stop;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx2Start.tex'  , 2);
arbFitx2Stop    = 900e-6;	printSigNumber(arbFitx1Spacing, 'extracted/arbFitx2Stop.tex'   , 2);

xpos1 = (pfTouch*1e-6):15e-6:300e-6;
xpos2 = xpos1(end):50e-6:900e-6;

xpositions = [xpos1 xpos2(2:end)];


% 'SQP' <--- doesn't work.
% 'NMS'
% 'Levenberg'
fitAlgorithm = 'Levenberg';


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
	ranSeed = 0.5*(randn(size(xpositions))-0.5)*1e-13;
	try
		%When analyzing, make a cut on csMin
		switch fitAlgorithm
		 case {'NMS'}
			[x, csMax, nf] = nmsmax(cSFunc, ranSeed, [1e-15 inf inf 0 0 1]);
			bsO = [xpositions' (x'- mean(x(4:(end-3)))) ranSeed' ones(size(xpositions'))*csMax];
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
                        bsO = [xpositions' (x- mean(x(4:(end-3)))) ranSeed' ones(size(xpositions'))*csMin ones(size(xpositions'))*iter];
			if(cvg == 1)
	                        bootstrapOut = [bootstrapOut; bsO]; 
			end
		 otherwise
			errstr = ['Fit algorithm ' fitAlgorithm ' is an invalid choice'];
			error(errstr);
		end

		if ( 1 == testInjection)
			outfilename = ['output/bootstrapArbFit.a' num2str(alpha) 'l' num2str(lambda) 'slop' num2str(injSlope) fitAlgorithm '.dat'];
			save( outfilename, "bootstrapOut", "yo");
		else
			outfilename = ['output/bootstrapArbFit.' fitAlgorithm '.dat'];
			save( outfilename, "bootstrapOut");
		end
	catch
		'FIT ERROR!'
		errorMessage
	end

end %bsCnt
