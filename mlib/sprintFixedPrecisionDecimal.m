%prints a TeXed fixed-precision decimal number to a string
%number of decimalPlaces counts after the decimal. 1 --> 0.1 , 2 --> 0.12 , etc.
%this function could be extended to fixed rounding modes with ease

function s = sprintFixedPrecisionDecimal( number , numberOfDecimalPlaces )

	assert( numberOfDecimalPlaces > 0 );

	scaleFactor = 10^numberOfDecimalPlaces;

	%rounding
	number = round( number * scaleFactor ) / scaleFactor;

	%print string
	s = sprintf( '$%.*f$%%' , numberOfDecimalPlaces , number);

endfunction

%!test assert( sprintFixedPrecisionDecimal( 1.234   , 2) == '$1.23$%'  )
%!test assert( sprintFixedPrecisionDecimal( 250.315 , 2) == '$250.32$%')
%!test assert( sprintFixedPrecisionDecimal( 250.    , 2) == '$250.00$%')
%!test assert( sprintFixedPrecisionDecimal( 1.2345  , 3) == '$1.235$%' )
