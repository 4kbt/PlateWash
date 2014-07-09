## usage: printSigError(central, err,  filename)
## prints data using fprintf into the specified file. Filename is a string.
## 

function printSigError(central, err, filename)

	s = sprintSigError(central,err);
	printString(s, filename);
end
