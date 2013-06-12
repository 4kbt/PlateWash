## usage: printDecimal(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of places after the decimal point

function printDecimal(data, filename, precision)
%	filename

	precision = precision - 1;

	formatString = '%.';

	formatString = [formatString num2str(precision) 'f'];
	
	fid  = fopen( filename, "w", "native");
	fprintf( fid, formatString, data);
	fclose(fid);
end
