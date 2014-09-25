%The format of the fit input/output is slope, lambda, alpha, lambda, .... 
%This function converts log10-ed lambdas back to normal space
function o = unLogLA(x, crossover)

	if(columns(x) ~= 1)
		error("malformed argument: unLogifyLambdas (transpose?)");
	end
	if(rows(x) < 2) 
		error("argument too short: unLogifyLambdas");
	end
	if(mod( rows(x) , 2) ~= 1) 
		error("argument incorrect: unLogifyLambdas");
	end

	for ctr = 2:2:rows(x)
		x(ctr) = 10.^(x(ctr));
		x(ctr+1) = logAlphasToAlphas(x(ctr+1) , crossover); 
	end

	o = x; 

end
