function n = keepSigFigs( num, sigFigs)

	%sanity
	assert( abs(mod(sigFigs,1)) < 100*eps);
	assert(sigFigs > 0);

	exponent = floor(log10(num));
	significand = num/10^exponent;
	
	%Off-by one goodness, because log10(1) = 0;
	sigFigs = sigFigs - 1;

	%Drop insignificant digits
	significand = round( significand*10^sigFigs )/10^sigFigs;

	%Significant-num.
	n = significand*10^exponent;

end

%!test assert(keepSigFigs(1234   , 2) == 1200)
%!test assert(abs(keepSigFigs(0.99934, 3) - 0.999 ) < eps)
%!test assert(abs(keepSigFigs(0.99934, 1) - 1 ) < eps)
%!test assert(keepSigFigs(pi, 5) == 3.1416)
