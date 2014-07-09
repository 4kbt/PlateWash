function printSI(num, err, errSigFigs, siNum, baseUnit, filename)

	s = sprintSI(num, err, errSigFigs, siNum, baseUnit)
	printString(s, filename);

end
