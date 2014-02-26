function X2 = chiSquareWithSystematics( pM , alphas, lambdas, slope)
	run3147FixedParameters;

	x1Vec = pM(:,aCol);
	x2Vec = pM(:,bCol);
	sx1Vec = pM(:,aErrCol);
	sx2Vec = pM(:,bErrCol);

	BMat = 1;
	sBMat = 0.1

	[GBV varG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope);

	X2 = sum( (pM(:,torCol) - GBV ).^2  %lqr
		./(pM(:,torerrCol).^2 + varG )
			) %division
		); %sum

end
