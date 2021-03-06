function [GBV fvG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope, enableSystematics, SysNoX, Pstruct, Astruct)

	r = rows(x1Vec);
	b = columns(BMat);

	if( sum( lambdas < 0 ) > 0 )
		lambdas
		error("cannot evaluate negative lambdas!");
	end

	if( ~(  (rows(x2Vec)  == r ) & ...
		(rows(sx1Vec) == r ) & ...
		(rows(sx2Vec) == r ) & ...
		(rows(BMat)   == r ) & ...
		(rows(sBMat)  == r ) & ...
		(columns(sBMat) == b)& ...
		(rows(alphas) == b ) & ...
		(rows(lambdas) == b) & ...
		(size( slope ) == [1 1]) ) )

		rows(x2Vec)  
                rows(sx1Vec)
                rows(sx2Vec)
                rows(BMat) 
                rows(sBMat) 
                columns(sBMat)
                rows(alphas)
                rows(lambdas)
		size( slope )

		error('malformed argument!');
	end

	if(SysNoX ~= 1)
		GBV =   FBar(x1Vec,sx1Vec,BMat,alphas,lambdas,slope) ...
		      - FBar(x2Vec,sx2Vec,BMat,alphas,lambdas,slope);

		fvG =   varF(x1Vec,sx1Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics) ...
		      + varF(x2Vec,sx2Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics);
	else
		GBV =   FBarNoX(x1Vec,sx1Vec,BMat,alphas,lambdas,slope, Pstruct, Astruct) ...
		      - FBarNoX(x2Vec,sx2Vec,BMat,alphas,lambdas,slope, Pstruct, Astruct);

		fvG =   varFNoX(x1Vec,sx1Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics, Pstruct, Astruct) ...
		      + varFNoX(x2Vec,sx2Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics, Pstruct, Astruct);
	end
	
%	[v1 fvG fvG/v1]

end
