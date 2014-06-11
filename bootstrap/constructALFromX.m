function [alphas lambdas] = constructALFromX( x )
	alphas =[]; lambdas = [];
	for( rowctr = 2:2:length(x))
		lambdas = [lambdas; x(rowctr)  ];
		alphas  = [alphas ; x(rowctr+1)];
	end
end
