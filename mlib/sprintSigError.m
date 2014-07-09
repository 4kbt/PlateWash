## usage: sprintSigError(central, err)
## prints data with errorbars to a string.
## 

function s = sprintSigError(central, err)

	prec = ceil(  log10( abs(central/err) ) );
	
	if(prec >= 0)
		cl   = floor( log10( abs(central ) ) );
	else
		cl   = floor( log10( abs(err) ) );
		prec = 1;
	end
	cnum = central/(10^cl);
	snum = err    /(10^cl);

	formatString = '%.*f %s %.*f %s %d %s';

	s = sprintf( formatString, prec, cnum, "\\pm", prec, snum, "\\times 10^{",  cl, "}");

end

%!test assert(sprintSigError(1,1) == '1 \pm 1 \times 10^{ 0 }')
