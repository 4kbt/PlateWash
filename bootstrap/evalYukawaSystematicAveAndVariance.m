function [GBV fvG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope, enableSystematics)

	r = rows(x1Vec);
	b = columns(BMat);

%{		rows(x2Vec)  
%                rows(sx1Vec)
%                rows(sx2Vec)
%                rows(BMat) 
%                rows(sBMat) 
%                columns(sBMat)
%                rows(alphas)
%                rows(lambdas)
%                size( slope )
%}

	if( ~(  (rows(x2Vec)  == r ) & ...
		(rows(sx1Vec) == r ) & ...
		(rows(sx2Vec) == r ) & ...
		(rows(BMat)   == r ) & ...
		(rows(sBMat)  == r ) & ...
		(columns(sBMat) == b)& ...
		(rows(alphas) == b ) & ...
		(rows(lambdas) == b) & ...
		(size( slope ) == [1 1]) ) )

		error('malformed argument!');
	end

	GBV =   FBar(x1Vec,sx1Vec,BMat,alphas,lambdas,slope) ...
	      - FBar(x2Vec,sx2Vec,BMat,alphas,lambdas,slope);

%	fvG =   varF(x1Vec,sx1Vec,BMat,sBMat,alphas,lambdas,slope) ...
%	      + varF(x2Vec,sx2Vec,BMat,sBMat,alphas,lambdas,slope);

%	v1 = fvG;
	
	fvG =   varFv2(x1Vec,sx1Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics) ...
	      + varFv2(x2Vec,sx2Vec,BMat,sBMat,alphas,lambdas,slope, enableSystematics);
	
%	[v1 fvG fvG/v1]

end
