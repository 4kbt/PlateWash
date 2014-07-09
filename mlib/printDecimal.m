## usage: printDecimal(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of places after the decimal point

function printDecimal(data, filename, precision)

	s = sprintDecimal(data, precision);
	printString(s, filename);	
end

%These tests repeated for sprintDecimal.

%!test
%! fn = "testOutput/printDecimalTest1.txt"; testVal = 0.8;
%! printDecimal(testVal,fn,1)
%! d = load(fn);
%! assert(testVal == d)


%!test
%! for roundCounter = 1:100
%! fn = "testOutput/printDecimalTest2.txt"; testVal = randn*10;
%! printDecimal(testVal,fn,1)
%! d = load(fn);
%! roundVal = sigRound(testVal,1);
%! roundVal - d;
%! assert(roundVal - d < eps)
%! end


%TO DEBUG THIS TEST, just drop semi-colons from testVal, d, roundVal, and fractionalError.
%!test
%! 'stress-testing printDecimal.m'
%! for roundCounter = 1:10000
%! fn = "testOutput/printDecimalTest3.txt"; testVal = randn*10000;
%! precision = floor(10*rand)+1;
%! printDecimal(testVal,fn,precision);
%! d = load(fn);
%! roundVal = sigRound(testVal,precision);
%! fractionalError = (roundVal - d)/d;
%! assert((roundVal - d)/d < 100*eps);
%! end

