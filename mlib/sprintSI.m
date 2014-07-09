function s = sprintSI(num, sigFigs, siNum, baseUnit)

	if( mod(siNum,3) ~= 0 )
		error('SI exponent not divisible by three');
	end
	
	num = keepSigFigs(num,sigFigs);

	%Determine proper prefix
	siPrefixes
	%9 gets the correct offset.
	siDex = siNum / 3 + 9;
	pf = siPrefixes{siDex,2};

	%determine divisor
	lp = 10^siNum;
	
	%scale values to match units
	num = num / lp;


	%determine number of decimals to print
	sn = floor(log10(num)) - (sigFigs-1);
	decimals = max([0 -sn]);
	
	s = sprintf('$%.*f$~%s%s', decimals, num, pf, baseUnit);
end

%!test assert(sprintSI( 350, 2, 3, 'm') == '$0.35$~km');
%!test assert(sprintSI( 351, 2, -3, 'm') == '$350000$~mm');
%!test assert(sprintSI( 350, 1,  3, 'T') == '$0.4$~kT');
%!test assert(sprintSI( 350, 1,  -6, 'T') == '$400000000$~$\mu$T');
%!test assert(sprintSI(6.674215e-11, 2, -12, 
%!		'N m$^2$ kg$^{-2}$') == 
%!		'$67$~pN m$^2$ kg$^{-2}$')
