function vals = kernelDensity( evalPts, fixedPts, weights)

	vals = zeros(rows(evalPts),1);

	for ctr = 1:rows(evalPts)

		vals(ctr) = kernelDensityOne( evalPts(ctr,:), fixedPts, weights);
	
	end

end
