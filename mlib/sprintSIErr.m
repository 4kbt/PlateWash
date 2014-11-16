function s = sprintSIErr(num, err, errSigFigs, siNum, baseUnit)

	pf = getSIPrefix(siNum);

	%If the unit is mass, compensate for humanity.
	if (isGrams(baseUnit))
		siNum = siNum - 3;
	end
	
	%determine divisor
	lp = 10^siNum;
	
	%scale values to match units
	num = num / lp;
	err = err / lp;

	%determine number of decimals to print
	en = floor(log10(err)) - (errSigFigs-1);
	decimals = max([0 -en]);
	
	%Double-percent is there to append a percent sign, working around a latex bug.
	s = sprintf('$(%.*f \\pm %.*f)$~%s%s%%', decimals, num, decimals, err,
			 pf, baseUnit);
end

%!test assert(sprintSIErr( 350, 10, 1,  3, 'm') == '$(0.35 \pm 0.01)$~km%');
%!test assert(sprintSIErr( 350, 10, 1, -3, 'm') == '$(350000 \pm 10000)$~mm%');
%!test assert(sprintSIErr( 350, 1e3,1,  3, 'T') == '$(0 \pm 1)$~kT%');
%!test assert(sprintSIErr( 350, 1e3,2,  3, 'T') == '$(0.3 \pm 1.0)$~kT%');
%!test assert(sprintSIErr(6.674215e-11, 0.000092e-11, 2, -12, 
%!		'N m$^2$ kg$^{-2}$') == 
%!		'$(66.74215 \pm 0.00092)$~pN m$^2$ kg$^{-2}$%')
%!test assert(sprintSIErr(4507, 10, 1, 3, 'g') == '$(4507 \pm 10)$~kg%');
%!test assert(sprintSIErr(0.015, 0.001, 1, 0, 'g') == '$(15 \pm 1)$~g%');
%!test assert(sprintSIErr(10e-9, 27e-9, 2, -6, 'g') == '$(10 \pm 27)$~$\mu$g%');
