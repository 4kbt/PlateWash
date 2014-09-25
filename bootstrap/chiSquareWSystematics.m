function X2 = chiSquareWSystematics( pM , x, signalColumns, fitColumn)

	%Silliness for samin
	x = x';

	global HOMEDIR
	columnNames;
	fitErrColumn = diffErrOffset + fitColumn;

	chiSquaredSanitizeInputs(x);	

	[alphas lambdas] = constructALFromX( x );

	%Return to SI units
	lambdas = 10.^lambdas; 
	lambdas = lambdas * XLUnits;
	slope = logAlphasToAlphas(x(1), logCrossover) * XSUnits;
	alphas = logAlphasToAlphas(alphas, logCrossover);
	
	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	%Dynamic allocation of signal and error columns.
	[BMat sBMat] = allocateSignalColumns(signalColumns, ABErrOffset, x1Vec, pM);

	%evaluate it!
	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope, enableSystematics, SysNoX);

	%Uncomment for diagnostic information
%	chiSquareWSystematicsDiagnostics

	X2 = sum( (pM(:,fitColumn) - GBV ).^2  %lqr
		./(pM(:,fitErrColumn).^2 +varG )
		); %sum


	%Script checks for X2=NaN and X2<0 and handles accordingly
	chiSquaredErrorCheckHandle

end
