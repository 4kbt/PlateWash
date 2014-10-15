function val = kernelDensityOne( evalPt, fixedPts, weights)

	if(rows(evalPt) ~= 1)
		error('multiple points passed to kernelDensityOne');
	end

	evalPts = repmat(evalPt, rows(fixedPts), 1);

	%Presumes that probabilities are products of gaussians
	%with different weights (std dev) in each dimension

	sqrtTwoPi = sqrt(2*pi);

	vals = ones(rows(fixedPts),1);

	for d = 1:columns(fixedPts)
		
		vals = vals .* ...
			exp( 
				-(evalPts(:,d) - fixedPts(:,d)).^2 ./ 
					weights(:,d).^2 
			   ) ./ weights(:,d) / sqrtTwoPi; 
	end

	val = sum(vals);
end
