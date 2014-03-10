function X2 = chiSquareWSystematics( pM , A, L, C)
	global HOMEDIR

	[A L C ]

%	Nsyst = 3;
%	prototype = ones (Nsyst,1);
%	alphas = alphas*prototype;
%	lambdas = L*prototype;

%	alphas = [A; 0 ; 0];

	alphas = A;
	lambdas = L * 1e-4;
	slope = C * 1e-12;
	
	DoNotExtractFixedParameters = 1;
	run3147FixedParameters;

	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	BMat = 1*ones(rows(x1Vec),rows(alphas));
%	BMat = repmat([1 0 0], rows(x1Vec), 1) ; 
	sBMat = 0*BMat;

	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope);

	X2 = sum( (pM(:,torCol) - GBV ).^2  %lqr
		./(pM(:,torerrCol).^2 +varG )
		) %sum

	if(X2 < 0)
		error("Chi squared is less than zero. That is impossible! Go fix it!");
	end
end
