## usage: printSigError(central, err,  filename)
## prints data using fprintf into the specified file. Filename is a string.
## 

function printSigError(central, err, filename)
%	filename

	prec = ceil(  log10( abs(central/err) ) )

	if(prec >= 0)
		cl   = floor( log10( abs(central ) ) );
	else
		cl   = floor( log10( abs(err) ) );
		prec = 1;
	end
	cnum = central/(10^cl);
	snum = err    /(10^cl);

	formatString = '%.*f %s %.*f %s %d %s';

	fid  = fopen( filename, "w", "native");
	fprintf( fid, formatString, prec, cnum, "\\pm", prec, snum, "\\times 10^{",  cl, "}");
	fclose(fid);
end
