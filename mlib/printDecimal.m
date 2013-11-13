## usage: printDecimal(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of places after the decimal point

function printDecimal(data, filename, precision)
%	filename
	assert(precision > 0); 

	precision = precision - 1;

	formatString = '%.';

	formatString = [formatString num2str(precision) 'f'];
	
	fid  = fopen( filename, "w", "native");
	fprintf( fid, formatString, data);
	fclose(fid);
end

%!test
%! fn = "printDecimalTest1.txt"; testVal = 0.8
%! printDecimal(testVal,fn,1)
%! d = load(fn);
%! assert(testVal == d)


%!test
%! for roundCounter = 1:100
%! fn = "printDecimalTest2.txt"; testVal = randn*10
%! printDecimal(testVal,fn,1)
%! d = load(fn);
%! assert(round(10.0*testVal)/10) == d)
%! end

%!test
%! for roundCounter = 1:100
%! fn = "printDecimalTest3.txt"; testVal = randn*10
%! printDecimal(testVal,fn,3)
%! d = load(fn);
%! assert(round(1000.0*testVal)/1000.0) == d)
%! end

