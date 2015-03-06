%values is a 1x4 rowvector of central value, statistical error, systematic error, overall error
%precision is the number of places after the decimal point
%prefix is the string prepended to each filename
function formattedErrorOutput( values , precision, prefix )

	printDecimal( values(1) , precision , [ prefix 'Central.tex'       ] );
	printDecimal( values(2) , precision , [ prefix 'Statistical.tex'   ] );
	printDecimal( values(3) , precision , [ prefix 'Systematic.tex'    ] );
	printDecimal( values(4) , precision , [ prefix 'AggregateError.tex'] );

endfunction
