function printSIErr(num, err, errSigFigs, siNum, baseUnit, filename)

	s = sprintSIErr(num, err, errSigFigs, siNum, baseUnit);
	printString(s, filename);

end
