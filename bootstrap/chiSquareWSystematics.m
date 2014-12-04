function X2 = chiSquareWSystematics( pMT , x, PendStruct, AttrStruct, CNStruct)

	%Silliness for samin
	x = x';

	chiSquaredSanitizeInputs(x);	

	[alphas lambdas] = constructALFromX( x );

	%Return to SI units
	lambdas = 10.^lambdas; 
	lambdas = lambdas * CNStruct.XLUnits;
	slope = logAlphasToAlphas(x(1), CNStruct.logCrossover) * CNStruct.XSUnits;
	alphas = logAlphasToAlphas(alphas, CNStruct.logCrossover);
	
	%evaluate it!
	[GBV varG] = evalYukawaSystematicAveAndVariance(pMT.x1Vec, pMT.x2Vec,
			 	pMT.sx1Vec, pMT.sx2Vec, pMT.BMat, pMT.sBMat,
				alphas, lambdas, slope, CNStruct.enableSystematics, 
				CNStruct.SysNoX, PendStruct, AttrStruct);

	%Uncomment for diagnostic information
%	chiSquareWSystematicsDiagnostics

	X2 = sum( (pMT.fitCol - GBV ).^2  %lqr
		./( (pMT.fitErrCol).^2 ) %+varG )
		); %sum


	%Script checks for X2=NaN and X2<0 and handles accordingly
	chiSquaredErrorCheckHandle

end
