function printSI(num, SigFigs, siNum, baseUnit, filename)

	s = sprintSI(num, SigFigs, siNum, baseUnit);
	printString(s, filename);

end
