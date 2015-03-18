%file-printing wrapper for sprintFixedPrecisionDecimal
%tests are in the sprint function

function printFixedPrecisionDecimal( number , numberOfDecimalPlaces, filename )

	s = sprintFixedPrecisionDecimal( number, numberOfDecimalPlaces);
	printString( s , filename);

end
