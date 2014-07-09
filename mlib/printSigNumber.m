## usage: printSigNumber(data, filename, precision)
## prints data using save --ascii into the specified file. Filename is a string.
## <precision> specifies the number of significant digits.

function printSigNumber(data, filename, precision)

	s = sprintSigNumber(data, precision);
	printString(s,filename);
end
