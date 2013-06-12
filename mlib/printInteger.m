## usage: printFile(data, filename)
## prints data using save --ascii into the specified file. Filename is a string.

function printInteger(data, filename)
%	filename

	formatString = '%';

	formatString = [formatString 'd'];
	
	fid  = fopen( filename, "w", "native");
	fprintf( fid, formatString, data);
	fclose(fid);
end
