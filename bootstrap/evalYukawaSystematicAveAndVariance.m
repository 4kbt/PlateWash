function [GBV fvG] = evalYukawaSystematicAveAndVariance(x1Vec, x2Vec, sx1Vec, sx2Vec, BMat, sBMat, alphas, lambdas, slope)

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

	for ctr = 1:r

		GBV(ctr) = GBar(x1Vec(ctr) , x2Vec(ctr), sx1Vec(ctr), sx2Vec(ctr),
                                BMat(ctr,:), sBMat(ctr,:), alphas, lambdas, slope);
		
		fvG(ctr) = fittingvarG(x1Vec(ctr) , x2Vec(ctr), sx1Vec(ctr), sx2Vec(ctr),
				BMat(ctr,:), sBMat(ctr,:), alphas, lambdas, slope);

	end

	GBV = GBV'; fvG = fvG';

end
