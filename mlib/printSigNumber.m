## usage: printSigNumber(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of significant digits.

function printSigNumber(data, filename, prec)
	filename;

	prec = prec - 1;

        cl   = floor( log10( abs(data ) ) );

	cnum = data/(10.^cl);

	formatString = '%.*f %s %d %s';

	fid  = fopen( filename, "w", "native");
	fprintf( fid, formatString, prec, cnum, "\\times 10^{", cl, "}");
	fclose(fid);
end
