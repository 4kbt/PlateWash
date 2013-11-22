## usage: printDecimal(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of places after the decimal point

function printDecimal(data, filename, precision)
%	filename
	assert(precision > 0); 
	assert(precision - floor(precision) == 0 );
        assert(size(data) == [1 1]);

	data = sigRound(data, precision);

	%useful transformation (magnitude counts from 0)
	precision = precision - 1;
	
	%Determine number of decimal places; abs necessary for complex/imaginary/negative problems
	mag = floor(log10(abs(data)));
	ndecimals = mag - precision; 

	if(ndecimals >= 0)
		ndecimals = 0;
	else
		ndecimals = abs(ndecimals);
	end


	formatString = '%.';

	%http://www.mathworks.com/help/matlab/ref/fprintf.html#inputarg_formatSpec
	formatString = [formatString num2str(ndecimals) 'f'];
	
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
%! d = load(fn)
%! roundVal = sigRound(testVal,1)
%! roundVal - d
%! assert(roundVal - d < eps)
%! end


%TO DEBUG THIS TEST, just drop semi-colons from testVal, d, roundVal, and fractionalError.
%!test
%! 'stress-testing printDecimal.m'
%! for roundCounter = 1:10000
%! fn = "printDecimalTest3.txt"; testVal = randn*10000;
%! precision = floor(10*rand)+1;
%! printDecimal(testVal,fn,precision);
%! d = load(fn);
%! roundVal = sigRound(testVal,precision);
%! fractionalError = (roundVal - d)/d;
%! assert((roundVal - d)/d < 100*eps);
%! end

