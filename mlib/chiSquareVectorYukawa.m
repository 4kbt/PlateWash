function [cS yTD] = chiSquareVectorYukawa(inOutTorqueTorqueErr, lambdas, alphas)

	d=inOutTorqueTorqueErr;

	%Note that not transposing d is important
	measTorques = repmat(d(:,3), [1 length(lambdas) length(alphas)]);
	torqueErr   = repmat(d(:,4), [1 length(lambdas) length(alphas)]);
	

	yTD =  (yukawaVectorizedTorque(d(:,1)', lambdas , alphas) - yukawaVectorizedTorque(d(:,2)', lambdas, alphas) - ...
		measTorques).^2 .* (1./torqueErr).^2;

	cS=squeeze(sum(yTD,1));

end
